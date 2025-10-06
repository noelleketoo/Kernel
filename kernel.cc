#include "kernel.hh"
#include "k-apic.hh"
#include "k-vmiter.hh"
#include "obj/k-firstprocess.h"
#include <atomic>

// kernel.cc
//
//    This is the kernel.


// INITIAL PHYSICAL MEMORY LAYOUT
//
//  +-------------- Base Memory --------------+
//  v                                         v
// +-----+--------------------+----------------+--------------------+---------/
// |     | Kernel      Kernel |       :    I/O | App 1        App 1 | App 2
// |     | Code + Data  Stack |  ...  : Memory | Code + Data  Stack | Code ...
// +-----+--------------------+----------------+--------------------+---------/
// 0  0x40000              0x80000 0xA0000 0x100000             0x140000
//                                             ^
//                                             | \___ PROC_SIZE ___/
//                                      PROC_START_ADDR

#define PROC_SIZE 0x40000       // initial state only

proc ptable[PID_MAX];           // array of process descriptors
                                // Note that `ptable[0]` is never used.
proc* current;                  // pointer to currently executing proc

#define HZ 100                  // timer interrupt frequency (interrupts/sec)
static std::atomic<unsigned long> ticks; // # timer interrupts so far


// Memory state - see `kernel.hh`
physpageinfo physpages[NPAGES];


[[noreturn]] void schedule();
[[noreturn]] void run(proc* p);
void exception(regstate* regs);
uintptr_t syscall(regstate* regs);
void memshow();


// kernel_start(command)
//    Initialize the hardware and processes and start running. The `command`
//    string is an optional string passed from the boot loader.

static void process_setup(pid_t pid, const char* program_name);

void kernel_start(const char* command) {
    // initialize hardware
    init_hardware();
    log_printf("Starting WeensyOS\n");

    ticks = 1;
    init_timer(HZ);

    // clear screen
    console_clear();

    // (re-)initialize kernel page table
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
        int perm = PTE_P | PTE_W | PTE_U;
        if (addr == 0) {
            // nullptr is inaccessible even to the kernel
            perm = 0;
        } else if (addr < PROC_START_ADDR && addr != CONSOLE_ADDR){
            perm = PTE_P | PTE_W;
        } else {
            perm = PTE_P | PTE_W | PTE_U;
        }
        // install identity mapping
        int r = vmiter(kernel_pagetable, addr).try_map(addr, perm);
        assert(r == 0); // mappings during kernel_start MUST NOT fail
                        // (Note that later mappings might fail!!)
    }

    // set up process descriptors
    for (pid_t i = 0; i < PID_MAX; i++) {
        ptable[i].pid = i;
        ptable[i].state = P_FREE;
    }
    if (!command) {
        command = WEENSYOS_FIRST_PROCESS;
    }
    if (!program_image(command).empty()) {
        process_setup(1, command);
    } else {
        process_setup(1, "allocator");
        process_setup(2, "allocator2");
        process_setup(3, "allocator3");
        process_setup(4, "allocator4");
    }

    // switch to first process using run()
    run(&ptable[1]);
}


// kalloc(sz)
//    Kernel physical memory allocator. Allocates at least `sz` contiguous bytes
//    and returns a pointer to the allocated memory, or `nullptr` on failure.
//    The returned pointerâ€™s address is a valid physical address, but since the
//    WeensyOS kernel uses an identity mapping for virtual memory, it is also a
//    valid virtual address that the kernel can access or modify.
//
//    The allocator selects from physical pages that can be allocated for
//    process use (so not reserved pages or kernel data), and from physical
//    pages that are currently unused (`physpages[N].refcount == 0`).
//
//    On WeensyOS, `kalloc` is a page-based allocator: if `sz > PAGESIZE`
//    the allocation fails; if `sz < PAGESIZE` it allocates a whole page
//    anyway.
//
//    The returned memory is initially filled with 0xCC, which corresponds to
//    the `int3` instruction. Executing that instruction will cause a `PANIC:
//    Unhandled exception 3!` This may help you debug.

void* kalloc(size_t sz) {
    // failing allocation depending on size
    if (sz > PAGESIZE) {
        return nullptr;
    }

    int pageno = 0;
    int page_increment = 1;

    // looking for available page to allocate
    for (int tries = 0; tries != NPAGES; ++tries) {
        uintptr_t pa = pageno * PAGESIZE;
        if (allocatable_physical_address(pa)
            && physpages[pageno].refcount == 0) {
            ++physpages[pageno].refcount;
            memset((void*) pa, 0xCC, PAGESIZE);
            return (void*) pa;
        }
        pageno = (pageno + page_increment) % NPAGES;
    }

    return nullptr;
}


// kfree(kptr)
//    Free `kptr`, which must have been previously returned by `kalloc`.
//    If `kptr == nullptr` does nothing.

void kfree(void* kptr) {
    (void) kptr;

    if (kptr == nullptr) {
        return;
    }

    uintptr_t pa = (uintptr_t)kptr;
    assert(pa % PAGESIZE == 0);

    // calculating page number
    uintptr_t pageno = pa / PAGESIZE;

    if (physpages[pageno].refcount > 0) {
        --physpages[pageno].refcount;
    }
}


// process_setup(pid, program_name)
//    Load application program `program_name` as process number `pid`.
//    This loads the application's code and data into memory, sets its
//    %rip and %rsp, gives it a stack page, and marks it as runnable.

void copy_mappings(x86_64_pagetable* dst, x86_64_pagetable* src, uintptr_t MAX_ADDR) {
    vmiter srcit(src, 0);
    vmiter dstit(dst, 0);
    for (; srcit.va() < MAX_ADDR; srcit += PAGESIZE, dstit += PAGESIZE) {
        dstit.map(srcit.pa(), srcit.perm());
    }
}

void process_setup(pid_t pid, const char* program_name) {
    init_process(&ptable[pid], 0);

    // initialize process page table
    ptable[pid].pagetable = kalloc_pagetable();

    copy_mappings(ptable[pid].pagetable, kernel_pagetable, PROC_START_ADDR);

    // obtain reference to program image
    // (The program image models the process executable.)
    //program_image pgm(program_name);
    program_image pgm(program_name);
    // allocate and map process memory as specified in program image
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
        for (uintptr_t a = round_down(seg.va(), PAGESIZE);
             a < seg.va() + seg.size();
             a += PAGESIZE) {
                
            // allocating memory
            uintptr_t page = (uintptr_t) kalloc(PAGESIZE);
            assert(page != 0);

            // map memory
            int r = vmiter(ptable[pid].pagetable, a).try_map(page, PTE_P | PTE_W | PTE_U);
            assert(r == 0);
        }
    }

    // copy instructions and data from program image into process memory
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
        uintptr_t pa = vmiter(ptable[pid].pagetable, seg.va()).pa();
        memset((void*) pa, 0, seg.size());
        memcpy((void*) pa, seg.data(), seg.data_size());
    }
   
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
        size_t allocated = 0;
        for (uintptr_t a = round_down(seg.va(), PAGESIZE);
            a < seg.va() + seg.size();
            a += PAGESIZE) {
            
            // handling alignment
            size_t allocated_sz = PAGESIZE;
            if (allocated == 0) {
                allocated_sz = PAGESIZE - (seg.va() - a);
            }
            // so we dont copy excess data
            allocated_sz = min(seg.data_size() - allocated, allocated_sz);

            // copying data to page
            memset((void*) vmiter(ptable[pid].pagetable, a).pa(), 0, allocated_sz);
            memcpy((void*) vmiter(ptable[pid].pagetable, a).pa(), seg.data()+allocated, allocated_sz);
            allocated += allocated_sz;

            if (!seg.writable()) {
                // checking permissions
                vmiter vmi(ptable[pid].pagetable, a);
                int perm = vmi.perm();
                perm &= ~PTE_W;
                vmi.map(vmi.pa(), perm);
            }
        }
    }

    // marking entry
    ptable[pid].regs.reg_rip = pgm.entry();

    // initializing map and stack
    uintptr_t stack = (uintptr_t) kalloc(PAGESIZE);
    uintptr_t stack_addr = MEMSIZE_VIRTUAL - PAGESIZE;

    int r = vmiter(ptable[pid].pagetable, stack_addr).try_map(stack, PTE_P | PTE_W | PTE_U);
    assert(r == 0);

    // set stack pointer
    ptable[pid].regs.reg_rsp = stack_addr + PAGESIZE;
    ptable[pid].state = P_RUNNABLE;
}



// exception(regs)
//    Exception handler (for interrupts, traps, and faults).
//
//    The register values from exception time are stored in `regs`.
//    The processor responds to an exception by saving application state on
//    the kernel's stack, then jumping to kernel assembly code (in
//    k-exception.S). That code saves more registers on the kernel's stack,
//    then calls exception(). v 
//
//    Note that hardware interrupts are disabled when the kernel is running.

void exception(regstate* regs) {
    // Copy the saved registers into the `current` process descriptor.
    current->regs = *regs;
    regs = &current->regs;

    // It can be useful to log events using `log_printf`.
    // Events logged this way are stored in the host's `log.txt` file.
    /* log_printf("proc %d: exception %d at rip %p\n",
                current->pid, regs->reg_intno, regs->reg_rip); */

    // Show the current cursor location and memory state
    // (unless this is a kernel fault).
    console_show_cursor(cursorpos);
    if (regs->reg_intno != INT_PF || (regs->reg_errcode & PTE_U)) {
        memshow();
    }

    // If Control-C was typed, exit the virtual machine.
    check_keyboard();

    log_printf("2: inside kernel::exception(), going to run process %d %d\n", current->pid, current->state);

    // Actually handle the exception.
    switch (regs->reg_intno) {

    case INT_IRQ + IRQ_TIMER:
        ++ticks;
        lapicstate::get().ack();
        schedule();
        break;                  /* will not be reached */

    // extra credit: copy-on-write!
    case INT_PF: {
        // Analyze faulting address and access type.
        uintptr_t addr = rdcr2();
        const char* operation = regs->reg_errcode & PTE_W
                ? "write" : "read";
        const char* problem = regs->reg_errcode & PTE_P
                ? "protection problem" : "missing page";

        if (!(regs->reg_errcode & PTE_U)) {
            proc_panic(current, "Kernel page fault on %p (%s %s, rip=%p)!\n",
                       addr, operation, problem, regs->reg_rip);
        }
        error_printf(CPOS(24, 0), COLOR_ERROR,
                     "PAGE FAULT on %p (pid %d, %s %s, rip=%p)!\n",
                     addr, current->pid, operation, problem, regs->reg_rip);
        log_print_backtrace(current);
        current->state = P_FAULTED;

        // extra credit
        vmiter it(current->pagetable, addr);
        if (regs->reg_errcode & PTE_W && it.present() && it.user()) {
            uintptr_t pa = it.pa();
            auto i = pa / PAGESIZE;
            // seeing if page isn't writable
            if (!it.writable()) {
                // allocating new page
                void* new_page = kalloc(PAGESIZE);
                if (!new_page) {
                    current->state = P_FAULTED;
                    break;  
                }
                memcpy(new_page, (void*) pa, PAGESIZE);
                --physpages[i].refcount;
                // new page is writable
                it.map((uintptr_t) new_page, PTE_P | PTE_W | PTE_U);
            } else {
                // if page isn't writable, make it writable
                it.map(pa, it.perm() | PTE_W);
            }
            return;
        }
        break;
    }

    default:
        proc_panic(current, "Unhandled exception %d (rip=%p)!\n",
                   regs->reg_intno, regs->reg_rip);

    }


    log_printf("3: inside kernel::exception(), going to run process %d %d\n", current->pid, current->state);

    // Return to the current process (or run something else).
    if (current->state == P_RUNNABLE) {
       log_printf("4: inside kernel::exception(), going to run process %d %d\n", current->pid, current->state);

        run(current);
    } else {
        log_printf("5: inside kernel::exception(), going to run process %d %d\n", current->pid, current->state);

        schedule();
    }
}

int syscall_page_alloc(uintptr_t addr);
int syscall_fork();
void sys_exit(pid_t pid);
void free_everything(x86_64_pagetable* pt);
int sys_sleep(unsigned int sleep);
int sys_kill(pid_t target_pid);

// syscall(regs)
//    Handle a system call initiated by a `syscall` instruction.
//    The processâ€™s register values at system call time are accessible in
//    `regs`.
//
//    If this function returns with value `V`, then the user process will
//    resume with `V` stored in `%rax` (so the system call effectively
//    returns `V`). Alternately, the kernel can exit this function by
//    calling `schedule()`, perhaps after storing the eventual system call
//    return value in `current->regs.reg_rax`.
//
//    It is only valid to return from this function if
//    `current->state == P_RUNNABLE`.
//
//    Note that hardware interrupts are disabled when the kernel is running.

uintptr_t syscall(regstate* regs) {
    // Copy the saved registers into the `current` process descriptor.
    current->regs = *regs;
    regs = &current->regs;

    // It can be useful to log events using `log_printf`.
    // Events logged this way are stored in the host's `log.txt` file.
    /* log_printf("proc %d: syscall %d at rip %p\n",
                  current->pid, regs->reg_rax, regs->reg_rip); */

    // Show the current cursor location and memory state.
    console_show_cursor(cursorpos);
    memshow();

    // If Control-C was typed, exit the virtual machine.
    check_keyboard();

    // Actually handle the exception.
    switch (regs->reg_rax) {

    case SYSCALL_PANIC:
        user_panic(current);
        break; // will not be reached

    case SYSCALL_GETPID:
        return current->pid;
    
    case SYSCALL_YIELD:
        current->regs.reg_rax = 0;
        schedule();             // does not return

    case SYSCALL_PAGE_ALLOC:
        return syscall_page_alloc(current->regs.reg_rdi);
    
    case SYSCALL_FORK:
        return syscall_fork();
    
    case SYSCALL_EXIT:
        sys_exit(current->pid);
        schedule();
    
    case SYSCALL_SLEEP:
        return sys_sleep(current->regs.reg_rdi);

    case SYSCALL_KILL:
        return sys_kill(current->regs.reg_rdi);

    default:
        proc_panic(current, "Unhandled system call %ld (pid=%d, rip=%p)!\n",
                   regs->reg_rax, current->pid, regs->reg_rip);

    }

    panic("Should not get here!\n");
}

void free_everything(x86_64_pagetable* pagetable) {
    if (!pagetable) {
        return;
    }
    // freeing unmapped pages
    for (vmiter it(pagetable, 0); it.va() < MEMSIZE_VIRTUAL; it += PAGESIZE) {
        if (it.present() && it.user()) {
            uintptr_t pa = it.pa();
            if (pa!= CONSOLE_ADDR) {
                kfree((void*) pa);
            }
        }
    }
    // freeing pagetable pages
    for (ptiter it(pagetable); !it.done(); it.next()) {
        kfree(it.kptr());
    }
    kfree(pagetable);
}

void sys_exit(pid_t pid) {
    // calling helper function
    free_everything(ptable[pid].pagetable);
    ptable[pid].pagetable = nullptr;
    ptable[pid].state = P_FREE;
}


int syscall_fork() {
    pid_t child_pid = 0;

    // finding available slot
    for (pid_t i = 1; i < PID_MAX; i++) {
        if (ptable[i].state == P_FREE) {
            child_pid = i;
            break;
        }
    }

    if (child_pid == 0) {
        return -1;
    }

    // initialize child proc
    proc* child_proc = &ptable[child_pid];
    init_process(child_proc, 0);

    // allocating page table for child
    x86_64_pagetable* child_pagetable = kalloc_pagetable();
    if (!child_pagetable) {
        child_proc->state = P_FREE;
        return -1;
    }
    child_proc->pagetable = child_pagetable;

    ptable[child_pid].state = P_RUNNABLE;

    vmiter parent_iter(current->pagetable, 0);
    vmiter child_iter(ptable[child_pid].pagetable, parent_iter.va());

    for (; parent_iter.va() < MEMSIZE_VIRTUAL; parent_iter += PAGESIZE, child_iter += PAGESIZE) {
        if (parent_iter.writable() && parent_iter.user() && parent_iter.pa() != CONSOLE_ADDR) {
            
            // allocating physical page for child
            void* new_page = kalloc(PAGESIZE);
            if (!new_page) {
                ptable[child_pid].state = P_FREE;
                sys_exit(child_pid);
                return -1;
            }
            
            // copying parent's memory to child's
            memcpy(new_page, parent_iter.kptr(), PAGESIZE);

            // checking permissions
            int r = child_iter.try_map(new_page, parent_iter.perm()); 
            if (r != 0) {
                kfree(new_page); 
                sys_exit(child_pid); 
                return -1;
            }
        } else {
            // checking permissions
            if (parent_iter.user() && !parent_iter.writable()) {
                auto page_index = parent_iter.pa() / PAGESIZE;
                physpages[page_index].refcount++;
            }
            
            // map parents page to child's address
            if (child_iter.try_map(parent_iter.pa(), parent_iter.perm()) != 0) {
                sys_exit(child_pid);
                return -1;
            }
        }
    }

    ptable[child_pid].regs = current->regs;
    ptable[child_pid].regs.reg_rax = 0;  

    return child_pid;  
}

int sys_kill(pid_t target_pid) {
    if (ptable[target_pid].state = P_FREE) {
        return -1;
    }

    free_everything(ptable[target_pid].pagetable);

    ptable[target_pid].state = P_FREE;
    ptable[target_pid].pagetable = nullptr;
    return 0; 
}


int sys_sleep(unsigned int sleep) {
    // checking for sleep duration
    if (sleep == 0) {
        return -1;
    }
    // calculating wake up count
    current->sleeping_ticks = ticks + sleep;  
    // seeing if time is over
    while (ticks < ticks + sleep) {
        current->state = P_SLEEPING;  
        schedule();  
    }
    current->state = P_RUNNABLE;

    return 0;
}



// syscall_page_alloc(addr)
//    Handles the SYSCALL_PAGE_ALLOC system call. This function
//    should implement the specification for `sys_page_alloc`
//    in `u-lib.hh` (but in the handout code, it does not).

int syscall_page_alloc(uintptr_t addr) {
    // checking address to allocate
    if (addr == 0 || addr < PROC_START_ADDR || addr >= MEMSIZE_VIRTUAL){ 
        return -1;
    }
    
    // allocating a page
    void* heap_ptr = (void*) kalloc(PAGESIZE);
    if (!heap_ptr){
        return -1;
    }

    vmiter it(current->pagetable, addr);
    int r = it.try_map(heap_ptr, PTE_P | PTE_W | PTE_U);
    assert(r == 0);

    memset((void*) it.pa(), 0, PAGESIZE);
    return 0;
    
}


// schedule
//    Pick the next process to run and then run it.
//    If there are no runnable processes, spins forever.

void schedule() {
    pid_t pid = current->pid;
    for (unsigned spins = 1; true; ++spins) {
        pid = (pid + 1) % PID_MAX;
        if (ptable[pid].state == P_RUNNABLE) {
            run(&ptable[pid]);
        }

        // If Control-C was typed, exit the virtual machine.
        check_keyboard();

        // If spinning forever, show the memviewer.
        if (spins % (1 << 12) == 0) {
            memshow();
        }
    }
}


// run(p)
//    Run process `p`. This involves setting `current = p` and calling
//    `exception_return` to restore its page table and registers.

void run(proc* p) {
    assert(p->state == P_RUNNABLE);
    current = p;

    // Check the process's current registers.
    check_process_registers(p);

    // Check the process's current pagetable.
    check_pagetable(p->pagetable);

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(p);

    // should never get here
    while (true) {
    }
}


// memshow()
//    Draw a picture of memory (physical and virtual) on the CGA console.
//    Switches to a new process's virtual memory map every 0.25 sec.
//    Uses `console_memviewer()`, a function defined in `k-memviewer.cc`.

void memshow() {
    static unsigned last_ticks = 0;
    static int showing = 0;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2) {
        last_ticks = ticks;
        showing = (showing + 1) % PID_MAX;
    }

    proc* p = nullptr;
    for (int search = 0; !p && search < PID_MAX; ++search) {
        if (ptable[showing].state != P_FREE
            && ptable[showing].pagetable) {
            p = &ptable[showing];
        } else {
            showing = (showing + 1) % PID_MAX;
        }
    }

    console_memviewer(p);
    if (!p) {
        console_printf(CPOS(10, 26), 0x0F00, "   VIRTUAL ADDRESS SPACE\n"
            "                          [All processes have exited]\n"
            "\n\n\n\n\n\n\n\n\n\n\n");
    }
}

obj/p-exit.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000100000 <sys_exit()>:
    return make_syscall(SYSCALL_FORK);
}

// sys_exit()
//    Exit this process. Does not return.
[[noreturn]] inline void sys_exit() {
  100000:	f3 0f 1e fa          	endbr64
    register uintptr_t rax asm("rax") = syscallno;
  100004:	b8 06 00 00 00       	mov    $0x6,%eax
    asm volatile ("syscall"
  100009:	0f 05                	syscall
    register uintptr_t rax asm("rax") = syscallno;
  10000b:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  100010:	bf 20 11 10 00       	mov    $0x101120,%edi
  100015:	0f 05                	syscall
    make_syscall(SYSCALL_EXIT);
    make_syscall(SYSCALL_PANIC, (uintptr_t) "sys_exit should not return!");

    // should never get here
    while (true) {
  100017:	eb fe                	jmp    100017 <sys_exit()+0x17>

0000000000100019 <process_main()>:
volatile uint8_t* stack_bottom;

// Remember which pages we wrote data into
volatile uint8_t pagemark[4096] = {0};

void process_main() {
  100019:	f3 0f 1e fa          	endbr64
  10001d:	55                   	push   %rbp
  10001e:	48 89 e5             	mov    %rsp,%rbp
  100021:	41 57                	push   %r15
  100023:	41 56                	push   %r14
  100025:	41 55                	push   %r13
  100027:	41 54                	push   %r12
  100029:	53                   	push   %rbx
  10002a:	48 83 ec 08          	sub    $0x8,%rsp
    for (size_t i = 0; i != sizeof(pagemark); ++i) {
  10002e:	b8 00 00 00 00       	mov    $0x0,%eax
        assert(pagemark[i] == 0);
  100033:	0f b6 90 00 20 10 00 	movzbl 0x102000(%rax),%edx
  10003a:	84 d2                	test   %dl,%dl
  10003c:	75 0e                	jne    10004c <process_main()+0x33>
    for (size_t i = 0; i != sizeof(pagemark); ++i) {
  10003e:	48 83 c0 01          	add    $0x1,%rax
  100042:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
  100048:	75 e9                	jne    100033 <process_main()+0x1a>
  10004a:	eb 44                	jmp    100090 <process_main()+0x77>
        assert(pagemark[i] == 0);
  10004c:	b9 00 00 00 00       	mov    $0x0,%ecx
  100051:	ba 3c 11 10 00       	mov    $0x10113c,%edx
  100056:	be 10 00 00 00       	mov    $0x10,%esi
  10005b:	bf 4d 11 10 00       	mov    $0x10114d,%edi
  100060:	e8 3a 10 00 00       	call   10109f <assert_fail(char const*, int, char const*, char const*)>
    while (true) {
        int x = rand(0, ALLOC_SLOWDOWN);
        if (x == 0) {
            // fork, then either exit or start allocating
            pid_t p = sys_fork();
            assert(p < PID_MAX);
  100065:	b9 00 00 00 00       	mov    $0x0,%ecx
  10006a:	ba 57 11 10 00       	mov    $0x101157,%edx
  10006f:	be 18 00 00 00       	mov    $0x18,%esi
  100074:	bf 4d 11 10 00       	mov    $0x10114d,%edi
  100079:	e8 21 10 00 00       	call   10109f <assert_fail(char const*, int, char const*, char const*)>
            int choice = rand(0, 2);
            if (choice == 0 && p > 0) {
                sys_exit();
  10007e:	e8 7d ff ff ff       	call   100000 <sys_exit()>
            } else if (choice != 2 ? p > 0 : p == 0) {
  100083:	85 db                	test   %ebx,%ebx
  100085:	75 09                	jne    100090 <process_main()+0x77>
  100087:	eb 49                	jmp    1000d2 <process_main()+0xb9>
    register uintptr_t rax asm("rax") = syscallno;
  100089:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  10008e:	0f 05                	syscall
        int x = rand(0, ALLOC_SLOWDOWN);
  100090:	be 12 00 00 00       	mov    $0x12,%esi
  100095:	bf 00 00 00 00       	mov    $0x0,%edi
  10009a:	e8 f7 03 00 00       	call   100496 <rand(int, int)>
        if (x == 0) {
  10009f:	85 c0                	test   %eax,%eax
  1000a1:	75 e6                	jne    100089 <process_main()+0x70>
    register uintptr_t rax asm("rax") = syscallno;
  1000a3:	b8 05 00 00 00       	mov    $0x5,%eax
    asm volatile ("syscall"
  1000a8:	0f 05                	syscall
    return rax;
  1000aa:	48 89 c3             	mov    %rax,%rbx
            assert(p < PID_MAX);
  1000ad:	83 f8 0f             	cmp    $0xf,%eax
  1000b0:	7f b3                	jg     100065 <process_main()+0x4c>
            int choice = rand(0, 2);
  1000b2:	be 02 00 00 00       	mov    $0x2,%esi
  1000b7:	bf 00 00 00 00       	mov    $0x0,%edi
  1000bc:	e8 d5 03 00 00       	call   100496 <rand(int, int)>
            if (choice == 0 && p > 0) {
  1000c1:	85 c0                	test   %eax,%eax
  1000c3:	75 04                	jne    1000c9 <process_main()+0xb0>
  1000c5:	85 db                	test   %ebx,%ebx
  1000c7:	7f b5                	jg     10007e <process_main()+0x65>
            } else if (choice != 2 ? p > 0 : p == 0) {
  1000c9:	83 f8 02             	cmp    $0x2,%eax
  1000cc:	74 b5                	je     100083 <process_main()+0x6a>
  1000ce:	85 db                	test   %ebx,%ebx
  1000d0:	7e be                	jle    100090 <process_main()+0x77>
        } else {
            sys_yield();
        }
    }

    int speed = rand(1, 16);
  1000d2:	be 10 00 00 00       	mov    $0x10,%esi
  1000d7:	bf 01 00 00 00       	mov    $0x1,%edi
  1000dc:	e8 b5 03 00 00       	call   100496 <rand(int, int)>
  1000e1:	89 c3                	mov    %eax,%ebx
    register uintptr_t rax asm("rax") = syscallno;
  1000e3:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  1000e8:	0f 05                	syscall
    return make_syscall(SYSCALL_GETPID);
  1000ea:	41 89 c5             	mov    %eax,%r13d
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  1000ed:	41 bc 1b 40 10 00    	mov    $0x10401b,%r12d
    pid_t self = sys_getpid();

    uint8_t* heap_bottom = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  1000f3:	49 81 e4 00 f0 ff ff 	and    $0xfffffffffffff000,%r12
    heap_top = heap_bottom;
  1000fa:	4c 89 25 07 2f 00 00 	mov    %r12,0x2f07(%rip)        # 103008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  100101:	48 89 e0             	mov    %rsp,%rax
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  100104:	48 83 e8 01          	sub    $0x1,%rax
  100108:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  10010e:	48 89 05 eb 2e 00 00 	mov    %rax,0x2eeb(%rip)        # 103000 <stack_bottom>
    unsigned nalloc = 0;

    // Allocate heap pages until out of address space,
    // forking along the way.
    while (heap_top != stack_bottom) {
  100115:	4c 39 e0             	cmp    %r12,%rax
  100118:	0f 84 59 02 00 00    	je     100377 <process_main()+0x35e>
    unsigned nalloc = 0;
  10011e:	41 be 00 00 00 00    	mov    $0x0,%r14d
  100124:	eb 34                	jmp    10015a <process_main()+0x141>
        if (x >= 8 * speed) {
            if (x % 4 < 2 && heap_top != heap_bottom) {
                unsigned pn = rand(0, (heap_top - heap_bottom - 1) / PAGESIZE);
                if (pn < sizeof(pagemark)) {
                    volatile uint8_t* addr = heap_bottom + pn * PAGESIZE;
                    assert(*addr == pagemark[pn]);
  100126:	b9 00 00 00 00       	mov    $0x0,%ecx
  10012b:	ba 63 11 10 00       	mov    $0x101163,%edx
  100130:	be 35 00 00 00       	mov    $0x35,%esi
  100135:	bf 4d 11 10 00       	mov    $0x10114d,%edi
  10013a:	e8 60 0f 00 00       	call   10109f <assert_fail(char const*, int, char const*, char const*)>
    register uintptr_t rax asm("rax") = syscallno;
  10013f:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  100144:	0f 05                	syscall
    while (heap_top != stack_bottom) {
  100146:	48 8b 05 b3 2e 00 00 	mov    0x2eb3(%rip),%rax        # 103000 <stack_bottom>
  10014d:	48 39 05 b4 2e 00 00 	cmp    %rax,0x2eb4(%rip)        # 103008 <heap_top>
  100154:	0f 84 1d 02 00 00    	je     100377 <process_main()+0x35e>
        int x = rand(0, 6 * ALLOC_SLOWDOWN);
  10015a:	be 6c 00 00 00       	mov    $0x6c,%esi
  10015f:	bf 00 00 00 00       	mov    $0x0,%edi
  100164:	e8 2d 03 00 00       	call   100496 <rand(int, int)>
        if (x >= 8 * speed) {
  100169:	8d 14 dd 00 00 00 00 	lea    0x0(,%rbx,8),%edx
  100170:	39 c2                	cmp    %eax,%edx
  100172:	0f 8f 8b 00 00 00    	jg     100203 <process_main()+0x1ea>
            if (x % 4 < 2 && heap_top != heap_bottom) {
  100178:	99                   	cltd
  100179:	c1 ea 1e             	shr    $0x1e,%edx
  10017c:	01 d0                	add    %edx,%eax
  10017e:	83 e0 03             	and    $0x3,%eax
  100181:	29 d0                	sub    %edx,%eax
  100183:	83 f8 01             	cmp    $0x1,%eax
  100186:	7f b7                	jg     10013f <process_main()+0x126>
  100188:	48 8b 05 79 2e 00 00 	mov    0x2e79(%rip),%rax        # 103008 <heap_top>
  10018f:	4c 39 e0             	cmp    %r12,%rax
  100192:	74 ab                	je     10013f <process_main()+0x126>
                unsigned pn = rand(0, (heap_top - heap_bottom - 1) / PAGESIZE);
  100194:	4c 29 e0             	sub    %r12,%rax
  100197:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  10019b:	48 c1 ee 0c          	shr    $0xc,%rsi
  10019f:	bf 00 00 00 00       	mov    $0x0,%edi
  1001a4:	e8 ed 02 00 00       	call   100496 <rand(int, int)>
                if (pn < sizeof(pagemark)) {
  1001a9:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  1001ae:	77 8f                	ja     10013f <process_main()+0x126>
                    volatile uint8_t* addr = heap_bottom + pn * PAGESIZE;
  1001b0:	89 c1                	mov    %eax,%ecx
  1001b2:	48 89 ca             	mov    %rcx,%rdx
  1001b5:	48 c1 e2 0c          	shl    $0xc,%rdx
  1001b9:	4c 01 e2             	add    %r12,%rdx
                    assert(*addr == pagemark[pn]);
  1001bc:	0f b6 32             	movzbl (%rdx),%esi
  1001bf:	0f b6 89 00 20 10 00 	movzbl 0x102000(%rcx),%ecx
  1001c6:	40 38 ce             	cmp    %cl,%sil
  1001c9:	0f 85 57 ff ff ff    	jne    100126 <process_main()+0x10d>
                    pagemark[pn] = self;
  1001cf:	89 c0                	mov    %eax,%eax
  1001d1:	44 88 a8 00 20 10 00 	mov    %r13b,0x102000(%rax)
                    *addr = self;
  1001d8:	44 88 2a             	mov    %r13b,(%rdx)
                    assert(*addr == self);
  1001db:	0f b6 02             	movzbl (%rdx),%eax
  1001de:	0f b6 c0             	movzbl %al,%eax
  1001e1:	44 39 e8             	cmp    %r13d,%eax
  1001e4:	0f 84 55 ff ff ff    	je     10013f <process_main()+0x126>
  1001ea:	b9 00 00 00 00       	mov    $0x0,%ecx
  1001ef:	ba 79 11 10 00       	mov    $0x101179,%edx
  1001f4:	be 38 00 00 00       	mov    $0x38,%esi
  1001f9:	bf 4d 11 10 00       	mov    $0x10114d,%edi
  1001fe:	e8 9c 0e 00 00       	call   10109f <assert_fail(char const*, int, char const*, char const*)>
            }
            sys_yield();
            continue;
        }

        x = rand(0, 7 + min(nalloc / 4, 10U));
  100203:	44 89 f6             	mov    %r14d,%esi
  100206:	c1 ee 02             	shr    $0x2,%esi
    return a < b ? a : b;
  100209:	b8 0a 00 00 00       	mov    $0xa,%eax
  10020e:	39 c6                	cmp    %eax,%esi
  100210:	0f 47 f0             	cmova  %eax,%esi
  100213:	83 c6 07             	add    $0x7,%esi
  100216:	bf 00 00 00 00       	mov    $0x0,%edi
  10021b:	e8 76 02 00 00       	call   100496 <rand(int, int)>
        if (x < 2) {
  100220:	83 f8 01             	cmp    $0x1,%eax
  100223:	7e 32                	jle    100257 <process_main()+0x23e>
                pid_t new_self = sys_getpid();
                assert(new_self != self);
                self = new_self;
                speed = rand(1, 16);
            }
        } else if (x < 3) {
  100225:	83 f8 02             	cmp    $0x2,%eax
  100228:	0f 8e 97 00 00 00    	jle    1002c5 <process_main()+0x2ac>
    register uintptr_t rax asm("rax") = syscallno;
  10022e:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  100233:	48 8b 3d ce 2d 00 00 	mov    0x2dce(%rip),%rdi        # 103008 <heap_top>
  10023a:	0f 05                	syscall
            sys_exit();
        } else if (sys_page_alloc((void*) heap_top) >= 0) {
  10023c:	85 c0                	test   %eax,%eax
  10023e:	0f 89 86 00 00 00    	jns    1002ca <process_main()+0x2b1>
            nalloc = (heap_top - heap_bottom) / PAGESIZE;
            // clear "Out of physical memory" msg
            if (console[CPOS(24, 0)]) {
                console_printf(CPOS(24, 0), 0, "\n");
            }
        } else if (nalloc < 4) {
  100244:	41 83 fe 03          	cmp    $0x3,%r14d
  100248:	0f 86 24 01 00 00    	jbe    100372 <process_main()+0x359>
            sys_exit();
        } else {
            nalloc -= 4;
  10024e:	41 83 ee 04          	sub    $0x4,%r14d
  100252:	e9 ef fe ff ff       	jmp    100146 <process_main()+0x12d>
    register uintptr_t rax asm("rax") = syscallno;
  100257:	b8 05 00 00 00       	mov    $0x5,%eax
    asm volatile ("syscall"
  10025c:	0f 05                	syscall
            assert(p < PID_MAX);
  10025e:	83 f8 0f             	cmp    $0xf,%eax
  100261:	7f 30                	jg     100293 <process_main()+0x27a>
            if (p == 0) {
  100263:	85 c0                	test   %eax,%eax
  100265:	0f 85 db fe ff ff    	jne    100146 <process_main()+0x12d>
    register uintptr_t rax asm("rax") = syscallno;
  10026b:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  100270:	0f 05                	syscall
    return rax;
  100272:	49 89 c7             	mov    %rax,%r15
                assert(new_self != self);
  100275:	44 39 e8             	cmp    %r13d,%eax
  100278:	74 32                	je     1002ac <process_main()+0x293>
                speed = rand(1, 16);
  10027a:	be 10 00 00 00       	mov    $0x10,%esi
  10027f:	bf 01 00 00 00       	mov    $0x1,%edi
  100284:	e8 0d 02 00 00       	call   100496 <rand(int, int)>
  100289:	89 c3                	mov    %eax,%ebx
                self = new_self;
  10028b:	45 89 fd             	mov    %r15d,%r13d
  10028e:	e9 b3 fe ff ff       	jmp    100146 <process_main()+0x12d>
            assert(p < PID_MAX);
  100293:	b9 00 00 00 00       	mov    $0x0,%ecx
  100298:	ba 57 11 10 00       	mov    $0x101157,%edx
  10029d:	be 42 00 00 00       	mov    $0x42,%esi
  1002a2:	bf 4d 11 10 00       	mov    $0x10114d,%edi
  1002a7:	e8 f3 0d 00 00       	call   10109f <assert_fail(char const*, int, char const*, char const*)>
                assert(new_self != self);
  1002ac:	b9 00 00 00 00       	mov    $0x0,%ecx
  1002b1:	ba 87 11 10 00       	mov    $0x101187,%edx
  1002b6:	be 45 00 00 00       	mov    $0x45,%esi
  1002bb:	bf 4d 11 10 00       	mov    $0x10114d,%edi
  1002c0:	e8 da 0d 00 00       	call   10109f <assert_fail(char const*, int, char const*, char const*)>
            sys_exit();
  1002c5:	e8 36 fd ff ff       	call   100000 <sys_exit()>
            for (unsigned long* l = (unsigned long*) heap_top;
  1002ca:	48 8b 0d 37 2d 00 00 	mov    0x2d37(%rip),%rcx        # 103008 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1002d1:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  1002d8:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  1002db:	48 83 38 00          	cmpq   $0x0,(%rax)
  1002df:	75 78                	jne    100359 <process_main()+0x340>
            for (unsigned long* l = (unsigned long*) heap_top;
  1002e1:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1002e5:	48 39 d0             	cmp    %rdx,%rax
  1002e8:	75 f1                	jne    1002db <process_main()+0x2c2>
            *heap_top = speed;
  1002ea:	88 19                	mov    %bl,(%rcx)
            console[CPOS(24, 79)] = speed;
  1002ec:	66 89 1d ab 8c fb ff 	mov    %bx,-0x47355(%rip)        # b8f9e <console+0xf9e>
            unsigned pn = (heap_top - heap_bottom) / PAGESIZE;
  1002f3:	48 8b 05 0e 2d 00 00 	mov    0x2d0e(%rip),%rax        # 103008 <heap_top>
  1002fa:	48 89 c2             	mov    %rax,%rdx
  1002fd:	4c 29 e2             	sub    %r12,%rdx
  100300:	48 c1 ea 0c          	shr    $0xc,%rdx
            if (pn < sizeof(pagemark)) {
  100304:	81 fa ff 0f 00 00    	cmp    $0xfff,%edx
  10030a:	77 08                	ja     100314 <process_main()+0x2fb>
                pagemark[pn] = speed;
  10030c:	89 d2                	mov    %edx,%edx
  10030e:	88 9a 00 20 10 00    	mov    %bl,0x102000(%rdx)
            heap_top += PAGESIZE;
  100314:	48 05 00 10 00 00    	add    $0x1000,%rax
  10031a:	48 89 05 e7 2c 00 00 	mov    %rax,0x2ce7(%rip)        # 103008 <heap_top>
            nalloc = (heap_top - heap_bottom) / PAGESIZE;
  100321:	4c 29 e0             	sub    %r12,%rax
  100324:	49 89 c6             	mov    %rax,%r14
  100327:	49 c1 ee 0c          	shr    $0xc,%r14
            if (console[CPOS(24, 0)]) {
  10032b:	0f b7 05 ce 8b fb ff 	movzwl -0x47432(%rip),%eax        # b8f00 <console+0xf00>
  100332:	66 85 c0             	test   %ax,%ax
  100335:	0f 84 0b fe ff ff    	je     100146 <process_main()+0x12d>
                console_printf(CPOS(24, 0), 0, "\n");
  10033b:	ba a0 11 10 00       	mov    $0x1011a0,%edx
  100340:	be 00 00 00 00       	mov    $0x0,%esi
  100345:	bf 80 07 00 00       	mov    $0x780,%edi
  10034a:	b8 00 00 00 00       	mov    $0x0,%eax
  10034f:	e8 11 0d 00 00       	call   101065 <console_printf(int, int, char const*, ...)>
  100354:	e9 ed fd ff ff       	jmp    100146 <process_main()+0x12d>
                assert(*l == 0);
  100359:	b9 00 00 00 00       	mov    $0x0,%ecx
  10035e:	ba 98 11 10 00       	mov    $0x101198,%edx
  100363:	be 50 00 00 00       	mov    $0x50,%esi
  100368:	bf 4d 11 10 00       	mov    $0x10114d,%edi
  10036d:	e8 2d 0d 00 00       	call   10109f <assert_fail(char const*, int, char const*, char const*)>
            sys_exit();
  100372:	e8 89 fc ff ff       	call   100000 <sys_exit()>
        }
    }

    // After running out of memory
    while (true) {
        if (rand(0, 2 * ALLOC_SLOWDOWN - 1) == 0) {
  100377:	be 23 00 00 00       	mov    $0x23,%esi
  10037c:	bf 00 00 00 00       	mov    $0x0,%edi
  100381:	e8 10 01 00 00       	call   100496 <rand(int, int)>
  100386:	85 c0                	test   %eax,%eax
  100388:	74 09                	je     100393 <process_main()+0x37a>
    register uintptr_t rax asm("rax") = syscallno;
  10038a:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  10038f:	0f 05                	syscall
}
  100391:	eb e4                	jmp    100377 <process_main()+0x35e>
            sys_exit();
  100393:	e8 68 fc ff ff       	call   100000 <sys_exit()>

0000000000100398 <string_printer::putc(unsigned char)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c) override {
  100398:	f3 0f 1e fa          	endbr64
        if (s_ < end_) {
  10039c:	48 8b 47 10          	mov    0x10(%rdi),%rax
  1003a0:	48 3b 47 18          	cmp    0x18(%rdi),%rax
  1003a4:	73 0b                	jae    1003b1 <string_printer::putc(unsigned char)+0x19>
            *s_++ = c;
  1003a6:	48 8d 50 01          	lea    0x1(%rax),%rdx
  1003aa:	48 89 57 10          	mov    %rdx,0x10(%rdi)
  1003ae:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  1003b1:	48 83 47 20 01       	addq   $0x1,0x20(%rdi)
    }
  1003b6:	c3                   	ret

00000000001003b7 <strlen>:
size_t strlen(const char* s) {
  1003b7:	f3 0f 1e fa          	endbr64
    for (n = 0; *s != '\0'; ++s) {
  1003bb:	80 3f 00             	cmpb   $0x0,(%rdi)
  1003be:	74 10                	je     1003d0 <strlen+0x19>
  1003c0:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  1003c5:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  1003c9:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  1003cd:	75 f6                	jne    1003c5 <strlen+0xe>
  1003cf:	c3                   	ret
  1003d0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1003d5:	c3                   	ret

00000000001003d6 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  1003d6:	f3 0f 1e fa          	endbr64
  1003da:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1003dd:	ba 00 00 00 00       	mov    $0x0,%edx
  1003e2:	48 85 f6             	test   %rsi,%rsi
  1003e5:	74 10                	je     1003f7 <strnlen+0x21>
  1003e7:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  1003eb:	74 0b                	je     1003f8 <strnlen+0x22>
        ++n;
  1003ed:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1003f1:	48 39 d0             	cmp    %rdx,%rax
  1003f4:	75 f1                	jne    1003e7 <strnlen+0x11>
  1003f6:	c3                   	ret
  1003f7:	c3                   	ret
  1003f8:	48 89 d0             	mov    %rdx,%rax
}
  1003fb:	c3                   	ret

00000000001003fc <strchr>:
char* strchr(const char* s, int c) {
  1003fc:	f3 0f 1e fa          	endbr64
    while (*s != '\0' && *s != (char) c) {
  100400:	0f b6 07             	movzbl (%rdi),%eax
  100403:	84 c0                	test   %al,%al
  100405:	74 10                	je     100417 <strchr+0x1b>
  100407:	40 38 f0             	cmp    %sil,%al
  10040a:	74 18                	je     100424 <strchr+0x28>
        ++s;
  10040c:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  100410:	0f b6 07             	movzbl (%rdi),%eax
  100413:	84 c0                	test   %al,%al
  100415:	75 f0                	jne    100407 <strchr+0xb>
        return (char*) s;
  100417:	40 84 f6             	test   %sil,%sil
  10041a:	b8 00 00 00 00       	mov    $0x0,%eax
  10041f:	48 0f 44 c7          	cmove  %rdi,%rax
}
  100423:	c3                   	ret
        return (char*) s;
  100424:	48 89 f8             	mov    %rdi,%rax
  100427:	c3                   	ret

0000000000100428 <srand(unsigned int)>:
void srand(unsigned seed) {
  100428:	f3 0f 1e fa          	endbr64
    rand_seed = ((unsigned long) seed << 32) | seed;
  10042c:	89 f8                	mov    %edi,%eax
  10042e:	48 c1 e7 20          	shl    $0x20,%rdi
  100432:	48 01 c7             	add    %rax,%rdi
	  = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_acquire);
	__glibcxx_assert(__b != memory_order_acq_rel);
	__glibcxx_assert(__b != memory_order_consume);

	__atomic_store_n(&_M_i, __i, int(__m));
  100435:	48 87 3d d4 2b 00 00 	xchg   %rdi,0x2bd4(%rip)        # 103010 <rand_seed>
  10043c:	b8 01 00 00 00       	mov    $0x1,%eax
  100441:	87 05 d1 2b 00 00    	xchg   %eax,0x2bd1(%rip)        # 103018 <rand_seed_set>
}
  100447:	c3                   	ret

0000000000100448 <rand()>:
int rand() {
  100448:	f3 0f 1e fa          	endbr64
  10044c:	55                   	push   %rbp
  10044d:	48 89 e5             	mov    %rsp,%rbp
	memory_order __b __attribute__ ((__unused__))
	  = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_release);
	__glibcxx_assert(__b != memory_order_acq_rel);

	return __atomic_load_n(&_M_i, int(__m));
  100450:	8b 05 c2 2b 00 00    	mov    0x2bc2(%rip),%eax        # 103018 <rand_seed_set>
    if (!rand_seed_set) {
  100456:	85 c0                	test   %eax,%eax
  100458:	74 30                	je     10048a <rand()+0x42>
  10045a:	48 8b 05 af 2b 00 00 	mov    0x2baf(%rip),%rax        # 103010 <rand_seed>
        next_rs = rs * 6364136223846793005UL + 1;
  100461:	48 b9 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rcx
  100468:	f4 51 58 
  10046b:	48 89 c2             	mov    %rax,%rdx
  10046e:	48 0f af d1          	imul   %rcx,%rdx
  100472:	48 83 c2 01          	add    $0x1,%rdx
      compare_exchange_weak(__int_type& __i1, __int_type __i2,
			    memory_order __m1, memory_order __m2) noexcept
      {
	__glibcxx_assert(__is_valid_cmpexch_failure_order(__m2));

	return __atomic_compare_exchange_n(&_M_i, &__i1, __i2, 1,
  100476:	f0 48 0f b1 15 91 2b 	lock cmpxchg %rdx,0x2b91(%rip)        # 103010 <rand_seed>
  10047d:	00 00 
    } while (!rand_seed.compare_exchange_weak(rs, next_rs));
  10047f:	75 ea                	jne    10046b <rand()+0x23>
    return (next_rs >> 33) & RAND_MAX;
  100481:	48 c1 ea 21          	shr    $0x21,%rdx
  100485:	48 89 d0             	mov    %rdx,%rax
}
  100488:	5d                   	pop    %rbp
  100489:	c3                   	ret
        srand(819234718U);
  10048a:	bf 9e 87 d4 30       	mov    $0x30d4879e,%edi
  10048f:	e8 94 ff ff ff       	call   100428 <srand(unsigned int)>
  100494:	eb c4                	jmp    10045a <rand()+0x12>

0000000000100496 <rand(int, int)>:
int rand(int min, int max) {
  100496:	f3 0f 1e fa          	endbr64
  10049a:	55                   	push   %rbp
  10049b:	48 89 e5             	mov    %rsp,%rbp
  10049e:	41 55                	push   %r13
  1004a0:	41 54                	push   %r12
  1004a2:	53                   	push   %rbx
  1004a3:	48 83 ec 08          	sub    $0x8,%rsp
    assert(min <= max);
  1004a7:	39 f7                	cmp    %esi,%edi
  1004a9:	7f 42                	jg     1004ed <rand(int, int)+0x57>
  1004ab:	41 89 fc             	mov    %edi,%r12d
  1004ae:	89 f3                	mov    %esi,%ebx
    unsigned div = (unsigned(RAND_MAX) + 1) / (max - min + 1),
  1004b0:	29 fb                	sub    %edi,%ebx
  1004b2:	83 c3 01             	add    $0x1,%ebx
  1004b5:	b8 00 00 00 80       	mov    $0x80000000,%eax
  1004ba:	ba 00 00 00 00       	mov    $0x0,%edx
  1004bf:	f7 f3                	div    %ebx
  1004c1:	41 89 c5             	mov    %eax,%r13d
        top = div * (max - min + 1);
  1004c4:	0f af d8             	imul   %eax,%ebx
    assert(top > 0 && top <= unsigned(RAND_MAX) + 1);
  1004c7:	89 d8                	mov    %ebx,%eax
  1004c9:	83 e8 01             	sub    $0x1,%eax
  1004cc:	78 38                	js     100506 <rand(int, int)+0x70>
        unsigned r = rand();
  1004ce:	e8 75 ff ff ff       	call   100448 <rand()>
        if (r < top) {
  1004d3:	39 d8                	cmp    %ebx,%eax
  1004d5:	73 f7                	jae    1004ce <rand(int, int)+0x38>
            return min + r / div;
  1004d7:	ba 00 00 00 00       	mov    $0x0,%edx
  1004dc:	41 f7 f5             	div    %r13d
  1004df:	44 01 e0             	add    %r12d,%eax
}
  1004e2:	48 83 c4 08          	add    $0x8,%rsp
  1004e6:	5b                   	pop    %rbx
  1004e7:	41 5c                	pop    %r12
  1004e9:	41 5d                	pop    %r13
  1004eb:	5d                   	pop    %rbp
  1004ec:	c3                   	ret
    assert(min <= max);
  1004ed:	b9 00 00 00 00       	mov    $0x0,%ecx
  1004f2:	ba a2 11 10 00       	mov    $0x1011a2,%edx
  1004f7:	be 49 01 00 00       	mov    $0x149,%esi
  1004fc:	bf ad 11 10 00       	mov    $0x1011ad,%edi
  100501:	e8 99 0b 00 00       	call   10109f <assert_fail(char const*, int, char const*, char const*)>
    assert(top > 0 && top <= unsigned(RAND_MAX) + 1);
  100506:	b9 00 00 00 00       	mov    $0x0,%ecx
  10050b:	ba e0 11 10 00       	mov    $0x1011e0,%edx
  100510:	be 4e 01 00 00       	mov    $0x14e,%esi
  100515:	bf ad 11 10 00       	mov    $0x1011ad,%edi
  10051a:	e8 80 0b 00 00       	call   10109f <assert_fail(char const*, int, char const*, char const*)>
  10051f:	90                   	nop

0000000000100520 <printer::vprintf(char const*, __va_list_tag*)>:
void printer::vprintf(const char* format, va_list val) {
  100520:	f3 0f 1e fa          	endbr64
  100524:	55                   	push   %rbp
  100525:	48 89 e5             	mov    %rsp,%rbp
  100528:	41 57                	push   %r15
  10052a:	41 56                	push   %r14
  10052c:	41 55                	push   %r13
  10052e:	41 54                	push   %r12
  100530:	53                   	push   %rbx
  100531:	48 83 ec 48          	sub    $0x48,%rsp
  100535:	49 89 ff             	mov    %rdi,%r15
  100538:	49 89 f4             	mov    %rsi,%r12
  10053b:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
    for (; *format; ++format) {
  10053f:	0f b6 06             	movzbl (%rsi),%eax
  100542:	84 c0                	test   %al,%al
  100544:	0f 85 94 05 00 00    	jne    100ade <printer::vprintf(char const*, __va_list_tag*)+0x5be>
}
  10054a:	48 83 c4 48          	add    $0x48,%rsp
  10054e:	5b                   	pop    %rbx
  10054f:	41 5c                	pop    %r12
  100551:	41 5d                	pop    %r13
  100553:	41 5e                	pop    %r14
  100555:	41 5f                	pop    %r15
  100557:	5d                   	pop    %rbp
  100558:	c3                   	ret
        for (++format; *format; ++format) {
  100559:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  10055e:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
  100564:	45 84 e4             	test   %r12b,%r12b
  100567:	0f 84 01 01 00 00    	je     10066e <printer::vprintf(char const*, __va_list_tag*)+0x14e>
        int flags = 0;
  10056d:	41 be 00 00 00 00    	mov    $0x0,%r14d
            const char* flagc = strchr(flag_chars, *format);
  100573:	41 0f be f4          	movsbl %r12b,%esi
  100577:	bf 81 19 10 00       	mov    $0x101981,%edi
  10057c:	e8 7b fe ff ff       	call   1003fc <strchr>
  100581:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  100584:	48 85 c0             	test   %rax,%rax
  100587:	74 70                	je     1005f9 <printer::vprintf(char const*, __va_list_tag*)+0xd9>
                flags |= 1 << (flagc - flag_chars);
  100589:	48 81 e9 81 19 10 00 	sub    $0x101981,%rcx
  100590:	b8 01 00 00 00       	mov    $0x1,%eax
  100595:	d3 e0                	shl    %cl,%eax
  100597:	41 09 c6             	or     %eax,%r14d
        for (++format; *format; ++format) {
  10059a:	48 83 c3 01          	add    $0x1,%rbx
  10059e:	44 0f b6 23          	movzbl (%rbx),%r12d
  1005a2:	45 84 e4             	test   %r12b,%r12b
  1005a5:	75 cc                	jne    100573 <printer::vprintf(char const*, __va_list_tag*)+0x53>
        int width = -1;
  1005a7:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
  1005ad:	c7 45 a4 ff ff ff ff 	movl   $0xffffffff,-0x5c(%rbp)
        if (*format == '.') {
  1005b4:	80 3b 2e             	cmpb   $0x2e,(%rbx)
  1005b7:	0f 84 d8 00 00 00    	je     100695 <printer::vprintf(char const*, __va_list_tag*)+0x175>
        switch (*format) {
  1005bd:	0f b6 03             	movzbl (%rbx),%eax
  1005c0:	3c 6c                	cmp    $0x6c,%al
  1005c2:	0f 84 73 01 00 00    	je     10073b <printer::vprintf(char const*, __va_list_tag*)+0x21b>
  1005c8:	0f 8f 4e 01 00 00    	jg     10071c <printer::vprintf(char const*, __va_list_tag*)+0x1fc>
  1005ce:	3c 68                	cmp    $0x68,%al
  1005d0:	0f 85 88 01 00 00    	jne    10075e <printer::vprintf(char const*, __va_list_tag*)+0x23e>
            ++format;
  1005d6:	48 8d 43 01          	lea    0x1(%rbx),%rax
  1005da:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  1005de:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1005e2:	8d 50 bd             	lea    -0x43(%rax),%edx
  1005e5:	80 fa 35             	cmp    $0x35,%dl
  1005e8:	0f 87 a6 05 00 00    	ja     100b94 <printer::vprintf(char const*, __va_list_tag*)+0x674>
  1005ee:	0f b6 d2             	movzbl %dl,%edx
  1005f1:	3e ff 24 d5 90 12 10 	notrack jmp *0x101290(,%rdx,8)
  1005f8:	00 
        if (*format >= '1' && *format <= '9') {
  1005f9:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
  1005fe:	3c 08                	cmp    $0x8,%al
  100600:	77 32                	ja     100634 <printer::vprintf(char const*, __va_list_tag*)+0x114>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100602:	0f b6 03             	movzbl (%rbx),%eax
  100605:	8d 50 d0             	lea    -0x30(%rax),%edx
  100608:	80 fa 09             	cmp    $0x9,%dl
  10060b:	77 72                	ja     10067f <printer::vprintf(char const*, __va_list_tag*)+0x15f>
  10060d:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
  100613:	48 83 c3 01          	add    $0x1,%rbx
  100617:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
  10061c:	0f be c0             	movsbl %al,%eax
  10061f:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100624:	0f b6 03             	movzbl (%rbx),%eax
  100627:	8d 50 d0             	lea    -0x30(%rax),%edx
  10062a:	80 fa 09             	cmp    $0x9,%dl
  10062d:	76 e4                	jbe    100613 <printer::vprintf(char const*, __va_list_tag*)+0xf3>
  10062f:	e9 79 ff ff ff       	jmp    1005ad <printer::vprintf(char const*, __va_list_tag*)+0x8d>
        } else if (*format == '*') {
  100634:	41 80 fc 2a          	cmp    $0x2a,%r12b
  100638:	75 50                	jne    10068a <printer::vprintf(char const*, __va_list_tag*)+0x16a>
            width = va_arg(val, int);
  10063a:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  10063e:	8b 01                	mov    (%rcx),%eax
  100640:	83 f8 2f             	cmp    $0x2f,%eax
  100643:	77 17                	ja     10065c <printer::vprintf(char const*, __va_list_tag*)+0x13c>
  100645:	89 c2                	mov    %eax,%edx
  100647:	48 03 51 10          	add    0x10(%rcx),%rdx
  10064b:	83 c0 08             	add    $0x8,%eax
  10064e:	89 01                	mov    %eax,(%rcx)
  100650:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
  100653:	48 83 c3 01          	add    $0x1,%rbx
  100657:	e9 51 ff ff ff       	jmp    1005ad <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            width = va_arg(val, int);
  10065c:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100660:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100664:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100668:	48 89 41 08          	mov    %rax,0x8(%rcx)
  10066c:	eb e2                	jmp    100650 <printer::vprintf(char const*, __va_list_tag*)+0x130>
        int flags = 0;
  10066e:	41 be 00 00 00 00    	mov    $0x0,%r14d
        int width = -1;
  100674:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  10067a:	e9 2e ff ff ff       	jmp    1005ad <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  10067f:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  100685:	e9 23 ff ff ff       	jmp    1005ad <printer::vprintf(char const*, __va_list_tag*)+0x8d>
        int width = -1;
  10068a:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  100690:	e9 18 ff ff ff       	jmp    1005ad <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            ++format;
  100695:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
  100699:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  10069d:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1006a0:	80 f9 09             	cmp    $0x9,%cl
  1006a3:	76 13                	jbe    1006b8 <printer::vprintf(char const*, __va_list_tag*)+0x198>
            } else if (*format == '*') {
  1006a5:	3c 2a                	cmp    $0x2a,%al
  1006a7:	74 33                	je     1006dc <printer::vprintf(char const*, __va_list_tag*)+0x1bc>
            ++format;
  1006a9:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
  1006ac:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
  1006b3:	e9 05 ff ff ff       	jmp    1005bd <printer::vprintf(char const*, __va_list_tag*)+0x9d>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1006b8:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  1006bd:	48 83 c2 01          	add    $0x1,%rdx
  1006c1:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  1006c4:	0f be c0             	movsbl %al,%eax
  1006c7:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1006cb:	0f b6 02             	movzbl (%rdx),%eax
  1006ce:	8d 70 d0             	lea    -0x30(%rax),%esi
  1006d1:	40 80 fe 09          	cmp    $0x9,%sil
  1006d5:	76 e6                	jbe    1006bd <printer::vprintf(char const*, __va_list_tag*)+0x19d>
  1006d7:	48 89 d3             	mov    %rdx,%rbx
  1006da:	eb 1c                	jmp    1006f8 <printer::vprintf(char const*, __va_list_tag*)+0x1d8>
                precision = va_arg(val, int);
  1006dc:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1006e0:	8b 07                	mov    (%rdi),%eax
  1006e2:	83 f8 2f             	cmp    $0x2f,%eax
  1006e5:	77 23                	ja     10070a <printer::vprintf(char const*, __va_list_tag*)+0x1ea>
  1006e7:	89 c2                	mov    %eax,%edx
  1006e9:	48 03 57 10          	add    0x10(%rdi),%rdx
  1006ed:	83 c0 08             	add    $0x8,%eax
  1006f0:	89 07                	mov    %eax,(%rdi)
  1006f2:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  1006f4:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
  1006f8:	85 c9                	test   %ecx,%ecx
  1006fa:	b8 00 00 00 00       	mov    $0x0,%eax
  1006ff:	0f 49 c1             	cmovns %ecx,%eax
  100702:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100705:	e9 b3 fe ff ff       	jmp    1005bd <printer::vprintf(char const*, __va_list_tag*)+0x9d>
                precision = va_arg(val, int);
  10070a:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  10070e:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100712:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100716:	48 89 47 08          	mov    %rax,0x8(%rdi)
  10071a:	eb d6                	jmp    1006f2 <printer::vprintf(char const*, __va_list_tag*)+0x1d2>
        switch (*format) {
  10071c:	3c 74                	cmp    $0x74,%al
  10071e:	74 1b                	je     10073b <printer::vprintf(char const*, __va_list_tag*)+0x21b>
  100720:	3c 7a                	cmp    $0x7a,%al
  100722:	74 17                	je     10073b <printer::vprintf(char const*, __va_list_tag*)+0x21b>
        switch (*format) {
  100724:	8d 50 bd             	lea    -0x43(%rax),%edx
  100727:	80 fa 35             	cmp    $0x35,%dl
  10072a:	0f 87 5e 06 00 00    	ja     100d8e <printer::vprintf(char const*, __va_list_tag*)+0x86e>
  100730:	0f b6 d2             	movzbl %dl,%edx
  100733:	3e ff 24 d5 40 14 10 	notrack jmp *0x101440(,%rdx,8)
  10073a:	00 
            ++format;
  10073b:	48 8d 43 01          	lea    0x1(%rbx),%rax
  10073f:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  100743:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  100747:	8d 50 bd             	lea    -0x43(%rax),%edx
  10074a:	80 fa 35             	cmp    $0x35,%dl
  10074d:	0f 87 41 04 00 00    	ja     100b94 <printer::vprintf(char const*, __va_list_tag*)+0x674>
  100753:	0f b6 d2             	movzbl %dl,%edx
  100756:	3e ff 24 d5 f0 15 10 	notrack jmp *0x1015f0(,%rdx,8)
  10075d:	00 
  10075e:	8d 50 bd             	lea    -0x43(%rax),%edx
  100761:	80 fa 35             	cmp    $0x35,%dl
  100764:	0f 87 26 04 00 00    	ja     100b90 <printer::vprintf(char const*, __va_list_tag*)+0x670>
  10076a:	0f b6 d2             	movzbl %dl,%edx
  10076d:	3e ff 24 d5 a0 17 10 	notrack jmp *0x1017a0(,%rdx,8)
  100774:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100775:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100779:	8b 07                	mov    (%rdi),%eax
  10077b:	83 f8 2f             	cmp    $0x2f,%eax
  10077e:	77 36                	ja     1007b6 <printer::vprintf(char const*, __va_list_tag*)+0x296>
  100780:	89 c2                	mov    %eax,%edx
  100782:	48 03 57 10          	add    0x10(%rdi),%rdx
  100786:	83 c0 08             	add    $0x8,%eax
  100789:	89 07                	mov    %eax,(%rdi)
  10078b:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  10078e:	48 89 d0             	mov    %rdx,%rax
  100791:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  100795:	49 89 d3             	mov    %rdx,%r11
  100798:	49 f7 db             	neg    %r11
  10079b:	25 00 01 00 00       	and    $0x100,%eax
  1007a0:	4c 0f 44 da          	cmove  %rdx,%r11
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  1007a4:	44 09 f0             	or     %r14d,%eax
  1007a7:	0c c0                	or     $0xc0,%al
  1007a9:	41 89 c6             	mov    %eax,%r14d
        const char* data = "";
  1007ac:	bb a1 11 10 00       	mov    $0x1011a1,%ebx
            break;
  1007b1:	e9 f4 01 00 00       	jmp    1009aa <printer::vprintf(char const*, __va_list_tag*)+0x48a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1007b6:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1007ba:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1007be:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1007c2:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1007c6:	eb c3                	jmp    10078b <printer::vprintf(char const*, __va_list_tag*)+0x26b>
        switch (*format) {
  1007c8:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1007cc:	eb 04                	jmp    1007d2 <printer::vprintf(char const*, __va_list_tag*)+0x2b2>
  1007ce:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1007d2:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1007d6:	8b 01                	mov    (%rcx),%eax
  1007d8:	83 f8 2f             	cmp    $0x2f,%eax
  1007db:	77 10                	ja     1007ed <printer::vprintf(char const*, __va_list_tag*)+0x2cd>
  1007dd:	89 c2                	mov    %eax,%edx
  1007df:	48 03 51 10          	add    0x10(%rcx),%rdx
  1007e3:	83 c0 08             	add    $0x8,%eax
  1007e6:	89 01                	mov    %eax,(%rcx)
  1007e8:	48 63 12             	movslq (%rdx),%rdx
  1007eb:	eb a1                	jmp    10078e <printer::vprintf(char const*, __va_list_tag*)+0x26e>
  1007ed:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1007f1:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1007f5:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1007f9:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1007fd:	eb e9                	jmp    1007e8 <printer::vprintf(char const*, __va_list_tag*)+0x2c8>
        switch (*format) {
  1007ff:	b8 01 00 00 00       	mov    $0x1,%eax
  100804:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  10080b:	e9 9d 00 00 00       	jmp    1008ad <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  100810:	b8 00 00 00 00       	mov    $0x0,%eax
  100815:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  10081c:	e9 8c 00 00 00       	jmp    1008ad <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  100821:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100825:	b8 00 00 00 00       	mov    $0x0,%eax
  10082a:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  100831:	eb 7a                	jmp    1008ad <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  100833:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100837:	b8 00 00 00 00       	mov    $0x0,%eax
  10083c:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  100843:	eb 68                	jmp    1008ad <printer::vprintf(char const*, __va_list_tag*)+0x38d>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  100845:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100849:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  10084d:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100851:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100855:	eb 70                	jmp    1008c7 <printer::vprintf(char const*, __va_list_tag*)+0x3a7>
  100857:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  10085b:	8b 07                	mov    (%rdi),%eax
  10085d:	83 f8 2f             	cmp    $0x2f,%eax
  100860:	77 10                	ja     100872 <printer::vprintf(char const*, __va_list_tag*)+0x352>
  100862:	89 c2                	mov    %eax,%edx
  100864:	48 03 57 10          	add    0x10(%rdi),%rdx
  100868:	83 c0 08             	add    $0x8,%eax
  10086b:	89 07                	mov    %eax,(%rdi)
  10086d:	44 8b 1a             	mov    (%rdx),%r11d
  100870:	eb 58                	jmp    1008ca <printer::vprintf(char const*, __va_list_tag*)+0x3aa>
  100872:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100876:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  10087a:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10087e:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100882:	eb e9                	jmp    10086d <printer::vprintf(char const*, __va_list_tag*)+0x34d>
        switch (*format) {
  100884:	b8 01 00 00 00       	mov    $0x1,%eax
  100889:	eb 1b                	jmp    1008a6 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  10088b:	b8 00 00 00 00       	mov    $0x0,%eax
  100890:	eb 14                	jmp    1008a6 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  100892:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100896:	b8 00 00 00 00       	mov    $0x0,%eax
  10089b:	eb 09                	jmp    1008a6 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  10089d:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1008a1:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  1008a6:	c7 45 a0 f0 ff ff ff 	movl   $0xfffffff0,-0x60(%rbp)
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1008ad:	85 c0                	test   %eax,%eax
  1008af:	74 a6                	je     100857 <printer::vprintf(char const*, __va_list_tag*)+0x337>
  1008b1:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1008b5:	8b 07                	mov    (%rdi),%eax
  1008b7:	83 f8 2f             	cmp    $0x2f,%eax
  1008ba:	77 89                	ja     100845 <printer::vprintf(char const*, __va_list_tag*)+0x325>
  1008bc:	89 c2                	mov    %eax,%edx
  1008be:	48 03 57 10          	add    0x10(%rdi),%rdx
  1008c2:	83 c0 08             	add    $0x8,%eax
  1008c5:	89 07                	mov    %eax,(%rdi)
  1008c7:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_NUMERIC;
  1008ca:	44 89 f0             	mov    %r14d,%eax
  1008cd:	83 c8 40             	or     $0x40,%eax
    if (base < 0) {
  1008d0:	83 7d a0 00          	cmpl   $0x0,-0x60(%rbp)
  1008d4:	0f 89 de 02 00 00    	jns    100bb8 <printer::vprintf(char const*, __va_list_tag*)+0x698>
    *--pos = '\0';
  1008da:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  1008de:	a8 20                	test   $0x20,%al
  1008e0:	0f 85 01 03 00 00    	jne    100be7 <printer::vprintf(char const*, __va_list_tag*)+0x6c7>
  1008e6:	41 89 c6             	mov    %eax,%r14d
        digits = lower_digits;
  1008e9:	41 ba 50 19 10 00    	mov    $0x101950,%r10d
        base = -base;
  1008ef:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  1008f5:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = nullptr;
  1008fc:	bf 00 00 00 00       	mov    $0x0,%edi
  100901:	e9 03 03 00 00       	jmp    100c09 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
        switch (*format) {
  100906:	b8 01 00 00 00       	mov    $0x1,%eax
  10090b:	eb 1b                	jmp    100928 <printer::vprintf(char const*, __va_list_tag*)+0x408>
  10090d:	b8 00 00 00 00       	mov    $0x0,%eax
  100912:	eb 14                	jmp    100928 <printer::vprintf(char const*, __va_list_tag*)+0x408>
  100914:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100918:	b8 00 00 00 00       	mov    $0x0,%eax
  10091d:	eb 09                	jmp    100928 <printer::vprintf(char const*, __va_list_tag*)+0x408>
  10091f:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100923:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  100928:	c7 45 a0 10 00 00 00 	movl   $0x10,-0x60(%rbp)
            goto format_unsigned;
  10092f:	e9 79 ff ff ff       	jmp    1008ad <printer::vprintf(char const*, __va_list_tag*)+0x38d>
        switch (*format) {
  100934:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100938:	eb 04                	jmp    10093e <printer::vprintf(char const*, __va_list_tag*)+0x41e>
  10093a:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            num = (uintptr_t) va_arg(val, void*);
  10093e:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100942:	8b 01                	mov    (%rcx),%eax
  100944:	83 f8 2f             	cmp    $0x2f,%eax
  100947:	77 22                	ja     10096b <printer::vprintf(char const*, __va_list_tag*)+0x44b>
  100949:	89 c2                	mov    %eax,%edx
  10094b:	48 03 51 10          	add    0x10(%rcx),%rdx
  10094f:	83 c0 08             	add    $0x8,%eax
  100952:	89 01                	mov    %eax,(%rcx)
  100954:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  100957:	44 89 f0             	mov    %r14d,%eax
  10095a:	0d 41 02 00 00       	or     $0x241,%eax
            base = -16;
  10095f:	c7 45 a0 f0 ff ff ff 	movl   $0xfffffff0,-0x60(%rbp)
  100966:	e9 6f ff ff ff       	jmp    1008da <printer::vprintf(char const*, __va_list_tag*)+0x3ba>
            num = (uintptr_t) va_arg(val, void*);
  10096b:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  10096f:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100973:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100977:	48 89 47 08          	mov    %rax,0x8(%rdi)
  10097b:	eb d7                	jmp    100954 <printer::vprintf(char const*, __va_list_tag*)+0x434>
        switch (*format) {
  10097d:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100981:	eb 04                	jmp    100987 <printer::vprintf(char const*, __va_list_tag*)+0x467>
  100983:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = va_arg(val, char*);
  100987:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  10098b:	8b 01                	mov    (%rcx),%eax
  10098d:	83 f8 2f             	cmp    $0x2f,%eax
  100990:	0f 87 61 01 00 00    	ja     100af7 <printer::vprintf(char const*, __va_list_tag*)+0x5d7>
  100996:	89 c2                	mov    %eax,%edx
  100998:	48 03 51 10          	add    0x10(%rcx),%rdx
  10099c:	83 c0 08             	add    $0x8,%eax
  10099f:	89 01                	mov    %eax,(%rcx)
  1009a1:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  1009a4:	41 bb 00 00 00 00    	mov    $0x0,%r11d
        if (flags & FLAG_NUMERIC) {
  1009aa:	44 89 f0             	mov    %r14d,%eax
  1009ad:	83 e0 40             	and    $0x40,%eax
  1009b0:	89 45 94             	mov    %eax,-0x6c(%rbp)
        const char* prefix = "";
  1009b3:	41 bc a1 11 10 00    	mov    $0x1011a1,%r12d
        if (flags & FLAG_NUMERIC) {
  1009b9:	0f 85 e9 03 00 00    	jne    100da8 <printer::vprintf(char const*, __va_list_tag*)+0x888>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  1009bf:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  1009c2:	89 d0                	mov    %edx,%eax
  1009c4:	f7 d0                	not    %eax
  1009c6:	c1 e8 1f             	shr    $0x1f,%eax
  1009c9:	89 45 90             	mov    %eax,-0x70(%rbp)
  1009cc:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
  1009d0:	0f 85 54 03 00 00    	jne    100d2a <printer::vprintf(char const*, __va_list_tag*)+0x80a>
  1009d6:	84 c0                	test   %al,%al
  1009d8:	0f 84 4c 03 00 00    	je     100d2a <printer::vprintf(char const*, __va_list_tag*)+0x80a>
            datalen = strnlen(data, precision);
  1009de:	48 63 f2             	movslq %edx,%rsi
  1009e1:	48 89 df             	mov    %rbx,%rdi
  1009e4:	e8 ed f9 ff ff       	call   1003d6 <strnlen>
  1009e9:	89 45 a0             	mov    %eax,-0x60(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  1009ec:	44 89 f0             	mov    %r14d,%eax
  1009ef:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  1009f2:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  1009f9:	83 f8 42             	cmp    $0x42,%eax
  1009fc:	0f 84 60 03 00 00    	je     100d62 <printer::vprintf(char const*, __va_list_tag*)+0x842>
        width -= datalen + zeros + strlen(prefix);
  100a02:	4c 89 e7             	mov    %r12,%rdi
  100a05:	e8 ad f9 ff ff       	call   1003b7 <strlen>
  100a0a:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  100a0d:	8b 7d a0             	mov    -0x60(%rbp),%edi
  100a10:	8d 0c 3a             	lea    (%rdx,%rdi,1),%ecx
  100a13:	44 89 ea             	mov    %r13d,%edx
  100a16:	29 ca                	sub    %ecx,%edx
  100a18:	29 c2                	sub    %eax,%edx
  100a1a:	41 89 d5             	mov    %edx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100a1d:	41 f6 c6 04          	test   $0x4,%r14b
  100a21:	75 31                	jne    100a54 <printer::vprintf(char const*, __va_list_tag*)+0x534>
  100a23:	85 d2                	test   %edx,%edx
  100a25:	7e 2d                	jle    100a54 <printer::vprintf(char const*, __va_list_tag*)+0x534>
        width -= datalen + zeros + strlen(prefix);
  100a27:	41 89 d6             	mov    %edx,%r14d
            putc(' ');
  100a2a:	49 8b 07             	mov    (%r15),%rax
  100a2d:	be 20 00 00 00       	mov    $0x20,%esi
  100a32:	4c 89 ff             	mov    %r15,%rdi
  100a35:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100a37:	41 83 ed 01          	sub    $0x1,%r13d
  100a3b:	45 85 ed             	test   %r13d,%r13d
  100a3e:	7f ea                	jg     100a2a <printer::vprintf(char const*, __va_list_tag*)+0x50a>
  100a40:	44 89 f2             	mov    %r14d,%edx
  100a43:	45 85 f6             	test   %r14d,%r14d
  100a46:	b8 01 00 00 00       	mov    $0x1,%eax
  100a4b:	41 0f 4f c6          	cmovg  %r14d,%eax
  100a4f:	29 c2                	sub    %eax,%edx
  100a51:	41 89 d5             	mov    %edx,%r13d
        for (; *prefix; ++prefix) {
  100a54:	41 0f b6 04 24       	movzbl (%r12),%eax
  100a59:	84 c0                	test   %al,%al
  100a5b:	74 18                	je     100a75 <printer::vprintf(char const*, __va_list_tag*)+0x555>
            putc(*prefix);
  100a5d:	0f b6 f0             	movzbl %al,%esi
  100a60:	49 8b 07             	mov    (%r15),%rax
  100a63:	4c 89 ff             	mov    %r15,%rdi
  100a66:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  100a68:	49 83 c4 01          	add    $0x1,%r12
  100a6c:	41 0f b6 04 24       	movzbl (%r12),%eax
  100a71:	84 c0                	test   %al,%al
  100a73:	75 e8                	jne    100a5d <printer::vprintf(char const*, __va_list_tag*)+0x53d>
        for (; zeros > 0; --zeros) {
  100a75:	44 8b 65 a4          	mov    -0x5c(%rbp),%r12d
  100a79:	45 85 e4             	test   %r12d,%r12d
  100a7c:	7e 13                	jle    100a91 <printer::vprintf(char const*, __va_list_tag*)+0x571>
            putc('0');
  100a7e:	49 8b 07             	mov    (%r15),%rax
  100a81:	be 30 00 00 00       	mov    $0x30,%esi
  100a86:	4c 89 ff             	mov    %r15,%rdi
  100a89:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  100a8b:	41 83 ec 01          	sub    $0x1,%r12d
  100a8f:	75 ed                	jne    100a7e <printer::vprintf(char const*, __va_list_tag*)+0x55e>
        for (; datalen > 0; ++data, --datalen) {
  100a91:	8b 45 a0             	mov    -0x60(%rbp),%eax
  100a94:	85 c0                	test   %eax,%eax
  100a96:	7e 1a                	jle    100ab2 <printer::vprintf(char const*, __va_list_tag*)+0x592>
  100a98:	41 89 c6             	mov    %eax,%r14d
  100a9b:	49 01 de             	add    %rbx,%r14
            putc(*data);
  100a9e:	0f b6 33             	movzbl (%rbx),%esi
  100aa1:	49 8b 07             	mov    (%r15),%rax
  100aa4:	4c 89 ff             	mov    %r15,%rdi
  100aa7:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  100aa9:	48 83 c3 01          	add    $0x1,%rbx
  100aad:	49 39 de             	cmp    %rbx,%r14
  100ab0:	75 ec                	jne    100a9e <printer::vprintf(char const*, __va_list_tag*)+0x57e>
        for (; width > 0; --width) {
  100ab2:	45 85 ed             	test   %r13d,%r13d
  100ab5:	7e 13                	jle    100aca <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            putc(' ');
  100ab7:	49 8b 07             	mov    (%r15),%rax
  100aba:	be 20 00 00 00       	mov    $0x20,%esi
  100abf:	4c 89 ff             	mov    %r15,%rdi
  100ac2:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  100ac4:	41 83 ed 01          	sub    $0x1,%r13d
  100ac8:	75 ed                	jne    100ab7 <printer::vprintf(char const*, __va_list_tag*)+0x597>
    for (; *format; ++format) {
  100aca:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  100ace:	4c 8d 60 01          	lea    0x1(%rax),%r12
  100ad2:	0f b6 40 01          	movzbl 0x1(%rax),%eax
  100ad6:	84 c0                	test   %al,%al
  100ad8:	0f 84 6c fa ff ff    	je     10054a <printer::vprintf(char const*, __va_list_tag*)+0x2a>
        if (*format != '%') {
  100ade:	3c 25                	cmp    $0x25,%al
  100ae0:	0f 84 73 fa ff ff    	je     100559 <printer::vprintf(char const*, __va_list_tag*)+0x39>
            putc(*format);
  100ae6:	0f b6 f0             	movzbl %al,%esi
  100ae9:	49 8b 07             	mov    (%r15),%rax
  100aec:	4c 89 ff             	mov    %r15,%rdi
  100aef:	ff 10                	call   *(%rax)
            continue;
  100af1:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
  100af5:	eb d3                	jmp    100aca <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            data = va_arg(val, char*);
  100af7:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100afb:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100aff:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100b03:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100b07:	e9 95 fe ff ff       	jmp    1009a1 <printer::vprintf(char const*, __va_list_tag*)+0x481>
        switch (*format) {
  100b0c:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100b10:	eb 04                	jmp    100b16 <printer::vprintf(char const*, __va_list_tag*)+0x5f6>
  100b12:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            color_ = va_arg(val, int);
  100b16:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100b1a:	8b 07                	mov    (%rdi),%eax
  100b1c:	83 f8 2f             	cmp    $0x2f,%eax
  100b1f:	77 13                	ja     100b34 <printer::vprintf(char const*, __va_list_tag*)+0x614>
  100b21:	89 c2                	mov    %eax,%edx
  100b23:	48 03 57 10          	add    0x10(%rdi),%rdx
  100b27:	83 c0 08             	add    $0x8,%eax
  100b2a:	89 07                	mov    %eax,(%rdi)
  100b2c:	8b 02                	mov    (%rdx),%eax
  100b2e:	41 89 47 08          	mov    %eax,0x8(%r15)
            continue;
  100b32:	eb 96                	jmp    100aca <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            color_ = va_arg(val, int);
  100b34:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100b38:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100b3c:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100b40:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100b44:	eb e6                	jmp    100b2c <printer::vprintf(char const*, __va_list_tag*)+0x60c>
        switch (*format) {
  100b46:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100b4a:	eb 04                	jmp    100b50 <printer::vprintf(char const*, __va_list_tag*)+0x630>
  100b4c:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = va_arg(val, int);
  100b50:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100b54:	8b 01                	mov    (%rcx),%eax
  100b56:	83 f8 2f             	cmp    $0x2f,%eax
  100b59:	77 23                	ja     100b7e <printer::vprintf(char const*, __va_list_tag*)+0x65e>
  100b5b:	89 c2                	mov    %eax,%edx
  100b5d:	48 03 51 10          	add    0x10(%rcx),%rdx
  100b61:	83 c0 08             	add    $0x8,%eax
  100b64:	89 01                	mov    %eax,(%rcx)
  100b66:	8b 02                	mov    (%rdx),%eax
  100b68:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100b6b:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  100b6f:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100b73:	41 bb 00 00 00 00    	mov    $0x0,%r11d
            break;
  100b79:	e9 2c fe ff ff       	jmp    1009aa <printer::vprintf(char const*, __va_list_tag*)+0x48a>
            numbuf[0] = va_arg(val, int);
  100b7e:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100b82:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100b86:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100b8a:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100b8e:	eb d6                	jmp    100b66 <printer::vprintf(char const*, __va_list_tag*)+0x646>
        switch (*format) {
  100b90:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = (*format ? *format : '%');
  100b94:	84 c0                	test   %al,%al
  100b96:	0f 85 ee 01 00 00    	jne    100d8a <printer::vprintf(char const*, __va_list_tag*)+0x86a>
  100b9c:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  100ba0:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  100ba4:	48 83 6d a8 01       	subq   $0x1,-0x58(%rbp)
            data = numbuf;
  100ba9:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100bad:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  100bb3:	e9 f2 fd ff ff       	jmp    1009aa <printer::vprintf(char const*, __va_list_tag*)+0x48a>
    *--pos = '\0';
  100bb8:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100bbc:	41 f6 c6 20          	test   $0x20,%r14b
  100bc0:	74 73                	je     100c35 <printer::vprintf(char const*, __va_list_tag*)+0x715>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100bc2:	8b 55 a0             	mov    -0x60(%rbp),%edx
  100bc5:	41 89 d1             	mov    %edx,%r9d
  100bc8:	41 89 c6             	mov    %eax,%r14d
  100bcb:	41 ba 70 19 10 00    	mov    $0x101970,%r10d
  100bd1:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
  100bd8:	83 fa 0a             	cmp    $0xa,%edx
  100bdb:	0f 94 c0             	sete   %al
  100bde:	0f b6 c0             	movzbl %al,%eax
  100be1:	48 83 e8 04          	sub    $0x4,%rax
  100be5:	eb 1d                	jmp    100c04 <printer::vprintf(char const*, __va_list_tag*)+0x6e4>
    if (flags & FLAG_THOUSANDS) {
  100be7:	41 89 c6             	mov    %eax,%r14d
        digits = lower_digits;
  100bea:	41 ba 50 19 10 00    	mov    $0x101950,%r10d
        base = -base;
  100bf0:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  100bf6:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100bfd:	48 c7 c0 fc ff ff ff 	mov    $0xfffffffffffffffc,%rax
  100c04:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  100c09:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  100c0d:	4c 89 d8             	mov    %r11,%rax
            *--pos = digits[val % base];
  100c10:	49 63 f1             	movslq %r9d,%rsi
    } while (val != 0 && pos != buf);
  100c13:	4c 8d 45 b0          	lea    -0x50(%rbp),%r8
  100c17:	eb 57                	jmp    100c70 <printer::vprintf(char const*, __va_list_tag*)+0x750>
    if (flags & FLAG_THOUSANDS) {
  100c19:	41 ba 70 19 10 00    	mov    $0x101970,%r10d
  100c1f:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  100c25:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100c2c:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  100c33:	eb cf                	jmp    100c04 <printer::vprintf(char const*, __va_list_tag*)+0x6e4>
  100c35:	44 8b 4d a0          	mov    -0x60(%rbp),%r9d
  100c39:	41 89 c6             	mov    %eax,%r14d
  100c3c:	41 ba 70 19 10 00    	mov    $0x101970,%r10d
  100c42:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = nullptr;
  100c49:	bf 00 00 00 00       	mov    $0x0,%edi
  100c4e:	eb b9                	jmp    100c09 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
            *--pos = digits[val % base];
  100c50:	48 89 cb             	mov    %rcx,%rbx
  100c53:	ba 00 00 00 00       	mov    $0x0,%edx
  100c58:	48 f7 f6             	div    %rsi
  100c5b:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
  100c60:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  100c62:	48 83 e9 01          	sub    $0x1,%rcx
  100c66:	48 85 c0             	test   %rax,%rax
  100c69:	74 2d                	je     100c98 <printer::vprintf(char const*, __va_list_tag*)+0x778>
  100c6b:	4c 39 c3             	cmp    %r8,%rbx
  100c6e:	74 28                	je     100c98 <printer::vprintf(char const*, __va_list_tag*)+0x778>
        if (pos == thousands_pos) {
  100c70:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  100c74:	48 39 d7             	cmp    %rdx,%rdi
  100c77:	75 d7                	jne    100c50 <printer::vprintf(char const*, __va_list_tag*)+0x730>
            *--pos = base == 10 ? ',' : '\'';
  100c79:	48 89 cb             	mov    %rcx,%rbx
  100c7c:	41 83 f9 0a          	cmp    $0xa,%r9d
  100c80:	0f 94 c2             	sete   %dl
  100c83:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  100c87:	40 0f 94 c7          	sete   %dil
  100c8b:	40 0f b6 ff          	movzbl %dil,%edi
  100c8f:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  100c91:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  100c96:	eb ca                	jmp    100c62 <printer::vprintf(char const*, __va_list_tag*)+0x742>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  100c98:	44 89 f0             	mov    %r14d,%eax
  100c9b:	f7 d0                	not    %eax
  100c9d:	a8 c0                	test   $0xc0,%al
  100c9f:	75 3b                	jne    100cdc <printer::vprintf(char const*, __va_list_tag*)+0x7bc>
                prefix = "-";
  100ca1:	41 bc b9 11 10 00    	mov    $0x1011b9,%r12d
            if (flags & FLAG_NEGATIVE) {
  100ca7:	41 f7 c6 00 01 00 00 	test   $0x100,%r14d
  100cae:	0f 85 0b fd ff ff    	jne    1009bf <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                prefix = "+";
  100cb4:	41 bc b4 11 10 00    	mov    $0x1011b4,%r12d
            } else if (flags & FLAG_PLUSPOSITIVE) {
  100cba:	41 f6 c6 10          	test   $0x10,%r14b
  100cbe:	0f 85 fb fc ff ff    	jne    1009bf <printer::vprintf(char const*, __va_list_tag*)+0x49f>
        const char* prefix = "";
  100cc4:	41 f6 c6 08          	test   $0x8,%r14b
  100cc8:	41 bc bb 11 10 00    	mov    $0x1011bb,%r12d
  100cce:	b8 a1 11 10 00       	mov    $0x1011a1,%eax
  100cd3:	4c 0f 44 e0          	cmove  %rax,%r12
  100cd7:	e9 e3 fc ff ff       	jmp    1009bf <printer::vprintf(char const*, __va_list_tag*)+0x49f>
  100cdc:	41 bc a1 11 10 00    	mov    $0x1011a1,%r12d
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100ce2:	44 89 f0             	mov    %r14d,%eax
  100ce5:	f7 d0                	not    %eax
  100ce7:	a8 41                	test   $0x41,%al
  100ce9:	0f 85 d0 fc ff ff    	jne    1009bf <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                   && (base == 16 || base == -16)
  100cef:	8b 45 a0             	mov    -0x60(%rbp),%eax
  100cf2:	83 c0 10             	add    $0x10,%eax
  100cf5:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  100cfa:	0f 85 bf fc ff ff    	jne    1009bf <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                   && (num || (flags & FLAG_ALT2))) {
  100d00:	4d 85 db             	test   %r11,%r11
  100d03:	75 0d                	jne    100d12 <printer::vprintf(char const*, __va_list_tag*)+0x7f2>
  100d05:	41 f7 c6 00 02 00 00 	test   $0x200,%r14d
  100d0c:	0f 84 ad fc ff ff    	je     1009bf <printer::vprintf(char const*, __va_list_tag*)+0x49f>
            prefix = (base == -16 ? "0x" : "0X");
  100d12:	83 7d a0 f0          	cmpl   $0xfffffff0,-0x60(%rbp)
  100d16:	41 bc b6 11 10 00    	mov    $0x1011b6,%r12d
  100d1c:	b8 bd 11 10 00       	mov    $0x1011bd,%eax
  100d21:	4c 0f 44 e0          	cmove  %rax,%r12
  100d25:	e9 95 fc ff ff       	jmp    1009bf <printer::vprintf(char const*, __va_list_tag*)+0x49f>
            datalen = strlen(data);
  100d2a:	48 89 df             	mov    %rbx,%rdi
  100d2d:	e8 85 f6 ff ff       	call   1003b7 <strlen>
  100d32:	89 45 a0             	mov    %eax,-0x60(%rbp)
            && precision >= 0) {
  100d35:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
  100d39:	0f 84 ad fc ff ff    	je     1009ec <printer::vprintf(char const*, __va_list_tag*)+0x4cc>
  100d3f:	80 7d 90 00          	cmpb   $0x0,-0x70(%rbp)
  100d43:	0f 84 a3 fc ff ff    	je     1009ec <printer::vprintf(char const*, __va_list_tag*)+0x4cc>
            zeros = precision > datalen ? precision - datalen : 0;
  100d49:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  100d4c:	89 fa                	mov    %edi,%edx
  100d4e:	29 c2                	sub    %eax,%edx
  100d50:	39 c7                	cmp    %eax,%edi
  100d52:	b8 00 00 00 00       	mov    $0x0,%eax
  100d57:	0f 4f c2             	cmovg  %edx,%eax
  100d5a:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100d5d:	e9 a0 fc ff ff       	jmp    100a02 <printer::vprintf(char const*, __va_list_tag*)+0x4e2>
                   && datalen + (int) strlen(prefix) < width) {
  100d62:	4c 89 e7             	mov    %r12,%rdi
  100d65:	e8 4d f6 ff ff       	call   1003b7 <strlen>
  100d6a:	8b 7d a0             	mov    -0x60(%rbp),%edi
  100d6d:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  100d70:	44 89 e9             	mov    %r13d,%ecx
  100d73:	29 f9                	sub    %edi,%ecx
  100d75:	29 c1                	sub    %eax,%ecx
  100d77:	44 39 ea             	cmp    %r13d,%edx
  100d7a:	b8 00 00 00 00       	mov    $0x0,%eax
  100d7f:	0f 4c c1             	cmovl  %ecx,%eax
  100d82:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100d85:	e9 78 fc ff ff       	jmp    100a02 <printer::vprintf(char const*, __va_list_tag*)+0x4e2>
  100d8a:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
            numbuf[0] = (*format ? *format : '%');
  100d8e:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100d91:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
  100d95:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = numbuf;
  100d99:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100d9d:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  100da3:	e9 02 fc ff ff       	jmp    1009aa <printer::vprintf(char const*, __va_list_tag*)+0x48a>
    *--pos = '\0';
  100da8:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100dac:	41 f6 c6 20          	test   $0x20,%r14b
  100db0:	0f 85 63 fe ff ff    	jne    100c19 <printer::vprintf(char const*, __va_list_tag*)+0x6f9>
  100db6:	41 ba 70 19 10 00    	mov    $0x101970,%r10d
  100dbc:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  100dc2:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
        thousands_pos = nullptr;
  100dc9:	bf 00 00 00 00       	mov    $0x0,%edi
  100dce:	e9 36 fe ff ff       	jmp    100c09 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>

0000000000100dd3 <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  100dd3:	f3 0f 1e fa          	endbr64
  100dd7:	55                   	push   %rbp
  100dd8:	48 89 e5             	mov    %rsp,%rbp
  100ddb:	53                   	push   %rbx
  100ddc:	48 83 ec 38          	sub    $0x38,%rsp
  100de0:	48 89 f3             	mov    %rsi,%rbx
  100de3:	48 89 d6             	mov    %rdx,%rsi
  100de6:	48 89 ca             	mov    %rcx,%rdx
void console_printf(const char* format, ...);


// Generic print library

struct printer {
  100de9:	c7 45 d0 00 07 00 00 	movl   $0x700,-0x30(%rbp)
        : s_(s), end_(s + size), n_(0) {
  100df0:	48 c7 45 c8 98 19 10 	movq   $0x101998,-0x38(%rbp)
  100df7:	00 
  100df8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  100dfc:	48 01 df             	add    %rbx,%rdi
  100dff:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  100e03:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  100e0a:	00 
    string_printer sp(s, size);
    sp.vprintf(format, val);
  100e0b:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100e0f:	e8 0c f7 ff ff       	call   100520 <printer::vprintf(char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  100e14:	48 85 db             	test   %rbx,%rbx
  100e17:	74 10                	je     100e29 <vsnprintf+0x56>
  100e19:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  100e1d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  100e21:	48 39 c2             	cmp    %rax,%rdx
  100e24:	73 0d                	jae    100e33 <vsnprintf+0x60>
        *sp.s_ = 0;
  100e26:	c6 02 00             	movb   $0x0,(%rdx)
    } else if (size) {
        sp.end_[-1] = 0;
    }
    return sp.n_;
}
  100e29:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  100e2d:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  100e31:	c9                   	leave
  100e32:	c3                   	ret
        sp.end_[-1] = 0;
  100e33:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
  100e37:	eb f0                	jmp    100e29 <vsnprintf+0x56>

0000000000100e39 <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  100e39:	f3 0f 1e fa          	endbr64
  100e3d:	55                   	push   %rbp
  100e3e:	48 89 e5             	mov    %rsp,%rbp
  100e41:	48 83 ec 50          	sub    $0x50,%rsp
  100e45:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100e49:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100e4d:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  100e51:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  100e58:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100e5c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100e60:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100e64:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  100e68:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100e6c:	e8 62 ff ff ff       	call   100dd3 <vsnprintf>
    va_end(val);
    return n;
  100e71:	48 98                	cltq
}
  100e73:	c9                   	leave
  100e74:	c3                   	ret
  100e75:	90                   	nop

0000000000100e76 <console_printer::console_printer(int, bool, int)>:

// console_puts
//    Put a string to the console, starting at the given cursor position.

__noinline
console_printer::console_printer(int cpos, bool scroll, int color)
  100e76:	f3 0f 1e fa          	endbr64
    : cell_(console), scroll_(scroll) {
  100e7a:	48 c7 07 b0 19 10 00 	movq   $0x1019b0,(%rdi)
  100e81:	48 c7 47 10 00 80 0b 	movq   $0xb8000,0x10(%rdi)
  100e88:	00 
  100e89:	88 57 18             	mov    %dl,0x18(%rdi)
    color_ = color;
  100e8c:	89 4f 08             	mov    %ecx,0x8(%rdi)
    if (cpos < 0) {
  100e8f:	85 f6                	test   %esi,%esi
  100e91:	78 18                	js     100eab <console_printer::console_printer(int, bool, int)+0x35>
        cell_ += cursorpos;
    } else if (cpos <= CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100e93:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
  100e99:	7f 0f                	jg     100eaa <console_printer::console_printer(int, bool, int)+0x34>
        cell_ += cpos;
  100e9b:	48 63 f6             	movslq %esi,%rsi
  100e9e:	48 8d 84 36 00 80 0b 	lea    0xb8000(%rsi,%rsi,1),%rax
  100ea5:	00 
  100ea6:	48 89 47 10          	mov    %rax,0x10(%rdi)
    }
}
  100eaa:	c3                   	ret
        cell_ += cursorpos;
  100eab:	8b 05 4b 81 fb ff    	mov    -0x47eb5(%rip),%eax        # b8ffc <cursorpos>
  100eb1:	48 98                	cltq
  100eb3:	48 8d 84 00 00 80 0b 	lea    0xb8000(%rax,%rax,1),%rax
  100eba:	00 
  100ebb:	48 89 47 10          	mov    %rax,0x10(%rdi)
  100ebf:	c3                   	ret

0000000000100ec0 <console_printer::scroll()>:

__noinline
void console_printer::scroll() {
  100ec0:	f3 0f 1e fa          	endbr64
    assert(cell_ >= console + END_CPOS);
  100ec4:	48 81 7f 10 a0 8f 0b 	cmpq   $0xb8fa0,0x10(%rdi)
  100ecb:	00 
  100ecc:	72 56                	jb     100f24 <console_printer::scroll()+0x64>
    if (scroll_) {
  100ece:	b8 00 80 0b 00       	mov    $0xb8000,%eax
  100ed3:	80 7f 18 00          	cmpb   $0x0,0x18(%rdi)
  100ed7:	74 46                	je     100f1f <console_printer::scroll()+0x5f>
        for (int i = 0; i != END_CPOS - CONSOLE_COLUMNS; ++i) {
  100ed9:	b8 00 00 00 00       	mov    $0x0,%eax
            console[i] = console[i + CONSOLE_COLUMNS];
  100ede:	8d 50 50             	lea    0x50(%rax),%edx
  100ee1:	b9 00 80 0b 00       	mov    $0xb8000,%ecx
  100ee6:	48 63 d2             	movslq %edx,%rdx
  100ee9:	0f b7 34 51          	movzwl (%rcx,%rdx,2),%esi
  100eed:	48 63 d0             	movslq %eax,%rdx
  100ef0:	66 89 34 51          	mov    %si,(%rcx,%rdx,2)
        for (int i = 0; i != END_CPOS - CONSOLE_COLUMNS; ++i) {
  100ef4:	83 c0 01             	add    $0x1,%eax
  100ef7:	3d 80 07 00 00       	cmp    $0x780,%eax
  100efc:	75 e0                	jne    100ede <console_printer::scroll()+0x1e>
        }
        for (int i = END_CPOS - CONSOLE_COLUMNS; i != END_CPOS; ++i) {
            console[i] = 0;
  100efe:	48 63 d0             	movslq %eax,%rdx
  100f01:	66 c7 84 12 00 80 0b 	movw   $0x0,0xb8000(%rdx,%rdx,1)
  100f08:	00 00 00 
        for (int i = END_CPOS - CONSOLE_COLUMNS; i != END_CPOS; ++i) {
  100f0b:	83 c0 01             	add    $0x1,%eax
  100f0e:	3d d0 07 00 00       	cmp    $0x7d0,%eax
  100f13:	75 e9                	jne    100efe <console_printer::scroll()+0x3e>
        }
        cell_ -= CONSOLE_COLUMNS;
  100f15:	48 8b 47 10          	mov    0x10(%rdi),%rax
  100f19:	48 2d a0 00 00 00    	sub    $0xa0,%rax
  100f1f:	48 89 47 10          	mov    %rax,0x10(%rdi)
  100f23:	c3                   	ret
void console_printer::scroll() {
  100f24:	55                   	push   %rbp
  100f25:	48 89 e5             	mov    %rsp,%rbp
    assert(cell_ >= console + END_CPOS);
  100f28:	b9 00 00 00 00       	mov    $0x0,%ecx
  100f2d:	ba c0 11 10 00       	mov    $0x1011c0,%edx
  100f32:	be 8a 02 00 00       	mov    $0x28a,%esi
  100f37:	bf ad 11 10 00       	mov    $0x1011ad,%edi
  100f3c:	e8 5e 01 00 00       	call   10109f <assert_fail(char const*, int, char const*, char const*)>
  100f41:	90                   	nop

0000000000100f42 <console_printer::putc(unsigned char)>:
    extern void console_show_cursor(int);
    console_show_cursor(cursorpos);
#endif
}

void console_printer::putc(unsigned char c) {
  100f42:	f3 0f 1e fa          	endbr64
  100f46:	55                   	push   %rbp
  100f47:	48 89 e5             	mov    %rsp,%rbp
  100f4a:	41 54                	push   %r12
  100f4c:	53                   	push   %rbx
  100f4d:	48 89 fb             	mov    %rdi,%rbx
  100f50:	41 89 f4             	mov    %esi,%r12d
    while (cell_ >= console + END_CPOS) {
  100f53:	48 8b 47 10          	mov    0x10(%rdi),%rax
  100f57:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
  100f5d:	72 14                	jb     100f73 <console_printer::putc(unsigned char)+0x31>
        scroll();
  100f5f:	48 89 df             	mov    %rbx,%rdi
  100f62:	e8 59 ff ff ff       	call   100ec0 <console_printer::scroll()>
    while (cell_ >= console + END_CPOS) {
  100f67:	48 8b 43 10          	mov    0x10(%rbx),%rax
  100f6b:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
  100f71:	73 ec                	jae    100f5f <console_printer::putc(unsigned char)+0x1d>
    }
    if (c == '\n') {
  100f73:	41 80 fc 0a          	cmp    $0xa,%r12b
  100f77:	74 1a                	je     100f93 <console_printer::putc(unsigned char)+0x51>
        while (pos != 80) {
            *cell_++ = ' ' | color_;
            ++pos;
        }
    } else {
        *cell_++ = c | color_;
  100f79:	45 0f b6 e4          	movzbl %r12b,%r12d
  100f7d:	66 44 0b 63 08       	or     0x8(%rbx),%r12w
  100f82:	48 8d 50 02          	lea    0x2(%rax),%rdx
  100f86:	48 89 53 10          	mov    %rdx,0x10(%rbx)
  100f8a:	66 44 89 20          	mov    %r12w,(%rax)
    }
}
  100f8e:	5b                   	pop    %rbx
  100f8f:	41 5c                	pop    %r12
  100f91:	5d                   	pop    %rbp
  100f92:	c3                   	ret
        int pos = (cell_ - console) % 80;
  100f93:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  100f99:	48 89 c1             	mov    %rax,%rcx
  100f9c:	48 89 c6             	mov    %rax,%rsi
  100f9f:	48 d1 fe             	sar    $1,%rsi
  100fa2:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
  100fa9:	66 66 66 
  100fac:	48 89 f0             	mov    %rsi,%rax
  100faf:	48 f7 ea             	imul   %rdx
  100fb2:	48 c1 fa 05          	sar    $0x5,%rdx
  100fb6:	48 89 c8             	mov    %rcx,%rax
  100fb9:	48 c1 f8 3f          	sar    $0x3f,%rax
  100fbd:	48 29 c2             	sub    %rax,%rdx
  100fc0:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
  100fc4:	48 c1 e2 04          	shl    $0x4,%rdx
  100fc8:	89 f0                	mov    %esi,%eax
  100fca:	29 d0                	sub    %edx,%eax
            *cell_++ = ' ' | color_;
  100fcc:	0f b7 53 08          	movzwl 0x8(%rbx),%edx
  100fd0:	83 ca 20             	or     $0x20,%edx
  100fd3:	48 8b 4b 10          	mov    0x10(%rbx),%rcx
  100fd7:	48 8d 71 02          	lea    0x2(%rcx),%rsi
  100fdb:	48 89 73 10          	mov    %rsi,0x10(%rbx)
  100fdf:	66 89 11             	mov    %dx,(%rcx)
            ++pos;
  100fe2:	83 c0 01             	add    $0x1,%eax
        while (pos != 80) {
  100fe5:	83 f8 50             	cmp    $0x50,%eax
  100fe8:	75 e2                	jne    100fcc <console_printer::putc(unsigned char)+0x8a>
  100fea:	eb a2                	jmp    100f8e <console_printer::putc(unsigned char)+0x4c>

0000000000100fec <console_printer::move_cursor()>:
void console_printer::move_cursor() {
  100fec:	f3 0f 1e fa          	endbr64
    cursorpos = cell_ - console;
  100ff0:	48 8b 47 10          	mov    0x10(%rdi),%rax
  100ff4:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  100ffa:	48 d1 f8             	sar    $1,%rax
  100ffd:	89 05 f9 7f fb ff    	mov    %eax,-0x48007(%rip)        # b8ffc <cursorpos>
}
  101003:	c3                   	ret

0000000000101004 <console_vprintf(int, int, char const*, __va_list_tag*)>:

// console_vprintf, console_printf
//    Print a message onto the console, starting at the given cursor position.

__noinline
int console_vprintf(int cpos, int color, const char* format, va_list val) {
  101004:	f3 0f 1e fa          	endbr64
  101008:	55                   	push   %rbp
  101009:	48 89 e5             	mov    %rsp,%rbp
  10100c:	41 55                	push   %r13
  10100e:	41 54                	push   %r12
  101010:	53                   	push   %rbx
  101011:	48 83 ec 28          	sub    $0x28,%rsp
  101015:	89 fb                	mov    %edi,%ebx
  101017:	49 89 d4             	mov    %rdx,%r12
  10101a:	49 89 cd             	mov    %rcx,%r13
    console_printer cp(cpos, cpos < 0, color);
  10101d:	89 fa                	mov    %edi,%edx
  10101f:	c1 ea 1f             	shr    $0x1f,%edx
  101022:	89 f1                	mov    %esi,%ecx
  101024:	89 fe                	mov    %edi,%esi
  101026:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
  10102a:	e8 47 fe ff ff       	call   100e76 <console_printer::console_printer(int, bool, int)>
    cp.vprintf(format, val);
  10102f:	4c 89 ea             	mov    %r13,%rdx
  101032:	4c 89 e6             	mov    %r12,%rsi
  101035:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
  101039:	e8 e2 f4 ff ff       	call   100520 <printer::vprintf(char const*, __va_list_tag*)>
    if (cpos < 0) {
  10103e:	85 db                	test   %ebx,%ebx
  101040:	78 18                	js     10105a <console_vprintf(int, int, char const*, __va_list_tag*)+0x56>
        cp.move_cursor();
    }
    return cp.cell_ - console;
  101042:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  101046:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  10104c:	48 d1 f8             	sar    $1,%rax
}
  10104f:	48 83 c4 28          	add    $0x28,%rsp
  101053:	5b                   	pop    %rbx
  101054:	41 5c                	pop    %r12
  101056:	41 5d                	pop    %r13
  101058:	5d                   	pop    %rbp
  101059:	c3                   	ret
        cp.move_cursor();
  10105a:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
  10105e:	e8 89 ff ff ff       	call   100fec <console_printer::move_cursor()>
  101063:	eb dd                	jmp    101042 <console_vprintf(int, int, char const*, __va_list_tag*)+0x3e>

0000000000101065 <console_printf(int, int, char const*, ...)>:

__noinline
int console_printf(int cpos, int color, const char* format, ...) {
  101065:	f3 0f 1e fa          	endbr64
  101069:	55                   	push   %rbp
  10106a:	48 89 e5             	mov    %rsp,%rbp
  10106d:	48 83 ec 50          	sub    $0x50,%rsp
  101071:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  101075:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  101079:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  10107d:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  101084:	48 8d 45 10          	lea    0x10(%rbp),%rax
  101088:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  10108c:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  101090:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
  101094:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  101098:	e8 67 ff ff ff       	call   101004 <console_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
    return cpos;
}
  10109d:	c9                   	leave
  10109e:	c3                   	ret

000000000010109f <assert_fail(char const*, int, char const*, char const*)>:
void error_vprintf(int cpos, int color, const char* format, va_list val) {
    console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  10109f:	f3 0f 1e fa          	endbr64
  1010a3:	55                   	push   %rbp
  1010a4:	48 89 e5             	mov    %rsp,%rbp
  1010a7:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  1010ae:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  1010b1:	c7 05 41 7f fb ff 30 	movl   $0x730,-0x480bf(%rip)        # b8ffc <cursorpos>
  1010b8:	07 00 00 
    char buf[240];
    if (description) {
  1010bb:	48 85 c9             	test   %rcx,%rcx
  1010be:	74 39                	je     1010f9 <assert_fail(char const*, int, char const*, char const*)+0x5a>
  1010c0:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  1010c3:	48 83 ec 08          	sub    $0x8,%rsp
  1010c7:	52                   	push   %rdx
  1010c8:	56                   	push   %rsi
  1010c9:	57                   	push   %rdi
  1010ca:	48 89 f9             	mov    %rdi,%rcx
  1010cd:	ba 38 12 10 00       	mov    $0x101238,%edx
  1010d2:	be f0 00 00 00       	mov    $0xf0,%esi
  1010d7:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  1010de:	b0 00                	mov    $0x0,%al
  1010e0:	e8 54 fd ff ff       	call   100e39 <snprintf>
  1010e5:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  1010e9:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  1010ee:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  1010f5:	0f 05                	syscall
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  1010f7:	eb fe                	jmp    1010f7 <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  1010f9:	49 89 d1             	mov    %rdx,%r9
  1010fc:	48 89 f9             	mov    %rdi,%rcx
  1010ff:	ba 68 12 10 00       	mov    $0x101268,%edx
  101104:	be f0 00 00 00       	mov    $0xf0,%esi
  101109:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  101110:	b0 00                	mov    $0x0,%al
  101112:	e8 22 fd ff ff       	call   100e39 <snprintf>
  101117:	eb d0                	jmp    1010e9 <assert_fail(char const*, int, char const*, char const*)+0x4a>

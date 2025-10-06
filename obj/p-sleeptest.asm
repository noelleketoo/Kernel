
obj/p-sleeptest.full:     file format elf64-x86-64


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
  100010:	bf 30 0f 10 00       	mov    $0x100f30,%edi
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
  10004a:	eb 74                	jmp    1000c0 <process_main()+0xa7>
        assert(pagemark[i] == 0);
  10004c:	b9 00 00 00 00       	mov    $0x0,%ecx
  100051:	ba 4c 0f 10 00       	mov    $0x100f4c,%edx
  100056:	be 10 00 00 00       	mov    $0x10,%esi
  10005b:	bf 5d 0f 10 00       	mov    $0x100f5d,%edi
  100060:	e8 44 0e 00 00       	call   100ea9 <assert_fail(char const*, int, char const*, char const*)>
    while (true) {
        int x = rand(0, ALLOC_SLOWDOWN);
        if (x == 0) {
            // fork, then either sleep or start allocating
            pid_t p = sys_fork();
            assert(p < PID_MAX);
  100065:	b9 00 00 00 00       	mov    $0x0,%ecx
  10006a:	ba 6c 0f 10 00       	mov    $0x100f6c,%edx
  10006f:	be 18 00 00 00       	mov    $0x18,%esi
  100074:	bf 5d 0f 10 00       	mov    $0x100f5d,%edi
  100079:	e8 2b 0e 00 00       	call   100ea9 <assert_fail(char const*, int, char const*, char const*)>
            int choice = rand(0, 2);
            if (choice == 0 && p > 0) {
                unsigned sleep_duration = rand(1, 10);
  10007e:	be 0a 00 00 00       	mov    $0xa,%esi
  100083:	bf 01 00 00 00       	mov    $0x1,%edi
  100088:	e8 3d 04 00 00       	call   1004ca <rand(int, int)>
    return make_syscall(SYSCALL_SLEEP, (uintptr_t) ticks);
  10008d:	89 c7                	mov    %eax,%edi
    register uintptr_t rax asm("rax") = syscallno;
  10008f:	b8 07 00 00 00       	mov    $0x7,%eax
    asm volatile ("syscall"
  100094:	0f 05                	syscall
                int result = sys_sleep(sleep_duration);
                assert(result == 0);
  100096:	85 c0                	test   %eax,%eax
  100098:	74 26                	je     1000c0 <process_main()+0xa7>
  10009a:	b9 00 00 00 00       	mov    $0x0,%ecx
  10009f:	ba 78 0f 10 00       	mov    $0x100f78,%edx
  1000a4:	be 1d 00 00 00       	mov    $0x1d,%esi
  1000a9:	bf 5d 0f 10 00       	mov    $0x100f5d,%edi
  1000ae:	e8 f6 0d 00 00       	call   100ea9 <assert_fail(char const*, int, char const*, char const*)>
            } else if (choice != 2 ? p > 0 : p == 0) {
  1000b3:	85 db                	test   %ebx,%ebx
  1000b5:	75 09                	jne    1000c0 <process_main()+0xa7>
  1000b7:	eb 49                	jmp    100102 <process_main()+0xe9>
    register uintptr_t rax asm("rax") = syscallno;
  1000b9:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  1000be:	0f 05                	syscall
        int x = rand(0, ALLOC_SLOWDOWN);
  1000c0:	be 12 00 00 00       	mov    $0x12,%esi
  1000c5:	bf 00 00 00 00       	mov    $0x0,%edi
  1000ca:	e8 fb 03 00 00       	call   1004ca <rand(int, int)>
        if (x == 0) {
  1000cf:	85 c0                	test   %eax,%eax
  1000d1:	75 e6                	jne    1000b9 <process_main()+0xa0>
    register uintptr_t rax asm("rax") = syscallno;
  1000d3:	b8 05 00 00 00       	mov    $0x5,%eax
    asm volatile ("syscall"
  1000d8:	0f 05                	syscall
    return rax;
  1000da:	48 89 c3             	mov    %rax,%rbx
            assert(p < PID_MAX);
  1000dd:	83 f8 0f             	cmp    $0xf,%eax
  1000e0:	7f 83                	jg     100065 <process_main()+0x4c>
            int choice = rand(0, 2);
  1000e2:	be 02 00 00 00       	mov    $0x2,%esi
  1000e7:	bf 00 00 00 00       	mov    $0x0,%edi
  1000ec:	e8 d9 03 00 00       	call   1004ca <rand(int, int)>
            if (choice == 0 && p > 0) {
  1000f1:	85 c0                	test   %eax,%eax
  1000f3:	75 04                	jne    1000f9 <process_main()+0xe0>
  1000f5:	85 db                	test   %ebx,%ebx
  1000f7:	7f 85                	jg     10007e <process_main()+0x65>
            } else if (choice != 2 ? p > 0 : p == 0) {
  1000f9:	83 f8 02             	cmp    $0x2,%eax
  1000fc:	74 b5                	je     1000b3 <process_main()+0x9a>
  1000fe:	85 db                	test   %ebx,%ebx
  100100:	7e be                	jle    1000c0 <process_main()+0xa7>
        } else {
            sys_yield();
        }
    }

    int speed = rand(1, 16);
  100102:	be 10 00 00 00       	mov    $0x10,%esi
  100107:	bf 01 00 00 00       	mov    $0x1,%edi
  10010c:	e8 b9 03 00 00       	call   1004ca <rand(int, int)>
  100111:	89 c3                	mov    %eax,%ebx
    register uintptr_t rax asm("rax") = syscallno;
  100113:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  100118:	0f 05                	syscall
    return make_syscall(SYSCALL_GETPID);
  10011a:	41 89 c5             	mov    %eax,%r13d
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  10011d:	41 bc 1b 40 10 00    	mov    $0x10401b,%r12d
    pid_t self = sys_getpid();

    uint8_t* heap_bottom = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  100123:	49 81 e4 00 f0 ff ff 	and    $0xfffffffffffff000,%r12
    heap_top = heap_bottom;
  10012a:	4c 89 25 d7 2e 00 00 	mov    %r12,0x2ed7(%rip)        # 103008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  100131:	48 89 e0             	mov    %rsp,%rax
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  100134:	48 83 e8 01          	sub    $0x1,%rax
  100138:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  10013e:	48 89 05 bb 2e 00 00 	mov    %rax,0x2ebb(%rip)        # 103000 <stack_bottom>
    unsigned nalloc = 0;

    // Allocate heap pages until out of address space,
    // forking along the way.
    while (heap_top != stack_bottom) {
  100145:	4c 39 e0             	cmp    %r12,%rax
  100148:	0f 84 5d 02 00 00    	je     1003ab <process_main()+0x392>
    unsigned nalloc = 0;
  10014e:	41 be 00 00 00 00    	mov    $0x0,%r14d
  100154:	eb 34                	jmp    10018a <process_main()+0x171>
        if (x >= 8 * speed) {
            if (x % 4 < 2 && heap_top != heap_bottom) {
                unsigned pn = rand(0, (heap_top - heap_bottom - 1) / PAGESIZE);
                if (pn < sizeof(pagemark)) {
                    volatile uint8_t* addr = heap_bottom + pn * PAGESIZE;
                    assert(*addr == pagemark[pn]);
  100156:	b9 00 00 00 00       	mov    $0x0,%ecx
  10015b:	ba 84 0f 10 00       	mov    $0x100f84,%edx
  100160:	be 37 00 00 00       	mov    $0x37,%esi
  100165:	bf 5d 0f 10 00       	mov    $0x100f5d,%edi
  10016a:	e8 3a 0d 00 00       	call   100ea9 <assert_fail(char const*, int, char const*, char const*)>
    register uintptr_t rax asm("rax") = syscallno;
  10016f:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  100174:	0f 05                	syscall
    while (heap_top != stack_bottom) {
  100176:	48 8b 05 83 2e 00 00 	mov    0x2e83(%rip),%rax        # 103000 <stack_bottom>
  10017d:	48 39 05 84 2e 00 00 	cmp    %rax,0x2e84(%rip)        # 103008 <heap_top>
  100184:	0f 84 21 02 00 00    	je     1003ab <process_main()+0x392>
        int x = rand(0, 6 * ALLOC_SLOWDOWN);
  10018a:	be 6c 00 00 00       	mov    $0x6c,%esi
  10018f:	bf 00 00 00 00       	mov    $0x0,%edi
  100194:	e8 31 03 00 00       	call   1004ca <rand(int, int)>
        if (x >= 8 * speed) {
  100199:	8d 14 dd 00 00 00 00 	lea    0x0(,%rbx,8),%edx
  1001a0:	39 c2                	cmp    %eax,%edx
  1001a2:	0f 8f 8b 00 00 00    	jg     100233 <process_main()+0x21a>
            if (x % 4 < 2 && heap_top != heap_bottom) {
  1001a8:	99                   	cltd
  1001a9:	c1 ea 1e             	shr    $0x1e,%edx
  1001ac:	01 d0                	add    %edx,%eax
  1001ae:	83 e0 03             	and    $0x3,%eax
  1001b1:	29 d0                	sub    %edx,%eax
  1001b3:	83 f8 01             	cmp    $0x1,%eax
  1001b6:	7f b7                	jg     10016f <process_main()+0x156>
  1001b8:	48 8b 05 49 2e 00 00 	mov    0x2e49(%rip),%rax        # 103008 <heap_top>
  1001bf:	4c 39 e0             	cmp    %r12,%rax
  1001c2:	74 ab                	je     10016f <process_main()+0x156>
                unsigned pn = rand(0, (heap_top - heap_bottom - 1) / PAGESIZE);
  1001c4:	4c 29 e0             	sub    %r12,%rax
  1001c7:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  1001cb:	48 c1 ee 0c          	shr    $0xc,%rsi
  1001cf:	bf 00 00 00 00       	mov    $0x0,%edi
  1001d4:	e8 f1 02 00 00       	call   1004ca <rand(int, int)>
                if (pn < sizeof(pagemark)) {
  1001d9:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  1001de:	77 8f                	ja     10016f <process_main()+0x156>
                    volatile uint8_t* addr = heap_bottom + pn * PAGESIZE;
  1001e0:	89 c1                	mov    %eax,%ecx
  1001e2:	48 89 ca             	mov    %rcx,%rdx
  1001e5:	48 c1 e2 0c          	shl    $0xc,%rdx
  1001e9:	4c 01 e2             	add    %r12,%rdx
                    assert(*addr == pagemark[pn]);
  1001ec:	0f b6 32             	movzbl (%rdx),%esi
  1001ef:	0f b6 89 00 20 10 00 	movzbl 0x102000(%rcx),%ecx
  1001f6:	40 38 ce             	cmp    %cl,%sil
  1001f9:	0f 85 57 ff ff ff    	jne    100156 <process_main()+0x13d>
                    pagemark[pn] = self;
  1001ff:	89 c0                	mov    %eax,%eax
  100201:	44 88 a8 00 20 10 00 	mov    %r13b,0x102000(%rax)
                    *addr = self;
  100208:	44 88 2a             	mov    %r13b,(%rdx)
                    assert(*addr == self);
  10020b:	0f b6 02             	movzbl (%rdx),%eax
  10020e:	0f b6 c0             	movzbl %al,%eax
  100211:	44 39 e8             	cmp    %r13d,%eax
  100214:	0f 84 55 ff ff ff    	je     10016f <process_main()+0x156>
  10021a:	b9 00 00 00 00       	mov    $0x0,%ecx
  10021f:	ba 9a 0f 10 00       	mov    $0x100f9a,%edx
  100224:	be 3a 00 00 00       	mov    $0x3a,%esi
  100229:	bf 5d 0f 10 00       	mov    $0x100f5d,%edi
  10022e:	e8 76 0c 00 00       	call   100ea9 <assert_fail(char const*, int, char const*, char const*)>
            }
            sys_yield();
            continue;
        }

        x = rand(0, 7 + min(nalloc / 4, 10U));
  100233:	44 89 f6             	mov    %r14d,%esi
  100236:	c1 ee 02             	shr    $0x2,%esi
    return a < b ? a : b;
  100239:	b8 0a 00 00 00       	mov    $0xa,%eax
  10023e:	39 c6                	cmp    %eax,%esi
  100240:	0f 47 f0             	cmova  %eax,%esi
  100243:	83 c6 07             	add    $0x7,%esi
  100246:	bf 00 00 00 00       	mov    $0x0,%edi
  10024b:	e8 7a 02 00 00       	call   1004ca <rand(int, int)>
        if (x < 2) {
  100250:	83 f8 01             	cmp    $0x1,%eax
  100253:	7e 32                	jle    100287 <process_main()+0x26e>
                pid_t new_self = sys_getpid();
                assert(new_self != self);
                self = new_self;
                speed = rand(1, 16);
            }
        } else if (x < 3) {
  100255:	83 f8 02             	cmp    $0x2,%eax
  100258:	0f 8e 97 00 00 00    	jle    1002f5 <process_main()+0x2dc>
    register uintptr_t rax asm("rax") = syscallno;
  10025e:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  100263:	48 8b 3d 9e 2d 00 00 	mov    0x2d9e(%rip),%rdi        # 103008 <heap_top>
  10026a:	0f 05                	syscall
            unsigned sleep_duration = rand(1, 5);
            int result = sys_sleep(sleep_duration);
            assert(result == 0);
        } else if (sys_page_alloc((void*) heap_top) >= 0) {
  10026c:	85 c0                	test   %eax,%eax
  10026e:	0f 89 ba 00 00 00    	jns    10032e <process_main()+0x315>
                pagemark[pn] = speed;
            }
            // update `heap_top`
            heap_top += PAGESIZE;
            nalloc = (heap_top - heap_bottom) / PAGESIZE;
        } else if (nalloc < 4) {
  100274:	41 83 fe 03          	cmp    $0x3,%r14d
  100278:	0f 86 28 01 00 00    	jbe    1003a6 <process_main()+0x38d>
            sys_exit();
        } else {
            nalloc -= 4;
  10027e:	41 83 ee 04          	sub    $0x4,%r14d
  100282:	e9 ef fe ff ff       	jmp    100176 <process_main()+0x15d>
    register uintptr_t rax asm("rax") = syscallno;
  100287:	b8 05 00 00 00       	mov    $0x5,%eax
    asm volatile ("syscall"
  10028c:	0f 05                	syscall
            assert(p < PID_MAX);
  10028e:	83 f8 0f             	cmp    $0xf,%eax
  100291:	7f 30                	jg     1002c3 <process_main()+0x2aa>
            if (p == 0) {
  100293:	85 c0                	test   %eax,%eax
  100295:	0f 85 db fe ff ff    	jne    100176 <process_main()+0x15d>
    register uintptr_t rax asm("rax") = syscallno;
  10029b:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  1002a0:	0f 05                	syscall
    return rax;
  1002a2:	49 89 c7             	mov    %rax,%r15
                assert(new_self != self);
  1002a5:	44 39 e8             	cmp    %r13d,%eax
  1002a8:	74 32                	je     1002dc <process_main()+0x2c3>
                speed = rand(1, 16);
  1002aa:	be 10 00 00 00       	mov    $0x10,%esi
  1002af:	bf 01 00 00 00       	mov    $0x1,%edi
  1002b4:	e8 11 02 00 00       	call   1004ca <rand(int, int)>
  1002b9:	89 c3                	mov    %eax,%ebx
                self = new_self;
  1002bb:	45 89 fd             	mov    %r15d,%r13d
  1002be:	e9 b3 fe ff ff       	jmp    100176 <process_main()+0x15d>
            assert(p < PID_MAX);
  1002c3:	b9 00 00 00 00       	mov    $0x0,%ecx
  1002c8:	ba 6c 0f 10 00       	mov    $0x100f6c,%edx
  1002cd:	be 44 00 00 00       	mov    $0x44,%esi
  1002d2:	bf 5d 0f 10 00       	mov    $0x100f5d,%edi
  1002d7:	e8 cd 0b 00 00       	call   100ea9 <assert_fail(char const*, int, char const*, char const*)>
                assert(new_self != self);
  1002dc:	b9 00 00 00 00       	mov    $0x0,%ecx
  1002e1:	ba a8 0f 10 00       	mov    $0x100fa8,%edx
  1002e6:	be 47 00 00 00       	mov    $0x47,%esi
  1002eb:	bf 5d 0f 10 00       	mov    $0x100f5d,%edi
  1002f0:	e8 b4 0b 00 00       	call   100ea9 <assert_fail(char const*, int, char const*, char const*)>
            unsigned sleep_duration = rand(1, 5);
  1002f5:	be 05 00 00 00       	mov    $0x5,%esi
  1002fa:	bf 01 00 00 00       	mov    $0x1,%edi
  1002ff:	e8 c6 01 00 00       	call   1004ca <rand(int, int)>
    return make_syscall(SYSCALL_SLEEP, (uintptr_t) ticks);
  100304:	89 c7                	mov    %eax,%edi
    register uintptr_t rax asm("rax") = syscallno;
  100306:	b8 07 00 00 00       	mov    $0x7,%eax
    asm volatile ("syscall"
  10030b:	0f 05                	syscall
            assert(result == 0);
  10030d:	85 c0                	test   %eax,%eax
  10030f:	0f 84 61 fe ff ff    	je     100176 <process_main()+0x15d>
  100315:	b9 00 00 00 00       	mov    $0x0,%ecx
  10031a:	ba 78 0f 10 00       	mov    $0x100f78,%edx
  10031f:	be 4e 00 00 00       	mov    $0x4e,%esi
  100324:	bf 5d 0f 10 00       	mov    $0x100f5d,%edi
  100329:	e8 7b 0b 00 00       	call   100ea9 <assert_fail(char const*, int, char const*, char const*)>
            for (unsigned long* l = (unsigned long*) heap_top;
  10032e:	48 8b 0d d3 2c 00 00 	mov    0x2cd3(%rip),%rcx        # 103008 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  100335:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  10033c:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  10033f:	48 83 38 00          	cmpq   $0x0,(%rax)
  100343:	75 48                	jne    10038d <process_main()+0x374>
            for (unsigned long* l = (unsigned long*) heap_top;
  100345:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  100349:	48 39 d0             	cmp    %rdx,%rax
  10034c:	75 f1                	jne    10033f <process_main()+0x326>
            *heap_top = speed;
  10034e:	88 19                	mov    %bl,(%rcx)
            unsigned pn = (heap_top - heap_bottom) / PAGESIZE;
  100350:	48 8b 05 b1 2c 00 00 	mov    0x2cb1(%rip),%rax        # 103008 <heap_top>
  100357:	48 89 c2             	mov    %rax,%rdx
  10035a:	4c 29 e2             	sub    %r12,%rdx
  10035d:	48 c1 ea 0c          	shr    $0xc,%rdx
            if (pn < sizeof(pagemark)) {
  100361:	81 fa ff 0f 00 00    	cmp    $0xfff,%edx
  100367:	77 08                	ja     100371 <process_main()+0x358>
                pagemark[pn] = speed;
  100369:	89 d2                	mov    %edx,%edx
  10036b:	88 9a 00 20 10 00    	mov    %bl,0x102000(%rdx)
            heap_top += PAGESIZE;
  100371:	48 05 00 10 00 00    	add    $0x1000,%rax
  100377:	48 89 05 8a 2c 00 00 	mov    %rax,0x2c8a(%rip)        # 103008 <heap_top>
            nalloc = (heap_top - heap_bottom) / PAGESIZE;
  10037e:	4c 29 e0             	sub    %r12,%rax
  100381:	49 89 c6             	mov    %rax,%r14
  100384:	49 c1 ee 0c          	shr    $0xc,%r14
  100388:	e9 e9 fd ff ff       	jmp    100176 <process_main()+0x15d>
                assert(*l == 0);
  10038d:	b9 00 00 00 00       	mov    $0x0,%ecx
  100392:	ba b9 0f 10 00       	mov    $0x100fb9,%edx
  100397:	be 54 00 00 00       	mov    $0x54,%esi
  10039c:	bf 5d 0f 10 00       	mov    $0x100f5d,%edi
  1003a1:	e8 03 0b 00 00       	call   100ea9 <assert_fail(char const*, int, char const*, char const*)>
            sys_exit();
  1003a6:	e8 55 fc ff ff       	call   100000 <sys_exit()>
        }
    }

    // After running out of memory
    while (true) {
        if (rand(0, 2 * ALLOC_SLOWDOWN - 1) == 0) {
  1003ab:	be 23 00 00 00       	mov    $0x23,%esi
  1003b0:	bf 00 00 00 00       	mov    $0x0,%edi
  1003b5:	e8 10 01 00 00       	call   1004ca <rand(int, int)>
  1003ba:	85 c0                	test   %eax,%eax
  1003bc:	74 09                	je     1003c7 <process_main()+0x3ae>
    register uintptr_t rax asm("rax") = syscallno;
  1003be:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  1003c3:	0f 05                	syscall
}
  1003c5:	eb e4                	jmp    1003ab <process_main()+0x392>
            sys_exit();
  1003c7:	e8 34 fc ff ff       	call   100000 <sys_exit()>

00000000001003cc <string_printer::putc(unsigned char)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c) override {
  1003cc:	f3 0f 1e fa          	endbr64
        if (s_ < end_) {
  1003d0:	48 8b 47 10          	mov    0x10(%rdi),%rax
  1003d4:	48 3b 47 18          	cmp    0x18(%rdi),%rax
  1003d8:	73 0b                	jae    1003e5 <string_printer::putc(unsigned char)+0x19>
            *s_++ = c;
  1003da:	48 8d 50 01          	lea    0x1(%rax),%rdx
  1003de:	48 89 57 10          	mov    %rdx,0x10(%rdi)
  1003e2:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  1003e5:	48 83 47 20 01       	addq   $0x1,0x20(%rdi)
    }
  1003ea:	c3                   	ret

00000000001003eb <strlen>:
size_t strlen(const char* s) {
  1003eb:	f3 0f 1e fa          	endbr64
    for (n = 0; *s != '\0'; ++s) {
  1003ef:	80 3f 00             	cmpb   $0x0,(%rdi)
  1003f2:	74 10                	je     100404 <strlen+0x19>
  1003f4:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  1003f9:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  1003fd:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  100401:	75 f6                	jne    1003f9 <strlen+0xe>
  100403:	c3                   	ret
  100404:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100409:	c3                   	ret

000000000010040a <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  10040a:	f3 0f 1e fa          	endbr64
  10040e:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  100411:	ba 00 00 00 00       	mov    $0x0,%edx
  100416:	48 85 f6             	test   %rsi,%rsi
  100419:	74 10                	je     10042b <strnlen+0x21>
  10041b:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  10041f:	74 0b                	je     10042c <strnlen+0x22>
        ++n;
  100421:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  100425:	48 39 d0             	cmp    %rdx,%rax
  100428:	75 f1                	jne    10041b <strnlen+0x11>
  10042a:	c3                   	ret
  10042b:	c3                   	ret
  10042c:	48 89 d0             	mov    %rdx,%rax
}
  10042f:	c3                   	ret

0000000000100430 <strchr>:
char* strchr(const char* s, int c) {
  100430:	f3 0f 1e fa          	endbr64
    while (*s != '\0' && *s != (char) c) {
  100434:	0f b6 07             	movzbl (%rdi),%eax
  100437:	84 c0                	test   %al,%al
  100439:	74 10                	je     10044b <strchr+0x1b>
  10043b:	40 38 f0             	cmp    %sil,%al
  10043e:	74 18                	je     100458 <strchr+0x28>
        ++s;
  100440:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  100444:	0f b6 07             	movzbl (%rdi),%eax
  100447:	84 c0                	test   %al,%al
  100449:	75 f0                	jne    10043b <strchr+0xb>
        return (char*) s;
  10044b:	40 84 f6             	test   %sil,%sil
  10044e:	b8 00 00 00 00       	mov    $0x0,%eax
  100453:	48 0f 44 c7          	cmove  %rdi,%rax
}
  100457:	c3                   	ret
        return (char*) s;
  100458:	48 89 f8             	mov    %rdi,%rax
  10045b:	c3                   	ret

000000000010045c <srand(unsigned int)>:
void srand(unsigned seed) {
  10045c:	f3 0f 1e fa          	endbr64
    rand_seed = ((unsigned long) seed << 32) | seed;
  100460:	89 f8                	mov    %edi,%eax
  100462:	48 c1 e7 20          	shl    $0x20,%rdi
  100466:	48 01 c7             	add    %rax,%rdi
	  = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_acquire);
	__glibcxx_assert(__b != memory_order_acq_rel);
	__glibcxx_assert(__b != memory_order_consume);

	__atomic_store_n(&_M_i, __i, int(__m));
  100469:	48 87 3d a0 2b 00 00 	xchg   %rdi,0x2ba0(%rip)        # 103010 <rand_seed>
  100470:	b8 01 00 00 00       	mov    $0x1,%eax
  100475:	87 05 9d 2b 00 00    	xchg   %eax,0x2b9d(%rip)        # 103018 <rand_seed_set>
}
  10047b:	c3                   	ret

000000000010047c <rand()>:
int rand() {
  10047c:	f3 0f 1e fa          	endbr64
  100480:	55                   	push   %rbp
  100481:	48 89 e5             	mov    %rsp,%rbp
	memory_order __b __attribute__ ((__unused__))
	  = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_release);
	__glibcxx_assert(__b != memory_order_acq_rel);

	return __atomic_load_n(&_M_i, int(__m));
  100484:	8b 05 8e 2b 00 00    	mov    0x2b8e(%rip),%eax        # 103018 <rand_seed_set>
    if (!rand_seed_set) {
  10048a:	85 c0                	test   %eax,%eax
  10048c:	74 30                	je     1004be <rand()+0x42>
  10048e:	48 8b 05 7b 2b 00 00 	mov    0x2b7b(%rip),%rax        # 103010 <rand_seed>
        next_rs = rs * 6364136223846793005UL + 1;
  100495:	48 b9 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rcx
  10049c:	f4 51 58 
  10049f:	48 89 c2             	mov    %rax,%rdx
  1004a2:	48 0f af d1          	imul   %rcx,%rdx
  1004a6:	48 83 c2 01          	add    $0x1,%rdx
      compare_exchange_weak(__int_type& __i1, __int_type __i2,
			    memory_order __m1, memory_order __m2) noexcept
      {
	__glibcxx_assert(__is_valid_cmpexch_failure_order(__m2));

	return __atomic_compare_exchange_n(&_M_i, &__i1, __i2, 1,
  1004aa:	f0 48 0f b1 15 5d 2b 	lock cmpxchg %rdx,0x2b5d(%rip)        # 103010 <rand_seed>
  1004b1:	00 00 
    } while (!rand_seed.compare_exchange_weak(rs, next_rs));
  1004b3:	75 ea                	jne    10049f <rand()+0x23>
    return (next_rs >> 33) & RAND_MAX;
  1004b5:	48 c1 ea 21          	shr    $0x21,%rdx
  1004b9:	48 89 d0             	mov    %rdx,%rax
}
  1004bc:	5d                   	pop    %rbp
  1004bd:	c3                   	ret
        srand(819234718U);
  1004be:	bf 9e 87 d4 30       	mov    $0x30d4879e,%edi
  1004c3:	e8 94 ff ff ff       	call   10045c <srand(unsigned int)>
  1004c8:	eb c4                	jmp    10048e <rand()+0x12>

00000000001004ca <rand(int, int)>:
int rand(int min, int max) {
  1004ca:	f3 0f 1e fa          	endbr64
  1004ce:	55                   	push   %rbp
  1004cf:	48 89 e5             	mov    %rsp,%rbp
  1004d2:	41 55                	push   %r13
  1004d4:	41 54                	push   %r12
  1004d6:	53                   	push   %rbx
  1004d7:	48 83 ec 08          	sub    $0x8,%rsp
    assert(min <= max);
  1004db:	39 f7                	cmp    %esi,%edi
  1004dd:	7f 42                	jg     100521 <rand(int, int)+0x57>
  1004df:	41 89 fc             	mov    %edi,%r12d
  1004e2:	89 f3                	mov    %esi,%ebx
    unsigned div = (unsigned(RAND_MAX) + 1) / (max - min + 1),
  1004e4:	29 fb                	sub    %edi,%ebx
  1004e6:	83 c3 01             	add    $0x1,%ebx
  1004e9:	b8 00 00 00 80       	mov    $0x80000000,%eax
  1004ee:	ba 00 00 00 00       	mov    $0x0,%edx
  1004f3:	f7 f3                	div    %ebx
  1004f5:	41 89 c5             	mov    %eax,%r13d
        top = div * (max - min + 1);
  1004f8:	0f af d8             	imul   %eax,%ebx
    assert(top > 0 && top <= unsigned(RAND_MAX) + 1);
  1004fb:	89 d8                	mov    %ebx,%eax
  1004fd:	83 e8 01             	sub    $0x1,%eax
  100500:	78 38                	js     10053a <rand(int, int)+0x70>
        unsigned r = rand();
  100502:	e8 75 ff ff ff       	call   10047c <rand()>
        if (r < top) {
  100507:	39 d8                	cmp    %ebx,%eax
  100509:	73 f7                	jae    100502 <rand(int, int)+0x38>
            return min + r / div;
  10050b:	ba 00 00 00 00       	mov    $0x0,%edx
  100510:	41 f7 f5             	div    %r13d
  100513:	44 01 e0             	add    %r12d,%eax
}
  100516:	48 83 c4 08          	add    $0x8,%rsp
  10051a:	5b                   	pop    %rbx
  10051b:	41 5c                	pop    %r12
  10051d:	41 5d                	pop    %r13
  10051f:	5d                   	pop    %rbp
  100520:	c3                   	ret
    assert(min <= max);
  100521:	b9 00 00 00 00       	mov    $0x0,%ecx
  100526:	ba c1 0f 10 00       	mov    $0x100fc1,%edx
  10052b:	be 49 01 00 00       	mov    $0x149,%esi
  100530:	bf cc 0f 10 00       	mov    $0x100fcc,%edi
  100535:	e8 6f 09 00 00       	call   100ea9 <assert_fail(char const*, int, char const*, char const*)>
    assert(top > 0 && top <= unsigned(RAND_MAX) + 1);
  10053a:	b9 00 00 00 00       	mov    $0x0,%ecx
  10053f:	ba 00 10 10 00       	mov    $0x101000,%edx
  100544:	be 4e 01 00 00       	mov    $0x14e,%esi
  100549:	bf cc 0f 10 00       	mov    $0x100fcc,%edi
  10054e:	e8 56 09 00 00       	call   100ea9 <assert_fail(char const*, int, char const*, char const*)>
  100553:	90                   	nop

0000000000100554 <printer::vprintf(char const*, __va_list_tag*)>:
void printer::vprintf(const char* format, va_list val) {
  100554:	f3 0f 1e fa          	endbr64
  100558:	55                   	push   %rbp
  100559:	48 89 e5             	mov    %rsp,%rbp
  10055c:	41 57                	push   %r15
  10055e:	41 56                	push   %r14
  100560:	41 55                	push   %r13
  100562:	41 54                	push   %r12
  100564:	53                   	push   %rbx
  100565:	48 83 ec 48          	sub    $0x48,%rsp
  100569:	49 89 ff             	mov    %rdi,%r15
  10056c:	49 89 f4             	mov    %rsi,%r12
  10056f:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
    for (; *format; ++format) {
  100573:	0f b6 06             	movzbl (%rsi),%eax
  100576:	84 c0                	test   %al,%al
  100578:	0f 85 94 05 00 00    	jne    100b12 <printer::vprintf(char const*, __va_list_tag*)+0x5be>
}
  10057e:	48 83 c4 48          	add    $0x48,%rsp
  100582:	5b                   	pop    %rbx
  100583:	41 5c                	pop    %r12
  100585:	41 5d                	pop    %r13
  100587:	41 5e                	pop    %r14
  100589:	41 5f                	pop    %r15
  10058b:	5d                   	pop    %rbp
  10058c:	c3                   	ret
        for (++format; *format; ++format) {
  10058d:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  100592:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
  100598:	45 84 e4             	test   %r12b,%r12b
  10059b:	0f 84 01 01 00 00    	je     1006a2 <printer::vprintf(char const*, __va_list_tag*)+0x14e>
        int flags = 0;
  1005a1:	41 be 00 00 00 00    	mov    $0x0,%r14d
            const char* flagc = strchr(flag_chars, *format);
  1005a7:	41 0f be f4          	movsbl %r12b,%esi
  1005ab:	bf a1 17 10 00       	mov    $0x1017a1,%edi
  1005b0:	e8 7b fe ff ff       	call   100430 <strchr>
  1005b5:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  1005b8:	48 85 c0             	test   %rax,%rax
  1005bb:	74 70                	je     10062d <printer::vprintf(char const*, __va_list_tag*)+0xd9>
                flags |= 1 << (flagc - flag_chars);
  1005bd:	48 81 e9 a1 17 10 00 	sub    $0x1017a1,%rcx
  1005c4:	b8 01 00 00 00       	mov    $0x1,%eax
  1005c9:	d3 e0                	shl    %cl,%eax
  1005cb:	41 09 c6             	or     %eax,%r14d
        for (++format; *format; ++format) {
  1005ce:	48 83 c3 01          	add    $0x1,%rbx
  1005d2:	44 0f b6 23          	movzbl (%rbx),%r12d
  1005d6:	45 84 e4             	test   %r12b,%r12b
  1005d9:	75 cc                	jne    1005a7 <printer::vprintf(char const*, __va_list_tag*)+0x53>
        int width = -1;
  1005db:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
  1005e1:	c7 45 a4 ff ff ff ff 	movl   $0xffffffff,-0x5c(%rbp)
        if (*format == '.') {
  1005e8:	80 3b 2e             	cmpb   $0x2e,(%rbx)
  1005eb:	0f 84 d8 00 00 00    	je     1006c9 <printer::vprintf(char const*, __va_list_tag*)+0x175>
        switch (*format) {
  1005f1:	0f b6 03             	movzbl (%rbx),%eax
  1005f4:	3c 6c                	cmp    $0x6c,%al
  1005f6:	0f 84 73 01 00 00    	je     10076f <printer::vprintf(char const*, __va_list_tag*)+0x21b>
  1005fc:	0f 8f 4e 01 00 00    	jg     100750 <printer::vprintf(char const*, __va_list_tag*)+0x1fc>
  100602:	3c 68                	cmp    $0x68,%al
  100604:	0f 85 88 01 00 00    	jne    100792 <printer::vprintf(char const*, __va_list_tag*)+0x23e>
            ++format;
  10060a:	48 8d 43 01          	lea    0x1(%rbx),%rax
  10060e:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  100612:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  100616:	8d 50 bd             	lea    -0x43(%rax),%edx
  100619:	80 fa 35             	cmp    $0x35,%dl
  10061c:	0f 87 a6 05 00 00    	ja     100bc8 <printer::vprintf(char const*, __va_list_tag*)+0x674>
  100622:	0f b6 d2             	movzbl %dl,%edx
  100625:	3e ff 24 d5 b0 10 10 	notrack jmp *0x1010b0(,%rdx,8)
  10062c:	00 
        if (*format >= '1' && *format <= '9') {
  10062d:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
  100632:	3c 08                	cmp    $0x8,%al
  100634:	77 32                	ja     100668 <printer::vprintf(char const*, __va_list_tag*)+0x114>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100636:	0f b6 03             	movzbl (%rbx),%eax
  100639:	8d 50 d0             	lea    -0x30(%rax),%edx
  10063c:	80 fa 09             	cmp    $0x9,%dl
  10063f:	77 72                	ja     1006b3 <printer::vprintf(char const*, __va_list_tag*)+0x15f>
  100641:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
  100647:	48 83 c3 01          	add    $0x1,%rbx
  10064b:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
  100650:	0f be c0             	movsbl %al,%eax
  100653:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100658:	0f b6 03             	movzbl (%rbx),%eax
  10065b:	8d 50 d0             	lea    -0x30(%rax),%edx
  10065e:	80 fa 09             	cmp    $0x9,%dl
  100661:	76 e4                	jbe    100647 <printer::vprintf(char const*, __va_list_tag*)+0xf3>
  100663:	e9 79 ff ff ff       	jmp    1005e1 <printer::vprintf(char const*, __va_list_tag*)+0x8d>
        } else if (*format == '*') {
  100668:	41 80 fc 2a          	cmp    $0x2a,%r12b
  10066c:	75 50                	jne    1006be <printer::vprintf(char const*, __va_list_tag*)+0x16a>
            width = va_arg(val, int);
  10066e:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100672:	8b 01                	mov    (%rcx),%eax
  100674:	83 f8 2f             	cmp    $0x2f,%eax
  100677:	77 17                	ja     100690 <printer::vprintf(char const*, __va_list_tag*)+0x13c>
  100679:	89 c2                	mov    %eax,%edx
  10067b:	48 03 51 10          	add    0x10(%rcx),%rdx
  10067f:	83 c0 08             	add    $0x8,%eax
  100682:	89 01                	mov    %eax,(%rcx)
  100684:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
  100687:	48 83 c3 01          	add    $0x1,%rbx
  10068b:	e9 51 ff ff ff       	jmp    1005e1 <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            width = va_arg(val, int);
  100690:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100694:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100698:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10069c:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1006a0:	eb e2                	jmp    100684 <printer::vprintf(char const*, __va_list_tag*)+0x130>
        int flags = 0;
  1006a2:	41 be 00 00 00 00    	mov    $0x0,%r14d
        int width = -1;
  1006a8:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  1006ae:	e9 2e ff ff ff       	jmp    1005e1 <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1006b3:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  1006b9:	e9 23 ff ff ff       	jmp    1005e1 <printer::vprintf(char const*, __va_list_tag*)+0x8d>
        int width = -1;
  1006be:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  1006c4:	e9 18 ff ff ff       	jmp    1005e1 <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            ++format;
  1006c9:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
  1006cd:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1006d1:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1006d4:	80 f9 09             	cmp    $0x9,%cl
  1006d7:	76 13                	jbe    1006ec <printer::vprintf(char const*, __va_list_tag*)+0x198>
            } else if (*format == '*') {
  1006d9:	3c 2a                	cmp    $0x2a,%al
  1006db:	74 33                	je     100710 <printer::vprintf(char const*, __va_list_tag*)+0x1bc>
            ++format;
  1006dd:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
  1006e0:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
  1006e7:	e9 05 ff ff ff       	jmp    1005f1 <printer::vprintf(char const*, __va_list_tag*)+0x9d>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1006ec:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  1006f1:	48 83 c2 01          	add    $0x1,%rdx
  1006f5:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  1006f8:	0f be c0             	movsbl %al,%eax
  1006fb:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1006ff:	0f b6 02             	movzbl (%rdx),%eax
  100702:	8d 70 d0             	lea    -0x30(%rax),%esi
  100705:	40 80 fe 09          	cmp    $0x9,%sil
  100709:	76 e6                	jbe    1006f1 <printer::vprintf(char const*, __va_list_tag*)+0x19d>
  10070b:	48 89 d3             	mov    %rdx,%rbx
  10070e:	eb 1c                	jmp    10072c <printer::vprintf(char const*, __va_list_tag*)+0x1d8>
                precision = va_arg(val, int);
  100710:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100714:	8b 07                	mov    (%rdi),%eax
  100716:	83 f8 2f             	cmp    $0x2f,%eax
  100719:	77 23                	ja     10073e <printer::vprintf(char const*, __va_list_tag*)+0x1ea>
  10071b:	89 c2                	mov    %eax,%edx
  10071d:	48 03 57 10          	add    0x10(%rdi),%rdx
  100721:	83 c0 08             	add    $0x8,%eax
  100724:	89 07                	mov    %eax,(%rdi)
  100726:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  100728:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
  10072c:	85 c9                	test   %ecx,%ecx
  10072e:	b8 00 00 00 00       	mov    $0x0,%eax
  100733:	0f 49 c1             	cmovns %ecx,%eax
  100736:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100739:	e9 b3 fe ff ff       	jmp    1005f1 <printer::vprintf(char const*, __va_list_tag*)+0x9d>
                precision = va_arg(val, int);
  10073e:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100742:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100746:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10074a:	48 89 47 08          	mov    %rax,0x8(%rdi)
  10074e:	eb d6                	jmp    100726 <printer::vprintf(char const*, __va_list_tag*)+0x1d2>
        switch (*format) {
  100750:	3c 74                	cmp    $0x74,%al
  100752:	74 1b                	je     10076f <printer::vprintf(char const*, __va_list_tag*)+0x21b>
  100754:	3c 7a                	cmp    $0x7a,%al
  100756:	74 17                	je     10076f <printer::vprintf(char const*, __va_list_tag*)+0x21b>
        switch (*format) {
  100758:	8d 50 bd             	lea    -0x43(%rax),%edx
  10075b:	80 fa 35             	cmp    $0x35,%dl
  10075e:	0f 87 5e 06 00 00    	ja     100dc2 <printer::vprintf(char const*, __va_list_tag*)+0x86e>
  100764:	0f b6 d2             	movzbl %dl,%edx
  100767:	3e ff 24 d5 60 12 10 	notrack jmp *0x101260(,%rdx,8)
  10076e:	00 
            ++format;
  10076f:	48 8d 43 01          	lea    0x1(%rbx),%rax
  100773:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  100777:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  10077b:	8d 50 bd             	lea    -0x43(%rax),%edx
  10077e:	80 fa 35             	cmp    $0x35,%dl
  100781:	0f 87 41 04 00 00    	ja     100bc8 <printer::vprintf(char const*, __va_list_tag*)+0x674>
  100787:	0f b6 d2             	movzbl %dl,%edx
  10078a:	3e ff 24 d5 10 14 10 	notrack jmp *0x101410(,%rdx,8)
  100791:	00 
  100792:	8d 50 bd             	lea    -0x43(%rax),%edx
  100795:	80 fa 35             	cmp    $0x35,%dl
  100798:	0f 87 26 04 00 00    	ja     100bc4 <printer::vprintf(char const*, __va_list_tag*)+0x670>
  10079e:	0f b6 d2             	movzbl %dl,%edx
  1007a1:	3e ff 24 d5 c0 15 10 	notrack jmp *0x1015c0(,%rdx,8)
  1007a8:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1007a9:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1007ad:	8b 07                	mov    (%rdi),%eax
  1007af:	83 f8 2f             	cmp    $0x2f,%eax
  1007b2:	77 36                	ja     1007ea <printer::vprintf(char const*, __va_list_tag*)+0x296>
  1007b4:	89 c2                	mov    %eax,%edx
  1007b6:	48 03 57 10          	add    0x10(%rdi),%rdx
  1007ba:	83 c0 08             	add    $0x8,%eax
  1007bd:	89 07                	mov    %eax,(%rdi)
  1007bf:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  1007c2:	48 89 d0             	mov    %rdx,%rax
  1007c5:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  1007c9:	49 89 d3             	mov    %rdx,%r11
  1007cc:	49 f7 db             	neg    %r11
  1007cf:	25 00 01 00 00       	and    $0x100,%eax
  1007d4:	4c 0f 44 da          	cmove  %rdx,%r11
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  1007d8:	44 09 f0             	or     %r14d,%eax
  1007db:	0c c0                	or     $0xc0,%al
  1007dd:	41 89 c6             	mov    %eax,%r14d
        const char* data = "";
  1007e0:	bb db 0f 10 00       	mov    $0x100fdb,%ebx
            break;
  1007e5:	e9 f4 01 00 00       	jmp    1009de <printer::vprintf(char const*, __va_list_tag*)+0x48a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1007ea:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1007ee:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1007f2:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1007f6:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1007fa:	eb c3                	jmp    1007bf <printer::vprintf(char const*, __va_list_tag*)+0x26b>
        switch (*format) {
  1007fc:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100800:	eb 04                	jmp    100806 <printer::vprintf(char const*, __va_list_tag*)+0x2b2>
  100802:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100806:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  10080a:	8b 01                	mov    (%rcx),%eax
  10080c:	83 f8 2f             	cmp    $0x2f,%eax
  10080f:	77 10                	ja     100821 <printer::vprintf(char const*, __va_list_tag*)+0x2cd>
  100811:	89 c2                	mov    %eax,%edx
  100813:	48 03 51 10          	add    0x10(%rcx),%rdx
  100817:	83 c0 08             	add    $0x8,%eax
  10081a:	89 01                	mov    %eax,(%rcx)
  10081c:	48 63 12             	movslq (%rdx),%rdx
  10081f:	eb a1                	jmp    1007c2 <printer::vprintf(char const*, __va_list_tag*)+0x26e>
  100821:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100825:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100829:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10082d:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100831:	eb e9                	jmp    10081c <printer::vprintf(char const*, __va_list_tag*)+0x2c8>
        switch (*format) {
  100833:	b8 01 00 00 00       	mov    $0x1,%eax
  100838:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  10083f:	e9 9d 00 00 00       	jmp    1008e1 <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  100844:	b8 00 00 00 00       	mov    $0x0,%eax
  100849:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  100850:	e9 8c 00 00 00       	jmp    1008e1 <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  100855:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100859:	b8 00 00 00 00       	mov    $0x0,%eax
  10085e:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  100865:	eb 7a                	jmp    1008e1 <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  100867:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  10086b:	b8 00 00 00 00       	mov    $0x0,%eax
  100870:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  100877:	eb 68                	jmp    1008e1 <printer::vprintf(char const*, __va_list_tag*)+0x38d>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  100879:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  10087d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100881:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100885:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100889:	eb 70                	jmp    1008fb <printer::vprintf(char const*, __va_list_tag*)+0x3a7>
  10088b:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  10088f:	8b 07                	mov    (%rdi),%eax
  100891:	83 f8 2f             	cmp    $0x2f,%eax
  100894:	77 10                	ja     1008a6 <printer::vprintf(char const*, __va_list_tag*)+0x352>
  100896:	89 c2                	mov    %eax,%edx
  100898:	48 03 57 10          	add    0x10(%rdi),%rdx
  10089c:	83 c0 08             	add    $0x8,%eax
  10089f:	89 07                	mov    %eax,(%rdi)
  1008a1:	44 8b 1a             	mov    (%rdx),%r11d
  1008a4:	eb 58                	jmp    1008fe <printer::vprintf(char const*, __va_list_tag*)+0x3aa>
  1008a6:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1008aa:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1008ae:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1008b2:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1008b6:	eb e9                	jmp    1008a1 <printer::vprintf(char const*, __va_list_tag*)+0x34d>
        switch (*format) {
  1008b8:	b8 01 00 00 00       	mov    $0x1,%eax
  1008bd:	eb 1b                	jmp    1008da <printer::vprintf(char const*, __va_list_tag*)+0x386>
  1008bf:	b8 00 00 00 00       	mov    $0x0,%eax
  1008c4:	eb 14                	jmp    1008da <printer::vprintf(char const*, __va_list_tag*)+0x386>
  1008c6:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1008ca:	b8 00 00 00 00       	mov    $0x0,%eax
  1008cf:	eb 09                	jmp    1008da <printer::vprintf(char const*, __va_list_tag*)+0x386>
  1008d1:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1008d5:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  1008da:	c7 45 a0 f0 ff ff ff 	movl   $0xfffffff0,-0x60(%rbp)
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1008e1:	85 c0                	test   %eax,%eax
  1008e3:	74 a6                	je     10088b <printer::vprintf(char const*, __va_list_tag*)+0x337>
  1008e5:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1008e9:	8b 07                	mov    (%rdi),%eax
  1008eb:	83 f8 2f             	cmp    $0x2f,%eax
  1008ee:	77 89                	ja     100879 <printer::vprintf(char const*, __va_list_tag*)+0x325>
  1008f0:	89 c2                	mov    %eax,%edx
  1008f2:	48 03 57 10          	add    0x10(%rdi),%rdx
  1008f6:	83 c0 08             	add    $0x8,%eax
  1008f9:	89 07                	mov    %eax,(%rdi)
  1008fb:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_NUMERIC;
  1008fe:	44 89 f0             	mov    %r14d,%eax
  100901:	83 c8 40             	or     $0x40,%eax
    if (base < 0) {
  100904:	83 7d a0 00          	cmpl   $0x0,-0x60(%rbp)
  100908:	0f 89 de 02 00 00    	jns    100bec <printer::vprintf(char const*, __va_list_tag*)+0x698>
    *--pos = '\0';
  10090e:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100912:	a8 20                	test   $0x20,%al
  100914:	0f 85 01 03 00 00    	jne    100c1b <printer::vprintf(char const*, __va_list_tag*)+0x6c7>
  10091a:	41 89 c6             	mov    %eax,%r14d
        digits = lower_digits;
  10091d:	41 ba 70 17 10 00    	mov    $0x101770,%r10d
        base = -base;
  100923:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  100929:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = nullptr;
  100930:	bf 00 00 00 00       	mov    $0x0,%edi
  100935:	e9 03 03 00 00       	jmp    100c3d <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
        switch (*format) {
  10093a:	b8 01 00 00 00       	mov    $0x1,%eax
  10093f:	eb 1b                	jmp    10095c <printer::vprintf(char const*, __va_list_tag*)+0x408>
  100941:	b8 00 00 00 00       	mov    $0x0,%eax
  100946:	eb 14                	jmp    10095c <printer::vprintf(char const*, __va_list_tag*)+0x408>
  100948:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  10094c:	b8 00 00 00 00       	mov    $0x0,%eax
  100951:	eb 09                	jmp    10095c <printer::vprintf(char const*, __va_list_tag*)+0x408>
  100953:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100957:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  10095c:	c7 45 a0 10 00 00 00 	movl   $0x10,-0x60(%rbp)
            goto format_unsigned;
  100963:	e9 79 ff ff ff       	jmp    1008e1 <printer::vprintf(char const*, __va_list_tag*)+0x38d>
        switch (*format) {
  100968:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  10096c:	eb 04                	jmp    100972 <printer::vprintf(char const*, __va_list_tag*)+0x41e>
  10096e:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            num = (uintptr_t) va_arg(val, void*);
  100972:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100976:	8b 01                	mov    (%rcx),%eax
  100978:	83 f8 2f             	cmp    $0x2f,%eax
  10097b:	77 22                	ja     10099f <printer::vprintf(char const*, __va_list_tag*)+0x44b>
  10097d:	89 c2                	mov    %eax,%edx
  10097f:	48 03 51 10          	add    0x10(%rcx),%rdx
  100983:	83 c0 08             	add    $0x8,%eax
  100986:	89 01                	mov    %eax,(%rcx)
  100988:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  10098b:	44 89 f0             	mov    %r14d,%eax
  10098e:	0d 41 02 00 00       	or     $0x241,%eax
            base = -16;
  100993:	c7 45 a0 f0 ff ff ff 	movl   $0xfffffff0,-0x60(%rbp)
  10099a:	e9 6f ff ff ff       	jmp    10090e <printer::vprintf(char const*, __va_list_tag*)+0x3ba>
            num = (uintptr_t) va_arg(val, void*);
  10099f:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1009a3:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1009a7:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1009ab:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1009af:	eb d7                	jmp    100988 <printer::vprintf(char const*, __va_list_tag*)+0x434>
        switch (*format) {
  1009b1:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1009b5:	eb 04                	jmp    1009bb <printer::vprintf(char const*, __va_list_tag*)+0x467>
  1009b7:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = va_arg(val, char*);
  1009bb:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1009bf:	8b 01                	mov    (%rcx),%eax
  1009c1:	83 f8 2f             	cmp    $0x2f,%eax
  1009c4:	0f 87 61 01 00 00    	ja     100b2b <printer::vprintf(char const*, __va_list_tag*)+0x5d7>
  1009ca:	89 c2                	mov    %eax,%edx
  1009cc:	48 03 51 10          	add    0x10(%rcx),%rdx
  1009d0:	83 c0 08             	add    $0x8,%eax
  1009d3:	89 01                	mov    %eax,(%rcx)
  1009d5:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  1009d8:	41 bb 00 00 00 00    	mov    $0x0,%r11d
        if (flags & FLAG_NUMERIC) {
  1009de:	44 89 f0             	mov    %r14d,%eax
  1009e1:	83 e0 40             	and    $0x40,%eax
  1009e4:	89 45 94             	mov    %eax,-0x6c(%rbp)
        const char* prefix = "";
  1009e7:	41 bc db 0f 10 00    	mov    $0x100fdb,%r12d
        if (flags & FLAG_NUMERIC) {
  1009ed:	0f 85 e9 03 00 00    	jne    100ddc <printer::vprintf(char const*, __va_list_tag*)+0x888>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  1009f3:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  1009f6:	89 d0                	mov    %edx,%eax
  1009f8:	f7 d0                	not    %eax
  1009fa:	c1 e8 1f             	shr    $0x1f,%eax
  1009fd:	89 45 90             	mov    %eax,-0x70(%rbp)
  100a00:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
  100a04:	0f 85 54 03 00 00    	jne    100d5e <printer::vprintf(char const*, __va_list_tag*)+0x80a>
  100a0a:	84 c0                	test   %al,%al
  100a0c:	0f 84 4c 03 00 00    	je     100d5e <printer::vprintf(char const*, __va_list_tag*)+0x80a>
            datalen = strnlen(data, precision);
  100a12:	48 63 f2             	movslq %edx,%rsi
  100a15:	48 89 df             	mov    %rbx,%rdi
  100a18:	e8 ed f9 ff ff       	call   10040a <strnlen>
  100a1d:	89 45 a0             	mov    %eax,-0x60(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  100a20:	44 89 f0             	mov    %r14d,%eax
  100a23:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  100a26:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  100a2d:	83 f8 42             	cmp    $0x42,%eax
  100a30:	0f 84 60 03 00 00    	je     100d96 <printer::vprintf(char const*, __va_list_tag*)+0x842>
        width -= datalen + zeros + strlen(prefix);
  100a36:	4c 89 e7             	mov    %r12,%rdi
  100a39:	e8 ad f9 ff ff       	call   1003eb <strlen>
  100a3e:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  100a41:	8b 7d a0             	mov    -0x60(%rbp),%edi
  100a44:	8d 0c 3a             	lea    (%rdx,%rdi,1),%ecx
  100a47:	44 89 ea             	mov    %r13d,%edx
  100a4a:	29 ca                	sub    %ecx,%edx
  100a4c:	29 c2                	sub    %eax,%edx
  100a4e:	41 89 d5             	mov    %edx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100a51:	41 f6 c6 04          	test   $0x4,%r14b
  100a55:	75 31                	jne    100a88 <printer::vprintf(char const*, __va_list_tag*)+0x534>
  100a57:	85 d2                	test   %edx,%edx
  100a59:	7e 2d                	jle    100a88 <printer::vprintf(char const*, __va_list_tag*)+0x534>
        width -= datalen + zeros + strlen(prefix);
  100a5b:	41 89 d6             	mov    %edx,%r14d
            putc(' ');
  100a5e:	49 8b 07             	mov    (%r15),%rax
  100a61:	be 20 00 00 00       	mov    $0x20,%esi
  100a66:	4c 89 ff             	mov    %r15,%rdi
  100a69:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100a6b:	41 83 ed 01          	sub    $0x1,%r13d
  100a6f:	45 85 ed             	test   %r13d,%r13d
  100a72:	7f ea                	jg     100a5e <printer::vprintf(char const*, __va_list_tag*)+0x50a>
  100a74:	44 89 f2             	mov    %r14d,%edx
  100a77:	45 85 f6             	test   %r14d,%r14d
  100a7a:	b8 01 00 00 00       	mov    $0x1,%eax
  100a7f:	41 0f 4f c6          	cmovg  %r14d,%eax
  100a83:	29 c2                	sub    %eax,%edx
  100a85:	41 89 d5             	mov    %edx,%r13d
        for (; *prefix; ++prefix) {
  100a88:	41 0f b6 04 24       	movzbl (%r12),%eax
  100a8d:	84 c0                	test   %al,%al
  100a8f:	74 18                	je     100aa9 <printer::vprintf(char const*, __va_list_tag*)+0x555>
            putc(*prefix);
  100a91:	0f b6 f0             	movzbl %al,%esi
  100a94:	49 8b 07             	mov    (%r15),%rax
  100a97:	4c 89 ff             	mov    %r15,%rdi
  100a9a:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  100a9c:	49 83 c4 01          	add    $0x1,%r12
  100aa0:	41 0f b6 04 24       	movzbl (%r12),%eax
  100aa5:	84 c0                	test   %al,%al
  100aa7:	75 e8                	jne    100a91 <printer::vprintf(char const*, __va_list_tag*)+0x53d>
        for (; zeros > 0; --zeros) {
  100aa9:	44 8b 65 a4          	mov    -0x5c(%rbp),%r12d
  100aad:	45 85 e4             	test   %r12d,%r12d
  100ab0:	7e 13                	jle    100ac5 <printer::vprintf(char const*, __va_list_tag*)+0x571>
            putc('0');
  100ab2:	49 8b 07             	mov    (%r15),%rax
  100ab5:	be 30 00 00 00       	mov    $0x30,%esi
  100aba:	4c 89 ff             	mov    %r15,%rdi
  100abd:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  100abf:	41 83 ec 01          	sub    $0x1,%r12d
  100ac3:	75 ed                	jne    100ab2 <printer::vprintf(char const*, __va_list_tag*)+0x55e>
        for (; datalen > 0; ++data, --datalen) {
  100ac5:	8b 45 a0             	mov    -0x60(%rbp),%eax
  100ac8:	85 c0                	test   %eax,%eax
  100aca:	7e 1a                	jle    100ae6 <printer::vprintf(char const*, __va_list_tag*)+0x592>
  100acc:	41 89 c6             	mov    %eax,%r14d
  100acf:	49 01 de             	add    %rbx,%r14
            putc(*data);
  100ad2:	0f b6 33             	movzbl (%rbx),%esi
  100ad5:	49 8b 07             	mov    (%r15),%rax
  100ad8:	4c 89 ff             	mov    %r15,%rdi
  100adb:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  100add:	48 83 c3 01          	add    $0x1,%rbx
  100ae1:	49 39 de             	cmp    %rbx,%r14
  100ae4:	75 ec                	jne    100ad2 <printer::vprintf(char const*, __va_list_tag*)+0x57e>
        for (; width > 0; --width) {
  100ae6:	45 85 ed             	test   %r13d,%r13d
  100ae9:	7e 13                	jle    100afe <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            putc(' ');
  100aeb:	49 8b 07             	mov    (%r15),%rax
  100aee:	be 20 00 00 00       	mov    $0x20,%esi
  100af3:	4c 89 ff             	mov    %r15,%rdi
  100af6:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  100af8:	41 83 ed 01          	sub    $0x1,%r13d
  100afc:	75 ed                	jne    100aeb <printer::vprintf(char const*, __va_list_tag*)+0x597>
    for (; *format; ++format) {
  100afe:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  100b02:	4c 8d 60 01          	lea    0x1(%rax),%r12
  100b06:	0f b6 40 01          	movzbl 0x1(%rax),%eax
  100b0a:	84 c0                	test   %al,%al
  100b0c:	0f 84 6c fa ff ff    	je     10057e <printer::vprintf(char const*, __va_list_tag*)+0x2a>
        if (*format != '%') {
  100b12:	3c 25                	cmp    $0x25,%al
  100b14:	0f 84 73 fa ff ff    	je     10058d <printer::vprintf(char const*, __va_list_tag*)+0x39>
            putc(*format);
  100b1a:	0f b6 f0             	movzbl %al,%esi
  100b1d:	49 8b 07             	mov    (%r15),%rax
  100b20:	4c 89 ff             	mov    %r15,%rdi
  100b23:	ff 10                	call   *(%rax)
            continue;
  100b25:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
  100b29:	eb d3                	jmp    100afe <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            data = va_arg(val, char*);
  100b2b:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100b2f:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100b33:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100b37:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100b3b:	e9 95 fe ff ff       	jmp    1009d5 <printer::vprintf(char const*, __va_list_tag*)+0x481>
        switch (*format) {
  100b40:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100b44:	eb 04                	jmp    100b4a <printer::vprintf(char const*, __va_list_tag*)+0x5f6>
  100b46:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            color_ = va_arg(val, int);
  100b4a:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100b4e:	8b 07                	mov    (%rdi),%eax
  100b50:	83 f8 2f             	cmp    $0x2f,%eax
  100b53:	77 13                	ja     100b68 <printer::vprintf(char const*, __va_list_tag*)+0x614>
  100b55:	89 c2                	mov    %eax,%edx
  100b57:	48 03 57 10          	add    0x10(%rdi),%rdx
  100b5b:	83 c0 08             	add    $0x8,%eax
  100b5e:	89 07                	mov    %eax,(%rdi)
  100b60:	8b 02                	mov    (%rdx),%eax
  100b62:	41 89 47 08          	mov    %eax,0x8(%r15)
            continue;
  100b66:	eb 96                	jmp    100afe <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            color_ = va_arg(val, int);
  100b68:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100b6c:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100b70:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100b74:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100b78:	eb e6                	jmp    100b60 <printer::vprintf(char const*, __va_list_tag*)+0x60c>
        switch (*format) {
  100b7a:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100b7e:	eb 04                	jmp    100b84 <printer::vprintf(char const*, __va_list_tag*)+0x630>
  100b80:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = va_arg(val, int);
  100b84:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100b88:	8b 01                	mov    (%rcx),%eax
  100b8a:	83 f8 2f             	cmp    $0x2f,%eax
  100b8d:	77 23                	ja     100bb2 <printer::vprintf(char const*, __va_list_tag*)+0x65e>
  100b8f:	89 c2                	mov    %eax,%edx
  100b91:	48 03 51 10          	add    0x10(%rcx),%rdx
  100b95:	83 c0 08             	add    $0x8,%eax
  100b98:	89 01                	mov    %eax,(%rcx)
  100b9a:	8b 02                	mov    (%rdx),%eax
  100b9c:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100b9f:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  100ba3:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100ba7:	41 bb 00 00 00 00    	mov    $0x0,%r11d
            break;
  100bad:	e9 2c fe ff ff       	jmp    1009de <printer::vprintf(char const*, __va_list_tag*)+0x48a>
            numbuf[0] = va_arg(val, int);
  100bb2:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100bb6:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100bba:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100bbe:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100bc2:	eb d6                	jmp    100b9a <printer::vprintf(char const*, __va_list_tag*)+0x646>
        switch (*format) {
  100bc4:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = (*format ? *format : '%');
  100bc8:	84 c0                	test   %al,%al
  100bca:	0f 85 ee 01 00 00    	jne    100dbe <printer::vprintf(char const*, __va_list_tag*)+0x86a>
  100bd0:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  100bd4:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  100bd8:	48 83 6d a8 01       	subq   $0x1,-0x58(%rbp)
            data = numbuf;
  100bdd:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100be1:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  100be7:	e9 f2 fd ff ff       	jmp    1009de <printer::vprintf(char const*, __va_list_tag*)+0x48a>
    *--pos = '\0';
  100bec:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100bf0:	41 f6 c6 20          	test   $0x20,%r14b
  100bf4:	74 73                	je     100c69 <printer::vprintf(char const*, __va_list_tag*)+0x715>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100bf6:	8b 55 a0             	mov    -0x60(%rbp),%edx
  100bf9:	41 89 d1             	mov    %edx,%r9d
  100bfc:	41 89 c6             	mov    %eax,%r14d
  100bff:	41 ba 90 17 10 00    	mov    $0x101790,%r10d
  100c05:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
  100c0c:	83 fa 0a             	cmp    $0xa,%edx
  100c0f:	0f 94 c0             	sete   %al
  100c12:	0f b6 c0             	movzbl %al,%eax
  100c15:	48 83 e8 04          	sub    $0x4,%rax
  100c19:	eb 1d                	jmp    100c38 <printer::vprintf(char const*, __va_list_tag*)+0x6e4>
    if (flags & FLAG_THOUSANDS) {
  100c1b:	41 89 c6             	mov    %eax,%r14d
        digits = lower_digits;
  100c1e:	41 ba 70 17 10 00    	mov    $0x101770,%r10d
        base = -base;
  100c24:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  100c2a:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100c31:	48 c7 c0 fc ff ff ff 	mov    $0xfffffffffffffffc,%rax
  100c38:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  100c3d:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  100c41:	4c 89 d8             	mov    %r11,%rax
            *--pos = digits[val % base];
  100c44:	49 63 f1             	movslq %r9d,%rsi
    } while (val != 0 && pos != buf);
  100c47:	4c 8d 45 b0          	lea    -0x50(%rbp),%r8
  100c4b:	eb 57                	jmp    100ca4 <printer::vprintf(char const*, __va_list_tag*)+0x750>
    if (flags & FLAG_THOUSANDS) {
  100c4d:	41 ba 90 17 10 00    	mov    $0x101790,%r10d
  100c53:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  100c59:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100c60:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  100c67:	eb cf                	jmp    100c38 <printer::vprintf(char const*, __va_list_tag*)+0x6e4>
  100c69:	44 8b 4d a0          	mov    -0x60(%rbp),%r9d
  100c6d:	41 89 c6             	mov    %eax,%r14d
  100c70:	41 ba 90 17 10 00    	mov    $0x101790,%r10d
  100c76:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = nullptr;
  100c7d:	bf 00 00 00 00       	mov    $0x0,%edi
  100c82:	eb b9                	jmp    100c3d <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
            *--pos = digits[val % base];
  100c84:	48 89 cb             	mov    %rcx,%rbx
  100c87:	ba 00 00 00 00       	mov    $0x0,%edx
  100c8c:	48 f7 f6             	div    %rsi
  100c8f:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
  100c94:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  100c96:	48 83 e9 01          	sub    $0x1,%rcx
  100c9a:	48 85 c0             	test   %rax,%rax
  100c9d:	74 2d                	je     100ccc <printer::vprintf(char const*, __va_list_tag*)+0x778>
  100c9f:	4c 39 c3             	cmp    %r8,%rbx
  100ca2:	74 28                	je     100ccc <printer::vprintf(char const*, __va_list_tag*)+0x778>
        if (pos == thousands_pos) {
  100ca4:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  100ca8:	48 39 d7             	cmp    %rdx,%rdi
  100cab:	75 d7                	jne    100c84 <printer::vprintf(char const*, __va_list_tag*)+0x730>
            *--pos = base == 10 ? ',' : '\'';
  100cad:	48 89 cb             	mov    %rcx,%rbx
  100cb0:	41 83 f9 0a          	cmp    $0xa,%r9d
  100cb4:	0f 94 c2             	sete   %dl
  100cb7:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  100cbb:	40 0f 94 c7          	sete   %dil
  100cbf:	40 0f b6 ff          	movzbl %dil,%edi
  100cc3:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  100cc5:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  100cca:	eb ca                	jmp    100c96 <printer::vprintf(char const*, __va_list_tag*)+0x742>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  100ccc:	44 89 f0             	mov    %r14d,%eax
  100ccf:	f7 d0                	not    %eax
  100cd1:	a8 c0                	test   $0xc0,%al
  100cd3:	75 3b                	jne    100d10 <printer::vprintf(char const*, __va_list_tag*)+0x7bc>
                prefix = "-";
  100cd5:	41 bc d8 0f 10 00    	mov    $0x100fd8,%r12d
            if (flags & FLAG_NEGATIVE) {
  100cdb:	41 f7 c6 00 01 00 00 	test   $0x100,%r14d
  100ce2:	0f 85 0b fd ff ff    	jne    1009f3 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                prefix = "+";
  100ce8:	41 bc d3 0f 10 00    	mov    $0x100fd3,%r12d
            } else if (flags & FLAG_PLUSPOSITIVE) {
  100cee:	41 f6 c6 10          	test   $0x10,%r14b
  100cf2:	0f 85 fb fc ff ff    	jne    1009f3 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
        const char* prefix = "";
  100cf8:	41 f6 c6 08          	test   $0x8,%r14b
  100cfc:	41 bc da 0f 10 00    	mov    $0x100fda,%r12d
  100d02:	b8 db 0f 10 00       	mov    $0x100fdb,%eax
  100d07:	4c 0f 44 e0          	cmove  %rax,%r12
  100d0b:	e9 e3 fc ff ff       	jmp    1009f3 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
  100d10:	41 bc db 0f 10 00    	mov    $0x100fdb,%r12d
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100d16:	44 89 f0             	mov    %r14d,%eax
  100d19:	f7 d0                	not    %eax
  100d1b:	a8 41                	test   $0x41,%al
  100d1d:	0f 85 d0 fc ff ff    	jne    1009f3 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                   && (base == 16 || base == -16)
  100d23:	8b 45 a0             	mov    -0x60(%rbp),%eax
  100d26:	83 c0 10             	add    $0x10,%eax
  100d29:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  100d2e:	0f 85 bf fc ff ff    	jne    1009f3 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                   && (num || (flags & FLAG_ALT2))) {
  100d34:	4d 85 db             	test   %r11,%r11
  100d37:	75 0d                	jne    100d46 <printer::vprintf(char const*, __va_list_tag*)+0x7f2>
  100d39:	41 f7 c6 00 02 00 00 	test   $0x200,%r14d
  100d40:	0f 84 ad fc ff ff    	je     1009f3 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
            prefix = (base == -16 ? "0x" : "0X");
  100d46:	83 7d a0 f0          	cmpl   $0xfffffff0,-0x60(%rbp)
  100d4a:	41 bc d5 0f 10 00    	mov    $0x100fd5,%r12d
  100d50:	b8 dc 0f 10 00       	mov    $0x100fdc,%eax
  100d55:	4c 0f 44 e0          	cmove  %rax,%r12
  100d59:	e9 95 fc ff ff       	jmp    1009f3 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
            datalen = strlen(data);
  100d5e:	48 89 df             	mov    %rbx,%rdi
  100d61:	e8 85 f6 ff ff       	call   1003eb <strlen>
  100d66:	89 45 a0             	mov    %eax,-0x60(%rbp)
            && precision >= 0) {
  100d69:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
  100d6d:	0f 84 ad fc ff ff    	je     100a20 <printer::vprintf(char const*, __va_list_tag*)+0x4cc>
  100d73:	80 7d 90 00          	cmpb   $0x0,-0x70(%rbp)
  100d77:	0f 84 a3 fc ff ff    	je     100a20 <printer::vprintf(char const*, __va_list_tag*)+0x4cc>
            zeros = precision > datalen ? precision - datalen : 0;
  100d7d:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  100d80:	89 fa                	mov    %edi,%edx
  100d82:	29 c2                	sub    %eax,%edx
  100d84:	39 c7                	cmp    %eax,%edi
  100d86:	b8 00 00 00 00       	mov    $0x0,%eax
  100d8b:	0f 4f c2             	cmovg  %edx,%eax
  100d8e:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100d91:	e9 a0 fc ff ff       	jmp    100a36 <printer::vprintf(char const*, __va_list_tag*)+0x4e2>
                   && datalen + (int) strlen(prefix) < width) {
  100d96:	4c 89 e7             	mov    %r12,%rdi
  100d99:	e8 4d f6 ff ff       	call   1003eb <strlen>
  100d9e:	8b 7d a0             	mov    -0x60(%rbp),%edi
  100da1:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  100da4:	44 89 e9             	mov    %r13d,%ecx
  100da7:	29 f9                	sub    %edi,%ecx
  100da9:	29 c1                	sub    %eax,%ecx
  100dab:	44 39 ea             	cmp    %r13d,%edx
  100dae:	b8 00 00 00 00       	mov    $0x0,%eax
  100db3:	0f 4c c1             	cmovl  %ecx,%eax
  100db6:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100db9:	e9 78 fc ff ff       	jmp    100a36 <printer::vprintf(char const*, __va_list_tag*)+0x4e2>
  100dbe:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
            numbuf[0] = (*format ? *format : '%');
  100dc2:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100dc5:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
  100dc9:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = numbuf;
  100dcd:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100dd1:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  100dd7:	e9 02 fc ff ff       	jmp    1009de <printer::vprintf(char const*, __va_list_tag*)+0x48a>
    *--pos = '\0';
  100ddc:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100de0:	41 f6 c6 20          	test   $0x20,%r14b
  100de4:	0f 85 63 fe ff ff    	jne    100c4d <printer::vprintf(char const*, __va_list_tag*)+0x6f9>
  100dea:	41 ba 90 17 10 00    	mov    $0x101790,%r10d
  100df0:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  100df6:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
        thousands_pos = nullptr;
  100dfd:	bf 00 00 00 00       	mov    $0x0,%edi
  100e02:	e9 36 fe ff ff       	jmp    100c3d <printer::vprintf(char const*, __va_list_tag*)+0x6e9>

0000000000100e07 <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  100e07:	f3 0f 1e fa          	endbr64
  100e0b:	55                   	push   %rbp
  100e0c:	48 89 e5             	mov    %rsp,%rbp
  100e0f:	53                   	push   %rbx
  100e10:	48 83 ec 38          	sub    $0x38,%rsp
  100e14:	48 89 f3             	mov    %rsi,%rbx
  100e17:	48 89 d6             	mov    %rdx,%rsi
  100e1a:	48 89 ca             	mov    %rcx,%rdx
void console_printf(const char* format, ...);


// Generic print library

struct printer {
  100e1d:	c7 45 d0 00 07 00 00 	movl   $0x700,-0x30(%rbp)
        : s_(s), end_(s + size), n_(0) {
  100e24:	48 c7 45 c8 b8 17 10 	movq   $0x1017b8,-0x38(%rbp)
  100e2b:	00 
  100e2c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  100e30:	48 01 df             	add    %rbx,%rdi
  100e33:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  100e37:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  100e3e:	00 
    string_printer sp(s, size);
    sp.vprintf(format, val);
  100e3f:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100e43:	e8 0c f7 ff ff       	call   100554 <printer::vprintf(char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  100e48:	48 85 db             	test   %rbx,%rbx
  100e4b:	74 10                	je     100e5d <vsnprintf+0x56>
  100e4d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  100e51:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  100e55:	48 39 c2             	cmp    %rax,%rdx
  100e58:	73 0d                	jae    100e67 <vsnprintf+0x60>
        *sp.s_ = 0;
  100e5a:	c6 02 00             	movb   $0x0,(%rdx)
    } else if (size) {
        sp.end_[-1] = 0;
    }
    return sp.n_;
}
  100e5d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  100e61:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  100e65:	c9                   	leave
  100e66:	c3                   	ret
        sp.end_[-1] = 0;
  100e67:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
  100e6b:	eb f0                	jmp    100e5d <vsnprintf+0x56>

0000000000100e6d <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  100e6d:	f3 0f 1e fa          	endbr64
  100e71:	55                   	push   %rbp
  100e72:	48 89 e5             	mov    %rsp,%rbp
  100e75:	48 83 ec 50          	sub    $0x50,%rsp
  100e79:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100e7d:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100e81:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  100e85:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  100e8c:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100e90:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100e94:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100e98:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  100e9c:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100ea0:	e8 62 ff ff ff       	call   100e07 <vsnprintf>
    va_end(val);
    return n;
  100ea5:	48 98                	cltq
}
  100ea7:	c9                   	leave
  100ea8:	c3                   	ret

0000000000100ea9 <assert_fail(char const*, int, char const*, char const*)>:
void error_vprintf(int cpos, int color, const char* format, va_list val) {
    console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  100ea9:	f3 0f 1e fa          	endbr64
  100ead:	55                   	push   %rbp
  100eae:	48 89 e5             	mov    %rsp,%rbp
  100eb1:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  100eb8:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  100ebb:	c7 05 37 81 fb ff 30 	movl   $0x730,-0x47ec9(%rip)        # b8ffc <cursorpos>
  100ec2:	07 00 00 
    char buf[240];
    if (description) {
  100ec5:	48 85 c9             	test   %rcx,%rcx
  100ec8:	74 39                	je     100f03 <assert_fail(char const*, int, char const*, char const*)+0x5a>
  100eca:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  100ecd:	48 83 ec 08          	sub    $0x8,%rsp
  100ed1:	52                   	push   %rdx
  100ed2:	56                   	push   %rsi
  100ed3:	57                   	push   %rdi
  100ed4:	48 89 f9             	mov    %rdi,%rcx
  100ed7:	ba 58 10 10 00       	mov    $0x101058,%edx
  100edc:	be f0 00 00 00       	mov    $0xf0,%esi
  100ee1:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100ee8:	b0 00                	mov    $0x0,%al
  100eea:	e8 7e ff ff ff       	call   100e6d <snprintf>
  100eef:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  100ef3:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  100ef8:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100eff:	0f 05                	syscall
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  100f01:	eb fe                	jmp    100f01 <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  100f03:	49 89 d1             	mov    %rdx,%r9
  100f06:	48 89 f9             	mov    %rdi,%rcx
  100f09:	ba 88 10 10 00       	mov    $0x101088,%edx
  100f0e:	be f0 00 00 00       	mov    $0xf0,%esi
  100f13:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100f1a:	b0 00                	mov    $0x0,%al
  100f1c:	e8 4c ff ff ff       	call   100e6d <snprintf>
  100f21:	eb d0                	jmp    100ef3 <assert_fail(char const*, int, char const*, char const*)+0x4a>

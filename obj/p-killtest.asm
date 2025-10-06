
obj/p-killtest.full:     file format elf64-x86-64


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
  100010:	bf 60 0f 10 00       	mov    $0x100f60,%edi
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
  10004a:	eb 59                	jmp    1000a5 <process_main()+0x8c>
        assert(pagemark[i] == 0);
  10004c:	b9 00 00 00 00       	mov    $0x0,%ecx
  100051:	ba 7c 0f 10 00       	mov    $0x100f7c,%edx
  100056:	be 10 00 00 00       	mov    $0x10,%esi
  10005b:	bf 8d 0f 10 00       	mov    $0x100f8d,%edi
  100060:	e8 7c 0e 00 00       	call   100ee1 <assert_fail(char const*, int, char const*, char const*)>
    while (true) {
        int x = rand(0, ALLOC_SLOWDOWN);
        if (x == 0) {
            // forking a new process
            pid_t p = sys_fork();
            assert(p < PID_MAX);
  100065:	b9 00 00 00 00       	mov    $0x0,%ecx
  10006a:	ba 9b 0f 10 00       	mov    $0x100f9b,%edx
  10006f:	be 18 00 00 00       	mov    $0x18,%esi
  100074:	bf 8d 0f 10 00       	mov    $0x100f8d,%edi
  100079:	e8 63 0e 00 00       	call   100ee1 <assert_fail(char const*, int, char const*, char const*)>
            // deciding actions of parent or child
            int choice = rand(0, 3);
            if (choice == 0 && p > 0) {
                int result = sys_kill(p);
                assert(result == 0);
            } else if (choice == 1 && p > 0) {
  10007e:	83 f8 01             	cmp    $0x1,%eax
  100081:	75 04                	jne    100087 <process_main()+0x6e>
  100083:	84 d2                	test   %dl,%dl
  100085:	75 12                	jne    100099 <process_main()+0x80>
                sys_exit();
            } else if (choice == 2 && p == 0) {
  100087:	83 f8 02             	cmp    $0x2,%eax
  10008a:	75 04                	jne    100090 <process_main()+0x77>
  10008c:	85 db                	test   %ebx,%ebx
  10008e:	74 77                	je     100107 <process_main()+0xee>
    register uintptr_t rax asm("rax") = syscallno;
  100090:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  100095:	0f 05                	syscall
}
  100097:	eb 0c                	jmp    1000a5 <process_main()+0x8c>
                sys_exit();
  100099:	e8 62 ff ff ff       	call   100000 <sys_exit()>
    register uintptr_t rax asm("rax") = syscallno;
  10009e:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  1000a3:	0f 05                	syscall
        int x = rand(0, ALLOC_SLOWDOWN);
  1000a5:	be 12 00 00 00       	mov    $0x12,%esi
  1000aa:	bf 00 00 00 00       	mov    $0x0,%edi
  1000af:	e8 4e 04 00 00       	call   100502 <rand(int, int)>
        if (x == 0) {
  1000b4:	85 c0                	test   %eax,%eax
  1000b6:	75 e6                	jne    10009e <process_main()+0x85>
    register uintptr_t rax asm("rax") = syscallno;
  1000b8:	b8 05 00 00 00       	mov    $0x5,%eax
    asm volatile ("syscall"
  1000bd:	0f 05                	syscall
    return rax;
  1000bf:	48 89 c3             	mov    %rax,%rbx
            assert(p < PID_MAX);
  1000c2:	83 f8 0f             	cmp    $0xf,%eax
  1000c5:	7f 9e                	jg     100065 <process_main()+0x4c>
            int choice = rand(0, 3);
  1000c7:	be 03 00 00 00       	mov    $0x3,%esi
  1000cc:	bf 00 00 00 00       	mov    $0x0,%edi
  1000d1:	e8 2c 04 00 00       	call   100502 <rand(int, int)>
            if (choice == 0 && p > 0) {
  1000d6:	85 db                	test   %ebx,%ebx
  1000d8:	0f 9f c2             	setg   %dl
  1000db:	85 c0                	test   %eax,%eax
  1000dd:	75 9f                	jne    10007e <process_main()+0x65>
  1000df:	84 d2                	test   %dl,%dl
  1000e1:	74 9b                	je     10007e <process_main()+0x65>
    register uintptr_t rax asm("rax") = syscallno;
  1000e3:	b8 08 00 00 00       	mov    $0x8,%eax
    asm volatile ("syscall"
  1000e8:	0f 05                	syscall
                assert(result == 0);
  1000ea:	85 c0                	test   %eax,%eax
  1000ec:	74 b7                	je     1000a5 <process_main()+0x8c>
  1000ee:	b9 00 00 00 00       	mov    $0x0,%ecx
  1000f3:	ba a7 0f 10 00       	mov    $0x100fa7,%edx
  1000f8:	be 1e 00 00 00       	mov    $0x1e,%esi
  1000fd:	bf 8d 0f 10 00       	mov    $0x100f8d,%edi
  100102:	e8 da 0d 00 00       	call   100ee1 <assert_fail(char const*, int, char const*, char const*)>
        } else {
            sys_yield();
        }
    }
    // malloc proccesses
    int speed = rand(1, 16);
  100107:	be 10 00 00 00       	mov    $0x10,%esi
  10010c:	bf 01 00 00 00       	mov    $0x1,%edi
  100111:	e8 ec 03 00 00       	call   100502 <rand(int, int)>
  100116:	89 c3                	mov    %eax,%ebx
    register uintptr_t rax asm("rax") = syscallno;
  100118:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  10011d:	0f 05                	syscall
    return make_syscall(SYSCALL_GETPID);
  10011f:	41 89 c5             	mov    %eax,%r13d
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  100122:	41 bc 1b 40 10 00    	mov    $0x10401b,%r12d
    pid_t self = sys_getpid();
    // calculating heap and stack ranges
    uint8_t* heap_bottom = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  100128:	49 81 e4 00 f0 ff ff 	and    $0xfffffffffffff000,%r12
    heap_top = heap_bottom;
  10012f:	4c 89 25 d2 2e 00 00 	mov    %r12,0x2ed2(%rip)        # 103008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  100136:	48 89 e0             	mov    %rsp,%rax
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  100139:	48 83 e8 01          	sub    $0x1,%rax
  10013d:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  100143:	48 89 05 b6 2e 00 00 	mov    %rax,0x2eb6(%rip)        # 103000 <stack_bottom>
    unsigned nalloc = 0;
    // Allocate heap pages until out of address space,
    // forking along the way.
    while (heap_top != stack_bottom) {
  10014a:	4c 39 e0             	cmp    %r12,%rax
  10014d:	0f 84 90 02 00 00    	je     1003e3 <process_main()+0x3ca>
    unsigned nalloc = 0;
  100153:	41 be 00 00 00 00    	mov    $0x0,%r14d
  100159:	eb 34                	jmp    10018f <process_main()+0x176>
        if (x >= 8 * speed) {
            if (x % 4 < 2 && heap_top != heap_bottom) {
                unsigned pn = rand(0, (heap_top - heap_bottom - 1) / PAGESIZE);
                if (pn < sizeof(pagemark)) {
                    volatile uint8_t* addr = heap_bottom + pn * PAGESIZE;
                    assert(*addr == pagemark[pn]);
  10015b:	b9 00 00 00 00       	mov    $0x0,%ecx
  100160:	ba b3 0f 10 00       	mov    $0x100fb3,%edx
  100165:	be 3b 00 00 00       	mov    $0x3b,%esi
  10016a:	bf 8d 0f 10 00       	mov    $0x100f8d,%edi
  10016f:	e8 6d 0d 00 00       	call   100ee1 <assert_fail(char const*, int, char const*, char const*)>
    register uintptr_t rax asm("rax") = syscallno;
  100174:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  100179:	0f 05                	syscall
    while (heap_top != stack_bottom) {
  10017b:	48 8b 05 7e 2e 00 00 	mov    0x2e7e(%rip),%rax        # 103000 <stack_bottom>
  100182:	48 39 05 7f 2e 00 00 	cmp    %rax,0x2e7f(%rip)        # 103008 <heap_top>
  100189:	0f 84 54 02 00 00    	je     1003e3 <process_main()+0x3ca>
        int x = rand(0, 6 * ALLOC_SLOWDOWN);
  10018f:	be 6c 00 00 00       	mov    $0x6c,%esi
  100194:	bf 00 00 00 00       	mov    $0x0,%edi
  100199:	e8 64 03 00 00       	call   100502 <rand(int, int)>
        if (x >= 8 * speed) {
  10019e:	8d 14 dd 00 00 00 00 	lea    0x0(,%rbx,8),%edx
  1001a5:	39 c2                	cmp    %eax,%edx
  1001a7:	0f 8f 8b 00 00 00    	jg     100238 <process_main()+0x21f>
            if (x % 4 < 2 && heap_top != heap_bottom) {
  1001ad:	99                   	cltd
  1001ae:	c1 ea 1e             	shr    $0x1e,%edx
  1001b1:	01 d0                	add    %edx,%eax
  1001b3:	83 e0 03             	and    $0x3,%eax
  1001b6:	29 d0                	sub    %edx,%eax
  1001b8:	83 f8 01             	cmp    $0x1,%eax
  1001bb:	7f b7                	jg     100174 <process_main()+0x15b>
  1001bd:	48 8b 05 44 2e 00 00 	mov    0x2e44(%rip),%rax        # 103008 <heap_top>
  1001c4:	4c 39 e0             	cmp    %r12,%rax
  1001c7:	74 ab                	je     100174 <process_main()+0x15b>
                unsigned pn = rand(0, (heap_top - heap_bottom - 1) / PAGESIZE);
  1001c9:	4c 29 e0             	sub    %r12,%rax
  1001cc:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  1001d0:	48 c1 ee 0c          	shr    $0xc,%rsi
  1001d4:	bf 00 00 00 00       	mov    $0x0,%edi
  1001d9:	e8 24 03 00 00       	call   100502 <rand(int, int)>
                if (pn < sizeof(pagemark)) {
  1001de:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  1001e3:	77 8f                	ja     100174 <process_main()+0x15b>
                    volatile uint8_t* addr = heap_bottom + pn * PAGESIZE;
  1001e5:	89 c1                	mov    %eax,%ecx
  1001e7:	48 89 ca             	mov    %rcx,%rdx
  1001ea:	48 c1 e2 0c          	shl    $0xc,%rdx
  1001ee:	4c 01 e2             	add    %r12,%rdx
                    assert(*addr == pagemark[pn]);
  1001f1:	0f b6 32             	movzbl (%rdx),%esi
  1001f4:	0f b6 89 00 20 10 00 	movzbl 0x102000(%rcx),%ecx
  1001fb:	40 38 ce             	cmp    %cl,%sil
  1001fe:	0f 85 57 ff ff ff    	jne    10015b <process_main()+0x142>
                    pagemark[pn] = self;
  100204:	89 c0                	mov    %eax,%eax
  100206:	44 88 a8 00 20 10 00 	mov    %r13b,0x102000(%rax)
                    *addr = self;
  10020d:	44 88 2a             	mov    %r13b,(%rdx)
                    assert(*addr == self);
  100210:	0f b6 02             	movzbl (%rdx),%eax
  100213:	0f b6 c0             	movzbl %al,%eax
  100216:	44 39 e8             	cmp    %r13d,%eax
  100219:	0f 84 55 ff ff ff    	je     100174 <process_main()+0x15b>
  10021f:	b9 00 00 00 00       	mov    $0x0,%ecx
  100224:	ba c9 0f 10 00       	mov    $0x100fc9,%edx
  100229:	be 3e 00 00 00       	mov    $0x3e,%esi
  10022e:	bf 8d 0f 10 00       	mov    $0x100f8d,%edi
  100233:	e8 a9 0c 00 00       	call   100ee1 <assert_fail(char const*, int, char const*, char const*)>
            }
            sys_yield();
            continue;
        }

        x = rand(0, 7 + min(nalloc / 4, 10U));
  100238:	44 89 f6             	mov    %r14d,%esi
  10023b:	c1 ee 02             	shr    $0x2,%esi
    return a < b ? a : b;
  10023e:	b8 0a 00 00 00       	mov    $0xa,%eax
  100243:	39 c6                	cmp    %eax,%esi
  100245:	0f 47 f0             	cmova  %eax,%esi
  100248:	83 c6 07             	add    $0x7,%esi
  10024b:	bf 00 00 00 00       	mov    $0x0,%edi
  100250:	e8 ad 02 00 00       	call   100502 <rand(int, int)>
        if (x < 2) {
  100255:	83 f8 01             	cmp    $0x1,%eax
  100258:	7e 32                	jle    10028c <process_main()+0x273>
                speed = rand(1, 16);
            } else {
                int result = sys_kill(p);
                assert(result == 0 || result == -1); 
            }
        } else if (x < 3) {
  10025a:	83 f8 02             	cmp    $0x2,%eax
  10025d:	0f 8e bf 00 00 00    	jle    100322 <process_main()+0x309>
    register uintptr_t rax asm("rax") = syscallno;
  100263:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  100268:	48 8b 3d 99 2d 00 00 	mov    0x2d99(%rip),%rdi        # 103008 <heap_top>
  10026f:	0f 05                	syscall
            pid_t target_pid = rand(1, PID_MAX - 1);
            if (target_pid != self) {
                int result = sys_kill(target_pid);
                assert(result == 0 || result == -1); 
            }
        } else if (sys_page_alloc((void*) heap_top) >= 0) {
  100271:	85 c0                	test   %eax,%eax
  100273:	0f 89 ed 00 00 00    	jns    100366 <process_main()+0x34d>
                pagemark[pn] = speed;
            }
            // update `heap_top`
            heap_top += PAGESIZE;
            nalloc = (heap_top - heap_bottom) / PAGESIZE;
        } else if (nalloc < 4) {
  100279:	41 83 fe 03          	cmp    $0x3,%r14d
  10027d:	0f 86 5b 01 00 00    	jbe    1003de <process_main()+0x3c5>
            sys_exit();
        } else {
            nalloc -= 4;
  100283:	41 83 ee 04          	sub    $0x4,%r14d
  100287:	e9 ef fe ff ff       	jmp    10017b <process_main()+0x162>
    register uintptr_t rax asm("rax") = syscallno;
  10028c:	b8 05 00 00 00       	mov    $0x5,%eax
    asm volatile ("syscall"
  100291:	0f 05                	syscall
            assert(p < PID_MAX);
  100293:	83 f8 0f             	cmp    $0xf,%eax
  100296:	7f 2c                	jg     1002c4 <process_main()+0x2ab>
            if (p == 0) {
  100298:	85 c0                	test   %eax,%eax
  10029a:	75 5a                	jne    1002f6 <process_main()+0x2dd>
    register uintptr_t rax asm("rax") = syscallno;
  10029c:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  1002a1:	0f 05                	syscall
    return rax;
  1002a3:	49 89 c7             	mov    %rax,%r15
                assert(new_self != self);
  1002a6:	44 39 e8             	cmp    %r13d,%eax
  1002a9:	74 32                	je     1002dd <process_main()+0x2c4>
                speed = rand(1, 16);
  1002ab:	be 10 00 00 00       	mov    $0x10,%esi
  1002b0:	bf 01 00 00 00       	mov    $0x1,%edi
  1002b5:	e8 48 02 00 00       	call   100502 <rand(int, int)>
  1002ba:	89 c3                	mov    %eax,%ebx
                self = new_self;
  1002bc:	45 89 fd             	mov    %r15d,%r13d
  1002bf:	e9 b7 fe ff ff       	jmp    10017b <process_main()+0x162>
            assert(p < PID_MAX);
  1002c4:	b9 00 00 00 00       	mov    $0x0,%ecx
  1002c9:	ba 9b 0f 10 00       	mov    $0x100f9b,%edx
  1002ce:	be 49 00 00 00       	mov    $0x49,%esi
  1002d3:	bf 8d 0f 10 00       	mov    $0x100f8d,%edi
  1002d8:	e8 04 0c 00 00       	call   100ee1 <assert_fail(char const*, int, char const*, char const*)>
                assert(new_self != self);
  1002dd:	b9 00 00 00 00       	mov    $0x0,%ecx
  1002e2:	ba d7 0f 10 00       	mov    $0x100fd7,%edx
  1002e7:	be 4c 00 00 00       	mov    $0x4c,%esi
  1002ec:	bf 8d 0f 10 00       	mov    $0x100f8d,%edi
  1002f1:	e8 eb 0b 00 00       	call   100ee1 <assert_fail(char const*, int, char const*, char const*)>
    register uintptr_t rax asm("rax") = syscallno;
  1002f6:	b8 08 00 00 00       	mov    $0x8,%eax
    asm volatile ("syscall"
  1002fb:	0f 05                	syscall
                assert(result == 0 || result == -1); 
  1002fd:	83 c0 01             	add    $0x1,%eax
  100300:	83 f8 01             	cmp    $0x1,%eax
  100303:	0f 86 72 fe ff ff    	jbe    10017b <process_main()+0x162>
  100309:	b9 00 00 00 00       	mov    $0x0,%ecx
  10030e:	ba e8 0f 10 00       	mov    $0x100fe8,%edx
  100313:	be 51 00 00 00       	mov    $0x51,%esi
  100318:	bf 8d 0f 10 00       	mov    $0x100f8d,%edi
  10031d:	e8 bf 0b 00 00       	call   100ee1 <assert_fail(char const*, int, char const*, char const*)>
            pid_t target_pid = rand(1, PID_MAX - 1);
  100322:	be 0f 00 00 00       	mov    $0xf,%esi
  100327:	bf 01 00 00 00       	mov    $0x1,%edi
  10032c:	e8 d1 01 00 00       	call   100502 <rand(int, int)>
            if (target_pid != self) {
  100331:	44 39 e8             	cmp    %r13d,%eax
  100334:	0f 84 41 fe ff ff    	je     10017b <process_main()+0x162>
    register uintptr_t rax asm("rax") = syscallno;
  10033a:	b8 08 00 00 00       	mov    $0x8,%eax
    asm volatile ("syscall"
  10033f:	0f 05                	syscall
                assert(result == 0 || result == -1); 
  100341:	83 c0 01             	add    $0x1,%eax
  100344:	83 f8 01             	cmp    $0x1,%eax
  100347:	0f 86 2e fe ff ff    	jbe    10017b <process_main()+0x162>
  10034d:	b9 00 00 00 00       	mov    $0x0,%ecx
  100352:	ba e8 0f 10 00       	mov    $0x100fe8,%edx
  100357:	be 58 00 00 00       	mov    $0x58,%esi
  10035c:	bf 8d 0f 10 00       	mov    $0x100f8d,%edi
  100361:	e8 7b 0b 00 00       	call   100ee1 <assert_fail(char const*, int, char const*, char const*)>
            for (unsigned long* l = (unsigned long*) heap_top;
  100366:	48 8b 0d 9b 2c 00 00 	mov    0x2c9b(%rip),%rcx        # 103008 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  10036d:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  100374:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  100377:	48 83 38 00          	cmpq   $0x0,(%rax)
  10037b:	75 48                	jne    1003c5 <process_main()+0x3ac>
            for (unsigned long* l = (unsigned long*) heap_top;
  10037d:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  100381:	48 39 d0             	cmp    %rdx,%rax
  100384:	75 f1                	jne    100377 <process_main()+0x35e>
            *heap_top = speed;
  100386:	88 19                	mov    %bl,(%rcx)
            unsigned pn = (heap_top - heap_bottom) / PAGESIZE;
  100388:	48 8b 05 79 2c 00 00 	mov    0x2c79(%rip),%rax        # 103008 <heap_top>
  10038f:	48 89 c2             	mov    %rax,%rdx
  100392:	4c 29 e2             	sub    %r12,%rdx
  100395:	48 c1 ea 0c          	shr    $0xc,%rdx
            if (pn < sizeof(pagemark)) {
  100399:	81 fa ff 0f 00 00    	cmp    $0xfff,%edx
  10039f:	77 08                	ja     1003a9 <process_main()+0x390>
                pagemark[pn] = speed;
  1003a1:	89 d2                	mov    %edx,%edx
  1003a3:	88 9a 00 20 10 00    	mov    %bl,0x102000(%rdx)
            heap_top += PAGESIZE;
  1003a9:	48 05 00 10 00 00    	add    $0x1000,%rax
  1003af:	48 89 05 52 2c 00 00 	mov    %rax,0x2c52(%rip)        # 103008 <heap_top>
            nalloc = (heap_top - heap_bottom) / PAGESIZE;
  1003b6:	4c 29 e0             	sub    %r12,%rax
  1003b9:	49 89 c6             	mov    %rax,%r14
  1003bc:	49 c1 ee 0c          	shr    $0xc,%r14
  1003c0:	e9 b6 fd ff ff       	jmp    10017b <process_main()+0x162>
                assert(*l == 0);
  1003c5:	b9 00 00 00 00       	mov    $0x0,%ecx
  1003ca:	ba 04 10 10 00       	mov    $0x101004,%edx
  1003cf:	be 5f 00 00 00       	mov    $0x5f,%esi
  1003d4:	bf 8d 0f 10 00       	mov    $0x100f8d,%edi
  1003d9:	e8 03 0b 00 00       	call   100ee1 <assert_fail(char const*, int, char const*, char const*)>
            sys_exit();
  1003de:	e8 1d fc ff ff       	call   100000 <sys_exit()>
        }
    }
// After running out of memory
    while (true) {
        if (rand(0, 2 * ALLOC_SLOWDOWN - 1) == 0) {
  1003e3:	be 23 00 00 00       	mov    $0x23,%esi
  1003e8:	bf 00 00 00 00       	mov    $0x0,%edi
  1003ed:	e8 10 01 00 00       	call   100502 <rand(int, int)>
  1003f2:	85 c0                	test   %eax,%eax
  1003f4:	74 09                	je     1003ff <process_main()+0x3e6>
    register uintptr_t rax asm("rax") = syscallno;
  1003f6:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  1003fb:	0f 05                	syscall
}
  1003fd:	eb e4                	jmp    1003e3 <process_main()+0x3ca>
            sys_exit();
  1003ff:	e8 fc fb ff ff       	call   100000 <sys_exit()>

0000000000100404 <string_printer::putc(unsigned char)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c) override {
  100404:	f3 0f 1e fa          	endbr64
        if (s_ < end_) {
  100408:	48 8b 47 10          	mov    0x10(%rdi),%rax
  10040c:	48 3b 47 18          	cmp    0x18(%rdi),%rax
  100410:	73 0b                	jae    10041d <string_printer::putc(unsigned char)+0x19>
            *s_++ = c;
  100412:	48 8d 50 01          	lea    0x1(%rax),%rdx
  100416:	48 89 57 10          	mov    %rdx,0x10(%rdi)
  10041a:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  10041d:	48 83 47 20 01       	addq   $0x1,0x20(%rdi)
    }
  100422:	c3                   	ret

0000000000100423 <strlen>:
size_t strlen(const char* s) {
  100423:	f3 0f 1e fa          	endbr64
    for (n = 0; *s != '\0'; ++s) {
  100427:	80 3f 00             	cmpb   $0x0,(%rdi)
  10042a:	74 10                	je     10043c <strlen+0x19>
  10042c:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  100431:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  100435:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  100439:	75 f6                	jne    100431 <strlen+0xe>
  10043b:	c3                   	ret
  10043c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100441:	c3                   	ret

0000000000100442 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  100442:	f3 0f 1e fa          	endbr64
  100446:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  100449:	ba 00 00 00 00       	mov    $0x0,%edx
  10044e:	48 85 f6             	test   %rsi,%rsi
  100451:	74 10                	je     100463 <strnlen+0x21>
  100453:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  100457:	74 0b                	je     100464 <strnlen+0x22>
        ++n;
  100459:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  10045d:	48 39 d0             	cmp    %rdx,%rax
  100460:	75 f1                	jne    100453 <strnlen+0x11>
  100462:	c3                   	ret
  100463:	c3                   	ret
  100464:	48 89 d0             	mov    %rdx,%rax
}
  100467:	c3                   	ret

0000000000100468 <strchr>:
char* strchr(const char* s, int c) {
  100468:	f3 0f 1e fa          	endbr64
    while (*s != '\0' && *s != (char) c) {
  10046c:	0f b6 07             	movzbl (%rdi),%eax
  10046f:	84 c0                	test   %al,%al
  100471:	74 10                	je     100483 <strchr+0x1b>
  100473:	40 38 f0             	cmp    %sil,%al
  100476:	74 18                	je     100490 <strchr+0x28>
        ++s;
  100478:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  10047c:	0f b6 07             	movzbl (%rdi),%eax
  10047f:	84 c0                	test   %al,%al
  100481:	75 f0                	jne    100473 <strchr+0xb>
        return (char*) s;
  100483:	40 84 f6             	test   %sil,%sil
  100486:	b8 00 00 00 00       	mov    $0x0,%eax
  10048b:	48 0f 44 c7          	cmove  %rdi,%rax
}
  10048f:	c3                   	ret
        return (char*) s;
  100490:	48 89 f8             	mov    %rdi,%rax
  100493:	c3                   	ret

0000000000100494 <srand(unsigned int)>:
void srand(unsigned seed) {
  100494:	f3 0f 1e fa          	endbr64
    rand_seed = ((unsigned long) seed << 32) | seed;
  100498:	89 f8                	mov    %edi,%eax
  10049a:	48 c1 e7 20          	shl    $0x20,%rdi
  10049e:	48 01 c7             	add    %rax,%rdi
	  = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_acquire);
	__glibcxx_assert(__b != memory_order_acq_rel);
	__glibcxx_assert(__b != memory_order_consume);

	__atomic_store_n(&_M_i, __i, int(__m));
  1004a1:	48 87 3d 68 2b 00 00 	xchg   %rdi,0x2b68(%rip)        # 103010 <rand_seed>
  1004a8:	b8 01 00 00 00       	mov    $0x1,%eax
  1004ad:	87 05 65 2b 00 00    	xchg   %eax,0x2b65(%rip)        # 103018 <rand_seed_set>
}
  1004b3:	c3                   	ret

00000000001004b4 <rand()>:
int rand() {
  1004b4:	f3 0f 1e fa          	endbr64
  1004b8:	55                   	push   %rbp
  1004b9:	48 89 e5             	mov    %rsp,%rbp
	memory_order __b __attribute__ ((__unused__))
	  = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_release);
	__glibcxx_assert(__b != memory_order_acq_rel);

	return __atomic_load_n(&_M_i, int(__m));
  1004bc:	8b 05 56 2b 00 00    	mov    0x2b56(%rip),%eax        # 103018 <rand_seed_set>
    if (!rand_seed_set) {
  1004c2:	85 c0                	test   %eax,%eax
  1004c4:	74 30                	je     1004f6 <rand()+0x42>
  1004c6:	48 8b 05 43 2b 00 00 	mov    0x2b43(%rip),%rax        # 103010 <rand_seed>
        next_rs = rs * 6364136223846793005UL + 1;
  1004cd:	48 b9 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rcx
  1004d4:	f4 51 58 
  1004d7:	48 89 c2             	mov    %rax,%rdx
  1004da:	48 0f af d1          	imul   %rcx,%rdx
  1004de:	48 83 c2 01          	add    $0x1,%rdx
      compare_exchange_weak(__int_type& __i1, __int_type __i2,
			    memory_order __m1, memory_order __m2) noexcept
      {
	__glibcxx_assert(__is_valid_cmpexch_failure_order(__m2));

	return __atomic_compare_exchange_n(&_M_i, &__i1, __i2, 1,
  1004e2:	f0 48 0f b1 15 25 2b 	lock cmpxchg %rdx,0x2b25(%rip)        # 103010 <rand_seed>
  1004e9:	00 00 
    } while (!rand_seed.compare_exchange_weak(rs, next_rs));
  1004eb:	75 ea                	jne    1004d7 <rand()+0x23>
    return (next_rs >> 33) & RAND_MAX;
  1004ed:	48 c1 ea 21          	shr    $0x21,%rdx
  1004f1:	48 89 d0             	mov    %rdx,%rax
}
  1004f4:	5d                   	pop    %rbp
  1004f5:	c3                   	ret
        srand(819234718U);
  1004f6:	bf 9e 87 d4 30       	mov    $0x30d4879e,%edi
  1004fb:	e8 94 ff ff ff       	call   100494 <srand(unsigned int)>
  100500:	eb c4                	jmp    1004c6 <rand()+0x12>

0000000000100502 <rand(int, int)>:
int rand(int min, int max) {
  100502:	f3 0f 1e fa          	endbr64
  100506:	55                   	push   %rbp
  100507:	48 89 e5             	mov    %rsp,%rbp
  10050a:	41 55                	push   %r13
  10050c:	41 54                	push   %r12
  10050e:	53                   	push   %rbx
  10050f:	48 83 ec 08          	sub    $0x8,%rsp
    assert(min <= max);
  100513:	39 f7                	cmp    %esi,%edi
  100515:	7f 42                	jg     100559 <rand(int, int)+0x57>
  100517:	41 89 fc             	mov    %edi,%r12d
  10051a:	89 f3                	mov    %esi,%ebx
    unsigned div = (unsigned(RAND_MAX) + 1) / (max - min + 1),
  10051c:	29 fb                	sub    %edi,%ebx
  10051e:	83 c3 01             	add    $0x1,%ebx
  100521:	b8 00 00 00 80       	mov    $0x80000000,%eax
  100526:	ba 00 00 00 00       	mov    $0x0,%edx
  10052b:	f7 f3                	div    %ebx
  10052d:	41 89 c5             	mov    %eax,%r13d
        top = div * (max - min + 1);
  100530:	0f af d8             	imul   %eax,%ebx
    assert(top > 0 && top <= unsigned(RAND_MAX) + 1);
  100533:	89 d8                	mov    %ebx,%eax
  100535:	83 e8 01             	sub    $0x1,%eax
  100538:	78 38                	js     100572 <rand(int, int)+0x70>
        unsigned r = rand();
  10053a:	e8 75 ff ff ff       	call   1004b4 <rand()>
        if (r < top) {
  10053f:	39 d8                	cmp    %ebx,%eax
  100541:	73 f7                	jae    10053a <rand(int, int)+0x38>
            return min + r / div;
  100543:	ba 00 00 00 00       	mov    $0x0,%edx
  100548:	41 f7 f5             	div    %r13d
  10054b:	44 01 e0             	add    %r12d,%eax
}
  10054e:	48 83 c4 08          	add    $0x8,%rsp
  100552:	5b                   	pop    %rbx
  100553:	41 5c                	pop    %r12
  100555:	41 5d                	pop    %r13
  100557:	5d                   	pop    %rbp
  100558:	c3                   	ret
    assert(min <= max);
  100559:	b9 00 00 00 00       	mov    $0x0,%ecx
  10055e:	ba 0c 10 10 00       	mov    $0x10100c,%edx
  100563:	be 49 01 00 00       	mov    $0x149,%esi
  100568:	bf 17 10 10 00       	mov    $0x101017,%edi
  10056d:	e8 6f 09 00 00       	call   100ee1 <assert_fail(char const*, int, char const*, char const*)>
    assert(top > 0 && top <= unsigned(RAND_MAX) + 1);
  100572:	b9 00 00 00 00       	mov    $0x0,%ecx
  100577:	ba 50 10 10 00       	mov    $0x101050,%edx
  10057c:	be 4e 01 00 00       	mov    $0x14e,%esi
  100581:	bf 17 10 10 00       	mov    $0x101017,%edi
  100586:	e8 56 09 00 00       	call   100ee1 <assert_fail(char const*, int, char const*, char const*)>
  10058b:	90                   	nop

000000000010058c <printer::vprintf(char const*, __va_list_tag*)>:
void printer::vprintf(const char* format, va_list val) {
  10058c:	f3 0f 1e fa          	endbr64
  100590:	55                   	push   %rbp
  100591:	48 89 e5             	mov    %rsp,%rbp
  100594:	41 57                	push   %r15
  100596:	41 56                	push   %r14
  100598:	41 55                	push   %r13
  10059a:	41 54                	push   %r12
  10059c:	53                   	push   %rbx
  10059d:	48 83 ec 48          	sub    $0x48,%rsp
  1005a1:	49 89 ff             	mov    %rdi,%r15
  1005a4:	49 89 f4             	mov    %rsi,%r12
  1005a7:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
    for (; *format; ++format) {
  1005ab:	0f b6 06             	movzbl (%rsi),%eax
  1005ae:	84 c0                	test   %al,%al
  1005b0:	0f 85 94 05 00 00    	jne    100b4a <printer::vprintf(char const*, __va_list_tag*)+0x5be>
}
  1005b6:	48 83 c4 48          	add    $0x48,%rsp
  1005ba:	5b                   	pop    %rbx
  1005bb:	41 5c                	pop    %r12
  1005bd:	41 5d                	pop    %r13
  1005bf:	41 5e                	pop    %r14
  1005c1:	41 5f                	pop    %r15
  1005c3:	5d                   	pop    %rbp
  1005c4:	c3                   	ret
        for (++format; *format; ++format) {
  1005c5:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  1005ca:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
  1005d0:	45 84 e4             	test   %r12b,%r12b
  1005d3:	0f 84 01 01 00 00    	je     1006da <printer::vprintf(char const*, __va_list_tag*)+0x14e>
        int flags = 0;
  1005d9:	41 be 00 00 00 00    	mov    $0x0,%r14d
            const char* flagc = strchr(flag_chars, *format);
  1005df:	41 0f be f4          	movsbl %r12b,%esi
  1005e3:	bf f1 17 10 00       	mov    $0x1017f1,%edi
  1005e8:	e8 7b fe ff ff       	call   100468 <strchr>
  1005ed:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  1005f0:	48 85 c0             	test   %rax,%rax
  1005f3:	74 70                	je     100665 <printer::vprintf(char const*, __va_list_tag*)+0xd9>
                flags |= 1 << (flagc - flag_chars);
  1005f5:	48 81 e9 f1 17 10 00 	sub    $0x1017f1,%rcx
  1005fc:	b8 01 00 00 00       	mov    $0x1,%eax
  100601:	d3 e0                	shl    %cl,%eax
  100603:	41 09 c6             	or     %eax,%r14d
        for (++format; *format; ++format) {
  100606:	48 83 c3 01          	add    $0x1,%rbx
  10060a:	44 0f b6 23          	movzbl (%rbx),%r12d
  10060e:	45 84 e4             	test   %r12b,%r12b
  100611:	75 cc                	jne    1005df <printer::vprintf(char const*, __va_list_tag*)+0x53>
        int width = -1;
  100613:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
  100619:	c7 45 a4 ff ff ff ff 	movl   $0xffffffff,-0x5c(%rbp)
        if (*format == '.') {
  100620:	80 3b 2e             	cmpb   $0x2e,(%rbx)
  100623:	0f 84 d8 00 00 00    	je     100701 <printer::vprintf(char const*, __va_list_tag*)+0x175>
        switch (*format) {
  100629:	0f b6 03             	movzbl (%rbx),%eax
  10062c:	3c 6c                	cmp    $0x6c,%al
  10062e:	0f 84 73 01 00 00    	je     1007a7 <printer::vprintf(char const*, __va_list_tag*)+0x21b>
  100634:	0f 8f 4e 01 00 00    	jg     100788 <printer::vprintf(char const*, __va_list_tag*)+0x1fc>
  10063a:	3c 68                	cmp    $0x68,%al
  10063c:	0f 85 88 01 00 00    	jne    1007ca <printer::vprintf(char const*, __va_list_tag*)+0x23e>
            ++format;
  100642:	48 8d 43 01          	lea    0x1(%rbx),%rax
  100646:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  10064a:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  10064e:	8d 50 bd             	lea    -0x43(%rax),%edx
  100651:	80 fa 35             	cmp    $0x35,%dl
  100654:	0f 87 a6 05 00 00    	ja     100c00 <printer::vprintf(char const*, __va_list_tag*)+0x674>
  10065a:	0f b6 d2             	movzbl %dl,%edx
  10065d:	3e ff 24 d5 00 11 10 	notrack jmp *0x101100(,%rdx,8)
  100664:	00 
        if (*format >= '1' && *format <= '9') {
  100665:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
  10066a:	3c 08                	cmp    $0x8,%al
  10066c:	77 32                	ja     1006a0 <printer::vprintf(char const*, __va_list_tag*)+0x114>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  10066e:	0f b6 03             	movzbl (%rbx),%eax
  100671:	8d 50 d0             	lea    -0x30(%rax),%edx
  100674:	80 fa 09             	cmp    $0x9,%dl
  100677:	77 72                	ja     1006eb <printer::vprintf(char const*, __va_list_tag*)+0x15f>
  100679:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
  10067f:	48 83 c3 01          	add    $0x1,%rbx
  100683:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
  100688:	0f be c0             	movsbl %al,%eax
  10068b:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100690:	0f b6 03             	movzbl (%rbx),%eax
  100693:	8d 50 d0             	lea    -0x30(%rax),%edx
  100696:	80 fa 09             	cmp    $0x9,%dl
  100699:	76 e4                	jbe    10067f <printer::vprintf(char const*, __va_list_tag*)+0xf3>
  10069b:	e9 79 ff ff ff       	jmp    100619 <printer::vprintf(char const*, __va_list_tag*)+0x8d>
        } else if (*format == '*') {
  1006a0:	41 80 fc 2a          	cmp    $0x2a,%r12b
  1006a4:	75 50                	jne    1006f6 <printer::vprintf(char const*, __va_list_tag*)+0x16a>
            width = va_arg(val, int);
  1006a6:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1006aa:	8b 01                	mov    (%rcx),%eax
  1006ac:	83 f8 2f             	cmp    $0x2f,%eax
  1006af:	77 17                	ja     1006c8 <printer::vprintf(char const*, __va_list_tag*)+0x13c>
  1006b1:	89 c2                	mov    %eax,%edx
  1006b3:	48 03 51 10          	add    0x10(%rcx),%rdx
  1006b7:	83 c0 08             	add    $0x8,%eax
  1006ba:	89 01                	mov    %eax,(%rcx)
  1006bc:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
  1006bf:	48 83 c3 01          	add    $0x1,%rbx
  1006c3:	e9 51 ff ff ff       	jmp    100619 <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            width = va_arg(val, int);
  1006c8:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1006cc:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1006d0:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1006d4:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1006d8:	eb e2                	jmp    1006bc <printer::vprintf(char const*, __va_list_tag*)+0x130>
        int flags = 0;
  1006da:	41 be 00 00 00 00    	mov    $0x0,%r14d
        int width = -1;
  1006e0:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  1006e6:	e9 2e ff ff ff       	jmp    100619 <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1006eb:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  1006f1:	e9 23 ff ff ff       	jmp    100619 <printer::vprintf(char const*, __va_list_tag*)+0x8d>
        int width = -1;
  1006f6:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  1006fc:	e9 18 ff ff ff       	jmp    100619 <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            ++format;
  100701:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
  100705:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  100709:	8d 48 d0             	lea    -0x30(%rax),%ecx
  10070c:	80 f9 09             	cmp    $0x9,%cl
  10070f:	76 13                	jbe    100724 <printer::vprintf(char const*, __va_list_tag*)+0x198>
            } else if (*format == '*') {
  100711:	3c 2a                	cmp    $0x2a,%al
  100713:	74 33                	je     100748 <printer::vprintf(char const*, __va_list_tag*)+0x1bc>
            ++format;
  100715:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
  100718:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
  10071f:	e9 05 ff ff ff       	jmp    100629 <printer::vprintf(char const*, __va_list_tag*)+0x9d>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  100724:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  100729:	48 83 c2 01          	add    $0x1,%rdx
  10072d:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  100730:	0f be c0             	movsbl %al,%eax
  100733:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  100737:	0f b6 02             	movzbl (%rdx),%eax
  10073a:	8d 70 d0             	lea    -0x30(%rax),%esi
  10073d:	40 80 fe 09          	cmp    $0x9,%sil
  100741:	76 e6                	jbe    100729 <printer::vprintf(char const*, __va_list_tag*)+0x19d>
  100743:	48 89 d3             	mov    %rdx,%rbx
  100746:	eb 1c                	jmp    100764 <printer::vprintf(char const*, __va_list_tag*)+0x1d8>
                precision = va_arg(val, int);
  100748:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  10074c:	8b 07                	mov    (%rdi),%eax
  10074e:	83 f8 2f             	cmp    $0x2f,%eax
  100751:	77 23                	ja     100776 <printer::vprintf(char const*, __va_list_tag*)+0x1ea>
  100753:	89 c2                	mov    %eax,%edx
  100755:	48 03 57 10          	add    0x10(%rdi),%rdx
  100759:	83 c0 08             	add    $0x8,%eax
  10075c:	89 07                	mov    %eax,(%rdi)
  10075e:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  100760:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
  100764:	85 c9                	test   %ecx,%ecx
  100766:	b8 00 00 00 00       	mov    $0x0,%eax
  10076b:	0f 49 c1             	cmovns %ecx,%eax
  10076e:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100771:	e9 b3 fe ff ff       	jmp    100629 <printer::vprintf(char const*, __va_list_tag*)+0x9d>
                precision = va_arg(val, int);
  100776:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  10077a:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  10077e:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100782:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100786:	eb d6                	jmp    10075e <printer::vprintf(char const*, __va_list_tag*)+0x1d2>
        switch (*format) {
  100788:	3c 74                	cmp    $0x74,%al
  10078a:	74 1b                	je     1007a7 <printer::vprintf(char const*, __va_list_tag*)+0x21b>
  10078c:	3c 7a                	cmp    $0x7a,%al
  10078e:	74 17                	je     1007a7 <printer::vprintf(char const*, __va_list_tag*)+0x21b>
        switch (*format) {
  100790:	8d 50 bd             	lea    -0x43(%rax),%edx
  100793:	80 fa 35             	cmp    $0x35,%dl
  100796:	0f 87 5e 06 00 00    	ja     100dfa <printer::vprintf(char const*, __va_list_tag*)+0x86e>
  10079c:	0f b6 d2             	movzbl %dl,%edx
  10079f:	3e ff 24 d5 b0 12 10 	notrack jmp *0x1012b0(,%rdx,8)
  1007a6:	00 
            ++format;
  1007a7:	48 8d 43 01          	lea    0x1(%rbx),%rax
  1007ab:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  1007af:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1007b3:	8d 50 bd             	lea    -0x43(%rax),%edx
  1007b6:	80 fa 35             	cmp    $0x35,%dl
  1007b9:	0f 87 41 04 00 00    	ja     100c00 <printer::vprintf(char const*, __va_list_tag*)+0x674>
  1007bf:	0f b6 d2             	movzbl %dl,%edx
  1007c2:	3e ff 24 d5 60 14 10 	notrack jmp *0x101460(,%rdx,8)
  1007c9:	00 
  1007ca:	8d 50 bd             	lea    -0x43(%rax),%edx
  1007cd:	80 fa 35             	cmp    $0x35,%dl
  1007d0:	0f 87 26 04 00 00    	ja     100bfc <printer::vprintf(char const*, __va_list_tag*)+0x670>
  1007d6:	0f b6 d2             	movzbl %dl,%edx
  1007d9:	3e ff 24 d5 10 16 10 	notrack jmp *0x101610(,%rdx,8)
  1007e0:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1007e1:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1007e5:	8b 07                	mov    (%rdi),%eax
  1007e7:	83 f8 2f             	cmp    $0x2f,%eax
  1007ea:	77 36                	ja     100822 <printer::vprintf(char const*, __va_list_tag*)+0x296>
  1007ec:	89 c2                	mov    %eax,%edx
  1007ee:	48 03 57 10          	add    0x10(%rdi),%rdx
  1007f2:	83 c0 08             	add    $0x8,%eax
  1007f5:	89 07                	mov    %eax,(%rdi)
  1007f7:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  1007fa:	48 89 d0             	mov    %rdx,%rax
  1007fd:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  100801:	49 89 d3             	mov    %rdx,%r11
  100804:	49 f7 db             	neg    %r11
  100807:	25 00 01 00 00       	and    $0x100,%eax
  10080c:	4c 0f 44 da          	cmove  %rdx,%r11
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  100810:	44 09 f0             	or     %r14d,%eax
  100813:	0c c0                	or     $0xc0,%al
  100815:	41 89 c6             	mov    %eax,%r14d
        const char* data = "";
  100818:	bb 26 10 10 00       	mov    $0x101026,%ebx
            break;
  10081d:	e9 f4 01 00 00       	jmp    100a16 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100822:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100826:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  10082a:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10082e:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100832:	eb c3                	jmp    1007f7 <printer::vprintf(char const*, __va_list_tag*)+0x26b>
        switch (*format) {
  100834:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100838:	eb 04                	jmp    10083e <printer::vprintf(char const*, __va_list_tag*)+0x2b2>
  10083a:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            long x = length ? va_arg(val, long) : va_arg(val, int);
  10083e:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100842:	8b 01                	mov    (%rcx),%eax
  100844:	83 f8 2f             	cmp    $0x2f,%eax
  100847:	77 10                	ja     100859 <printer::vprintf(char const*, __va_list_tag*)+0x2cd>
  100849:	89 c2                	mov    %eax,%edx
  10084b:	48 03 51 10          	add    0x10(%rcx),%rdx
  10084f:	83 c0 08             	add    $0x8,%eax
  100852:	89 01                	mov    %eax,(%rcx)
  100854:	48 63 12             	movslq (%rdx),%rdx
  100857:	eb a1                	jmp    1007fa <printer::vprintf(char const*, __va_list_tag*)+0x26e>
  100859:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  10085d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100861:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100865:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100869:	eb e9                	jmp    100854 <printer::vprintf(char const*, __va_list_tag*)+0x2c8>
        switch (*format) {
  10086b:	b8 01 00 00 00       	mov    $0x1,%eax
  100870:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  100877:	e9 9d 00 00 00       	jmp    100919 <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  10087c:	b8 00 00 00 00       	mov    $0x0,%eax
  100881:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  100888:	e9 8c 00 00 00       	jmp    100919 <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  10088d:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100891:	b8 00 00 00 00       	mov    $0x0,%eax
  100896:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  10089d:	eb 7a                	jmp    100919 <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  10089f:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1008a3:	b8 00 00 00 00       	mov    $0x0,%eax
  1008a8:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  1008af:	eb 68                	jmp    100919 <printer::vprintf(char const*, __va_list_tag*)+0x38d>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1008b1:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1008b5:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1008b9:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1008bd:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1008c1:	eb 70                	jmp    100933 <printer::vprintf(char const*, __va_list_tag*)+0x3a7>
  1008c3:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1008c7:	8b 07                	mov    (%rdi),%eax
  1008c9:	83 f8 2f             	cmp    $0x2f,%eax
  1008cc:	77 10                	ja     1008de <printer::vprintf(char const*, __va_list_tag*)+0x352>
  1008ce:	89 c2                	mov    %eax,%edx
  1008d0:	48 03 57 10          	add    0x10(%rdi),%rdx
  1008d4:	83 c0 08             	add    $0x8,%eax
  1008d7:	89 07                	mov    %eax,(%rdi)
  1008d9:	44 8b 1a             	mov    (%rdx),%r11d
  1008dc:	eb 58                	jmp    100936 <printer::vprintf(char const*, __va_list_tag*)+0x3aa>
  1008de:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1008e2:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1008e6:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1008ea:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1008ee:	eb e9                	jmp    1008d9 <printer::vprintf(char const*, __va_list_tag*)+0x34d>
        switch (*format) {
  1008f0:	b8 01 00 00 00       	mov    $0x1,%eax
  1008f5:	eb 1b                	jmp    100912 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  1008f7:	b8 00 00 00 00       	mov    $0x0,%eax
  1008fc:	eb 14                	jmp    100912 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  1008fe:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100902:	b8 00 00 00 00       	mov    $0x0,%eax
  100907:	eb 09                	jmp    100912 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  100909:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  10090d:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  100912:	c7 45 a0 f0 ff ff ff 	movl   $0xfffffff0,-0x60(%rbp)
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  100919:	85 c0                	test   %eax,%eax
  10091b:	74 a6                	je     1008c3 <printer::vprintf(char const*, __va_list_tag*)+0x337>
  10091d:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100921:	8b 07                	mov    (%rdi),%eax
  100923:	83 f8 2f             	cmp    $0x2f,%eax
  100926:	77 89                	ja     1008b1 <printer::vprintf(char const*, __va_list_tag*)+0x325>
  100928:	89 c2                	mov    %eax,%edx
  10092a:	48 03 57 10          	add    0x10(%rdi),%rdx
  10092e:	83 c0 08             	add    $0x8,%eax
  100931:	89 07                	mov    %eax,(%rdi)
  100933:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_NUMERIC;
  100936:	44 89 f0             	mov    %r14d,%eax
  100939:	83 c8 40             	or     $0x40,%eax
    if (base < 0) {
  10093c:	83 7d a0 00          	cmpl   $0x0,-0x60(%rbp)
  100940:	0f 89 de 02 00 00    	jns    100c24 <printer::vprintf(char const*, __va_list_tag*)+0x698>
    *--pos = '\0';
  100946:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  10094a:	a8 20                	test   $0x20,%al
  10094c:	0f 85 01 03 00 00    	jne    100c53 <printer::vprintf(char const*, __va_list_tag*)+0x6c7>
  100952:	41 89 c6             	mov    %eax,%r14d
        digits = lower_digits;
  100955:	41 ba c0 17 10 00    	mov    $0x1017c0,%r10d
        base = -base;
  10095b:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  100961:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = nullptr;
  100968:	bf 00 00 00 00       	mov    $0x0,%edi
  10096d:	e9 03 03 00 00       	jmp    100c75 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
        switch (*format) {
  100972:	b8 01 00 00 00       	mov    $0x1,%eax
  100977:	eb 1b                	jmp    100994 <printer::vprintf(char const*, __va_list_tag*)+0x408>
  100979:	b8 00 00 00 00       	mov    $0x0,%eax
  10097e:	eb 14                	jmp    100994 <printer::vprintf(char const*, __va_list_tag*)+0x408>
  100980:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100984:	b8 00 00 00 00       	mov    $0x0,%eax
  100989:	eb 09                	jmp    100994 <printer::vprintf(char const*, __va_list_tag*)+0x408>
  10098b:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  10098f:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  100994:	c7 45 a0 10 00 00 00 	movl   $0x10,-0x60(%rbp)
            goto format_unsigned;
  10099b:	e9 79 ff ff ff       	jmp    100919 <printer::vprintf(char const*, __va_list_tag*)+0x38d>
        switch (*format) {
  1009a0:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1009a4:	eb 04                	jmp    1009aa <printer::vprintf(char const*, __va_list_tag*)+0x41e>
  1009a6:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            num = (uintptr_t) va_arg(val, void*);
  1009aa:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1009ae:	8b 01                	mov    (%rcx),%eax
  1009b0:	83 f8 2f             	cmp    $0x2f,%eax
  1009b3:	77 22                	ja     1009d7 <printer::vprintf(char const*, __va_list_tag*)+0x44b>
  1009b5:	89 c2                	mov    %eax,%edx
  1009b7:	48 03 51 10          	add    0x10(%rcx),%rdx
  1009bb:	83 c0 08             	add    $0x8,%eax
  1009be:	89 01                	mov    %eax,(%rcx)
  1009c0:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  1009c3:	44 89 f0             	mov    %r14d,%eax
  1009c6:	0d 41 02 00 00       	or     $0x241,%eax
            base = -16;
  1009cb:	c7 45 a0 f0 ff ff ff 	movl   $0xfffffff0,-0x60(%rbp)
  1009d2:	e9 6f ff ff ff       	jmp    100946 <printer::vprintf(char const*, __va_list_tag*)+0x3ba>
            num = (uintptr_t) va_arg(val, void*);
  1009d7:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1009db:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1009df:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1009e3:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1009e7:	eb d7                	jmp    1009c0 <printer::vprintf(char const*, __va_list_tag*)+0x434>
        switch (*format) {
  1009e9:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1009ed:	eb 04                	jmp    1009f3 <printer::vprintf(char const*, __va_list_tag*)+0x467>
  1009ef:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = va_arg(val, char*);
  1009f3:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1009f7:	8b 01                	mov    (%rcx),%eax
  1009f9:	83 f8 2f             	cmp    $0x2f,%eax
  1009fc:	0f 87 61 01 00 00    	ja     100b63 <printer::vprintf(char const*, __va_list_tag*)+0x5d7>
  100a02:	89 c2                	mov    %eax,%edx
  100a04:	48 03 51 10          	add    0x10(%rcx),%rdx
  100a08:	83 c0 08             	add    $0x8,%eax
  100a0b:	89 01                	mov    %eax,(%rcx)
  100a0d:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  100a10:	41 bb 00 00 00 00    	mov    $0x0,%r11d
        if (flags & FLAG_NUMERIC) {
  100a16:	44 89 f0             	mov    %r14d,%eax
  100a19:	83 e0 40             	and    $0x40,%eax
  100a1c:	89 45 94             	mov    %eax,-0x6c(%rbp)
        const char* prefix = "";
  100a1f:	41 bc 26 10 10 00    	mov    $0x101026,%r12d
        if (flags & FLAG_NUMERIC) {
  100a25:	0f 85 e9 03 00 00    	jne    100e14 <printer::vprintf(char const*, __va_list_tag*)+0x888>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  100a2b:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  100a2e:	89 d0                	mov    %edx,%eax
  100a30:	f7 d0                	not    %eax
  100a32:	c1 e8 1f             	shr    $0x1f,%eax
  100a35:	89 45 90             	mov    %eax,-0x70(%rbp)
  100a38:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
  100a3c:	0f 85 54 03 00 00    	jne    100d96 <printer::vprintf(char const*, __va_list_tag*)+0x80a>
  100a42:	84 c0                	test   %al,%al
  100a44:	0f 84 4c 03 00 00    	je     100d96 <printer::vprintf(char const*, __va_list_tag*)+0x80a>
            datalen = strnlen(data, precision);
  100a4a:	48 63 f2             	movslq %edx,%rsi
  100a4d:	48 89 df             	mov    %rbx,%rdi
  100a50:	e8 ed f9 ff ff       	call   100442 <strnlen>
  100a55:	89 45 a0             	mov    %eax,-0x60(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  100a58:	44 89 f0             	mov    %r14d,%eax
  100a5b:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  100a5e:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  100a65:	83 f8 42             	cmp    $0x42,%eax
  100a68:	0f 84 60 03 00 00    	je     100dce <printer::vprintf(char const*, __va_list_tag*)+0x842>
        width -= datalen + zeros + strlen(prefix);
  100a6e:	4c 89 e7             	mov    %r12,%rdi
  100a71:	e8 ad f9 ff ff       	call   100423 <strlen>
  100a76:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  100a79:	8b 7d a0             	mov    -0x60(%rbp),%edi
  100a7c:	8d 0c 3a             	lea    (%rdx,%rdi,1),%ecx
  100a7f:	44 89 ea             	mov    %r13d,%edx
  100a82:	29 ca                	sub    %ecx,%edx
  100a84:	29 c2                	sub    %eax,%edx
  100a86:	41 89 d5             	mov    %edx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100a89:	41 f6 c6 04          	test   $0x4,%r14b
  100a8d:	75 31                	jne    100ac0 <printer::vprintf(char const*, __va_list_tag*)+0x534>
  100a8f:	85 d2                	test   %edx,%edx
  100a91:	7e 2d                	jle    100ac0 <printer::vprintf(char const*, __va_list_tag*)+0x534>
        width -= datalen + zeros + strlen(prefix);
  100a93:	41 89 d6             	mov    %edx,%r14d
            putc(' ');
  100a96:	49 8b 07             	mov    (%r15),%rax
  100a99:	be 20 00 00 00       	mov    $0x20,%esi
  100a9e:	4c 89 ff             	mov    %r15,%rdi
  100aa1:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100aa3:	41 83 ed 01          	sub    $0x1,%r13d
  100aa7:	45 85 ed             	test   %r13d,%r13d
  100aaa:	7f ea                	jg     100a96 <printer::vprintf(char const*, __va_list_tag*)+0x50a>
  100aac:	44 89 f2             	mov    %r14d,%edx
  100aaf:	45 85 f6             	test   %r14d,%r14d
  100ab2:	b8 01 00 00 00       	mov    $0x1,%eax
  100ab7:	41 0f 4f c6          	cmovg  %r14d,%eax
  100abb:	29 c2                	sub    %eax,%edx
  100abd:	41 89 d5             	mov    %edx,%r13d
        for (; *prefix; ++prefix) {
  100ac0:	41 0f b6 04 24       	movzbl (%r12),%eax
  100ac5:	84 c0                	test   %al,%al
  100ac7:	74 18                	je     100ae1 <printer::vprintf(char const*, __va_list_tag*)+0x555>
            putc(*prefix);
  100ac9:	0f b6 f0             	movzbl %al,%esi
  100acc:	49 8b 07             	mov    (%r15),%rax
  100acf:	4c 89 ff             	mov    %r15,%rdi
  100ad2:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  100ad4:	49 83 c4 01          	add    $0x1,%r12
  100ad8:	41 0f b6 04 24       	movzbl (%r12),%eax
  100add:	84 c0                	test   %al,%al
  100adf:	75 e8                	jne    100ac9 <printer::vprintf(char const*, __va_list_tag*)+0x53d>
        for (; zeros > 0; --zeros) {
  100ae1:	44 8b 65 a4          	mov    -0x5c(%rbp),%r12d
  100ae5:	45 85 e4             	test   %r12d,%r12d
  100ae8:	7e 13                	jle    100afd <printer::vprintf(char const*, __va_list_tag*)+0x571>
            putc('0');
  100aea:	49 8b 07             	mov    (%r15),%rax
  100aed:	be 30 00 00 00       	mov    $0x30,%esi
  100af2:	4c 89 ff             	mov    %r15,%rdi
  100af5:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  100af7:	41 83 ec 01          	sub    $0x1,%r12d
  100afb:	75 ed                	jne    100aea <printer::vprintf(char const*, __va_list_tag*)+0x55e>
        for (; datalen > 0; ++data, --datalen) {
  100afd:	8b 45 a0             	mov    -0x60(%rbp),%eax
  100b00:	85 c0                	test   %eax,%eax
  100b02:	7e 1a                	jle    100b1e <printer::vprintf(char const*, __va_list_tag*)+0x592>
  100b04:	41 89 c6             	mov    %eax,%r14d
  100b07:	49 01 de             	add    %rbx,%r14
            putc(*data);
  100b0a:	0f b6 33             	movzbl (%rbx),%esi
  100b0d:	49 8b 07             	mov    (%r15),%rax
  100b10:	4c 89 ff             	mov    %r15,%rdi
  100b13:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  100b15:	48 83 c3 01          	add    $0x1,%rbx
  100b19:	49 39 de             	cmp    %rbx,%r14
  100b1c:	75 ec                	jne    100b0a <printer::vprintf(char const*, __va_list_tag*)+0x57e>
        for (; width > 0; --width) {
  100b1e:	45 85 ed             	test   %r13d,%r13d
  100b21:	7e 13                	jle    100b36 <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            putc(' ');
  100b23:	49 8b 07             	mov    (%r15),%rax
  100b26:	be 20 00 00 00       	mov    $0x20,%esi
  100b2b:	4c 89 ff             	mov    %r15,%rdi
  100b2e:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  100b30:	41 83 ed 01          	sub    $0x1,%r13d
  100b34:	75 ed                	jne    100b23 <printer::vprintf(char const*, __va_list_tag*)+0x597>
    for (; *format; ++format) {
  100b36:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  100b3a:	4c 8d 60 01          	lea    0x1(%rax),%r12
  100b3e:	0f b6 40 01          	movzbl 0x1(%rax),%eax
  100b42:	84 c0                	test   %al,%al
  100b44:	0f 84 6c fa ff ff    	je     1005b6 <printer::vprintf(char const*, __va_list_tag*)+0x2a>
        if (*format != '%') {
  100b4a:	3c 25                	cmp    $0x25,%al
  100b4c:	0f 84 73 fa ff ff    	je     1005c5 <printer::vprintf(char const*, __va_list_tag*)+0x39>
            putc(*format);
  100b52:	0f b6 f0             	movzbl %al,%esi
  100b55:	49 8b 07             	mov    (%r15),%rax
  100b58:	4c 89 ff             	mov    %r15,%rdi
  100b5b:	ff 10                	call   *(%rax)
            continue;
  100b5d:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
  100b61:	eb d3                	jmp    100b36 <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            data = va_arg(val, char*);
  100b63:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100b67:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100b6b:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100b6f:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100b73:	e9 95 fe ff ff       	jmp    100a0d <printer::vprintf(char const*, __va_list_tag*)+0x481>
        switch (*format) {
  100b78:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100b7c:	eb 04                	jmp    100b82 <printer::vprintf(char const*, __va_list_tag*)+0x5f6>
  100b7e:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            color_ = va_arg(val, int);
  100b82:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100b86:	8b 07                	mov    (%rdi),%eax
  100b88:	83 f8 2f             	cmp    $0x2f,%eax
  100b8b:	77 13                	ja     100ba0 <printer::vprintf(char const*, __va_list_tag*)+0x614>
  100b8d:	89 c2                	mov    %eax,%edx
  100b8f:	48 03 57 10          	add    0x10(%rdi),%rdx
  100b93:	83 c0 08             	add    $0x8,%eax
  100b96:	89 07                	mov    %eax,(%rdi)
  100b98:	8b 02                	mov    (%rdx),%eax
  100b9a:	41 89 47 08          	mov    %eax,0x8(%r15)
            continue;
  100b9e:	eb 96                	jmp    100b36 <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            color_ = va_arg(val, int);
  100ba0:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100ba4:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100ba8:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100bac:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100bb0:	eb e6                	jmp    100b98 <printer::vprintf(char const*, __va_list_tag*)+0x60c>
        switch (*format) {
  100bb2:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100bb6:	eb 04                	jmp    100bbc <printer::vprintf(char const*, __va_list_tag*)+0x630>
  100bb8:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = va_arg(val, int);
  100bbc:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100bc0:	8b 01                	mov    (%rcx),%eax
  100bc2:	83 f8 2f             	cmp    $0x2f,%eax
  100bc5:	77 23                	ja     100bea <printer::vprintf(char const*, __va_list_tag*)+0x65e>
  100bc7:	89 c2                	mov    %eax,%edx
  100bc9:	48 03 51 10          	add    0x10(%rcx),%rdx
  100bcd:	83 c0 08             	add    $0x8,%eax
  100bd0:	89 01                	mov    %eax,(%rcx)
  100bd2:	8b 02                	mov    (%rdx),%eax
  100bd4:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100bd7:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  100bdb:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100bdf:	41 bb 00 00 00 00    	mov    $0x0,%r11d
            break;
  100be5:	e9 2c fe ff ff       	jmp    100a16 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
            numbuf[0] = va_arg(val, int);
  100bea:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100bee:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100bf2:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100bf6:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100bfa:	eb d6                	jmp    100bd2 <printer::vprintf(char const*, __va_list_tag*)+0x646>
        switch (*format) {
  100bfc:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = (*format ? *format : '%');
  100c00:	84 c0                	test   %al,%al
  100c02:	0f 85 ee 01 00 00    	jne    100df6 <printer::vprintf(char const*, __va_list_tag*)+0x86a>
  100c08:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  100c0c:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  100c10:	48 83 6d a8 01       	subq   $0x1,-0x58(%rbp)
            data = numbuf;
  100c15:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100c19:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  100c1f:	e9 f2 fd ff ff       	jmp    100a16 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
    *--pos = '\0';
  100c24:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100c28:	41 f6 c6 20          	test   $0x20,%r14b
  100c2c:	74 73                	je     100ca1 <printer::vprintf(char const*, __va_list_tag*)+0x715>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100c2e:	8b 55 a0             	mov    -0x60(%rbp),%edx
  100c31:	41 89 d1             	mov    %edx,%r9d
  100c34:	41 89 c6             	mov    %eax,%r14d
  100c37:	41 ba e0 17 10 00    	mov    $0x1017e0,%r10d
  100c3d:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
  100c44:	83 fa 0a             	cmp    $0xa,%edx
  100c47:	0f 94 c0             	sete   %al
  100c4a:	0f b6 c0             	movzbl %al,%eax
  100c4d:	48 83 e8 04          	sub    $0x4,%rax
  100c51:	eb 1d                	jmp    100c70 <printer::vprintf(char const*, __va_list_tag*)+0x6e4>
    if (flags & FLAG_THOUSANDS) {
  100c53:	41 89 c6             	mov    %eax,%r14d
        digits = lower_digits;
  100c56:	41 ba c0 17 10 00    	mov    $0x1017c0,%r10d
        base = -base;
  100c5c:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  100c62:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100c69:	48 c7 c0 fc ff ff ff 	mov    $0xfffffffffffffffc,%rax
  100c70:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  100c75:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  100c79:	4c 89 d8             	mov    %r11,%rax
            *--pos = digits[val % base];
  100c7c:	49 63 f1             	movslq %r9d,%rsi
    } while (val != 0 && pos != buf);
  100c7f:	4c 8d 45 b0          	lea    -0x50(%rbp),%r8
  100c83:	eb 57                	jmp    100cdc <printer::vprintf(char const*, __va_list_tag*)+0x750>
    if (flags & FLAG_THOUSANDS) {
  100c85:	41 ba e0 17 10 00    	mov    $0x1017e0,%r10d
  100c8b:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  100c91:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100c98:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  100c9f:	eb cf                	jmp    100c70 <printer::vprintf(char const*, __va_list_tag*)+0x6e4>
  100ca1:	44 8b 4d a0          	mov    -0x60(%rbp),%r9d
  100ca5:	41 89 c6             	mov    %eax,%r14d
  100ca8:	41 ba e0 17 10 00    	mov    $0x1017e0,%r10d
  100cae:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = nullptr;
  100cb5:	bf 00 00 00 00       	mov    $0x0,%edi
  100cba:	eb b9                	jmp    100c75 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
            *--pos = digits[val % base];
  100cbc:	48 89 cb             	mov    %rcx,%rbx
  100cbf:	ba 00 00 00 00       	mov    $0x0,%edx
  100cc4:	48 f7 f6             	div    %rsi
  100cc7:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
  100ccc:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  100cce:	48 83 e9 01          	sub    $0x1,%rcx
  100cd2:	48 85 c0             	test   %rax,%rax
  100cd5:	74 2d                	je     100d04 <printer::vprintf(char const*, __va_list_tag*)+0x778>
  100cd7:	4c 39 c3             	cmp    %r8,%rbx
  100cda:	74 28                	je     100d04 <printer::vprintf(char const*, __va_list_tag*)+0x778>
        if (pos == thousands_pos) {
  100cdc:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  100ce0:	48 39 d7             	cmp    %rdx,%rdi
  100ce3:	75 d7                	jne    100cbc <printer::vprintf(char const*, __va_list_tag*)+0x730>
            *--pos = base == 10 ? ',' : '\'';
  100ce5:	48 89 cb             	mov    %rcx,%rbx
  100ce8:	41 83 f9 0a          	cmp    $0xa,%r9d
  100cec:	0f 94 c2             	sete   %dl
  100cef:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  100cf3:	40 0f 94 c7          	sete   %dil
  100cf7:	40 0f b6 ff          	movzbl %dil,%edi
  100cfb:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  100cfd:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  100d02:	eb ca                	jmp    100cce <printer::vprintf(char const*, __va_list_tag*)+0x742>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  100d04:	44 89 f0             	mov    %r14d,%eax
  100d07:	f7 d0                	not    %eax
  100d09:	a8 c0                	test   $0xc0,%al
  100d0b:	75 3b                	jne    100d48 <printer::vprintf(char const*, __va_list_tag*)+0x7bc>
                prefix = "-";
  100d0d:	41 bc 23 10 10 00    	mov    $0x101023,%r12d
            if (flags & FLAG_NEGATIVE) {
  100d13:	41 f7 c6 00 01 00 00 	test   $0x100,%r14d
  100d1a:	0f 85 0b fd ff ff    	jne    100a2b <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                prefix = "+";
  100d20:	41 bc 1e 10 10 00    	mov    $0x10101e,%r12d
            } else if (flags & FLAG_PLUSPOSITIVE) {
  100d26:	41 f6 c6 10          	test   $0x10,%r14b
  100d2a:	0f 85 fb fc ff ff    	jne    100a2b <printer::vprintf(char const*, __va_list_tag*)+0x49f>
        const char* prefix = "";
  100d30:	41 f6 c6 08          	test   $0x8,%r14b
  100d34:	41 bc 25 10 10 00    	mov    $0x101025,%r12d
  100d3a:	b8 26 10 10 00       	mov    $0x101026,%eax
  100d3f:	4c 0f 44 e0          	cmove  %rax,%r12
  100d43:	e9 e3 fc ff ff       	jmp    100a2b <printer::vprintf(char const*, __va_list_tag*)+0x49f>
  100d48:	41 bc 26 10 10 00    	mov    $0x101026,%r12d
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100d4e:	44 89 f0             	mov    %r14d,%eax
  100d51:	f7 d0                	not    %eax
  100d53:	a8 41                	test   $0x41,%al
  100d55:	0f 85 d0 fc ff ff    	jne    100a2b <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                   && (base == 16 || base == -16)
  100d5b:	8b 45 a0             	mov    -0x60(%rbp),%eax
  100d5e:	83 c0 10             	add    $0x10,%eax
  100d61:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  100d66:	0f 85 bf fc ff ff    	jne    100a2b <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                   && (num || (flags & FLAG_ALT2))) {
  100d6c:	4d 85 db             	test   %r11,%r11
  100d6f:	75 0d                	jne    100d7e <printer::vprintf(char const*, __va_list_tag*)+0x7f2>
  100d71:	41 f7 c6 00 02 00 00 	test   $0x200,%r14d
  100d78:	0f 84 ad fc ff ff    	je     100a2b <printer::vprintf(char const*, __va_list_tag*)+0x49f>
            prefix = (base == -16 ? "0x" : "0X");
  100d7e:	83 7d a0 f0          	cmpl   $0xfffffff0,-0x60(%rbp)
  100d82:	41 bc 20 10 10 00    	mov    $0x101020,%r12d
  100d88:	b8 27 10 10 00       	mov    $0x101027,%eax
  100d8d:	4c 0f 44 e0          	cmove  %rax,%r12
  100d91:	e9 95 fc ff ff       	jmp    100a2b <printer::vprintf(char const*, __va_list_tag*)+0x49f>
            datalen = strlen(data);
  100d96:	48 89 df             	mov    %rbx,%rdi
  100d99:	e8 85 f6 ff ff       	call   100423 <strlen>
  100d9e:	89 45 a0             	mov    %eax,-0x60(%rbp)
            && precision >= 0) {
  100da1:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
  100da5:	0f 84 ad fc ff ff    	je     100a58 <printer::vprintf(char const*, __va_list_tag*)+0x4cc>
  100dab:	80 7d 90 00          	cmpb   $0x0,-0x70(%rbp)
  100daf:	0f 84 a3 fc ff ff    	je     100a58 <printer::vprintf(char const*, __va_list_tag*)+0x4cc>
            zeros = precision > datalen ? precision - datalen : 0;
  100db5:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  100db8:	89 fa                	mov    %edi,%edx
  100dba:	29 c2                	sub    %eax,%edx
  100dbc:	39 c7                	cmp    %eax,%edi
  100dbe:	b8 00 00 00 00       	mov    $0x0,%eax
  100dc3:	0f 4f c2             	cmovg  %edx,%eax
  100dc6:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100dc9:	e9 a0 fc ff ff       	jmp    100a6e <printer::vprintf(char const*, __va_list_tag*)+0x4e2>
                   && datalen + (int) strlen(prefix) < width) {
  100dce:	4c 89 e7             	mov    %r12,%rdi
  100dd1:	e8 4d f6 ff ff       	call   100423 <strlen>
  100dd6:	8b 7d a0             	mov    -0x60(%rbp),%edi
  100dd9:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  100ddc:	44 89 e9             	mov    %r13d,%ecx
  100ddf:	29 f9                	sub    %edi,%ecx
  100de1:	29 c1                	sub    %eax,%ecx
  100de3:	44 39 ea             	cmp    %r13d,%edx
  100de6:	b8 00 00 00 00       	mov    $0x0,%eax
  100deb:	0f 4c c1             	cmovl  %ecx,%eax
  100dee:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100df1:	e9 78 fc ff ff       	jmp    100a6e <printer::vprintf(char const*, __va_list_tag*)+0x4e2>
  100df6:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
            numbuf[0] = (*format ? *format : '%');
  100dfa:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100dfd:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
  100e01:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = numbuf;
  100e05:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100e09:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  100e0f:	e9 02 fc ff ff       	jmp    100a16 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
    *--pos = '\0';
  100e14:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100e18:	41 f6 c6 20          	test   $0x20,%r14b
  100e1c:	0f 85 63 fe ff ff    	jne    100c85 <printer::vprintf(char const*, __va_list_tag*)+0x6f9>
  100e22:	41 ba e0 17 10 00    	mov    $0x1017e0,%r10d
  100e28:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  100e2e:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
        thousands_pos = nullptr;
  100e35:	bf 00 00 00 00       	mov    $0x0,%edi
  100e3a:	e9 36 fe ff ff       	jmp    100c75 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>

0000000000100e3f <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  100e3f:	f3 0f 1e fa          	endbr64
  100e43:	55                   	push   %rbp
  100e44:	48 89 e5             	mov    %rsp,%rbp
  100e47:	53                   	push   %rbx
  100e48:	48 83 ec 38          	sub    $0x38,%rsp
  100e4c:	48 89 f3             	mov    %rsi,%rbx
  100e4f:	48 89 d6             	mov    %rdx,%rsi
  100e52:	48 89 ca             	mov    %rcx,%rdx
void console_printf(const char* format, ...);


// Generic print library

struct printer {
  100e55:	c7 45 d0 00 07 00 00 	movl   $0x700,-0x30(%rbp)
        : s_(s), end_(s + size), n_(0) {
  100e5c:	48 c7 45 c8 08 18 10 	movq   $0x101808,-0x38(%rbp)
  100e63:	00 
  100e64:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  100e68:	48 01 df             	add    %rbx,%rdi
  100e6b:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  100e6f:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  100e76:	00 
    string_printer sp(s, size);
    sp.vprintf(format, val);
  100e77:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100e7b:	e8 0c f7 ff ff       	call   10058c <printer::vprintf(char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  100e80:	48 85 db             	test   %rbx,%rbx
  100e83:	74 10                	je     100e95 <vsnprintf+0x56>
  100e85:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  100e89:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  100e8d:	48 39 c2             	cmp    %rax,%rdx
  100e90:	73 0d                	jae    100e9f <vsnprintf+0x60>
        *sp.s_ = 0;
  100e92:	c6 02 00             	movb   $0x0,(%rdx)
    } else if (size) {
        sp.end_[-1] = 0;
    }
    return sp.n_;
}
  100e95:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  100e99:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  100e9d:	c9                   	leave
  100e9e:	c3                   	ret
        sp.end_[-1] = 0;
  100e9f:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
  100ea3:	eb f0                	jmp    100e95 <vsnprintf+0x56>

0000000000100ea5 <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  100ea5:	f3 0f 1e fa          	endbr64
  100ea9:	55                   	push   %rbp
  100eaa:	48 89 e5             	mov    %rsp,%rbp
  100ead:	48 83 ec 50          	sub    $0x50,%rsp
  100eb1:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100eb5:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100eb9:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  100ebd:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  100ec4:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100ec8:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100ecc:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100ed0:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  100ed4:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100ed8:	e8 62 ff ff ff       	call   100e3f <vsnprintf>
    va_end(val);
    return n;
  100edd:	48 98                	cltq
}
  100edf:	c9                   	leave
  100ee0:	c3                   	ret

0000000000100ee1 <assert_fail(char const*, int, char const*, char const*)>:
void error_vprintf(int cpos, int color, const char* format, va_list val) {
    console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  100ee1:	f3 0f 1e fa          	endbr64
  100ee5:	55                   	push   %rbp
  100ee6:	48 89 e5             	mov    %rsp,%rbp
  100ee9:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  100ef0:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  100ef3:	c7 05 ff 80 fb ff 30 	movl   $0x730,-0x47f01(%rip)        # b8ffc <cursorpos>
  100efa:	07 00 00 
    char buf[240];
    if (description) {
  100efd:	48 85 c9             	test   %rcx,%rcx
  100f00:	74 39                	je     100f3b <assert_fail(char const*, int, char const*, char const*)+0x5a>
  100f02:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  100f05:	48 83 ec 08          	sub    $0x8,%rsp
  100f09:	52                   	push   %rdx
  100f0a:	56                   	push   %rsi
  100f0b:	57                   	push   %rdi
  100f0c:	48 89 f9             	mov    %rdi,%rcx
  100f0f:	ba a8 10 10 00       	mov    $0x1010a8,%edx
  100f14:	be f0 00 00 00       	mov    $0xf0,%esi
  100f19:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100f20:	b0 00                	mov    $0x0,%al
  100f22:	e8 7e ff ff ff       	call   100ea5 <snprintf>
  100f27:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  100f2b:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  100f30:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100f37:	0f 05                	syscall
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  100f39:	eb fe                	jmp    100f39 <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  100f3b:	49 89 d1             	mov    %rdx,%r9
  100f3e:	48 89 f9             	mov    %rdi,%rcx
  100f41:	ba d8 10 10 00       	mov    $0x1010d8,%edx
  100f46:	be f0 00 00 00       	mov    $0xf0,%esi
  100f4b:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100f52:	b0 00                	mov    $0x0,%al
  100f54:	e8 4c ff ff ff       	call   100ea5 <snprintf>
  100f59:	eb d0                	jmp    100f2b <assert_fail(char const*, int, char const*, char const*)+0x4a>

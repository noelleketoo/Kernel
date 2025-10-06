
obj/p-fork.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000100000 <process_main()>:
    int field2;
};
const test_struct test1 = {61, {0}, 6161};
volatile test_struct test2;

void process_main() {
  100000:	f3 0f 1e fa          	endbr64
  100004:	55                   	push   %rbp
  100005:	48 89 e5             	mov    %rsp,%rbp
  100008:	41 56                	push   %r14
  10000a:	41 55                	push   %r13
  10000c:	41 54                	push   %r12
  10000e:	53                   	push   %rbx
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  10000f:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  100014:	0f 05                	syscall
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
    return rax;
  100016:	49 89 c4             	mov    %rax,%r12
    pid_t initial_pid = sys_getpid();
    assert(initial_pid > 0 && initial_pid < PID_MAX);
  100019:	8d 40 ff             	lea    -0x1(%rax),%eax
  10001c:	83 f8 0e             	cmp    $0xe,%eax
  10001f:	0f 87 e6 00 00 00    	ja     10010b <process_main()+0x10b>
    test2.field1 = 61;
  100025:	c7 05 d1 1f 00 00 3d 	movl   $0x3d,0x1fd1(%rip)        # 102000 <test2>
  10002c:	00 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  10002f:	b8 05 00 00 00       	mov    $0x5,%eax
    asm volatile ("syscall"
  100034:	0f 05                	syscall
    return rax;
  100036:	49 89 c5             	mov    %rax,%r13
    assert(test1.field1 == 61 && test1.field2 == 6161);

    // Fork a total of three new copies, checking `fork` return values.
    pid_t p1 = sys_fork();
    assert(p1 >= 0 && p1 < PID_MAX);
  100039:	83 f8 0f             	cmp    $0xf,%eax
  10003c:	0f 87 e2 00 00 00    	ja     100124 <process_main()+0x124>
    register uintptr_t rax asm("rax") = syscallno;
  100042:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  100047:	0f 05                	syscall
    return rax;
  100049:	49 89 c6             	mov    %rax,%r14
    pid_t intermediate_pid = sys_getpid();
    if (p1 == 0) {
  10004c:	45 85 ed             	test   %r13d,%r13d
  10004f:	0f 85 01 01 00 00    	jne    100156 <process_main()+0x156>
        assert(intermediate_pid != initial_pid);
  100055:	41 39 c4             	cmp    %eax,%r12d
  100058:	0f 84 df 00 00 00    	je     10013d <process_main()+0x13d>
    register uintptr_t rax asm("rax") = syscallno;
  10005e:	b8 05 00 00 00       	mov    $0x5,%eax
    asm volatile ("syscall"
  100063:	0f 05                	syscall
    return rax;
  100065:	48 89 c3             	mov    %rax,%rbx
    } else {
        assert(intermediate_pid == initial_pid && p1 != initial_pid);
    }

    pid_t p2 = sys_fork();
    assert(p2 >= 0 && p2 < PID_MAX);
  100068:	83 f8 0f             	cmp    $0xf,%eax
  10006b:	0f 87 0c 01 00 00    	ja     10017d <process_main()+0x17d>
    register uintptr_t rax asm("rax") = syscallno;
  100071:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  100076:	0f 05                	syscall
    pid_t final_pid = sys_getpid();
    if (p2 == 0) {
  100078:	85 db                	test   %ebx,%ebx
  10007a:	0f 85 2f 01 00 00    	jne    1001af <process_main()+0x1af>
        assert(final_pid != initial_pid && final_pid != intermediate_pid);
  100080:	41 39 c4             	cmp    %eax,%r12d
  100083:	0f 84 0d 01 00 00    	je     100196 <process_main()+0x196>
  100089:	41 39 c6             	cmp    %eax,%r14d
  10008c:	0f 84 04 01 00 00    	je     100196 <process_main()+0x196>
        assert(final_pid == intermediate_pid);
    }

    // Check that multi-page segments can be loaded.
    assert(test1.field1 == 61 && test1.field2 == 6161);
    assert(test2.field1 == 61);
  100092:	8b 15 68 1f 00 00    	mov    0x1f68(%rip),%edx        # 102000 <test2>
  100098:	83 fa 3d             	cmp    $0x3d,%edx
  10009b:	0f 85 5e 01 00 00    	jne    1001ff <process_main()+0x1ff>
    test2.field2 = 61 + final_pid;
  1000a1:	8d 58 3d             	lea    0x3d(%rax),%ebx
  1000a4:	89 1d 5a 2f 00 00    	mov    %ebx,0x2f5a(%rip)        # 103004 <test2+0x1004>
    register uintptr_t rax asm("rax") = syscallno;
  1000aa:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  1000af:	0f 05                	syscall
    sys_yield();
    assert(test2.field2 == 61 + final_pid);
  1000b1:	8b 05 4d 2f 00 00    	mov    0x2f4d(%rip),%eax        # 103004 <test2+0x1004>
  1000b7:	39 c3                	cmp    %eax,%ebx
  1000b9:	0f 85 59 01 00 00    	jne    100218 <process_main()+0x218>
    register uintptr_t rax asm("rax") = syscallno;
  1000bf:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  1000c4:	0f 05                	syscall
    return rax;
  1000c6:	49 89 c4             	mov    %rax,%r12


// sys_getpid
//    Return current process ID. (Never fails.)
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  1000c9:	89 c3                	mov    %eax,%ebx

    // The rest of this code is like p-allocator.c.

    pid_t p = sys_getpid();
    srand(p);
  1000cb:	89 c7                	mov    %eax,%edi
  1000cd:	e8 a8 02 00 00       	call   10037a <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  1000d2:	41 bd 23 40 10 00    	mov    $0x104023,%r13d
  1000d8:	49 81 e5 00 f0 ff ff 	and    $0xfffffffffffff000,%r13

    uint8_t* heap_bottom = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
    heap_top = heap_bottom;
  1000df:	4c 89 2d 2a 2f 00 00 	mov    %r13,0x2f2a(%rip)        # 103010 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  1000e6:	48 89 e0             	mov    %rsp,%rax
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  1000e9:	48 83 e8 01          	sub    $0x1,%rax
  1000ed:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  1000f3:	48 89 05 0e 2f 00 00 	mov    %rax,0x2f0e(%rip)        # 103008 <stack_bottom>

    while (heap_top != stack_bottom) {
  1000fa:	4c 39 e8             	cmp    %r13,%rax
  1000fd:	0f 84 dd 01 00 00    	je     1002e0 <process_main()+0x2e0>
            console[CPOS(24, 79)] = p;
            // update `heap_top`
            heap_top += PAGESIZE;
        } else if (x < p + 1 && heap_bottom < heap_top) {
            // ensure we can write to any previously-allocated page
            uintptr_t addr = rand((uintptr_t) heap_bottom,
  100103:	45 89 ee             	mov    %r13d,%r14d
  100106:	e9 89 01 00 00       	jmp    100294 <process_main()+0x294>
    assert(initial_pid > 0 && initial_pid < PID_MAX);
  10010b:	b9 00 00 00 00       	mov    $0x0,%ecx
  100110:	ba 50 0e 10 00       	mov    $0x100e50,%edx
  100115:	be 16 00 00 00       	mov    $0x16,%esi
  10011a:	bf 1b 10 10 00       	mov    $0x10101b,%edi
  10011f:	e8 a3 0c 00 00       	call   100dc7 <assert_fail(char const*, int, char const*, char const*)>
    assert(p1 >= 0 && p1 < PID_MAX);
  100124:	b9 00 00 00 00       	mov    $0x0,%ecx
  100129:	ba 25 10 10 00       	mov    $0x101025,%edx
  10012e:	be 1c 00 00 00       	mov    $0x1c,%esi
  100133:	bf 1b 10 10 00       	mov    $0x10101b,%edi
  100138:	e8 8a 0c 00 00       	call   100dc7 <assert_fail(char const*, int, char const*, char const*)>
        assert(intermediate_pid != initial_pid);
  10013d:	b9 00 00 00 00       	mov    $0x0,%ecx
  100142:	ba 80 0e 10 00       	mov    $0x100e80,%edx
  100147:	be 1f 00 00 00       	mov    $0x1f,%esi
  10014c:	bf 1b 10 10 00       	mov    $0x10101b,%edi
  100151:	e8 71 0c 00 00       	call   100dc7 <assert_fail(char const*, int, char const*, char const*)>
        assert(intermediate_pid == initial_pid && p1 != initial_pid);
  100156:	41 39 c4             	cmp    %eax,%r12d
  100159:	75 09                	jne    100164 <process_main()+0x164>
  10015b:	45 39 ec             	cmp    %r13d,%r12d
  10015e:	0f 85 fa fe ff ff    	jne    10005e <process_main()+0x5e>
  100164:	b9 00 00 00 00       	mov    $0x0,%ecx
  100169:	ba a0 0e 10 00       	mov    $0x100ea0,%edx
  10016e:	be 21 00 00 00       	mov    $0x21,%esi
  100173:	bf 1b 10 10 00       	mov    $0x10101b,%edi
  100178:	e8 4a 0c 00 00       	call   100dc7 <assert_fail(char const*, int, char const*, char const*)>
    assert(p2 >= 0 && p2 < PID_MAX);
  10017d:	b9 00 00 00 00       	mov    $0x0,%ecx
  100182:	ba 3d 10 10 00       	mov    $0x10103d,%edx
  100187:	be 25 00 00 00       	mov    $0x25,%esi
  10018c:	bf 1b 10 10 00       	mov    $0x10101b,%edi
  100191:	e8 31 0c 00 00       	call   100dc7 <assert_fail(char const*, int, char const*, char const*)>
        assert(final_pid != initial_pid && final_pid != intermediate_pid);
  100196:	b9 00 00 00 00       	mov    $0x0,%ecx
  10019b:	ba d8 0e 10 00       	mov    $0x100ed8,%edx
  1001a0:	be 28 00 00 00       	mov    $0x28,%esi
  1001a5:	bf 1b 10 10 00       	mov    $0x10101b,%edi
  1001aa:	e8 18 0c 00 00       	call   100dc7 <assert_fail(char const*, int, char const*, char const*)>
        assert(p2 != p1 && p2 != intermediate_pid && p2 != initial_pid);
  1001af:	41 39 dd             	cmp    %ebx,%r13d
  1001b2:	0f 94 c2             	sete   %dl
  1001b5:	41 39 de             	cmp    %ebx,%r14d
  1001b8:	0f 94 c1             	sete   %cl
  1001bb:	08 ca                	or     %cl,%dl
  1001bd:	75 27                	jne    1001e6 <process_main()+0x1e6>
  1001bf:	41 39 dc             	cmp    %ebx,%r12d
  1001c2:	74 22                	je     1001e6 <process_main()+0x1e6>
        assert(final_pid == intermediate_pid);
  1001c4:	41 39 c6             	cmp    %eax,%r14d
  1001c7:	0f 84 c5 fe ff ff    	je     100092 <process_main()+0x92>
  1001cd:	b9 00 00 00 00       	mov    $0x0,%ecx
  1001d2:	ba 55 10 10 00       	mov    $0x101055,%edx
  1001d7:	be 2b 00 00 00       	mov    $0x2b,%esi
  1001dc:	bf 1b 10 10 00       	mov    $0x10101b,%edi
  1001e1:	e8 e1 0b 00 00       	call   100dc7 <assert_fail(char const*, int, char const*, char const*)>
        assert(p2 != p1 && p2 != intermediate_pid && p2 != initial_pid);
  1001e6:	b9 00 00 00 00       	mov    $0x0,%ecx
  1001eb:	ba 18 0f 10 00       	mov    $0x100f18,%edx
  1001f0:	be 2a 00 00 00       	mov    $0x2a,%esi
  1001f5:	bf 1b 10 10 00       	mov    $0x10101b,%edi
  1001fa:	e8 c8 0b 00 00       	call   100dc7 <assert_fail(char const*, int, char const*, char const*)>
    assert(test2.field1 == 61);
  1001ff:	b9 00 00 00 00       	mov    $0x0,%ecx
  100204:	ba 73 10 10 00       	mov    $0x101073,%edx
  100209:	be 30 00 00 00       	mov    $0x30,%esi
  10020e:	bf 1b 10 10 00       	mov    $0x10101b,%edi
  100213:	e8 af 0b 00 00       	call   100dc7 <assert_fail(char const*, int, char const*, char const*)>
    assert(test2.field2 == 61 + final_pid);
  100218:	b9 00 00 00 00       	mov    $0x0,%ecx
  10021d:	ba 50 0f 10 00       	mov    $0x100f50,%edx
  100222:	be 33 00 00 00       	mov    $0x33,%esi
  100227:	bf 1b 10 10 00       	mov    $0x10101b,%edi
  10022c:	e8 96 0b 00 00       	call   100dc7 <assert_fail(char const*, int, char const*, char const*)>
    register uintptr_t rax asm("rax") = syscallno;
  100231:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  100236:	48 8b 3d d3 2d 00 00 	mov    0x2dd3(%rip),%rdi        # 103010 <heap_top>
  10023d:	0f 05                	syscall
            if (sys_page_alloc((void*) heap_top) < 0) {
  10023f:	85 c0                	test   %eax,%eax
  100241:	0f 88 99 00 00 00    	js     1002e0 <process_main()+0x2e0>
            for (unsigned long* l = (unsigned long*) heap_top;
  100247:	48 8b 0d c2 2d 00 00 	mov    0x2dc2(%rip),%rcx        # 103010 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  10024e:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  100255:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  100258:	48 83 38 00          	cmpq   $0x0,(%rax)
  10025c:	75 69                	jne    1002c7 <process_main()+0x2c7>
            for (unsigned long* l = (unsigned long*) heap_top;
  10025e:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  100262:	48 39 d0             	cmp    %rdx,%rax
  100265:	75 f1                	jne    100258 <process_main()+0x258>
            *heap_top = p;
  100267:	44 88 21             	mov    %r12b,(%rcx)
            console[CPOS(24, 79)] = p;
  10026a:	66 44 89 25 2c 8d fb 	mov    %r12w,-0x472d4(%rip)        # b8f9e <console+0xf9e>
  100271:	ff 
            heap_top += PAGESIZE;
  100272:	48 81 05 93 2d 00 00 	addq   $0x1000,0x2d93(%rip)        # 103010 <heap_top>
  100279:	00 10 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  10027d:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  100282:	0f 05                	syscall
    while (heap_top != stack_bottom) {
  100284:	48 8b 05 7d 2d 00 00 	mov    0x2d7d(%rip),%rax        # 103008 <stack_bottom>
  10028b:	48 39 05 7e 2d 00 00 	cmp    %rax,0x2d7e(%rip)        # 103010 <heap_top>
  100292:	74 4c                	je     1002e0 <process_main()+0x2e0>
        int x = rand(0, ALLOC_SLOWDOWN - 1);
  100294:	be 63 00 00 00       	mov    $0x63,%esi
  100299:	bf 00 00 00 00       	mov    $0x0,%edi
  10029e:	e8 45 01 00 00       	call   1003e8 <rand(int, int)>
        if (x < p) {
  1002a3:	39 d8                	cmp    %ebx,%eax
  1002a5:	7c 8a                	jl     100231 <process_main()+0x231>
        } else if (x < p + 1 && heap_bottom < heap_top) {
  1002a7:	75 d4                	jne    10027d <process_main()+0x27d>
  1002a9:	48 8b 05 60 2d 00 00 	mov    0x2d60(%rip),%rax        # 103010 <heap_top>
  1002b0:	49 39 c5             	cmp    %rax,%r13
  1002b3:	73 c8                	jae    10027d <process_main()+0x27d>
                                  (uintptr_t) heap_top - 1);
  1002b5:	8d 70 ff             	lea    -0x1(%rax),%esi
            uintptr_t addr = rand((uintptr_t) heap_bottom,
  1002b8:	44 89 f7             	mov    %r14d,%edi
  1002bb:	e8 28 01 00 00       	call   1003e8 <rand(int, int)>
                                  (uintptr_t) heap_top - 1);
  1002c0:	48 98                	cltq
            *((char*) addr) = p;
  1002c2:	44 88 20             	mov    %r12b,(%rax)
  1002c5:	eb b6                	jmp    10027d <process_main()+0x27d>
                assert(*l == 0);
  1002c7:	b9 00 00 00 00       	mov    $0x0,%ecx
  1002cc:	ba 86 10 10 00       	mov    $0x101086,%edx
  1002d1:	be 48 00 00 00       	mov    $0x48,%esi
  1002d6:	bf 1b 10 10 00       	mov    $0x10101b,%edi
  1002db:	e8 e7 0a 00 00       	call   100dc7 <assert_fail(char const*, int, char const*, char const*)>
    register uintptr_t rax asm("rax") = syscallno;
  1002e0:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  1002e5:	0f 05                	syscall
        }
        sys_yield();
    }

    // After running out of memory, do nothing forever
    while (true) {
  1002e7:	eb f7                	jmp    1002e0 <process_main()+0x2e0>
  1002e9:	90                   	nop

00000000001002ea <string_printer::putc(unsigned char)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c) override {
  1002ea:	f3 0f 1e fa          	endbr64
        if (s_ < end_) {
  1002ee:	48 8b 47 10          	mov    0x10(%rdi),%rax
  1002f2:	48 3b 47 18          	cmp    0x18(%rdi),%rax
  1002f6:	73 0b                	jae    100303 <string_printer::putc(unsigned char)+0x19>
            *s_++ = c;
  1002f8:	48 8d 50 01          	lea    0x1(%rax),%rdx
  1002fc:	48 89 57 10          	mov    %rdx,0x10(%rdi)
  100300:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  100303:	48 83 47 20 01       	addq   $0x1,0x20(%rdi)
    }
  100308:	c3                   	ret

0000000000100309 <strlen>:
size_t strlen(const char* s) {
  100309:	f3 0f 1e fa          	endbr64
    for (n = 0; *s != '\0'; ++s) {
  10030d:	80 3f 00             	cmpb   $0x0,(%rdi)
  100310:	74 10                	je     100322 <strlen+0x19>
  100312:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  100317:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  10031b:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  10031f:	75 f6                	jne    100317 <strlen+0xe>
  100321:	c3                   	ret
  100322:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100327:	c3                   	ret

0000000000100328 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  100328:	f3 0f 1e fa          	endbr64
  10032c:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  10032f:	ba 00 00 00 00       	mov    $0x0,%edx
  100334:	48 85 f6             	test   %rsi,%rsi
  100337:	74 10                	je     100349 <strnlen+0x21>
  100339:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  10033d:	74 0b                	je     10034a <strnlen+0x22>
        ++n;
  10033f:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  100343:	48 39 d0             	cmp    %rdx,%rax
  100346:	75 f1                	jne    100339 <strnlen+0x11>
  100348:	c3                   	ret
  100349:	c3                   	ret
  10034a:	48 89 d0             	mov    %rdx,%rax
}
  10034d:	c3                   	ret

000000000010034e <strchr>:
char* strchr(const char* s, int c) {
  10034e:	f3 0f 1e fa          	endbr64
    while (*s != '\0' && *s != (char) c) {
  100352:	0f b6 07             	movzbl (%rdi),%eax
  100355:	84 c0                	test   %al,%al
  100357:	74 10                	je     100369 <strchr+0x1b>
  100359:	40 38 f0             	cmp    %sil,%al
  10035c:	74 18                	je     100376 <strchr+0x28>
        ++s;
  10035e:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  100362:	0f b6 07             	movzbl (%rdi),%eax
  100365:	84 c0                	test   %al,%al
  100367:	75 f0                	jne    100359 <strchr+0xb>
        return (char*) s;
  100369:	40 84 f6             	test   %sil,%sil
  10036c:	b8 00 00 00 00       	mov    $0x0,%eax
  100371:	48 0f 44 c7          	cmove  %rdi,%rax
}
  100375:	c3                   	ret
        return (char*) s;
  100376:	48 89 f8             	mov    %rdi,%rax
  100379:	c3                   	ret

000000000010037a <srand(unsigned int)>:
void srand(unsigned seed) {
  10037a:	f3 0f 1e fa          	endbr64
    rand_seed = ((unsigned long) seed << 32) | seed;
  10037e:	89 f8                	mov    %edi,%eax
  100380:	48 c1 e7 20          	shl    $0x20,%rdi
  100384:	48 01 c7             	add    %rax,%rdi
	  = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_acquire);
	__glibcxx_assert(__b != memory_order_acq_rel);
	__glibcxx_assert(__b != memory_order_consume);

	__atomic_store_n(&_M_i, __i, int(__m));
  100387:	48 87 3d 8a 2c 00 00 	xchg   %rdi,0x2c8a(%rip)        # 103018 <rand_seed>
  10038e:	b8 01 00 00 00       	mov    $0x1,%eax
  100393:	87 05 87 2c 00 00    	xchg   %eax,0x2c87(%rip)        # 103020 <rand_seed_set>
}
  100399:	c3                   	ret

000000000010039a <rand()>:
int rand() {
  10039a:	f3 0f 1e fa          	endbr64
  10039e:	55                   	push   %rbp
  10039f:	48 89 e5             	mov    %rsp,%rbp
	memory_order __b __attribute__ ((__unused__))
	  = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_release);
	__glibcxx_assert(__b != memory_order_acq_rel);

	return __atomic_load_n(&_M_i, int(__m));
  1003a2:	8b 05 78 2c 00 00    	mov    0x2c78(%rip),%eax        # 103020 <rand_seed_set>
    if (!rand_seed_set) {
  1003a8:	85 c0                	test   %eax,%eax
  1003aa:	74 30                	je     1003dc <rand()+0x42>
  1003ac:	48 8b 05 65 2c 00 00 	mov    0x2c65(%rip),%rax        # 103018 <rand_seed>
        next_rs = rs * 6364136223846793005UL + 1;
  1003b3:	48 b9 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rcx
  1003ba:	f4 51 58 
  1003bd:	48 89 c2             	mov    %rax,%rdx
  1003c0:	48 0f af d1          	imul   %rcx,%rdx
  1003c4:	48 83 c2 01          	add    $0x1,%rdx
      compare_exchange_weak(__int_type& __i1, __int_type __i2,
			    memory_order __m1, memory_order __m2) noexcept
      {
	__glibcxx_assert(__is_valid_cmpexch_failure_order(__m2));

	return __atomic_compare_exchange_n(&_M_i, &__i1, __i2, 1,
  1003c8:	f0 48 0f b1 15 47 2c 	lock cmpxchg %rdx,0x2c47(%rip)        # 103018 <rand_seed>
  1003cf:	00 00 
    } while (!rand_seed.compare_exchange_weak(rs, next_rs));
  1003d1:	75 ea                	jne    1003bd <rand()+0x23>
    return (next_rs >> 33) & RAND_MAX;
  1003d3:	48 c1 ea 21          	shr    $0x21,%rdx
  1003d7:	48 89 d0             	mov    %rdx,%rax
}
  1003da:	5d                   	pop    %rbp
  1003db:	c3                   	ret
        srand(819234718U);
  1003dc:	bf 9e 87 d4 30       	mov    $0x30d4879e,%edi
  1003e1:	e8 94 ff ff ff       	call   10037a <srand(unsigned int)>
  1003e6:	eb c4                	jmp    1003ac <rand()+0x12>

00000000001003e8 <rand(int, int)>:
int rand(int min, int max) {
  1003e8:	f3 0f 1e fa          	endbr64
  1003ec:	55                   	push   %rbp
  1003ed:	48 89 e5             	mov    %rsp,%rbp
  1003f0:	41 55                	push   %r13
  1003f2:	41 54                	push   %r12
  1003f4:	53                   	push   %rbx
  1003f5:	48 83 ec 08          	sub    $0x8,%rsp
    assert(min <= max);
  1003f9:	39 f7                	cmp    %esi,%edi
  1003fb:	7f 42                	jg     10043f <rand(int, int)+0x57>
  1003fd:	41 89 fc             	mov    %edi,%r12d
  100400:	89 f3                	mov    %esi,%ebx
    unsigned div = (unsigned(RAND_MAX) + 1) / (max - min + 1),
  100402:	29 fb                	sub    %edi,%ebx
  100404:	83 c3 01             	add    $0x1,%ebx
  100407:	b8 00 00 00 80       	mov    $0x80000000,%eax
  10040c:	ba 00 00 00 00       	mov    $0x0,%edx
  100411:	f7 f3                	div    %ebx
  100413:	41 89 c5             	mov    %eax,%r13d
        top = div * (max - min + 1);
  100416:	0f af d8             	imul   %eax,%ebx
    assert(top > 0 && top <= unsigned(RAND_MAX) + 1);
  100419:	89 d8                	mov    %ebx,%eax
  10041b:	83 e8 01             	sub    $0x1,%eax
  10041e:	78 38                	js     100458 <rand(int, int)+0x70>
        unsigned r = rand();
  100420:	e8 75 ff ff ff       	call   10039a <rand()>
        if (r < top) {
  100425:	39 d8                	cmp    %ebx,%eax
  100427:	73 f7                	jae    100420 <rand(int, int)+0x38>
            return min + r / div;
  100429:	ba 00 00 00 00       	mov    $0x0,%edx
  10042e:	41 f7 f5             	div    %r13d
  100431:	44 01 e0             	add    %r12d,%eax
}
  100434:	48 83 c4 08          	add    $0x8,%rsp
  100438:	5b                   	pop    %rbx
  100439:	41 5c                	pop    %r12
  10043b:	41 5d                	pop    %r13
  10043d:	5d                   	pop    %rbp
  10043e:	c3                   	ret
    assert(min <= max);
  10043f:	b9 00 00 00 00       	mov    $0x0,%ecx
  100444:	ba 8e 10 10 00       	mov    $0x10108e,%edx
  100449:	be 49 01 00 00       	mov    $0x149,%esi
  10044e:	bf 99 10 10 00       	mov    $0x101099,%edi
  100453:	e8 6f 09 00 00       	call   100dc7 <assert_fail(char const*, int, char const*, char const*)>
    assert(top > 0 && top <= unsigned(RAND_MAX) + 1);
  100458:	b9 00 00 00 00       	mov    $0x0,%ecx
  10045d:	ba 70 0f 10 00       	mov    $0x100f70,%edx
  100462:	be 4e 01 00 00       	mov    $0x14e,%esi
  100467:	bf 99 10 10 00       	mov    $0x101099,%edi
  10046c:	e8 56 09 00 00       	call   100dc7 <assert_fail(char const*, int, char const*, char const*)>
  100471:	90                   	nop

0000000000100472 <printer::vprintf(char const*, __va_list_tag*)>:
void printer::vprintf(const char* format, va_list val) {
  100472:	f3 0f 1e fa          	endbr64
  100476:	55                   	push   %rbp
  100477:	48 89 e5             	mov    %rsp,%rbp
  10047a:	41 57                	push   %r15
  10047c:	41 56                	push   %r14
  10047e:	41 55                	push   %r13
  100480:	41 54                	push   %r12
  100482:	53                   	push   %rbx
  100483:	48 83 ec 48          	sub    $0x48,%rsp
  100487:	49 89 ff             	mov    %rdi,%r15
  10048a:	49 89 f4             	mov    %rsi,%r12
  10048d:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
    for (; *format; ++format) {
  100491:	0f b6 06             	movzbl (%rsi),%eax
  100494:	84 c0                	test   %al,%al
  100496:	0f 85 94 05 00 00    	jne    100a30 <printer::vprintf(char const*, __va_list_tag*)+0x5be>
}
  10049c:	48 83 c4 48          	add    $0x48,%rsp
  1004a0:	5b                   	pop    %rbx
  1004a1:	41 5c                	pop    %r12
  1004a3:	41 5d                	pop    %r13
  1004a5:	41 5e                	pop    %r14
  1004a7:	41 5f                	pop    %r15
  1004a9:	5d                   	pop    %rbp
  1004aa:	c3                   	ret
        for (++format; *format; ++format) {
  1004ab:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  1004b0:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
  1004b6:	45 84 e4             	test   %r12b,%r12b
  1004b9:	0f 84 01 01 00 00    	je     1005c0 <printer::vprintf(char const*, __va_list_tag*)+0x14e>
        int flags = 0;
  1004bf:	41 be 00 00 00 00    	mov    $0x0,%r14d
            const char* flagc = strchr(flag_chars, *format);
  1004c5:	41 0f be f4          	movsbl %r12b,%esi
  1004c9:	bf c1 17 10 00       	mov    $0x1017c1,%edi
  1004ce:	e8 7b fe ff ff       	call   10034e <strchr>
  1004d3:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  1004d6:	48 85 c0             	test   %rax,%rax
  1004d9:	74 70                	je     10054b <printer::vprintf(char const*, __va_list_tag*)+0xd9>
                flags |= 1 << (flagc - flag_chars);
  1004db:	48 81 e9 c1 17 10 00 	sub    $0x1017c1,%rcx
  1004e2:	b8 01 00 00 00       	mov    $0x1,%eax
  1004e7:	d3 e0                	shl    %cl,%eax
  1004e9:	41 09 c6             	or     %eax,%r14d
        for (++format; *format; ++format) {
  1004ec:	48 83 c3 01          	add    $0x1,%rbx
  1004f0:	44 0f b6 23          	movzbl (%rbx),%r12d
  1004f4:	45 84 e4             	test   %r12b,%r12b
  1004f7:	75 cc                	jne    1004c5 <printer::vprintf(char const*, __va_list_tag*)+0x53>
        int width = -1;
  1004f9:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
  1004ff:	c7 45 a4 ff ff ff ff 	movl   $0xffffffff,-0x5c(%rbp)
        if (*format == '.') {
  100506:	80 3b 2e             	cmpb   $0x2e,(%rbx)
  100509:	0f 84 d8 00 00 00    	je     1005e7 <printer::vprintf(char const*, __va_list_tag*)+0x175>
        switch (*format) {
  10050f:	0f b6 03             	movzbl (%rbx),%eax
  100512:	3c 6c                	cmp    $0x6c,%al
  100514:	0f 84 73 01 00 00    	je     10068d <printer::vprintf(char const*, __va_list_tag*)+0x21b>
  10051a:	0f 8f 4e 01 00 00    	jg     10066e <printer::vprintf(char const*, __va_list_tag*)+0x1fc>
  100520:	3c 68                	cmp    $0x68,%al
  100522:	0f 85 88 01 00 00    	jne    1006b0 <printer::vprintf(char const*, __va_list_tag*)+0x23e>
            ++format;
  100528:	48 8d 43 01          	lea    0x1(%rbx),%rax
  10052c:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  100530:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  100534:	8d 50 bd             	lea    -0x43(%rax),%edx
  100537:	80 fa 35             	cmp    $0x35,%dl
  10053a:	0f 87 a6 05 00 00    	ja     100ae6 <printer::vprintf(char const*, __va_list_tag*)+0x674>
  100540:	0f b6 d2             	movzbl %dl,%edx
  100543:	3e ff 24 d5 d0 10 10 	notrack jmp *0x1010d0(,%rdx,8)
  10054a:	00 
        if (*format >= '1' && *format <= '9') {
  10054b:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
  100550:	3c 08                	cmp    $0x8,%al
  100552:	77 32                	ja     100586 <printer::vprintf(char const*, __va_list_tag*)+0x114>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100554:	0f b6 03             	movzbl (%rbx),%eax
  100557:	8d 50 d0             	lea    -0x30(%rax),%edx
  10055a:	80 fa 09             	cmp    $0x9,%dl
  10055d:	77 72                	ja     1005d1 <printer::vprintf(char const*, __va_list_tag*)+0x15f>
  10055f:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
  100565:	48 83 c3 01          	add    $0x1,%rbx
  100569:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
  10056e:	0f be c0             	movsbl %al,%eax
  100571:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100576:	0f b6 03             	movzbl (%rbx),%eax
  100579:	8d 50 d0             	lea    -0x30(%rax),%edx
  10057c:	80 fa 09             	cmp    $0x9,%dl
  10057f:	76 e4                	jbe    100565 <printer::vprintf(char const*, __va_list_tag*)+0xf3>
  100581:	e9 79 ff ff ff       	jmp    1004ff <printer::vprintf(char const*, __va_list_tag*)+0x8d>
        } else if (*format == '*') {
  100586:	41 80 fc 2a          	cmp    $0x2a,%r12b
  10058a:	75 50                	jne    1005dc <printer::vprintf(char const*, __va_list_tag*)+0x16a>
            width = va_arg(val, int);
  10058c:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100590:	8b 01                	mov    (%rcx),%eax
  100592:	83 f8 2f             	cmp    $0x2f,%eax
  100595:	77 17                	ja     1005ae <printer::vprintf(char const*, __va_list_tag*)+0x13c>
  100597:	89 c2                	mov    %eax,%edx
  100599:	48 03 51 10          	add    0x10(%rcx),%rdx
  10059d:	83 c0 08             	add    $0x8,%eax
  1005a0:	89 01                	mov    %eax,(%rcx)
  1005a2:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
  1005a5:	48 83 c3 01          	add    $0x1,%rbx
  1005a9:	e9 51 ff ff ff       	jmp    1004ff <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            width = va_arg(val, int);
  1005ae:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1005b2:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1005b6:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1005ba:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1005be:	eb e2                	jmp    1005a2 <printer::vprintf(char const*, __va_list_tag*)+0x130>
        int flags = 0;
  1005c0:	41 be 00 00 00 00    	mov    $0x0,%r14d
        int width = -1;
  1005c6:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  1005cc:	e9 2e ff ff ff       	jmp    1004ff <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1005d1:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  1005d7:	e9 23 ff ff ff       	jmp    1004ff <printer::vprintf(char const*, __va_list_tag*)+0x8d>
        int width = -1;
  1005dc:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  1005e2:	e9 18 ff ff ff       	jmp    1004ff <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            ++format;
  1005e7:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
  1005eb:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1005ef:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1005f2:	80 f9 09             	cmp    $0x9,%cl
  1005f5:	76 13                	jbe    10060a <printer::vprintf(char const*, __va_list_tag*)+0x198>
            } else if (*format == '*') {
  1005f7:	3c 2a                	cmp    $0x2a,%al
  1005f9:	74 33                	je     10062e <printer::vprintf(char const*, __va_list_tag*)+0x1bc>
            ++format;
  1005fb:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
  1005fe:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
  100605:	e9 05 ff ff ff       	jmp    10050f <printer::vprintf(char const*, __va_list_tag*)+0x9d>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  10060a:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  10060f:	48 83 c2 01          	add    $0x1,%rdx
  100613:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  100616:	0f be c0             	movsbl %al,%eax
  100619:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  10061d:	0f b6 02             	movzbl (%rdx),%eax
  100620:	8d 70 d0             	lea    -0x30(%rax),%esi
  100623:	40 80 fe 09          	cmp    $0x9,%sil
  100627:	76 e6                	jbe    10060f <printer::vprintf(char const*, __va_list_tag*)+0x19d>
  100629:	48 89 d3             	mov    %rdx,%rbx
  10062c:	eb 1c                	jmp    10064a <printer::vprintf(char const*, __va_list_tag*)+0x1d8>
                precision = va_arg(val, int);
  10062e:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100632:	8b 07                	mov    (%rdi),%eax
  100634:	83 f8 2f             	cmp    $0x2f,%eax
  100637:	77 23                	ja     10065c <printer::vprintf(char const*, __va_list_tag*)+0x1ea>
  100639:	89 c2                	mov    %eax,%edx
  10063b:	48 03 57 10          	add    0x10(%rdi),%rdx
  10063f:	83 c0 08             	add    $0x8,%eax
  100642:	89 07                	mov    %eax,(%rdi)
  100644:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  100646:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
  10064a:	85 c9                	test   %ecx,%ecx
  10064c:	b8 00 00 00 00       	mov    $0x0,%eax
  100651:	0f 49 c1             	cmovns %ecx,%eax
  100654:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100657:	e9 b3 fe ff ff       	jmp    10050f <printer::vprintf(char const*, __va_list_tag*)+0x9d>
                precision = va_arg(val, int);
  10065c:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100660:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100664:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100668:	48 89 47 08          	mov    %rax,0x8(%rdi)
  10066c:	eb d6                	jmp    100644 <printer::vprintf(char const*, __va_list_tag*)+0x1d2>
        switch (*format) {
  10066e:	3c 74                	cmp    $0x74,%al
  100670:	74 1b                	je     10068d <printer::vprintf(char const*, __va_list_tag*)+0x21b>
  100672:	3c 7a                	cmp    $0x7a,%al
  100674:	74 17                	je     10068d <printer::vprintf(char const*, __va_list_tag*)+0x21b>
        switch (*format) {
  100676:	8d 50 bd             	lea    -0x43(%rax),%edx
  100679:	80 fa 35             	cmp    $0x35,%dl
  10067c:	0f 87 5e 06 00 00    	ja     100ce0 <printer::vprintf(char const*, __va_list_tag*)+0x86e>
  100682:	0f b6 d2             	movzbl %dl,%edx
  100685:	3e ff 24 d5 80 12 10 	notrack jmp *0x101280(,%rdx,8)
  10068c:	00 
            ++format;
  10068d:	48 8d 43 01          	lea    0x1(%rbx),%rax
  100691:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  100695:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  100699:	8d 50 bd             	lea    -0x43(%rax),%edx
  10069c:	80 fa 35             	cmp    $0x35,%dl
  10069f:	0f 87 41 04 00 00    	ja     100ae6 <printer::vprintf(char const*, __va_list_tag*)+0x674>
  1006a5:	0f b6 d2             	movzbl %dl,%edx
  1006a8:	3e ff 24 d5 30 14 10 	notrack jmp *0x101430(,%rdx,8)
  1006af:	00 
  1006b0:	8d 50 bd             	lea    -0x43(%rax),%edx
  1006b3:	80 fa 35             	cmp    $0x35,%dl
  1006b6:	0f 87 26 04 00 00    	ja     100ae2 <printer::vprintf(char const*, __va_list_tag*)+0x670>
  1006bc:	0f b6 d2             	movzbl %dl,%edx
  1006bf:	3e ff 24 d5 e0 15 10 	notrack jmp *0x1015e0(,%rdx,8)
  1006c6:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1006c7:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1006cb:	8b 07                	mov    (%rdi),%eax
  1006cd:	83 f8 2f             	cmp    $0x2f,%eax
  1006d0:	77 36                	ja     100708 <printer::vprintf(char const*, __va_list_tag*)+0x296>
  1006d2:	89 c2                	mov    %eax,%edx
  1006d4:	48 03 57 10          	add    0x10(%rdi),%rdx
  1006d8:	83 c0 08             	add    $0x8,%eax
  1006db:	89 07                	mov    %eax,(%rdi)
  1006dd:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  1006e0:	48 89 d0             	mov    %rdx,%rax
  1006e3:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  1006e7:	49 89 d3             	mov    %rdx,%r11
  1006ea:	49 f7 db             	neg    %r11
  1006ed:	25 00 01 00 00       	and    $0x100,%eax
  1006f2:	4c 0f 44 da          	cmove  %rdx,%r11
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  1006f6:	44 09 f0             	or     %r14d,%eax
  1006f9:	0c c0                	or     $0xc0,%al
  1006fb:	41 89 c6             	mov    %eax,%r14d
        const char* data = "";
  1006fe:	bb a8 10 10 00       	mov    $0x1010a8,%ebx
            break;
  100703:	e9 f4 01 00 00       	jmp    1008fc <printer::vprintf(char const*, __va_list_tag*)+0x48a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100708:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  10070c:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100710:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100714:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100718:	eb c3                	jmp    1006dd <printer::vprintf(char const*, __va_list_tag*)+0x26b>
        switch (*format) {
  10071a:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  10071e:	eb 04                	jmp    100724 <printer::vprintf(char const*, __va_list_tag*)+0x2b2>
  100720:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100724:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100728:	8b 01                	mov    (%rcx),%eax
  10072a:	83 f8 2f             	cmp    $0x2f,%eax
  10072d:	77 10                	ja     10073f <printer::vprintf(char const*, __va_list_tag*)+0x2cd>
  10072f:	89 c2                	mov    %eax,%edx
  100731:	48 03 51 10          	add    0x10(%rcx),%rdx
  100735:	83 c0 08             	add    $0x8,%eax
  100738:	89 01                	mov    %eax,(%rcx)
  10073a:	48 63 12             	movslq (%rdx),%rdx
  10073d:	eb a1                	jmp    1006e0 <printer::vprintf(char const*, __va_list_tag*)+0x26e>
  10073f:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100743:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100747:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10074b:	48 89 47 08          	mov    %rax,0x8(%rdi)
  10074f:	eb e9                	jmp    10073a <printer::vprintf(char const*, __va_list_tag*)+0x2c8>
        switch (*format) {
  100751:	b8 01 00 00 00       	mov    $0x1,%eax
  100756:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  10075d:	e9 9d 00 00 00       	jmp    1007ff <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  100762:	b8 00 00 00 00       	mov    $0x0,%eax
  100767:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  10076e:	e9 8c 00 00 00       	jmp    1007ff <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  100773:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100777:	b8 00 00 00 00       	mov    $0x0,%eax
  10077c:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  100783:	eb 7a                	jmp    1007ff <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  100785:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100789:	b8 00 00 00 00       	mov    $0x0,%eax
  10078e:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  100795:	eb 68                	jmp    1007ff <printer::vprintf(char const*, __va_list_tag*)+0x38d>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  100797:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  10079b:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  10079f:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1007a3:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1007a7:	eb 70                	jmp    100819 <printer::vprintf(char const*, __va_list_tag*)+0x3a7>
  1007a9:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1007ad:	8b 07                	mov    (%rdi),%eax
  1007af:	83 f8 2f             	cmp    $0x2f,%eax
  1007b2:	77 10                	ja     1007c4 <printer::vprintf(char const*, __va_list_tag*)+0x352>
  1007b4:	89 c2                	mov    %eax,%edx
  1007b6:	48 03 57 10          	add    0x10(%rdi),%rdx
  1007ba:	83 c0 08             	add    $0x8,%eax
  1007bd:	89 07                	mov    %eax,(%rdi)
  1007bf:	44 8b 1a             	mov    (%rdx),%r11d
  1007c2:	eb 58                	jmp    10081c <printer::vprintf(char const*, __va_list_tag*)+0x3aa>
  1007c4:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1007c8:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1007cc:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1007d0:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1007d4:	eb e9                	jmp    1007bf <printer::vprintf(char const*, __va_list_tag*)+0x34d>
        switch (*format) {
  1007d6:	b8 01 00 00 00       	mov    $0x1,%eax
  1007db:	eb 1b                	jmp    1007f8 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  1007dd:	b8 00 00 00 00       	mov    $0x0,%eax
  1007e2:	eb 14                	jmp    1007f8 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  1007e4:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1007e8:	b8 00 00 00 00       	mov    $0x0,%eax
  1007ed:	eb 09                	jmp    1007f8 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  1007ef:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1007f3:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  1007f8:	c7 45 a0 f0 ff ff ff 	movl   $0xfffffff0,-0x60(%rbp)
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1007ff:	85 c0                	test   %eax,%eax
  100801:	74 a6                	je     1007a9 <printer::vprintf(char const*, __va_list_tag*)+0x337>
  100803:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100807:	8b 07                	mov    (%rdi),%eax
  100809:	83 f8 2f             	cmp    $0x2f,%eax
  10080c:	77 89                	ja     100797 <printer::vprintf(char const*, __va_list_tag*)+0x325>
  10080e:	89 c2                	mov    %eax,%edx
  100810:	48 03 57 10          	add    0x10(%rdi),%rdx
  100814:	83 c0 08             	add    $0x8,%eax
  100817:	89 07                	mov    %eax,(%rdi)
  100819:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_NUMERIC;
  10081c:	44 89 f0             	mov    %r14d,%eax
  10081f:	83 c8 40             	or     $0x40,%eax
    if (base < 0) {
  100822:	83 7d a0 00          	cmpl   $0x0,-0x60(%rbp)
  100826:	0f 89 de 02 00 00    	jns    100b0a <printer::vprintf(char const*, __va_list_tag*)+0x698>
    *--pos = '\0';
  10082c:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100830:	a8 20                	test   $0x20,%al
  100832:	0f 85 01 03 00 00    	jne    100b39 <printer::vprintf(char const*, __va_list_tag*)+0x6c7>
  100838:	41 89 c6             	mov    %eax,%r14d
        digits = lower_digits;
  10083b:	41 ba 90 17 10 00    	mov    $0x101790,%r10d
        base = -base;
  100841:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  100847:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = nullptr;
  10084e:	bf 00 00 00 00       	mov    $0x0,%edi
  100853:	e9 03 03 00 00       	jmp    100b5b <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
        switch (*format) {
  100858:	b8 01 00 00 00       	mov    $0x1,%eax
  10085d:	eb 1b                	jmp    10087a <printer::vprintf(char const*, __va_list_tag*)+0x408>
  10085f:	b8 00 00 00 00       	mov    $0x0,%eax
  100864:	eb 14                	jmp    10087a <printer::vprintf(char const*, __va_list_tag*)+0x408>
  100866:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  10086a:	b8 00 00 00 00       	mov    $0x0,%eax
  10086f:	eb 09                	jmp    10087a <printer::vprintf(char const*, __va_list_tag*)+0x408>
  100871:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100875:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  10087a:	c7 45 a0 10 00 00 00 	movl   $0x10,-0x60(%rbp)
            goto format_unsigned;
  100881:	e9 79 ff ff ff       	jmp    1007ff <printer::vprintf(char const*, __va_list_tag*)+0x38d>
        switch (*format) {
  100886:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  10088a:	eb 04                	jmp    100890 <printer::vprintf(char const*, __va_list_tag*)+0x41e>
  10088c:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            num = (uintptr_t) va_arg(val, void*);
  100890:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100894:	8b 01                	mov    (%rcx),%eax
  100896:	83 f8 2f             	cmp    $0x2f,%eax
  100899:	77 22                	ja     1008bd <printer::vprintf(char const*, __va_list_tag*)+0x44b>
  10089b:	89 c2                	mov    %eax,%edx
  10089d:	48 03 51 10          	add    0x10(%rcx),%rdx
  1008a1:	83 c0 08             	add    $0x8,%eax
  1008a4:	89 01                	mov    %eax,(%rcx)
  1008a6:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  1008a9:	44 89 f0             	mov    %r14d,%eax
  1008ac:	0d 41 02 00 00       	or     $0x241,%eax
            base = -16;
  1008b1:	c7 45 a0 f0 ff ff ff 	movl   $0xfffffff0,-0x60(%rbp)
  1008b8:	e9 6f ff ff ff       	jmp    10082c <printer::vprintf(char const*, __va_list_tag*)+0x3ba>
            num = (uintptr_t) va_arg(val, void*);
  1008bd:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1008c1:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1008c5:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1008c9:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1008cd:	eb d7                	jmp    1008a6 <printer::vprintf(char const*, __va_list_tag*)+0x434>
        switch (*format) {
  1008cf:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1008d3:	eb 04                	jmp    1008d9 <printer::vprintf(char const*, __va_list_tag*)+0x467>
  1008d5:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = va_arg(val, char*);
  1008d9:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1008dd:	8b 01                	mov    (%rcx),%eax
  1008df:	83 f8 2f             	cmp    $0x2f,%eax
  1008e2:	0f 87 61 01 00 00    	ja     100a49 <printer::vprintf(char const*, __va_list_tag*)+0x5d7>
  1008e8:	89 c2                	mov    %eax,%edx
  1008ea:	48 03 51 10          	add    0x10(%rcx),%rdx
  1008ee:	83 c0 08             	add    $0x8,%eax
  1008f1:	89 01                	mov    %eax,(%rcx)
  1008f3:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  1008f6:	41 bb 00 00 00 00    	mov    $0x0,%r11d
        if (flags & FLAG_NUMERIC) {
  1008fc:	44 89 f0             	mov    %r14d,%eax
  1008ff:	83 e0 40             	and    $0x40,%eax
  100902:	89 45 94             	mov    %eax,-0x6c(%rbp)
        const char* prefix = "";
  100905:	41 bc a8 10 10 00    	mov    $0x1010a8,%r12d
        if (flags & FLAG_NUMERIC) {
  10090b:	0f 85 e9 03 00 00    	jne    100cfa <printer::vprintf(char const*, __va_list_tag*)+0x888>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  100911:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  100914:	89 d0                	mov    %edx,%eax
  100916:	f7 d0                	not    %eax
  100918:	c1 e8 1f             	shr    $0x1f,%eax
  10091b:	89 45 90             	mov    %eax,-0x70(%rbp)
  10091e:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
  100922:	0f 85 54 03 00 00    	jne    100c7c <printer::vprintf(char const*, __va_list_tag*)+0x80a>
  100928:	84 c0                	test   %al,%al
  10092a:	0f 84 4c 03 00 00    	je     100c7c <printer::vprintf(char const*, __va_list_tag*)+0x80a>
            datalen = strnlen(data, precision);
  100930:	48 63 f2             	movslq %edx,%rsi
  100933:	48 89 df             	mov    %rbx,%rdi
  100936:	e8 ed f9 ff ff       	call   100328 <strnlen>
  10093b:	89 45 a0             	mov    %eax,-0x60(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  10093e:	44 89 f0             	mov    %r14d,%eax
  100941:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  100944:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  10094b:	83 f8 42             	cmp    $0x42,%eax
  10094e:	0f 84 60 03 00 00    	je     100cb4 <printer::vprintf(char const*, __va_list_tag*)+0x842>
        width -= datalen + zeros + strlen(prefix);
  100954:	4c 89 e7             	mov    %r12,%rdi
  100957:	e8 ad f9 ff ff       	call   100309 <strlen>
  10095c:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  10095f:	8b 7d a0             	mov    -0x60(%rbp),%edi
  100962:	8d 0c 3a             	lea    (%rdx,%rdi,1),%ecx
  100965:	44 89 ea             	mov    %r13d,%edx
  100968:	29 ca                	sub    %ecx,%edx
  10096a:	29 c2                	sub    %eax,%edx
  10096c:	41 89 d5             	mov    %edx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  10096f:	41 f6 c6 04          	test   $0x4,%r14b
  100973:	75 31                	jne    1009a6 <printer::vprintf(char const*, __va_list_tag*)+0x534>
  100975:	85 d2                	test   %edx,%edx
  100977:	7e 2d                	jle    1009a6 <printer::vprintf(char const*, __va_list_tag*)+0x534>
        width -= datalen + zeros + strlen(prefix);
  100979:	41 89 d6             	mov    %edx,%r14d
            putc(' ');
  10097c:	49 8b 07             	mov    (%r15),%rax
  10097f:	be 20 00 00 00       	mov    $0x20,%esi
  100984:	4c 89 ff             	mov    %r15,%rdi
  100987:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100989:	41 83 ed 01          	sub    $0x1,%r13d
  10098d:	45 85 ed             	test   %r13d,%r13d
  100990:	7f ea                	jg     10097c <printer::vprintf(char const*, __va_list_tag*)+0x50a>
  100992:	44 89 f2             	mov    %r14d,%edx
  100995:	45 85 f6             	test   %r14d,%r14d
  100998:	b8 01 00 00 00       	mov    $0x1,%eax
  10099d:	41 0f 4f c6          	cmovg  %r14d,%eax
  1009a1:	29 c2                	sub    %eax,%edx
  1009a3:	41 89 d5             	mov    %edx,%r13d
        for (; *prefix; ++prefix) {
  1009a6:	41 0f b6 04 24       	movzbl (%r12),%eax
  1009ab:	84 c0                	test   %al,%al
  1009ad:	74 18                	je     1009c7 <printer::vprintf(char const*, __va_list_tag*)+0x555>
            putc(*prefix);
  1009af:	0f b6 f0             	movzbl %al,%esi
  1009b2:	49 8b 07             	mov    (%r15),%rax
  1009b5:	4c 89 ff             	mov    %r15,%rdi
  1009b8:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  1009ba:	49 83 c4 01          	add    $0x1,%r12
  1009be:	41 0f b6 04 24       	movzbl (%r12),%eax
  1009c3:	84 c0                	test   %al,%al
  1009c5:	75 e8                	jne    1009af <printer::vprintf(char const*, __va_list_tag*)+0x53d>
        for (; zeros > 0; --zeros) {
  1009c7:	44 8b 65 a4          	mov    -0x5c(%rbp),%r12d
  1009cb:	45 85 e4             	test   %r12d,%r12d
  1009ce:	7e 13                	jle    1009e3 <printer::vprintf(char const*, __va_list_tag*)+0x571>
            putc('0');
  1009d0:	49 8b 07             	mov    (%r15),%rax
  1009d3:	be 30 00 00 00       	mov    $0x30,%esi
  1009d8:	4c 89 ff             	mov    %r15,%rdi
  1009db:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  1009dd:	41 83 ec 01          	sub    $0x1,%r12d
  1009e1:	75 ed                	jne    1009d0 <printer::vprintf(char const*, __va_list_tag*)+0x55e>
        for (; datalen > 0; ++data, --datalen) {
  1009e3:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1009e6:	85 c0                	test   %eax,%eax
  1009e8:	7e 1a                	jle    100a04 <printer::vprintf(char const*, __va_list_tag*)+0x592>
  1009ea:	41 89 c6             	mov    %eax,%r14d
  1009ed:	49 01 de             	add    %rbx,%r14
            putc(*data);
  1009f0:	0f b6 33             	movzbl (%rbx),%esi
  1009f3:	49 8b 07             	mov    (%r15),%rax
  1009f6:	4c 89 ff             	mov    %r15,%rdi
  1009f9:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  1009fb:	48 83 c3 01          	add    $0x1,%rbx
  1009ff:	49 39 de             	cmp    %rbx,%r14
  100a02:	75 ec                	jne    1009f0 <printer::vprintf(char const*, __va_list_tag*)+0x57e>
        for (; width > 0; --width) {
  100a04:	45 85 ed             	test   %r13d,%r13d
  100a07:	7e 13                	jle    100a1c <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            putc(' ');
  100a09:	49 8b 07             	mov    (%r15),%rax
  100a0c:	be 20 00 00 00       	mov    $0x20,%esi
  100a11:	4c 89 ff             	mov    %r15,%rdi
  100a14:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  100a16:	41 83 ed 01          	sub    $0x1,%r13d
  100a1a:	75 ed                	jne    100a09 <printer::vprintf(char const*, __va_list_tag*)+0x597>
    for (; *format; ++format) {
  100a1c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  100a20:	4c 8d 60 01          	lea    0x1(%rax),%r12
  100a24:	0f b6 40 01          	movzbl 0x1(%rax),%eax
  100a28:	84 c0                	test   %al,%al
  100a2a:	0f 84 6c fa ff ff    	je     10049c <printer::vprintf(char const*, __va_list_tag*)+0x2a>
        if (*format != '%') {
  100a30:	3c 25                	cmp    $0x25,%al
  100a32:	0f 84 73 fa ff ff    	je     1004ab <printer::vprintf(char const*, __va_list_tag*)+0x39>
            putc(*format);
  100a38:	0f b6 f0             	movzbl %al,%esi
  100a3b:	49 8b 07             	mov    (%r15),%rax
  100a3e:	4c 89 ff             	mov    %r15,%rdi
  100a41:	ff 10                	call   *(%rax)
            continue;
  100a43:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
  100a47:	eb d3                	jmp    100a1c <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            data = va_arg(val, char*);
  100a49:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100a4d:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100a51:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100a55:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100a59:	e9 95 fe ff ff       	jmp    1008f3 <printer::vprintf(char const*, __va_list_tag*)+0x481>
        switch (*format) {
  100a5e:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100a62:	eb 04                	jmp    100a68 <printer::vprintf(char const*, __va_list_tag*)+0x5f6>
  100a64:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            color_ = va_arg(val, int);
  100a68:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100a6c:	8b 07                	mov    (%rdi),%eax
  100a6e:	83 f8 2f             	cmp    $0x2f,%eax
  100a71:	77 13                	ja     100a86 <printer::vprintf(char const*, __va_list_tag*)+0x614>
  100a73:	89 c2                	mov    %eax,%edx
  100a75:	48 03 57 10          	add    0x10(%rdi),%rdx
  100a79:	83 c0 08             	add    $0x8,%eax
  100a7c:	89 07                	mov    %eax,(%rdi)
  100a7e:	8b 02                	mov    (%rdx),%eax
  100a80:	41 89 47 08          	mov    %eax,0x8(%r15)
            continue;
  100a84:	eb 96                	jmp    100a1c <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            color_ = va_arg(val, int);
  100a86:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100a8a:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100a8e:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100a92:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100a96:	eb e6                	jmp    100a7e <printer::vprintf(char const*, __va_list_tag*)+0x60c>
        switch (*format) {
  100a98:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100a9c:	eb 04                	jmp    100aa2 <printer::vprintf(char const*, __va_list_tag*)+0x630>
  100a9e:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = va_arg(val, int);
  100aa2:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100aa6:	8b 01                	mov    (%rcx),%eax
  100aa8:	83 f8 2f             	cmp    $0x2f,%eax
  100aab:	77 23                	ja     100ad0 <printer::vprintf(char const*, __va_list_tag*)+0x65e>
  100aad:	89 c2                	mov    %eax,%edx
  100aaf:	48 03 51 10          	add    0x10(%rcx),%rdx
  100ab3:	83 c0 08             	add    $0x8,%eax
  100ab6:	89 01                	mov    %eax,(%rcx)
  100ab8:	8b 02                	mov    (%rdx),%eax
  100aba:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100abd:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  100ac1:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100ac5:	41 bb 00 00 00 00    	mov    $0x0,%r11d
            break;
  100acb:	e9 2c fe ff ff       	jmp    1008fc <printer::vprintf(char const*, __va_list_tag*)+0x48a>
            numbuf[0] = va_arg(val, int);
  100ad0:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100ad4:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100ad8:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100adc:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100ae0:	eb d6                	jmp    100ab8 <printer::vprintf(char const*, __va_list_tag*)+0x646>
        switch (*format) {
  100ae2:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = (*format ? *format : '%');
  100ae6:	84 c0                	test   %al,%al
  100ae8:	0f 85 ee 01 00 00    	jne    100cdc <printer::vprintf(char const*, __va_list_tag*)+0x86a>
  100aee:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  100af2:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  100af6:	48 83 6d a8 01       	subq   $0x1,-0x58(%rbp)
            data = numbuf;
  100afb:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100aff:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  100b05:	e9 f2 fd ff ff       	jmp    1008fc <printer::vprintf(char const*, __va_list_tag*)+0x48a>
    *--pos = '\0';
  100b0a:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100b0e:	41 f6 c6 20          	test   $0x20,%r14b
  100b12:	74 73                	je     100b87 <printer::vprintf(char const*, __va_list_tag*)+0x715>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100b14:	8b 55 a0             	mov    -0x60(%rbp),%edx
  100b17:	41 89 d1             	mov    %edx,%r9d
  100b1a:	41 89 c6             	mov    %eax,%r14d
  100b1d:	41 ba b0 17 10 00    	mov    $0x1017b0,%r10d
  100b23:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
  100b2a:	83 fa 0a             	cmp    $0xa,%edx
  100b2d:	0f 94 c0             	sete   %al
  100b30:	0f b6 c0             	movzbl %al,%eax
  100b33:	48 83 e8 04          	sub    $0x4,%rax
  100b37:	eb 1d                	jmp    100b56 <printer::vprintf(char const*, __va_list_tag*)+0x6e4>
    if (flags & FLAG_THOUSANDS) {
  100b39:	41 89 c6             	mov    %eax,%r14d
        digits = lower_digits;
  100b3c:	41 ba 90 17 10 00    	mov    $0x101790,%r10d
        base = -base;
  100b42:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  100b48:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100b4f:	48 c7 c0 fc ff ff ff 	mov    $0xfffffffffffffffc,%rax
  100b56:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  100b5b:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  100b5f:	4c 89 d8             	mov    %r11,%rax
            *--pos = digits[val % base];
  100b62:	49 63 f1             	movslq %r9d,%rsi
    } while (val != 0 && pos != buf);
  100b65:	4c 8d 45 b0          	lea    -0x50(%rbp),%r8
  100b69:	eb 57                	jmp    100bc2 <printer::vprintf(char const*, __va_list_tag*)+0x750>
    if (flags & FLAG_THOUSANDS) {
  100b6b:	41 ba b0 17 10 00    	mov    $0x1017b0,%r10d
  100b71:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  100b77:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100b7e:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  100b85:	eb cf                	jmp    100b56 <printer::vprintf(char const*, __va_list_tag*)+0x6e4>
  100b87:	44 8b 4d a0          	mov    -0x60(%rbp),%r9d
  100b8b:	41 89 c6             	mov    %eax,%r14d
  100b8e:	41 ba b0 17 10 00    	mov    $0x1017b0,%r10d
  100b94:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = nullptr;
  100b9b:	bf 00 00 00 00       	mov    $0x0,%edi
  100ba0:	eb b9                	jmp    100b5b <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
            *--pos = digits[val % base];
  100ba2:	48 89 cb             	mov    %rcx,%rbx
  100ba5:	ba 00 00 00 00       	mov    $0x0,%edx
  100baa:	48 f7 f6             	div    %rsi
  100bad:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
  100bb2:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  100bb4:	48 83 e9 01          	sub    $0x1,%rcx
  100bb8:	48 85 c0             	test   %rax,%rax
  100bbb:	74 2d                	je     100bea <printer::vprintf(char const*, __va_list_tag*)+0x778>
  100bbd:	4c 39 c3             	cmp    %r8,%rbx
  100bc0:	74 28                	je     100bea <printer::vprintf(char const*, __va_list_tag*)+0x778>
        if (pos == thousands_pos) {
  100bc2:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  100bc6:	48 39 d7             	cmp    %rdx,%rdi
  100bc9:	75 d7                	jne    100ba2 <printer::vprintf(char const*, __va_list_tag*)+0x730>
            *--pos = base == 10 ? ',' : '\'';
  100bcb:	48 89 cb             	mov    %rcx,%rbx
  100bce:	41 83 f9 0a          	cmp    $0xa,%r9d
  100bd2:	0f 94 c2             	sete   %dl
  100bd5:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  100bd9:	40 0f 94 c7          	sete   %dil
  100bdd:	40 0f b6 ff          	movzbl %dil,%edi
  100be1:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  100be3:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  100be8:	eb ca                	jmp    100bb4 <printer::vprintf(char const*, __va_list_tag*)+0x742>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  100bea:	44 89 f0             	mov    %r14d,%eax
  100bed:	f7 d0                	not    %eax
  100bef:	a8 c0                	test   $0xc0,%al
  100bf1:	75 3b                	jne    100c2e <printer::vprintf(char const*, __va_list_tag*)+0x7bc>
                prefix = "-";
  100bf3:	41 bc a5 10 10 00    	mov    $0x1010a5,%r12d
            if (flags & FLAG_NEGATIVE) {
  100bf9:	41 f7 c6 00 01 00 00 	test   $0x100,%r14d
  100c00:	0f 85 0b fd ff ff    	jne    100911 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                prefix = "+";
  100c06:	41 bc a0 10 10 00    	mov    $0x1010a0,%r12d
            } else if (flags & FLAG_PLUSPOSITIVE) {
  100c0c:	41 f6 c6 10          	test   $0x10,%r14b
  100c10:	0f 85 fb fc ff ff    	jne    100911 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
        const char* prefix = "";
  100c16:	41 f6 c6 08          	test   $0x8,%r14b
  100c1a:	41 bc a7 10 10 00    	mov    $0x1010a7,%r12d
  100c20:	b8 a8 10 10 00       	mov    $0x1010a8,%eax
  100c25:	4c 0f 44 e0          	cmove  %rax,%r12
  100c29:	e9 e3 fc ff ff       	jmp    100911 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
  100c2e:	41 bc a8 10 10 00    	mov    $0x1010a8,%r12d
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100c34:	44 89 f0             	mov    %r14d,%eax
  100c37:	f7 d0                	not    %eax
  100c39:	a8 41                	test   $0x41,%al
  100c3b:	0f 85 d0 fc ff ff    	jne    100911 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                   && (base == 16 || base == -16)
  100c41:	8b 45 a0             	mov    -0x60(%rbp),%eax
  100c44:	83 c0 10             	add    $0x10,%eax
  100c47:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  100c4c:	0f 85 bf fc ff ff    	jne    100911 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                   && (num || (flags & FLAG_ALT2))) {
  100c52:	4d 85 db             	test   %r11,%r11
  100c55:	75 0d                	jne    100c64 <printer::vprintf(char const*, __va_list_tag*)+0x7f2>
  100c57:	41 f7 c6 00 02 00 00 	test   $0x200,%r14d
  100c5e:	0f 84 ad fc ff ff    	je     100911 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
            prefix = (base == -16 ? "0x" : "0X");
  100c64:	83 7d a0 f0          	cmpl   $0xfffffff0,-0x60(%rbp)
  100c68:	41 bc a2 10 10 00    	mov    $0x1010a2,%r12d
  100c6e:	b8 a9 10 10 00       	mov    $0x1010a9,%eax
  100c73:	4c 0f 44 e0          	cmove  %rax,%r12
  100c77:	e9 95 fc ff ff       	jmp    100911 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
            datalen = strlen(data);
  100c7c:	48 89 df             	mov    %rbx,%rdi
  100c7f:	e8 85 f6 ff ff       	call   100309 <strlen>
  100c84:	89 45 a0             	mov    %eax,-0x60(%rbp)
            && precision >= 0) {
  100c87:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
  100c8b:	0f 84 ad fc ff ff    	je     10093e <printer::vprintf(char const*, __va_list_tag*)+0x4cc>
  100c91:	80 7d 90 00          	cmpb   $0x0,-0x70(%rbp)
  100c95:	0f 84 a3 fc ff ff    	je     10093e <printer::vprintf(char const*, __va_list_tag*)+0x4cc>
            zeros = precision > datalen ? precision - datalen : 0;
  100c9b:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  100c9e:	89 fa                	mov    %edi,%edx
  100ca0:	29 c2                	sub    %eax,%edx
  100ca2:	39 c7                	cmp    %eax,%edi
  100ca4:	b8 00 00 00 00       	mov    $0x0,%eax
  100ca9:	0f 4f c2             	cmovg  %edx,%eax
  100cac:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100caf:	e9 a0 fc ff ff       	jmp    100954 <printer::vprintf(char const*, __va_list_tag*)+0x4e2>
                   && datalen + (int) strlen(prefix) < width) {
  100cb4:	4c 89 e7             	mov    %r12,%rdi
  100cb7:	e8 4d f6 ff ff       	call   100309 <strlen>
  100cbc:	8b 7d a0             	mov    -0x60(%rbp),%edi
  100cbf:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  100cc2:	44 89 e9             	mov    %r13d,%ecx
  100cc5:	29 f9                	sub    %edi,%ecx
  100cc7:	29 c1                	sub    %eax,%ecx
  100cc9:	44 39 ea             	cmp    %r13d,%edx
  100ccc:	b8 00 00 00 00       	mov    $0x0,%eax
  100cd1:	0f 4c c1             	cmovl  %ecx,%eax
  100cd4:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100cd7:	e9 78 fc ff ff       	jmp    100954 <printer::vprintf(char const*, __va_list_tag*)+0x4e2>
  100cdc:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
            numbuf[0] = (*format ? *format : '%');
  100ce0:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100ce3:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
  100ce7:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = numbuf;
  100ceb:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100cef:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  100cf5:	e9 02 fc ff ff       	jmp    1008fc <printer::vprintf(char const*, __va_list_tag*)+0x48a>
    *--pos = '\0';
  100cfa:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100cfe:	41 f6 c6 20          	test   $0x20,%r14b
  100d02:	0f 85 63 fe ff ff    	jne    100b6b <printer::vprintf(char const*, __va_list_tag*)+0x6f9>
  100d08:	41 ba b0 17 10 00    	mov    $0x1017b0,%r10d
  100d0e:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  100d14:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
        thousands_pos = nullptr;
  100d1b:	bf 00 00 00 00       	mov    $0x0,%edi
  100d20:	e9 36 fe ff ff       	jmp    100b5b <printer::vprintf(char const*, __va_list_tag*)+0x6e9>

0000000000100d25 <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  100d25:	f3 0f 1e fa          	endbr64
  100d29:	55                   	push   %rbp
  100d2a:	48 89 e5             	mov    %rsp,%rbp
  100d2d:	53                   	push   %rbx
  100d2e:	48 83 ec 38          	sub    $0x38,%rsp
  100d32:	48 89 f3             	mov    %rsi,%rbx
  100d35:	48 89 d6             	mov    %rdx,%rsi
  100d38:	48 89 ca             	mov    %rcx,%rdx
void console_printf(const char* format, ...);


// Generic print library

struct printer {
  100d3b:	c7 45 d0 00 07 00 00 	movl   $0x700,-0x30(%rbp)
        : s_(s), end_(s + size), n_(0) {
  100d42:	48 c7 45 c8 d8 17 10 	movq   $0x1017d8,-0x38(%rbp)
  100d49:	00 
  100d4a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  100d4e:	48 01 df             	add    %rbx,%rdi
  100d51:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  100d55:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  100d5c:	00 
    string_printer sp(s, size);
    sp.vprintf(format, val);
  100d5d:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100d61:	e8 0c f7 ff ff       	call   100472 <printer::vprintf(char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  100d66:	48 85 db             	test   %rbx,%rbx
  100d69:	74 10                	je     100d7b <vsnprintf+0x56>
  100d6b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  100d6f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  100d73:	48 39 c2             	cmp    %rax,%rdx
  100d76:	73 0d                	jae    100d85 <vsnprintf+0x60>
        *sp.s_ = 0;
  100d78:	c6 02 00             	movb   $0x0,(%rdx)
    } else if (size) {
        sp.end_[-1] = 0;
    }
    return sp.n_;
}
  100d7b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  100d7f:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  100d83:	c9                   	leave
  100d84:	c3                   	ret
        sp.end_[-1] = 0;
  100d85:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
  100d89:	eb f0                	jmp    100d7b <vsnprintf+0x56>

0000000000100d8b <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  100d8b:	f3 0f 1e fa          	endbr64
  100d8f:	55                   	push   %rbp
  100d90:	48 89 e5             	mov    %rsp,%rbp
  100d93:	48 83 ec 50          	sub    $0x50,%rsp
  100d97:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100d9b:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100d9f:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  100da3:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  100daa:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100dae:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100db2:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100db6:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  100dba:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100dbe:	e8 62 ff ff ff       	call   100d25 <vsnprintf>
    va_end(val);
    return n;
  100dc3:	48 98                	cltq
}
  100dc5:	c9                   	leave
  100dc6:	c3                   	ret

0000000000100dc7 <assert_fail(char const*, int, char const*, char const*)>:
void error_vprintf(int cpos, int color, const char* format, va_list val) {
    console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  100dc7:	f3 0f 1e fa          	endbr64
  100dcb:	55                   	push   %rbp
  100dcc:	48 89 e5             	mov    %rsp,%rbp
  100dcf:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  100dd6:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  100dd9:	c7 05 19 82 fb ff 30 	movl   $0x730,-0x47de7(%rip)        # b8ffc <cursorpos>
  100de0:	07 00 00 
    char buf[240];
    if (description) {
  100de3:	48 85 c9             	test   %rcx,%rcx
  100de6:	74 39                	je     100e21 <assert_fail(char const*, int, char const*, char const*)+0x5a>
  100de8:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  100deb:	48 83 ec 08          	sub    $0x8,%rsp
  100def:	52                   	push   %rdx
  100df0:	56                   	push   %rsi
  100df1:	57                   	push   %rdi
  100df2:	48 89 f9             	mov    %rdi,%rcx
  100df5:	ba c8 0f 10 00       	mov    $0x100fc8,%edx
  100dfa:	be f0 00 00 00       	mov    $0xf0,%esi
  100dff:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100e06:	b0 00                	mov    $0x0,%al
  100e08:	e8 7e ff ff ff       	call   100d8b <snprintf>
  100e0d:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  100e11:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  100e16:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100e1d:	0f 05                	syscall
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  100e1f:	eb fe                	jmp    100e1f <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  100e21:	49 89 d1             	mov    %rdx,%r9
  100e24:	48 89 f9             	mov    %rdi,%rcx
  100e27:	ba f8 0f 10 00       	mov    $0x100ff8,%edx
  100e2c:	be f0 00 00 00       	mov    $0xf0,%esi
  100e31:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100e38:	b0 00                	mov    $0x0,%al
  100e3a:	e8 4c ff ff ff       	call   100d8b <snprintf>
  100e3f:	eb d0                	jmp    100e11 <assert_fail(char const*, int, char const*, char const*)+0x4a>

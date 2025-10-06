
obj/p-allocator3.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000180000 <process_main()>:
    unsigned char buf[4096];
    int field2;
};
const test_struct test = {61, {0}, 6161};

void process_main() {
  180000:	f3 0f 1e fa          	endbr64
  180004:	55                   	push   %rbp
  180005:	48 89 e5             	mov    %rsp,%rbp
  180008:	41 54                	push   %r12
  18000a:	53                   	push   %rbx
    assert(test.field1 == 61);
    assert(memchr(&test, 0x11, sizeof(test)) == &test.field2);
  18000b:	ba 08 10 00 00       	mov    $0x1008,%edx
  180010:	be 11 00 00 00       	mov    $0x11,%esi
  180015:	bf e0 0d 18 00       	mov    $0x180de0,%edi
  18001a:	e8 1e 01 00 00       	call   18013d <memchr>
  18001f:	48 3d e4 1d 18 00    	cmp    $0x181de4,%rax
  180025:	75 48                	jne    18006f <process_main()+0x6f>
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  180027:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  18002c:	0f 05                	syscall
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
    return rax;
  18002e:	49 89 c4             	mov    %rax,%r12


// sys_getpid
//    Return current process ID. (Never fails.)
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  180031:	89 c3                	mov    %eax,%ebx

    pid_t p = sys_getpid();
    srand(p);
  180033:	89 c7                	mov    %eax,%edi
  180035:	e8 9d 01 00 00       	call   1801d7 <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  18003a:	ba 1b 40 18 00       	mov    $0x18401b,%edx

    // The heap starts on the page right after the 'end' symbol,
    // whose address is the first address not allocated to process code
    // or data.
    heap_top = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  18003f:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
  180046:	48 89 15 bb 2f 00 00 	mov    %rdx,0x2fbb(%rip)        # 183008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  18004d:	48 89 e0             	mov    %rsp,%rax

    // The bottom of the stack is the first address on the current
    // stack page (this process never needs more than one stack page).
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  180050:	48 83 e8 01          	sub    $0x1,%rax
  180054:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  18005a:	48 89 05 9f 2f 00 00 	mov    %rax,0x2f9f(%rip)        # 183000 <stack_bottom>

    // Allocate heap pages until (1) hit the stack (out of address space)
    // or (2) allocation fails (out of physical memory).
    while (heap_top != stack_bottom) {
  180061:	48 39 c2             	cmp    %rax,%rdx
  180064:	75 68                	jne    1800ce <process_main()+0xce>
    register uintptr_t rax asm("rax") = syscallno;
  180066:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  18006b:	0f 05                	syscall
        }
        sys_yield();
    }

    // After running out of memory, do nothing forever
    while (true) {
  18006d:	eb f7                	jmp    180066 <process_main()+0x66>
    assert(memchr(&test, 0x11, sizeof(test)) == &test.field2);
  18006f:	b9 00 00 00 00       	mov    $0x0,%ecx
  180074:	ba a0 0c 18 00       	mov    $0x180ca0,%edx
  180079:	be 16 00 00 00       	mov    $0x16,%esi
  18007e:	bf 83 0d 18 00       	mov    $0x180d83,%edi
  180083:	e8 9b 0b 00 00       	call   180c23 <assert_fail(char const*, int, char const*, char const*)>
                assert(*l == 0);
  180088:	b9 00 00 00 00       	mov    $0x0,%ecx
  18008d:	ba 92 0d 18 00       	mov    $0x180d92,%edx
  180092:	be 2f 00 00 00       	mov    $0x2f,%esi
  180097:	bf 83 0d 18 00       	mov    $0x180d83,%edi
  18009c:	e8 82 0b 00 00       	call   180c23 <assert_fail(char const*, int, char const*, char const*)>
            *heap_top = p;
  1800a1:	44 88 21             	mov    %r12b,(%rcx)
            console[CPOS(24, 79)] = p;
  1800a4:	66 44 89 25 f2 8e f3 	mov    %r12w,-0xc710e(%rip)        # b8f9e <console+0xf9e>
  1800ab:	ff 
            heap_top += PAGESIZE;
  1800ac:	48 81 05 51 2f 00 00 	addq   $0x1000,0x2f51(%rip)        # 183008 <heap_top>
  1800b3:	00 10 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  1800b7:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  1800bc:	0f 05                	syscall
    while (heap_top != stack_bottom) {
  1800be:	48 8b 05 3b 2f 00 00 	mov    0x2f3b(%rip),%rax        # 183000 <stack_bottom>
  1800c5:	48 39 05 3c 2f 00 00 	cmp    %rax,0x2f3c(%rip)        # 183008 <heap_top>
  1800cc:	74 98                	je     180066 <process_main()+0x66>
        if (rand(0, ALLOC_SLOWDOWN - 1) < p) {
  1800ce:	be 63 00 00 00       	mov    $0x63,%esi
  1800d3:	bf 00 00 00 00       	mov    $0x0,%edi
  1800d8:	e8 68 01 00 00       	call   180245 <rand(int, int)>
  1800dd:	39 d8                	cmp    %ebx,%eax
  1800df:	7d d6                	jge    1800b7 <process_main()+0xb7>
    register uintptr_t rax asm("rax") = syscallno;
  1800e1:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  1800e6:	48 8b 3d 1b 2f 00 00 	mov    0x2f1b(%rip),%rdi        # 183008 <heap_top>
  1800ed:	0f 05                	syscall
            if (sys_page_alloc((uint8_t*) heap_top) < 0) {
  1800ef:	85 c0                	test   %eax,%eax
  1800f1:	0f 88 6f ff ff ff    	js     180066 <process_main()+0x66>
            for (unsigned long* l = (unsigned long*) heap_top;
  1800f7:	48 8b 0d 0a 2f 00 00 	mov    0x2f0a(%rip),%rcx        # 183008 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1800fe:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  180105:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  180108:	48 83 38 00          	cmpq   $0x0,(%rax)
  18010c:	0f 85 76 ff ff ff    	jne    180088 <process_main()+0x88>
            for (unsigned long* l = (unsigned long*) heap_top;
  180112:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  180116:	48 39 d0             	cmp    %rdx,%rax
  180119:	75 ed                	jne    180108 <process_main()+0x108>
  18011b:	eb 84                	jmp    1800a1 <process_main()+0xa1>
  18011d:	90                   	nop

000000000018011e <string_printer::putc(unsigned char)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c) override {
  18011e:	f3 0f 1e fa          	endbr64
        if (s_ < end_) {
  180122:	48 8b 47 10          	mov    0x10(%rdi),%rax
  180126:	48 3b 47 18          	cmp    0x18(%rdi),%rax
  18012a:	73 0b                	jae    180137 <string_printer::putc(unsigned char)+0x19>
            *s_++ = c;
  18012c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  180130:	48 89 57 10          	mov    %rdx,0x10(%rdi)
  180134:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  180137:	48 83 47 20 01       	addq   $0x1,0x20(%rdi)
    }
  18013c:	c3                   	ret

000000000018013d <memchr>:
void* memchr(const void* s, int c, size_t n) {
  18013d:	f3 0f 1e fa          	endbr64
  180141:	48 89 f8             	mov    %rdi,%rax
    for (ss = (const unsigned char*) s; n != 0; ++ss, --n) {
  180144:	48 85 d2             	test   %rdx,%rdx
  180147:	74 17                	je     180160 <memchr+0x23>
  180149:	48 01 fa             	add    %rdi,%rdx
        if (*ss == (unsigned char) c) {
  18014c:	40 38 30             	cmp    %sil,(%rax)
  18014f:	74 14                	je     180165 <memchr+0x28>
    for (ss = (const unsigned char*) s; n != 0; ++ss, --n) {
  180151:	48 83 c0 01          	add    $0x1,%rax
  180155:	48 39 c2             	cmp    %rax,%rdx
  180158:	75 f2                	jne    18014c <memchr+0xf>
    return nullptr;
  18015a:	b8 00 00 00 00       	mov    $0x0,%eax
  18015f:	c3                   	ret
  180160:	b8 00 00 00 00       	mov    $0x0,%eax
}
  180165:	c3                   	ret

0000000000180166 <strlen>:
size_t strlen(const char* s) {
  180166:	f3 0f 1e fa          	endbr64
    for (n = 0; *s != '\0'; ++s) {
  18016a:	80 3f 00             	cmpb   $0x0,(%rdi)
  18016d:	74 10                	je     18017f <strlen+0x19>
  18016f:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  180174:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  180178:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  18017c:	75 f6                	jne    180174 <strlen+0xe>
  18017e:	c3                   	ret
  18017f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  180184:	c3                   	ret

0000000000180185 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  180185:	f3 0f 1e fa          	endbr64
  180189:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  18018c:	ba 00 00 00 00       	mov    $0x0,%edx
  180191:	48 85 f6             	test   %rsi,%rsi
  180194:	74 10                	je     1801a6 <strnlen+0x21>
  180196:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  18019a:	74 0b                	je     1801a7 <strnlen+0x22>
        ++n;
  18019c:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1801a0:	48 39 d0             	cmp    %rdx,%rax
  1801a3:	75 f1                	jne    180196 <strnlen+0x11>
  1801a5:	c3                   	ret
  1801a6:	c3                   	ret
  1801a7:	48 89 d0             	mov    %rdx,%rax
}
  1801aa:	c3                   	ret

00000000001801ab <strchr>:
char* strchr(const char* s, int c) {
  1801ab:	f3 0f 1e fa          	endbr64
    while (*s != '\0' && *s != (char) c) {
  1801af:	0f b6 07             	movzbl (%rdi),%eax
  1801b2:	84 c0                	test   %al,%al
  1801b4:	74 10                	je     1801c6 <strchr+0x1b>
  1801b6:	40 38 f0             	cmp    %sil,%al
  1801b9:	74 18                	je     1801d3 <strchr+0x28>
        ++s;
  1801bb:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  1801bf:	0f b6 07             	movzbl (%rdi),%eax
  1801c2:	84 c0                	test   %al,%al
  1801c4:	75 f0                	jne    1801b6 <strchr+0xb>
        return (char*) s;
  1801c6:	40 84 f6             	test   %sil,%sil
  1801c9:	b8 00 00 00 00       	mov    $0x0,%eax
  1801ce:	48 0f 44 c7          	cmove  %rdi,%rax
}
  1801d2:	c3                   	ret
        return (char*) s;
  1801d3:	48 89 f8             	mov    %rdi,%rax
  1801d6:	c3                   	ret

00000000001801d7 <srand(unsigned int)>:
void srand(unsigned seed) {
  1801d7:	f3 0f 1e fa          	endbr64
    rand_seed = ((unsigned long) seed << 32) | seed;
  1801db:	89 f8                	mov    %edi,%eax
  1801dd:	48 c1 e7 20          	shl    $0x20,%rdi
  1801e1:	48 01 c7             	add    %rax,%rdi
	  = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_acquire);
	__glibcxx_assert(__b != memory_order_acq_rel);
	__glibcxx_assert(__b != memory_order_consume);

	__atomic_store_n(&_M_i, __i, int(__m));
  1801e4:	48 87 3d 25 2e 00 00 	xchg   %rdi,0x2e25(%rip)        # 183010 <rand_seed>
  1801eb:	b8 01 00 00 00       	mov    $0x1,%eax
  1801f0:	87 05 22 2e 00 00    	xchg   %eax,0x2e22(%rip)        # 183018 <rand_seed_set>
}
  1801f6:	c3                   	ret

00000000001801f7 <rand()>:
int rand() {
  1801f7:	f3 0f 1e fa          	endbr64
  1801fb:	55                   	push   %rbp
  1801fc:	48 89 e5             	mov    %rsp,%rbp
	memory_order __b __attribute__ ((__unused__))
	  = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_release);
	__glibcxx_assert(__b != memory_order_acq_rel);

	return __atomic_load_n(&_M_i, int(__m));
  1801ff:	8b 05 13 2e 00 00    	mov    0x2e13(%rip),%eax        # 183018 <rand_seed_set>
    if (!rand_seed_set) {
  180205:	85 c0                	test   %eax,%eax
  180207:	74 30                	je     180239 <rand()+0x42>
  180209:	48 8b 05 00 2e 00 00 	mov    0x2e00(%rip),%rax        # 183010 <rand_seed>
        next_rs = rs * 6364136223846793005UL + 1;
  180210:	48 b9 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rcx
  180217:	f4 51 58 
  18021a:	48 89 c2             	mov    %rax,%rdx
  18021d:	48 0f af d1          	imul   %rcx,%rdx
  180221:	48 83 c2 01          	add    $0x1,%rdx
      compare_exchange_weak(__int_type& __i1, __int_type __i2,
			    memory_order __m1, memory_order __m2) noexcept
      {
	__glibcxx_assert(__is_valid_cmpexch_failure_order(__m2));

	return __atomic_compare_exchange_n(&_M_i, &__i1, __i2, 1,
  180225:	f0 48 0f b1 15 e2 2d 	lock cmpxchg %rdx,0x2de2(%rip)        # 183010 <rand_seed>
  18022c:	00 00 
    } while (!rand_seed.compare_exchange_weak(rs, next_rs));
  18022e:	75 ea                	jne    18021a <rand()+0x23>
    return (next_rs >> 33) & RAND_MAX;
  180230:	48 c1 ea 21          	shr    $0x21,%rdx
  180234:	48 89 d0             	mov    %rdx,%rax
}
  180237:	5d                   	pop    %rbp
  180238:	c3                   	ret
        srand(819234718U);
  180239:	bf 9e 87 d4 30       	mov    $0x30d4879e,%edi
  18023e:	e8 94 ff ff ff       	call   1801d7 <srand(unsigned int)>
  180243:	eb c4                	jmp    180209 <rand()+0x12>

0000000000180245 <rand(int, int)>:
int rand(int min, int max) {
  180245:	f3 0f 1e fa          	endbr64
  180249:	55                   	push   %rbp
  18024a:	48 89 e5             	mov    %rsp,%rbp
  18024d:	41 55                	push   %r13
  18024f:	41 54                	push   %r12
  180251:	53                   	push   %rbx
  180252:	48 83 ec 08          	sub    $0x8,%rsp
    assert(min <= max);
  180256:	39 f7                	cmp    %esi,%edi
  180258:	7f 42                	jg     18029c <rand(int, int)+0x57>
  18025a:	41 89 fc             	mov    %edi,%r12d
  18025d:	89 f3                	mov    %esi,%ebx
    unsigned div = (unsigned(RAND_MAX) + 1) / (max - min + 1),
  18025f:	29 fb                	sub    %edi,%ebx
  180261:	83 c3 01             	add    $0x1,%ebx
  180264:	b8 00 00 00 80       	mov    $0x80000000,%eax
  180269:	ba 00 00 00 00       	mov    $0x0,%edx
  18026e:	f7 f3                	div    %ebx
  180270:	41 89 c5             	mov    %eax,%r13d
        top = div * (max - min + 1);
  180273:	0f af d8             	imul   %eax,%ebx
    assert(top > 0 && top <= unsigned(RAND_MAX) + 1);
  180276:	89 d8                	mov    %ebx,%eax
  180278:	83 e8 01             	sub    $0x1,%eax
  18027b:	78 38                	js     1802b5 <rand(int, int)+0x70>
        unsigned r = rand();
  18027d:	e8 75 ff ff ff       	call   1801f7 <rand()>
        if (r < top) {
  180282:	39 d8                	cmp    %ebx,%eax
  180284:	73 f7                	jae    18027d <rand(int, int)+0x38>
            return min + r / div;
  180286:	ba 00 00 00 00       	mov    $0x0,%edx
  18028b:	41 f7 f5             	div    %r13d
  18028e:	44 01 e0             	add    %r12d,%eax
}
  180291:	48 83 c4 08          	add    $0x8,%rsp
  180295:	5b                   	pop    %rbx
  180296:	41 5c                	pop    %r12
  180298:	41 5d                	pop    %r13
  18029a:	5d                   	pop    %rbp
  18029b:	c3                   	ret
    assert(min <= max);
  18029c:	b9 00 00 00 00       	mov    $0x0,%ecx
  1802a1:	ba 9a 0d 18 00       	mov    $0x180d9a,%edx
  1802a6:	be 49 01 00 00       	mov    $0x149,%esi
  1802ab:	bf a5 0d 18 00       	mov    $0x180da5,%edi
  1802b0:	e8 6e 09 00 00       	call   180c23 <assert_fail(char const*, int, char const*, char const*)>
    assert(top > 0 && top <= unsigned(RAND_MAX) + 1);
  1802b5:	b9 00 00 00 00       	mov    $0x0,%ecx
  1802ba:	ba d8 0c 18 00       	mov    $0x180cd8,%edx
  1802bf:	be 4e 01 00 00       	mov    $0x14e,%esi
  1802c4:	bf a5 0d 18 00       	mov    $0x180da5,%edi
  1802c9:	e8 55 09 00 00       	call   180c23 <assert_fail(char const*, int, char const*, char const*)>

00000000001802ce <printer::vprintf(char const*, __va_list_tag*)>:
void printer::vprintf(const char* format, va_list val) {
  1802ce:	f3 0f 1e fa          	endbr64
  1802d2:	55                   	push   %rbp
  1802d3:	48 89 e5             	mov    %rsp,%rbp
  1802d6:	41 57                	push   %r15
  1802d8:	41 56                	push   %r14
  1802da:	41 55                	push   %r13
  1802dc:	41 54                	push   %r12
  1802de:	53                   	push   %rbx
  1802df:	48 83 ec 48          	sub    $0x48,%rsp
  1802e3:	49 89 ff             	mov    %rdi,%r15
  1802e6:	49 89 f4             	mov    %rsi,%r12
  1802e9:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
    for (; *format; ++format) {
  1802ed:	0f b6 06             	movzbl (%rsi),%eax
  1802f0:	84 c0                	test   %al,%al
  1802f2:	0f 85 94 05 00 00    	jne    18088c <printer::vprintf(char const*, __va_list_tag*)+0x5be>
}
  1802f8:	48 83 c4 48          	add    $0x48,%rsp
  1802fc:	5b                   	pop    %rbx
  1802fd:	41 5c                	pop    %r12
  1802ff:	41 5d                	pop    %r13
  180301:	41 5e                	pop    %r14
  180303:	41 5f                	pop    %r15
  180305:	5d                   	pop    %rbp
  180306:	c3                   	ret
        for (++format; *format; ++format) {
  180307:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  18030c:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
  180312:	45 84 e4             	test   %r12b,%r12b
  180315:	0f 84 01 01 00 00    	je     18041c <printer::vprintf(char const*, __va_list_tag*)+0x14e>
        int flags = 0;
  18031b:	41 be 00 00 00 00    	mov    $0x0,%r14d
            const char* flagc = strchr(flag_chars, *format);
  180321:	41 0f be f4          	movsbl %r12b,%esi
  180325:	bf e1 24 18 00       	mov    $0x1824e1,%edi
  18032a:	e8 7c fe ff ff       	call   1801ab <strchr>
  18032f:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  180332:	48 85 c0             	test   %rax,%rax
  180335:	74 70                	je     1803a7 <printer::vprintf(char const*, __va_list_tag*)+0xd9>
                flags |= 1 << (flagc - flag_chars);
  180337:	48 81 e9 e1 24 18 00 	sub    $0x1824e1,%rcx
  18033e:	b8 01 00 00 00       	mov    $0x1,%eax
  180343:	d3 e0                	shl    %cl,%eax
  180345:	41 09 c6             	or     %eax,%r14d
        for (++format; *format; ++format) {
  180348:	48 83 c3 01          	add    $0x1,%rbx
  18034c:	44 0f b6 23          	movzbl (%rbx),%r12d
  180350:	45 84 e4             	test   %r12b,%r12b
  180353:	75 cc                	jne    180321 <printer::vprintf(char const*, __va_list_tag*)+0x53>
        int width = -1;
  180355:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
  18035b:	c7 45 a4 ff ff ff ff 	movl   $0xffffffff,-0x5c(%rbp)
        if (*format == '.') {
  180362:	80 3b 2e             	cmpb   $0x2e,(%rbx)
  180365:	0f 84 d8 00 00 00    	je     180443 <printer::vprintf(char const*, __va_list_tag*)+0x175>
        switch (*format) {
  18036b:	0f b6 03             	movzbl (%rbx),%eax
  18036e:	3c 6c                	cmp    $0x6c,%al
  180370:	0f 84 73 01 00 00    	je     1804e9 <printer::vprintf(char const*, __va_list_tag*)+0x21b>
  180376:	0f 8f 4e 01 00 00    	jg     1804ca <printer::vprintf(char const*, __va_list_tag*)+0x1fc>
  18037c:	3c 68                	cmp    $0x68,%al
  18037e:	0f 85 88 01 00 00    	jne    18050c <printer::vprintf(char const*, __va_list_tag*)+0x23e>
            ++format;
  180384:	48 8d 43 01          	lea    0x1(%rbx),%rax
  180388:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  18038c:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  180390:	8d 50 bd             	lea    -0x43(%rax),%edx
  180393:	80 fa 35             	cmp    $0x35,%dl
  180396:	0f 87 a6 05 00 00    	ja     180942 <printer::vprintf(char const*, __va_list_tag*)+0x674>
  18039c:	0f b6 d2             	movzbl %dl,%edx
  18039f:	3e ff 24 d5 f0 1d 18 	notrack jmp *0x181df0(,%rdx,8)
  1803a6:	00 
        if (*format >= '1' && *format <= '9') {
  1803a7:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
  1803ac:	3c 08                	cmp    $0x8,%al
  1803ae:	77 32                	ja     1803e2 <printer::vprintf(char const*, __va_list_tag*)+0x114>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1803b0:	0f b6 03             	movzbl (%rbx),%eax
  1803b3:	8d 50 d0             	lea    -0x30(%rax),%edx
  1803b6:	80 fa 09             	cmp    $0x9,%dl
  1803b9:	77 72                	ja     18042d <printer::vprintf(char const*, __va_list_tag*)+0x15f>
  1803bb:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
  1803c1:	48 83 c3 01          	add    $0x1,%rbx
  1803c5:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
  1803ca:	0f be c0             	movsbl %al,%eax
  1803cd:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1803d2:	0f b6 03             	movzbl (%rbx),%eax
  1803d5:	8d 50 d0             	lea    -0x30(%rax),%edx
  1803d8:	80 fa 09             	cmp    $0x9,%dl
  1803db:	76 e4                	jbe    1803c1 <printer::vprintf(char const*, __va_list_tag*)+0xf3>
  1803dd:	e9 79 ff ff ff       	jmp    18035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
        } else if (*format == '*') {
  1803e2:	41 80 fc 2a          	cmp    $0x2a,%r12b
  1803e6:	75 50                	jne    180438 <printer::vprintf(char const*, __va_list_tag*)+0x16a>
            width = va_arg(val, int);
  1803e8:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1803ec:	8b 01                	mov    (%rcx),%eax
  1803ee:	83 f8 2f             	cmp    $0x2f,%eax
  1803f1:	77 17                	ja     18040a <printer::vprintf(char const*, __va_list_tag*)+0x13c>
  1803f3:	89 c2                	mov    %eax,%edx
  1803f5:	48 03 51 10          	add    0x10(%rcx),%rdx
  1803f9:	83 c0 08             	add    $0x8,%eax
  1803fc:	89 01                	mov    %eax,(%rcx)
  1803fe:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
  180401:	48 83 c3 01          	add    $0x1,%rbx
  180405:	e9 51 ff ff ff       	jmp    18035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            width = va_arg(val, int);
  18040a:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  18040e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  180412:	48 8d 42 08          	lea    0x8(%rdx),%rax
  180416:	48 89 41 08          	mov    %rax,0x8(%rcx)
  18041a:	eb e2                	jmp    1803fe <printer::vprintf(char const*, __va_list_tag*)+0x130>
        int flags = 0;
  18041c:	41 be 00 00 00 00    	mov    $0x0,%r14d
        int width = -1;
  180422:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  180428:	e9 2e ff ff ff       	jmp    18035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  18042d:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  180433:	e9 23 ff ff ff       	jmp    18035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
        int width = -1;
  180438:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  18043e:	e9 18 ff ff ff       	jmp    18035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            ++format;
  180443:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
  180447:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  18044b:	8d 48 d0             	lea    -0x30(%rax),%ecx
  18044e:	80 f9 09             	cmp    $0x9,%cl
  180451:	76 13                	jbe    180466 <printer::vprintf(char const*, __va_list_tag*)+0x198>
            } else if (*format == '*') {
  180453:	3c 2a                	cmp    $0x2a,%al
  180455:	74 33                	je     18048a <printer::vprintf(char const*, __va_list_tag*)+0x1bc>
            ++format;
  180457:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
  18045a:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
  180461:	e9 05 ff ff ff       	jmp    18036b <printer::vprintf(char const*, __va_list_tag*)+0x9d>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  180466:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  18046b:	48 83 c2 01          	add    $0x1,%rdx
  18046f:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  180472:	0f be c0             	movsbl %al,%eax
  180475:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  180479:	0f b6 02             	movzbl (%rdx),%eax
  18047c:	8d 70 d0             	lea    -0x30(%rax),%esi
  18047f:	40 80 fe 09          	cmp    $0x9,%sil
  180483:	76 e6                	jbe    18046b <printer::vprintf(char const*, __va_list_tag*)+0x19d>
  180485:	48 89 d3             	mov    %rdx,%rbx
  180488:	eb 1c                	jmp    1804a6 <printer::vprintf(char const*, __va_list_tag*)+0x1d8>
                precision = va_arg(val, int);
  18048a:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  18048e:	8b 07                	mov    (%rdi),%eax
  180490:	83 f8 2f             	cmp    $0x2f,%eax
  180493:	77 23                	ja     1804b8 <printer::vprintf(char const*, __va_list_tag*)+0x1ea>
  180495:	89 c2                	mov    %eax,%edx
  180497:	48 03 57 10          	add    0x10(%rdi),%rdx
  18049b:	83 c0 08             	add    $0x8,%eax
  18049e:	89 07                	mov    %eax,(%rdi)
  1804a0:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  1804a2:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
  1804a6:	85 c9                	test   %ecx,%ecx
  1804a8:	b8 00 00 00 00       	mov    $0x0,%eax
  1804ad:	0f 49 c1             	cmovns %ecx,%eax
  1804b0:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1804b3:	e9 b3 fe ff ff       	jmp    18036b <printer::vprintf(char const*, __va_list_tag*)+0x9d>
                precision = va_arg(val, int);
  1804b8:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1804bc:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1804c0:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1804c4:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1804c8:	eb d6                	jmp    1804a0 <printer::vprintf(char const*, __va_list_tag*)+0x1d2>
        switch (*format) {
  1804ca:	3c 74                	cmp    $0x74,%al
  1804cc:	74 1b                	je     1804e9 <printer::vprintf(char const*, __va_list_tag*)+0x21b>
  1804ce:	3c 7a                	cmp    $0x7a,%al
  1804d0:	74 17                	je     1804e9 <printer::vprintf(char const*, __va_list_tag*)+0x21b>
        switch (*format) {
  1804d2:	8d 50 bd             	lea    -0x43(%rax),%edx
  1804d5:	80 fa 35             	cmp    $0x35,%dl
  1804d8:	0f 87 5e 06 00 00    	ja     180b3c <printer::vprintf(char const*, __va_list_tag*)+0x86e>
  1804de:	0f b6 d2             	movzbl %dl,%edx
  1804e1:	3e ff 24 d5 a0 1f 18 	notrack jmp *0x181fa0(,%rdx,8)
  1804e8:	00 
            ++format;
  1804e9:	48 8d 43 01          	lea    0x1(%rbx),%rax
  1804ed:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  1804f1:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1804f5:	8d 50 bd             	lea    -0x43(%rax),%edx
  1804f8:	80 fa 35             	cmp    $0x35,%dl
  1804fb:	0f 87 41 04 00 00    	ja     180942 <printer::vprintf(char const*, __va_list_tag*)+0x674>
  180501:	0f b6 d2             	movzbl %dl,%edx
  180504:	3e ff 24 d5 50 21 18 	notrack jmp *0x182150(,%rdx,8)
  18050b:	00 
  18050c:	8d 50 bd             	lea    -0x43(%rax),%edx
  18050f:	80 fa 35             	cmp    $0x35,%dl
  180512:	0f 87 26 04 00 00    	ja     18093e <printer::vprintf(char const*, __va_list_tag*)+0x670>
  180518:	0f b6 d2             	movzbl %dl,%edx
  18051b:	3e ff 24 d5 00 23 18 	notrack jmp *0x182300(,%rdx,8)
  180522:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  180523:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  180527:	8b 07                	mov    (%rdi),%eax
  180529:	83 f8 2f             	cmp    $0x2f,%eax
  18052c:	77 36                	ja     180564 <printer::vprintf(char const*, __va_list_tag*)+0x296>
  18052e:	89 c2                	mov    %eax,%edx
  180530:	48 03 57 10          	add    0x10(%rdi),%rdx
  180534:	83 c0 08             	add    $0x8,%eax
  180537:	89 07                	mov    %eax,(%rdi)
  180539:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  18053c:	48 89 d0             	mov    %rdx,%rax
  18053f:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  180543:	49 89 d3             	mov    %rdx,%r11
  180546:	49 f7 db             	neg    %r11
  180549:	25 00 01 00 00       	and    $0x100,%eax
  18054e:	4c 0f 44 da          	cmove  %rdx,%r11
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  180552:	44 09 f0             	or     %r14d,%eax
  180555:	0c c0                	or     $0xc0,%al
  180557:	41 89 c6             	mov    %eax,%r14d
        const char* data = "";
  18055a:	bb b4 0d 18 00       	mov    $0x180db4,%ebx
            break;
  18055f:	e9 f4 01 00 00       	jmp    180758 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  180564:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  180568:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  18056c:	48 8d 42 08          	lea    0x8(%rdx),%rax
  180570:	48 89 41 08          	mov    %rax,0x8(%rcx)
  180574:	eb c3                	jmp    180539 <printer::vprintf(char const*, __va_list_tag*)+0x26b>
        switch (*format) {
  180576:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  18057a:	eb 04                	jmp    180580 <printer::vprintf(char const*, __va_list_tag*)+0x2b2>
  18057c:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            long x = length ? va_arg(val, long) : va_arg(val, int);
  180580:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  180584:	8b 01                	mov    (%rcx),%eax
  180586:	83 f8 2f             	cmp    $0x2f,%eax
  180589:	77 10                	ja     18059b <printer::vprintf(char const*, __va_list_tag*)+0x2cd>
  18058b:	89 c2                	mov    %eax,%edx
  18058d:	48 03 51 10          	add    0x10(%rcx),%rdx
  180591:	83 c0 08             	add    $0x8,%eax
  180594:	89 01                	mov    %eax,(%rcx)
  180596:	48 63 12             	movslq (%rdx),%rdx
  180599:	eb a1                	jmp    18053c <printer::vprintf(char const*, __va_list_tag*)+0x26e>
  18059b:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  18059f:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1805a3:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1805a7:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1805ab:	eb e9                	jmp    180596 <printer::vprintf(char const*, __va_list_tag*)+0x2c8>
        switch (*format) {
  1805ad:	b8 01 00 00 00       	mov    $0x1,%eax
  1805b2:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  1805b9:	e9 9d 00 00 00       	jmp    18065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  1805be:	b8 00 00 00 00       	mov    $0x0,%eax
  1805c3:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  1805ca:	e9 8c 00 00 00       	jmp    18065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  1805cf:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1805d3:	b8 00 00 00 00       	mov    $0x0,%eax
  1805d8:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  1805df:	eb 7a                	jmp    18065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  1805e1:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1805e5:	b8 00 00 00 00       	mov    $0x0,%eax
  1805ea:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  1805f1:	eb 68                	jmp    18065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1805f3:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1805f7:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1805fb:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1805ff:	48 89 47 08          	mov    %rax,0x8(%rdi)
  180603:	eb 70                	jmp    180675 <printer::vprintf(char const*, __va_list_tag*)+0x3a7>
  180605:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  180609:	8b 07                	mov    (%rdi),%eax
  18060b:	83 f8 2f             	cmp    $0x2f,%eax
  18060e:	77 10                	ja     180620 <printer::vprintf(char const*, __va_list_tag*)+0x352>
  180610:	89 c2                	mov    %eax,%edx
  180612:	48 03 57 10          	add    0x10(%rdi),%rdx
  180616:	83 c0 08             	add    $0x8,%eax
  180619:	89 07                	mov    %eax,(%rdi)
  18061b:	44 8b 1a             	mov    (%rdx),%r11d
  18061e:	eb 58                	jmp    180678 <printer::vprintf(char const*, __va_list_tag*)+0x3aa>
  180620:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  180624:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  180628:	48 8d 42 08          	lea    0x8(%rdx),%rax
  18062c:	48 89 41 08          	mov    %rax,0x8(%rcx)
  180630:	eb e9                	jmp    18061b <printer::vprintf(char const*, __va_list_tag*)+0x34d>
        switch (*format) {
  180632:	b8 01 00 00 00       	mov    $0x1,%eax
  180637:	eb 1b                	jmp    180654 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  180639:	b8 00 00 00 00       	mov    $0x0,%eax
  18063e:	eb 14                	jmp    180654 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  180640:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  180644:	b8 00 00 00 00       	mov    $0x0,%eax
  180649:	eb 09                	jmp    180654 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  18064b:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  18064f:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  180654:	c7 45 a0 f0 ff ff ff 	movl   $0xfffffff0,-0x60(%rbp)
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  18065b:	85 c0                	test   %eax,%eax
  18065d:	74 a6                	je     180605 <printer::vprintf(char const*, __va_list_tag*)+0x337>
  18065f:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  180663:	8b 07                	mov    (%rdi),%eax
  180665:	83 f8 2f             	cmp    $0x2f,%eax
  180668:	77 89                	ja     1805f3 <printer::vprintf(char const*, __va_list_tag*)+0x325>
  18066a:	89 c2                	mov    %eax,%edx
  18066c:	48 03 57 10          	add    0x10(%rdi),%rdx
  180670:	83 c0 08             	add    $0x8,%eax
  180673:	89 07                	mov    %eax,(%rdi)
  180675:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_NUMERIC;
  180678:	44 89 f0             	mov    %r14d,%eax
  18067b:	83 c8 40             	or     $0x40,%eax
    if (base < 0) {
  18067e:	83 7d a0 00          	cmpl   $0x0,-0x60(%rbp)
  180682:	0f 89 de 02 00 00    	jns    180966 <printer::vprintf(char const*, __va_list_tag*)+0x698>
    *--pos = '\0';
  180688:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  18068c:	a8 20                	test   $0x20,%al
  18068e:	0f 85 01 03 00 00    	jne    180995 <printer::vprintf(char const*, __va_list_tag*)+0x6c7>
  180694:	41 89 c6             	mov    %eax,%r14d
        digits = lower_digits;
  180697:	41 ba b0 24 18 00    	mov    $0x1824b0,%r10d
        base = -base;
  18069d:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  1806a3:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = nullptr;
  1806aa:	bf 00 00 00 00       	mov    $0x0,%edi
  1806af:	e9 03 03 00 00       	jmp    1809b7 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
        switch (*format) {
  1806b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1806b9:	eb 1b                	jmp    1806d6 <printer::vprintf(char const*, __va_list_tag*)+0x408>
  1806bb:	b8 00 00 00 00       	mov    $0x0,%eax
  1806c0:	eb 14                	jmp    1806d6 <printer::vprintf(char const*, __va_list_tag*)+0x408>
  1806c2:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1806c6:	b8 00 00 00 00       	mov    $0x0,%eax
  1806cb:	eb 09                	jmp    1806d6 <printer::vprintf(char const*, __va_list_tag*)+0x408>
  1806cd:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1806d1:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  1806d6:	c7 45 a0 10 00 00 00 	movl   $0x10,-0x60(%rbp)
            goto format_unsigned;
  1806dd:	e9 79 ff ff ff       	jmp    18065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
        switch (*format) {
  1806e2:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1806e6:	eb 04                	jmp    1806ec <printer::vprintf(char const*, __va_list_tag*)+0x41e>
  1806e8:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            num = (uintptr_t) va_arg(val, void*);
  1806ec:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1806f0:	8b 01                	mov    (%rcx),%eax
  1806f2:	83 f8 2f             	cmp    $0x2f,%eax
  1806f5:	77 22                	ja     180719 <printer::vprintf(char const*, __va_list_tag*)+0x44b>
  1806f7:	89 c2                	mov    %eax,%edx
  1806f9:	48 03 51 10          	add    0x10(%rcx),%rdx
  1806fd:	83 c0 08             	add    $0x8,%eax
  180700:	89 01                	mov    %eax,(%rcx)
  180702:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  180705:	44 89 f0             	mov    %r14d,%eax
  180708:	0d 41 02 00 00       	or     $0x241,%eax
            base = -16;
  18070d:	c7 45 a0 f0 ff ff ff 	movl   $0xfffffff0,-0x60(%rbp)
  180714:	e9 6f ff ff ff       	jmp    180688 <printer::vprintf(char const*, __va_list_tag*)+0x3ba>
            num = (uintptr_t) va_arg(val, void*);
  180719:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  18071d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  180721:	48 8d 42 08          	lea    0x8(%rdx),%rax
  180725:	48 89 47 08          	mov    %rax,0x8(%rdi)
  180729:	eb d7                	jmp    180702 <printer::vprintf(char const*, __va_list_tag*)+0x434>
        switch (*format) {
  18072b:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  18072f:	eb 04                	jmp    180735 <printer::vprintf(char const*, __va_list_tag*)+0x467>
  180731:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = va_arg(val, char*);
  180735:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  180739:	8b 01                	mov    (%rcx),%eax
  18073b:	83 f8 2f             	cmp    $0x2f,%eax
  18073e:	0f 87 61 01 00 00    	ja     1808a5 <printer::vprintf(char const*, __va_list_tag*)+0x5d7>
  180744:	89 c2                	mov    %eax,%edx
  180746:	48 03 51 10          	add    0x10(%rcx),%rdx
  18074a:	83 c0 08             	add    $0x8,%eax
  18074d:	89 01                	mov    %eax,(%rcx)
  18074f:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  180752:	41 bb 00 00 00 00    	mov    $0x0,%r11d
        if (flags & FLAG_NUMERIC) {
  180758:	44 89 f0             	mov    %r14d,%eax
  18075b:	83 e0 40             	and    $0x40,%eax
  18075e:	89 45 94             	mov    %eax,-0x6c(%rbp)
        const char* prefix = "";
  180761:	41 bc b4 0d 18 00    	mov    $0x180db4,%r12d
        if (flags & FLAG_NUMERIC) {
  180767:	0f 85 e9 03 00 00    	jne    180b56 <printer::vprintf(char const*, __va_list_tag*)+0x888>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  18076d:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  180770:	89 d0                	mov    %edx,%eax
  180772:	f7 d0                	not    %eax
  180774:	c1 e8 1f             	shr    $0x1f,%eax
  180777:	89 45 90             	mov    %eax,-0x70(%rbp)
  18077a:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
  18077e:	0f 85 54 03 00 00    	jne    180ad8 <printer::vprintf(char const*, __va_list_tag*)+0x80a>
  180784:	84 c0                	test   %al,%al
  180786:	0f 84 4c 03 00 00    	je     180ad8 <printer::vprintf(char const*, __va_list_tag*)+0x80a>
            datalen = strnlen(data, precision);
  18078c:	48 63 f2             	movslq %edx,%rsi
  18078f:	48 89 df             	mov    %rbx,%rdi
  180792:	e8 ee f9 ff ff       	call   180185 <strnlen>
  180797:	89 45 a0             	mov    %eax,-0x60(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  18079a:	44 89 f0             	mov    %r14d,%eax
  18079d:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  1807a0:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  1807a7:	83 f8 42             	cmp    $0x42,%eax
  1807aa:	0f 84 60 03 00 00    	je     180b10 <printer::vprintf(char const*, __va_list_tag*)+0x842>
        width -= datalen + zeros + strlen(prefix);
  1807b0:	4c 89 e7             	mov    %r12,%rdi
  1807b3:	e8 ae f9 ff ff       	call   180166 <strlen>
  1807b8:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  1807bb:	8b 7d a0             	mov    -0x60(%rbp),%edi
  1807be:	8d 0c 3a             	lea    (%rdx,%rdi,1),%ecx
  1807c1:	44 89 ea             	mov    %r13d,%edx
  1807c4:	29 ca                	sub    %ecx,%edx
  1807c6:	29 c2                	sub    %eax,%edx
  1807c8:	41 89 d5             	mov    %edx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1807cb:	41 f6 c6 04          	test   $0x4,%r14b
  1807cf:	75 31                	jne    180802 <printer::vprintf(char const*, __va_list_tag*)+0x534>
  1807d1:	85 d2                	test   %edx,%edx
  1807d3:	7e 2d                	jle    180802 <printer::vprintf(char const*, __va_list_tag*)+0x534>
        width -= datalen + zeros + strlen(prefix);
  1807d5:	41 89 d6             	mov    %edx,%r14d
            putc(' ');
  1807d8:	49 8b 07             	mov    (%r15),%rax
  1807db:	be 20 00 00 00       	mov    $0x20,%esi
  1807e0:	4c 89 ff             	mov    %r15,%rdi
  1807e3:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1807e5:	41 83 ed 01          	sub    $0x1,%r13d
  1807e9:	45 85 ed             	test   %r13d,%r13d
  1807ec:	7f ea                	jg     1807d8 <printer::vprintf(char const*, __va_list_tag*)+0x50a>
  1807ee:	44 89 f2             	mov    %r14d,%edx
  1807f1:	45 85 f6             	test   %r14d,%r14d
  1807f4:	b8 01 00 00 00       	mov    $0x1,%eax
  1807f9:	41 0f 4f c6          	cmovg  %r14d,%eax
  1807fd:	29 c2                	sub    %eax,%edx
  1807ff:	41 89 d5             	mov    %edx,%r13d
        for (; *prefix; ++prefix) {
  180802:	41 0f b6 04 24       	movzbl (%r12),%eax
  180807:	84 c0                	test   %al,%al
  180809:	74 18                	je     180823 <printer::vprintf(char const*, __va_list_tag*)+0x555>
            putc(*prefix);
  18080b:	0f b6 f0             	movzbl %al,%esi
  18080e:	49 8b 07             	mov    (%r15),%rax
  180811:	4c 89 ff             	mov    %r15,%rdi
  180814:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  180816:	49 83 c4 01          	add    $0x1,%r12
  18081a:	41 0f b6 04 24       	movzbl (%r12),%eax
  18081f:	84 c0                	test   %al,%al
  180821:	75 e8                	jne    18080b <printer::vprintf(char const*, __va_list_tag*)+0x53d>
        for (; zeros > 0; --zeros) {
  180823:	44 8b 65 a4          	mov    -0x5c(%rbp),%r12d
  180827:	45 85 e4             	test   %r12d,%r12d
  18082a:	7e 13                	jle    18083f <printer::vprintf(char const*, __va_list_tag*)+0x571>
            putc('0');
  18082c:	49 8b 07             	mov    (%r15),%rax
  18082f:	be 30 00 00 00       	mov    $0x30,%esi
  180834:	4c 89 ff             	mov    %r15,%rdi
  180837:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  180839:	41 83 ec 01          	sub    $0x1,%r12d
  18083d:	75 ed                	jne    18082c <printer::vprintf(char const*, __va_list_tag*)+0x55e>
        for (; datalen > 0; ++data, --datalen) {
  18083f:	8b 45 a0             	mov    -0x60(%rbp),%eax
  180842:	85 c0                	test   %eax,%eax
  180844:	7e 1a                	jle    180860 <printer::vprintf(char const*, __va_list_tag*)+0x592>
  180846:	41 89 c6             	mov    %eax,%r14d
  180849:	49 01 de             	add    %rbx,%r14
            putc(*data);
  18084c:	0f b6 33             	movzbl (%rbx),%esi
  18084f:	49 8b 07             	mov    (%r15),%rax
  180852:	4c 89 ff             	mov    %r15,%rdi
  180855:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  180857:	48 83 c3 01          	add    $0x1,%rbx
  18085b:	49 39 de             	cmp    %rbx,%r14
  18085e:	75 ec                	jne    18084c <printer::vprintf(char const*, __va_list_tag*)+0x57e>
        for (; width > 0; --width) {
  180860:	45 85 ed             	test   %r13d,%r13d
  180863:	7e 13                	jle    180878 <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            putc(' ');
  180865:	49 8b 07             	mov    (%r15),%rax
  180868:	be 20 00 00 00       	mov    $0x20,%esi
  18086d:	4c 89 ff             	mov    %r15,%rdi
  180870:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  180872:	41 83 ed 01          	sub    $0x1,%r13d
  180876:	75 ed                	jne    180865 <printer::vprintf(char const*, __va_list_tag*)+0x597>
    for (; *format; ++format) {
  180878:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  18087c:	4c 8d 60 01          	lea    0x1(%rax),%r12
  180880:	0f b6 40 01          	movzbl 0x1(%rax),%eax
  180884:	84 c0                	test   %al,%al
  180886:	0f 84 6c fa ff ff    	je     1802f8 <printer::vprintf(char const*, __va_list_tag*)+0x2a>
        if (*format != '%') {
  18088c:	3c 25                	cmp    $0x25,%al
  18088e:	0f 84 73 fa ff ff    	je     180307 <printer::vprintf(char const*, __va_list_tag*)+0x39>
            putc(*format);
  180894:	0f b6 f0             	movzbl %al,%esi
  180897:	49 8b 07             	mov    (%r15),%rax
  18089a:	4c 89 ff             	mov    %r15,%rdi
  18089d:	ff 10                	call   *(%rax)
            continue;
  18089f:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
  1808a3:	eb d3                	jmp    180878 <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            data = va_arg(val, char*);
  1808a5:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1808a9:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1808ad:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1808b1:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1808b5:	e9 95 fe ff ff       	jmp    18074f <printer::vprintf(char const*, __va_list_tag*)+0x481>
        switch (*format) {
  1808ba:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1808be:	eb 04                	jmp    1808c4 <printer::vprintf(char const*, __va_list_tag*)+0x5f6>
  1808c0:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            color_ = va_arg(val, int);
  1808c4:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1808c8:	8b 07                	mov    (%rdi),%eax
  1808ca:	83 f8 2f             	cmp    $0x2f,%eax
  1808cd:	77 13                	ja     1808e2 <printer::vprintf(char const*, __va_list_tag*)+0x614>
  1808cf:	89 c2                	mov    %eax,%edx
  1808d1:	48 03 57 10          	add    0x10(%rdi),%rdx
  1808d5:	83 c0 08             	add    $0x8,%eax
  1808d8:	89 07                	mov    %eax,(%rdi)
  1808da:	8b 02                	mov    (%rdx),%eax
  1808dc:	41 89 47 08          	mov    %eax,0x8(%r15)
            continue;
  1808e0:	eb 96                	jmp    180878 <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            color_ = va_arg(val, int);
  1808e2:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1808e6:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1808ea:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1808ee:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1808f2:	eb e6                	jmp    1808da <printer::vprintf(char const*, __va_list_tag*)+0x60c>
        switch (*format) {
  1808f4:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1808f8:	eb 04                	jmp    1808fe <printer::vprintf(char const*, __va_list_tag*)+0x630>
  1808fa:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = va_arg(val, int);
  1808fe:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  180902:	8b 01                	mov    (%rcx),%eax
  180904:	83 f8 2f             	cmp    $0x2f,%eax
  180907:	77 23                	ja     18092c <printer::vprintf(char const*, __va_list_tag*)+0x65e>
  180909:	89 c2                	mov    %eax,%edx
  18090b:	48 03 51 10          	add    0x10(%rcx),%rdx
  18090f:	83 c0 08             	add    $0x8,%eax
  180912:	89 01                	mov    %eax,(%rcx)
  180914:	8b 02                	mov    (%rdx),%eax
  180916:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  180919:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  18091d:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  180921:	41 bb 00 00 00 00    	mov    $0x0,%r11d
            break;
  180927:	e9 2c fe ff ff       	jmp    180758 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
            numbuf[0] = va_arg(val, int);
  18092c:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  180930:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  180934:	48 8d 42 08          	lea    0x8(%rdx),%rax
  180938:	48 89 41 08          	mov    %rax,0x8(%rcx)
  18093c:	eb d6                	jmp    180914 <printer::vprintf(char const*, __va_list_tag*)+0x646>
        switch (*format) {
  18093e:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = (*format ? *format : '%');
  180942:	84 c0                	test   %al,%al
  180944:	0f 85 ee 01 00 00    	jne    180b38 <printer::vprintf(char const*, __va_list_tag*)+0x86a>
  18094a:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  18094e:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  180952:	48 83 6d a8 01       	subq   $0x1,-0x58(%rbp)
            data = numbuf;
  180957:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  18095b:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  180961:	e9 f2 fd ff ff       	jmp    180758 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
    *--pos = '\0';
  180966:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  18096a:	41 f6 c6 20          	test   $0x20,%r14b
  18096e:	74 73                	je     1809e3 <printer::vprintf(char const*, __va_list_tag*)+0x715>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  180970:	8b 55 a0             	mov    -0x60(%rbp),%edx
  180973:	41 89 d1             	mov    %edx,%r9d
  180976:	41 89 c6             	mov    %eax,%r14d
  180979:	41 ba d0 24 18 00    	mov    $0x1824d0,%r10d
  18097f:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
  180986:	83 fa 0a             	cmp    $0xa,%edx
  180989:	0f 94 c0             	sete   %al
  18098c:	0f b6 c0             	movzbl %al,%eax
  18098f:	48 83 e8 04          	sub    $0x4,%rax
  180993:	eb 1d                	jmp    1809b2 <printer::vprintf(char const*, __va_list_tag*)+0x6e4>
    if (flags & FLAG_THOUSANDS) {
  180995:	41 89 c6             	mov    %eax,%r14d
        digits = lower_digits;
  180998:	41 ba b0 24 18 00    	mov    $0x1824b0,%r10d
        base = -base;
  18099e:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  1809a4:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1809ab:	48 c7 c0 fc ff ff ff 	mov    $0xfffffffffffffffc,%rax
  1809b2:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  1809b7:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  1809bb:	4c 89 d8             	mov    %r11,%rax
            *--pos = digits[val % base];
  1809be:	49 63 f1             	movslq %r9d,%rsi
    } while (val != 0 && pos != buf);
  1809c1:	4c 8d 45 b0          	lea    -0x50(%rbp),%r8
  1809c5:	eb 57                	jmp    180a1e <printer::vprintf(char const*, __va_list_tag*)+0x750>
    if (flags & FLAG_THOUSANDS) {
  1809c7:	41 ba d0 24 18 00    	mov    $0x1824d0,%r10d
  1809cd:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  1809d3:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1809da:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  1809e1:	eb cf                	jmp    1809b2 <printer::vprintf(char const*, __va_list_tag*)+0x6e4>
  1809e3:	44 8b 4d a0          	mov    -0x60(%rbp),%r9d
  1809e7:	41 89 c6             	mov    %eax,%r14d
  1809ea:	41 ba d0 24 18 00    	mov    $0x1824d0,%r10d
  1809f0:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = nullptr;
  1809f7:	bf 00 00 00 00       	mov    $0x0,%edi
  1809fc:	eb b9                	jmp    1809b7 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
            *--pos = digits[val % base];
  1809fe:	48 89 cb             	mov    %rcx,%rbx
  180a01:	ba 00 00 00 00       	mov    $0x0,%edx
  180a06:	48 f7 f6             	div    %rsi
  180a09:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
  180a0e:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  180a10:	48 83 e9 01          	sub    $0x1,%rcx
  180a14:	48 85 c0             	test   %rax,%rax
  180a17:	74 2d                	je     180a46 <printer::vprintf(char const*, __va_list_tag*)+0x778>
  180a19:	4c 39 c3             	cmp    %r8,%rbx
  180a1c:	74 28                	je     180a46 <printer::vprintf(char const*, __va_list_tag*)+0x778>
        if (pos == thousands_pos) {
  180a1e:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  180a22:	48 39 d7             	cmp    %rdx,%rdi
  180a25:	75 d7                	jne    1809fe <printer::vprintf(char const*, __va_list_tag*)+0x730>
            *--pos = base == 10 ? ',' : '\'';
  180a27:	48 89 cb             	mov    %rcx,%rbx
  180a2a:	41 83 f9 0a          	cmp    $0xa,%r9d
  180a2e:	0f 94 c2             	sete   %dl
  180a31:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  180a35:	40 0f 94 c7          	sete   %dil
  180a39:	40 0f b6 ff          	movzbl %dil,%edi
  180a3d:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  180a3f:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  180a44:	eb ca                	jmp    180a10 <printer::vprintf(char const*, __va_list_tag*)+0x742>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  180a46:	44 89 f0             	mov    %r14d,%eax
  180a49:	f7 d0                	not    %eax
  180a4b:	a8 c0                	test   $0xc0,%al
  180a4d:	75 3b                	jne    180a8a <printer::vprintf(char const*, __va_list_tag*)+0x7bc>
                prefix = "-";
  180a4f:	41 bc b1 0d 18 00    	mov    $0x180db1,%r12d
            if (flags & FLAG_NEGATIVE) {
  180a55:	41 f7 c6 00 01 00 00 	test   $0x100,%r14d
  180a5c:	0f 85 0b fd ff ff    	jne    18076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                prefix = "+";
  180a62:	41 bc ac 0d 18 00    	mov    $0x180dac,%r12d
            } else if (flags & FLAG_PLUSPOSITIVE) {
  180a68:	41 f6 c6 10          	test   $0x10,%r14b
  180a6c:	0f 85 fb fc ff ff    	jne    18076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
        const char* prefix = "";
  180a72:	41 f6 c6 08          	test   $0x8,%r14b
  180a76:	41 bc b3 0d 18 00    	mov    $0x180db3,%r12d
  180a7c:	b8 b4 0d 18 00       	mov    $0x180db4,%eax
  180a81:	4c 0f 44 e0          	cmove  %rax,%r12
  180a85:	e9 e3 fc ff ff       	jmp    18076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
  180a8a:	41 bc b4 0d 18 00    	mov    $0x180db4,%r12d
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  180a90:	44 89 f0             	mov    %r14d,%eax
  180a93:	f7 d0                	not    %eax
  180a95:	a8 41                	test   $0x41,%al
  180a97:	0f 85 d0 fc ff ff    	jne    18076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                   && (base == 16 || base == -16)
  180a9d:	8b 45 a0             	mov    -0x60(%rbp),%eax
  180aa0:	83 c0 10             	add    $0x10,%eax
  180aa3:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  180aa8:	0f 85 bf fc ff ff    	jne    18076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                   && (num || (flags & FLAG_ALT2))) {
  180aae:	4d 85 db             	test   %r11,%r11
  180ab1:	75 0d                	jne    180ac0 <printer::vprintf(char const*, __va_list_tag*)+0x7f2>
  180ab3:	41 f7 c6 00 02 00 00 	test   $0x200,%r14d
  180aba:	0f 84 ad fc ff ff    	je     18076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
            prefix = (base == -16 ? "0x" : "0X");
  180ac0:	83 7d a0 f0          	cmpl   $0xfffffff0,-0x60(%rbp)
  180ac4:	41 bc ae 0d 18 00    	mov    $0x180dae,%r12d
  180aca:	b8 b5 0d 18 00       	mov    $0x180db5,%eax
  180acf:	4c 0f 44 e0          	cmove  %rax,%r12
  180ad3:	e9 95 fc ff ff       	jmp    18076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
            datalen = strlen(data);
  180ad8:	48 89 df             	mov    %rbx,%rdi
  180adb:	e8 86 f6 ff ff       	call   180166 <strlen>
  180ae0:	89 45 a0             	mov    %eax,-0x60(%rbp)
            && precision >= 0) {
  180ae3:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
  180ae7:	0f 84 ad fc ff ff    	je     18079a <printer::vprintf(char const*, __va_list_tag*)+0x4cc>
  180aed:	80 7d 90 00          	cmpb   $0x0,-0x70(%rbp)
  180af1:	0f 84 a3 fc ff ff    	je     18079a <printer::vprintf(char const*, __va_list_tag*)+0x4cc>
            zeros = precision > datalen ? precision - datalen : 0;
  180af7:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  180afa:	89 fa                	mov    %edi,%edx
  180afc:	29 c2                	sub    %eax,%edx
  180afe:	39 c7                	cmp    %eax,%edi
  180b00:	b8 00 00 00 00       	mov    $0x0,%eax
  180b05:	0f 4f c2             	cmovg  %edx,%eax
  180b08:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  180b0b:	e9 a0 fc ff ff       	jmp    1807b0 <printer::vprintf(char const*, __va_list_tag*)+0x4e2>
                   && datalen + (int) strlen(prefix) < width) {
  180b10:	4c 89 e7             	mov    %r12,%rdi
  180b13:	e8 4e f6 ff ff       	call   180166 <strlen>
  180b18:	8b 7d a0             	mov    -0x60(%rbp),%edi
  180b1b:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  180b1e:	44 89 e9             	mov    %r13d,%ecx
  180b21:	29 f9                	sub    %edi,%ecx
  180b23:	29 c1                	sub    %eax,%ecx
  180b25:	44 39 ea             	cmp    %r13d,%edx
  180b28:	b8 00 00 00 00       	mov    $0x0,%eax
  180b2d:	0f 4c c1             	cmovl  %ecx,%eax
  180b30:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  180b33:	e9 78 fc ff ff       	jmp    1807b0 <printer::vprintf(char const*, __va_list_tag*)+0x4e2>
  180b38:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
            numbuf[0] = (*format ? *format : '%');
  180b3c:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  180b3f:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
  180b43:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = numbuf;
  180b47:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  180b4b:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  180b51:	e9 02 fc ff ff       	jmp    180758 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
    *--pos = '\0';
  180b56:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  180b5a:	41 f6 c6 20          	test   $0x20,%r14b
  180b5e:	0f 85 63 fe ff ff    	jne    1809c7 <printer::vprintf(char const*, __va_list_tag*)+0x6f9>
  180b64:	41 ba d0 24 18 00    	mov    $0x1824d0,%r10d
  180b6a:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  180b70:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
        thousands_pos = nullptr;
  180b77:	bf 00 00 00 00       	mov    $0x0,%edi
  180b7c:	e9 36 fe ff ff       	jmp    1809b7 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>

0000000000180b81 <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  180b81:	f3 0f 1e fa          	endbr64
  180b85:	55                   	push   %rbp
  180b86:	48 89 e5             	mov    %rsp,%rbp
  180b89:	53                   	push   %rbx
  180b8a:	48 83 ec 38          	sub    $0x38,%rsp
  180b8e:	48 89 f3             	mov    %rsi,%rbx
  180b91:	48 89 d6             	mov    %rdx,%rsi
  180b94:	48 89 ca             	mov    %rcx,%rdx
void console_printf(const char* format, ...);


// Generic print library

struct printer {
  180b97:	c7 45 d0 00 07 00 00 	movl   $0x700,-0x30(%rbp)
        : s_(s), end_(s + size), n_(0) {
  180b9e:	48 c7 45 c8 f8 24 18 	movq   $0x1824f8,-0x38(%rbp)
  180ba5:	00 
  180ba6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  180baa:	48 01 df             	add    %rbx,%rdi
  180bad:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  180bb1:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  180bb8:	00 
    string_printer sp(s, size);
    sp.vprintf(format, val);
  180bb9:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  180bbd:	e8 0c f7 ff ff       	call   1802ce <printer::vprintf(char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  180bc2:	48 85 db             	test   %rbx,%rbx
  180bc5:	74 10                	je     180bd7 <vsnprintf+0x56>
  180bc7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  180bcb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  180bcf:	48 39 c2             	cmp    %rax,%rdx
  180bd2:	73 0d                	jae    180be1 <vsnprintf+0x60>
        *sp.s_ = 0;
  180bd4:	c6 02 00             	movb   $0x0,(%rdx)
    } else if (size) {
        sp.end_[-1] = 0;
    }
    return sp.n_;
}
  180bd7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  180bdb:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  180bdf:	c9                   	leave
  180be0:	c3                   	ret
        sp.end_[-1] = 0;
  180be1:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
  180be5:	eb f0                	jmp    180bd7 <vsnprintf+0x56>

0000000000180be7 <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  180be7:	f3 0f 1e fa          	endbr64
  180beb:	55                   	push   %rbp
  180bec:	48 89 e5             	mov    %rsp,%rbp
  180bef:	48 83 ec 50          	sub    $0x50,%rsp
  180bf3:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  180bf7:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  180bfb:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  180bff:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  180c06:	48 8d 45 10          	lea    0x10(%rbp),%rax
  180c0a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  180c0e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  180c12:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  180c16:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  180c1a:	e8 62 ff ff ff       	call   180b81 <vsnprintf>
    va_end(val);
    return n;
  180c1f:	48 98                	cltq
}
  180c21:	c9                   	leave
  180c22:	c3                   	ret

0000000000180c23 <assert_fail(char const*, int, char const*, char const*)>:
void error_vprintf(int cpos, int color, const char* format, va_list val) {
    console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  180c23:	f3 0f 1e fa          	endbr64
  180c27:	55                   	push   %rbp
  180c28:	48 89 e5             	mov    %rsp,%rbp
  180c2b:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  180c32:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  180c35:	c7 05 bd 83 f3 ff 30 	movl   $0x730,-0xc7c43(%rip)        # b8ffc <cursorpos>
  180c3c:	07 00 00 
    char buf[240];
    if (description) {
  180c3f:	48 85 c9             	test   %rcx,%rcx
  180c42:	74 39                	je     180c7d <assert_fail(char const*, int, char const*, char const*)+0x5a>
  180c44:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  180c47:	48 83 ec 08          	sub    $0x8,%rsp
  180c4b:	52                   	push   %rdx
  180c4c:	56                   	push   %rsi
  180c4d:	57                   	push   %rdi
  180c4e:	48 89 f9             	mov    %rdi,%rcx
  180c51:	ba 30 0d 18 00       	mov    $0x180d30,%edx
  180c56:	be f0 00 00 00       	mov    $0xf0,%esi
  180c5b:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  180c62:	b0 00                	mov    $0x0,%al
  180c64:	e8 7e ff ff ff       	call   180be7 <snprintf>
  180c69:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  180c6d:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  180c72:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  180c79:	0f 05                	syscall
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  180c7b:	eb fe                	jmp    180c7b <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  180c7d:	49 89 d1             	mov    %rdx,%r9
  180c80:	48 89 f9             	mov    %rdi,%rcx
  180c83:	ba 60 0d 18 00       	mov    $0x180d60,%edx
  180c88:	be f0 00 00 00       	mov    $0xf0,%esi
  180c8d:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  180c94:	b0 00                	mov    $0x0,%al
  180c96:	e8 4c ff ff ff       	call   180be7 <snprintf>
  180c9b:	eb d0                	jmp    180c6d <assert_fail(char const*, int, char const*, char const*)+0x4a>

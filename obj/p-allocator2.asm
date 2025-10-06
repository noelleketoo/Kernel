
obj/p-allocator2.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000140000 <process_main()>:
    unsigned char buf[4096];
    int field2;
};
const test_struct test = {61, {0}, 6161};

void process_main() {
  140000:	f3 0f 1e fa          	endbr64
  140004:	55                   	push   %rbp
  140005:	48 89 e5             	mov    %rsp,%rbp
  140008:	41 54                	push   %r12
  14000a:	53                   	push   %rbx
    assert(test.field1 == 61);
    assert(memchr(&test, 0x11, sizeof(test)) == &test.field2);
  14000b:	ba 08 10 00 00       	mov    $0x1008,%edx
  140010:	be 11 00 00 00       	mov    $0x11,%esi
  140015:	bf e0 0d 14 00       	mov    $0x140de0,%edi
  14001a:	e8 1e 01 00 00       	call   14013d <memchr>
  14001f:	48 3d e4 1d 14 00    	cmp    $0x141de4,%rax
  140025:	75 48                	jne    14006f <process_main()+0x6f>
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  140027:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  14002c:	0f 05                	syscall
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
    return rax;
  14002e:	49 89 c4             	mov    %rax,%r12


// sys_getpid
//    Return current process ID. (Never fails.)
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  140031:	89 c3                	mov    %eax,%ebx

    pid_t p = sys_getpid();
    srand(p);
  140033:	89 c7                	mov    %eax,%edi
  140035:	e8 9d 01 00 00       	call   1401d7 <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  14003a:	ba 1b 40 14 00       	mov    $0x14401b,%edx

    // The heap starts on the page right after the 'end' symbol,
    // whose address is the first address not allocated to process code
    // or data.
    heap_top = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  14003f:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
  140046:	48 89 15 bb 2f 00 00 	mov    %rdx,0x2fbb(%rip)        # 143008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  14004d:	48 89 e0             	mov    %rsp,%rax

    // The bottom of the stack is the first address on the current
    // stack page (this process never needs more than one stack page).
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  140050:	48 83 e8 01          	sub    $0x1,%rax
  140054:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  14005a:	48 89 05 9f 2f 00 00 	mov    %rax,0x2f9f(%rip)        # 143000 <stack_bottom>

    // Allocate heap pages until (1) hit the stack (out of address space)
    // or (2) allocation fails (out of physical memory).
    while (heap_top != stack_bottom) {
  140061:	48 39 c2             	cmp    %rax,%rdx
  140064:	75 68                	jne    1400ce <process_main()+0xce>
    register uintptr_t rax asm("rax") = syscallno;
  140066:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  14006b:	0f 05                	syscall
        }
        sys_yield();
    }

    // After running out of memory, do nothing forever
    while (true) {
  14006d:	eb f7                	jmp    140066 <process_main()+0x66>
    assert(memchr(&test, 0x11, sizeof(test)) == &test.field2);
  14006f:	b9 00 00 00 00       	mov    $0x0,%ecx
  140074:	ba a0 0c 14 00       	mov    $0x140ca0,%edx
  140079:	be 16 00 00 00       	mov    $0x16,%esi
  14007e:	bf 83 0d 14 00       	mov    $0x140d83,%edi
  140083:	e8 9b 0b 00 00       	call   140c23 <assert_fail(char const*, int, char const*, char const*)>
                assert(*l == 0);
  140088:	b9 00 00 00 00       	mov    $0x0,%ecx
  14008d:	ba 92 0d 14 00       	mov    $0x140d92,%edx
  140092:	be 2f 00 00 00       	mov    $0x2f,%esi
  140097:	bf 83 0d 14 00       	mov    $0x140d83,%edi
  14009c:	e8 82 0b 00 00       	call   140c23 <assert_fail(char const*, int, char const*, char const*)>
            *heap_top = p;
  1400a1:	44 88 21             	mov    %r12b,(%rcx)
            console[CPOS(24, 79)] = p;
  1400a4:	66 44 89 25 f2 8e f7 	mov    %r12w,-0x8710e(%rip)        # b8f9e <console+0xf9e>
  1400ab:	ff 
            heap_top += PAGESIZE;
  1400ac:	48 81 05 51 2f 00 00 	addq   $0x1000,0x2f51(%rip)        # 143008 <heap_top>
  1400b3:	00 10 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  1400b7:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  1400bc:	0f 05                	syscall
    while (heap_top != stack_bottom) {
  1400be:	48 8b 05 3b 2f 00 00 	mov    0x2f3b(%rip),%rax        # 143000 <stack_bottom>
  1400c5:	48 39 05 3c 2f 00 00 	cmp    %rax,0x2f3c(%rip)        # 143008 <heap_top>
  1400cc:	74 98                	je     140066 <process_main()+0x66>
        if (rand(0, ALLOC_SLOWDOWN - 1) < p) {
  1400ce:	be 63 00 00 00       	mov    $0x63,%esi
  1400d3:	bf 00 00 00 00       	mov    $0x0,%edi
  1400d8:	e8 68 01 00 00       	call   140245 <rand(int, int)>
  1400dd:	39 d8                	cmp    %ebx,%eax
  1400df:	7d d6                	jge    1400b7 <process_main()+0xb7>
    register uintptr_t rax asm("rax") = syscallno;
  1400e1:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  1400e6:	48 8b 3d 1b 2f 00 00 	mov    0x2f1b(%rip),%rdi        # 143008 <heap_top>
  1400ed:	0f 05                	syscall
            if (sys_page_alloc((uint8_t*) heap_top) < 0) {
  1400ef:	85 c0                	test   %eax,%eax
  1400f1:	0f 88 6f ff ff ff    	js     140066 <process_main()+0x66>
            for (unsigned long* l = (unsigned long*) heap_top;
  1400f7:	48 8b 0d 0a 2f 00 00 	mov    0x2f0a(%rip),%rcx        # 143008 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1400fe:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  140105:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  140108:	48 83 38 00          	cmpq   $0x0,(%rax)
  14010c:	0f 85 76 ff ff ff    	jne    140088 <process_main()+0x88>
            for (unsigned long* l = (unsigned long*) heap_top;
  140112:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  140116:	48 39 d0             	cmp    %rdx,%rax
  140119:	75 ed                	jne    140108 <process_main()+0x108>
  14011b:	eb 84                	jmp    1400a1 <process_main()+0xa1>
  14011d:	90                   	nop

000000000014011e <string_printer::putc(unsigned char)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c) override {
  14011e:	f3 0f 1e fa          	endbr64
        if (s_ < end_) {
  140122:	48 8b 47 10          	mov    0x10(%rdi),%rax
  140126:	48 3b 47 18          	cmp    0x18(%rdi),%rax
  14012a:	73 0b                	jae    140137 <string_printer::putc(unsigned char)+0x19>
            *s_++ = c;
  14012c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  140130:	48 89 57 10          	mov    %rdx,0x10(%rdi)
  140134:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  140137:	48 83 47 20 01       	addq   $0x1,0x20(%rdi)
    }
  14013c:	c3                   	ret

000000000014013d <memchr>:
void* memchr(const void* s, int c, size_t n) {
  14013d:	f3 0f 1e fa          	endbr64
  140141:	48 89 f8             	mov    %rdi,%rax
    for (ss = (const unsigned char*) s; n != 0; ++ss, --n) {
  140144:	48 85 d2             	test   %rdx,%rdx
  140147:	74 17                	je     140160 <memchr+0x23>
  140149:	48 01 fa             	add    %rdi,%rdx
        if (*ss == (unsigned char) c) {
  14014c:	40 38 30             	cmp    %sil,(%rax)
  14014f:	74 14                	je     140165 <memchr+0x28>
    for (ss = (const unsigned char*) s; n != 0; ++ss, --n) {
  140151:	48 83 c0 01          	add    $0x1,%rax
  140155:	48 39 c2             	cmp    %rax,%rdx
  140158:	75 f2                	jne    14014c <memchr+0xf>
    return nullptr;
  14015a:	b8 00 00 00 00       	mov    $0x0,%eax
  14015f:	c3                   	ret
  140160:	b8 00 00 00 00       	mov    $0x0,%eax
}
  140165:	c3                   	ret

0000000000140166 <strlen>:
size_t strlen(const char* s) {
  140166:	f3 0f 1e fa          	endbr64
    for (n = 0; *s != '\0'; ++s) {
  14016a:	80 3f 00             	cmpb   $0x0,(%rdi)
  14016d:	74 10                	je     14017f <strlen+0x19>
  14016f:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  140174:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  140178:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  14017c:	75 f6                	jne    140174 <strlen+0xe>
  14017e:	c3                   	ret
  14017f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  140184:	c3                   	ret

0000000000140185 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  140185:	f3 0f 1e fa          	endbr64
  140189:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  14018c:	ba 00 00 00 00       	mov    $0x0,%edx
  140191:	48 85 f6             	test   %rsi,%rsi
  140194:	74 10                	je     1401a6 <strnlen+0x21>
  140196:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  14019a:	74 0b                	je     1401a7 <strnlen+0x22>
        ++n;
  14019c:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1401a0:	48 39 d0             	cmp    %rdx,%rax
  1401a3:	75 f1                	jne    140196 <strnlen+0x11>
  1401a5:	c3                   	ret
  1401a6:	c3                   	ret
  1401a7:	48 89 d0             	mov    %rdx,%rax
}
  1401aa:	c3                   	ret

00000000001401ab <strchr>:
char* strchr(const char* s, int c) {
  1401ab:	f3 0f 1e fa          	endbr64
    while (*s != '\0' && *s != (char) c) {
  1401af:	0f b6 07             	movzbl (%rdi),%eax
  1401b2:	84 c0                	test   %al,%al
  1401b4:	74 10                	je     1401c6 <strchr+0x1b>
  1401b6:	40 38 f0             	cmp    %sil,%al
  1401b9:	74 18                	je     1401d3 <strchr+0x28>
        ++s;
  1401bb:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  1401bf:	0f b6 07             	movzbl (%rdi),%eax
  1401c2:	84 c0                	test   %al,%al
  1401c4:	75 f0                	jne    1401b6 <strchr+0xb>
        return (char*) s;
  1401c6:	40 84 f6             	test   %sil,%sil
  1401c9:	b8 00 00 00 00       	mov    $0x0,%eax
  1401ce:	48 0f 44 c7          	cmove  %rdi,%rax
}
  1401d2:	c3                   	ret
        return (char*) s;
  1401d3:	48 89 f8             	mov    %rdi,%rax
  1401d6:	c3                   	ret

00000000001401d7 <srand(unsigned int)>:
void srand(unsigned seed) {
  1401d7:	f3 0f 1e fa          	endbr64
    rand_seed = ((unsigned long) seed << 32) | seed;
  1401db:	89 f8                	mov    %edi,%eax
  1401dd:	48 c1 e7 20          	shl    $0x20,%rdi
  1401e1:	48 01 c7             	add    %rax,%rdi
	  = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_acquire);
	__glibcxx_assert(__b != memory_order_acq_rel);
	__glibcxx_assert(__b != memory_order_consume);

	__atomic_store_n(&_M_i, __i, int(__m));
  1401e4:	48 87 3d 25 2e 00 00 	xchg   %rdi,0x2e25(%rip)        # 143010 <rand_seed>
  1401eb:	b8 01 00 00 00       	mov    $0x1,%eax
  1401f0:	87 05 22 2e 00 00    	xchg   %eax,0x2e22(%rip)        # 143018 <rand_seed_set>
}
  1401f6:	c3                   	ret

00000000001401f7 <rand()>:
int rand() {
  1401f7:	f3 0f 1e fa          	endbr64
  1401fb:	55                   	push   %rbp
  1401fc:	48 89 e5             	mov    %rsp,%rbp
	memory_order __b __attribute__ ((__unused__))
	  = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_release);
	__glibcxx_assert(__b != memory_order_acq_rel);

	return __atomic_load_n(&_M_i, int(__m));
  1401ff:	8b 05 13 2e 00 00    	mov    0x2e13(%rip),%eax        # 143018 <rand_seed_set>
    if (!rand_seed_set) {
  140205:	85 c0                	test   %eax,%eax
  140207:	74 30                	je     140239 <rand()+0x42>
  140209:	48 8b 05 00 2e 00 00 	mov    0x2e00(%rip),%rax        # 143010 <rand_seed>
        next_rs = rs * 6364136223846793005UL + 1;
  140210:	48 b9 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rcx
  140217:	f4 51 58 
  14021a:	48 89 c2             	mov    %rax,%rdx
  14021d:	48 0f af d1          	imul   %rcx,%rdx
  140221:	48 83 c2 01          	add    $0x1,%rdx
      compare_exchange_weak(__int_type& __i1, __int_type __i2,
			    memory_order __m1, memory_order __m2) noexcept
      {
	__glibcxx_assert(__is_valid_cmpexch_failure_order(__m2));

	return __atomic_compare_exchange_n(&_M_i, &__i1, __i2, 1,
  140225:	f0 48 0f b1 15 e2 2d 	lock cmpxchg %rdx,0x2de2(%rip)        # 143010 <rand_seed>
  14022c:	00 00 
    } while (!rand_seed.compare_exchange_weak(rs, next_rs));
  14022e:	75 ea                	jne    14021a <rand()+0x23>
    return (next_rs >> 33) & RAND_MAX;
  140230:	48 c1 ea 21          	shr    $0x21,%rdx
  140234:	48 89 d0             	mov    %rdx,%rax
}
  140237:	5d                   	pop    %rbp
  140238:	c3                   	ret
        srand(819234718U);
  140239:	bf 9e 87 d4 30       	mov    $0x30d4879e,%edi
  14023e:	e8 94 ff ff ff       	call   1401d7 <srand(unsigned int)>
  140243:	eb c4                	jmp    140209 <rand()+0x12>

0000000000140245 <rand(int, int)>:
int rand(int min, int max) {
  140245:	f3 0f 1e fa          	endbr64
  140249:	55                   	push   %rbp
  14024a:	48 89 e5             	mov    %rsp,%rbp
  14024d:	41 55                	push   %r13
  14024f:	41 54                	push   %r12
  140251:	53                   	push   %rbx
  140252:	48 83 ec 08          	sub    $0x8,%rsp
    assert(min <= max);
  140256:	39 f7                	cmp    %esi,%edi
  140258:	7f 42                	jg     14029c <rand(int, int)+0x57>
  14025a:	41 89 fc             	mov    %edi,%r12d
  14025d:	89 f3                	mov    %esi,%ebx
    unsigned div = (unsigned(RAND_MAX) + 1) / (max - min + 1),
  14025f:	29 fb                	sub    %edi,%ebx
  140261:	83 c3 01             	add    $0x1,%ebx
  140264:	b8 00 00 00 80       	mov    $0x80000000,%eax
  140269:	ba 00 00 00 00       	mov    $0x0,%edx
  14026e:	f7 f3                	div    %ebx
  140270:	41 89 c5             	mov    %eax,%r13d
        top = div * (max - min + 1);
  140273:	0f af d8             	imul   %eax,%ebx
    assert(top > 0 && top <= unsigned(RAND_MAX) + 1);
  140276:	89 d8                	mov    %ebx,%eax
  140278:	83 e8 01             	sub    $0x1,%eax
  14027b:	78 38                	js     1402b5 <rand(int, int)+0x70>
        unsigned r = rand();
  14027d:	e8 75 ff ff ff       	call   1401f7 <rand()>
        if (r < top) {
  140282:	39 d8                	cmp    %ebx,%eax
  140284:	73 f7                	jae    14027d <rand(int, int)+0x38>
            return min + r / div;
  140286:	ba 00 00 00 00       	mov    $0x0,%edx
  14028b:	41 f7 f5             	div    %r13d
  14028e:	44 01 e0             	add    %r12d,%eax
}
  140291:	48 83 c4 08          	add    $0x8,%rsp
  140295:	5b                   	pop    %rbx
  140296:	41 5c                	pop    %r12
  140298:	41 5d                	pop    %r13
  14029a:	5d                   	pop    %rbp
  14029b:	c3                   	ret
    assert(min <= max);
  14029c:	b9 00 00 00 00       	mov    $0x0,%ecx
  1402a1:	ba 9a 0d 14 00       	mov    $0x140d9a,%edx
  1402a6:	be 49 01 00 00       	mov    $0x149,%esi
  1402ab:	bf a5 0d 14 00       	mov    $0x140da5,%edi
  1402b0:	e8 6e 09 00 00       	call   140c23 <assert_fail(char const*, int, char const*, char const*)>
    assert(top > 0 && top <= unsigned(RAND_MAX) + 1);
  1402b5:	b9 00 00 00 00       	mov    $0x0,%ecx
  1402ba:	ba d8 0c 14 00       	mov    $0x140cd8,%edx
  1402bf:	be 4e 01 00 00       	mov    $0x14e,%esi
  1402c4:	bf a5 0d 14 00       	mov    $0x140da5,%edi
  1402c9:	e8 55 09 00 00       	call   140c23 <assert_fail(char const*, int, char const*, char const*)>

00000000001402ce <printer::vprintf(char const*, __va_list_tag*)>:
void printer::vprintf(const char* format, va_list val) {
  1402ce:	f3 0f 1e fa          	endbr64
  1402d2:	55                   	push   %rbp
  1402d3:	48 89 e5             	mov    %rsp,%rbp
  1402d6:	41 57                	push   %r15
  1402d8:	41 56                	push   %r14
  1402da:	41 55                	push   %r13
  1402dc:	41 54                	push   %r12
  1402de:	53                   	push   %rbx
  1402df:	48 83 ec 48          	sub    $0x48,%rsp
  1402e3:	49 89 ff             	mov    %rdi,%r15
  1402e6:	49 89 f4             	mov    %rsi,%r12
  1402e9:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
    for (; *format; ++format) {
  1402ed:	0f b6 06             	movzbl (%rsi),%eax
  1402f0:	84 c0                	test   %al,%al
  1402f2:	0f 85 94 05 00 00    	jne    14088c <printer::vprintf(char const*, __va_list_tag*)+0x5be>
}
  1402f8:	48 83 c4 48          	add    $0x48,%rsp
  1402fc:	5b                   	pop    %rbx
  1402fd:	41 5c                	pop    %r12
  1402ff:	41 5d                	pop    %r13
  140301:	41 5e                	pop    %r14
  140303:	41 5f                	pop    %r15
  140305:	5d                   	pop    %rbp
  140306:	c3                   	ret
        for (++format; *format; ++format) {
  140307:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  14030c:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
  140312:	45 84 e4             	test   %r12b,%r12b
  140315:	0f 84 01 01 00 00    	je     14041c <printer::vprintf(char const*, __va_list_tag*)+0x14e>
        int flags = 0;
  14031b:	41 be 00 00 00 00    	mov    $0x0,%r14d
            const char* flagc = strchr(flag_chars, *format);
  140321:	41 0f be f4          	movsbl %r12b,%esi
  140325:	bf e1 24 14 00       	mov    $0x1424e1,%edi
  14032a:	e8 7c fe ff ff       	call   1401ab <strchr>
  14032f:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  140332:	48 85 c0             	test   %rax,%rax
  140335:	74 70                	je     1403a7 <printer::vprintf(char const*, __va_list_tag*)+0xd9>
                flags |= 1 << (flagc - flag_chars);
  140337:	48 81 e9 e1 24 14 00 	sub    $0x1424e1,%rcx
  14033e:	b8 01 00 00 00       	mov    $0x1,%eax
  140343:	d3 e0                	shl    %cl,%eax
  140345:	41 09 c6             	or     %eax,%r14d
        for (++format; *format; ++format) {
  140348:	48 83 c3 01          	add    $0x1,%rbx
  14034c:	44 0f b6 23          	movzbl (%rbx),%r12d
  140350:	45 84 e4             	test   %r12b,%r12b
  140353:	75 cc                	jne    140321 <printer::vprintf(char const*, __va_list_tag*)+0x53>
        int width = -1;
  140355:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
  14035b:	c7 45 a4 ff ff ff ff 	movl   $0xffffffff,-0x5c(%rbp)
        if (*format == '.') {
  140362:	80 3b 2e             	cmpb   $0x2e,(%rbx)
  140365:	0f 84 d8 00 00 00    	je     140443 <printer::vprintf(char const*, __va_list_tag*)+0x175>
        switch (*format) {
  14036b:	0f b6 03             	movzbl (%rbx),%eax
  14036e:	3c 6c                	cmp    $0x6c,%al
  140370:	0f 84 73 01 00 00    	je     1404e9 <printer::vprintf(char const*, __va_list_tag*)+0x21b>
  140376:	0f 8f 4e 01 00 00    	jg     1404ca <printer::vprintf(char const*, __va_list_tag*)+0x1fc>
  14037c:	3c 68                	cmp    $0x68,%al
  14037e:	0f 85 88 01 00 00    	jne    14050c <printer::vprintf(char const*, __va_list_tag*)+0x23e>
            ++format;
  140384:	48 8d 43 01          	lea    0x1(%rbx),%rax
  140388:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  14038c:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  140390:	8d 50 bd             	lea    -0x43(%rax),%edx
  140393:	80 fa 35             	cmp    $0x35,%dl
  140396:	0f 87 a6 05 00 00    	ja     140942 <printer::vprintf(char const*, __va_list_tag*)+0x674>
  14039c:	0f b6 d2             	movzbl %dl,%edx
  14039f:	3e ff 24 d5 f0 1d 14 	notrack jmp *0x141df0(,%rdx,8)
  1403a6:	00 
        if (*format >= '1' && *format <= '9') {
  1403a7:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
  1403ac:	3c 08                	cmp    $0x8,%al
  1403ae:	77 32                	ja     1403e2 <printer::vprintf(char const*, __va_list_tag*)+0x114>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1403b0:	0f b6 03             	movzbl (%rbx),%eax
  1403b3:	8d 50 d0             	lea    -0x30(%rax),%edx
  1403b6:	80 fa 09             	cmp    $0x9,%dl
  1403b9:	77 72                	ja     14042d <printer::vprintf(char const*, __va_list_tag*)+0x15f>
  1403bb:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
  1403c1:	48 83 c3 01          	add    $0x1,%rbx
  1403c5:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
  1403ca:	0f be c0             	movsbl %al,%eax
  1403cd:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1403d2:	0f b6 03             	movzbl (%rbx),%eax
  1403d5:	8d 50 d0             	lea    -0x30(%rax),%edx
  1403d8:	80 fa 09             	cmp    $0x9,%dl
  1403db:	76 e4                	jbe    1403c1 <printer::vprintf(char const*, __va_list_tag*)+0xf3>
  1403dd:	e9 79 ff ff ff       	jmp    14035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
        } else if (*format == '*') {
  1403e2:	41 80 fc 2a          	cmp    $0x2a,%r12b
  1403e6:	75 50                	jne    140438 <printer::vprintf(char const*, __va_list_tag*)+0x16a>
            width = va_arg(val, int);
  1403e8:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1403ec:	8b 01                	mov    (%rcx),%eax
  1403ee:	83 f8 2f             	cmp    $0x2f,%eax
  1403f1:	77 17                	ja     14040a <printer::vprintf(char const*, __va_list_tag*)+0x13c>
  1403f3:	89 c2                	mov    %eax,%edx
  1403f5:	48 03 51 10          	add    0x10(%rcx),%rdx
  1403f9:	83 c0 08             	add    $0x8,%eax
  1403fc:	89 01                	mov    %eax,(%rcx)
  1403fe:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
  140401:	48 83 c3 01          	add    $0x1,%rbx
  140405:	e9 51 ff ff ff       	jmp    14035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            width = va_arg(val, int);
  14040a:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  14040e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  140412:	48 8d 42 08          	lea    0x8(%rdx),%rax
  140416:	48 89 41 08          	mov    %rax,0x8(%rcx)
  14041a:	eb e2                	jmp    1403fe <printer::vprintf(char const*, __va_list_tag*)+0x130>
        int flags = 0;
  14041c:	41 be 00 00 00 00    	mov    $0x0,%r14d
        int width = -1;
  140422:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  140428:	e9 2e ff ff ff       	jmp    14035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  14042d:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  140433:	e9 23 ff ff ff       	jmp    14035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
        int width = -1;
  140438:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  14043e:	e9 18 ff ff ff       	jmp    14035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            ++format;
  140443:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
  140447:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  14044b:	8d 48 d0             	lea    -0x30(%rax),%ecx
  14044e:	80 f9 09             	cmp    $0x9,%cl
  140451:	76 13                	jbe    140466 <printer::vprintf(char const*, __va_list_tag*)+0x198>
            } else if (*format == '*') {
  140453:	3c 2a                	cmp    $0x2a,%al
  140455:	74 33                	je     14048a <printer::vprintf(char const*, __va_list_tag*)+0x1bc>
            ++format;
  140457:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
  14045a:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
  140461:	e9 05 ff ff ff       	jmp    14036b <printer::vprintf(char const*, __va_list_tag*)+0x9d>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  140466:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  14046b:	48 83 c2 01          	add    $0x1,%rdx
  14046f:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  140472:	0f be c0             	movsbl %al,%eax
  140475:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  140479:	0f b6 02             	movzbl (%rdx),%eax
  14047c:	8d 70 d0             	lea    -0x30(%rax),%esi
  14047f:	40 80 fe 09          	cmp    $0x9,%sil
  140483:	76 e6                	jbe    14046b <printer::vprintf(char const*, __va_list_tag*)+0x19d>
  140485:	48 89 d3             	mov    %rdx,%rbx
  140488:	eb 1c                	jmp    1404a6 <printer::vprintf(char const*, __va_list_tag*)+0x1d8>
                precision = va_arg(val, int);
  14048a:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  14048e:	8b 07                	mov    (%rdi),%eax
  140490:	83 f8 2f             	cmp    $0x2f,%eax
  140493:	77 23                	ja     1404b8 <printer::vprintf(char const*, __va_list_tag*)+0x1ea>
  140495:	89 c2                	mov    %eax,%edx
  140497:	48 03 57 10          	add    0x10(%rdi),%rdx
  14049b:	83 c0 08             	add    $0x8,%eax
  14049e:	89 07                	mov    %eax,(%rdi)
  1404a0:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  1404a2:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
  1404a6:	85 c9                	test   %ecx,%ecx
  1404a8:	b8 00 00 00 00       	mov    $0x0,%eax
  1404ad:	0f 49 c1             	cmovns %ecx,%eax
  1404b0:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1404b3:	e9 b3 fe ff ff       	jmp    14036b <printer::vprintf(char const*, __va_list_tag*)+0x9d>
                precision = va_arg(val, int);
  1404b8:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1404bc:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1404c0:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1404c4:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1404c8:	eb d6                	jmp    1404a0 <printer::vprintf(char const*, __va_list_tag*)+0x1d2>
        switch (*format) {
  1404ca:	3c 74                	cmp    $0x74,%al
  1404cc:	74 1b                	je     1404e9 <printer::vprintf(char const*, __va_list_tag*)+0x21b>
  1404ce:	3c 7a                	cmp    $0x7a,%al
  1404d0:	74 17                	je     1404e9 <printer::vprintf(char const*, __va_list_tag*)+0x21b>
        switch (*format) {
  1404d2:	8d 50 bd             	lea    -0x43(%rax),%edx
  1404d5:	80 fa 35             	cmp    $0x35,%dl
  1404d8:	0f 87 5e 06 00 00    	ja     140b3c <printer::vprintf(char const*, __va_list_tag*)+0x86e>
  1404de:	0f b6 d2             	movzbl %dl,%edx
  1404e1:	3e ff 24 d5 a0 1f 14 	notrack jmp *0x141fa0(,%rdx,8)
  1404e8:	00 
            ++format;
  1404e9:	48 8d 43 01          	lea    0x1(%rbx),%rax
  1404ed:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  1404f1:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1404f5:	8d 50 bd             	lea    -0x43(%rax),%edx
  1404f8:	80 fa 35             	cmp    $0x35,%dl
  1404fb:	0f 87 41 04 00 00    	ja     140942 <printer::vprintf(char const*, __va_list_tag*)+0x674>
  140501:	0f b6 d2             	movzbl %dl,%edx
  140504:	3e ff 24 d5 50 21 14 	notrack jmp *0x142150(,%rdx,8)
  14050b:	00 
  14050c:	8d 50 bd             	lea    -0x43(%rax),%edx
  14050f:	80 fa 35             	cmp    $0x35,%dl
  140512:	0f 87 26 04 00 00    	ja     14093e <printer::vprintf(char const*, __va_list_tag*)+0x670>
  140518:	0f b6 d2             	movzbl %dl,%edx
  14051b:	3e ff 24 d5 00 23 14 	notrack jmp *0x142300(,%rdx,8)
  140522:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  140523:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  140527:	8b 07                	mov    (%rdi),%eax
  140529:	83 f8 2f             	cmp    $0x2f,%eax
  14052c:	77 36                	ja     140564 <printer::vprintf(char const*, __va_list_tag*)+0x296>
  14052e:	89 c2                	mov    %eax,%edx
  140530:	48 03 57 10          	add    0x10(%rdi),%rdx
  140534:	83 c0 08             	add    $0x8,%eax
  140537:	89 07                	mov    %eax,(%rdi)
  140539:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  14053c:	48 89 d0             	mov    %rdx,%rax
  14053f:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  140543:	49 89 d3             	mov    %rdx,%r11
  140546:	49 f7 db             	neg    %r11
  140549:	25 00 01 00 00       	and    $0x100,%eax
  14054e:	4c 0f 44 da          	cmove  %rdx,%r11
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  140552:	44 09 f0             	or     %r14d,%eax
  140555:	0c c0                	or     $0xc0,%al
  140557:	41 89 c6             	mov    %eax,%r14d
        const char* data = "";
  14055a:	bb b4 0d 14 00       	mov    $0x140db4,%ebx
            break;
  14055f:	e9 f4 01 00 00       	jmp    140758 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  140564:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  140568:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  14056c:	48 8d 42 08          	lea    0x8(%rdx),%rax
  140570:	48 89 41 08          	mov    %rax,0x8(%rcx)
  140574:	eb c3                	jmp    140539 <printer::vprintf(char const*, __va_list_tag*)+0x26b>
        switch (*format) {
  140576:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  14057a:	eb 04                	jmp    140580 <printer::vprintf(char const*, __va_list_tag*)+0x2b2>
  14057c:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            long x = length ? va_arg(val, long) : va_arg(val, int);
  140580:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  140584:	8b 01                	mov    (%rcx),%eax
  140586:	83 f8 2f             	cmp    $0x2f,%eax
  140589:	77 10                	ja     14059b <printer::vprintf(char const*, __va_list_tag*)+0x2cd>
  14058b:	89 c2                	mov    %eax,%edx
  14058d:	48 03 51 10          	add    0x10(%rcx),%rdx
  140591:	83 c0 08             	add    $0x8,%eax
  140594:	89 01                	mov    %eax,(%rcx)
  140596:	48 63 12             	movslq (%rdx),%rdx
  140599:	eb a1                	jmp    14053c <printer::vprintf(char const*, __va_list_tag*)+0x26e>
  14059b:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  14059f:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1405a3:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1405a7:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1405ab:	eb e9                	jmp    140596 <printer::vprintf(char const*, __va_list_tag*)+0x2c8>
        switch (*format) {
  1405ad:	b8 01 00 00 00       	mov    $0x1,%eax
  1405b2:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  1405b9:	e9 9d 00 00 00       	jmp    14065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  1405be:	b8 00 00 00 00       	mov    $0x0,%eax
  1405c3:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  1405ca:	e9 8c 00 00 00       	jmp    14065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  1405cf:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1405d3:	b8 00 00 00 00       	mov    $0x0,%eax
  1405d8:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  1405df:	eb 7a                	jmp    14065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  1405e1:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1405e5:	b8 00 00 00 00       	mov    $0x0,%eax
  1405ea:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  1405f1:	eb 68                	jmp    14065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1405f3:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1405f7:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1405fb:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1405ff:	48 89 47 08          	mov    %rax,0x8(%rdi)
  140603:	eb 70                	jmp    140675 <printer::vprintf(char const*, __va_list_tag*)+0x3a7>
  140605:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  140609:	8b 07                	mov    (%rdi),%eax
  14060b:	83 f8 2f             	cmp    $0x2f,%eax
  14060e:	77 10                	ja     140620 <printer::vprintf(char const*, __va_list_tag*)+0x352>
  140610:	89 c2                	mov    %eax,%edx
  140612:	48 03 57 10          	add    0x10(%rdi),%rdx
  140616:	83 c0 08             	add    $0x8,%eax
  140619:	89 07                	mov    %eax,(%rdi)
  14061b:	44 8b 1a             	mov    (%rdx),%r11d
  14061e:	eb 58                	jmp    140678 <printer::vprintf(char const*, __va_list_tag*)+0x3aa>
  140620:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  140624:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  140628:	48 8d 42 08          	lea    0x8(%rdx),%rax
  14062c:	48 89 41 08          	mov    %rax,0x8(%rcx)
  140630:	eb e9                	jmp    14061b <printer::vprintf(char const*, __va_list_tag*)+0x34d>
        switch (*format) {
  140632:	b8 01 00 00 00       	mov    $0x1,%eax
  140637:	eb 1b                	jmp    140654 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  140639:	b8 00 00 00 00       	mov    $0x0,%eax
  14063e:	eb 14                	jmp    140654 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  140640:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  140644:	b8 00 00 00 00       	mov    $0x0,%eax
  140649:	eb 09                	jmp    140654 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  14064b:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  14064f:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  140654:	c7 45 a0 f0 ff ff ff 	movl   $0xfffffff0,-0x60(%rbp)
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  14065b:	85 c0                	test   %eax,%eax
  14065d:	74 a6                	je     140605 <printer::vprintf(char const*, __va_list_tag*)+0x337>
  14065f:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  140663:	8b 07                	mov    (%rdi),%eax
  140665:	83 f8 2f             	cmp    $0x2f,%eax
  140668:	77 89                	ja     1405f3 <printer::vprintf(char const*, __va_list_tag*)+0x325>
  14066a:	89 c2                	mov    %eax,%edx
  14066c:	48 03 57 10          	add    0x10(%rdi),%rdx
  140670:	83 c0 08             	add    $0x8,%eax
  140673:	89 07                	mov    %eax,(%rdi)
  140675:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_NUMERIC;
  140678:	44 89 f0             	mov    %r14d,%eax
  14067b:	83 c8 40             	or     $0x40,%eax
    if (base < 0) {
  14067e:	83 7d a0 00          	cmpl   $0x0,-0x60(%rbp)
  140682:	0f 89 de 02 00 00    	jns    140966 <printer::vprintf(char const*, __va_list_tag*)+0x698>
    *--pos = '\0';
  140688:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  14068c:	a8 20                	test   $0x20,%al
  14068e:	0f 85 01 03 00 00    	jne    140995 <printer::vprintf(char const*, __va_list_tag*)+0x6c7>
  140694:	41 89 c6             	mov    %eax,%r14d
        digits = lower_digits;
  140697:	41 ba b0 24 14 00    	mov    $0x1424b0,%r10d
        base = -base;
  14069d:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  1406a3:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = nullptr;
  1406aa:	bf 00 00 00 00       	mov    $0x0,%edi
  1406af:	e9 03 03 00 00       	jmp    1409b7 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
        switch (*format) {
  1406b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1406b9:	eb 1b                	jmp    1406d6 <printer::vprintf(char const*, __va_list_tag*)+0x408>
  1406bb:	b8 00 00 00 00       	mov    $0x0,%eax
  1406c0:	eb 14                	jmp    1406d6 <printer::vprintf(char const*, __va_list_tag*)+0x408>
  1406c2:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1406c6:	b8 00 00 00 00       	mov    $0x0,%eax
  1406cb:	eb 09                	jmp    1406d6 <printer::vprintf(char const*, __va_list_tag*)+0x408>
  1406cd:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1406d1:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  1406d6:	c7 45 a0 10 00 00 00 	movl   $0x10,-0x60(%rbp)
            goto format_unsigned;
  1406dd:	e9 79 ff ff ff       	jmp    14065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
        switch (*format) {
  1406e2:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1406e6:	eb 04                	jmp    1406ec <printer::vprintf(char const*, __va_list_tag*)+0x41e>
  1406e8:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            num = (uintptr_t) va_arg(val, void*);
  1406ec:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1406f0:	8b 01                	mov    (%rcx),%eax
  1406f2:	83 f8 2f             	cmp    $0x2f,%eax
  1406f5:	77 22                	ja     140719 <printer::vprintf(char const*, __va_list_tag*)+0x44b>
  1406f7:	89 c2                	mov    %eax,%edx
  1406f9:	48 03 51 10          	add    0x10(%rcx),%rdx
  1406fd:	83 c0 08             	add    $0x8,%eax
  140700:	89 01                	mov    %eax,(%rcx)
  140702:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  140705:	44 89 f0             	mov    %r14d,%eax
  140708:	0d 41 02 00 00       	or     $0x241,%eax
            base = -16;
  14070d:	c7 45 a0 f0 ff ff ff 	movl   $0xfffffff0,-0x60(%rbp)
  140714:	e9 6f ff ff ff       	jmp    140688 <printer::vprintf(char const*, __va_list_tag*)+0x3ba>
            num = (uintptr_t) va_arg(val, void*);
  140719:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  14071d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  140721:	48 8d 42 08          	lea    0x8(%rdx),%rax
  140725:	48 89 47 08          	mov    %rax,0x8(%rdi)
  140729:	eb d7                	jmp    140702 <printer::vprintf(char const*, __va_list_tag*)+0x434>
        switch (*format) {
  14072b:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  14072f:	eb 04                	jmp    140735 <printer::vprintf(char const*, __va_list_tag*)+0x467>
  140731:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = va_arg(val, char*);
  140735:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  140739:	8b 01                	mov    (%rcx),%eax
  14073b:	83 f8 2f             	cmp    $0x2f,%eax
  14073e:	0f 87 61 01 00 00    	ja     1408a5 <printer::vprintf(char const*, __va_list_tag*)+0x5d7>
  140744:	89 c2                	mov    %eax,%edx
  140746:	48 03 51 10          	add    0x10(%rcx),%rdx
  14074a:	83 c0 08             	add    $0x8,%eax
  14074d:	89 01                	mov    %eax,(%rcx)
  14074f:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  140752:	41 bb 00 00 00 00    	mov    $0x0,%r11d
        if (flags & FLAG_NUMERIC) {
  140758:	44 89 f0             	mov    %r14d,%eax
  14075b:	83 e0 40             	and    $0x40,%eax
  14075e:	89 45 94             	mov    %eax,-0x6c(%rbp)
        const char* prefix = "";
  140761:	41 bc b4 0d 14 00    	mov    $0x140db4,%r12d
        if (flags & FLAG_NUMERIC) {
  140767:	0f 85 e9 03 00 00    	jne    140b56 <printer::vprintf(char const*, __va_list_tag*)+0x888>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  14076d:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  140770:	89 d0                	mov    %edx,%eax
  140772:	f7 d0                	not    %eax
  140774:	c1 e8 1f             	shr    $0x1f,%eax
  140777:	89 45 90             	mov    %eax,-0x70(%rbp)
  14077a:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
  14077e:	0f 85 54 03 00 00    	jne    140ad8 <printer::vprintf(char const*, __va_list_tag*)+0x80a>
  140784:	84 c0                	test   %al,%al
  140786:	0f 84 4c 03 00 00    	je     140ad8 <printer::vprintf(char const*, __va_list_tag*)+0x80a>
            datalen = strnlen(data, precision);
  14078c:	48 63 f2             	movslq %edx,%rsi
  14078f:	48 89 df             	mov    %rbx,%rdi
  140792:	e8 ee f9 ff ff       	call   140185 <strnlen>
  140797:	89 45 a0             	mov    %eax,-0x60(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  14079a:	44 89 f0             	mov    %r14d,%eax
  14079d:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  1407a0:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  1407a7:	83 f8 42             	cmp    $0x42,%eax
  1407aa:	0f 84 60 03 00 00    	je     140b10 <printer::vprintf(char const*, __va_list_tag*)+0x842>
        width -= datalen + zeros + strlen(prefix);
  1407b0:	4c 89 e7             	mov    %r12,%rdi
  1407b3:	e8 ae f9 ff ff       	call   140166 <strlen>
  1407b8:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  1407bb:	8b 7d a0             	mov    -0x60(%rbp),%edi
  1407be:	8d 0c 3a             	lea    (%rdx,%rdi,1),%ecx
  1407c1:	44 89 ea             	mov    %r13d,%edx
  1407c4:	29 ca                	sub    %ecx,%edx
  1407c6:	29 c2                	sub    %eax,%edx
  1407c8:	41 89 d5             	mov    %edx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1407cb:	41 f6 c6 04          	test   $0x4,%r14b
  1407cf:	75 31                	jne    140802 <printer::vprintf(char const*, __va_list_tag*)+0x534>
  1407d1:	85 d2                	test   %edx,%edx
  1407d3:	7e 2d                	jle    140802 <printer::vprintf(char const*, __va_list_tag*)+0x534>
        width -= datalen + zeros + strlen(prefix);
  1407d5:	41 89 d6             	mov    %edx,%r14d
            putc(' ');
  1407d8:	49 8b 07             	mov    (%r15),%rax
  1407db:	be 20 00 00 00       	mov    $0x20,%esi
  1407e0:	4c 89 ff             	mov    %r15,%rdi
  1407e3:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1407e5:	41 83 ed 01          	sub    $0x1,%r13d
  1407e9:	45 85 ed             	test   %r13d,%r13d
  1407ec:	7f ea                	jg     1407d8 <printer::vprintf(char const*, __va_list_tag*)+0x50a>
  1407ee:	44 89 f2             	mov    %r14d,%edx
  1407f1:	45 85 f6             	test   %r14d,%r14d
  1407f4:	b8 01 00 00 00       	mov    $0x1,%eax
  1407f9:	41 0f 4f c6          	cmovg  %r14d,%eax
  1407fd:	29 c2                	sub    %eax,%edx
  1407ff:	41 89 d5             	mov    %edx,%r13d
        for (; *prefix; ++prefix) {
  140802:	41 0f b6 04 24       	movzbl (%r12),%eax
  140807:	84 c0                	test   %al,%al
  140809:	74 18                	je     140823 <printer::vprintf(char const*, __va_list_tag*)+0x555>
            putc(*prefix);
  14080b:	0f b6 f0             	movzbl %al,%esi
  14080e:	49 8b 07             	mov    (%r15),%rax
  140811:	4c 89 ff             	mov    %r15,%rdi
  140814:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  140816:	49 83 c4 01          	add    $0x1,%r12
  14081a:	41 0f b6 04 24       	movzbl (%r12),%eax
  14081f:	84 c0                	test   %al,%al
  140821:	75 e8                	jne    14080b <printer::vprintf(char const*, __va_list_tag*)+0x53d>
        for (; zeros > 0; --zeros) {
  140823:	44 8b 65 a4          	mov    -0x5c(%rbp),%r12d
  140827:	45 85 e4             	test   %r12d,%r12d
  14082a:	7e 13                	jle    14083f <printer::vprintf(char const*, __va_list_tag*)+0x571>
            putc('0');
  14082c:	49 8b 07             	mov    (%r15),%rax
  14082f:	be 30 00 00 00       	mov    $0x30,%esi
  140834:	4c 89 ff             	mov    %r15,%rdi
  140837:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  140839:	41 83 ec 01          	sub    $0x1,%r12d
  14083d:	75 ed                	jne    14082c <printer::vprintf(char const*, __va_list_tag*)+0x55e>
        for (; datalen > 0; ++data, --datalen) {
  14083f:	8b 45 a0             	mov    -0x60(%rbp),%eax
  140842:	85 c0                	test   %eax,%eax
  140844:	7e 1a                	jle    140860 <printer::vprintf(char const*, __va_list_tag*)+0x592>
  140846:	41 89 c6             	mov    %eax,%r14d
  140849:	49 01 de             	add    %rbx,%r14
            putc(*data);
  14084c:	0f b6 33             	movzbl (%rbx),%esi
  14084f:	49 8b 07             	mov    (%r15),%rax
  140852:	4c 89 ff             	mov    %r15,%rdi
  140855:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  140857:	48 83 c3 01          	add    $0x1,%rbx
  14085b:	49 39 de             	cmp    %rbx,%r14
  14085e:	75 ec                	jne    14084c <printer::vprintf(char const*, __va_list_tag*)+0x57e>
        for (; width > 0; --width) {
  140860:	45 85 ed             	test   %r13d,%r13d
  140863:	7e 13                	jle    140878 <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            putc(' ');
  140865:	49 8b 07             	mov    (%r15),%rax
  140868:	be 20 00 00 00       	mov    $0x20,%esi
  14086d:	4c 89 ff             	mov    %r15,%rdi
  140870:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  140872:	41 83 ed 01          	sub    $0x1,%r13d
  140876:	75 ed                	jne    140865 <printer::vprintf(char const*, __va_list_tag*)+0x597>
    for (; *format; ++format) {
  140878:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  14087c:	4c 8d 60 01          	lea    0x1(%rax),%r12
  140880:	0f b6 40 01          	movzbl 0x1(%rax),%eax
  140884:	84 c0                	test   %al,%al
  140886:	0f 84 6c fa ff ff    	je     1402f8 <printer::vprintf(char const*, __va_list_tag*)+0x2a>
        if (*format != '%') {
  14088c:	3c 25                	cmp    $0x25,%al
  14088e:	0f 84 73 fa ff ff    	je     140307 <printer::vprintf(char const*, __va_list_tag*)+0x39>
            putc(*format);
  140894:	0f b6 f0             	movzbl %al,%esi
  140897:	49 8b 07             	mov    (%r15),%rax
  14089a:	4c 89 ff             	mov    %r15,%rdi
  14089d:	ff 10                	call   *(%rax)
            continue;
  14089f:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
  1408a3:	eb d3                	jmp    140878 <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            data = va_arg(val, char*);
  1408a5:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1408a9:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1408ad:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1408b1:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1408b5:	e9 95 fe ff ff       	jmp    14074f <printer::vprintf(char const*, __va_list_tag*)+0x481>
        switch (*format) {
  1408ba:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1408be:	eb 04                	jmp    1408c4 <printer::vprintf(char const*, __va_list_tag*)+0x5f6>
  1408c0:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            color_ = va_arg(val, int);
  1408c4:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1408c8:	8b 07                	mov    (%rdi),%eax
  1408ca:	83 f8 2f             	cmp    $0x2f,%eax
  1408cd:	77 13                	ja     1408e2 <printer::vprintf(char const*, __va_list_tag*)+0x614>
  1408cf:	89 c2                	mov    %eax,%edx
  1408d1:	48 03 57 10          	add    0x10(%rdi),%rdx
  1408d5:	83 c0 08             	add    $0x8,%eax
  1408d8:	89 07                	mov    %eax,(%rdi)
  1408da:	8b 02                	mov    (%rdx),%eax
  1408dc:	41 89 47 08          	mov    %eax,0x8(%r15)
            continue;
  1408e0:	eb 96                	jmp    140878 <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            color_ = va_arg(val, int);
  1408e2:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1408e6:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1408ea:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1408ee:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1408f2:	eb e6                	jmp    1408da <printer::vprintf(char const*, __va_list_tag*)+0x60c>
        switch (*format) {
  1408f4:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1408f8:	eb 04                	jmp    1408fe <printer::vprintf(char const*, __va_list_tag*)+0x630>
  1408fa:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = va_arg(val, int);
  1408fe:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  140902:	8b 01                	mov    (%rcx),%eax
  140904:	83 f8 2f             	cmp    $0x2f,%eax
  140907:	77 23                	ja     14092c <printer::vprintf(char const*, __va_list_tag*)+0x65e>
  140909:	89 c2                	mov    %eax,%edx
  14090b:	48 03 51 10          	add    0x10(%rcx),%rdx
  14090f:	83 c0 08             	add    $0x8,%eax
  140912:	89 01                	mov    %eax,(%rcx)
  140914:	8b 02                	mov    (%rdx),%eax
  140916:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  140919:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  14091d:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  140921:	41 bb 00 00 00 00    	mov    $0x0,%r11d
            break;
  140927:	e9 2c fe ff ff       	jmp    140758 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
            numbuf[0] = va_arg(val, int);
  14092c:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  140930:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  140934:	48 8d 42 08          	lea    0x8(%rdx),%rax
  140938:	48 89 41 08          	mov    %rax,0x8(%rcx)
  14093c:	eb d6                	jmp    140914 <printer::vprintf(char const*, __va_list_tag*)+0x646>
        switch (*format) {
  14093e:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = (*format ? *format : '%');
  140942:	84 c0                	test   %al,%al
  140944:	0f 85 ee 01 00 00    	jne    140b38 <printer::vprintf(char const*, __va_list_tag*)+0x86a>
  14094a:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  14094e:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  140952:	48 83 6d a8 01       	subq   $0x1,-0x58(%rbp)
            data = numbuf;
  140957:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  14095b:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  140961:	e9 f2 fd ff ff       	jmp    140758 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
    *--pos = '\0';
  140966:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  14096a:	41 f6 c6 20          	test   $0x20,%r14b
  14096e:	74 73                	je     1409e3 <printer::vprintf(char const*, __va_list_tag*)+0x715>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  140970:	8b 55 a0             	mov    -0x60(%rbp),%edx
  140973:	41 89 d1             	mov    %edx,%r9d
  140976:	41 89 c6             	mov    %eax,%r14d
  140979:	41 ba d0 24 14 00    	mov    $0x1424d0,%r10d
  14097f:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
  140986:	83 fa 0a             	cmp    $0xa,%edx
  140989:	0f 94 c0             	sete   %al
  14098c:	0f b6 c0             	movzbl %al,%eax
  14098f:	48 83 e8 04          	sub    $0x4,%rax
  140993:	eb 1d                	jmp    1409b2 <printer::vprintf(char const*, __va_list_tag*)+0x6e4>
    if (flags & FLAG_THOUSANDS) {
  140995:	41 89 c6             	mov    %eax,%r14d
        digits = lower_digits;
  140998:	41 ba b0 24 14 00    	mov    $0x1424b0,%r10d
        base = -base;
  14099e:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  1409a4:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1409ab:	48 c7 c0 fc ff ff ff 	mov    $0xfffffffffffffffc,%rax
  1409b2:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  1409b7:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  1409bb:	4c 89 d8             	mov    %r11,%rax
            *--pos = digits[val % base];
  1409be:	49 63 f1             	movslq %r9d,%rsi
    } while (val != 0 && pos != buf);
  1409c1:	4c 8d 45 b0          	lea    -0x50(%rbp),%r8
  1409c5:	eb 57                	jmp    140a1e <printer::vprintf(char const*, __va_list_tag*)+0x750>
    if (flags & FLAG_THOUSANDS) {
  1409c7:	41 ba d0 24 14 00    	mov    $0x1424d0,%r10d
  1409cd:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  1409d3:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1409da:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  1409e1:	eb cf                	jmp    1409b2 <printer::vprintf(char const*, __va_list_tag*)+0x6e4>
  1409e3:	44 8b 4d a0          	mov    -0x60(%rbp),%r9d
  1409e7:	41 89 c6             	mov    %eax,%r14d
  1409ea:	41 ba d0 24 14 00    	mov    $0x1424d0,%r10d
  1409f0:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = nullptr;
  1409f7:	bf 00 00 00 00       	mov    $0x0,%edi
  1409fc:	eb b9                	jmp    1409b7 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
            *--pos = digits[val % base];
  1409fe:	48 89 cb             	mov    %rcx,%rbx
  140a01:	ba 00 00 00 00       	mov    $0x0,%edx
  140a06:	48 f7 f6             	div    %rsi
  140a09:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
  140a0e:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  140a10:	48 83 e9 01          	sub    $0x1,%rcx
  140a14:	48 85 c0             	test   %rax,%rax
  140a17:	74 2d                	je     140a46 <printer::vprintf(char const*, __va_list_tag*)+0x778>
  140a19:	4c 39 c3             	cmp    %r8,%rbx
  140a1c:	74 28                	je     140a46 <printer::vprintf(char const*, __va_list_tag*)+0x778>
        if (pos == thousands_pos) {
  140a1e:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  140a22:	48 39 d7             	cmp    %rdx,%rdi
  140a25:	75 d7                	jne    1409fe <printer::vprintf(char const*, __va_list_tag*)+0x730>
            *--pos = base == 10 ? ',' : '\'';
  140a27:	48 89 cb             	mov    %rcx,%rbx
  140a2a:	41 83 f9 0a          	cmp    $0xa,%r9d
  140a2e:	0f 94 c2             	sete   %dl
  140a31:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  140a35:	40 0f 94 c7          	sete   %dil
  140a39:	40 0f b6 ff          	movzbl %dil,%edi
  140a3d:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  140a3f:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  140a44:	eb ca                	jmp    140a10 <printer::vprintf(char const*, __va_list_tag*)+0x742>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  140a46:	44 89 f0             	mov    %r14d,%eax
  140a49:	f7 d0                	not    %eax
  140a4b:	a8 c0                	test   $0xc0,%al
  140a4d:	75 3b                	jne    140a8a <printer::vprintf(char const*, __va_list_tag*)+0x7bc>
                prefix = "-";
  140a4f:	41 bc b1 0d 14 00    	mov    $0x140db1,%r12d
            if (flags & FLAG_NEGATIVE) {
  140a55:	41 f7 c6 00 01 00 00 	test   $0x100,%r14d
  140a5c:	0f 85 0b fd ff ff    	jne    14076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                prefix = "+";
  140a62:	41 bc ac 0d 14 00    	mov    $0x140dac,%r12d
            } else if (flags & FLAG_PLUSPOSITIVE) {
  140a68:	41 f6 c6 10          	test   $0x10,%r14b
  140a6c:	0f 85 fb fc ff ff    	jne    14076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
        const char* prefix = "";
  140a72:	41 f6 c6 08          	test   $0x8,%r14b
  140a76:	41 bc b3 0d 14 00    	mov    $0x140db3,%r12d
  140a7c:	b8 b4 0d 14 00       	mov    $0x140db4,%eax
  140a81:	4c 0f 44 e0          	cmove  %rax,%r12
  140a85:	e9 e3 fc ff ff       	jmp    14076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
  140a8a:	41 bc b4 0d 14 00    	mov    $0x140db4,%r12d
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  140a90:	44 89 f0             	mov    %r14d,%eax
  140a93:	f7 d0                	not    %eax
  140a95:	a8 41                	test   $0x41,%al
  140a97:	0f 85 d0 fc ff ff    	jne    14076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                   && (base == 16 || base == -16)
  140a9d:	8b 45 a0             	mov    -0x60(%rbp),%eax
  140aa0:	83 c0 10             	add    $0x10,%eax
  140aa3:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  140aa8:	0f 85 bf fc ff ff    	jne    14076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                   && (num || (flags & FLAG_ALT2))) {
  140aae:	4d 85 db             	test   %r11,%r11
  140ab1:	75 0d                	jne    140ac0 <printer::vprintf(char const*, __va_list_tag*)+0x7f2>
  140ab3:	41 f7 c6 00 02 00 00 	test   $0x200,%r14d
  140aba:	0f 84 ad fc ff ff    	je     14076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
            prefix = (base == -16 ? "0x" : "0X");
  140ac0:	83 7d a0 f0          	cmpl   $0xfffffff0,-0x60(%rbp)
  140ac4:	41 bc ae 0d 14 00    	mov    $0x140dae,%r12d
  140aca:	b8 b5 0d 14 00       	mov    $0x140db5,%eax
  140acf:	4c 0f 44 e0          	cmove  %rax,%r12
  140ad3:	e9 95 fc ff ff       	jmp    14076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
            datalen = strlen(data);
  140ad8:	48 89 df             	mov    %rbx,%rdi
  140adb:	e8 86 f6 ff ff       	call   140166 <strlen>
  140ae0:	89 45 a0             	mov    %eax,-0x60(%rbp)
            && precision >= 0) {
  140ae3:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
  140ae7:	0f 84 ad fc ff ff    	je     14079a <printer::vprintf(char const*, __va_list_tag*)+0x4cc>
  140aed:	80 7d 90 00          	cmpb   $0x0,-0x70(%rbp)
  140af1:	0f 84 a3 fc ff ff    	je     14079a <printer::vprintf(char const*, __va_list_tag*)+0x4cc>
            zeros = precision > datalen ? precision - datalen : 0;
  140af7:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  140afa:	89 fa                	mov    %edi,%edx
  140afc:	29 c2                	sub    %eax,%edx
  140afe:	39 c7                	cmp    %eax,%edi
  140b00:	b8 00 00 00 00       	mov    $0x0,%eax
  140b05:	0f 4f c2             	cmovg  %edx,%eax
  140b08:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  140b0b:	e9 a0 fc ff ff       	jmp    1407b0 <printer::vprintf(char const*, __va_list_tag*)+0x4e2>
                   && datalen + (int) strlen(prefix) < width) {
  140b10:	4c 89 e7             	mov    %r12,%rdi
  140b13:	e8 4e f6 ff ff       	call   140166 <strlen>
  140b18:	8b 7d a0             	mov    -0x60(%rbp),%edi
  140b1b:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  140b1e:	44 89 e9             	mov    %r13d,%ecx
  140b21:	29 f9                	sub    %edi,%ecx
  140b23:	29 c1                	sub    %eax,%ecx
  140b25:	44 39 ea             	cmp    %r13d,%edx
  140b28:	b8 00 00 00 00       	mov    $0x0,%eax
  140b2d:	0f 4c c1             	cmovl  %ecx,%eax
  140b30:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  140b33:	e9 78 fc ff ff       	jmp    1407b0 <printer::vprintf(char const*, __va_list_tag*)+0x4e2>
  140b38:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
            numbuf[0] = (*format ? *format : '%');
  140b3c:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  140b3f:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
  140b43:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = numbuf;
  140b47:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  140b4b:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  140b51:	e9 02 fc ff ff       	jmp    140758 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
    *--pos = '\0';
  140b56:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  140b5a:	41 f6 c6 20          	test   $0x20,%r14b
  140b5e:	0f 85 63 fe ff ff    	jne    1409c7 <printer::vprintf(char const*, __va_list_tag*)+0x6f9>
  140b64:	41 ba d0 24 14 00    	mov    $0x1424d0,%r10d
  140b6a:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  140b70:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
        thousands_pos = nullptr;
  140b77:	bf 00 00 00 00       	mov    $0x0,%edi
  140b7c:	e9 36 fe ff ff       	jmp    1409b7 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>

0000000000140b81 <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  140b81:	f3 0f 1e fa          	endbr64
  140b85:	55                   	push   %rbp
  140b86:	48 89 e5             	mov    %rsp,%rbp
  140b89:	53                   	push   %rbx
  140b8a:	48 83 ec 38          	sub    $0x38,%rsp
  140b8e:	48 89 f3             	mov    %rsi,%rbx
  140b91:	48 89 d6             	mov    %rdx,%rsi
  140b94:	48 89 ca             	mov    %rcx,%rdx
void console_printf(const char* format, ...);


// Generic print library

struct printer {
  140b97:	c7 45 d0 00 07 00 00 	movl   $0x700,-0x30(%rbp)
        : s_(s), end_(s + size), n_(0) {
  140b9e:	48 c7 45 c8 f8 24 14 	movq   $0x1424f8,-0x38(%rbp)
  140ba5:	00 
  140ba6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  140baa:	48 01 df             	add    %rbx,%rdi
  140bad:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  140bb1:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  140bb8:	00 
    string_printer sp(s, size);
    sp.vprintf(format, val);
  140bb9:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  140bbd:	e8 0c f7 ff ff       	call   1402ce <printer::vprintf(char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  140bc2:	48 85 db             	test   %rbx,%rbx
  140bc5:	74 10                	je     140bd7 <vsnprintf+0x56>
  140bc7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  140bcb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  140bcf:	48 39 c2             	cmp    %rax,%rdx
  140bd2:	73 0d                	jae    140be1 <vsnprintf+0x60>
        *sp.s_ = 0;
  140bd4:	c6 02 00             	movb   $0x0,(%rdx)
    } else if (size) {
        sp.end_[-1] = 0;
    }
    return sp.n_;
}
  140bd7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  140bdb:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  140bdf:	c9                   	leave
  140be0:	c3                   	ret
        sp.end_[-1] = 0;
  140be1:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
  140be5:	eb f0                	jmp    140bd7 <vsnprintf+0x56>

0000000000140be7 <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  140be7:	f3 0f 1e fa          	endbr64
  140beb:	55                   	push   %rbp
  140bec:	48 89 e5             	mov    %rsp,%rbp
  140bef:	48 83 ec 50          	sub    $0x50,%rsp
  140bf3:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  140bf7:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  140bfb:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  140bff:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  140c06:	48 8d 45 10          	lea    0x10(%rbp),%rax
  140c0a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  140c0e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  140c12:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  140c16:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  140c1a:	e8 62 ff ff ff       	call   140b81 <vsnprintf>
    va_end(val);
    return n;
  140c1f:	48 98                	cltq
}
  140c21:	c9                   	leave
  140c22:	c3                   	ret

0000000000140c23 <assert_fail(char const*, int, char const*, char const*)>:
void error_vprintf(int cpos, int color, const char* format, va_list val) {
    console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  140c23:	f3 0f 1e fa          	endbr64
  140c27:	55                   	push   %rbp
  140c28:	48 89 e5             	mov    %rsp,%rbp
  140c2b:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  140c32:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  140c35:	c7 05 bd 83 f7 ff 30 	movl   $0x730,-0x87c43(%rip)        # b8ffc <cursorpos>
  140c3c:	07 00 00 
    char buf[240];
    if (description) {
  140c3f:	48 85 c9             	test   %rcx,%rcx
  140c42:	74 39                	je     140c7d <assert_fail(char const*, int, char const*, char const*)+0x5a>
  140c44:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  140c47:	48 83 ec 08          	sub    $0x8,%rsp
  140c4b:	52                   	push   %rdx
  140c4c:	56                   	push   %rsi
  140c4d:	57                   	push   %rdi
  140c4e:	48 89 f9             	mov    %rdi,%rcx
  140c51:	ba 30 0d 14 00       	mov    $0x140d30,%edx
  140c56:	be f0 00 00 00       	mov    $0xf0,%esi
  140c5b:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  140c62:	b0 00                	mov    $0x0,%al
  140c64:	e8 7e ff ff ff       	call   140be7 <snprintf>
  140c69:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  140c6d:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  140c72:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  140c79:	0f 05                	syscall
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  140c7b:	eb fe                	jmp    140c7b <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  140c7d:	49 89 d1             	mov    %rdx,%r9
  140c80:	48 89 f9             	mov    %rdi,%rcx
  140c83:	ba 60 0d 14 00       	mov    $0x140d60,%edx
  140c88:	be f0 00 00 00       	mov    $0xf0,%esi
  140c8d:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  140c94:	b0 00                	mov    $0x0,%al
  140c96:	e8 4c ff ff ff       	call   140be7 <snprintf>
  140c9b:	eb d0                	jmp    140c6d <assert_fail(char const*, int, char const*, char const*)+0x4a>

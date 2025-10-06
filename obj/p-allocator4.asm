
obj/p-allocator4.full:     file format elf64-x86-64


Disassembly of section .text:

00000000001c0000 <process_main()>:
    unsigned char buf[4096];
    int field2;
};
const test_struct test = {61, {0}, 6161};

void process_main() {
  1c0000:	f3 0f 1e fa          	endbr64
  1c0004:	55                   	push   %rbp
  1c0005:	48 89 e5             	mov    %rsp,%rbp
  1c0008:	41 54                	push   %r12
  1c000a:	53                   	push   %rbx
    assert(test.field1 == 61);
    assert(memchr(&test, 0x11, sizeof(test)) == &test.field2);
  1c000b:	ba 08 10 00 00       	mov    $0x1008,%edx
  1c0010:	be 11 00 00 00       	mov    $0x11,%esi
  1c0015:	bf e0 0d 1c 00       	mov    $0x1c0de0,%edi
  1c001a:	e8 1e 01 00 00       	call   1c013d <memchr>
  1c001f:	48 3d e4 1d 1c 00    	cmp    $0x1c1de4,%rax
  1c0025:	75 48                	jne    1c006f <process_main()+0x6f>
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  1c0027:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  1c002c:	0f 05                	syscall
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
    return rax;
  1c002e:	49 89 c4             	mov    %rax,%r12


// sys_getpid
//    Return current process ID. (Never fails.)
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  1c0031:	89 c3                	mov    %eax,%ebx

    pid_t p = sys_getpid();
    srand(p);
  1c0033:	89 c7                	mov    %eax,%edi
  1c0035:	e8 9d 01 00 00       	call   1c01d7 <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  1c003a:	ba 1b 40 1c 00       	mov    $0x1c401b,%edx

    // The heap starts on the page right after the 'end' symbol,
    // whose address is the first address not allocated to process code
    // or data.
    heap_top = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  1c003f:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
  1c0046:	48 89 15 bb 2f 00 00 	mov    %rdx,0x2fbb(%rip)        # 1c3008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  1c004d:	48 89 e0             	mov    %rsp,%rax

    // The bottom of the stack is the first address on the current
    // stack page (this process never needs more than one stack page).
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  1c0050:	48 83 e8 01          	sub    $0x1,%rax
  1c0054:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  1c005a:	48 89 05 9f 2f 00 00 	mov    %rax,0x2f9f(%rip)        # 1c3000 <stack_bottom>

    // Allocate heap pages until (1) hit the stack (out of address space)
    // or (2) allocation fails (out of physical memory).
    while (heap_top != stack_bottom) {
  1c0061:	48 39 c2             	cmp    %rax,%rdx
  1c0064:	75 68                	jne    1c00ce <process_main()+0xce>
    register uintptr_t rax asm("rax") = syscallno;
  1c0066:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  1c006b:	0f 05                	syscall
        }
        sys_yield();
    }

    // After running out of memory, do nothing forever
    while (true) {
  1c006d:	eb f7                	jmp    1c0066 <process_main()+0x66>
    assert(memchr(&test, 0x11, sizeof(test)) == &test.field2);
  1c006f:	b9 00 00 00 00       	mov    $0x0,%ecx
  1c0074:	ba a0 0c 1c 00       	mov    $0x1c0ca0,%edx
  1c0079:	be 16 00 00 00       	mov    $0x16,%esi
  1c007e:	bf 83 0d 1c 00       	mov    $0x1c0d83,%edi
  1c0083:	e8 9b 0b 00 00       	call   1c0c23 <assert_fail(char const*, int, char const*, char const*)>
                assert(*l == 0);
  1c0088:	b9 00 00 00 00       	mov    $0x0,%ecx
  1c008d:	ba 92 0d 1c 00       	mov    $0x1c0d92,%edx
  1c0092:	be 2f 00 00 00       	mov    $0x2f,%esi
  1c0097:	bf 83 0d 1c 00       	mov    $0x1c0d83,%edi
  1c009c:	e8 82 0b 00 00       	call   1c0c23 <assert_fail(char const*, int, char const*, char const*)>
            *heap_top = p;
  1c00a1:	44 88 21             	mov    %r12b,(%rcx)
            console[CPOS(24, 79)] = p;
  1c00a4:	66 44 89 25 f2 8e ef 	mov    %r12w,-0x10710e(%rip)        # b8f9e <console+0xf9e>
  1c00ab:	ff 
            heap_top += PAGESIZE;
  1c00ac:	48 81 05 51 2f 00 00 	addq   $0x1000,0x2f51(%rip)        # 1c3008 <heap_top>
  1c00b3:	00 10 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  1c00b7:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  1c00bc:	0f 05                	syscall
    while (heap_top != stack_bottom) {
  1c00be:	48 8b 05 3b 2f 00 00 	mov    0x2f3b(%rip),%rax        # 1c3000 <stack_bottom>
  1c00c5:	48 39 05 3c 2f 00 00 	cmp    %rax,0x2f3c(%rip)        # 1c3008 <heap_top>
  1c00cc:	74 98                	je     1c0066 <process_main()+0x66>
        if (rand(0, ALLOC_SLOWDOWN - 1) < p) {
  1c00ce:	be 63 00 00 00       	mov    $0x63,%esi
  1c00d3:	bf 00 00 00 00       	mov    $0x0,%edi
  1c00d8:	e8 68 01 00 00       	call   1c0245 <rand(int, int)>
  1c00dd:	39 d8                	cmp    %ebx,%eax
  1c00df:	7d d6                	jge    1c00b7 <process_main()+0xb7>
    register uintptr_t rax asm("rax") = syscallno;
  1c00e1:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  1c00e6:	48 8b 3d 1b 2f 00 00 	mov    0x2f1b(%rip),%rdi        # 1c3008 <heap_top>
  1c00ed:	0f 05                	syscall
            if (sys_page_alloc((uint8_t*) heap_top) < 0) {
  1c00ef:	85 c0                	test   %eax,%eax
  1c00f1:	0f 88 6f ff ff ff    	js     1c0066 <process_main()+0x66>
            for (unsigned long* l = (unsigned long*) heap_top;
  1c00f7:	48 8b 0d 0a 2f 00 00 	mov    0x2f0a(%rip),%rcx        # 1c3008 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1c00fe:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  1c0105:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  1c0108:	48 83 38 00          	cmpq   $0x0,(%rax)
  1c010c:	0f 85 76 ff ff ff    	jne    1c0088 <process_main()+0x88>
            for (unsigned long* l = (unsigned long*) heap_top;
  1c0112:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1c0116:	48 39 d0             	cmp    %rdx,%rax
  1c0119:	75 ed                	jne    1c0108 <process_main()+0x108>
  1c011b:	eb 84                	jmp    1c00a1 <process_main()+0xa1>
  1c011d:	90                   	nop

00000000001c011e <string_printer::putc(unsigned char)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c) override {
  1c011e:	f3 0f 1e fa          	endbr64
        if (s_ < end_) {
  1c0122:	48 8b 47 10          	mov    0x10(%rdi),%rax
  1c0126:	48 3b 47 18          	cmp    0x18(%rdi),%rax
  1c012a:	73 0b                	jae    1c0137 <string_printer::putc(unsigned char)+0x19>
            *s_++ = c;
  1c012c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  1c0130:	48 89 57 10          	mov    %rdx,0x10(%rdi)
  1c0134:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  1c0137:	48 83 47 20 01       	addq   $0x1,0x20(%rdi)
    }
  1c013c:	c3                   	ret

00000000001c013d <memchr>:
void* memchr(const void* s, int c, size_t n) {
  1c013d:	f3 0f 1e fa          	endbr64
  1c0141:	48 89 f8             	mov    %rdi,%rax
    for (ss = (const unsigned char*) s; n != 0; ++ss, --n) {
  1c0144:	48 85 d2             	test   %rdx,%rdx
  1c0147:	74 17                	je     1c0160 <memchr+0x23>
  1c0149:	48 01 fa             	add    %rdi,%rdx
        if (*ss == (unsigned char) c) {
  1c014c:	40 38 30             	cmp    %sil,(%rax)
  1c014f:	74 14                	je     1c0165 <memchr+0x28>
    for (ss = (const unsigned char*) s; n != 0; ++ss, --n) {
  1c0151:	48 83 c0 01          	add    $0x1,%rax
  1c0155:	48 39 c2             	cmp    %rax,%rdx
  1c0158:	75 f2                	jne    1c014c <memchr+0xf>
    return nullptr;
  1c015a:	b8 00 00 00 00       	mov    $0x0,%eax
  1c015f:	c3                   	ret
  1c0160:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1c0165:	c3                   	ret

00000000001c0166 <strlen>:
size_t strlen(const char* s) {
  1c0166:	f3 0f 1e fa          	endbr64
    for (n = 0; *s != '\0'; ++s) {
  1c016a:	80 3f 00             	cmpb   $0x0,(%rdi)
  1c016d:	74 10                	je     1c017f <strlen+0x19>
  1c016f:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  1c0174:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  1c0178:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  1c017c:	75 f6                	jne    1c0174 <strlen+0xe>
  1c017e:	c3                   	ret
  1c017f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1c0184:	c3                   	ret

00000000001c0185 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  1c0185:	f3 0f 1e fa          	endbr64
  1c0189:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1c018c:	ba 00 00 00 00       	mov    $0x0,%edx
  1c0191:	48 85 f6             	test   %rsi,%rsi
  1c0194:	74 10                	je     1c01a6 <strnlen+0x21>
  1c0196:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  1c019a:	74 0b                	je     1c01a7 <strnlen+0x22>
        ++n;
  1c019c:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1c01a0:	48 39 d0             	cmp    %rdx,%rax
  1c01a3:	75 f1                	jne    1c0196 <strnlen+0x11>
  1c01a5:	c3                   	ret
  1c01a6:	c3                   	ret
  1c01a7:	48 89 d0             	mov    %rdx,%rax
}
  1c01aa:	c3                   	ret

00000000001c01ab <strchr>:
char* strchr(const char* s, int c) {
  1c01ab:	f3 0f 1e fa          	endbr64
    while (*s != '\0' && *s != (char) c) {
  1c01af:	0f b6 07             	movzbl (%rdi),%eax
  1c01b2:	84 c0                	test   %al,%al
  1c01b4:	74 10                	je     1c01c6 <strchr+0x1b>
  1c01b6:	40 38 f0             	cmp    %sil,%al
  1c01b9:	74 18                	je     1c01d3 <strchr+0x28>
        ++s;
  1c01bb:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  1c01bf:	0f b6 07             	movzbl (%rdi),%eax
  1c01c2:	84 c0                	test   %al,%al
  1c01c4:	75 f0                	jne    1c01b6 <strchr+0xb>
        return (char*) s;
  1c01c6:	40 84 f6             	test   %sil,%sil
  1c01c9:	b8 00 00 00 00       	mov    $0x0,%eax
  1c01ce:	48 0f 44 c7          	cmove  %rdi,%rax
}
  1c01d2:	c3                   	ret
        return (char*) s;
  1c01d3:	48 89 f8             	mov    %rdi,%rax
  1c01d6:	c3                   	ret

00000000001c01d7 <srand(unsigned int)>:
void srand(unsigned seed) {
  1c01d7:	f3 0f 1e fa          	endbr64
    rand_seed = ((unsigned long) seed << 32) | seed;
  1c01db:	89 f8                	mov    %edi,%eax
  1c01dd:	48 c1 e7 20          	shl    $0x20,%rdi
  1c01e1:	48 01 c7             	add    %rax,%rdi
	  = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_acquire);
	__glibcxx_assert(__b != memory_order_acq_rel);
	__glibcxx_assert(__b != memory_order_consume);

	__atomic_store_n(&_M_i, __i, int(__m));
  1c01e4:	48 87 3d 25 2e 00 00 	xchg   %rdi,0x2e25(%rip)        # 1c3010 <rand_seed>
  1c01eb:	b8 01 00 00 00       	mov    $0x1,%eax
  1c01f0:	87 05 22 2e 00 00    	xchg   %eax,0x2e22(%rip)        # 1c3018 <rand_seed_set>
}
  1c01f6:	c3                   	ret

00000000001c01f7 <rand()>:
int rand() {
  1c01f7:	f3 0f 1e fa          	endbr64
  1c01fb:	55                   	push   %rbp
  1c01fc:	48 89 e5             	mov    %rsp,%rbp
	memory_order __b __attribute__ ((__unused__))
	  = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_release);
	__glibcxx_assert(__b != memory_order_acq_rel);

	return __atomic_load_n(&_M_i, int(__m));
  1c01ff:	8b 05 13 2e 00 00    	mov    0x2e13(%rip),%eax        # 1c3018 <rand_seed_set>
    if (!rand_seed_set) {
  1c0205:	85 c0                	test   %eax,%eax
  1c0207:	74 30                	je     1c0239 <rand()+0x42>
  1c0209:	48 8b 05 00 2e 00 00 	mov    0x2e00(%rip),%rax        # 1c3010 <rand_seed>
        next_rs = rs * 6364136223846793005UL + 1;
  1c0210:	48 b9 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rcx
  1c0217:	f4 51 58 
  1c021a:	48 89 c2             	mov    %rax,%rdx
  1c021d:	48 0f af d1          	imul   %rcx,%rdx
  1c0221:	48 83 c2 01          	add    $0x1,%rdx
      compare_exchange_weak(__int_type& __i1, __int_type __i2,
			    memory_order __m1, memory_order __m2) noexcept
      {
	__glibcxx_assert(__is_valid_cmpexch_failure_order(__m2));

	return __atomic_compare_exchange_n(&_M_i, &__i1, __i2, 1,
  1c0225:	f0 48 0f b1 15 e2 2d 	lock cmpxchg %rdx,0x2de2(%rip)        # 1c3010 <rand_seed>
  1c022c:	00 00 
    } while (!rand_seed.compare_exchange_weak(rs, next_rs));
  1c022e:	75 ea                	jne    1c021a <rand()+0x23>
    return (next_rs >> 33) & RAND_MAX;
  1c0230:	48 c1 ea 21          	shr    $0x21,%rdx
  1c0234:	48 89 d0             	mov    %rdx,%rax
}
  1c0237:	5d                   	pop    %rbp
  1c0238:	c3                   	ret
        srand(819234718U);
  1c0239:	bf 9e 87 d4 30       	mov    $0x30d4879e,%edi
  1c023e:	e8 94 ff ff ff       	call   1c01d7 <srand(unsigned int)>
  1c0243:	eb c4                	jmp    1c0209 <rand()+0x12>

00000000001c0245 <rand(int, int)>:
int rand(int min, int max) {
  1c0245:	f3 0f 1e fa          	endbr64
  1c0249:	55                   	push   %rbp
  1c024a:	48 89 e5             	mov    %rsp,%rbp
  1c024d:	41 55                	push   %r13
  1c024f:	41 54                	push   %r12
  1c0251:	53                   	push   %rbx
  1c0252:	48 83 ec 08          	sub    $0x8,%rsp
    assert(min <= max);
  1c0256:	39 f7                	cmp    %esi,%edi
  1c0258:	7f 42                	jg     1c029c <rand(int, int)+0x57>
  1c025a:	41 89 fc             	mov    %edi,%r12d
  1c025d:	89 f3                	mov    %esi,%ebx
    unsigned div = (unsigned(RAND_MAX) + 1) / (max - min + 1),
  1c025f:	29 fb                	sub    %edi,%ebx
  1c0261:	83 c3 01             	add    $0x1,%ebx
  1c0264:	b8 00 00 00 80       	mov    $0x80000000,%eax
  1c0269:	ba 00 00 00 00       	mov    $0x0,%edx
  1c026e:	f7 f3                	div    %ebx
  1c0270:	41 89 c5             	mov    %eax,%r13d
        top = div * (max - min + 1);
  1c0273:	0f af d8             	imul   %eax,%ebx
    assert(top > 0 && top <= unsigned(RAND_MAX) + 1);
  1c0276:	89 d8                	mov    %ebx,%eax
  1c0278:	83 e8 01             	sub    $0x1,%eax
  1c027b:	78 38                	js     1c02b5 <rand(int, int)+0x70>
        unsigned r = rand();
  1c027d:	e8 75 ff ff ff       	call   1c01f7 <rand()>
        if (r < top) {
  1c0282:	39 d8                	cmp    %ebx,%eax
  1c0284:	73 f7                	jae    1c027d <rand(int, int)+0x38>
            return min + r / div;
  1c0286:	ba 00 00 00 00       	mov    $0x0,%edx
  1c028b:	41 f7 f5             	div    %r13d
  1c028e:	44 01 e0             	add    %r12d,%eax
}
  1c0291:	48 83 c4 08          	add    $0x8,%rsp
  1c0295:	5b                   	pop    %rbx
  1c0296:	41 5c                	pop    %r12
  1c0298:	41 5d                	pop    %r13
  1c029a:	5d                   	pop    %rbp
  1c029b:	c3                   	ret
    assert(min <= max);
  1c029c:	b9 00 00 00 00       	mov    $0x0,%ecx
  1c02a1:	ba 9a 0d 1c 00       	mov    $0x1c0d9a,%edx
  1c02a6:	be 49 01 00 00       	mov    $0x149,%esi
  1c02ab:	bf a5 0d 1c 00       	mov    $0x1c0da5,%edi
  1c02b0:	e8 6e 09 00 00       	call   1c0c23 <assert_fail(char const*, int, char const*, char const*)>
    assert(top > 0 && top <= unsigned(RAND_MAX) + 1);
  1c02b5:	b9 00 00 00 00       	mov    $0x0,%ecx
  1c02ba:	ba d8 0c 1c 00       	mov    $0x1c0cd8,%edx
  1c02bf:	be 4e 01 00 00       	mov    $0x14e,%esi
  1c02c4:	bf a5 0d 1c 00       	mov    $0x1c0da5,%edi
  1c02c9:	e8 55 09 00 00       	call   1c0c23 <assert_fail(char const*, int, char const*, char const*)>

00000000001c02ce <printer::vprintf(char const*, __va_list_tag*)>:
void printer::vprintf(const char* format, va_list val) {
  1c02ce:	f3 0f 1e fa          	endbr64
  1c02d2:	55                   	push   %rbp
  1c02d3:	48 89 e5             	mov    %rsp,%rbp
  1c02d6:	41 57                	push   %r15
  1c02d8:	41 56                	push   %r14
  1c02da:	41 55                	push   %r13
  1c02dc:	41 54                	push   %r12
  1c02de:	53                   	push   %rbx
  1c02df:	48 83 ec 48          	sub    $0x48,%rsp
  1c02e3:	49 89 ff             	mov    %rdi,%r15
  1c02e6:	49 89 f4             	mov    %rsi,%r12
  1c02e9:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
    for (; *format; ++format) {
  1c02ed:	0f b6 06             	movzbl (%rsi),%eax
  1c02f0:	84 c0                	test   %al,%al
  1c02f2:	0f 85 94 05 00 00    	jne    1c088c <printer::vprintf(char const*, __va_list_tag*)+0x5be>
}
  1c02f8:	48 83 c4 48          	add    $0x48,%rsp
  1c02fc:	5b                   	pop    %rbx
  1c02fd:	41 5c                	pop    %r12
  1c02ff:	41 5d                	pop    %r13
  1c0301:	41 5e                	pop    %r14
  1c0303:	41 5f                	pop    %r15
  1c0305:	5d                   	pop    %rbp
  1c0306:	c3                   	ret
        for (++format; *format; ++format) {
  1c0307:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  1c030c:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
  1c0312:	45 84 e4             	test   %r12b,%r12b
  1c0315:	0f 84 01 01 00 00    	je     1c041c <printer::vprintf(char const*, __va_list_tag*)+0x14e>
        int flags = 0;
  1c031b:	41 be 00 00 00 00    	mov    $0x0,%r14d
            const char* flagc = strchr(flag_chars, *format);
  1c0321:	41 0f be f4          	movsbl %r12b,%esi
  1c0325:	bf e1 24 1c 00       	mov    $0x1c24e1,%edi
  1c032a:	e8 7c fe ff ff       	call   1c01ab <strchr>
  1c032f:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  1c0332:	48 85 c0             	test   %rax,%rax
  1c0335:	74 70                	je     1c03a7 <printer::vprintf(char const*, __va_list_tag*)+0xd9>
                flags |= 1 << (flagc - flag_chars);
  1c0337:	48 81 e9 e1 24 1c 00 	sub    $0x1c24e1,%rcx
  1c033e:	b8 01 00 00 00       	mov    $0x1,%eax
  1c0343:	d3 e0                	shl    %cl,%eax
  1c0345:	41 09 c6             	or     %eax,%r14d
        for (++format; *format; ++format) {
  1c0348:	48 83 c3 01          	add    $0x1,%rbx
  1c034c:	44 0f b6 23          	movzbl (%rbx),%r12d
  1c0350:	45 84 e4             	test   %r12b,%r12b
  1c0353:	75 cc                	jne    1c0321 <printer::vprintf(char const*, __va_list_tag*)+0x53>
        int width = -1;
  1c0355:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
  1c035b:	c7 45 a4 ff ff ff ff 	movl   $0xffffffff,-0x5c(%rbp)
        if (*format == '.') {
  1c0362:	80 3b 2e             	cmpb   $0x2e,(%rbx)
  1c0365:	0f 84 d8 00 00 00    	je     1c0443 <printer::vprintf(char const*, __va_list_tag*)+0x175>
        switch (*format) {
  1c036b:	0f b6 03             	movzbl (%rbx),%eax
  1c036e:	3c 6c                	cmp    $0x6c,%al
  1c0370:	0f 84 73 01 00 00    	je     1c04e9 <printer::vprintf(char const*, __va_list_tag*)+0x21b>
  1c0376:	0f 8f 4e 01 00 00    	jg     1c04ca <printer::vprintf(char const*, __va_list_tag*)+0x1fc>
  1c037c:	3c 68                	cmp    $0x68,%al
  1c037e:	0f 85 88 01 00 00    	jne    1c050c <printer::vprintf(char const*, __va_list_tag*)+0x23e>
            ++format;
  1c0384:	48 8d 43 01          	lea    0x1(%rbx),%rax
  1c0388:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  1c038c:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1c0390:	8d 50 bd             	lea    -0x43(%rax),%edx
  1c0393:	80 fa 35             	cmp    $0x35,%dl
  1c0396:	0f 87 a6 05 00 00    	ja     1c0942 <printer::vprintf(char const*, __va_list_tag*)+0x674>
  1c039c:	0f b6 d2             	movzbl %dl,%edx
  1c039f:	3e ff 24 d5 f0 1d 1c 	notrack jmp *0x1c1df0(,%rdx,8)
  1c03a6:	00 
        if (*format >= '1' && *format <= '9') {
  1c03a7:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
  1c03ac:	3c 08                	cmp    $0x8,%al
  1c03ae:	77 32                	ja     1c03e2 <printer::vprintf(char const*, __va_list_tag*)+0x114>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1c03b0:	0f b6 03             	movzbl (%rbx),%eax
  1c03b3:	8d 50 d0             	lea    -0x30(%rax),%edx
  1c03b6:	80 fa 09             	cmp    $0x9,%dl
  1c03b9:	77 72                	ja     1c042d <printer::vprintf(char const*, __va_list_tag*)+0x15f>
  1c03bb:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
  1c03c1:	48 83 c3 01          	add    $0x1,%rbx
  1c03c5:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
  1c03ca:	0f be c0             	movsbl %al,%eax
  1c03cd:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1c03d2:	0f b6 03             	movzbl (%rbx),%eax
  1c03d5:	8d 50 d0             	lea    -0x30(%rax),%edx
  1c03d8:	80 fa 09             	cmp    $0x9,%dl
  1c03db:	76 e4                	jbe    1c03c1 <printer::vprintf(char const*, __va_list_tag*)+0xf3>
  1c03dd:	e9 79 ff ff ff       	jmp    1c035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
        } else if (*format == '*') {
  1c03e2:	41 80 fc 2a          	cmp    $0x2a,%r12b
  1c03e6:	75 50                	jne    1c0438 <printer::vprintf(char const*, __va_list_tag*)+0x16a>
            width = va_arg(val, int);
  1c03e8:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1c03ec:	8b 01                	mov    (%rcx),%eax
  1c03ee:	83 f8 2f             	cmp    $0x2f,%eax
  1c03f1:	77 17                	ja     1c040a <printer::vprintf(char const*, __va_list_tag*)+0x13c>
  1c03f3:	89 c2                	mov    %eax,%edx
  1c03f5:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c03f9:	83 c0 08             	add    $0x8,%eax
  1c03fc:	89 01                	mov    %eax,(%rcx)
  1c03fe:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
  1c0401:	48 83 c3 01          	add    $0x1,%rbx
  1c0405:	e9 51 ff ff ff       	jmp    1c035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            width = va_arg(val, int);
  1c040a:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1c040e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1c0412:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c0416:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1c041a:	eb e2                	jmp    1c03fe <printer::vprintf(char const*, __va_list_tag*)+0x130>
        int flags = 0;
  1c041c:	41 be 00 00 00 00    	mov    $0x0,%r14d
        int width = -1;
  1c0422:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  1c0428:	e9 2e ff ff ff       	jmp    1c035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1c042d:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  1c0433:	e9 23 ff ff ff       	jmp    1c035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
        int width = -1;
  1c0438:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  1c043e:	e9 18 ff ff ff       	jmp    1c035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            ++format;
  1c0443:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
  1c0447:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1c044b:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1c044e:	80 f9 09             	cmp    $0x9,%cl
  1c0451:	76 13                	jbe    1c0466 <printer::vprintf(char const*, __va_list_tag*)+0x198>
            } else if (*format == '*') {
  1c0453:	3c 2a                	cmp    $0x2a,%al
  1c0455:	74 33                	je     1c048a <printer::vprintf(char const*, __va_list_tag*)+0x1bc>
            ++format;
  1c0457:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
  1c045a:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
  1c0461:	e9 05 ff ff ff       	jmp    1c036b <printer::vprintf(char const*, __va_list_tag*)+0x9d>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1c0466:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  1c046b:	48 83 c2 01          	add    $0x1,%rdx
  1c046f:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  1c0472:	0f be c0             	movsbl %al,%eax
  1c0475:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1c0479:	0f b6 02             	movzbl (%rdx),%eax
  1c047c:	8d 70 d0             	lea    -0x30(%rax),%esi
  1c047f:	40 80 fe 09          	cmp    $0x9,%sil
  1c0483:	76 e6                	jbe    1c046b <printer::vprintf(char const*, __va_list_tag*)+0x19d>
  1c0485:	48 89 d3             	mov    %rdx,%rbx
  1c0488:	eb 1c                	jmp    1c04a6 <printer::vprintf(char const*, __va_list_tag*)+0x1d8>
                precision = va_arg(val, int);
  1c048a:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1c048e:	8b 07                	mov    (%rdi),%eax
  1c0490:	83 f8 2f             	cmp    $0x2f,%eax
  1c0493:	77 23                	ja     1c04b8 <printer::vprintf(char const*, __va_list_tag*)+0x1ea>
  1c0495:	89 c2                	mov    %eax,%edx
  1c0497:	48 03 57 10          	add    0x10(%rdi),%rdx
  1c049b:	83 c0 08             	add    $0x8,%eax
  1c049e:	89 07                	mov    %eax,(%rdi)
  1c04a0:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  1c04a2:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
  1c04a6:	85 c9                	test   %ecx,%ecx
  1c04a8:	b8 00 00 00 00       	mov    $0x0,%eax
  1c04ad:	0f 49 c1             	cmovns %ecx,%eax
  1c04b0:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1c04b3:	e9 b3 fe ff ff       	jmp    1c036b <printer::vprintf(char const*, __va_list_tag*)+0x9d>
                precision = va_arg(val, int);
  1c04b8:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1c04bc:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c04c0:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c04c4:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c04c8:	eb d6                	jmp    1c04a0 <printer::vprintf(char const*, __va_list_tag*)+0x1d2>
        switch (*format) {
  1c04ca:	3c 74                	cmp    $0x74,%al
  1c04cc:	74 1b                	je     1c04e9 <printer::vprintf(char const*, __va_list_tag*)+0x21b>
  1c04ce:	3c 7a                	cmp    $0x7a,%al
  1c04d0:	74 17                	je     1c04e9 <printer::vprintf(char const*, __va_list_tag*)+0x21b>
        switch (*format) {
  1c04d2:	8d 50 bd             	lea    -0x43(%rax),%edx
  1c04d5:	80 fa 35             	cmp    $0x35,%dl
  1c04d8:	0f 87 5e 06 00 00    	ja     1c0b3c <printer::vprintf(char const*, __va_list_tag*)+0x86e>
  1c04de:	0f b6 d2             	movzbl %dl,%edx
  1c04e1:	3e ff 24 d5 a0 1f 1c 	notrack jmp *0x1c1fa0(,%rdx,8)
  1c04e8:	00 
            ++format;
  1c04e9:	48 8d 43 01          	lea    0x1(%rbx),%rax
  1c04ed:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  1c04f1:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1c04f5:	8d 50 bd             	lea    -0x43(%rax),%edx
  1c04f8:	80 fa 35             	cmp    $0x35,%dl
  1c04fb:	0f 87 41 04 00 00    	ja     1c0942 <printer::vprintf(char const*, __va_list_tag*)+0x674>
  1c0501:	0f b6 d2             	movzbl %dl,%edx
  1c0504:	3e ff 24 d5 50 21 1c 	notrack jmp *0x1c2150(,%rdx,8)
  1c050b:	00 
  1c050c:	8d 50 bd             	lea    -0x43(%rax),%edx
  1c050f:	80 fa 35             	cmp    $0x35,%dl
  1c0512:	0f 87 26 04 00 00    	ja     1c093e <printer::vprintf(char const*, __va_list_tag*)+0x670>
  1c0518:	0f b6 d2             	movzbl %dl,%edx
  1c051b:	3e ff 24 d5 00 23 1c 	notrack jmp *0x1c2300(,%rdx,8)
  1c0522:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1c0523:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1c0527:	8b 07                	mov    (%rdi),%eax
  1c0529:	83 f8 2f             	cmp    $0x2f,%eax
  1c052c:	77 36                	ja     1c0564 <printer::vprintf(char const*, __va_list_tag*)+0x296>
  1c052e:	89 c2                	mov    %eax,%edx
  1c0530:	48 03 57 10          	add    0x10(%rdi),%rdx
  1c0534:	83 c0 08             	add    $0x8,%eax
  1c0537:	89 07                	mov    %eax,(%rdi)
  1c0539:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  1c053c:	48 89 d0             	mov    %rdx,%rax
  1c053f:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  1c0543:	49 89 d3             	mov    %rdx,%r11
  1c0546:	49 f7 db             	neg    %r11
  1c0549:	25 00 01 00 00       	and    $0x100,%eax
  1c054e:	4c 0f 44 da          	cmove  %rdx,%r11
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  1c0552:	44 09 f0             	or     %r14d,%eax
  1c0555:	0c c0                	or     $0xc0,%al
  1c0557:	41 89 c6             	mov    %eax,%r14d
        const char* data = "";
  1c055a:	bb b4 0d 1c 00       	mov    $0x1c0db4,%ebx
            break;
  1c055f:	e9 f4 01 00 00       	jmp    1c0758 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1c0564:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1c0568:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1c056c:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c0570:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1c0574:	eb c3                	jmp    1c0539 <printer::vprintf(char const*, __va_list_tag*)+0x26b>
        switch (*format) {
  1c0576:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c057a:	eb 04                	jmp    1c0580 <printer::vprintf(char const*, __va_list_tag*)+0x2b2>
  1c057c:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1c0580:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1c0584:	8b 01                	mov    (%rcx),%eax
  1c0586:	83 f8 2f             	cmp    $0x2f,%eax
  1c0589:	77 10                	ja     1c059b <printer::vprintf(char const*, __va_list_tag*)+0x2cd>
  1c058b:	89 c2                	mov    %eax,%edx
  1c058d:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c0591:	83 c0 08             	add    $0x8,%eax
  1c0594:	89 01                	mov    %eax,(%rcx)
  1c0596:	48 63 12             	movslq (%rdx),%rdx
  1c0599:	eb a1                	jmp    1c053c <printer::vprintf(char const*, __va_list_tag*)+0x26e>
  1c059b:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1c059f:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c05a3:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c05a7:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c05ab:	eb e9                	jmp    1c0596 <printer::vprintf(char const*, __va_list_tag*)+0x2c8>
        switch (*format) {
  1c05ad:	b8 01 00 00 00       	mov    $0x1,%eax
  1c05b2:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  1c05b9:	e9 9d 00 00 00       	jmp    1c065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  1c05be:	b8 00 00 00 00       	mov    $0x0,%eax
  1c05c3:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  1c05ca:	e9 8c 00 00 00       	jmp    1c065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  1c05cf:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c05d3:	b8 00 00 00 00       	mov    $0x0,%eax
  1c05d8:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  1c05df:	eb 7a                	jmp    1c065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  1c05e1:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c05e5:	b8 00 00 00 00       	mov    $0x0,%eax
  1c05ea:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  1c05f1:	eb 68                	jmp    1c065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1c05f3:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1c05f7:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c05fb:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c05ff:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c0603:	eb 70                	jmp    1c0675 <printer::vprintf(char const*, __va_list_tag*)+0x3a7>
  1c0605:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1c0609:	8b 07                	mov    (%rdi),%eax
  1c060b:	83 f8 2f             	cmp    $0x2f,%eax
  1c060e:	77 10                	ja     1c0620 <printer::vprintf(char const*, __va_list_tag*)+0x352>
  1c0610:	89 c2                	mov    %eax,%edx
  1c0612:	48 03 57 10          	add    0x10(%rdi),%rdx
  1c0616:	83 c0 08             	add    $0x8,%eax
  1c0619:	89 07                	mov    %eax,(%rdi)
  1c061b:	44 8b 1a             	mov    (%rdx),%r11d
  1c061e:	eb 58                	jmp    1c0678 <printer::vprintf(char const*, __va_list_tag*)+0x3aa>
  1c0620:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1c0624:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1c0628:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c062c:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1c0630:	eb e9                	jmp    1c061b <printer::vprintf(char const*, __va_list_tag*)+0x34d>
        switch (*format) {
  1c0632:	b8 01 00 00 00       	mov    $0x1,%eax
  1c0637:	eb 1b                	jmp    1c0654 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  1c0639:	b8 00 00 00 00       	mov    $0x0,%eax
  1c063e:	eb 14                	jmp    1c0654 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  1c0640:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c0644:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0649:	eb 09                	jmp    1c0654 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  1c064b:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c064f:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  1c0654:	c7 45 a0 f0 ff ff ff 	movl   $0xfffffff0,-0x60(%rbp)
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1c065b:	85 c0                	test   %eax,%eax
  1c065d:	74 a6                	je     1c0605 <printer::vprintf(char const*, __va_list_tag*)+0x337>
  1c065f:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1c0663:	8b 07                	mov    (%rdi),%eax
  1c0665:	83 f8 2f             	cmp    $0x2f,%eax
  1c0668:	77 89                	ja     1c05f3 <printer::vprintf(char const*, __va_list_tag*)+0x325>
  1c066a:	89 c2                	mov    %eax,%edx
  1c066c:	48 03 57 10          	add    0x10(%rdi),%rdx
  1c0670:	83 c0 08             	add    $0x8,%eax
  1c0673:	89 07                	mov    %eax,(%rdi)
  1c0675:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_NUMERIC;
  1c0678:	44 89 f0             	mov    %r14d,%eax
  1c067b:	83 c8 40             	or     $0x40,%eax
    if (base < 0) {
  1c067e:	83 7d a0 00          	cmpl   $0x0,-0x60(%rbp)
  1c0682:	0f 89 de 02 00 00    	jns    1c0966 <printer::vprintf(char const*, __va_list_tag*)+0x698>
    *--pos = '\0';
  1c0688:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  1c068c:	a8 20                	test   $0x20,%al
  1c068e:	0f 85 01 03 00 00    	jne    1c0995 <printer::vprintf(char const*, __va_list_tag*)+0x6c7>
  1c0694:	41 89 c6             	mov    %eax,%r14d
        digits = lower_digits;
  1c0697:	41 ba b0 24 1c 00    	mov    $0x1c24b0,%r10d
        base = -base;
  1c069d:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  1c06a3:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = nullptr;
  1c06aa:	bf 00 00 00 00       	mov    $0x0,%edi
  1c06af:	e9 03 03 00 00       	jmp    1c09b7 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
        switch (*format) {
  1c06b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1c06b9:	eb 1b                	jmp    1c06d6 <printer::vprintf(char const*, __va_list_tag*)+0x408>
  1c06bb:	b8 00 00 00 00       	mov    $0x0,%eax
  1c06c0:	eb 14                	jmp    1c06d6 <printer::vprintf(char const*, __va_list_tag*)+0x408>
  1c06c2:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c06c6:	b8 00 00 00 00       	mov    $0x0,%eax
  1c06cb:	eb 09                	jmp    1c06d6 <printer::vprintf(char const*, __va_list_tag*)+0x408>
  1c06cd:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c06d1:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  1c06d6:	c7 45 a0 10 00 00 00 	movl   $0x10,-0x60(%rbp)
            goto format_unsigned;
  1c06dd:	e9 79 ff ff ff       	jmp    1c065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
        switch (*format) {
  1c06e2:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c06e6:	eb 04                	jmp    1c06ec <printer::vprintf(char const*, __va_list_tag*)+0x41e>
  1c06e8:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            num = (uintptr_t) va_arg(val, void*);
  1c06ec:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1c06f0:	8b 01                	mov    (%rcx),%eax
  1c06f2:	83 f8 2f             	cmp    $0x2f,%eax
  1c06f5:	77 22                	ja     1c0719 <printer::vprintf(char const*, __va_list_tag*)+0x44b>
  1c06f7:	89 c2                	mov    %eax,%edx
  1c06f9:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c06fd:	83 c0 08             	add    $0x8,%eax
  1c0700:	89 01                	mov    %eax,(%rcx)
  1c0702:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  1c0705:	44 89 f0             	mov    %r14d,%eax
  1c0708:	0d 41 02 00 00       	or     $0x241,%eax
            base = -16;
  1c070d:	c7 45 a0 f0 ff ff ff 	movl   $0xfffffff0,-0x60(%rbp)
  1c0714:	e9 6f ff ff ff       	jmp    1c0688 <printer::vprintf(char const*, __va_list_tag*)+0x3ba>
            num = (uintptr_t) va_arg(val, void*);
  1c0719:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1c071d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c0721:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c0725:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c0729:	eb d7                	jmp    1c0702 <printer::vprintf(char const*, __va_list_tag*)+0x434>
        switch (*format) {
  1c072b:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c072f:	eb 04                	jmp    1c0735 <printer::vprintf(char const*, __va_list_tag*)+0x467>
  1c0731:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = va_arg(val, char*);
  1c0735:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1c0739:	8b 01                	mov    (%rcx),%eax
  1c073b:	83 f8 2f             	cmp    $0x2f,%eax
  1c073e:	0f 87 61 01 00 00    	ja     1c08a5 <printer::vprintf(char const*, __va_list_tag*)+0x5d7>
  1c0744:	89 c2                	mov    %eax,%edx
  1c0746:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c074a:	83 c0 08             	add    $0x8,%eax
  1c074d:	89 01                	mov    %eax,(%rcx)
  1c074f:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  1c0752:	41 bb 00 00 00 00    	mov    $0x0,%r11d
        if (flags & FLAG_NUMERIC) {
  1c0758:	44 89 f0             	mov    %r14d,%eax
  1c075b:	83 e0 40             	and    $0x40,%eax
  1c075e:	89 45 94             	mov    %eax,-0x6c(%rbp)
        const char* prefix = "";
  1c0761:	41 bc b4 0d 1c 00    	mov    $0x1c0db4,%r12d
        if (flags & FLAG_NUMERIC) {
  1c0767:	0f 85 e9 03 00 00    	jne    1c0b56 <printer::vprintf(char const*, __va_list_tag*)+0x888>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  1c076d:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  1c0770:	89 d0                	mov    %edx,%eax
  1c0772:	f7 d0                	not    %eax
  1c0774:	c1 e8 1f             	shr    $0x1f,%eax
  1c0777:	89 45 90             	mov    %eax,-0x70(%rbp)
  1c077a:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
  1c077e:	0f 85 54 03 00 00    	jne    1c0ad8 <printer::vprintf(char const*, __va_list_tag*)+0x80a>
  1c0784:	84 c0                	test   %al,%al
  1c0786:	0f 84 4c 03 00 00    	je     1c0ad8 <printer::vprintf(char const*, __va_list_tag*)+0x80a>
            datalen = strnlen(data, precision);
  1c078c:	48 63 f2             	movslq %edx,%rsi
  1c078f:	48 89 df             	mov    %rbx,%rdi
  1c0792:	e8 ee f9 ff ff       	call   1c0185 <strnlen>
  1c0797:	89 45 a0             	mov    %eax,-0x60(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  1c079a:	44 89 f0             	mov    %r14d,%eax
  1c079d:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  1c07a0:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  1c07a7:	83 f8 42             	cmp    $0x42,%eax
  1c07aa:	0f 84 60 03 00 00    	je     1c0b10 <printer::vprintf(char const*, __va_list_tag*)+0x842>
        width -= datalen + zeros + strlen(prefix);
  1c07b0:	4c 89 e7             	mov    %r12,%rdi
  1c07b3:	e8 ae f9 ff ff       	call   1c0166 <strlen>
  1c07b8:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  1c07bb:	8b 7d a0             	mov    -0x60(%rbp),%edi
  1c07be:	8d 0c 3a             	lea    (%rdx,%rdi,1),%ecx
  1c07c1:	44 89 ea             	mov    %r13d,%edx
  1c07c4:	29 ca                	sub    %ecx,%edx
  1c07c6:	29 c2                	sub    %eax,%edx
  1c07c8:	41 89 d5             	mov    %edx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1c07cb:	41 f6 c6 04          	test   $0x4,%r14b
  1c07cf:	75 31                	jne    1c0802 <printer::vprintf(char const*, __va_list_tag*)+0x534>
  1c07d1:	85 d2                	test   %edx,%edx
  1c07d3:	7e 2d                	jle    1c0802 <printer::vprintf(char const*, __va_list_tag*)+0x534>
        width -= datalen + zeros + strlen(prefix);
  1c07d5:	41 89 d6             	mov    %edx,%r14d
            putc(' ');
  1c07d8:	49 8b 07             	mov    (%r15),%rax
  1c07db:	be 20 00 00 00       	mov    $0x20,%esi
  1c07e0:	4c 89 ff             	mov    %r15,%rdi
  1c07e3:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1c07e5:	41 83 ed 01          	sub    $0x1,%r13d
  1c07e9:	45 85 ed             	test   %r13d,%r13d
  1c07ec:	7f ea                	jg     1c07d8 <printer::vprintf(char const*, __va_list_tag*)+0x50a>
  1c07ee:	44 89 f2             	mov    %r14d,%edx
  1c07f1:	45 85 f6             	test   %r14d,%r14d
  1c07f4:	b8 01 00 00 00       	mov    $0x1,%eax
  1c07f9:	41 0f 4f c6          	cmovg  %r14d,%eax
  1c07fd:	29 c2                	sub    %eax,%edx
  1c07ff:	41 89 d5             	mov    %edx,%r13d
        for (; *prefix; ++prefix) {
  1c0802:	41 0f b6 04 24       	movzbl (%r12),%eax
  1c0807:	84 c0                	test   %al,%al
  1c0809:	74 18                	je     1c0823 <printer::vprintf(char const*, __va_list_tag*)+0x555>
            putc(*prefix);
  1c080b:	0f b6 f0             	movzbl %al,%esi
  1c080e:	49 8b 07             	mov    (%r15),%rax
  1c0811:	4c 89 ff             	mov    %r15,%rdi
  1c0814:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  1c0816:	49 83 c4 01          	add    $0x1,%r12
  1c081a:	41 0f b6 04 24       	movzbl (%r12),%eax
  1c081f:	84 c0                	test   %al,%al
  1c0821:	75 e8                	jne    1c080b <printer::vprintf(char const*, __va_list_tag*)+0x53d>
        for (; zeros > 0; --zeros) {
  1c0823:	44 8b 65 a4          	mov    -0x5c(%rbp),%r12d
  1c0827:	45 85 e4             	test   %r12d,%r12d
  1c082a:	7e 13                	jle    1c083f <printer::vprintf(char const*, __va_list_tag*)+0x571>
            putc('0');
  1c082c:	49 8b 07             	mov    (%r15),%rax
  1c082f:	be 30 00 00 00       	mov    $0x30,%esi
  1c0834:	4c 89 ff             	mov    %r15,%rdi
  1c0837:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  1c0839:	41 83 ec 01          	sub    $0x1,%r12d
  1c083d:	75 ed                	jne    1c082c <printer::vprintf(char const*, __va_list_tag*)+0x55e>
        for (; datalen > 0; ++data, --datalen) {
  1c083f:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1c0842:	85 c0                	test   %eax,%eax
  1c0844:	7e 1a                	jle    1c0860 <printer::vprintf(char const*, __va_list_tag*)+0x592>
  1c0846:	41 89 c6             	mov    %eax,%r14d
  1c0849:	49 01 de             	add    %rbx,%r14
            putc(*data);
  1c084c:	0f b6 33             	movzbl (%rbx),%esi
  1c084f:	49 8b 07             	mov    (%r15),%rax
  1c0852:	4c 89 ff             	mov    %r15,%rdi
  1c0855:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  1c0857:	48 83 c3 01          	add    $0x1,%rbx
  1c085b:	49 39 de             	cmp    %rbx,%r14
  1c085e:	75 ec                	jne    1c084c <printer::vprintf(char const*, __va_list_tag*)+0x57e>
        for (; width > 0; --width) {
  1c0860:	45 85 ed             	test   %r13d,%r13d
  1c0863:	7e 13                	jle    1c0878 <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            putc(' ');
  1c0865:	49 8b 07             	mov    (%r15),%rax
  1c0868:	be 20 00 00 00       	mov    $0x20,%esi
  1c086d:	4c 89 ff             	mov    %r15,%rdi
  1c0870:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  1c0872:	41 83 ed 01          	sub    $0x1,%r13d
  1c0876:	75 ed                	jne    1c0865 <printer::vprintf(char const*, __va_list_tag*)+0x597>
    for (; *format; ++format) {
  1c0878:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  1c087c:	4c 8d 60 01          	lea    0x1(%rax),%r12
  1c0880:	0f b6 40 01          	movzbl 0x1(%rax),%eax
  1c0884:	84 c0                	test   %al,%al
  1c0886:	0f 84 6c fa ff ff    	je     1c02f8 <printer::vprintf(char const*, __va_list_tag*)+0x2a>
        if (*format != '%') {
  1c088c:	3c 25                	cmp    $0x25,%al
  1c088e:	0f 84 73 fa ff ff    	je     1c0307 <printer::vprintf(char const*, __va_list_tag*)+0x39>
            putc(*format);
  1c0894:	0f b6 f0             	movzbl %al,%esi
  1c0897:	49 8b 07             	mov    (%r15),%rax
  1c089a:	4c 89 ff             	mov    %r15,%rdi
  1c089d:	ff 10                	call   *(%rax)
            continue;
  1c089f:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
  1c08a3:	eb d3                	jmp    1c0878 <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            data = va_arg(val, char*);
  1c08a5:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1c08a9:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1c08ad:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c08b1:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1c08b5:	e9 95 fe ff ff       	jmp    1c074f <printer::vprintf(char const*, __va_list_tag*)+0x481>
        switch (*format) {
  1c08ba:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c08be:	eb 04                	jmp    1c08c4 <printer::vprintf(char const*, __va_list_tag*)+0x5f6>
  1c08c0:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            color_ = va_arg(val, int);
  1c08c4:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1c08c8:	8b 07                	mov    (%rdi),%eax
  1c08ca:	83 f8 2f             	cmp    $0x2f,%eax
  1c08cd:	77 13                	ja     1c08e2 <printer::vprintf(char const*, __va_list_tag*)+0x614>
  1c08cf:	89 c2                	mov    %eax,%edx
  1c08d1:	48 03 57 10          	add    0x10(%rdi),%rdx
  1c08d5:	83 c0 08             	add    $0x8,%eax
  1c08d8:	89 07                	mov    %eax,(%rdi)
  1c08da:	8b 02                	mov    (%rdx),%eax
  1c08dc:	41 89 47 08          	mov    %eax,0x8(%r15)
            continue;
  1c08e0:	eb 96                	jmp    1c0878 <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            color_ = va_arg(val, int);
  1c08e2:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1c08e6:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c08ea:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c08ee:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c08f2:	eb e6                	jmp    1c08da <printer::vprintf(char const*, __va_list_tag*)+0x60c>
        switch (*format) {
  1c08f4:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c08f8:	eb 04                	jmp    1c08fe <printer::vprintf(char const*, __va_list_tag*)+0x630>
  1c08fa:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = va_arg(val, int);
  1c08fe:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1c0902:	8b 01                	mov    (%rcx),%eax
  1c0904:	83 f8 2f             	cmp    $0x2f,%eax
  1c0907:	77 23                	ja     1c092c <printer::vprintf(char const*, __va_list_tag*)+0x65e>
  1c0909:	89 c2                	mov    %eax,%edx
  1c090b:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c090f:	83 c0 08             	add    $0x8,%eax
  1c0912:	89 01                	mov    %eax,(%rcx)
  1c0914:	8b 02                	mov    (%rdx),%eax
  1c0916:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  1c0919:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  1c091d:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  1c0921:	41 bb 00 00 00 00    	mov    $0x0,%r11d
            break;
  1c0927:	e9 2c fe ff ff       	jmp    1c0758 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
            numbuf[0] = va_arg(val, int);
  1c092c:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1c0930:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1c0934:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c0938:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1c093c:	eb d6                	jmp    1c0914 <printer::vprintf(char const*, __va_list_tag*)+0x646>
        switch (*format) {
  1c093e:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = (*format ? *format : '%');
  1c0942:	84 c0                	test   %al,%al
  1c0944:	0f 85 ee 01 00 00    	jne    1c0b38 <printer::vprintf(char const*, __va_list_tag*)+0x86a>
  1c094a:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  1c094e:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  1c0952:	48 83 6d a8 01       	subq   $0x1,-0x58(%rbp)
            data = numbuf;
  1c0957:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  1c095b:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  1c0961:	e9 f2 fd ff ff       	jmp    1c0758 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
    *--pos = '\0';
  1c0966:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  1c096a:	41 f6 c6 20          	test   $0x20,%r14b
  1c096e:	74 73                	je     1c09e3 <printer::vprintf(char const*, __va_list_tag*)+0x715>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1c0970:	8b 55 a0             	mov    -0x60(%rbp),%edx
  1c0973:	41 89 d1             	mov    %edx,%r9d
  1c0976:	41 89 c6             	mov    %eax,%r14d
  1c0979:	41 ba d0 24 1c 00    	mov    $0x1c24d0,%r10d
  1c097f:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
  1c0986:	83 fa 0a             	cmp    $0xa,%edx
  1c0989:	0f 94 c0             	sete   %al
  1c098c:	0f b6 c0             	movzbl %al,%eax
  1c098f:	48 83 e8 04          	sub    $0x4,%rax
  1c0993:	eb 1d                	jmp    1c09b2 <printer::vprintf(char const*, __va_list_tag*)+0x6e4>
    if (flags & FLAG_THOUSANDS) {
  1c0995:	41 89 c6             	mov    %eax,%r14d
        digits = lower_digits;
  1c0998:	41 ba b0 24 1c 00    	mov    $0x1c24b0,%r10d
        base = -base;
  1c099e:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  1c09a4:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1c09ab:	48 c7 c0 fc ff ff ff 	mov    $0xfffffffffffffffc,%rax
  1c09b2:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  1c09b7:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  1c09bb:	4c 89 d8             	mov    %r11,%rax
            *--pos = digits[val % base];
  1c09be:	49 63 f1             	movslq %r9d,%rsi
    } while (val != 0 && pos != buf);
  1c09c1:	4c 8d 45 b0          	lea    -0x50(%rbp),%r8
  1c09c5:	eb 57                	jmp    1c0a1e <printer::vprintf(char const*, __va_list_tag*)+0x750>
    if (flags & FLAG_THOUSANDS) {
  1c09c7:	41 ba d0 24 1c 00    	mov    $0x1c24d0,%r10d
  1c09cd:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  1c09d3:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1c09da:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  1c09e1:	eb cf                	jmp    1c09b2 <printer::vprintf(char const*, __va_list_tag*)+0x6e4>
  1c09e3:	44 8b 4d a0          	mov    -0x60(%rbp),%r9d
  1c09e7:	41 89 c6             	mov    %eax,%r14d
  1c09ea:	41 ba d0 24 1c 00    	mov    $0x1c24d0,%r10d
  1c09f0:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = nullptr;
  1c09f7:	bf 00 00 00 00       	mov    $0x0,%edi
  1c09fc:	eb b9                	jmp    1c09b7 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
            *--pos = digits[val % base];
  1c09fe:	48 89 cb             	mov    %rcx,%rbx
  1c0a01:	ba 00 00 00 00       	mov    $0x0,%edx
  1c0a06:	48 f7 f6             	div    %rsi
  1c0a09:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
  1c0a0e:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  1c0a10:	48 83 e9 01          	sub    $0x1,%rcx
  1c0a14:	48 85 c0             	test   %rax,%rax
  1c0a17:	74 2d                	je     1c0a46 <printer::vprintf(char const*, __va_list_tag*)+0x778>
  1c0a19:	4c 39 c3             	cmp    %r8,%rbx
  1c0a1c:	74 28                	je     1c0a46 <printer::vprintf(char const*, __va_list_tag*)+0x778>
        if (pos == thousands_pos) {
  1c0a1e:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  1c0a22:	48 39 d7             	cmp    %rdx,%rdi
  1c0a25:	75 d7                	jne    1c09fe <printer::vprintf(char const*, __va_list_tag*)+0x730>
            *--pos = base == 10 ? ',' : '\'';
  1c0a27:	48 89 cb             	mov    %rcx,%rbx
  1c0a2a:	41 83 f9 0a          	cmp    $0xa,%r9d
  1c0a2e:	0f 94 c2             	sete   %dl
  1c0a31:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  1c0a35:	40 0f 94 c7          	sete   %dil
  1c0a39:	40 0f b6 ff          	movzbl %dil,%edi
  1c0a3d:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  1c0a3f:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  1c0a44:	eb ca                	jmp    1c0a10 <printer::vprintf(char const*, __va_list_tag*)+0x742>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  1c0a46:	44 89 f0             	mov    %r14d,%eax
  1c0a49:	f7 d0                	not    %eax
  1c0a4b:	a8 c0                	test   $0xc0,%al
  1c0a4d:	75 3b                	jne    1c0a8a <printer::vprintf(char const*, __va_list_tag*)+0x7bc>
                prefix = "-";
  1c0a4f:	41 bc b1 0d 1c 00    	mov    $0x1c0db1,%r12d
            if (flags & FLAG_NEGATIVE) {
  1c0a55:	41 f7 c6 00 01 00 00 	test   $0x100,%r14d
  1c0a5c:	0f 85 0b fd ff ff    	jne    1c076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                prefix = "+";
  1c0a62:	41 bc ac 0d 1c 00    	mov    $0x1c0dac,%r12d
            } else if (flags & FLAG_PLUSPOSITIVE) {
  1c0a68:	41 f6 c6 10          	test   $0x10,%r14b
  1c0a6c:	0f 85 fb fc ff ff    	jne    1c076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
        const char* prefix = "";
  1c0a72:	41 f6 c6 08          	test   $0x8,%r14b
  1c0a76:	41 bc b3 0d 1c 00    	mov    $0x1c0db3,%r12d
  1c0a7c:	b8 b4 0d 1c 00       	mov    $0x1c0db4,%eax
  1c0a81:	4c 0f 44 e0          	cmove  %rax,%r12
  1c0a85:	e9 e3 fc ff ff       	jmp    1c076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
  1c0a8a:	41 bc b4 0d 1c 00    	mov    $0x1c0db4,%r12d
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1c0a90:	44 89 f0             	mov    %r14d,%eax
  1c0a93:	f7 d0                	not    %eax
  1c0a95:	a8 41                	test   $0x41,%al
  1c0a97:	0f 85 d0 fc ff ff    	jne    1c076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                   && (base == 16 || base == -16)
  1c0a9d:	8b 45 a0             	mov    -0x60(%rbp),%eax
  1c0aa0:	83 c0 10             	add    $0x10,%eax
  1c0aa3:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  1c0aa8:	0f 85 bf fc ff ff    	jne    1c076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                   && (num || (flags & FLAG_ALT2))) {
  1c0aae:	4d 85 db             	test   %r11,%r11
  1c0ab1:	75 0d                	jne    1c0ac0 <printer::vprintf(char const*, __va_list_tag*)+0x7f2>
  1c0ab3:	41 f7 c6 00 02 00 00 	test   $0x200,%r14d
  1c0aba:	0f 84 ad fc ff ff    	je     1c076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
            prefix = (base == -16 ? "0x" : "0X");
  1c0ac0:	83 7d a0 f0          	cmpl   $0xfffffff0,-0x60(%rbp)
  1c0ac4:	41 bc ae 0d 1c 00    	mov    $0x1c0dae,%r12d
  1c0aca:	b8 b5 0d 1c 00       	mov    $0x1c0db5,%eax
  1c0acf:	4c 0f 44 e0          	cmove  %rax,%r12
  1c0ad3:	e9 95 fc ff ff       	jmp    1c076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
            datalen = strlen(data);
  1c0ad8:	48 89 df             	mov    %rbx,%rdi
  1c0adb:	e8 86 f6 ff ff       	call   1c0166 <strlen>
  1c0ae0:	89 45 a0             	mov    %eax,-0x60(%rbp)
            && precision >= 0) {
  1c0ae3:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
  1c0ae7:	0f 84 ad fc ff ff    	je     1c079a <printer::vprintf(char const*, __va_list_tag*)+0x4cc>
  1c0aed:	80 7d 90 00          	cmpb   $0x0,-0x70(%rbp)
  1c0af1:	0f 84 a3 fc ff ff    	je     1c079a <printer::vprintf(char const*, __va_list_tag*)+0x4cc>
            zeros = precision > datalen ? precision - datalen : 0;
  1c0af7:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  1c0afa:	89 fa                	mov    %edi,%edx
  1c0afc:	29 c2                	sub    %eax,%edx
  1c0afe:	39 c7                	cmp    %eax,%edi
  1c0b00:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0b05:	0f 4f c2             	cmovg  %edx,%eax
  1c0b08:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1c0b0b:	e9 a0 fc ff ff       	jmp    1c07b0 <printer::vprintf(char const*, __va_list_tag*)+0x4e2>
                   && datalen + (int) strlen(prefix) < width) {
  1c0b10:	4c 89 e7             	mov    %r12,%rdi
  1c0b13:	e8 4e f6 ff ff       	call   1c0166 <strlen>
  1c0b18:	8b 7d a0             	mov    -0x60(%rbp),%edi
  1c0b1b:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  1c0b1e:	44 89 e9             	mov    %r13d,%ecx
  1c0b21:	29 f9                	sub    %edi,%ecx
  1c0b23:	29 c1                	sub    %eax,%ecx
  1c0b25:	44 39 ea             	cmp    %r13d,%edx
  1c0b28:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0b2d:	0f 4c c1             	cmovl  %ecx,%eax
  1c0b30:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1c0b33:	e9 78 fc ff ff       	jmp    1c07b0 <printer::vprintf(char const*, __va_list_tag*)+0x4e2>
  1c0b38:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
            numbuf[0] = (*format ? *format : '%');
  1c0b3c:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  1c0b3f:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
  1c0b43:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = numbuf;
  1c0b47:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  1c0b4b:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  1c0b51:	e9 02 fc ff ff       	jmp    1c0758 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
    *--pos = '\0';
  1c0b56:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  1c0b5a:	41 f6 c6 20          	test   $0x20,%r14b
  1c0b5e:	0f 85 63 fe ff ff    	jne    1c09c7 <printer::vprintf(char const*, __va_list_tag*)+0x6f9>
  1c0b64:	41 ba d0 24 1c 00    	mov    $0x1c24d0,%r10d
  1c0b6a:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  1c0b70:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
        thousands_pos = nullptr;
  1c0b77:	bf 00 00 00 00       	mov    $0x0,%edi
  1c0b7c:	e9 36 fe ff ff       	jmp    1c09b7 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>

00000000001c0b81 <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  1c0b81:	f3 0f 1e fa          	endbr64
  1c0b85:	55                   	push   %rbp
  1c0b86:	48 89 e5             	mov    %rsp,%rbp
  1c0b89:	53                   	push   %rbx
  1c0b8a:	48 83 ec 38          	sub    $0x38,%rsp
  1c0b8e:	48 89 f3             	mov    %rsi,%rbx
  1c0b91:	48 89 d6             	mov    %rdx,%rsi
  1c0b94:	48 89 ca             	mov    %rcx,%rdx
void console_printf(const char* format, ...);


// Generic print library

struct printer {
  1c0b97:	c7 45 d0 00 07 00 00 	movl   $0x700,-0x30(%rbp)
        : s_(s), end_(s + size), n_(0) {
  1c0b9e:	48 c7 45 c8 f8 24 1c 	movq   $0x1c24f8,-0x38(%rbp)
  1c0ba5:	00 
  1c0ba6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  1c0baa:	48 01 df             	add    %rbx,%rdi
  1c0bad:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  1c0bb1:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  1c0bb8:	00 
    string_printer sp(s, size);
    sp.vprintf(format, val);
  1c0bb9:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  1c0bbd:	e8 0c f7 ff ff       	call   1c02ce <printer::vprintf(char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  1c0bc2:	48 85 db             	test   %rbx,%rbx
  1c0bc5:	74 10                	je     1c0bd7 <vsnprintf+0x56>
  1c0bc7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  1c0bcb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  1c0bcf:	48 39 c2             	cmp    %rax,%rdx
  1c0bd2:	73 0d                	jae    1c0be1 <vsnprintf+0x60>
        *sp.s_ = 0;
  1c0bd4:	c6 02 00             	movb   $0x0,(%rdx)
    } else if (size) {
        sp.end_[-1] = 0;
    }
    return sp.n_;
}
  1c0bd7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  1c0bdb:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  1c0bdf:	c9                   	leave
  1c0be0:	c3                   	ret
        sp.end_[-1] = 0;
  1c0be1:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
  1c0be5:	eb f0                	jmp    1c0bd7 <vsnprintf+0x56>

00000000001c0be7 <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  1c0be7:	f3 0f 1e fa          	endbr64
  1c0beb:	55                   	push   %rbp
  1c0bec:	48 89 e5             	mov    %rsp,%rbp
  1c0bef:	48 83 ec 50          	sub    $0x50,%rsp
  1c0bf3:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  1c0bf7:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  1c0bfb:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  1c0bff:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  1c0c06:	48 8d 45 10          	lea    0x10(%rbp),%rax
  1c0c0a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  1c0c0e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  1c0c12:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  1c0c16:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  1c0c1a:	e8 62 ff ff ff       	call   1c0b81 <vsnprintf>
    va_end(val);
    return n;
  1c0c1f:	48 98                	cltq
}
  1c0c21:	c9                   	leave
  1c0c22:	c3                   	ret

00000000001c0c23 <assert_fail(char const*, int, char const*, char const*)>:
void error_vprintf(int cpos, int color, const char* format, va_list val) {
    console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  1c0c23:	f3 0f 1e fa          	endbr64
  1c0c27:	55                   	push   %rbp
  1c0c28:	48 89 e5             	mov    %rsp,%rbp
  1c0c2b:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  1c0c32:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  1c0c35:	c7 05 bd 83 ef ff 30 	movl   $0x730,-0x107c43(%rip)        # b8ffc <cursorpos>
  1c0c3c:	07 00 00 
    char buf[240];
    if (description) {
  1c0c3f:	48 85 c9             	test   %rcx,%rcx
  1c0c42:	74 39                	je     1c0c7d <assert_fail(char const*, int, char const*, char const*)+0x5a>
  1c0c44:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  1c0c47:	48 83 ec 08          	sub    $0x8,%rsp
  1c0c4b:	52                   	push   %rdx
  1c0c4c:	56                   	push   %rsi
  1c0c4d:	57                   	push   %rdi
  1c0c4e:	48 89 f9             	mov    %rdi,%rcx
  1c0c51:	ba 30 0d 1c 00       	mov    $0x1c0d30,%edx
  1c0c56:	be f0 00 00 00       	mov    $0xf0,%esi
  1c0c5b:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  1c0c62:	b0 00                	mov    $0x0,%al
  1c0c64:	e8 7e ff ff ff       	call   1c0be7 <snprintf>
  1c0c69:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  1c0c6d:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  1c0c72:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  1c0c79:	0f 05                	syscall
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  1c0c7b:	eb fe                	jmp    1c0c7b <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  1c0c7d:	49 89 d1             	mov    %rdx,%r9
  1c0c80:	48 89 f9             	mov    %rdi,%rcx
  1c0c83:	ba 60 0d 1c 00       	mov    $0x1c0d60,%edx
  1c0c88:	be f0 00 00 00       	mov    $0xf0,%esi
  1c0c8d:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  1c0c94:	b0 00                	mov    $0x0,%al
  1c0c96:	e8 4c ff ff ff       	call   1c0be7 <snprintf>
  1c0c9b:	eb d0                	jmp    1c0c6d <assert_fail(char const*, int, char const*, char const*)+0x4a>

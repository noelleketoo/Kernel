
obj/p-allocator.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000100000 <process_main()>:
    unsigned char buf[4096];
    int field2;
};
const test_struct test = {61, {0}, 6161};

void process_main() {
  100000:	f3 0f 1e fa          	endbr64
  100004:	55                   	push   %rbp
  100005:	48 89 e5             	mov    %rsp,%rbp
  100008:	41 54                	push   %r12
  10000a:	53                   	push   %rbx
    assert(test.field1 == 61);
    assert(memchr(&test, 0x11, sizeof(test)) == &test.field2);
  10000b:	ba 08 10 00 00       	mov    $0x1008,%edx
  100010:	be 11 00 00 00       	mov    $0x11,%esi
  100015:	bf e0 0d 10 00       	mov    $0x100de0,%edi
  10001a:	e8 1e 01 00 00       	call   10013d <memchr>
  10001f:	48 3d e4 1d 10 00    	cmp    $0x101de4,%rax
  100025:	75 48                	jne    10006f <process_main()+0x6f>
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  100027:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  10002c:	0f 05                	syscall
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
    return rax;
  10002e:	49 89 c4             	mov    %rax,%r12


// sys_getpid
//    Return current process ID. (Never fails.)
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  100031:	89 c3                	mov    %eax,%ebx

    pid_t p = sys_getpid();
    srand(p);
  100033:	89 c7                	mov    %eax,%edi
  100035:	e8 9d 01 00 00       	call   1001d7 <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  10003a:	ba 1b 40 10 00       	mov    $0x10401b,%edx

    // The heap starts on the page right after the 'end' symbol,
    // whose address is the first address not allocated to process code
    // or data.
    heap_top = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  10003f:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
  100046:	48 89 15 bb 2f 00 00 	mov    %rdx,0x2fbb(%rip)        # 103008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  10004d:	48 89 e0             	mov    %rsp,%rax

    // The bottom of the stack is the first address on the current
    // stack page (this process never needs more than one stack page).
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  100050:	48 83 e8 01          	sub    $0x1,%rax
  100054:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  10005a:	48 89 05 9f 2f 00 00 	mov    %rax,0x2f9f(%rip)        # 103000 <stack_bottom>

    // Allocate heap pages until (1) hit the stack (out of address space)
    // or (2) allocation fails (out of physical memory).
    while (heap_top != stack_bottom) {
  100061:	48 39 c2             	cmp    %rax,%rdx
  100064:	75 68                	jne    1000ce <process_main()+0xce>
    register uintptr_t rax asm("rax") = syscallno;
  100066:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  10006b:	0f 05                	syscall
        }
        sys_yield();
    }

    // After running out of memory, do nothing forever
    while (true) {
  10006d:	eb f7                	jmp    100066 <process_main()+0x66>
    assert(memchr(&test, 0x11, sizeof(test)) == &test.field2);
  10006f:	b9 00 00 00 00       	mov    $0x0,%ecx
  100074:	ba a0 0c 10 00       	mov    $0x100ca0,%edx
  100079:	be 16 00 00 00       	mov    $0x16,%esi
  10007e:	bf 83 0d 10 00       	mov    $0x100d83,%edi
  100083:	e8 9b 0b 00 00       	call   100c23 <assert_fail(char const*, int, char const*, char const*)>
                assert(*l == 0);
  100088:	b9 00 00 00 00       	mov    $0x0,%ecx
  10008d:	ba 92 0d 10 00       	mov    $0x100d92,%edx
  100092:	be 2f 00 00 00       	mov    $0x2f,%esi
  100097:	bf 83 0d 10 00       	mov    $0x100d83,%edi
  10009c:	e8 82 0b 00 00       	call   100c23 <assert_fail(char const*, int, char const*, char const*)>
            *heap_top = p;
  1000a1:	44 88 21             	mov    %r12b,(%rcx)
            console[CPOS(24, 79)] = p;
  1000a4:	66 44 89 25 f2 8e fb 	mov    %r12w,-0x4710e(%rip)        # b8f9e <console+0xf9e>
  1000ab:	ff 
            heap_top += PAGESIZE;
  1000ac:	48 81 05 51 2f 00 00 	addq   $0x1000,0x2f51(%rip)        # 103008 <heap_top>
  1000b3:	00 10 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  1000b7:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  1000bc:	0f 05                	syscall
    while (heap_top != stack_bottom) {
  1000be:	48 8b 05 3b 2f 00 00 	mov    0x2f3b(%rip),%rax        # 103000 <stack_bottom>
  1000c5:	48 39 05 3c 2f 00 00 	cmp    %rax,0x2f3c(%rip)        # 103008 <heap_top>
  1000cc:	74 98                	je     100066 <process_main()+0x66>
        if (rand(0, ALLOC_SLOWDOWN - 1) < p) {
  1000ce:	be 63 00 00 00       	mov    $0x63,%esi
  1000d3:	bf 00 00 00 00       	mov    $0x0,%edi
  1000d8:	e8 68 01 00 00       	call   100245 <rand(int, int)>
  1000dd:	39 d8                	cmp    %ebx,%eax
  1000df:	7d d6                	jge    1000b7 <process_main()+0xb7>
    register uintptr_t rax asm("rax") = syscallno;
  1000e1:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  1000e6:	48 8b 3d 1b 2f 00 00 	mov    0x2f1b(%rip),%rdi        # 103008 <heap_top>
  1000ed:	0f 05                	syscall
            if (sys_page_alloc((uint8_t*) heap_top) < 0) {
  1000ef:	85 c0                	test   %eax,%eax
  1000f1:	0f 88 6f ff ff ff    	js     100066 <process_main()+0x66>
            for (unsigned long* l = (unsigned long*) heap_top;
  1000f7:	48 8b 0d 0a 2f 00 00 	mov    0x2f0a(%rip),%rcx        # 103008 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1000fe:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  100105:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  100108:	48 83 38 00          	cmpq   $0x0,(%rax)
  10010c:	0f 85 76 ff ff ff    	jne    100088 <process_main()+0x88>
            for (unsigned long* l = (unsigned long*) heap_top;
  100112:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  100116:	48 39 d0             	cmp    %rdx,%rax
  100119:	75 ed                	jne    100108 <process_main()+0x108>
  10011b:	eb 84                	jmp    1000a1 <process_main()+0xa1>
  10011d:	90                   	nop

000000000010011e <string_printer::putc(unsigned char)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c) override {
  10011e:	f3 0f 1e fa          	endbr64
        if (s_ < end_) {
  100122:	48 8b 47 10          	mov    0x10(%rdi),%rax
  100126:	48 3b 47 18          	cmp    0x18(%rdi),%rax
  10012a:	73 0b                	jae    100137 <string_printer::putc(unsigned char)+0x19>
            *s_++ = c;
  10012c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  100130:	48 89 57 10          	mov    %rdx,0x10(%rdi)
  100134:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  100137:	48 83 47 20 01       	addq   $0x1,0x20(%rdi)
    }
  10013c:	c3                   	ret

000000000010013d <memchr>:
void* memchr(const void* s, int c, size_t n) {
  10013d:	f3 0f 1e fa          	endbr64
  100141:	48 89 f8             	mov    %rdi,%rax
    for (ss = (const unsigned char*) s; n != 0; ++ss, --n) {
  100144:	48 85 d2             	test   %rdx,%rdx
  100147:	74 17                	je     100160 <memchr+0x23>
  100149:	48 01 fa             	add    %rdi,%rdx
        if (*ss == (unsigned char) c) {
  10014c:	40 38 30             	cmp    %sil,(%rax)
  10014f:	74 14                	je     100165 <memchr+0x28>
    for (ss = (const unsigned char*) s; n != 0; ++ss, --n) {
  100151:	48 83 c0 01          	add    $0x1,%rax
  100155:	48 39 c2             	cmp    %rax,%rdx
  100158:	75 f2                	jne    10014c <memchr+0xf>
    return nullptr;
  10015a:	b8 00 00 00 00       	mov    $0x0,%eax
  10015f:	c3                   	ret
  100160:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100165:	c3                   	ret

0000000000100166 <strlen>:
size_t strlen(const char* s) {
  100166:	f3 0f 1e fa          	endbr64
    for (n = 0; *s != '\0'; ++s) {
  10016a:	80 3f 00             	cmpb   $0x0,(%rdi)
  10016d:	74 10                	je     10017f <strlen+0x19>
  10016f:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  100174:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  100178:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  10017c:	75 f6                	jne    100174 <strlen+0xe>
  10017e:	c3                   	ret
  10017f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100184:	c3                   	ret

0000000000100185 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  100185:	f3 0f 1e fa          	endbr64
  100189:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  10018c:	ba 00 00 00 00       	mov    $0x0,%edx
  100191:	48 85 f6             	test   %rsi,%rsi
  100194:	74 10                	je     1001a6 <strnlen+0x21>
  100196:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  10019a:	74 0b                	je     1001a7 <strnlen+0x22>
        ++n;
  10019c:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1001a0:	48 39 d0             	cmp    %rdx,%rax
  1001a3:	75 f1                	jne    100196 <strnlen+0x11>
  1001a5:	c3                   	ret
  1001a6:	c3                   	ret
  1001a7:	48 89 d0             	mov    %rdx,%rax
}
  1001aa:	c3                   	ret

00000000001001ab <strchr>:
char* strchr(const char* s, int c) {
  1001ab:	f3 0f 1e fa          	endbr64
    while (*s != '\0' && *s != (char) c) {
  1001af:	0f b6 07             	movzbl (%rdi),%eax
  1001b2:	84 c0                	test   %al,%al
  1001b4:	74 10                	je     1001c6 <strchr+0x1b>
  1001b6:	40 38 f0             	cmp    %sil,%al
  1001b9:	74 18                	je     1001d3 <strchr+0x28>
        ++s;
  1001bb:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  1001bf:	0f b6 07             	movzbl (%rdi),%eax
  1001c2:	84 c0                	test   %al,%al
  1001c4:	75 f0                	jne    1001b6 <strchr+0xb>
        return (char*) s;
  1001c6:	40 84 f6             	test   %sil,%sil
  1001c9:	b8 00 00 00 00       	mov    $0x0,%eax
  1001ce:	48 0f 44 c7          	cmove  %rdi,%rax
}
  1001d2:	c3                   	ret
        return (char*) s;
  1001d3:	48 89 f8             	mov    %rdi,%rax
  1001d6:	c3                   	ret

00000000001001d7 <srand(unsigned int)>:
void srand(unsigned seed) {
  1001d7:	f3 0f 1e fa          	endbr64
    rand_seed = ((unsigned long) seed << 32) | seed;
  1001db:	89 f8                	mov    %edi,%eax
  1001dd:	48 c1 e7 20          	shl    $0x20,%rdi
  1001e1:	48 01 c7             	add    %rax,%rdi
	  = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_acquire);
	__glibcxx_assert(__b != memory_order_acq_rel);
	__glibcxx_assert(__b != memory_order_consume);

	__atomic_store_n(&_M_i, __i, int(__m));
  1001e4:	48 87 3d 25 2e 00 00 	xchg   %rdi,0x2e25(%rip)        # 103010 <rand_seed>
  1001eb:	b8 01 00 00 00       	mov    $0x1,%eax
  1001f0:	87 05 22 2e 00 00    	xchg   %eax,0x2e22(%rip)        # 103018 <rand_seed_set>
}
  1001f6:	c3                   	ret

00000000001001f7 <rand()>:
int rand() {
  1001f7:	f3 0f 1e fa          	endbr64
  1001fb:	55                   	push   %rbp
  1001fc:	48 89 e5             	mov    %rsp,%rbp
	memory_order __b __attribute__ ((__unused__))
	  = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_release);
	__glibcxx_assert(__b != memory_order_acq_rel);

	return __atomic_load_n(&_M_i, int(__m));
  1001ff:	8b 05 13 2e 00 00    	mov    0x2e13(%rip),%eax        # 103018 <rand_seed_set>
    if (!rand_seed_set) {
  100205:	85 c0                	test   %eax,%eax
  100207:	74 30                	je     100239 <rand()+0x42>
  100209:	48 8b 05 00 2e 00 00 	mov    0x2e00(%rip),%rax        # 103010 <rand_seed>
        next_rs = rs * 6364136223846793005UL + 1;
  100210:	48 b9 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rcx
  100217:	f4 51 58 
  10021a:	48 89 c2             	mov    %rax,%rdx
  10021d:	48 0f af d1          	imul   %rcx,%rdx
  100221:	48 83 c2 01          	add    $0x1,%rdx
      compare_exchange_weak(__int_type& __i1, __int_type __i2,
			    memory_order __m1, memory_order __m2) noexcept
      {
	__glibcxx_assert(__is_valid_cmpexch_failure_order(__m2));

	return __atomic_compare_exchange_n(&_M_i, &__i1, __i2, 1,
  100225:	f0 48 0f b1 15 e2 2d 	lock cmpxchg %rdx,0x2de2(%rip)        # 103010 <rand_seed>
  10022c:	00 00 
    } while (!rand_seed.compare_exchange_weak(rs, next_rs));
  10022e:	75 ea                	jne    10021a <rand()+0x23>
    return (next_rs >> 33) & RAND_MAX;
  100230:	48 c1 ea 21          	shr    $0x21,%rdx
  100234:	48 89 d0             	mov    %rdx,%rax
}
  100237:	5d                   	pop    %rbp
  100238:	c3                   	ret
        srand(819234718U);
  100239:	bf 9e 87 d4 30       	mov    $0x30d4879e,%edi
  10023e:	e8 94 ff ff ff       	call   1001d7 <srand(unsigned int)>
  100243:	eb c4                	jmp    100209 <rand()+0x12>

0000000000100245 <rand(int, int)>:
int rand(int min, int max) {
  100245:	f3 0f 1e fa          	endbr64
  100249:	55                   	push   %rbp
  10024a:	48 89 e5             	mov    %rsp,%rbp
  10024d:	41 55                	push   %r13
  10024f:	41 54                	push   %r12
  100251:	53                   	push   %rbx
  100252:	48 83 ec 08          	sub    $0x8,%rsp
    assert(min <= max);
  100256:	39 f7                	cmp    %esi,%edi
  100258:	7f 42                	jg     10029c <rand(int, int)+0x57>
  10025a:	41 89 fc             	mov    %edi,%r12d
  10025d:	89 f3                	mov    %esi,%ebx
    unsigned div = (unsigned(RAND_MAX) + 1) / (max - min + 1),
  10025f:	29 fb                	sub    %edi,%ebx
  100261:	83 c3 01             	add    $0x1,%ebx
  100264:	b8 00 00 00 80       	mov    $0x80000000,%eax
  100269:	ba 00 00 00 00       	mov    $0x0,%edx
  10026e:	f7 f3                	div    %ebx
  100270:	41 89 c5             	mov    %eax,%r13d
        top = div * (max - min + 1);
  100273:	0f af d8             	imul   %eax,%ebx
    assert(top > 0 && top <= unsigned(RAND_MAX) + 1);
  100276:	89 d8                	mov    %ebx,%eax
  100278:	83 e8 01             	sub    $0x1,%eax
  10027b:	78 38                	js     1002b5 <rand(int, int)+0x70>
        unsigned r = rand();
  10027d:	e8 75 ff ff ff       	call   1001f7 <rand()>
        if (r < top) {
  100282:	39 d8                	cmp    %ebx,%eax
  100284:	73 f7                	jae    10027d <rand(int, int)+0x38>
            return min + r / div;
  100286:	ba 00 00 00 00       	mov    $0x0,%edx
  10028b:	41 f7 f5             	div    %r13d
  10028e:	44 01 e0             	add    %r12d,%eax
}
  100291:	48 83 c4 08          	add    $0x8,%rsp
  100295:	5b                   	pop    %rbx
  100296:	41 5c                	pop    %r12
  100298:	41 5d                	pop    %r13
  10029a:	5d                   	pop    %rbp
  10029b:	c3                   	ret
    assert(min <= max);
  10029c:	b9 00 00 00 00       	mov    $0x0,%ecx
  1002a1:	ba 9a 0d 10 00       	mov    $0x100d9a,%edx
  1002a6:	be 49 01 00 00       	mov    $0x149,%esi
  1002ab:	bf a5 0d 10 00       	mov    $0x100da5,%edi
  1002b0:	e8 6e 09 00 00       	call   100c23 <assert_fail(char const*, int, char const*, char const*)>
    assert(top > 0 && top <= unsigned(RAND_MAX) + 1);
  1002b5:	b9 00 00 00 00       	mov    $0x0,%ecx
  1002ba:	ba d8 0c 10 00       	mov    $0x100cd8,%edx
  1002bf:	be 4e 01 00 00       	mov    $0x14e,%esi
  1002c4:	bf a5 0d 10 00       	mov    $0x100da5,%edi
  1002c9:	e8 55 09 00 00       	call   100c23 <assert_fail(char const*, int, char const*, char const*)>

00000000001002ce <printer::vprintf(char const*, __va_list_tag*)>:
void printer::vprintf(const char* format, va_list val) {
  1002ce:	f3 0f 1e fa          	endbr64
  1002d2:	55                   	push   %rbp
  1002d3:	48 89 e5             	mov    %rsp,%rbp
  1002d6:	41 57                	push   %r15
  1002d8:	41 56                	push   %r14
  1002da:	41 55                	push   %r13
  1002dc:	41 54                	push   %r12
  1002de:	53                   	push   %rbx
  1002df:	48 83 ec 48          	sub    $0x48,%rsp
  1002e3:	49 89 ff             	mov    %rdi,%r15
  1002e6:	49 89 f4             	mov    %rsi,%r12
  1002e9:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
    for (; *format; ++format) {
  1002ed:	0f b6 06             	movzbl (%rsi),%eax
  1002f0:	84 c0                	test   %al,%al
  1002f2:	0f 85 94 05 00 00    	jne    10088c <printer::vprintf(char const*, __va_list_tag*)+0x5be>
}
  1002f8:	48 83 c4 48          	add    $0x48,%rsp
  1002fc:	5b                   	pop    %rbx
  1002fd:	41 5c                	pop    %r12
  1002ff:	41 5d                	pop    %r13
  100301:	41 5e                	pop    %r14
  100303:	41 5f                	pop    %r15
  100305:	5d                   	pop    %rbp
  100306:	c3                   	ret
        for (++format; *format; ++format) {
  100307:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  10030c:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
  100312:	45 84 e4             	test   %r12b,%r12b
  100315:	0f 84 01 01 00 00    	je     10041c <printer::vprintf(char const*, __va_list_tag*)+0x14e>
        int flags = 0;
  10031b:	41 be 00 00 00 00    	mov    $0x0,%r14d
            const char* flagc = strchr(flag_chars, *format);
  100321:	41 0f be f4          	movsbl %r12b,%esi
  100325:	bf e1 24 10 00       	mov    $0x1024e1,%edi
  10032a:	e8 7c fe ff ff       	call   1001ab <strchr>
  10032f:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  100332:	48 85 c0             	test   %rax,%rax
  100335:	74 70                	je     1003a7 <printer::vprintf(char const*, __va_list_tag*)+0xd9>
                flags |= 1 << (flagc - flag_chars);
  100337:	48 81 e9 e1 24 10 00 	sub    $0x1024e1,%rcx
  10033e:	b8 01 00 00 00       	mov    $0x1,%eax
  100343:	d3 e0                	shl    %cl,%eax
  100345:	41 09 c6             	or     %eax,%r14d
        for (++format; *format; ++format) {
  100348:	48 83 c3 01          	add    $0x1,%rbx
  10034c:	44 0f b6 23          	movzbl (%rbx),%r12d
  100350:	45 84 e4             	test   %r12b,%r12b
  100353:	75 cc                	jne    100321 <printer::vprintf(char const*, __va_list_tag*)+0x53>
        int width = -1;
  100355:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
  10035b:	c7 45 a4 ff ff ff ff 	movl   $0xffffffff,-0x5c(%rbp)
        if (*format == '.') {
  100362:	80 3b 2e             	cmpb   $0x2e,(%rbx)
  100365:	0f 84 d8 00 00 00    	je     100443 <printer::vprintf(char const*, __va_list_tag*)+0x175>
        switch (*format) {
  10036b:	0f b6 03             	movzbl (%rbx),%eax
  10036e:	3c 6c                	cmp    $0x6c,%al
  100370:	0f 84 73 01 00 00    	je     1004e9 <printer::vprintf(char const*, __va_list_tag*)+0x21b>
  100376:	0f 8f 4e 01 00 00    	jg     1004ca <printer::vprintf(char const*, __va_list_tag*)+0x1fc>
  10037c:	3c 68                	cmp    $0x68,%al
  10037e:	0f 85 88 01 00 00    	jne    10050c <printer::vprintf(char const*, __va_list_tag*)+0x23e>
            ++format;
  100384:	48 8d 43 01          	lea    0x1(%rbx),%rax
  100388:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  10038c:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  100390:	8d 50 bd             	lea    -0x43(%rax),%edx
  100393:	80 fa 35             	cmp    $0x35,%dl
  100396:	0f 87 a6 05 00 00    	ja     100942 <printer::vprintf(char const*, __va_list_tag*)+0x674>
  10039c:	0f b6 d2             	movzbl %dl,%edx
  10039f:	3e ff 24 d5 f0 1d 10 	notrack jmp *0x101df0(,%rdx,8)
  1003a6:	00 
        if (*format >= '1' && *format <= '9') {
  1003a7:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
  1003ac:	3c 08                	cmp    $0x8,%al
  1003ae:	77 32                	ja     1003e2 <printer::vprintf(char const*, __va_list_tag*)+0x114>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1003b0:	0f b6 03             	movzbl (%rbx),%eax
  1003b3:	8d 50 d0             	lea    -0x30(%rax),%edx
  1003b6:	80 fa 09             	cmp    $0x9,%dl
  1003b9:	77 72                	ja     10042d <printer::vprintf(char const*, __va_list_tag*)+0x15f>
  1003bb:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
  1003c1:	48 83 c3 01          	add    $0x1,%rbx
  1003c5:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
  1003ca:	0f be c0             	movsbl %al,%eax
  1003cd:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1003d2:	0f b6 03             	movzbl (%rbx),%eax
  1003d5:	8d 50 d0             	lea    -0x30(%rax),%edx
  1003d8:	80 fa 09             	cmp    $0x9,%dl
  1003db:	76 e4                	jbe    1003c1 <printer::vprintf(char const*, __va_list_tag*)+0xf3>
  1003dd:	e9 79 ff ff ff       	jmp    10035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
        } else if (*format == '*') {
  1003e2:	41 80 fc 2a          	cmp    $0x2a,%r12b
  1003e6:	75 50                	jne    100438 <printer::vprintf(char const*, __va_list_tag*)+0x16a>
            width = va_arg(val, int);
  1003e8:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1003ec:	8b 01                	mov    (%rcx),%eax
  1003ee:	83 f8 2f             	cmp    $0x2f,%eax
  1003f1:	77 17                	ja     10040a <printer::vprintf(char const*, __va_list_tag*)+0x13c>
  1003f3:	89 c2                	mov    %eax,%edx
  1003f5:	48 03 51 10          	add    0x10(%rcx),%rdx
  1003f9:	83 c0 08             	add    $0x8,%eax
  1003fc:	89 01                	mov    %eax,(%rcx)
  1003fe:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
  100401:	48 83 c3 01          	add    $0x1,%rbx
  100405:	e9 51 ff ff ff       	jmp    10035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            width = va_arg(val, int);
  10040a:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  10040e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100412:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100416:	48 89 41 08          	mov    %rax,0x8(%rcx)
  10041a:	eb e2                	jmp    1003fe <printer::vprintf(char const*, __va_list_tag*)+0x130>
        int flags = 0;
  10041c:	41 be 00 00 00 00    	mov    $0x0,%r14d
        int width = -1;
  100422:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  100428:	e9 2e ff ff ff       	jmp    10035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  10042d:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  100433:	e9 23 ff ff ff       	jmp    10035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
        int width = -1;
  100438:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
  10043e:	e9 18 ff ff ff       	jmp    10035b <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            ++format;
  100443:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
  100447:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  10044b:	8d 48 d0             	lea    -0x30(%rax),%ecx
  10044e:	80 f9 09             	cmp    $0x9,%cl
  100451:	76 13                	jbe    100466 <printer::vprintf(char const*, __va_list_tag*)+0x198>
            } else if (*format == '*') {
  100453:	3c 2a                	cmp    $0x2a,%al
  100455:	74 33                	je     10048a <printer::vprintf(char const*, __va_list_tag*)+0x1bc>
            ++format;
  100457:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
  10045a:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
  100461:	e9 05 ff ff ff       	jmp    10036b <printer::vprintf(char const*, __va_list_tag*)+0x9d>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  100466:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  10046b:	48 83 c2 01          	add    $0x1,%rdx
  10046f:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  100472:	0f be c0             	movsbl %al,%eax
  100475:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  100479:	0f b6 02             	movzbl (%rdx),%eax
  10047c:	8d 70 d0             	lea    -0x30(%rax),%esi
  10047f:	40 80 fe 09          	cmp    $0x9,%sil
  100483:	76 e6                	jbe    10046b <printer::vprintf(char const*, __va_list_tag*)+0x19d>
  100485:	48 89 d3             	mov    %rdx,%rbx
  100488:	eb 1c                	jmp    1004a6 <printer::vprintf(char const*, __va_list_tag*)+0x1d8>
                precision = va_arg(val, int);
  10048a:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  10048e:	8b 07                	mov    (%rdi),%eax
  100490:	83 f8 2f             	cmp    $0x2f,%eax
  100493:	77 23                	ja     1004b8 <printer::vprintf(char const*, __va_list_tag*)+0x1ea>
  100495:	89 c2                	mov    %eax,%edx
  100497:	48 03 57 10          	add    0x10(%rdi),%rdx
  10049b:	83 c0 08             	add    $0x8,%eax
  10049e:	89 07                	mov    %eax,(%rdi)
  1004a0:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  1004a2:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
  1004a6:	85 c9                	test   %ecx,%ecx
  1004a8:	b8 00 00 00 00       	mov    $0x0,%eax
  1004ad:	0f 49 c1             	cmovns %ecx,%eax
  1004b0:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1004b3:	e9 b3 fe ff ff       	jmp    10036b <printer::vprintf(char const*, __va_list_tag*)+0x9d>
                precision = va_arg(val, int);
  1004b8:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1004bc:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1004c0:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1004c4:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1004c8:	eb d6                	jmp    1004a0 <printer::vprintf(char const*, __va_list_tag*)+0x1d2>
        switch (*format) {
  1004ca:	3c 74                	cmp    $0x74,%al
  1004cc:	74 1b                	je     1004e9 <printer::vprintf(char const*, __va_list_tag*)+0x21b>
  1004ce:	3c 7a                	cmp    $0x7a,%al
  1004d0:	74 17                	je     1004e9 <printer::vprintf(char const*, __va_list_tag*)+0x21b>
        switch (*format) {
  1004d2:	8d 50 bd             	lea    -0x43(%rax),%edx
  1004d5:	80 fa 35             	cmp    $0x35,%dl
  1004d8:	0f 87 5e 06 00 00    	ja     100b3c <printer::vprintf(char const*, __va_list_tag*)+0x86e>
  1004de:	0f b6 d2             	movzbl %dl,%edx
  1004e1:	3e ff 24 d5 a0 1f 10 	notrack jmp *0x101fa0(,%rdx,8)
  1004e8:	00 
            ++format;
  1004e9:	48 8d 43 01          	lea    0x1(%rbx),%rax
  1004ed:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  1004f1:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1004f5:	8d 50 bd             	lea    -0x43(%rax),%edx
  1004f8:	80 fa 35             	cmp    $0x35,%dl
  1004fb:	0f 87 41 04 00 00    	ja     100942 <printer::vprintf(char const*, __va_list_tag*)+0x674>
  100501:	0f b6 d2             	movzbl %dl,%edx
  100504:	3e ff 24 d5 50 21 10 	notrack jmp *0x102150(,%rdx,8)
  10050b:	00 
  10050c:	8d 50 bd             	lea    -0x43(%rax),%edx
  10050f:	80 fa 35             	cmp    $0x35,%dl
  100512:	0f 87 26 04 00 00    	ja     10093e <printer::vprintf(char const*, __va_list_tag*)+0x670>
  100518:	0f b6 d2             	movzbl %dl,%edx
  10051b:	3e ff 24 d5 00 23 10 	notrack jmp *0x102300(,%rdx,8)
  100522:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100523:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100527:	8b 07                	mov    (%rdi),%eax
  100529:	83 f8 2f             	cmp    $0x2f,%eax
  10052c:	77 36                	ja     100564 <printer::vprintf(char const*, __va_list_tag*)+0x296>
  10052e:	89 c2                	mov    %eax,%edx
  100530:	48 03 57 10          	add    0x10(%rdi),%rdx
  100534:	83 c0 08             	add    $0x8,%eax
  100537:	89 07                	mov    %eax,(%rdi)
  100539:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  10053c:	48 89 d0             	mov    %rdx,%rax
  10053f:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  100543:	49 89 d3             	mov    %rdx,%r11
  100546:	49 f7 db             	neg    %r11
  100549:	25 00 01 00 00       	and    $0x100,%eax
  10054e:	4c 0f 44 da          	cmove  %rdx,%r11
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  100552:	44 09 f0             	or     %r14d,%eax
  100555:	0c c0                	or     $0xc0,%al
  100557:	41 89 c6             	mov    %eax,%r14d
        const char* data = "";
  10055a:	bb b4 0d 10 00       	mov    $0x100db4,%ebx
            break;
  10055f:	e9 f4 01 00 00       	jmp    100758 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100564:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100568:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  10056c:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100570:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100574:	eb c3                	jmp    100539 <printer::vprintf(char const*, __va_list_tag*)+0x26b>
        switch (*format) {
  100576:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  10057a:	eb 04                	jmp    100580 <printer::vprintf(char const*, __va_list_tag*)+0x2b2>
  10057c:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100580:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100584:	8b 01                	mov    (%rcx),%eax
  100586:	83 f8 2f             	cmp    $0x2f,%eax
  100589:	77 10                	ja     10059b <printer::vprintf(char const*, __va_list_tag*)+0x2cd>
  10058b:	89 c2                	mov    %eax,%edx
  10058d:	48 03 51 10          	add    0x10(%rcx),%rdx
  100591:	83 c0 08             	add    $0x8,%eax
  100594:	89 01                	mov    %eax,(%rcx)
  100596:	48 63 12             	movslq (%rdx),%rdx
  100599:	eb a1                	jmp    10053c <printer::vprintf(char const*, __va_list_tag*)+0x26e>
  10059b:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  10059f:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1005a3:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1005a7:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1005ab:	eb e9                	jmp    100596 <printer::vprintf(char const*, __va_list_tag*)+0x2c8>
        switch (*format) {
  1005ad:	b8 01 00 00 00       	mov    $0x1,%eax
  1005b2:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  1005b9:	e9 9d 00 00 00       	jmp    10065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  1005be:	b8 00 00 00 00       	mov    $0x0,%eax
  1005c3:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  1005ca:	e9 8c 00 00 00       	jmp    10065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  1005cf:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1005d3:	b8 00 00 00 00       	mov    $0x0,%eax
  1005d8:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  1005df:	eb 7a                	jmp    10065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
  1005e1:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1005e5:	b8 00 00 00 00       	mov    $0x0,%eax
  1005ea:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
  1005f1:	eb 68                	jmp    10065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1005f3:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1005f7:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1005fb:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1005ff:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100603:	eb 70                	jmp    100675 <printer::vprintf(char const*, __va_list_tag*)+0x3a7>
  100605:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100609:	8b 07                	mov    (%rdi),%eax
  10060b:	83 f8 2f             	cmp    $0x2f,%eax
  10060e:	77 10                	ja     100620 <printer::vprintf(char const*, __va_list_tag*)+0x352>
  100610:	89 c2                	mov    %eax,%edx
  100612:	48 03 57 10          	add    0x10(%rdi),%rdx
  100616:	83 c0 08             	add    $0x8,%eax
  100619:	89 07                	mov    %eax,(%rdi)
  10061b:	44 8b 1a             	mov    (%rdx),%r11d
  10061e:	eb 58                	jmp    100678 <printer::vprintf(char const*, __va_list_tag*)+0x3aa>
  100620:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100624:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100628:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10062c:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100630:	eb e9                	jmp    10061b <printer::vprintf(char const*, __va_list_tag*)+0x34d>
        switch (*format) {
  100632:	b8 01 00 00 00       	mov    $0x1,%eax
  100637:	eb 1b                	jmp    100654 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  100639:	b8 00 00 00 00       	mov    $0x0,%eax
  10063e:	eb 14                	jmp    100654 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  100640:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100644:	b8 00 00 00 00       	mov    $0x0,%eax
  100649:	eb 09                	jmp    100654 <printer::vprintf(char const*, __va_list_tag*)+0x386>
  10064b:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  10064f:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  100654:	c7 45 a0 f0 ff ff ff 	movl   $0xfffffff0,-0x60(%rbp)
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  10065b:	85 c0                	test   %eax,%eax
  10065d:	74 a6                	je     100605 <printer::vprintf(char const*, __va_list_tag*)+0x337>
  10065f:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  100663:	8b 07                	mov    (%rdi),%eax
  100665:	83 f8 2f             	cmp    $0x2f,%eax
  100668:	77 89                	ja     1005f3 <printer::vprintf(char const*, __va_list_tag*)+0x325>
  10066a:	89 c2                	mov    %eax,%edx
  10066c:	48 03 57 10          	add    0x10(%rdi),%rdx
  100670:	83 c0 08             	add    $0x8,%eax
  100673:	89 07                	mov    %eax,(%rdi)
  100675:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_NUMERIC;
  100678:	44 89 f0             	mov    %r14d,%eax
  10067b:	83 c8 40             	or     $0x40,%eax
    if (base < 0) {
  10067e:	83 7d a0 00          	cmpl   $0x0,-0x60(%rbp)
  100682:	0f 89 de 02 00 00    	jns    100966 <printer::vprintf(char const*, __va_list_tag*)+0x698>
    *--pos = '\0';
  100688:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  10068c:	a8 20                	test   $0x20,%al
  10068e:	0f 85 01 03 00 00    	jne    100995 <printer::vprintf(char const*, __va_list_tag*)+0x6c7>
  100694:	41 89 c6             	mov    %eax,%r14d
        digits = lower_digits;
  100697:	41 ba b0 24 10 00    	mov    $0x1024b0,%r10d
        base = -base;
  10069d:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  1006a3:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = nullptr;
  1006aa:	bf 00 00 00 00       	mov    $0x0,%edi
  1006af:	e9 03 03 00 00       	jmp    1009b7 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
        switch (*format) {
  1006b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1006b9:	eb 1b                	jmp    1006d6 <printer::vprintf(char const*, __va_list_tag*)+0x408>
  1006bb:	b8 00 00 00 00       	mov    $0x0,%eax
  1006c0:	eb 14                	jmp    1006d6 <printer::vprintf(char const*, __va_list_tag*)+0x408>
  1006c2:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1006c6:	b8 00 00 00 00       	mov    $0x0,%eax
  1006cb:	eb 09                	jmp    1006d6 <printer::vprintf(char const*, __va_list_tag*)+0x408>
  1006cd:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1006d1:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  1006d6:	c7 45 a0 10 00 00 00 	movl   $0x10,-0x60(%rbp)
            goto format_unsigned;
  1006dd:	e9 79 ff ff ff       	jmp    10065b <printer::vprintf(char const*, __va_list_tag*)+0x38d>
        switch (*format) {
  1006e2:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1006e6:	eb 04                	jmp    1006ec <printer::vprintf(char const*, __va_list_tag*)+0x41e>
  1006e8:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            num = (uintptr_t) va_arg(val, void*);
  1006ec:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1006f0:	8b 01                	mov    (%rcx),%eax
  1006f2:	83 f8 2f             	cmp    $0x2f,%eax
  1006f5:	77 22                	ja     100719 <printer::vprintf(char const*, __va_list_tag*)+0x44b>
  1006f7:	89 c2                	mov    %eax,%edx
  1006f9:	48 03 51 10          	add    0x10(%rcx),%rdx
  1006fd:	83 c0 08             	add    $0x8,%eax
  100700:	89 01                	mov    %eax,(%rcx)
  100702:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  100705:	44 89 f0             	mov    %r14d,%eax
  100708:	0d 41 02 00 00       	or     $0x241,%eax
            base = -16;
  10070d:	c7 45 a0 f0 ff ff ff 	movl   $0xfffffff0,-0x60(%rbp)
  100714:	e9 6f ff ff ff       	jmp    100688 <printer::vprintf(char const*, __va_list_tag*)+0x3ba>
            num = (uintptr_t) va_arg(val, void*);
  100719:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  10071d:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100721:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100725:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100729:	eb d7                	jmp    100702 <printer::vprintf(char const*, __va_list_tag*)+0x434>
        switch (*format) {
  10072b:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  10072f:	eb 04                	jmp    100735 <printer::vprintf(char const*, __va_list_tag*)+0x467>
  100731:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = va_arg(val, char*);
  100735:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100739:	8b 01                	mov    (%rcx),%eax
  10073b:	83 f8 2f             	cmp    $0x2f,%eax
  10073e:	0f 87 61 01 00 00    	ja     1008a5 <printer::vprintf(char const*, __va_list_tag*)+0x5d7>
  100744:	89 c2                	mov    %eax,%edx
  100746:	48 03 51 10          	add    0x10(%rcx),%rdx
  10074a:	83 c0 08             	add    $0x8,%eax
  10074d:	89 01                	mov    %eax,(%rcx)
  10074f:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  100752:	41 bb 00 00 00 00    	mov    $0x0,%r11d
        if (flags & FLAG_NUMERIC) {
  100758:	44 89 f0             	mov    %r14d,%eax
  10075b:	83 e0 40             	and    $0x40,%eax
  10075e:	89 45 94             	mov    %eax,-0x6c(%rbp)
        const char* prefix = "";
  100761:	41 bc b4 0d 10 00    	mov    $0x100db4,%r12d
        if (flags & FLAG_NUMERIC) {
  100767:	0f 85 e9 03 00 00    	jne    100b56 <printer::vprintf(char const*, __va_list_tag*)+0x888>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  10076d:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  100770:	89 d0                	mov    %edx,%eax
  100772:	f7 d0                	not    %eax
  100774:	c1 e8 1f             	shr    $0x1f,%eax
  100777:	89 45 90             	mov    %eax,-0x70(%rbp)
  10077a:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
  10077e:	0f 85 54 03 00 00    	jne    100ad8 <printer::vprintf(char const*, __va_list_tag*)+0x80a>
  100784:	84 c0                	test   %al,%al
  100786:	0f 84 4c 03 00 00    	je     100ad8 <printer::vprintf(char const*, __va_list_tag*)+0x80a>
            datalen = strnlen(data, precision);
  10078c:	48 63 f2             	movslq %edx,%rsi
  10078f:	48 89 df             	mov    %rbx,%rdi
  100792:	e8 ee f9 ff ff       	call   100185 <strnlen>
  100797:	89 45 a0             	mov    %eax,-0x60(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  10079a:	44 89 f0             	mov    %r14d,%eax
  10079d:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  1007a0:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  1007a7:	83 f8 42             	cmp    $0x42,%eax
  1007aa:	0f 84 60 03 00 00    	je     100b10 <printer::vprintf(char const*, __va_list_tag*)+0x842>
        width -= datalen + zeros + strlen(prefix);
  1007b0:	4c 89 e7             	mov    %r12,%rdi
  1007b3:	e8 ae f9 ff ff       	call   100166 <strlen>
  1007b8:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  1007bb:	8b 7d a0             	mov    -0x60(%rbp),%edi
  1007be:	8d 0c 3a             	lea    (%rdx,%rdi,1),%ecx
  1007c1:	44 89 ea             	mov    %r13d,%edx
  1007c4:	29 ca                	sub    %ecx,%edx
  1007c6:	29 c2                	sub    %eax,%edx
  1007c8:	41 89 d5             	mov    %edx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1007cb:	41 f6 c6 04          	test   $0x4,%r14b
  1007cf:	75 31                	jne    100802 <printer::vprintf(char const*, __va_list_tag*)+0x534>
  1007d1:	85 d2                	test   %edx,%edx
  1007d3:	7e 2d                	jle    100802 <printer::vprintf(char const*, __va_list_tag*)+0x534>
        width -= datalen + zeros + strlen(prefix);
  1007d5:	41 89 d6             	mov    %edx,%r14d
            putc(' ');
  1007d8:	49 8b 07             	mov    (%r15),%rax
  1007db:	be 20 00 00 00       	mov    $0x20,%esi
  1007e0:	4c 89 ff             	mov    %r15,%rdi
  1007e3:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1007e5:	41 83 ed 01          	sub    $0x1,%r13d
  1007e9:	45 85 ed             	test   %r13d,%r13d
  1007ec:	7f ea                	jg     1007d8 <printer::vprintf(char const*, __va_list_tag*)+0x50a>
  1007ee:	44 89 f2             	mov    %r14d,%edx
  1007f1:	45 85 f6             	test   %r14d,%r14d
  1007f4:	b8 01 00 00 00       	mov    $0x1,%eax
  1007f9:	41 0f 4f c6          	cmovg  %r14d,%eax
  1007fd:	29 c2                	sub    %eax,%edx
  1007ff:	41 89 d5             	mov    %edx,%r13d
        for (; *prefix; ++prefix) {
  100802:	41 0f b6 04 24       	movzbl (%r12),%eax
  100807:	84 c0                	test   %al,%al
  100809:	74 18                	je     100823 <printer::vprintf(char const*, __va_list_tag*)+0x555>
            putc(*prefix);
  10080b:	0f b6 f0             	movzbl %al,%esi
  10080e:	49 8b 07             	mov    (%r15),%rax
  100811:	4c 89 ff             	mov    %r15,%rdi
  100814:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  100816:	49 83 c4 01          	add    $0x1,%r12
  10081a:	41 0f b6 04 24       	movzbl (%r12),%eax
  10081f:	84 c0                	test   %al,%al
  100821:	75 e8                	jne    10080b <printer::vprintf(char const*, __va_list_tag*)+0x53d>
        for (; zeros > 0; --zeros) {
  100823:	44 8b 65 a4          	mov    -0x5c(%rbp),%r12d
  100827:	45 85 e4             	test   %r12d,%r12d
  10082a:	7e 13                	jle    10083f <printer::vprintf(char const*, __va_list_tag*)+0x571>
            putc('0');
  10082c:	49 8b 07             	mov    (%r15),%rax
  10082f:	be 30 00 00 00       	mov    $0x30,%esi
  100834:	4c 89 ff             	mov    %r15,%rdi
  100837:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  100839:	41 83 ec 01          	sub    $0x1,%r12d
  10083d:	75 ed                	jne    10082c <printer::vprintf(char const*, __va_list_tag*)+0x55e>
        for (; datalen > 0; ++data, --datalen) {
  10083f:	8b 45 a0             	mov    -0x60(%rbp),%eax
  100842:	85 c0                	test   %eax,%eax
  100844:	7e 1a                	jle    100860 <printer::vprintf(char const*, __va_list_tag*)+0x592>
  100846:	41 89 c6             	mov    %eax,%r14d
  100849:	49 01 de             	add    %rbx,%r14
            putc(*data);
  10084c:	0f b6 33             	movzbl (%rbx),%esi
  10084f:	49 8b 07             	mov    (%r15),%rax
  100852:	4c 89 ff             	mov    %r15,%rdi
  100855:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  100857:	48 83 c3 01          	add    $0x1,%rbx
  10085b:	49 39 de             	cmp    %rbx,%r14
  10085e:	75 ec                	jne    10084c <printer::vprintf(char const*, __va_list_tag*)+0x57e>
        for (; width > 0; --width) {
  100860:	45 85 ed             	test   %r13d,%r13d
  100863:	7e 13                	jle    100878 <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            putc(' ');
  100865:	49 8b 07             	mov    (%r15),%rax
  100868:	be 20 00 00 00       	mov    $0x20,%esi
  10086d:	4c 89 ff             	mov    %r15,%rdi
  100870:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  100872:	41 83 ed 01          	sub    $0x1,%r13d
  100876:	75 ed                	jne    100865 <printer::vprintf(char const*, __va_list_tag*)+0x597>
    for (; *format; ++format) {
  100878:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  10087c:	4c 8d 60 01          	lea    0x1(%rax),%r12
  100880:	0f b6 40 01          	movzbl 0x1(%rax),%eax
  100884:	84 c0                	test   %al,%al
  100886:	0f 84 6c fa ff ff    	je     1002f8 <printer::vprintf(char const*, __va_list_tag*)+0x2a>
        if (*format != '%') {
  10088c:	3c 25                	cmp    $0x25,%al
  10088e:	0f 84 73 fa ff ff    	je     100307 <printer::vprintf(char const*, __va_list_tag*)+0x39>
            putc(*format);
  100894:	0f b6 f0             	movzbl %al,%esi
  100897:	49 8b 07             	mov    (%r15),%rax
  10089a:	4c 89 ff             	mov    %r15,%rdi
  10089d:	ff 10                	call   *(%rax)
            continue;
  10089f:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
  1008a3:	eb d3                	jmp    100878 <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            data = va_arg(val, char*);
  1008a5:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  1008a9:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1008ad:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1008b1:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1008b5:	e9 95 fe ff ff       	jmp    10074f <printer::vprintf(char const*, __va_list_tag*)+0x481>
        switch (*format) {
  1008ba:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1008be:	eb 04                	jmp    1008c4 <printer::vprintf(char const*, __va_list_tag*)+0x5f6>
  1008c0:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            color_ = va_arg(val, int);
  1008c4:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1008c8:	8b 07                	mov    (%rdi),%eax
  1008ca:	83 f8 2f             	cmp    $0x2f,%eax
  1008cd:	77 13                	ja     1008e2 <printer::vprintf(char const*, __va_list_tag*)+0x614>
  1008cf:	89 c2                	mov    %eax,%edx
  1008d1:	48 03 57 10          	add    0x10(%rdi),%rdx
  1008d5:	83 c0 08             	add    $0x8,%eax
  1008d8:	89 07                	mov    %eax,(%rdi)
  1008da:	8b 02                	mov    (%rdx),%eax
  1008dc:	41 89 47 08          	mov    %eax,0x8(%r15)
            continue;
  1008e0:	eb 96                	jmp    100878 <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            color_ = va_arg(val, int);
  1008e2:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  1008e6:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1008ea:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1008ee:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1008f2:	eb e6                	jmp    1008da <printer::vprintf(char const*, __va_list_tag*)+0x60c>
        switch (*format) {
  1008f4:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1008f8:	eb 04                	jmp    1008fe <printer::vprintf(char const*, __va_list_tag*)+0x630>
  1008fa:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = va_arg(val, int);
  1008fe:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100902:	8b 01                	mov    (%rcx),%eax
  100904:	83 f8 2f             	cmp    $0x2f,%eax
  100907:	77 23                	ja     10092c <printer::vprintf(char const*, __va_list_tag*)+0x65e>
  100909:	89 c2                	mov    %eax,%edx
  10090b:	48 03 51 10          	add    0x10(%rcx),%rdx
  10090f:	83 c0 08             	add    $0x8,%eax
  100912:	89 01                	mov    %eax,(%rcx)
  100914:	8b 02                	mov    (%rdx),%eax
  100916:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100919:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  10091d:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100921:	41 bb 00 00 00 00    	mov    $0x0,%r11d
            break;
  100927:	e9 2c fe ff ff       	jmp    100758 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
            numbuf[0] = va_arg(val, int);
  10092c:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  100930:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100934:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100938:	48 89 41 08          	mov    %rax,0x8(%rcx)
  10093c:	eb d6                	jmp    100914 <printer::vprintf(char const*, __va_list_tag*)+0x646>
        switch (*format) {
  10093e:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = (*format ? *format : '%');
  100942:	84 c0                	test   %al,%al
  100944:	0f 85 ee 01 00 00    	jne    100b38 <printer::vprintf(char const*, __va_list_tag*)+0x86a>
  10094a:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  10094e:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  100952:	48 83 6d a8 01       	subq   $0x1,-0x58(%rbp)
            data = numbuf;
  100957:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  10095b:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  100961:	e9 f2 fd ff ff       	jmp    100758 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
    *--pos = '\0';
  100966:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  10096a:	41 f6 c6 20          	test   $0x20,%r14b
  10096e:	74 73                	je     1009e3 <printer::vprintf(char const*, __va_list_tag*)+0x715>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100970:	8b 55 a0             	mov    -0x60(%rbp),%edx
  100973:	41 89 d1             	mov    %edx,%r9d
  100976:	41 89 c6             	mov    %eax,%r14d
  100979:	41 ba d0 24 10 00    	mov    $0x1024d0,%r10d
  10097f:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
  100986:	83 fa 0a             	cmp    $0xa,%edx
  100989:	0f 94 c0             	sete   %al
  10098c:	0f b6 c0             	movzbl %al,%eax
  10098f:	48 83 e8 04          	sub    $0x4,%rax
  100993:	eb 1d                	jmp    1009b2 <printer::vprintf(char const*, __va_list_tag*)+0x6e4>
    if (flags & FLAG_THOUSANDS) {
  100995:	41 89 c6             	mov    %eax,%r14d
        digits = lower_digits;
  100998:	41 ba b0 24 10 00    	mov    $0x1024b0,%r10d
        base = -base;
  10099e:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  1009a4:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1009ab:	48 c7 c0 fc ff ff ff 	mov    $0xfffffffffffffffc,%rax
  1009b2:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  1009b7:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  1009bb:	4c 89 d8             	mov    %r11,%rax
            *--pos = digits[val % base];
  1009be:	49 63 f1             	movslq %r9d,%rsi
    } while (val != 0 && pos != buf);
  1009c1:	4c 8d 45 b0          	lea    -0x50(%rbp),%r8
  1009c5:	eb 57                	jmp    100a1e <printer::vprintf(char const*, __va_list_tag*)+0x750>
    if (flags & FLAG_THOUSANDS) {
  1009c7:	41 ba d0 24 10 00    	mov    $0x1024d0,%r10d
  1009cd:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  1009d3:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1009da:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  1009e1:	eb cf                	jmp    1009b2 <printer::vprintf(char const*, __va_list_tag*)+0x6e4>
  1009e3:	44 8b 4d a0          	mov    -0x60(%rbp),%r9d
  1009e7:	41 89 c6             	mov    %eax,%r14d
  1009ea:	41 ba d0 24 10 00    	mov    $0x1024d0,%r10d
  1009f0:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = nullptr;
  1009f7:	bf 00 00 00 00       	mov    $0x0,%edi
  1009fc:	eb b9                	jmp    1009b7 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
            *--pos = digits[val % base];
  1009fe:	48 89 cb             	mov    %rcx,%rbx
  100a01:	ba 00 00 00 00       	mov    $0x0,%edx
  100a06:	48 f7 f6             	div    %rsi
  100a09:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
  100a0e:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  100a10:	48 83 e9 01          	sub    $0x1,%rcx
  100a14:	48 85 c0             	test   %rax,%rax
  100a17:	74 2d                	je     100a46 <printer::vprintf(char const*, __va_list_tag*)+0x778>
  100a19:	4c 39 c3             	cmp    %r8,%rbx
  100a1c:	74 28                	je     100a46 <printer::vprintf(char const*, __va_list_tag*)+0x778>
        if (pos == thousands_pos) {
  100a1e:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  100a22:	48 39 d7             	cmp    %rdx,%rdi
  100a25:	75 d7                	jne    1009fe <printer::vprintf(char const*, __va_list_tag*)+0x730>
            *--pos = base == 10 ? ',' : '\'';
  100a27:	48 89 cb             	mov    %rcx,%rbx
  100a2a:	41 83 f9 0a          	cmp    $0xa,%r9d
  100a2e:	0f 94 c2             	sete   %dl
  100a31:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  100a35:	40 0f 94 c7          	sete   %dil
  100a39:	40 0f b6 ff          	movzbl %dil,%edi
  100a3d:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  100a3f:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  100a44:	eb ca                	jmp    100a10 <printer::vprintf(char const*, __va_list_tag*)+0x742>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  100a46:	44 89 f0             	mov    %r14d,%eax
  100a49:	f7 d0                	not    %eax
  100a4b:	a8 c0                	test   $0xc0,%al
  100a4d:	75 3b                	jne    100a8a <printer::vprintf(char const*, __va_list_tag*)+0x7bc>
                prefix = "-";
  100a4f:	41 bc b1 0d 10 00    	mov    $0x100db1,%r12d
            if (flags & FLAG_NEGATIVE) {
  100a55:	41 f7 c6 00 01 00 00 	test   $0x100,%r14d
  100a5c:	0f 85 0b fd ff ff    	jne    10076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                prefix = "+";
  100a62:	41 bc ac 0d 10 00    	mov    $0x100dac,%r12d
            } else if (flags & FLAG_PLUSPOSITIVE) {
  100a68:	41 f6 c6 10          	test   $0x10,%r14b
  100a6c:	0f 85 fb fc ff ff    	jne    10076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
        const char* prefix = "";
  100a72:	41 f6 c6 08          	test   $0x8,%r14b
  100a76:	41 bc b3 0d 10 00    	mov    $0x100db3,%r12d
  100a7c:	b8 b4 0d 10 00       	mov    $0x100db4,%eax
  100a81:	4c 0f 44 e0          	cmove  %rax,%r12
  100a85:	e9 e3 fc ff ff       	jmp    10076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
  100a8a:	41 bc b4 0d 10 00    	mov    $0x100db4,%r12d
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100a90:	44 89 f0             	mov    %r14d,%eax
  100a93:	f7 d0                	not    %eax
  100a95:	a8 41                	test   $0x41,%al
  100a97:	0f 85 d0 fc ff ff    	jne    10076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                   && (base == 16 || base == -16)
  100a9d:	8b 45 a0             	mov    -0x60(%rbp),%eax
  100aa0:	83 c0 10             	add    $0x10,%eax
  100aa3:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  100aa8:	0f 85 bf fc ff ff    	jne    10076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                   && (num || (flags & FLAG_ALT2))) {
  100aae:	4d 85 db             	test   %r11,%r11
  100ab1:	75 0d                	jne    100ac0 <printer::vprintf(char const*, __va_list_tag*)+0x7f2>
  100ab3:	41 f7 c6 00 02 00 00 	test   $0x200,%r14d
  100aba:	0f 84 ad fc ff ff    	je     10076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
            prefix = (base == -16 ? "0x" : "0X");
  100ac0:	83 7d a0 f0          	cmpl   $0xfffffff0,-0x60(%rbp)
  100ac4:	41 bc ae 0d 10 00    	mov    $0x100dae,%r12d
  100aca:	b8 b5 0d 10 00       	mov    $0x100db5,%eax
  100acf:	4c 0f 44 e0          	cmove  %rax,%r12
  100ad3:	e9 95 fc ff ff       	jmp    10076d <printer::vprintf(char const*, __va_list_tag*)+0x49f>
            datalen = strlen(data);
  100ad8:	48 89 df             	mov    %rbx,%rdi
  100adb:	e8 86 f6 ff ff       	call   100166 <strlen>
  100ae0:	89 45 a0             	mov    %eax,-0x60(%rbp)
            && precision >= 0) {
  100ae3:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
  100ae7:	0f 84 ad fc ff ff    	je     10079a <printer::vprintf(char const*, __va_list_tag*)+0x4cc>
  100aed:	80 7d 90 00          	cmpb   $0x0,-0x70(%rbp)
  100af1:	0f 84 a3 fc ff ff    	je     10079a <printer::vprintf(char const*, __va_list_tag*)+0x4cc>
            zeros = precision > datalen ? precision - datalen : 0;
  100af7:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  100afa:	89 fa                	mov    %edi,%edx
  100afc:	29 c2                	sub    %eax,%edx
  100afe:	39 c7                	cmp    %eax,%edi
  100b00:	b8 00 00 00 00       	mov    $0x0,%eax
  100b05:	0f 4f c2             	cmovg  %edx,%eax
  100b08:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100b0b:	e9 a0 fc ff ff       	jmp    1007b0 <printer::vprintf(char const*, __va_list_tag*)+0x4e2>
                   && datalen + (int) strlen(prefix) < width) {
  100b10:	4c 89 e7             	mov    %r12,%rdi
  100b13:	e8 4e f6 ff ff       	call   100166 <strlen>
  100b18:	8b 7d a0             	mov    -0x60(%rbp),%edi
  100b1b:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  100b1e:	44 89 e9             	mov    %r13d,%ecx
  100b21:	29 f9                	sub    %edi,%ecx
  100b23:	29 c1                	sub    %eax,%ecx
  100b25:	44 39 ea             	cmp    %r13d,%edx
  100b28:	b8 00 00 00 00       	mov    $0x0,%eax
  100b2d:	0f 4c c1             	cmovl  %ecx,%eax
  100b30:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100b33:	e9 78 fc ff ff       	jmp    1007b0 <printer::vprintf(char const*, __va_list_tag*)+0x4e2>
  100b38:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
            numbuf[0] = (*format ? *format : '%');
  100b3c:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100b3f:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
  100b43:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = numbuf;
  100b47:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100b4b:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  100b51:	e9 02 fc ff ff       	jmp    100758 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
    *--pos = '\0';
  100b56:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100b5a:	41 f6 c6 20          	test   $0x20,%r14b
  100b5e:	0f 85 63 fe ff ff    	jne    1009c7 <printer::vprintf(char const*, __va_list_tag*)+0x6f9>
  100b64:	41 ba d0 24 10 00    	mov    $0x1024d0,%r10d
  100b6a:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  100b70:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
        thousands_pos = nullptr;
  100b77:	bf 00 00 00 00       	mov    $0x0,%edi
  100b7c:	e9 36 fe ff ff       	jmp    1009b7 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>

0000000000100b81 <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  100b81:	f3 0f 1e fa          	endbr64
  100b85:	55                   	push   %rbp
  100b86:	48 89 e5             	mov    %rsp,%rbp
  100b89:	53                   	push   %rbx
  100b8a:	48 83 ec 38          	sub    $0x38,%rsp
  100b8e:	48 89 f3             	mov    %rsi,%rbx
  100b91:	48 89 d6             	mov    %rdx,%rsi
  100b94:	48 89 ca             	mov    %rcx,%rdx
void console_printf(const char* format, ...);


// Generic print library

struct printer {
  100b97:	c7 45 d0 00 07 00 00 	movl   $0x700,-0x30(%rbp)
        : s_(s), end_(s + size), n_(0) {
  100b9e:	48 c7 45 c8 f8 24 10 	movq   $0x1024f8,-0x38(%rbp)
  100ba5:	00 
  100ba6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  100baa:	48 01 df             	add    %rbx,%rdi
  100bad:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  100bb1:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  100bb8:	00 
    string_printer sp(s, size);
    sp.vprintf(format, val);
  100bb9:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100bbd:	e8 0c f7 ff ff       	call   1002ce <printer::vprintf(char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  100bc2:	48 85 db             	test   %rbx,%rbx
  100bc5:	74 10                	je     100bd7 <vsnprintf+0x56>
  100bc7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  100bcb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  100bcf:	48 39 c2             	cmp    %rax,%rdx
  100bd2:	73 0d                	jae    100be1 <vsnprintf+0x60>
        *sp.s_ = 0;
  100bd4:	c6 02 00             	movb   $0x0,(%rdx)
    } else if (size) {
        sp.end_[-1] = 0;
    }
    return sp.n_;
}
  100bd7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  100bdb:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  100bdf:	c9                   	leave
  100be0:	c3                   	ret
        sp.end_[-1] = 0;
  100be1:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
  100be5:	eb f0                	jmp    100bd7 <vsnprintf+0x56>

0000000000100be7 <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  100be7:	f3 0f 1e fa          	endbr64
  100beb:	55                   	push   %rbp
  100bec:	48 89 e5             	mov    %rsp,%rbp
  100bef:	48 83 ec 50          	sub    $0x50,%rsp
  100bf3:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100bf7:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100bfb:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  100bff:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  100c06:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100c0a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100c0e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100c12:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  100c16:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100c1a:	e8 62 ff ff ff       	call   100b81 <vsnprintf>
    va_end(val);
    return n;
  100c1f:	48 98                	cltq
}
  100c21:	c9                   	leave
  100c22:	c3                   	ret

0000000000100c23 <assert_fail(char const*, int, char const*, char const*)>:
void error_vprintf(int cpos, int color, const char* format, va_list val) {
    console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  100c23:	f3 0f 1e fa          	endbr64
  100c27:	55                   	push   %rbp
  100c28:	48 89 e5             	mov    %rsp,%rbp
  100c2b:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  100c32:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  100c35:	c7 05 bd 83 fb ff 30 	movl   $0x730,-0x47c43(%rip)        # b8ffc <cursorpos>
  100c3c:	07 00 00 
    char buf[240];
    if (description) {
  100c3f:	48 85 c9             	test   %rcx,%rcx
  100c42:	74 39                	je     100c7d <assert_fail(char const*, int, char const*, char const*)+0x5a>
  100c44:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  100c47:	48 83 ec 08          	sub    $0x8,%rsp
  100c4b:	52                   	push   %rdx
  100c4c:	56                   	push   %rsi
  100c4d:	57                   	push   %rdi
  100c4e:	48 89 f9             	mov    %rdi,%rcx
  100c51:	ba 30 0d 10 00       	mov    $0x100d30,%edx
  100c56:	be f0 00 00 00       	mov    $0xf0,%esi
  100c5b:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100c62:	b0 00                	mov    $0x0,%al
  100c64:	e8 7e ff ff ff       	call   100be7 <snprintf>
  100c69:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  100c6d:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  100c72:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100c79:	0f 05                	syscall
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  100c7b:	eb fe                	jmp    100c7b <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  100c7d:	49 89 d1             	mov    %rdx,%r9
  100c80:	48 89 f9             	mov    %rdi,%rcx
  100c83:	ba 60 0d 10 00       	mov    $0x100d60,%edx
  100c88:	be f0 00 00 00       	mov    $0xf0,%esi
  100c8d:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100c94:	b0 00                	mov    $0x0,%al
  100c96:	e8 4c ff ff ff       	call   100be7 <snprintf>
  100c9b:	eb d0                	jmp    100c6d <assert_fail(char const*, int, char const*, char const*)+0x4a>

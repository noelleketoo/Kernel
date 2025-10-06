
obj/kernel.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000040000 <_kernel_start>:
   40000:	48 c7 c4 00 00 08 00 	mov    $0x80000,%rsp
   40007:	48 89 e5             	mov    %rsp,%rbp
   4000a:	6a 00                	push   $0x0
   4000c:	9d                   	popf
   4000d:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
   40012:	75 0d                	jne    40021 <_kernel_start+0x21>
   40014:	f7 03 04 00 00 00    	testl  $0x4,(%rbx)
   4001a:	74 05                	je     40021 <_kernel_start+0x21>
   4001c:	8b 7b 10             	mov    0x10(%rbx),%edi
   4001f:	eb 07                	jmp    40028 <_kernel_start+0x28>
   40021:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
   40028:	e9 ef 1b 00 00       	jmp    41c1c <kernel_start(char const*)>

000000000004002d <exception_entry_0>:
   4002d:	6a 00                	push   $0x0
   4002f:	6a 00                	push   $0x0
   40031:	e9 3c 0a 00 00       	jmp    40a72 <exception_entry()>

0000000000040036 <exception_entry_1>:
   40036:	6a 00                	push   $0x0
   40038:	6a 01                	push   $0x1
   4003a:	e9 33 0a 00 00       	jmp    40a72 <exception_entry()>

000000000004003f <exception_entry_2>:
   4003f:	6a 00                	push   $0x0
   40041:	6a 02                	push   $0x2
   40043:	e9 2a 0a 00 00       	jmp    40a72 <exception_entry()>

0000000000040048 <exception_entry_3>:
   40048:	6a 00                	push   $0x0
   4004a:	6a 03                	push   $0x3
   4004c:	e9 21 0a 00 00       	jmp    40a72 <exception_entry()>

0000000000040051 <exception_entry_4>:
   40051:	6a 00                	push   $0x0
   40053:	6a 04                	push   $0x4
   40055:	e9 18 0a 00 00       	jmp    40a72 <exception_entry()>

000000000004005a <exception_entry_5>:
   4005a:	6a 00                	push   $0x0
   4005c:	6a 05                	push   $0x5
   4005e:	e9 0f 0a 00 00       	jmp    40a72 <exception_entry()>

0000000000040063 <exception_entry_6>:
   40063:	6a 00                	push   $0x0
   40065:	6a 06                	push   $0x6
   40067:	e9 06 0a 00 00       	jmp    40a72 <exception_entry()>

000000000004006c <exception_entry_7>:
   4006c:	6a 00                	push   $0x0
   4006e:	6a 07                	push   $0x7
   40070:	e9 fd 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040075 <exception_entry_8>:
   40075:	6a 08                	push   $0x8
   40077:	e9 f6 09 00 00       	jmp    40a72 <exception_entry()>

000000000004007c <exception_entry_9>:
   4007c:	6a 00                	push   $0x0
   4007e:	6a 09                	push   $0x9
   40080:	e9 ed 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040085 <exception_entry_10>:
   40085:	6a 0a                	push   $0xa
   40087:	e9 e6 09 00 00       	jmp    40a72 <exception_entry()>

000000000004008c <exception_entry_11>:
   4008c:	6a 0b                	push   $0xb
   4008e:	e9 df 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040093 <exception_entry_12>:
   40093:	6a 0c                	push   $0xc
   40095:	e9 d8 09 00 00       	jmp    40a72 <exception_entry()>

000000000004009a <exception_entry_13>:
   4009a:	6a 0d                	push   $0xd
   4009c:	e9 d1 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400a1 <exception_entry_14>:
   400a1:	6a 0e                	push   $0xe
   400a3:	e9 ca 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400a8 <exception_entry_15>:
   400a8:	6a 00                	push   $0x0
   400aa:	6a 0f                	push   $0xf
   400ac:	e9 c1 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400b1 <exception_entry_16>:
   400b1:	6a 00                	push   $0x0
   400b3:	6a 10                	push   $0x10
   400b5:	e9 b8 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400ba <exception_entry_17>:
   400ba:	6a 11                	push   $0x11
   400bc:	e9 b1 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400c1 <exception_entry_18>:
   400c1:	6a 00                	push   $0x0
   400c3:	6a 12                	push   $0x12
   400c5:	e9 a8 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400ca <exception_entry_19>:
   400ca:	6a 00                	push   $0x0
   400cc:	6a 13                	push   $0x13
   400ce:	e9 9f 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400d3 <exception_entry_20>:
   400d3:	6a 00                	push   $0x0
   400d5:	6a 14                	push   $0x14
   400d7:	e9 96 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400dc <exception_entry_21>:
   400dc:	6a 00                	push   $0x0
   400de:	6a 15                	push   $0x15
   400e0:	e9 8d 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400e5 <exception_entry_22>:
   400e5:	6a 00                	push   $0x0
   400e7:	6a 16                	push   $0x16
   400e9:	e9 84 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400ee <exception_entry_23>:
   400ee:	6a 00                	push   $0x0
   400f0:	6a 17                	push   $0x17
   400f2:	e9 7b 09 00 00       	jmp    40a72 <exception_entry()>

00000000000400f7 <exception_entry_24>:
   400f7:	6a 00                	push   $0x0
   400f9:	6a 18                	push   $0x18
   400fb:	e9 72 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040100 <exception_entry_25>:
   40100:	6a 00                	push   $0x0
   40102:	6a 19                	push   $0x19
   40104:	e9 69 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040109 <exception_entry_26>:
   40109:	6a 00                	push   $0x0
   4010b:	6a 1a                	push   $0x1a
   4010d:	e9 60 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040112 <exception_entry_27>:
   40112:	6a 00                	push   $0x0
   40114:	6a 1b                	push   $0x1b
   40116:	e9 57 09 00 00       	jmp    40a72 <exception_entry()>

000000000004011b <exception_entry_28>:
   4011b:	6a 00                	push   $0x0
   4011d:	6a 1c                	push   $0x1c
   4011f:	e9 4e 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040124 <exception_entry_29>:
   40124:	6a 00                	push   $0x0
   40126:	6a 1d                	push   $0x1d
   40128:	e9 45 09 00 00       	jmp    40a72 <exception_entry()>

000000000004012d <exception_entry_30>:
   4012d:	6a 00                	push   $0x0
   4012f:	6a 1e                	push   $0x1e
   40131:	e9 3c 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040136 <exception_entry_31>:
   40136:	6a 00                	push   $0x0
   40138:	6a 1f                	push   $0x1f
   4013a:	e9 33 09 00 00       	jmp    40a72 <exception_entry()>

000000000004013f <exception_entry_32>:
   4013f:	6a 00                	push   $0x0
   40141:	6a 20                	push   $0x20
   40143:	e9 2a 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040148 <exception_entry_33>:
   40148:	6a 00                	push   $0x0
   4014a:	6a 21                	push   $0x21
   4014c:	e9 21 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040151 <exception_entry_34>:
   40151:	6a 00                	push   $0x0
   40153:	6a 22                	push   $0x22
   40155:	e9 18 09 00 00       	jmp    40a72 <exception_entry()>

000000000004015a <exception_entry_35>:
   4015a:	6a 00                	push   $0x0
   4015c:	6a 23                	push   $0x23
   4015e:	e9 0f 09 00 00       	jmp    40a72 <exception_entry()>

0000000000040163 <exception_entry_36>:
   40163:	6a 00                	push   $0x0
   40165:	6a 24                	push   $0x24
   40167:	e9 06 09 00 00       	jmp    40a72 <exception_entry()>

000000000004016c <exception_entry_37>:
   4016c:	6a 00                	push   $0x0
   4016e:	6a 25                	push   $0x25
   40170:	e9 fd 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040175 <exception_entry_38>:
   40175:	6a 00                	push   $0x0
   40177:	6a 26                	push   $0x26
   40179:	e9 f4 08 00 00       	jmp    40a72 <exception_entry()>

000000000004017e <exception_entry_39>:
   4017e:	6a 00                	push   $0x0
   40180:	6a 27                	push   $0x27
   40182:	e9 eb 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040187 <exception_entry_40>:
   40187:	6a 00                	push   $0x0
   40189:	6a 28                	push   $0x28
   4018b:	e9 e2 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040190 <exception_entry_41>:
   40190:	6a 00                	push   $0x0
   40192:	6a 29                	push   $0x29
   40194:	e9 d9 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040199 <exception_entry_42>:
   40199:	6a 00                	push   $0x0
   4019b:	6a 2a                	push   $0x2a
   4019d:	e9 d0 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401a2 <exception_entry_43>:
   401a2:	6a 00                	push   $0x0
   401a4:	6a 2b                	push   $0x2b
   401a6:	e9 c7 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401ab <exception_entry_44>:
   401ab:	6a 00                	push   $0x0
   401ad:	6a 2c                	push   $0x2c
   401af:	e9 be 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401b4 <exception_entry_45>:
   401b4:	6a 00                	push   $0x0
   401b6:	6a 2d                	push   $0x2d
   401b8:	e9 b5 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401bd <exception_entry_46>:
   401bd:	6a 00                	push   $0x0
   401bf:	6a 2e                	push   $0x2e
   401c1:	e9 ac 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401c6 <exception_entry_47>:
   401c6:	6a 00                	push   $0x0
   401c8:	6a 2f                	push   $0x2f
   401ca:	e9 a3 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401cf <exception_entry_48>:
   401cf:	6a 00                	push   $0x0
   401d1:	6a 30                	push   $0x30
   401d3:	e9 9a 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401d8 <exception_entry_49>:
   401d8:	6a 00                	push   $0x0
   401da:	6a 31                	push   $0x31
   401dc:	e9 91 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401e1 <exception_entry_50>:
   401e1:	6a 00                	push   $0x0
   401e3:	6a 32                	push   $0x32
   401e5:	e9 88 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401ea <exception_entry_51>:
   401ea:	6a 00                	push   $0x0
   401ec:	6a 33                	push   $0x33
   401ee:	e9 7f 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401f3 <exception_entry_52>:
   401f3:	6a 00                	push   $0x0
   401f5:	6a 34                	push   $0x34
   401f7:	e9 76 08 00 00       	jmp    40a72 <exception_entry()>

00000000000401fc <exception_entry_53>:
   401fc:	6a 00                	push   $0x0
   401fe:	6a 35                	push   $0x35
   40200:	e9 6d 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040205 <exception_entry_54>:
   40205:	6a 00                	push   $0x0
   40207:	6a 36                	push   $0x36
   40209:	e9 64 08 00 00       	jmp    40a72 <exception_entry()>

000000000004020e <exception_entry_55>:
   4020e:	6a 00                	push   $0x0
   40210:	6a 37                	push   $0x37
   40212:	e9 5b 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040217 <exception_entry_56>:
   40217:	6a 00                	push   $0x0
   40219:	6a 38                	push   $0x38
   4021b:	e9 52 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040220 <exception_entry_57>:
   40220:	6a 00                	push   $0x0
   40222:	6a 39                	push   $0x39
   40224:	e9 49 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040229 <exception_entry_58>:
   40229:	6a 00                	push   $0x0
   4022b:	6a 3a                	push   $0x3a
   4022d:	e9 40 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040232 <exception_entry_59>:
   40232:	6a 00                	push   $0x0
   40234:	6a 3b                	push   $0x3b
   40236:	e9 37 08 00 00       	jmp    40a72 <exception_entry()>

000000000004023b <exception_entry_60>:
   4023b:	6a 00                	push   $0x0
   4023d:	6a 3c                	push   $0x3c
   4023f:	e9 2e 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040244 <exception_entry_61>:
   40244:	6a 00                	push   $0x0
   40246:	6a 3d                	push   $0x3d
   40248:	e9 25 08 00 00       	jmp    40a72 <exception_entry()>

000000000004024d <exception_entry_62>:
   4024d:	6a 00                	push   $0x0
   4024f:	6a 3e                	push   $0x3e
   40251:	e9 1c 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040256 <exception_entry_63>:
   40256:	6a 00                	push   $0x0
   40258:	6a 3f                	push   $0x3f
   4025a:	e9 13 08 00 00       	jmp    40a72 <exception_entry()>

000000000004025f <exception_entry_64>:
   4025f:	6a 00                	push   $0x0
   40261:	6a 40                	push   $0x40
   40263:	e9 0a 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040268 <exception_entry_65>:
   40268:	6a 00                	push   $0x0
   4026a:	6a 41                	push   $0x41
   4026c:	e9 01 08 00 00       	jmp    40a72 <exception_entry()>

0000000000040271 <exception_entry_66>:
   40271:	6a 00                	push   $0x0
   40273:	6a 42                	push   $0x42
   40275:	e9 f8 07 00 00       	jmp    40a72 <exception_entry()>

000000000004027a <exception_entry_67>:
   4027a:	6a 00                	push   $0x0
   4027c:	6a 43                	push   $0x43
   4027e:	e9 ef 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040283 <exception_entry_68>:
   40283:	6a 00                	push   $0x0
   40285:	6a 44                	push   $0x44
   40287:	e9 e6 07 00 00       	jmp    40a72 <exception_entry()>

000000000004028c <exception_entry_69>:
   4028c:	6a 00                	push   $0x0
   4028e:	6a 45                	push   $0x45
   40290:	e9 dd 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040295 <exception_entry_70>:
   40295:	6a 00                	push   $0x0
   40297:	6a 46                	push   $0x46
   40299:	e9 d4 07 00 00       	jmp    40a72 <exception_entry()>

000000000004029e <exception_entry_71>:
   4029e:	6a 00                	push   $0x0
   402a0:	6a 47                	push   $0x47
   402a2:	e9 cb 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402a7 <exception_entry_72>:
   402a7:	6a 00                	push   $0x0
   402a9:	6a 48                	push   $0x48
   402ab:	e9 c2 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402b0 <exception_entry_73>:
   402b0:	6a 00                	push   $0x0
   402b2:	6a 49                	push   $0x49
   402b4:	e9 b9 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402b9 <exception_entry_74>:
   402b9:	6a 00                	push   $0x0
   402bb:	6a 4a                	push   $0x4a
   402bd:	e9 b0 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402c2 <exception_entry_75>:
   402c2:	6a 00                	push   $0x0
   402c4:	6a 4b                	push   $0x4b
   402c6:	e9 a7 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402cb <exception_entry_76>:
   402cb:	6a 00                	push   $0x0
   402cd:	6a 4c                	push   $0x4c
   402cf:	e9 9e 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402d4 <exception_entry_77>:
   402d4:	6a 00                	push   $0x0
   402d6:	6a 4d                	push   $0x4d
   402d8:	e9 95 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402dd <exception_entry_78>:
   402dd:	6a 00                	push   $0x0
   402df:	6a 4e                	push   $0x4e
   402e1:	e9 8c 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402e6 <exception_entry_79>:
   402e6:	6a 00                	push   $0x0
   402e8:	6a 4f                	push   $0x4f
   402ea:	e9 83 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402ef <exception_entry_80>:
   402ef:	6a 00                	push   $0x0
   402f1:	6a 50                	push   $0x50
   402f3:	e9 7a 07 00 00       	jmp    40a72 <exception_entry()>

00000000000402f8 <exception_entry_81>:
   402f8:	6a 00                	push   $0x0
   402fa:	6a 51                	push   $0x51
   402fc:	e9 71 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040301 <exception_entry_82>:
   40301:	6a 00                	push   $0x0
   40303:	6a 52                	push   $0x52
   40305:	e9 68 07 00 00       	jmp    40a72 <exception_entry()>

000000000004030a <exception_entry_83>:
   4030a:	6a 00                	push   $0x0
   4030c:	6a 53                	push   $0x53
   4030e:	e9 5f 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040313 <exception_entry_84>:
   40313:	6a 00                	push   $0x0
   40315:	6a 54                	push   $0x54
   40317:	e9 56 07 00 00       	jmp    40a72 <exception_entry()>

000000000004031c <exception_entry_85>:
   4031c:	6a 00                	push   $0x0
   4031e:	6a 55                	push   $0x55
   40320:	e9 4d 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040325 <exception_entry_86>:
   40325:	6a 00                	push   $0x0
   40327:	6a 56                	push   $0x56
   40329:	e9 44 07 00 00       	jmp    40a72 <exception_entry()>

000000000004032e <exception_entry_87>:
   4032e:	6a 00                	push   $0x0
   40330:	6a 57                	push   $0x57
   40332:	e9 3b 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040337 <exception_entry_88>:
   40337:	6a 00                	push   $0x0
   40339:	6a 58                	push   $0x58
   4033b:	e9 32 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040340 <exception_entry_89>:
   40340:	6a 00                	push   $0x0
   40342:	6a 59                	push   $0x59
   40344:	e9 29 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040349 <exception_entry_90>:
   40349:	6a 00                	push   $0x0
   4034b:	6a 5a                	push   $0x5a
   4034d:	e9 20 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040352 <exception_entry_91>:
   40352:	6a 00                	push   $0x0
   40354:	6a 5b                	push   $0x5b
   40356:	e9 17 07 00 00       	jmp    40a72 <exception_entry()>

000000000004035b <exception_entry_92>:
   4035b:	6a 00                	push   $0x0
   4035d:	6a 5c                	push   $0x5c
   4035f:	e9 0e 07 00 00       	jmp    40a72 <exception_entry()>

0000000000040364 <exception_entry_93>:
   40364:	6a 00                	push   $0x0
   40366:	6a 5d                	push   $0x5d
   40368:	e9 05 07 00 00       	jmp    40a72 <exception_entry()>

000000000004036d <exception_entry_94>:
   4036d:	6a 00                	push   $0x0
   4036f:	6a 5e                	push   $0x5e
   40371:	e9 fc 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040376 <exception_entry_95>:
   40376:	6a 00                	push   $0x0
   40378:	6a 5f                	push   $0x5f
   4037a:	e9 f3 06 00 00       	jmp    40a72 <exception_entry()>

000000000004037f <exception_entry_96>:
   4037f:	6a 00                	push   $0x0
   40381:	6a 60                	push   $0x60
   40383:	e9 ea 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040388 <exception_entry_97>:
   40388:	6a 00                	push   $0x0
   4038a:	6a 61                	push   $0x61
   4038c:	e9 e1 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040391 <exception_entry_98>:
   40391:	6a 00                	push   $0x0
   40393:	6a 62                	push   $0x62
   40395:	e9 d8 06 00 00       	jmp    40a72 <exception_entry()>

000000000004039a <exception_entry_99>:
   4039a:	6a 00                	push   $0x0
   4039c:	6a 63                	push   $0x63
   4039e:	e9 cf 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403a3 <exception_entry_100>:
   403a3:	6a 00                	push   $0x0
   403a5:	6a 64                	push   $0x64
   403a7:	e9 c6 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403ac <exception_entry_101>:
   403ac:	6a 00                	push   $0x0
   403ae:	6a 65                	push   $0x65
   403b0:	e9 bd 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403b5 <exception_entry_102>:
   403b5:	6a 00                	push   $0x0
   403b7:	6a 66                	push   $0x66
   403b9:	e9 b4 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403be <exception_entry_103>:
   403be:	6a 00                	push   $0x0
   403c0:	6a 67                	push   $0x67
   403c2:	e9 ab 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403c7 <exception_entry_104>:
   403c7:	6a 00                	push   $0x0
   403c9:	6a 68                	push   $0x68
   403cb:	e9 a2 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403d0 <exception_entry_105>:
   403d0:	6a 00                	push   $0x0
   403d2:	6a 69                	push   $0x69
   403d4:	e9 99 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403d9 <exception_entry_106>:
   403d9:	6a 00                	push   $0x0
   403db:	6a 6a                	push   $0x6a
   403dd:	e9 90 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403e2 <exception_entry_107>:
   403e2:	6a 00                	push   $0x0
   403e4:	6a 6b                	push   $0x6b
   403e6:	e9 87 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403eb <exception_entry_108>:
   403eb:	6a 00                	push   $0x0
   403ed:	6a 6c                	push   $0x6c
   403ef:	e9 7e 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403f4 <exception_entry_109>:
   403f4:	6a 00                	push   $0x0
   403f6:	6a 6d                	push   $0x6d
   403f8:	e9 75 06 00 00       	jmp    40a72 <exception_entry()>

00000000000403fd <exception_entry_110>:
   403fd:	6a 00                	push   $0x0
   403ff:	6a 6e                	push   $0x6e
   40401:	e9 6c 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040406 <exception_entry_111>:
   40406:	6a 00                	push   $0x0
   40408:	6a 6f                	push   $0x6f
   4040a:	e9 63 06 00 00       	jmp    40a72 <exception_entry()>

000000000004040f <exception_entry_112>:
   4040f:	6a 00                	push   $0x0
   40411:	6a 70                	push   $0x70
   40413:	e9 5a 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040418 <exception_entry_113>:
   40418:	6a 00                	push   $0x0
   4041a:	6a 71                	push   $0x71
   4041c:	e9 51 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040421 <exception_entry_114>:
   40421:	6a 00                	push   $0x0
   40423:	6a 72                	push   $0x72
   40425:	e9 48 06 00 00       	jmp    40a72 <exception_entry()>

000000000004042a <exception_entry_115>:
   4042a:	6a 00                	push   $0x0
   4042c:	6a 73                	push   $0x73
   4042e:	e9 3f 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040433 <exception_entry_116>:
   40433:	6a 00                	push   $0x0
   40435:	6a 74                	push   $0x74
   40437:	e9 36 06 00 00       	jmp    40a72 <exception_entry()>

000000000004043c <exception_entry_117>:
   4043c:	6a 00                	push   $0x0
   4043e:	6a 75                	push   $0x75
   40440:	e9 2d 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040445 <exception_entry_118>:
   40445:	6a 00                	push   $0x0
   40447:	6a 76                	push   $0x76
   40449:	e9 24 06 00 00       	jmp    40a72 <exception_entry()>

000000000004044e <exception_entry_119>:
   4044e:	6a 00                	push   $0x0
   40450:	6a 77                	push   $0x77
   40452:	e9 1b 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040457 <exception_entry_120>:
   40457:	6a 00                	push   $0x0
   40459:	6a 78                	push   $0x78
   4045b:	e9 12 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040460 <exception_entry_121>:
   40460:	6a 00                	push   $0x0
   40462:	6a 79                	push   $0x79
   40464:	e9 09 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040469 <exception_entry_122>:
   40469:	6a 00                	push   $0x0
   4046b:	6a 7a                	push   $0x7a
   4046d:	e9 00 06 00 00       	jmp    40a72 <exception_entry()>

0000000000040472 <exception_entry_123>:
   40472:	6a 00                	push   $0x0
   40474:	6a 7b                	push   $0x7b
   40476:	e9 f7 05 00 00       	jmp    40a72 <exception_entry()>

000000000004047b <exception_entry_124>:
   4047b:	6a 00                	push   $0x0
   4047d:	6a 7c                	push   $0x7c
   4047f:	e9 ee 05 00 00       	jmp    40a72 <exception_entry()>

0000000000040484 <exception_entry_125>:
   40484:	6a 00                	push   $0x0
   40486:	6a 7d                	push   $0x7d
   40488:	e9 e5 05 00 00       	jmp    40a72 <exception_entry()>

000000000004048d <exception_entry_126>:
   4048d:	6a 00                	push   $0x0
   4048f:	6a 7e                	push   $0x7e
   40491:	e9 dc 05 00 00       	jmp    40a72 <exception_entry()>

0000000000040496 <exception_entry_127>:
   40496:	6a 00                	push   $0x0
   40498:	6a 7f                	push   $0x7f
   4049a:	e9 d3 05 00 00       	jmp    40a72 <exception_entry()>

000000000004049f <exception_entry_128>:
   4049f:	6a 00                	push   $0x0
   404a1:	68 80 00 00 00       	push   $0x80
   404a6:	e9 c7 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404ab <exception_entry_129>:
   404ab:	6a 00                	push   $0x0
   404ad:	68 81 00 00 00       	push   $0x81
   404b2:	e9 bb 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404b7 <exception_entry_130>:
   404b7:	6a 00                	push   $0x0
   404b9:	68 82 00 00 00       	push   $0x82
   404be:	e9 af 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404c3 <exception_entry_131>:
   404c3:	6a 00                	push   $0x0
   404c5:	68 83 00 00 00       	push   $0x83
   404ca:	e9 a3 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404cf <exception_entry_132>:
   404cf:	6a 00                	push   $0x0
   404d1:	68 84 00 00 00       	push   $0x84
   404d6:	e9 97 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404db <exception_entry_133>:
   404db:	6a 00                	push   $0x0
   404dd:	68 85 00 00 00       	push   $0x85
   404e2:	e9 8b 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404e7 <exception_entry_134>:
   404e7:	6a 00                	push   $0x0
   404e9:	68 86 00 00 00       	push   $0x86
   404ee:	e9 7f 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404f3 <exception_entry_135>:
   404f3:	6a 00                	push   $0x0
   404f5:	68 87 00 00 00       	push   $0x87
   404fa:	e9 73 05 00 00       	jmp    40a72 <exception_entry()>

00000000000404ff <exception_entry_136>:
   404ff:	6a 00                	push   $0x0
   40501:	68 88 00 00 00       	push   $0x88
   40506:	e9 67 05 00 00       	jmp    40a72 <exception_entry()>

000000000004050b <exception_entry_137>:
   4050b:	6a 00                	push   $0x0
   4050d:	68 89 00 00 00       	push   $0x89
   40512:	e9 5b 05 00 00       	jmp    40a72 <exception_entry()>

0000000000040517 <exception_entry_138>:
   40517:	6a 00                	push   $0x0
   40519:	68 8a 00 00 00       	push   $0x8a
   4051e:	e9 4f 05 00 00       	jmp    40a72 <exception_entry()>

0000000000040523 <exception_entry_139>:
   40523:	6a 00                	push   $0x0
   40525:	68 8b 00 00 00       	push   $0x8b
   4052a:	e9 43 05 00 00       	jmp    40a72 <exception_entry()>

000000000004052f <exception_entry_140>:
   4052f:	6a 00                	push   $0x0
   40531:	68 8c 00 00 00       	push   $0x8c
   40536:	e9 37 05 00 00       	jmp    40a72 <exception_entry()>

000000000004053b <exception_entry_141>:
   4053b:	6a 00                	push   $0x0
   4053d:	68 8d 00 00 00       	push   $0x8d
   40542:	e9 2b 05 00 00       	jmp    40a72 <exception_entry()>

0000000000040547 <exception_entry_142>:
   40547:	6a 00                	push   $0x0
   40549:	68 8e 00 00 00       	push   $0x8e
   4054e:	e9 1f 05 00 00       	jmp    40a72 <exception_entry()>

0000000000040553 <exception_entry_143>:
   40553:	6a 00                	push   $0x0
   40555:	68 8f 00 00 00       	push   $0x8f
   4055a:	e9 13 05 00 00       	jmp    40a72 <exception_entry()>

000000000004055f <exception_entry_144>:
   4055f:	6a 00                	push   $0x0
   40561:	68 90 00 00 00       	push   $0x90
   40566:	e9 07 05 00 00       	jmp    40a72 <exception_entry()>

000000000004056b <exception_entry_145>:
   4056b:	6a 00                	push   $0x0
   4056d:	68 91 00 00 00       	push   $0x91
   40572:	e9 fb 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040577 <exception_entry_146>:
   40577:	6a 00                	push   $0x0
   40579:	68 92 00 00 00       	push   $0x92
   4057e:	e9 ef 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040583 <exception_entry_147>:
   40583:	6a 00                	push   $0x0
   40585:	68 93 00 00 00       	push   $0x93
   4058a:	e9 e3 04 00 00       	jmp    40a72 <exception_entry()>

000000000004058f <exception_entry_148>:
   4058f:	6a 00                	push   $0x0
   40591:	68 94 00 00 00       	push   $0x94
   40596:	e9 d7 04 00 00       	jmp    40a72 <exception_entry()>

000000000004059b <exception_entry_149>:
   4059b:	6a 00                	push   $0x0
   4059d:	68 95 00 00 00       	push   $0x95
   405a2:	e9 cb 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405a7 <exception_entry_150>:
   405a7:	6a 00                	push   $0x0
   405a9:	68 96 00 00 00       	push   $0x96
   405ae:	e9 bf 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405b3 <exception_entry_151>:
   405b3:	6a 00                	push   $0x0
   405b5:	68 97 00 00 00       	push   $0x97
   405ba:	e9 b3 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405bf <exception_entry_152>:
   405bf:	6a 00                	push   $0x0
   405c1:	68 98 00 00 00       	push   $0x98
   405c6:	e9 a7 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405cb <exception_entry_153>:
   405cb:	6a 00                	push   $0x0
   405cd:	68 99 00 00 00       	push   $0x99
   405d2:	e9 9b 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405d7 <exception_entry_154>:
   405d7:	6a 00                	push   $0x0
   405d9:	68 9a 00 00 00       	push   $0x9a
   405de:	e9 8f 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405e3 <exception_entry_155>:
   405e3:	6a 00                	push   $0x0
   405e5:	68 9b 00 00 00       	push   $0x9b
   405ea:	e9 83 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405ef <exception_entry_156>:
   405ef:	6a 00                	push   $0x0
   405f1:	68 9c 00 00 00       	push   $0x9c
   405f6:	e9 77 04 00 00       	jmp    40a72 <exception_entry()>

00000000000405fb <exception_entry_157>:
   405fb:	6a 00                	push   $0x0
   405fd:	68 9d 00 00 00       	push   $0x9d
   40602:	e9 6b 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040607 <exception_entry_158>:
   40607:	6a 00                	push   $0x0
   40609:	68 9e 00 00 00       	push   $0x9e
   4060e:	e9 5f 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040613 <exception_entry_159>:
   40613:	6a 00                	push   $0x0
   40615:	68 9f 00 00 00       	push   $0x9f
   4061a:	e9 53 04 00 00       	jmp    40a72 <exception_entry()>

000000000004061f <exception_entry_160>:
   4061f:	6a 00                	push   $0x0
   40621:	68 a0 00 00 00       	push   $0xa0
   40626:	e9 47 04 00 00       	jmp    40a72 <exception_entry()>

000000000004062b <exception_entry_161>:
   4062b:	6a 00                	push   $0x0
   4062d:	68 a1 00 00 00       	push   $0xa1
   40632:	e9 3b 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040637 <exception_entry_162>:
   40637:	6a 00                	push   $0x0
   40639:	68 a2 00 00 00       	push   $0xa2
   4063e:	e9 2f 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040643 <exception_entry_163>:
   40643:	6a 00                	push   $0x0
   40645:	68 a3 00 00 00       	push   $0xa3
   4064a:	e9 23 04 00 00       	jmp    40a72 <exception_entry()>

000000000004064f <exception_entry_164>:
   4064f:	6a 00                	push   $0x0
   40651:	68 a4 00 00 00       	push   $0xa4
   40656:	e9 17 04 00 00       	jmp    40a72 <exception_entry()>

000000000004065b <exception_entry_165>:
   4065b:	6a 00                	push   $0x0
   4065d:	68 a5 00 00 00       	push   $0xa5
   40662:	e9 0b 04 00 00       	jmp    40a72 <exception_entry()>

0000000000040667 <exception_entry_166>:
   40667:	6a 00                	push   $0x0
   40669:	68 a6 00 00 00       	push   $0xa6
   4066e:	e9 ff 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040673 <exception_entry_167>:
   40673:	6a 00                	push   $0x0
   40675:	68 a7 00 00 00       	push   $0xa7
   4067a:	e9 f3 03 00 00       	jmp    40a72 <exception_entry()>

000000000004067f <exception_entry_168>:
   4067f:	6a 00                	push   $0x0
   40681:	68 a8 00 00 00       	push   $0xa8
   40686:	e9 e7 03 00 00       	jmp    40a72 <exception_entry()>

000000000004068b <exception_entry_169>:
   4068b:	6a 00                	push   $0x0
   4068d:	68 a9 00 00 00       	push   $0xa9
   40692:	e9 db 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040697 <exception_entry_170>:
   40697:	6a 00                	push   $0x0
   40699:	68 aa 00 00 00       	push   $0xaa
   4069e:	e9 cf 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406a3 <exception_entry_171>:
   406a3:	6a 00                	push   $0x0
   406a5:	68 ab 00 00 00       	push   $0xab
   406aa:	e9 c3 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406af <exception_entry_172>:
   406af:	6a 00                	push   $0x0
   406b1:	68 ac 00 00 00       	push   $0xac
   406b6:	e9 b7 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406bb <exception_entry_173>:
   406bb:	6a 00                	push   $0x0
   406bd:	68 ad 00 00 00       	push   $0xad
   406c2:	e9 ab 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406c7 <exception_entry_174>:
   406c7:	6a 00                	push   $0x0
   406c9:	68 ae 00 00 00       	push   $0xae
   406ce:	e9 9f 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406d3 <exception_entry_175>:
   406d3:	6a 00                	push   $0x0
   406d5:	68 af 00 00 00       	push   $0xaf
   406da:	e9 93 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406df <exception_entry_176>:
   406df:	6a 00                	push   $0x0
   406e1:	68 b0 00 00 00       	push   $0xb0
   406e6:	e9 87 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406eb <exception_entry_177>:
   406eb:	6a 00                	push   $0x0
   406ed:	68 b1 00 00 00       	push   $0xb1
   406f2:	e9 7b 03 00 00       	jmp    40a72 <exception_entry()>

00000000000406f7 <exception_entry_178>:
   406f7:	6a 00                	push   $0x0
   406f9:	68 b2 00 00 00       	push   $0xb2
   406fe:	e9 6f 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040703 <exception_entry_179>:
   40703:	6a 00                	push   $0x0
   40705:	68 b3 00 00 00       	push   $0xb3
   4070a:	e9 63 03 00 00       	jmp    40a72 <exception_entry()>

000000000004070f <exception_entry_180>:
   4070f:	6a 00                	push   $0x0
   40711:	68 b4 00 00 00       	push   $0xb4
   40716:	e9 57 03 00 00       	jmp    40a72 <exception_entry()>

000000000004071b <exception_entry_181>:
   4071b:	6a 00                	push   $0x0
   4071d:	68 b5 00 00 00       	push   $0xb5
   40722:	e9 4b 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040727 <exception_entry_182>:
   40727:	6a 00                	push   $0x0
   40729:	68 b6 00 00 00       	push   $0xb6
   4072e:	e9 3f 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040733 <exception_entry_183>:
   40733:	6a 00                	push   $0x0
   40735:	68 b7 00 00 00       	push   $0xb7
   4073a:	e9 33 03 00 00       	jmp    40a72 <exception_entry()>

000000000004073f <exception_entry_184>:
   4073f:	6a 00                	push   $0x0
   40741:	68 b8 00 00 00       	push   $0xb8
   40746:	e9 27 03 00 00       	jmp    40a72 <exception_entry()>

000000000004074b <exception_entry_185>:
   4074b:	6a 00                	push   $0x0
   4074d:	68 b9 00 00 00       	push   $0xb9
   40752:	e9 1b 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040757 <exception_entry_186>:
   40757:	6a 00                	push   $0x0
   40759:	68 ba 00 00 00       	push   $0xba
   4075e:	e9 0f 03 00 00       	jmp    40a72 <exception_entry()>

0000000000040763 <exception_entry_187>:
   40763:	6a 00                	push   $0x0
   40765:	68 bb 00 00 00       	push   $0xbb
   4076a:	e9 03 03 00 00       	jmp    40a72 <exception_entry()>

000000000004076f <exception_entry_188>:
   4076f:	6a 00                	push   $0x0
   40771:	68 bc 00 00 00       	push   $0xbc
   40776:	e9 f7 02 00 00       	jmp    40a72 <exception_entry()>

000000000004077b <exception_entry_189>:
   4077b:	6a 00                	push   $0x0
   4077d:	68 bd 00 00 00       	push   $0xbd
   40782:	e9 eb 02 00 00       	jmp    40a72 <exception_entry()>

0000000000040787 <exception_entry_190>:
   40787:	6a 00                	push   $0x0
   40789:	68 be 00 00 00       	push   $0xbe
   4078e:	e9 df 02 00 00       	jmp    40a72 <exception_entry()>

0000000000040793 <exception_entry_191>:
   40793:	6a 00                	push   $0x0
   40795:	68 bf 00 00 00       	push   $0xbf
   4079a:	e9 d3 02 00 00       	jmp    40a72 <exception_entry()>

000000000004079f <exception_entry_192>:
   4079f:	6a 00                	push   $0x0
   407a1:	68 c0 00 00 00       	push   $0xc0
   407a6:	e9 c7 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407ab <exception_entry_193>:
   407ab:	6a 00                	push   $0x0
   407ad:	68 c1 00 00 00       	push   $0xc1
   407b2:	e9 bb 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407b7 <exception_entry_194>:
   407b7:	6a 00                	push   $0x0
   407b9:	68 c2 00 00 00       	push   $0xc2
   407be:	e9 af 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407c3 <exception_entry_195>:
   407c3:	6a 00                	push   $0x0
   407c5:	68 c3 00 00 00       	push   $0xc3
   407ca:	e9 a3 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407cf <exception_entry_196>:
   407cf:	6a 00                	push   $0x0
   407d1:	68 c4 00 00 00       	push   $0xc4
   407d6:	e9 97 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407db <exception_entry_197>:
   407db:	6a 00                	push   $0x0
   407dd:	68 c5 00 00 00       	push   $0xc5
   407e2:	e9 8b 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407e7 <exception_entry_198>:
   407e7:	6a 00                	push   $0x0
   407e9:	68 c6 00 00 00       	push   $0xc6
   407ee:	e9 7f 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407f3 <exception_entry_199>:
   407f3:	6a 00                	push   $0x0
   407f5:	68 c7 00 00 00       	push   $0xc7
   407fa:	e9 73 02 00 00       	jmp    40a72 <exception_entry()>

00000000000407ff <exception_entry_200>:
   407ff:	6a 00                	push   $0x0
   40801:	68 c8 00 00 00       	push   $0xc8
   40806:	e9 67 02 00 00       	jmp    40a72 <exception_entry()>

000000000004080b <exception_entry_201>:
   4080b:	6a 00                	push   $0x0
   4080d:	68 c9 00 00 00       	push   $0xc9
   40812:	e9 5b 02 00 00       	jmp    40a72 <exception_entry()>

0000000000040817 <exception_entry_202>:
   40817:	6a 00                	push   $0x0
   40819:	68 ca 00 00 00       	push   $0xca
   4081e:	e9 4f 02 00 00       	jmp    40a72 <exception_entry()>

0000000000040823 <exception_entry_203>:
   40823:	6a 00                	push   $0x0
   40825:	68 cb 00 00 00       	push   $0xcb
   4082a:	e9 43 02 00 00       	jmp    40a72 <exception_entry()>

000000000004082f <exception_entry_204>:
   4082f:	6a 00                	push   $0x0
   40831:	68 cc 00 00 00       	push   $0xcc
   40836:	e9 37 02 00 00       	jmp    40a72 <exception_entry()>

000000000004083b <exception_entry_205>:
   4083b:	6a 00                	push   $0x0
   4083d:	68 cd 00 00 00       	push   $0xcd
   40842:	e9 2b 02 00 00       	jmp    40a72 <exception_entry()>

0000000000040847 <exception_entry_206>:
   40847:	6a 00                	push   $0x0
   40849:	68 ce 00 00 00       	push   $0xce
   4084e:	e9 1f 02 00 00       	jmp    40a72 <exception_entry()>

0000000000040853 <exception_entry_207>:
   40853:	6a 00                	push   $0x0
   40855:	68 cf 00 00 00       	push   $0xcf
   4085a:	e9 13 02 00 00       	jmp    40a72 <exception_entry()>

000000000004085f <exception_entry_208>:
   4085f:	6a 00                	push   $0x0
   40861:	68 d0 00 00 00       	push   $0xd0
   40866:	e9 07 02 00 00       	jmp    40a72 <exception_entry()>

000000000004086b <exception_entry_209>:
   4086b:	6a 00                	push   $0x0
   4086d:	68 d1 00 00 00       	push   $0xd1
   40872:	e9 fb 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040877 <exception_entry_210>:
   40877:	6a 00                	push   $0x0
   40879:	68 d2 00 00 00       	push   $0xd2
   4087e:	e9 ef 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040883 <exception_entry_211>:
   40883:	6a 00                	push   $0x0
   40885:	68 d3 00 00 00       	push   $0xd3
   4088a:	e9 e3 01 00 00       	jmp    40a72 <exception_entry()>

000000000004088f <exception_entry_212>:
   4088f:	6a 00                	push   $0x0
   40891:	68 d4 00 00 00       	push   $0xd4
   40896:	e9 d7 01 00 00       	jmp    40a72 <exception_entry()>

000000000004089b <exception_entry_213>:
   4089b:	6a 00                	push   $0x0
   4089d:	68 d5 00 00 00       	push   $0xd5
   408a2:	e9 cb 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408a7 <exception_entry_214>:
   408a7:	6a 00                	push   $0x0
   408a9:	68 d6 00 00 00       	push   $0xd6
   408ae:	e9 bf 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408b3 <exception_entry_215>:
   408b3:	6a 00                	push   $0x0
   408b5:	68 d7 00 00 00       	push   $0xd7
   408ba:	e9 b3 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408bf <exception_entry_216>:
   408bf:	6a 00                	push   $0x0
   408c1:	68 d8 00 00 00       	push   $0xd8
   408c6:	e9 a7 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408cb <exception_entry_217>:
   408cb:	6a 00                	push   $0x0
   408cd:	68 d9 00 00 00       	push   $0xd9
   408d2:	e9 9b 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408d7 <exception_entry_218>:
   408d7:	6a 00                	push   $0x0
   408d9:	68 da 00 00 00       	push   $0xda
   408de:	e9 8f 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408e3 <exception_entry_219>:
   408e3:	6a 00                	push   $0x0
   408e5:	68 db 00 00 00       	push   $0xdb
   408ea:	e9 83 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408ef <exception_entry_220>:
   408ef:	6a 00                	push   $0x0
   408f1:	68 dc 00 00 00       	push   $0xdc
   408f6:	e9 77 01 00 00       	jmp    40a72 <exception_entry()>

00000000000408fb <exception_entry_221>:
   408fb:	6a 00                	push   $0x0
   408fd:	68 dd 00 00 00       	push   $0xdd
   40902:	e9 6b 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040907 <exception_entry_222>:
   40907:	6a 00                	push   $0x0
   40909:	68 de 00 00 00       	push   $0xde
   4090e:	e9 5f 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040913 <exception_entry_223>:
   40913:	6a 00                	push   $0x0
   40915:	68 df 00 00 00       	push   $0xdf
   4091a:	e9 53 01 00 00       	jmp    40a72 <exception_entry()>

000000000004091f <exception_entry_224>:
   4091f:	6a 00                	push   $0x0
   40921:	68 e0 00 00 00       	push   $0xe0
   40926:	e9 47 01 00 00       	jmp    40a72 <exception_entry()>

000000000004092b <exception_entry_225>:
   4092b:	6a 00                	push   $0x0
   4092d:	68 e1 00 00 00       	push   $0xe1
   40932:	e9 3b 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040937 <exception_entry_226>:
   40937:	6a 00                	push   $0x0
   40939:	68 e2 00 00 00       	push   $0xe2
   4093e:	e9 2f 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040943 <exception_entry_227>:
   40943:	6a 00                	push   $0x0
   40945:	68 e3 00 00 00       	push   $0xe3
   4094a:	e9 23 01 00 00       	jmp    40a72 <exception_entry()>

000000000004094f <exception_entry_228>:
   4094f:	6a 00                	push   $0x0
   40951:	68 e4 00 00 00       	push   $0xe4
   40956:	e9 17 01 00 00       	jmp    40a72 <exception_entry()>

000000000004095b <exception_entry_229>:
   4095b:	6a 00                	push   $0x0
   4095d:	68 e5 00 00 00       	push   $0xe5
   40962:	e9 0b 01 00 00       	jmp    40a72 <exception_entry()>

0000000000040967 <exception_entry_230>:
   40967:	6a 00                	push   $0x0
   40969:	68 e6 00 00 00       	push   $0xe6
   4096e:	e9 ff 00 00 00       	jmp    40a72 <exception_entry()>

0000000000040973 <exception_entry_231>:
   40973:	6a 00                	push   $0x0
   40975:	68 e7 00 00 00       	push   $0xe7
   4097a:	e9 f3 00 00 00       	jmp    40a72 <exception_entry()>

000000000004097f <exception_entry_232>:
   4097f:	6a 00                	push   $0x0
   40981:	68 e8 00 00 00       	push   $0xe8
   40986:	e9 e7 00 00 00       	jmp    40a72 <exception_entry()>

000000000004098b <exception_entry_233>:
   4098b:	6a 00                	push   $0x0
   4098d:	68 e9 00 00 00       	push   $0xe9
   40992:	e9 db 00 00 00       	jmp    40a72 <exception_entry()>

0000000000040997 <exception_entry_234>:
   40997:	6a 00                	push   $0x0
   40999:	68 ea 00 00 00       	push   $0xea
   4099e:	e9 cf 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409a3 <exception_entry_235>:
   409a3:	6a 00                	push   $0x0
   409a5:	68 eb 00 00 00       	push   $0xeb
   409aa:	e9 c3 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409af <exception_entry_236>:
   409af:	6a 00                	push   $0x0
   409b1:	68 ec 00 00 00       	push   $0xec
   409b6:	e9 b7 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409bb <exception_entry_237>:
   409bb:	6a 00                	push   $0x0
   409bd:	68 ed 00 00 00       	push   $0xed
   409c2:	e9 ab 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409c7 <exception_entry_238>:
   409c7:	6a 00                	push   $0x0
   409c9:	68 ee 00 00 00       	push   $0xee
   409ce:	e9 9f 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409d3 <exception_entry_239>:
   409d3:	6a 00                	push   $0x0
   409d5:	68 ef 00 00 00       	push   $0xef
   409da:	e9 93 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409df <exception_entry_240>:
   409df:	6a 00                	push   $0x0
   409e1:	68 f0 00 00 00       	push   $0xf0
   409e6:	e9 87 00 00 00       	jmp    40a72 <exception_entry()>

00000000000409eb <exception_entry_241>:
   409eb:	6a 00                	push   $0x0
   409ed:	68 f1 00 00 00       	push   $0xf1
   409f2:	eb 7e                	jmp    40a72 <exception_entry()>

00000000000409f4 <exception_entry_242>:
   409f4:	6a 00                	push   $0x0
   409f6:	68 f2 00 00 00       	push   $0xf2
   409fb:	eb 75                	jmp    40a72 <exception_entry()>

00000000000409fd <exception_entry_243>:
   409fd:	6a 00                	push   $0x0
   409ff:	68 f3 00 00 00       	push   $0xf3
   40a04:	eb 6c                	jmp    40a72 <exception_entry()>

0000000000040a06 <exception_entry_244>:
   40a06:	6a 00                	push   $0x0
   40a08:	68 f4 00 00 00       	push   $0xf4
   40a0d:	eb 63                	jmp    40a72 <exception_entry()>

0000000000040a0f <exception_entry_245>:
   40a0f:	6a 00                	push   $0x0
   40a11:	68 f5 00 00 00       	push   $0xf5
   40a16:	eb 5a                	jmp    40a72 <exception_entry()>

0000000000040a18 <exception_entry_246>:
   40a18:	6a 00                	push   $0x0
   40a1a:	68 f6 00 00 00       	push   $0xf6
   40a1f:	eb 51                	jmp    40a72 <exception_entry()>

0000000000040a21 <exception_entry_247>:
   40a21:	6a 00                	push   $0x0
   40a23:	68 f7 00 00 00       	push   $0xf7
   40a28:	eb 48                	jmp    40a72 <exception_entry()>

0000000000040a2a <exception_entry_248>:
   40a2a:	6a 00                	push   $0x0
   40a2c:	68 f8 00 00 00       	push   $0xf8
   40a31:	eb 3f                	jmp    40a72 <exception_entry()>

0000000000040a33 <exception_entry_249>:
   40a33:	6a 00                	push   $0x0
   40a35:	68 f9 00 00 00       	push   $0xf9
   40a3a:	eb 36                	jmp    40a72 <exception_entry()>

0000000000040a3c <exception_entry_250>:
   40a3c:	6a 00                	push   $0x0
   40a3e:	68 fa 00 00 00       	push   $0xfa
   40a43:	eb 2d                	jmp    40a72 <exception_entry()>

0000000000040a45 <exception_entry_251>:
   40a45:	6a 00                	push   $0x0
   40a47:	68 fb 00 00 00       	push   $0xfb
   40a4c:	eb 24                	jmp    40a72 <exception_entry()>

0000000000040a4e <exception_entry_252>:
   40a4e:	6a 00                	push   $0x0
   40a50:	68 fc 00 00 00       	push   $0xfc
   40a55:	eb 1b                	jmp    40a72 <exception_entry()>

0000000000040a57 <exception_entry_253>:
   40a57:	6a 00                	push   $0x0
   40a59:	68 fd 00 00 00       	push   $0xfd
   40a5e:	eb 12                	jmp    40a72 <exception_entry()>

0000000000040a60 <exception_entry_254>:
   40a60:	6a 00                	push   $0x0
   40a62:	68 fe 00 00 00       	push   $0xfe
   40a67:	eb 09                	jmp    40a72 <exception_entry()>

0000000000040a69 <exception_entry_255>:
   40a69:	6a 00                	push   $0x0
   40a6b:	68 ff 00 00 00       	push   $0xff
   40a70:	eb 00                	jmp    40a72 <exception_entry()>

0000000000040a72 <exception_entry()>:
   40a72:	0f a8                	push   %gs
   40a74:	0f a0                	push   %fs
   40a76:	41 57                	push   %r15
   40a78:	41 56                	push   %r14
   40a7a:	41 55                	push   %r13
   40a7c:	41 54                	push   %r12
   40a7e:	41 53                	push   %r11
   40a80:	41 52                	push   %r10
   40a82:	41 51                	push   %r9
   40a84:	41 50                	push   %r8
   40a86:	57                   	push   %rdi
   40a87:	56                   	push   %rsi
   40a88:	55                   	push   %rbp
   40a89:	53                   	push   %rbx
   40a8a:	52                   	push   %rdx
   40a8b:	51                   	push   %rcx
   40a8c:	50                   	push   %rax
   40a8d:	48 89 e7             	mov    %rsp,%rdi
   40a90:	48 c7 c0 00 60 06 00 	mov    $0x66000,%rax
   40a97:	0f 22 d8             	mov    %rax,%cr3
   40a9a:	e8 4f 15 00 00       	call   41fee <exception(regstate*)>

0000000000040a9f <exception_return(proc*)>:
   40a9f:	8b 47 0c             	mov    0xc(%rdi),%eax
   40aa2:	83 f8 01             	cmp    $0x1,%eax
   40aa5:	0f 85 a4 00 00 00    	jne    40b4f <proc_runnable_fail>
   40aab:	48 8b 07             	mov    (%rdi),%rax
   40aae:	0f 22 d8             	mov    %rax,%cr3
   40ab1:	48 8d 67 10          	lea    0x10(%rdi),%rsp
   40ab5:	58                   	pop    %rax
   40ab6:	59                   	pop    %rcx
   40ab7:	5a                   	pop    %rdx
   40ab8:	5b                   	pop    %rbx
   40ab9:	5d                   	pop    %rbp
   40aba:	5e                   	pop    %rsi
   40abb:	5f                   	pop    %rdi
   40abc:	41 58                	pop    %r8
   40abe:	41 59                	pop    %r9
   40ac0:	41 5a                	pop    %r10
   40ac2:	41 5b                	pop    %r11
   40ac4:	41 5c                	pop    %r12
   40ac6:	41 5d                	pop    %r13
   40ac8:	41 5e                	pop    %r14
   40aca:	41 5f                	pop    %r15
   40acc:	0f a1                	pop    %fs
   40ace:	0f a9                	pop    %gs
   40ad0:	48 83 c4 10          	add    $0x10,%rsp
   40ad4:	48 cf                	iretq

0000000000040ad6 <syscall_entry()>:
   40ad6:	48 89 24 25 f0 ff 07 	mov    %rsp,0x7fff0
   40add:	00 
   40ade:	48 c7 c4 00 00 08 00 	mov    $0x80000,%rsp
   40ae5:	6a 23                	push   $0x23
   40ae7:	48 83 ec 08          	sub    $0x8,%rsp
   40aeb:	41 53                	push   %r11
   40aed:	6a 1b                	push   $0x1b
   40aef:	51                   	push   %rcx
   40af0:	48 83 ec 08          	sub    $0x8,%rsp
   40af4:	6a ff                	push   $0xffffffffffffffff
   40af6:	0f a8                	push   %gs
   40af8:	0f a0                	push   %fs
   40afa:	41 57                	push   %r15
   40afc:	41 56                	push   %r14
   40afe:	41 55                	push   %r13
   40b00:	41 54                	push   %r12
   40b02:	48 83 ec 08          	sub    $0x8,%rsp
   40b06:	41 52                	push   %r10
   40b08:	41 51                	push   %r9
   40b0a:	41 50                	push   %r8
   40b0c:	57                   	push   %rdi
   40b0d:	56                   	push   %rsi
   40b0e:	55                   	push   %rbp
   40b0f:	53                   	push   %rbx
   40b10:	52                   	push   %rdx
   40b11:	48 83 ec 08          	sub    $0x8,%rsp
   40b15:	50                   	push   %rax
   40b16:	48 c7 c0 00 60 06 00 	mov    $0x66000,%rax
   40b1d:	0f 22 d8             	mov    %rax,%cr3
   40b20:	48 89 e7             	mov    %rsp,%rdi
   40b23:	e8 74 16 00 00       	call   4219c <syscall(regstate*)>
   40b28:	48 8b 0c 25 00 42 06 	mov    0x64200,%rcx
   40b2f:	00 
   40b30:	8b 49 0c             	mov    0xc(%rcx),%ecx
   40b33:	83 f9 01             	cmp    $0x1,%ecx
   40b36:	75 17                	jne    40b4f <proc_runnable_fail>
   40b38:	48 8b 0c 25 00 42 06 	mov    0x64200,%rcx
   40b3f:	00 
   40b40:	48 8b 09             	mov    (%rcx),%rcx
   40b43:	0f 22 d9             	mov    %rcx,%cr3
   40b46:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
   40b4d:	48 cf                	iretq

0000000000040b4f <proc_runnable_fail>:
   40b4f:	31 c9                	xor    %ecx,%ecx
   40b51:	48 c7 c2 ce 5e 04 00 	mov    $0x45ece,%rdx
   40b58:	31 f6                	xor    %esi,%esi
   40b5a:	48 c7 c7 c0 5e 04 00 	mov    $0x45ec0,%rdi
   40b61:	e8 57 2b 00 00       	call   436bd <assert_fail(char const*, int, char const*, char const*)>

0000000000040b66 <kalloc(unsigned long)>:
//
//    The returned memory is initially filled with 0xCC, which corresponds to
//    the `int3` instruction. Executing that instruction will cause a `PANIC:
//    Unhandled exception 3!` This may help you debug.

void* kalloc(size_t sz) {
   40b66:	f3 0f 1e fa          	endbr64
   40b6a:	55                   	push   %rbp
   40b6b:	48 89 e5             	mov    %rsp,%rbp
   40b6e:	41 55                	push   %r13
   40b70:	41 54                	push   %r12
   40b72:	53                   	push   %rbx
   40b73:	48 83 ec 08          	sub    $0x8,%rsp
    // failing allocation depending on size
    if (sz > PAGESIZE) {
   40b77:	48 81 ff 00 10 00 00 	cmp    $0x1000,%rdi
   40b7e:	77 6c                	ja     40bec <kalloc(unsigned long)+0x86>
   40b80:	41 bd 00 02 00 00    	mov    $0x200,%r13d
        return nullptr;
    }

    int pageno = 0;
   40b86:	bb 00 00 00 00       	mov    $0x0,%ebx
   40b8b:	eb 0f                	jmp    40b9c <kalloc(unsigned long)+0x36>
            && physpages[pageno].refcount == 0) {
            ++physpages[pageno].refcount;
            memset((void*) pa, 0xCC, PAGESIZE);
            return (void*) pa;
        }
        pageno = (pageno + page_increment) % NPAGES;
   40b8d:	83 c3 01             	add    $0x1,%ebx
   40b90:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
    for (int tries = 0; tries != NPAGES; ++tries) {
   40b96:	41 83 ed 01          	sub    $0x1,%r13d
   40b9a:	74 49                	je     40be5 <kalloc(unsigned long)+0x7f>
        uintptr_t pa = pageno * PAGESIZE;
   40b9c:	4c 63 e3             	movslq %ebx,%r12
   40b9f:	49 c1 e4 0c          	shl    $0xc,%r12
        if (allocatable_physical_address(pa)
   40ba3:	4c 89 e7             	mov    %r12,%rdi
   40ba6:	e8 ad 1e 00 00       	call   42a58 <allocatable_physical_address(unsigned long)>
            && physpages[pageno].refcount == 0) {
   40bab:	84 c0                	test   %al,%al
   40bad:	74 de                	je     40b8d <kalloc(unsigned long)+0x27>
   40baf:	48 63 c3             	movslq %ebx,%rax
   40bb2:	80 b8 00 40 06 00 00 	cmpb   $0x0,0x64000(%rax)
   40bb9:	75 d2                	jne    40b8d <kalloc(unsigned long)+0x27>
            ++physpages[pageno].refcount;
   40bbb:	c6 80 00 40 06 00 01 	movb   $0x1,0x64000(%rax)
            memset((void*) pa, 0xCC, PAGESIZE);
   40bc2:	4c 89 e3             	mov    %r12,%rbx
   40bc5:	ba 00 10 00 00       	mov    $0x1000,%edx
   40bca:	be cc 00 00 00       	mov    $0xcc,%esi
   40bcf:	4c 89 e7             	mov    %r12,%rdi
   40bd2:	e8 db 45 00 00       	call   451b2 <memset>
    }

    return nullptr;
}
   40bd7:	48 89 d8             	mov    %rbx,%rax
   40bda:	48 83 c4 08          	add    $0x8,%rsp
   40bde:	5b                   	pop    %rbx
   40bdf:	41 5c                	pop    %r12
   40be1:	41 5d                	pop    %r13
   40be3:	5d                   	pop    %rbp
   40be4:	c3                   	ret
    return nullptr;
   40be5:	bb 00 00 00 00       	mov    $0x0,%ebx
   40bea:	eb eb                	jmp    40bd7 <kalloc(unsigned long)+0x71>
        return nullptr;
   40bec:	bb 00 00 00 00       	mov    $0x0,%ebx
   40bf1:	eb e4                	jmp    40bd7 <kalloc(unsigned long)+0x71>

0000000000040bf3 <kfree(void*)>:

// kfree(kptr)
//    Free `kptr`, which must have been previously returned by `kalloc`.
//    If `kptr == nullptr` does nothing.

void kfree(void* kptr) {
   40bf3:	f3 0f 1e fa          	endbr64
    (void) kptr;

    if (kptr == nullptr) {
   40bf7:	48 85 ff             	test   %rdi,%rdi
   40bfa:	74 20                	je     40c1c <kfree(void*)+0x29>
        return;
    }

    uintptr_t pa = (uintptr_t)kptr;
    assert(pa % PAGESIZE == 0);
   40bfc:	f7 c7 ff 0f 00 00    	test   $0xfff,%edi
   40c02:	75 19                	jne    40c1d <kfree(void*)+0x2a>

    // calculating page number
    uintptr_t pageno = pa / PAGESIZE;
   40c04:	48 c1 ef 0c          	shr    $0xc,%rdi

    if (physpages[pageno].refcount > 0) {
   40c08:	0f b6 87 00 40 06 00 	movzbl 0x64000(%rdi),%eax
   40c0f:	84 c0                	test   %al,%al
   40c11:	74 09                	je     40c1c <kfree(void*)+0x29>
        --physpages[pageno].refcount;
   40c13:	83 e8 01             	sub    $0x1,%eax
   40c16:	88 87 00 40 06 00    	mov    %al,0x64000(%rdi)
   40c1c:	c3                   	ret
void kfree(void* kptr) {
   40c1d:	55                   	push   %rbp
   40c1e:	48 89 e5             	mov    %rsp,%rbp
    assert(pa % PAGESIZE == 0);
   40c21:	b9 00 00 00 00       	mov    $0x0,%ecx
   40c26:	ba eb 5e 04 00       	mov    $0x45eeb,%edx
   40c2b:	be 9e 00 00 00       	mov    $0x9e,%esi
   40c30:	bf fe 5e 04 00       	mov    $0x45efe,%edi
   40c35:	e8 83 2a 00 00       	call   436bd <assert_fail(char const*, int, char const*, char const*)>

0000000000040c3a <copy_mappings(x86_64_pagetable*, x86_64_pagetable*, unsigned long)>:
// process_setup(pid, program_name)
//    Load application program `program_name` as process number `pid`.
//    This loads the application's code and data into memory, sets its
//    %rip and %rsp, gives it a stack page, and marks it as runnable.

void copy_mappings(x86_64_pagetable* dst, x86_64_pagetable* src, uintptr_t MAX_ADDR) {
   40c3a:	f3 0f 1e fa          	endbr64
   40c3e:	55                   	push   %rbp
   40c3f:	48 89 e5             	mov    %rsp,%rbp
   40c42:	41 56                	push   %r14
   40c44:	41 55                	push   %r13
   40c46:	41 54                	push   %r12
   40c48:	53                   	push   %rbx
   40c49:	48 83 ec 40          	sub    $0x40,%rsp
   40c4d:	48 89 fb             	mov    %rdi,%rbx
   40c50:	49 89 d5             	mov    %rdx,%r13
    void down(bool skip);
};


inline vmiter::vmiter(x86_64_pagetable* pt, uintptr_t va)
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   40c53:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
   40c57:	48 89 75 c8          	mov    %rsi,-0x38(%rbp)
   40c5b:	c7 45 d0 27 00 00 00 	movl   $0x27,-0x30(%rbp)
      perm_(initial_perm), va_(0) {
   40c62:	c7 45 d4 ff 0f 00 00 	movl   $0xfff,-0x2c(%rbp)
   40c69:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
   40c70:	00 
    real_find(va, false);
   40c71:	ba 00 00 00 00       	mov    $0x0,%edx
   40c76:	be 00 00 00 00       	mov    $0x0,%esi
   40c7b:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   40c7f:	e8 a2 16 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   40c84:	48 89 5d a0          	mov    %rbx,-0x60(%rbp)
   40c88:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   40c8c:	c7 45 b0 27 00 00 00 	movl   $0x27,-0x50(%rbp)
      perm_(initial_perm), va_(0) {
   40c93:	c7 45 b4 ff 0f 00 00 	movl   $0xfff,-0x4c(%rbp)
   40c9a:	48 c7 45 b8 00 00 00 	movq   $0x0,-0x48(%rbp)
   40ca1:	00 
    real_find(va, false);
   40ca2:	ba 00 00 00 00       	mov    $0x0,%edx
   40ca7:	be 00 00 00 00       	mov    $0x0,%esi
   40cac:	48 8d 7d a0          	lea    -0x60(%rbp),%rdi
   40cb0:	e8 71 16 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
}
inline x86_64_pagetable* vmiter::pagetable() const {
    return pt_;
}
inline uintptr_t vmiter::va() const {
    return va_;
   40cb5:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
    vmiter srcit(src, 0);
    vmiter dstit(dst, 0);
    for (; srcit.va() < MAX_ADDR; srcit += PAGESIZE, dstit += PAGESIZE) {
   40cb9:	4c 39 ef             	cmp    %r13,%rdi
   40cbc:	0f 83 cc 00 00 00    	jae    40d8e <copy_mappings(x86_64_pagetable*, x86_64_pagetable*, unsigned long)+0x154>
        if (lbits_ > PAGEOFFBITS) {
            pa &= ~0x1000UL;
        }
        return pa + (va_ & lbits_mask(lbits_));
    } else {
        return -1;
   40cc2:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
            pa &= ~0x1000UL;
   40cc9:	49 bc 00 e0 ff ff ff 	movabs $0xfffffffffe000,%r12
   40cd0:	ff 0f 00 
        uintptr_t pa = *pep_ & PTE_PAMASK;
   40cd3:	49 be 00 f0 ff ff ff 	movabs $0xffffffffff000,%r14
   40cda:	ff 0f 00 
   40cdd:	eb 4c                	jmp    40d2b <copy_mappings(x86_64_pagetable*, x86_64_pagetable*, unsigned long)+0xf1>
}
inline void vmiter::next_range() {
    real_find(last_va(), true);
}
inline void vmiter::map(uintptr_t pa, int perm) {
    int r = try_map(pa, perm);
   40cdf:	48 8d 7d a0          	lea    -0x60(%rbp),%rdi
   40ce3:	e8 70 17 00 00       	call   42458 <vmiter::try_map(unsigned long, int)>
    assert(r == 0, "vmiter::map failed");
   40ce8:	85 c0                	test   %eax,%eax
   40cea:	0f 85 85 00 00 00    	jne    40d75 <copy_mappings(x86_64_pagetable*, x86_64_pagetable*, unsigned long)+0x13b>
    return find(va_ + delta);
   40cf0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   40cf4:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va, false);
   40cfb:	ba 00 00 00 00       	mov    $0x0,%edx
   40d00:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   40d04:	e8 1d 16 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
    return find(va_ + delta);
   40d09:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   40d0d:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va, false);
   40d14:	ba 00 00 00 00       	mov    $0x0,%edx
   40d19:	48 8d 7d a0          	lea    -0x60(%rbp),%rdi
   40d1d:	e8 04 16 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
    return va_;
   40d22:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
   40d26:	4c 39 ef             	cmp    %r13,%rdi
   40d29:	73 63                	jae    40d8e <copy_mappings(x86_64_pagetable*, x86_64_pagetable*, unsigned long)+0x154>
    uint64_t ph = *pep_ & perm_;
   40d2b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   40d2f:	48 8b 00             	mov    (%rax),%rax
   40d32:	48 63 4d d4          	movslq -0x2c(%rbp),%rcx
   40d36:	48 21 c1             	and    %rax,%rcx
    return ph & -(ph & PTE_P);
   40d39:	48 89 ca             	mov    %rcx,%rdx
   40d3c:	83 e2 01             	and    $0x1,%edx
   40d3f:	48 f7 da             	neg    %rdx
        dstit.map(srcit.pa(), srcit.perm());
   40d42:	21 ca                	and    %ecx,%edx
        return -1;
   40d44:	48 89 de             	mov    %rbx,%rsi
    if (*pep_ & PTE_P) {
   40d47:	a8 01                	test   $0x1,%al
   40d49:	74 94                	je     40cdf <copy_mappings(x86_64_pagetable*, x86_64_pagetable*, unsigned long)+0xa5>
        if (lbits_ > PAGEOFFBITS) {
   40d4b:	8b 4d d0             	mov    -0x30(%rbp),%ecx
            pa &= ~0x1000UL;
   40d4e:	48 89 c6             	mov    %rax,%rsi
   40d51:	4c 21 e6             	and    %r12,%rsi
        uintptr_t pa = *pep_ & PTE_PAMASK;
   40d54:	49 89 c0             	mov    %rax,%r8
   40d57:	4d 21 f0             	and    %r14,%r8
   40d5a:	83 f9 0c             	cmp    $0xc,%ecx
   40d5d:	4c 0f 4f c6          	cmovg  %rsi,%r8
    return ~(~uintptr_t(0) << lbits);
   40d61:	48 89 de             	mov    %rbx,%rsi
   40d64:	48 d3 e6             	shl    %cl,%rsi
   40d67:	48 f7 d6             	not    %rsi
        return pa + (va_ & lbits_mask(lbits_));
   40d6a:	48 21 fe             	and    %rdi,%rsi
   40d6d:	4c 01 c6             	add    %r8,%rsi
   40d70:	e9 6a ff ff ff       	jmp    40cdf <copy_mappings(x86_64_pagetable*, x86_64_pagetable*, unsigned long)+0xa5>
    assert(r == 0, "vmiter::map failed");
   40d75:	b9 08 5f 04 00       	mov    $0x45f08,%ecx
   40d7a:	ba 1b 5f 04 00       	mov    $0x45f1b,%edx
   40d7f:	be 10 01 00 00       	mov    $0x110,%esi
   40d84:	bf 22 5f 04 00       	mov    $0x45f22,%edi
   40d89:	e8 2f 29 00 00       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
    }
}
   40d8e:	48 83 c4 40          	add    $0x40,%rsp
   40d92:	5b                   	pop    %rbx
   40d93:	41 5c                	pop    %r12
   40d95:	41 5d                	pop    %r13
   40d97:	41 5e                	pop    %r14
   40d99:	5d                   	pop    %rbp
   40d9a:	c3                   	ret

0000000000040d9b <process_setup(int, char const*)>:

void process_setup(pid_t pid, const char* program_name) {
   40d9b:	55                   	push   %rbp
   40d9c:	48 89 e5             	mov    %rsp,%rbp
   40d9f:	41 57                	push   %r15
   40da1:	41 56                	push   %r14
   40da3:	41 55                	push   %r13
   40da5:	41 54                	push   %r12
   40da7:	53                   	push   %rbx
   40da8:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
   40daf:	41 89 ff             	mov    %edi,%r15d
   40db2:	89 bd 54 ff ff ff    	mov    %edi,-0xac(%rbp)
   40db8:	49 89 f4             	mov    %rsi,%r12
    init_process(&ptable[pid], 0);
   40dbb:	48 63 c7             	movslq %edi,%rax
   40dbe:	48 8d 1c 40          	lea    (%rax,%rax,2),%rbx
   40dc2:	4c 8d 2c dd 00 00 00 	lea    0x0(,%rbx,8),%r13
   40dc9:	00 
   40dca:	4a 8d 04 2b          	lea    (%rbx,%r13,1),%rax
   40dce:	48 8d 3c c5 20 42 06 	lea    0x64220(,%rax,8),%rdi
   40dd5:	00 
   40dd6:	be 00 00 00 00       	mov    $0x0,%esi
   40ddb:	e8 d2 1c 00 00       	call   42ab2 <init_process(proc*, int)>

    // initialize process page table
    ptable[pid].pagetable = kalloc_pagetable();
   40de0:	e8 18 1c 00 00       	call   429fd <kalloc_pagetable()>
   40de5:	48 89 c7             	mov    %rax,%rdi
   40de8:	4c 01 eb             	add    %r13,%rbx
   40deb:	48 89 04 dd 20 42 06 	mov    %rax,0x64220(,%rbx,8)
   40df2:	00 

    copy_mappings(ptable[pid].pagetable, kernel_pagetable, PROC_START_ADDR);
   40df3:	ba 00 00 10 00       	mov    $0x100000,%edx
   40df8:	be 00 60 06 00       	mov    $0x66000,%esi
   40dfd:	e8 38 fe ff ff       	call   40c3a <copy_mappings(x86_64_pagetable*, x86_64_pagetable*, unsigned long)>

    // obtain reference to program image
    // (The program image models the process executable.)
    //program_image pgm(program_name);
    program_image pgm(program_name);
   40e02:	4c 89 e6             	mov    %r12,%rsi
   40e05:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40e09:	e8 d6 35 00 00       	call   443e4 <program_image::program_image(char const*)>
    // allocate and map process memory as specified in program image
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   40e0e:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40e12:	e8 67 36 00 00       	call   4447e <program_image::begin() const>
   40e17:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
   40e1e:	48 89 95 70 ff ff ff 	mov    %rdx,-0x90(%rbp)
            // allocating memory
            uintptr_t page = (uintptr_t) kalloc(PAGESIZE);
            assert(page != 0);

            // map memory
            int r = vmiter(ptable[pid].pagetable, a).try_map(page, PTE_P | PTE_W | PTE_U);
   40e25:	49 63 c7             	movslq %r15d,%rax
   40e28:	4c 8d 2c 40          	lea    (%rax,%rax,2),%r13
   40e2c:	4e 8d 34 ed 00 00 00 	lea    0x0(,%r13,8),%r14
   40e33:	00 
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   40e34:	e9 ae 00 00 00       	jmp    40ee7 <process_setup(int, char const*)+0x14c>
            uintptr_t page = (uintptr_t) kalloc(PAGESIZE);
   40e39:	bf 00 10 00 00       	mov    $0x1000,%edi
   40e3e:	e8 23 fd ff ff       	call   40b66 <kalloc(unsigned long)>
   40e43:	48 89 c3             	mov    %rax,%rbx
            assert(page != 0);
   40e46:	48 85 c0             	test   %rax,%rax
   40e49:	0f 84 d4 00 00 00    	je     40f23 <process_setup(int, char const*)+0x188>
            int r = vmiter(ptable[pid].pagetable, a).try_map(page, PTE_P | PTE_W | PTE_U);
   40e4f:	4b 8d 44 35 00       	lea    0x0(%r13,%r14,1),%rax
   40e54:	48 8b 04 c5 20 42 06 	mov    0x64220(,%rax,8),%rax
   40e5b:	00 
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   40e5c:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
   40e63:	48 89 45 80          	mov    %rax,-0x80(%rbp)
   40e67:	c7 45 88 27 00 00 00 	movl   $0x27,-0x78(%rbp)
      perm_(initial_perm), va_(0) {
   40e6e:	c7 45 8c ff 0f 00 00 	movl   $0xfff,-0x74(%rbp)
   40e75:	48 c7 45 90 00 00 00 	movq   $0x0,-0x70(%rbp)
   40e7c:	00 
    real_find(va, false);
   40e7d:	ba 00 00 00 00       	mov    $0x0,%edx
   40e82:	4c 89 e6             	mov    %r12,%rsi
   40e85:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   40e8c:	e8 95 14 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
   40e91:	ba 07 00 00 00       	mov    $0x7,%edx
   40e96:	48 89 de             	mov    %rbx,%rsi
   40e99:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   40ea0:	e8 b3 15 00 00       	call   42458 <vmiter::try_map(unsigned long, int)>
            assert(r == 0);
   40ea5:	85 c0                	test   %eax,%eax
   40ea7:	0f 85 8f 00 00 00    	jne    40f3c <process_setup(int, char const*)+0x1a1>
             a += PAGESIZE) {
   40ead:	49 81 c4 00 10 00 00 	add    $0x1000,%r12
             a < seg.va() + seg.size();
   40eb4:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   40ebb:	e8 36 36 00 00       	call   444f6 <program_image_segment::va() const>
   40ec0:	48 89 c3             	mov    %rax,%rbx
   40ec3:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   40eca:	e8 33 36 00 00       	call   44502 <program_image_segment::size() const>
   40ecf:	48 01 c3             	add    %rax,%rbx
   40ed2:	49 39 dc             	cmp    %rbx,%r12
   40ed5:	0f 82 5e ff ff ff    	jb     40e39 <process_setup(int, char const*)+0x9e>
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   40edb:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   40ee2:	e8 61 36 00 00       	call   44548 <program_image_segment::operator++()>
   40ee7:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40eeb:	e8 c2 35 00 00       	call   444b2 <program_image::end() const>
   40ef0:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
   40ef4:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
   40ef8:	48 8d 75 a0          	lea    -0x60(%rbp),%rsi
   40efc:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   40f03:	e8 32 36 00 00       	call   4453a <program_image_segment::operator!=(program_image_segment const&) const>
   40f08:	84 c0                	test   %al,%al
   40f0a:	74 49                	je     40f55 <process_setup(int, char const*)+0x1ba>
        for (uintptr_t a = round_down(seg.va(), PAGESIZE);
   40f0c:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   40f13:	e8 de 35 00 00       	call   444f6 <program_image_segment::va() const>
   40f18:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   40f1e:	49 89 c4             	mov    %rax,%r12
   40f21:	eb 91                	jmp    40eb4 <process_setup(int, char const*)+0x119>
            assert(page != 0);
   40f23:	b9 00 00 00 00       	mov    $0x0,%ecx
   40f28:	ba 2e 5f 04 00       	mov    $0x45f2e,%edx
   40f2d:	be ca 00 00 00       	mov    $0xca,%esi
   40f32:	bf fe 5e 04 00       	mov    $0x45efe,%edi
   40f37:	e8 81 27 00 00       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
            assert(r == 0);
   40f3c:	b9 00 00 00 00       	mov    $0x0,%ecx
   40f41:	ba 1b 5f 04 00       	mov    $0x45f1b,%edx
   40f46:	be ce 00 00 00       	mov    $0xce,%esi
   40f4b:	bf fe 5e 04 00       	mov    $0x45efe,%edi
   40f50:	e8 68 27 00 00       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
        }
    }

    // copy instructions and data from program image into process memory
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   40f55:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40f59:	e8 20 35 00 00       	call   4447e <program_image::begin() const>
   40f5e:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
   40f65:	48 89 95 70 ff ff ff 	mov    %rdx,-0x90(%rbp)
        uintptr_t pa = vmiter(ptable[pid].pagetable, seg.va()).pa();
   40f6c:	48 63 85 54 ff ff ff 	movslq -0xac(%rbp),%rax
   40f73:	4c 8d 24 40          	lea    (%rax,%rax,2),%r12
   40f77:	4e 8d 2c e5 00 00 00 	lea    0x0(,%r12,8),%r13
   40f7e:	00 
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   40f7f:	eb 65                	jmp    40fe6 <process_setup(int, char const*)+0x24b>
    return ~(~uintptr_t(0) << lbits);
   40f81:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
   40f88:	48 d3 e3             	shl    %cl,%rbx
   40f8b:	48 f7 d3             	not    %rbx
        return pa + (va_ & lbits_mask(lbits_));
   40f8e:	48 23 5d 90          	and    -0x70(%rbp),%rbx
   40f92:	48 01 c3             	add    %rax,%rbx
        memset((void*) pa, 0, seg.size());
   40f95:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   40f9c:	e8 61 35 00 00       	call   44502 <program_image_segment::size() const>
   40fa1:	48 89 c2             	mov    %rax,%rdx
   40fa4:	be 00 00 00 00       	mov    $0x0,%esi
   40fa9:	48 89 df             	mov    %rbx,%rdi
   40fac:	e8 01 42 00 00       	call   451b2 <memset>
        memcpy((void*) pa, seg.data(), seg.data_size());
   40fb1:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   40fb8:	e8 61 35 00 00       	call   4451e <program_image_segment::data_size() const>
   40fbd:	49 89 c6             	mov    %rax,%r14
   40fc0:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   40fc7:	e8 42 35 00 00       	call   4450e <program_image_segment::data() const>
   40fcc:	48 89 c6             	mov    %rax,%rsi
   40fcf:	4c 89 f2             	mov    %r14,%rdx
   40fd2:	48 89 df             	mov    %rbx,%rdi
   40fd5:	e8 b4 41 00 00       	call   4518e <memcpy>
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   40fda:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   40fe1:	e8 62 35 00 00       	call   44548 <program_image_segment::operator++()>
   40fe6:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   40fea:	e8 c3 34 00 00       	call   444b2 <program_image::end() const>
   40fef:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   40ff3:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
   40ff7:	48 8d 75 b0          	lea    -0x50(%rbp),%rsi
   40ffb:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   41002:	e8 33 35 00 00       	call   4453a <program_image_segment::operator!=(program_image_segment const&) const>
   41007:	84 c0                	test   %al,%al
   41009:	0f 84 8f 00 00 00    	je     4109e <process_setup(int, char const*)+0x303>
        uintptr_t pa = vmiter(ptable[pid].pagetable, seg.va()).pa();
   4100f:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   41016:	e8 db 34 00 00       	call   444f6 <program_image_segment::va() const>
   4101b:	48 89 c6             	mov    %rax,%rsi
   4101e:	4b 8d 04 2c          	lea    (%r12,%r13,1),%rax
   41022:	48 8b 04 c5 20 42 06 	mov    0x64220(,%rax,8),%rax
   41029:	00 
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   4102a:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
   41031:	48 89 45 80          	mov    %rax,-0x80(%rbp)
   41035:	c7 45 88 27 00 00 00 	movl   $0x27,-0x78(%rbp)
      perm_(initial_perm), va_(0) {
   4103c:	c7 45 8c ff 0f 00 00 	movl   $0xfff,-0x74(%rbp)
   41043:	48 c7 45 90 00 00 00 	movq   $0x0,-0x70(%rbp)
   4104a:	00 
    real_find(va, false);
   4104b:	ba 00 00 00 00       	mov    $0x0,%edx
   41050:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   41057:	e8 ca 12 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
    if (*pep_ & PTE_P) {
   4105c:	48 8b 45 80          	mov    -0x80(%rbp),%rax
   41060:	48 8b 10             	mov    (%rax),%rdx
        return -1;
   41063:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
    if (*pep_ & PTE_P) {
   4106a:	f6 c2 01             	test   $0x1,%dl
   4106d:	0f 84 22 ff ff ff    	je     40f95 <process_setup(int, char const*)+0x1fa>
        if (lbits_ > PAGEOFFBITS) {
   41073:	8b 4d 88             	mov    -0x78(%rbp),%ecx
            pa &= ~0x1000UL;
   41076:	48 b8 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rax
   4107d:	ff 0f 00 
   41080:	48 21 d0             	and    %rdx,%rax
        if (lbits_ > PAGEOFFBITS) {
   41083:	83 f9 0c             	cmp    $0xc,%ecx
   41086:	0f 8f f5 fe ff ff    	jg     40f81 <process_setup(int, char const*)+0x1e6>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   4108c:	48 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%rax
   41093:	ff 0f 00 
   41096:	48 21 d0             	and    %rdx,%rax
   41099:	e9 e3 fe ff ff       	jmp    40f81 <process_setup(int, char const*)+0x1e6>
    }
   
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   4109e:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   410a2:	e8 d7 33 00 00       	call   4447e <program_image::begin() const>
   410a7:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
   410ae:	48 89 95 70 ff ff ff 	mov    %rdx,-0x90(%rbp)
            }
            // so we dont copy excess data
            allocated_sz = min(seg.data_size() - allocated, allocated_sz);

            // copying data to page
            memset((void*) vmiter(ptable[pid].pagetable, a).pa(), 0, allocated_sz);
   410b5:	48 63 85 54 ff ff ff 	movslq -0xac(%rbp),%rax
   410bc:	4c 8d 34 40          	lea    (%rax,%rax,2),%r14
   410c0:	4e 8d 3c f5 00 00 00 	lea    0x0(,%r14,8),%r15
   410c7:	00 
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   410c8:	e9 af 02 00 00       	jmp    4137c <process_setup(int, char const*)+0x5e1>
                allocated_sz = PAGESIZE - (seg.va() - a);
   410cd:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   410d4:	e8 1d 34 00 00       	call   444f6 <program_image_segment::va() const>
   410d9:	49 8d 9c 24 00 10 00 	lea    0x1000(%r12),%rbx
   410e0:	00 
   410e1:	48 29 c3             	sub    %rax,%rbx
   410e4:	eb 76                	jmp    4115c <process_setup(int, char const*)+0x3c1>
    return ~(~uintptr_t(0) << lbits);
   410e6:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
   410ed:	48 d3 e7             	shl    %cl,%rdi
   410f0:	48 f7 d7             	not    %rdi
        return pa + (va_ & lbits_mask(lbits_));
   410f3:	48 23 7d 90          	and    -0x70(%rbp),%rdi
   410f7:	48 01 c7             	add    %rax,%rdi
            memcpy((void*) vmiter(ptable[pid].pagetable, a).pa(), seg.data()+allocated, allocated_sz);
   410fa:	48 89 da             	mov    %rbx,%rdx
   410fd:	48 8b b5 58 ff ff ff 	mov    -0xa8(%rbp),%rsi
   41104:	e8 85 40 00 00       	call   4518e <memcpy>
            allocated += allocated_sz;
   41109:	49 01 dd             	add    %rbx,%r13

            if (!seg.writable()) {
   4110c:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   41113:	e8 12 34 00 00       	call   4452a <program_image_segment::writable() const>
   41118:	84 c0                	test   %al,%al
   4111a:	0f 84 82 01 00 00    	je     412a2 <process_setup(int, char const*)+0x507>
            a += PAGESIZE) {
   41120:	49 81 c4 00 10 00 00 	add    $0x1000,%r12
            a < seg.va() + seg.size();
   41127:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   4112e:	e8 c3 33 00 00       	call   444f6 <program_image_segment::va() const>
   41133:	48 89 c3             	mov    %rax,%rbx
   41136:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   4113d:	e8 c0 33 00 00       	call   44502 <program_image_segment::size() const>
   41142:	48 01 c3             	add    %rax,%rbx
   41145:	49 39 dc             	cmp    %rbx,%r12
   41148:	0f 83 22 02 00 00    	jae    41370 <process_setup(int, char const*)+0x5d5>
            size_t allocated_sz = PAGESIZE;
   4114e:	bb 00 10 00 00       	mov    $0x1000,%ebx
            if (allocated == 0) {
   41153:	4d 85 ed             	test   %r13,%r13
   41156:	0f 84 71 ff ff ff    	je     410cd <process_setup(int, char const*)+0x332>
            allocated_sz = min(seg.data_size() - allocated, allocated_sz);
   4115c:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   41163:	e8 b6 33 00 00       	call   4451e <program_image_segment::data_size() const>
   41168:	4c 29 e8             	sub    %r13,%rax

// min(a, b, ...)
//    Return the minimum of the arguments.
template <typename T>
inline constexpr T min(T a, T b) {
    return a < b ? a : b;
   4116b:	48 39 d8             	cmp    %rbx,%rax
   4116e:	48 0f 46 d8          	cmovbe %rax,%rbx
            memset((void*) vmiter(ptable[pid].pagetable, a).pa(), 0, allocated_sz);
   41172:	4b 8d 04 3e          	lea    (%r14,%r15,1),%rax
   41176:	48 8b 04 c5 20 42 06 	mov    0x64220(,%rax,8),%rax
   4117d:	00 
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   4117e:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
   41185:	48 89 45 80          	mov    %rax,-0x80(%rbp)
   41189:	c7 45 88 27 00 00 00 	movl   $0x27,-0x78(%rbp)
      perm_(initial_perm), va_(0) {
   41190:	c7 45 8c ff 0f 00 00 	movl   $0xfff,-0x74(%rbp)
   41197:	48 c7 45 90 00 00 00 	movq   $0x0,-0x70(%rbp)
   4119e:	00 
    real_find(va, false);
   4119f:	ba 00 00 00 00       	mov    $0x0,%edx
   411a4:	4c 89 e6             	mov    %r12,%rsi
   411a7:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   411ae:	e8 73 11 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
    if (*pep_ & PTE_P) {
   411b3:	48 8b 45 80          	mov    -0x80(%rbp),%rax
   411b7:	48 8b 10             	mov    (%rax),%rdx
        return -1;
   411ba:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
    if (*pep_ & PTE_P) {
   411c1:	f6 c2 01             	test   $0x1,%dl
   411c4:	74 36                	je     411fc <process_setup(int, char const*)+0x461>
        if (lbits_ > PAGEOFFBITS) {
   411c6:	8b 4d 88             	mov    -0x78(%rbp),%ecx
            pa &= ~0x1000UL;
   411c9:	48 b8 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rax
   411d0:	ff 0f 00 
   411d3:	48 21 d0             	and    %rdx,%rax
        if (lbits_ > PAGEOFFBITS) {
   411d6:	83 f9 0c             	cmp    $0xc,%ecx
   411d9:	7f 0d                	jg     411e8 <process_setup(int, char const*)+0x44d>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   411db:	48 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%rax
   411e2:	ff 0f 00 
   411e5:	48 21 d0             	and    %rdx,%rax
    return ~(~uintptr_t(0) << lbits);
   411e8:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
   411ef:	48 d3 e7             	shl    %cl,%rdi
   411f2:	48 f7 d7             	not    %rdi
        return pa + (va_ & lbits_mask(lbits_));
   411f5:	48 23 7d 90          	and    -0x70(%rbp),%rdi
   411f9:	48 01 c7             	add    %rax,%rdi
   411fc:	48 89 da             	mov    %rbx,%rdx
   411ff:	be 00 00 00 00       	mov    $0x0,%esi
   41204:	e8 a9 3f 00 00       	call   451b2 <memset>
            memcpy((void*) vmiter(ptable[pid].pagetable, a).pa(), seg.data()+allocated, allocated_sz);
   41209:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   41210:	e8 f9 32 00 00       	call   4450e <program_image_segment::data() const>
   41215:	4c 01 e8             	add    %r13,%rax
   41218:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
   4121f:	4b 8d 04 3e          	lea    (%r14,%r15,1),%rax
   41223:	48 8b 04 c5 20 42 06 	mov    0x64220(,%rax,8),%rax
   4122a:	00 
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   4122b:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
   41232:	48 89 45 80          	mov    %rax,-0x80(%rbp)
   41236:	c7 45 88 27 00 00 00 	movl   $0x27,-0x78(%rbp)
      perm_(initial_perm), va_(0) {
   4123d:	c7 45 8c ff 0f 00 00 	movl   $0xfff,-0x74(%rbp)
   41244:	48 c7 45 90 00 00 00 	movq   $0x0,-0x70(%rbp)
   4124b:	00 
    real_find(va, false);
   4124c:	ba 00 00 00 00       	mov    $0x0,%edx
   41251:	4c 89 e6             	mov    %r12,%rsi
   41254:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   4125b:	e8 c6 10 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
    if (*pep_ & PTE_P) {
   41260:	48 8b 45 80          	mov    -0x80(%rbp),%rax
   41264:	48 8b 10             	mov    (%rax),%rdx
        return -1;
   41267:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
    if (*pep_ & PTE_P) {
   4126e:	f6 c2 01             	test   $0x1,%dl
   41271:	0f 84 83 fe ff ff    	je     410fa <process_setup(int, char const*)+0x35f>
        if (lbits_ > PAGEOFFBITS) {
   41277:	8b 4d 88             	mov    -0x78(%rbp),%ecx
            pa &= ~0x1000UL;
   4127a:	48 b8 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rax
   41281:	ff 0f 00 
   41284:	48 21 d0             	and    %rdx,%rax
        if (lbits_ > PAGEOFFBITS) {
   41287:	83 f9 0c             	cmp    $0xc,%ecx
   4128a:	0f 8f 56 fe ff ff    	jg     410e6 <process_setup(int, char const*)+0x34b>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   41290:	48 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%rax
   41297:	ff 0f 00 
   4129a:	48 21 d0             	and    %rdx,%rax
   4129d:	e9 44 fe ff ff       	jmp    410e6 <process_setup(int, char const*)+0x34b>
                // checking permissions
                vmiter vmi(ptable[pid].pagetable, a);
   412a2:	4b 8d 04 3e          	lea    (%r14,%r15,1),%rax
   412a6:	48 8b 04 c5 20 42 06 	mov    0x64220(,%rax,8),%rax
   412ad:	00 
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   412ae:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
   412b5:	48 89 45 80          	mov    %rax,-0x80(%rbp)
   412b9:	c7 45 88 27 00 00 00 	movl   $0x27,-0x78(%rbp)
      perm_(initial_perm), va_(0) {
   412c0:	c7 45 8c ff 0f 00 00 	movl   $0xfff,-0x74(%rbp)
   412c7:	48 c7 45 90 00 00 00 	movq   $0x0,-0x70(%rbp)
   412ce:	00 
    real_find(va, false);
   412cf:	ba 00 00 00 00       	mov    $0x0,%edx
   412d4:	4c 89 e6             	mov    %r12,%rsi
   412d7:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   412de:	e8 43 10 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
    uint64_t ph = *pep_ & perm_;
   412e3:	48 8b 45 80          	mov    -0x80(%rbp),%rax
   412e7:	48 8b 38             	mov    (%rax),%rdi
   412ea:	48 63 45 8c          	movslq -0x74(%rbp),%rax
   412ee:	48 21 f8             	and    %rdi,%rax
    return ph & -(ph & PTE_P);
   412f1:	48 89 c2             	mov    %rax,%rdx
   412f4:	83 e2 01             	and    $0x1,%edx
   412f7:	48 f7 da             	neg    %rdx
   412fa:	48 21 c2             	and    %rax,%rdx
                int perm = vmi.perm();
                perm &= ~PTE_W;
   412fd:	83 e2 fd             	and    $0xfffffffd,%edx
        return -1;
   41300:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
    if (*pep_ & PTE_P) {
   41307:	40 f6 c7 01          	test   $0x1,%dil
   4130b:	74 36                	je     41343 <process_setup(int, char const*)+0x5a8>
        if (lbits_ > PAGEOFFBITS) {
   4130d:	8b 4d 88             	mov    -0x78(%rbp),%ecx
            pa &= ~0x1000UL;
   41310:	48 b8 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rax
   41317:	ff 0f 00 
   4131a:	48 21 f8             	and    %rdi,%rax
        if (lbits_ > PAGEOFFBITS) {
   4131d:	83 f9 0c             	cmp    $0xc,%ecx
   41320:	7f 0d                	jg     4132f <process_setup(int, char const*)+0x594>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   41322:	48 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%rax
   41329:	ff 0f 00 
   4132c:	48 21 f8             	and    %rdi,%rax
    return ~(~uintptr_t(0) << lbits);
   4132f:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
   41336:	48 d3 e6             	shl    %cl,%rsi
   41339:	48 f7 d6             	not    %rsi
        return pa + (va_ & lbits_mask(lbits_));
   4133c:	48 23 75 90          	and    -0x70(%rbp),%rsi
   41340:	48 01 c6             	add    %rax,%rsi
    int r = try_map(pa, perm);
   41343:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   4134a:	e8 09 11 00 00       	call   42458 <vmiter::try_map(unsigned long, int)>
    assert(r == 0, "vmiter::map failed");
   4134f:	85 c0                	test   %eax,%eax
   41351:	0f 84 c9 fd ff ff    	je     41120 <process_setup(int, char const*)+0x385>
   41357:	b9 08 5f 04 00       	mov    $0x45f08,%ecx
   4135c:	ba 1b 5f 04 00       	mov    $0x45f1b,%edx
   41361:	be 10 01 00 00       	mov    $0x110,%esi
   41366:	bf 22 5f 04 00       	mov    $0x45f22,%edi
   4136b:	e8 4d 23 00 00       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
   41370:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   41377:	e8 cc 31 00 00       	call   44548 <program_image_segment::operator++()>
   4137c:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   41380:	e8 2d 31 00 00       	call   444b2 <program_image::end() const>
   41385:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   41389:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   4138d:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
   41391:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   41398:	e8 9d 31 00 00       	call   4453a <program_image_segment::operator!=(program_image_segment const&) const>
   4139d:	84 c0                	test   %al,%al
   4139f:	74 20                	je     413c1 <process_setup(int, char const*)+0x626>
        for (uintptr_t a = round_down(seg.va(), PAGESIZE);
   413a1:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
   413a8:	e8 49 31 00 00       	call   444f6 <program_image_segment::va() const>
   413ad:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
   413b3:	49 89 c4             	mov    %rax,%r12
        size_t allocated = 0;
   413b6:	41 bd 00 00 00 00    	mov    $0x0,%r13d
        for (uintptr_t a = round_down(seg.va(), PAGESIZE);
   413bc:	e9 66 fd ff ff       	jmp    41127 <process_setup(int, char const*)+0x38c>
            }
        }
    }

    // marking entry
    ptable[pid].regs.reg_rip = pgm.entry();
   413c1:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
   413c5:	e8 42 30 00 00       	call   4440c <program_image::entry() const>
   413ca:	48 89 c2             	mov    %rax,%rdx
   413cd:	48 63 85 54 ff ff ff 	movslq -0xac(%rbp),%rax
   413d4:	48 8d 1c 40          	lea    (%rax,%rax,2),%rbx
   413d8:	4c 8d 2c dd 00 00 00 	lea    0x0(,%rbx,8),%r13
   413df:	00 
   413e0:	4a 8d 04 2b          	lea    (%rbx,%r13,1),%rax
   413e4:	48 89 14 c5 c8 42 06 	mov    %rdx,0x642c8(,%rax,8)
   413eb:	00 

    // initializing map and stack
    uintptr_t stack = (uintptr_t) kalloc(PAGESIZE);
   413ec:	bf 00 10 00 00       	mov    $0x1000,%edi
   413f1:	e8 70 f7 ff ff       	call   40b66 <kalloc(unsigned long)>
   413f6:	49 89 c4             	mov    %rax,%r12
    uintptr_t stack_addr = MEMSIZE_VIRTUAL - PAGESIZE;

    int r = vmiter(ptable[pid].pagetable, stack_addr).try_map(stack, PTE_P | PTE_W | PTE_U);
   413f9:	4c 01 eb             	add    %r13,%rbx
   413fc:	48 8b 04 dd 20 42 06 	mov    0x64220(,%rbx,8),%rax
   41403:	00 
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   41404:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
   4140b:	48 89 45 80          	mov    %rax,-0x80(%rbp)
   4140f:	c7 45 88 27 00 00 00 	movl   $0x27,-0x78(%rbp)
      perm_(initial_perm), va_(0) {
   41416:	c7 45 8c ff 0f 00 00 	movl   $0xfff,-0x74(%rbp)
   4141d:	48 c7 45 90 00 00 00 	movq   $0x0,-0x70(%rbp)
   41424:	00 
    real_find(va, false);
   41425:	ba 00 00 00 00       	mov    $0x0,%edx
   4142a:	be 00 f0 2f 00       	mov    $0x2ff000,%esi
   4142f:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   41436:	e8 eb 0e 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
   4143b:	ba 07 00 00 00       	mov    $0x7,%edx
   41440:	4c 89 e6             	mov    %r12,%rsi
   41443:	48 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%rdi
   4144a:	e8 09 10 00 00       	call   42458 <vmiter::try_map(unsigned long, int)>
    assert(r == 0);
   4144f:	85 c0                	test   %eax,%eax
   41451:	75 40                	jne    41493 <process_setup(int, char const*)+0x6f8>

    // set stack pointer
    ptable[pid].regs.reg_rsp = stack_addr + PAGESIZE;
   41453:	48 63 85 54 ff ff ff 	movslq -0xac(%rbp),%rax
   4145a:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
   4145e:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   41465:	00 
   41466:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
   4146a:	48 c7 04 cd e0 42 06 	movq   $0x300000,0x642e0(,%rcx,8)
   41471:	00 00 00 30 00 
    ptable[pid].state = P_RUNNABLE;
   41476:	c7 04 cd 2c 42 06 00 	movl   $0x1,0x6422c(,%rcx,8)
   4147d:	01 00 00 00 
}
   41481:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
   41488:	5b                   	pop    %rbx
   41489:	41 5c                	pop    %r12
   4148b:	41 5d                	pop    %r13
   4148d:	41 5e                	pop    %r14
   4148f:	41 5f                	pop    %r15
   41491:	5d                   	pop    %rbp
   41492:	c3                   	ret
    assert(r == 0);
   41493:	b9 00 00 00 00       	mov    $0x0,%ecx
   41498:	ba 1b 5f 04 00       	mov    $0x45f1b,%edx
   4149d:	be fe 00 00 00       	mov    $0xfe,%esi
   414a2:	bf fe 5e 04 00       	mov    $0x45efe,%edi
   414a7:	e8 11 22 00 00       	call   436bd <assert_fail(char const*, int, char const*, char const*)>

00000000000414ac <free_everything(x86_64_pagetable*)>:
    }

    panic("Should not get here!\n");
}

void free_everything(x86_64_pagetable* pagetable) {
   414ac:	f3 0f 1e fa          	endbr64
    if (!pagetable) {
   414b0:	48 85 ff             	test   %rdi,%rdi
   414b3:	0f 84 47 01 00 00    	je     41600 <free_everything(x86_64_pagetable*)+0x154>
void free_everything(x86_64_pagetable* pagetable) {
   414b9:	55                   	push   %rbp
   414ba:	48 89 e5             	mov    %rsp,%rbp
   414bd:	41 54                	push   %r12
   414bf:	53                   	push   %rbx
   414c0:	48 83 ec 20          	sub    $0x20,%rsp
   414c4:	48 89 fb             	mov    %rdi,%rbx
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   414c7:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
   414cb:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   414cf:	c7 45 e0 27 00 00 00 	movl   $0x27,-0x20(%rbp)
      perm_(initial_perm), va_(0) {
   414d6:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   414dd:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   414e4:	00 
    real_find(va, false);
   414e5:	ba 00 00 00 00       	mov    $0x0,%edx
   414ea:	be 00 00 00 00       	mov    $0x0,%esi
   414ef:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   414f3:	e8 2e 0e 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
    return va_;
   414f8:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
        return;
    }
    // freeing unmapped pages
    for (vmiter it(pagetable, 0); it.va() < MEMSIZE_VIRTUAL; it += PAGESIZE) {
   414fc:	48 81 fe ff ff 2f 00 	cmp    $0x2fffff,%rsi
   41503:	0f 87 a7 00 00 00    	ja     415b0 <free_everything(x86_64_pagetable*)+0x104>
            pa &= ~0x1000UL;
   41509:	49 bc 00 e0 ff ff ff 	movabs $0xfffffffffe000,%r12
   41510:	ff 0f 00 
   41513:	eb 42                	jmp    41557 <free_everything(x86_64_pagetable*)+0xab>
    return ~(~uintptr_t(0) << lbits);
   41515:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
   4151c:	48 d3 e7             	shl    %cl,%rdi
   4151f:	48 f7 d7             	not    %rdi
        return pa + (va_ & lbits_mask(lbits_));
   41522:	48 21 f7             	and    %rsi,%rdi
   41525:	48 01 c7             	add    %rax,%rdi
        if (it.present() && it.user()) {
            uintptr_t pa = it.pa();
            if (pa!= CONSOLE_ADDR) {
   41528:	48 81 ff 00 80 0b 00 	cmp    $0xb8000,%rdi
   4152f:	75 78                	jne    415a9 <free_everything(x86_64_pagetable*)+0xfd>
    return find(va_ + delta);
   41531:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   41535:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va, false);
   4153c:	ba 00 00 00 00       	mov    $0x0,%edx
   41541:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   41545:	e8 dc 0d 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
    return va_;
   4154a:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
    for (vmiter it(pagetable, 0); it.va() < MEMSIZE_VIRTUAL; it += PAGESIZE) {
   4154e:	48 81 fe ff ff 2f 00 	cmp    $0x2fffff,%rsi
   41555:	77 59                	ja     415b0 <free_everything(x86_64_pagetable*)+0x104>
    uint64_t ph = *pep_ & perm_;
   41557:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   4155b:	48 8b 38             	mov    (%rax),%rdi
   4155e:	48 63 55 e4          	movslq -0x1c(%rbp),%rdx
   41562:	48 21 fa             	and    %rdi,%rdx
    return ph & -(ph & PTE_P);
   41565:	48 89 d0             	mov    %rdx,%rax
   41568:	83 e0 01             	and    $0x1,%eax
   4156b:	48 f7 d8             	neg    %rax
   4156e:	48 21 d0             	and    %rdx,%rax
        if (it.present() && it.user()) {
   41571:	a8 01                	test   $0x1,%al
   41573:	74 bc                	je     41531 <free_everything(x86_64_pagetable*)+0x85>
   41575:	48 f7 d0             	not    %rax
   41578:	a8 05                	test   $0x5,%al
   4157a:	75 b5                	jne    41531 <free_everything(x86_64_pagetable*)+0x85>
    if (*pep_ & PTE_P) {
   4157c:	40 f6 c7 01          	test   $0x1,%dil
   41580:	74 20                	je     415a2 <free_everything(x86_64_pagetable*)+0xf6>
        if (lbits_ > PAGEOFFBITS) {
   41582:	8b 4d e0             	mov    -0x20(%rbp),%ecx
            pa &= ~0x1000UL;
   41585:	48 89 f8             	mov    %rdi,%rax
   41588:	4c 21 e0             	and    %r12,%rax
        if (lbits_ > PAGEOFFBITS) {
   4158b:	83 f9 0c             	cmp    $0xc,%ecx
   4158e:	7f 85                	jg     41515 <free_everything(x86_64_pagetable*)+0x69>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   41590:	48 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%rax
   41597:	ff 0f 00 
   4159a:	48 21 f8             	and    %rdi,%rax
   4159d:	e9 73 ff ff ff       	jmp    41515 <free_everything(x86_64_pagetable*)+0x69>
        return -1;
   415a2:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
                kfree((void*) pa);
   415a9:	e8 45 f6 ff ff       	call   40bf3 <kfree(void*)>
   415ae:	eb 81                	jmp    41531 <free_everything(x86_64_pagetable*)+0x85>
            }
        }
    }
    // freeing pagetable pages
    for (ptiter it(pagetable); !it.done(); it.next()) {
   415b0:	48 89 de             	mov    %rbx,%rsi
   415b3:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   415b7:	e8 8e 12 00 00       	call   4284a <ptiter::ptiter(x86_64_pagetable*)>
   415bc:	83 7d e0 40          	cmpl   $0x40,-0x20(%rbp)
   415c0:	74 2d                	je     415ef <free_everything(x86_64_pagetable*)+0x143>
}
inline void ptiter::next() {
    down(true);
}
inline uintptr_t ptiter::pa() const {
    return *pep_ & PTE_PAMASK;
   415c2:	49 bc 00 f0 ff ff ff 	movabs $0xffffffffff000,%r12
   415c9:	ff 0f 00 
   415cc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   415d0:	4c 89 e7             	mov    %r12,%rdi
   415d3:	48 23 38             	and    (%rax),%rdi
        kfree(it.kptr());
   415d6:	e8 18 f6 ff ff       	call   40bf3 <kfree(void*)>
    down(true);
   415db:	be 01 00 00 00       	mov    $0x1,%esi
   415e0:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   415e4:	e8 37 11 00 00       	call   42720 <ptiter::down(bool)>
    for (ptiter it(pagetable); !it.done(); it.next()) {
   415e9:	83 7d e0 40          	cmpl   $0x40,-0x20(%rbp)
   415ed:	75 dd                	jne    415cc <free_everything(x86_64_pagetable*)+0x120>
    }
    kfree(pagetable);
   415ef:	48 89 df             	mov    %rbx,%rdi
   415f2:	e8 fc f5 ff ff       	call   40bf3 <kfree(void*)>
}
   415f7:	48 83 c4 20          	add    $0x20,%rsp
   415fb:	5b                   	pop    %rbx
   415fc:	41 5c                	pop    %r12
   415fe:	5d                   	pop    %rbp
   415ff:	c3                   	ret
   41600:	c3                   	ret

0000000000041601 <sys_exit(int)>:

void sys_exit(pid_t pid) {
   41601:	f3 0f 1e fa          	endbr64
   41605:	55                   	push   %rbp
   41606:	48 89 e5             	mov    %rsp,%rbp
   41609:	41 54                	push   %r12
   4160b:	53                   	push   %rbx
    // calling helper function
    free_everything(ptable[pid].pagetable);
   4160c:	48 63 ff             	movslq %edi,%rdi
   4160f:	48 8d 1c 7f          	lea    (%rdi,%rdi,2),%rbx
   41613:	4c 8d 24 dd 00 00 00 	lea    0x0(,%rbx,8),%r12
   4161a:	00 
   4161b:	4a 8d 04 23          	lea    (%rbx,%r12,1),%rax
   4161f:	48 8b 3c c5 20 42 06 	mov    0x64220(,%rax,8),%rdi
   41626:	00 
   41627:	e8 80 fe ff ff       	call   414ac <free_everything(x86_64_pagetable*)>
    ptable[pid].pagetable = nullptr;
   4162c:	4a 8d 04 23          	lea    (%rbx,%r12,1),%rax
   41630:	48 c7 04 c5 20 42 06 	movq   $0x0,0x64220(,%rax,8)
   41637:	00 00 00 00 00 
    ptable[pid].state = P_FREE;
   4163c:	c7 04 c5 2c 42 06 00 	movl   $0x0,0x6422c(,%rax,8)
   41643:	00 00 00 00 
}
   41647:	5b                   	pop    %rbx
   41648:	41 5c                	pop    %r12
   4164a:	5d                   	pop    %rbp
   4164b:	c3                   	ret

000000000004164c <syscall_fork()>:


int syscall_fork() {
   4164c:	f3 0f 1e fa          	endbr64
   41650:	55                   	push   %rbp
   41651:	48 89 e5             	mov    %rsp,%rbp
   41654:	41 57                	push   %r15
   41656:	41 56                	push   %r14
   41658:	41 55                	push   %r13
   4165a:	41 54                	push   %r12
   4165c:	53                   	push   %rbx
   4165d:	48 83 ec 48          	sub    $0x48,%rsp
    pid_t child_pid = 0;

    // finding available slot
    for (pid_t i = 1; i < PID_MAX; i++) {
   41661:	b8 04 43 06 00       	mov    $0x64304,%eax
   41666:	41 bd 01 00 00 00    	mov    $0x1,%r13d
        if (ptable[i].state == P_FREE) {
   4166c:	83 38 00             	cmpl   $0x0,(%rax)
   4166f:	74 28                	je     41699 <syscall_fork()+0x4d>
    for (pid_t i = 1; i < PID_MAX; i++) {
   41671:	41 83 c5 01          	add    $0x1,%r13d
   41675:	48 05 d8 00 00 00    	add    $0xd8,%rax
   4167b:	41 83 fd 10          	cmp    $0x10,%r13d
   4167f:	75 eb                	jne    4166c <syscall_fork()+0x20>
            break;
        }
    }

    if (child_pid == 0) {
        return -1;
   41681:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d

    ptable[child_pid].regs = current->regs;
    ptable[child_pid].regs.reg_rax = 0;  

    return child_pid;  
}
   41687:	44 89 e8             	mov    %r13d,%eax
   4168a:	48 83 c4 48          	add    $0x48,%rsp
   4168e:	5b                   	pop    %rbx
   4168f:	41 5c                	pop    %r12
   41691:	41 5d                	pop    %r13
   41693:	41 5e                	pop    %r14
   41695:	41 5f                	pop    %r15
   41697:	5d                   	pop    %rbp
   41698:	c3                   	ret
    if (child_pid == 0) {
   41699:	45 85 ed             	test   %r13d,%r13d
   4169c:	0f 84 b4 03 00 00    	je     41a56 <syscall_fork()+0x40a>
    proc* child_proc = &ptable[child_pid];
   416a2:	49 63 c5             	movslq %r13d,%rax
   416a5:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
   416a9:	48 8d 04 c0          	lea    (%rax,%rax,8),%rax
   416ad:	48 8d 3c c5 20 42 06 	lea    0x64220(,%rax,8),%rdi
   416b4:	00 
    init_process(child_proc, 0);
   416b5:	be 00 00 00 00       	mov    $0x0,%esi
   416ba:	e8 f3 13 00 00       	call   42ab2 <init_process(proc*, int)>
    x86_64_pagetable* child_pagetable = kalloc_pagetable();
   416bf:	e8 39 13 00 00       	call   429fd <kalloc_pagetable()>
    if (!child_pagetable) {
   416c4:	48 85 c0             	test   %rax,%rax
   416c7:	0f 84 cd 00 00 00    	je     4179a <syscall_fork()+0x14e>
    child_proc->pagetable = child_pagetable;
   416cd:	49 63 d5             	movslq %r13d,%rdx
   416d0:	48 8d 1c 52          	lea    (%rdx,%rdx,2),%rbx
   416d4:	4c 8d 24 dd 00 00 00 	lea    0x0(,%rbx,8),%r12
   416db:	00 
   416dc:	4a 8d 14 23          	lea    (%rbx,%r12,1),%rdx
   416e0:	48 89 04 d5 20 42 06 	mov    %rax,0x64220(,%rdx,8)
   416e7:	00 
    ptable[child_pid].state = P_RUNNABLE;
   416e8:	c7 04 d5 2c 42 06 00 	movl   $0x1,0x6422c(,%rdx,8)
   416ef:	01 00 00 00 
    vmiter parent_iter(current->pagetable, 0);
   416f3:	48 8b 05 06 2b 02 00 	mov    0x22b06(%rip),%rax        # 64200 <current>
   416fa:	48 8b 00             	mov    (%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   416fd:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   41701:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   41705:	c7 45 c0 27 00 00 00 	movl   $0x27,-0x40(%rbp)
      perm_(initial_perm), va_(0) {
   4170c:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   41713:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   4171a:	00 
    real_find(va, false);
   4171b:	ba 00 00 00 00       	mov    $0x0,%edx
   41720:	be 00 00 00 00       	mov    $0x0,%esi
   41725:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   41729:	e8 f8 0b 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
    vmiter child_iter(ptable[child_pid].pagetable, parent_iter.va());
   4172e:	4c 01 e3             	add    %r12,%rbx
   41731:	48 8b 04 dd 20 42 06 	mov    0x64220(,%rbx,8),%rax
   41738:	00 
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   41739:	48 89 45 90          	mov    %rax,-0x70(%rbp)
   4173d:	48 89 45 98          	mov    %rax,-0x68(%rbp)
   41741:	c7 45 a0 27 00 00 00 	movl   $0x27,-0x60(%rbp)
      perm_(initial_perm), va_(0) {
   41748:	c7 45 a4 ff 0f 00 00 	movl   $0xfff,-0x5c(%rbp)
   4174f:	48 c7 45 a8 00 00 00 	movq   $0x0,-0x58(%rbp)
   41756:	00 
    real_find(va, false);
   41757:	ba 00 00 00 00       	mov    $0x0,%edx
   4175c:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
   41760:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
   41764:	e8 bd 0b 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
    return va_;
   41769:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    for (; parent_iter.va() < MEMSIZE_VIRTUAL; parent_iter += PAGESIZE, child_iter += PAGESIZE) {
   4176d:	48 81 fa ff ff 2f 00 	cmp    $0x2fffff,%rdx
   41774:	0f 87 97 02 00 00    	ja     41a11 <syscall_fork()+0x3c5>
            pa &= ~0x1000UL;
   4177a:	49 bc 00 e0 ff ff ff 	movabs $0xfffffffffe000,%r12
   41781:	ff 0f 00 
    return ~(~uintptr_t(0) << lbits);
   41784:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
        uintptr_t pa = *pep_ & PTE_PAMASK;
   4178b:	49 be 00 f0 ff ff ff 	movabs $0xffffffffff000,%r14
   41792:	ff 0f 00 
   41795:	e9 c0 00 00 00       	jmp    4185a <syscall_fork()+0x20e>
        child_proc->state = P_FREE;
   4179a:	4d 63 ed             	movslq %r13d,%r13
   4179d:	4b 8d 44 6d 00       	lea    0x0(%r13,%r13,2),%rax
   417a2:	48 8d 04 c0          	lea    (%rax,%rax,8),%rax
   417a6:	c7 04 c5 2c 42 06 00 	movl   $0x0,0x6422c(,%rax,8)
   417ad:	00 00 00 00 
        return -1;
   417b1:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   417b7:	e9 cb fe ff ff       	jmp    41687 <syscall_fork()+0x3b>
        if (parent_iter.writable() && parent_iter.user() && parent_iter.pa() != CONSOLE_ADDR) {
   417bc:	f6 c1 05             	test   $0x5,%cl
   417bf:	0f 84 0a 01 00 00    	je     418cf <syscall_fork()+0x283>
    uint64_t ph = *pep_ & perm_;
   417c5:	49 8b 38             	mov    (%r8),%rdi
   417c8:	48 21 fe             	and    %rdi,%rsi
    return ph & -(ph & PTE_P);
   417cb:	48 89 f0             	mov    %rsi,%rax
   417ce:	83 e0 01             	and    $0x1,%eax
   417d1:	48 f7 d8             	neg    %rax
            if (child_iter.try_map(parent_iter.pa(), parent_iter.perm()) != 0) {
   417d4:	21 f0                	and    %esi,%eax
        return -1;
   417d6:	48 89 de             	mov    %rbx,%rsi
    if (*pep_ & PTE_P) {
   417d9:	40 f6 c7 01          	test   $0x1,%dil
   417dd:	74 25                	je     41804 <syscall_fork()+0x1b8>
        if (lbits_ > PAGEOFFBITS) {
   417df:	8b 4d c0             	mov    -0x40(%rbp),%ecx
        uintptr_t pa = *pep_ & PTE_PAMASK;
   417e2:	48 89 fe             	mov    %rdi,%rsi
   417e5:	4c 21 f6             	and    %r14,%rsi
   417e8:	4c 21 e7             	and    %r12,%rdi
   417eb:	49 89 f8             	mov    %rdi,%r8
   417ee:	83 f9 0c             	cmp    $0xc,%ecx
   417f1:	4c 0f 4e c6          	cmovle %rsi,%r8
    return ~(~uintptr_t(0) << lbits);
   417f5:	48 89 de             	mov    %rbx,%rsi
   417f8:	48 d3 e6             	shl    %cl,%rsi
   417fb:	48 f7 d6             	not    %rsi
        return pa + (va_ & lbits_mask(lbits_));
   417fe:	48 21 d6             	and    %rdx,%rsi
   41801:	4c 01 c6             	add    %r8,%rsi
   41804:	89 c2                	mov    %eax,%edx
   41806:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
   4180a:	e8 49 0c 00 00       	call   42458 <vmiter::try_map(unsigned long, int)>
   4180f:	85 c0                	test   %eax,%eax
   41811:	0f 85 e7 01 00 00    	jne    419fe <syscall_fork()+0x3b2>
    return find(va_ + delta);
   41817:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   4181b:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va, false);
   41822:	ba 00 00 00 00       	mov    $0x0,%edx
   41827:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   4182b:	e8 f6 0a 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
    return find(va_ + delta);
   41830:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   41834:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va, false);
   4183b:	ba 00 00 00 00       	mov    $0x0,%edx
   41840:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
   41844:	e8 dd 0a 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
    return va_;
   41849:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    for (; parent_iter.va() < MEMSIZE_VIRTUAL; parent_iter += PAGESIZE, child_iter += PAGESIZE) {
   4184d:	48 81 fa ff ff 2f 00 	cmp    $0x2fffff,%rdx
   41854:	0f 87 b7 01 00 00    	ja     41a11 <syscall_fork()+0x3c5>
    uint64_t ph = *pep_ & perm_;
   4185a:	4c 8b 45 b8          	mov    -0x48(%rbp),%r8
   4185e:	49 8b 38             	mov    (%r8),%rdi
   41861:	48 63 75 c4          	movslq -0x3c(%rbp),%rsi
   41865:	48 89 f9             	mov    %rdi,%rcx
   41868:	48 21 f1             	and    %rsi,%rcx
    return ph & -(ph & PTE_P);
   4186b:	48 89 c8             	mov    %rcx,%rax
   4186e:	83 e0 01             	and    $0x1,%eax
   41871:	48 f7 d8             	neg    %rax
   41874:	48 21 c8             	and    %rcx,%rax
        if (parent_iter.writable() && parent_iter.user() && parent_iter.pa() != CONSOLE_ADDR) {
   41877:	48 89 c1             	mov    %rax,%rcx
   4187a:	48 f7 d1             	not    %rcx
   4187d:	f6 c1 03             	test   $0x3,%cl
   41880:	0f 84 36 ff ff ff    	je     417bc <syscall_fork()+0x170>
            if (parent_iter.user() && !parent_iter.writable()) {
   41886:	48 f7 d0             	not    %rax
   41889:	a8 05                	test   $0x5,%al
   4188b:	0f 85 34 ff ff ff    	jne    417c5 <syscall_fork()+0x179>
        return -1;
   41891:	48 89 d8             	mov    %rbx,%rax
    if (*pep_ & PTE_P) {
   41894:	40 f6 c7 01          	test   $0x1,%dil
   41898:	74 25                	je     418bf <syscall_fork()+0x273>
        if (lbits_ > PAGEOFFBITS) {
   4189a:	8b 4d c0             	mov    -0x40(%rbp),%ecx
            pa &= ~0x1000UL;
   4189d:	48 89 f8             	mov    %rdi,%rax
   418a0:	4c 21 e0             	and    %r12,%rax
        uintptr_t pa = *pep_ & PTE_PAMASK;
   418a3:	49 89 f9             	mov    %rdi,%r9
   418a6:	4d 21 f1             	and    %r14,%r9
   418a9:	83 f9 0c             	cmp    $0xc,%ecx
   418ac:	4c 0f 4f c8          	cmovg  %rax,%r9
    return ~(~uintptr_t(0) << lbits);
   418b0:	48 89 d8             	mov    %rbx,%rax
   418b3:	48 d3 e0             	shl    %cl,%rax
   418b6:	48 f7 d0             	not    %rax
        return pa + (va_ & lbits_mask(lbits_));
   418b9:	48 21 d0             	and    %rdx,%rax
   418bc:	4c 01 c8             	add    %r9,%rax
                auto page_index = parent_iter.pa() / PAGESIZE;
   418bf:	48 c1 e8 0c          	shr    $0xc,%rax
                physpages[page_index].refcount++;
   418c3:	80 80 00 40 06 00 01 	addb   $0x1,0x64000(%rax)
   418ca:	e9 f6 fe ff ff       	jmp    417c5 <syscall_fork()+0x179>
    if (*pep_ & PTE_P) {
   418cf:	40 f6 c7 01          	test   $0x1,%dil
   418d3:	74 48                	je     4191d <syscall_fork()+0x2d1>
        if (lbits_ > PAGEOFFBITS) {
   418d5:	8b 4d c0             	mov    -0x40(%rbp),%ecx
            pa &= ~0x1000UL;
   418d8:	49 89 f9             	mov    %rdi,%r9
   418db:	4d 21 e1             	and    %r12,%r9
        if (lbits_ > PAGEOFFBITS) {
   418de:	83 f9 0c             	cmp    $0xc,%ecx
   418e1:	7f 0d                	jg     418f0 <syscall_fork()+0x2a4>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   418e3:	49 b9 00 f0 ff ff ff 	movabs $0xffffffffff000,%r9
   418ea:	ff 0f 00 
   418ed:	49 21 f9             	and    %rdi,%r9
    return ~(~uintptr_t(0) << lbits);
   418f0:	48 89 d8             	mov    %rbx,%rax
   418f3:	48 d3 e0             	shl    %cl,%rax
   418f6:	48 f7 d0             	not    %rax
        return pa + (va_ & lbits_mask(lbits_));
   418f9:	48 21 d0             	and    %rdx,%rax
   418fc:	4c 01 c8             	add    %r9,%rax
        if (parent_iter.writable() && parent_iter.user() && parent_iter.pa() != CONSOLE_ADDR) {
   418ff:	48 3d 00 80 0b 00    	cmp    $0xb8000,%rax
   41905:	75 16                	jne    4191d <syscall_fork()+0x2d1>
    uint64_t ph = *pep_ & perm_;
   41907:	49 8b 38             	mov    (%r8),%rdi
   4190a:	48 21 fe             	and    %rdi,%rsi
    return ph & -(ph & PTE_P);
   4190d:	48 89 f0             	mov    %rsi,%rax
   41910:	83 e0 01             	and    $0x1,%eax
   41913:	48 f7 d8             	neg    %rax
            if (child_iter.try_map(parent_iter.pa(), parent_iter.perm()) != 0) {
   41916:	21 f0                	and    %esi,%eax
    if (*pep_ & PTE_P) {
   41918:	e9 c2 fe ff ff       	jmp    417df <syscall_fork()+0x193>
            void* new_page = kalloc(PAGESIZE);
   4191d:	bf 00 10 00 00       	mov    $0x1000,%edi
   41922:	e8 3f f2 ff ff       	call   40b66 <kalloc(unsigned long)>
   41927:	49 89 c7             	mov    %rax,%r15
            if (!new_page) {
   4192a:	48 85 c0             	test   %rax,%rax
   4192d:	0f 84 98 00 00 00    	je     419cb <syscall_fork()+0x37f>
    if (*pep_ & PTE_P) {
   41933:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   41937:	48 8b 10             	mov    (%rax),%rdx
   4193a:	f6 c2 01             	test   $0x1,%dl
   4193d:	0f 84 b1 00 00 00    	je     419f4 <syscall_fork()+0x3a8>
        if (lbits_ > PAGEOFFBITS) {
   41943:	8b 4d c0             	mov    -0x40(%rbp),%ecx
            pa &= ~0x1000UL;
   41946:	48 b8 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rax
   4194d:	ff 0f 00 
   41950:	48 21 d0             	and    %rdx,%rax
        if (lbits_ > PAGEOFFBITS) {
   41953:	83 f9 0c             	cmp    $0xc,%ecx
   41956:	7f 0d                	jg     41965 <syscall_fork()+0x319>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   41958:	48 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%rax
   4195f:	ff 0f 00 
   41962:	48 21 d0             	and    %rdx,%rax
    return ~(~uintptr_t(0) << lbits);
   41965:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
   4196c:	48 d3 e6             	shl    %cl,%rsi
   4196f:	48 f7 d6             	not    %rsi
        return pa + (va_ & lbits_mask(lbits_));
   41972:	48 23 75 c8          	and    -0x38(%rbp),%rsi
   41976:	48 01 c6             	add    %rax,%rsi
            memcpy(new_page, parent_iter.kptr(), PAGESIZE);
   41979:	ba 00 10 00 00       	mov    $0x1000,%edx
   4197e:	4c 89 ff             	mov    %r15,%rdi
   41981:	e8 08 38 00 00       	call   4518e <memcpy>
    uint64_t ph = *pep_ & perm_;
   41986:	48 63 45 c4          	movslq -0x3c(%rbp),%rax
   4198a:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
   4198e:	48 23 02             	and    (%rdx),%rax
    return ph & -(ph & PTE_P);
   41991:	48 89 c2             	mov    %rax,%rdx
   41994:	83 e2 01             	and    $0x1,%edx
   41997:	48 f7 da             	neg    %rdx
    return try_map(reinterpret_cast<uintptr_t>(kp), perm);
   4199a:	21 c2                	and    %eax,%edx
   4199c:	4c 89 fe             	mov    %r15,%rsi
   4199f:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
   419a3:	e8 b0 0a 00 00       	call   42458 <vmiter::try_map(unsigned long, int)>
            if (r != 0) {
   419a8:	85 c0                	test   %eax,%eax
   419aa:	0f 84 67 fe ff ff    	je     41817 <syscall_fork()+0x1cb>
                kfree(new_page); 
   419b0:	4c 89 ff             	mov    %r15,%rdi
   419b3:	e8 3b f2 ff ff       	call   40bf3 <kfree(void*)>
                sys_exit(child_pid); 
   419b8:	44 89 ef             	mov    %r13d,%edi
   419bb:	e8 41 fc ff ff       	call   41601 <sys_exit(int)>
                return -1;
   419c0:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   419c6:	e9 bc fc ff ff       	jmp    41687 <syscall_fork()+0x3b>
                ptable[child_pid].state = P_FREE;
   419cb:	49 63 c5             	movslq %r13d,%rax
   419ce:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
   419d2:	48 8d 04 c0          	lea    (%rax,%rax,8),%rax
   419d6:	c7 04 c5 2c 42 06 00 	movl   $0x0,0x6422c(,%rax,8)
   419dd:	00 00 00 00 
                sys_exit(child_pid);
   419e1:	44 89 ef             	mov    %r13d,%edi
   419e4:	e8 18 fc ff ff       	call   41601 <sys_exit(int)>
                return -1;
   419e9:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   419ef:	e9 93 fc ff ff       	jmp    41687 <syscall_fork()+0x3b>
        return nullptr;
   419f4:	be 00 00 00 00       	mov    $0x0,%esi
   419f9:	e9 7b ff ff ff       	jmp    41979 <syscall_fork()+0x32d>
                sys_exit(child_pid);
   419fe:	44 89 ef             	mov    %r13d,%edi
   41a01:	e8 fb fb ff ff       	call   41601 <sys_exit(int)>
                return -1;
   41a06:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   41a0c:	e9 76 fc ff ff       	jmp    41687 <syscall_fork()+0x3b>
    ptable[child_pid].regs = current->regs;
   41a11:	49 63 c5             	movslq %r13d,%rax
   41a14:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
   41a18:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
   41a1f:	00 
   41a20:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
   41a24:	4c 8d 04 cd 30 42 06 	lea    0x64230(,%rcx,8),%r8
   41a2b:	00 
   41a2c:	48 8b 1d cd 27 02 00 	mov    0x227cd(%rip),%rbx        # 64200 <current>
   41a33:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   41a37:	b9 18 00 00 00       	mov    $0x18,%ecx
   41a3c:	4c 89 c7             	mov    %r8,%rdi
   41a3f:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    ptable[child_pid].regs.reg_rax = 0;  
   41a42:	48 01 d0             	add    %rdx,%rax
   41a45:	48 c7 04 c5 30 42 06 	movq   $0x0,0x64230(,%rax,8)
   41a4c:	00 00 00 00 00 
    return child_pid;  
   41a51:	e9 31 fc ff ff       	jmp    41687 <syscall_fork()+0x3b>
        return -1;
   41a56:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   41a5c:	e9 26 fc ff ff       	jmp    41687 <syscall_fork()+0x3b>

0000000000041a61 <sys_kill(int)>:

int sys_kill(pid_t target_pid) {
   41a61:	f3 0f 1e fa          	endbr64
   41a65:	55                   	push   %rbp
   41a66:	48 89 e5             	mov    %rsp,%rbp
   41a69:	41 54                	push   %r12
   41a6b:	53                   	push   %rbx
    if (ptable[target_pid].state = P_FREE) {
   41a6c:	48 63 ff             	movslq %edi,%rdi
   41a6f:	48 8d 1c 7f          	lea    (%rdi,%rdi,2),%rbx
   41a73:	4c 8d 24 dd 00 00 00 	lea    0x0(,%rbx,8),%r12
   41a7a:	00 
   41a7b:	4a 8d 04 23          	lea    (%rbx,%r12,1),%rax
   41a7f:	c7 04 c5 2c 42 06 00 	movl   $0x0,0x6422c(,%rax,8)
   41a86:	00 00 00 00 
        return -1;
    }

    free_everything(ptable[target_pid].pagetable);
   41a8a:	48 8b 3c c5 20 42 06 	mov    0x64220(,%rax,8),%rdi
   41a91:	00 
   41a92:	e8 15 fa ff ff       	call   414ac <free_everything(x86_64_pagetable*)>

    ptable[target_pid].state = P_FREE;
   41a97:	4a 8d 04 23          	lea    (%rbx,%r12,1),%rax
   41a9b:	c7 04 c5 2c 42 06 00 	movl   $0x0,0x6422c(,%rax,8)
   41aa2:	00 00 00 00 
    ptable[target_pid].pagetable = nullptr;
   41aa6:	48 c7 04 c5 20 42 06 	movq   $0x0,0x64220(,%rax,8)
   41aad:	00 00 00 00 00 
    return 0; 
}
   41ab2:	b8 00 00 00 00       	mov    $0x0,%eax
   41ab7:	5b                   	pop    %rbx
   41ab8:	41 5c                	pop    %r12
   41aba:	5d                   	pop    %rbp
   41abb:	c3                   	ret

0000000000041abc <syscall_page_alloc(unsigned long)>:
// syscall_page_alloc(addr)
//    Handles the SYSCALL_PAGE_ALLOC system call. This function
//    should implement the specification for `sys_page_alloc`
//    in `u-lib.hh` (but in the handout code, it does not).

int syscall_page_alloc(uintptr_t addr) {
   41abc:	f3 0f 1e fa          	endbr64
   41ac0:	55                   	push   %rbp
   41ac1:	48 89 e5             	mov    %rsp,%rbp
   41ac4:	41 54                	push   %r12
   41ac6:	53                   	push   %rbx
   41ac7:	48 83 ec 20          	sub    $0x20,%rsp
    // checking address to allocate
    if (addr == 0 || addr < PROC_START_ADDR || addr >= MEMSIZE_VIRTUAL){ 
   41acb:	48 8d 87 00 00 f0 ff 	lea    -0x100000(%rdi),%rax
   41ad2:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   41ad8:	0f 87 e5 00 00 00    	ja     41bc3 <syscall_page_alloc(unsigned long)+0x107>
   41ade:	48 89 fb             	mov    %rdi,%rbx
        return -1;
    }
    
    // allocating a page
    void* heap_ptr = (void*) kalloc(PAGESIZE);
   41ae1:	bf 00 10 00 00       	mov    $0x1000,%edi
   41ae6:	e8 7b f0 ff ff       	call   40b66 <kalloc(unsigned long)>
   41aeb:	49 89 c4             	mov    %rax,%r12
    if (!heap_ptr){
   41aee:	48 85 c0             	test   %rax,%rax
   41af1:	0f 84 d3 00 00 00    	je     41bca <syscall_page_alloc(unsigned long)+0x10e>
        return -1;
    }

    vmiter it(current->pagetable, addr);
   41af7:	48 8b 05 02 27 02 00 	mov    0x22702(%rip),%rax        # 64200 <current>
   41afe:	48 8b 00             	mov    (%rax),%rax
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   41b01:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
   41b05:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
   41b09:	c7 45 e0 27 00 00 00 	movl   $0x27,-0x20(%rbp)
      perm_(initial_perm), va_(0) {
   41b10:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   41b17:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   41b1e:	00 
    real_find(va, false);
   41b1f:	ba 00 00 00 00       	mov    $0x0,%edx
   41b24:	48 89 de             	mov    %rbx,%rsi
   41b27:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   41b2b:	e8 f6 07 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
    return try_map(reinterpret_cast<uintptr_t>(kp), perm);
   41b30:	ba 07 00 00 00       	mov    $0x7,%edx
   41b35:	4c 89 e6             	mov    %r12,%rsi
   41b38:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   41b3c:	e8 17 09 00 00       	call   42458 <vmiter::try_map(unsigned long, int)>
   41b41:	89 c3                	mov    %eax,%ebx
    int r = it.try_map(heap_ptr, PTE_P | PTE_W | PTE_U);
    assert(r == 0);
   41b43:	85 c0                	test   %eax,%eax
   41b45:	75 63                	jne    41baa <syscall_page_alloc(unsigned long)+0xee>
    if (*pep_ & PTE_P) {
   41b47:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   41b4b:	48 8b 10             	mov    (%rax),%rdx
        return -1;
   41b4e:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
    if (*pep_ & PTE_P) {
   41b55:	f6 c2 01             	test   $0x1,%dl
   41b58:	74 36                	je     41b90 <syscall_page_alloc(unsigned long)+0xd4>
        if (lbits_ > PAGEOFFBITS) {
   41b5a:	8b 4d e0             	mov    -0x20(%rbp),%ecx
            pa &= ~0x1000UL;
   41b5d:	48 b8 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rax
   41b64:	ff 0f 00 
   41b67:	48 21 d0             	and    %rdx,%rax
        if (lbits_ > PAGEOFFBITS) {
   41b6a:	83 f9 0c             	cmp    $0xc,%ecx
   41b6d:	7f 0d                	jg     41b7c <syscall_page_alloc(unsigned long)+0xc0>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   41b6f:	48 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%rax
   41b76:	ff 0f 00 
   41b79:	48 21 d0             	and    %rdx,%rax
    return ~(~uintptr_t(0) << lbits);
   41b7c:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
   41b83:	48 d3 e7             	shl    %cl,%rdi
   41b86:	48 f7 d7             	not    %rdi
        return pa + (va_ & lbits_mask(lbits_));
   41b89:	48 23 7d e8          	and    -0x18(%rbp),%rdi
   41b8d:	48 01 c7             	add    %rax,%rdi

    memset((void*) it.pa(), 0, PAGESIZE);
   41b90:	ba 00 10 00 00       	mov    $0x1000,%edx
   41b95:	be 00 00 00 00       	mov    $0x0,%esi
   41b9a:	e8 13 36 00 00       	call   451b2 <memset>
    return 0;
    
}
   41b9f:	89 d8                	mov    %ebx,%eax
   41ba1:	48 83 c4 20          	add    $0x20,%rsp
   41ba5:	5b                   	pop    %rbx
   41ba6:	41 5c                	pop    %r12
   41ba8:	5d                   	pop    %rbp
   41ba9:	c3                   	ret
    assert(r == 0);
   41baa:	b9 00 00 00 00       	mov    $0x0,%ecx
   41baf:	ba 1b 5f 04 00       	mov    $0x45f1b,%edx
   41bb4:	be 42 02 00 00       	mov    $0x242,%esi
   41bb9:	bf fe 5e 04 00       	mov    $0x45efe,%edi
   41bbe:	e8 fa 1a 00 00       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
        return -1;
   41bc3:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
   41bc8:	eb d5                	jmp    41b9f <syscall_page_alloc(unsigned long)+0xe3>
        return -1;
   41bca:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
   41bcf:	eb ce                	jmp    41b9f <syscall_page_alloc(unsigned long)+0xe3>

0000000000041bd1 <run(proc*)>:

// run(p)
//    Run process `p`. This involves setting `current = p` and calling
//    `exception_return` to restore its page table and registers.

void run(proc* p) {
   41bd1:	f3 0f 1e fa          	endbr64
   41bd5:	55                   	push   %rbp
   41bd6:	48 89 e5             	mov    %rsp,%rbp
   41bd9:	53                   	push   %rbx
   41bda:	48 83 ec 08          	sub    $0x8,%rsp
    assert(p->state == P_RUNNABLE);
   41bde:	83 7f 0c 01          	cmpl   $0x1,0xc(%rdi)
   41be2:	75 1f                	jne    41c03 <run(proc*)+0x32>
   41be4:	48 89 fb             	mov    %rdi,%rbx
    current = p;
   41be7:	48 89 3d 12 26 02 00 	mov    %rdi,0x22612(%rip)        # 64200 <current>

    // Check the process's current registers.
    check_process_registers(p);
   41bee:	e8 5d 20 00 00       	call   43c50 <check_process_registers(proc const*)>

    // Check the process's current pagetable.
    check_pagetable(p->pagetable);
   41bf3:	48 8b 3b             	mov    (%rbx),%rdi
   41bf6:	e8 cf 20 00 00       	call   43cca <check_pagetable(x86_64_pagetable*)>

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(p);
   41bfb:	48 89 df             	mov    %rbx,%rdi
   41bfe:	e8 9c ee ff ff       	call   40a9f <exception_return(proc*)>
    assert(p->state == P_RUNNABLE);
   41c03:	b9 00 00 00 00       	mov    $0x0,%ecx
   41c08:	ba 38 5f 04 00       	mov    $0x45f38,%edx
   41c0d:	be 66 02 00 00       	mov    $0x266,%esi
   41c12:	bf fe 5e 04 00       	mov    $0x45efe,%edi
   41c17:	e8 a1 1a 00 00       	call   436bd <assert_fail(char const*, int, char const*, char const*)>

0000000000041c1c <kernel_start(char const*)>:
void kernel_start(const char* command) {
   41c1c:	f3 0f 1e fa          	endbr64
   41c20:	55                   	push   %rbp
   41c21:	48 89 e5             	mov    %rsp,%rbp
   41c24:	41 55                	push   %r13
   41c26:	41 54                	push   %r12
   41c28:	53                   	push   %rbx
   41c29:	48 83 ec 38          	sub    $0x38,%rsp
   41c2d:	49 89 fd             	mov    %rdi,%r13
    init_hardware();
   41c30:	e8 4d 1b 00 00       	call   43782 <init_hardware()>
    log_printf("Starting WeensyOS\n");
   41c35:	bf 5a 5f 04 00       	mov    $0x45f5a,%edi
   41c3a:	b8 00 00 00 00       	mov    $0x0,%eax
   41c3f:	e8 a6 10 00 00       	call   42cea <log_printf(char const*, ...)>
	  = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_acquire);
	__glibcxx_assert(__b != memory_order_acq_rel);
	__glibcxx_assert(__b != memory_order_consume);

	__atomic_store_n(&_M_i, __i, int(__m));
   41c44:	b8 01 00 00 00       	mov    $0x1,%eax
   41c49:	48 87 05 58 33 02 00 	xchg   %rax,0x23358(%rip)        # 64fa8 <ticks>
    init_timer(HZ);
   41c50:	bf 64 00 00 00       	mov    $0x64,%edi
   41c55:	e8 79 0d 00 00       	call   429d3 <init_timer(int)>
    console_clear();
   41c5a:	e8 bb 3f 00 00       	call   45c1a <console_clear()>
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   41c5f:	bb 00 00 00 00       	mov    $0x0,%ebx
   41c64:	e9 b5 00 00 00       	jmp    41d1e <kernel_start(char const*)+0x102>
        assert(r == 0); // mappings during kernel_start MUST NOT fail
   41c69:	b9 00 00 00 00       	mov    $0x0,%ecx
   41c6e:	ba 1b 5f 04 00       	mov    $0x45f1b,%edx
   41c73:	be 4c 00 00 00       	mov    $0x4c,%esi
   41c78:	bf fe 5e 04 00       	mov    $0x45efe,%edi
   41c7d:	e8 3b 1a 00 00       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
        process_setup(1, "allocator");
   41c82:	be 6d 5f 04 00       	mov    $0x45f6d,%esi
   41c87:	bf 01 00 00 00       	mov    $0x1,%edi
   41c8c:	e8 0a f1 ff ff       	call   40d9b <process_setup(int, char const*)>
        process_setup(2, "allocator2");
   41c91:	be 77 5f 04 00       	mov    $0x45f77,%esi
   41c96:	bf 02 00 00 00       	mov    $0x2,%edi
   41c9b:	e8 fb f0 ff ff       	call   40d9b <process_setup(int, char const*)>
        process_setup(3, "allocator3");
   41ca0:	be 82 5f 04 00       	mov    $0x45f82,%esi
   41ca5:	bf 03 00 00 00       	mov    $0x3,%edi
   41caa:	e8 ec f0 ff ff       	call   40d9b <process_setup(int, char const*)>
        process_setup(4, "allocator4");
   41caf:	be 8d 5f 04 00       	mov    $0x45f8d,%esi
   41cb4:	bf 04 00 00 00       	mov    $0x4,%edi
   41cb9:	e8 dd f0 ff ff       	call   40d9b <process_setup(int, char const*)>
   41cbe:	e9 2b 01 00 00       	jmp    41dee <kernel_start(char const*)+0x1d2>
            perm = 0;
   41cc3:	41 bc 00 00 00 00    	mov    $0x0,%r12d
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   41cc9:	48 c7 45 b8 00 60 06 	movq   $0x66000,-0x48(%rbp)
   41cd0:	00 
   41cd1:	48 c7 45 c0 00 60 06 	movq   $0x66000,-0x40(%rbp)
   41cd8:	00 
   41cd9:	c7 45 c8 27 00 00 00 	movl   $0x27,-0x38(%rbp)
      perm_(initial_perm), va_(0) {
   41ce0:	c7 45 cc ff 0f 00 00 	movl   $0xfff,-0x34(%rbp)
   41ce7:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
   41cee:	00 
    real_find(va, false);
   41cef:	ba 00 00 00 00       	mov    $0x0,%edx
   41cf4:	48 89 de             	mov    %rbx,%rsi
   41cf7:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
   41cfb:	e8 26 06 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
        int r = vmiter(kernel_pagetable, addr).try_map(addr, perm);
   41d00:	44 89 e2             	mov    %r12d,%edx
   41d03:	48 89 de             	mov    %rbx,%rsi
   41d06:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
   41d0a:	e8 49 07 00 00       	call   42458 <vmiter::try_map(unsigned long, int)>
        assert(r == 0); // mappings during kernel_start MUST NOT fail
   41d0f:	85 c0                	test   %eax,%eax
   41d11:	0f 85 52 ff ff ff    	jne    41c69 <kernel_start(char const*)+0x4d>
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   41d17:	48 81 c3 00 10 00 00 	add    $0x1000,%rbx
        if (addr == 0) {
   41d1e:	48 85 db             	test   %rbx,%rbx
   41d21:	74 a0                	je     41cc3 <kernel_start(char const*)+0xa7>
        } else if (addr < PROC_START_ADDR && addr != CONSOLE_ADDR){
   41d23:	48 81 fb ff ff 0f 00 	cmp    $0xfffff,%rbx
   41d2a:	77 0f                	ja     41d3b <kernel_start(char const*)+0x11f>
            perm = PTE_P | PTE_W;
   41d2c:	41 bc 03 00 00 00    	mov    $0x3,%r12d
        } else if (addr < PROC_START_ADDR && addr != CONSOLE_ADDR){
   41d32:	48 81 fb 00 80 0b 00 	cmp    $0xb8000,%rbx
   41d39:	75 8e                	jne    41cc9 <kernel_start(char const*)+0xad>
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   41d3b:	48 c7 45 b8 00 60 06 	movq   $0x66000,-0x48(%rbp)
   41d42:	00 
   41d43:	48 c7 45 c0 00 60 06 	movq   $0x66000,-0x40(%rbp)
   41d4a:	00 
   41d4b:	c7 45 c8 27 00 00 00 	movl   $0x27,-0x38(%rbp)
      perm_(initial_perm), va_(0) {
   41d52:	c7 45 cc ff 0f 00 00 	movl   $0xfff,-0x34(%rbp)
   41d59:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
   41d60:	00 
    real_find(va, false);
   41d61:	ba 00 00 00 00       	mov    $0x0,%edx
   41d66:	48 89 de             	mov    %rbx,%rsi
   41d69:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
   41d6d:	e8 b4 05 00 00       	call   42326 <vmiter::real_find(unsigned long, bool)>
        int r = vmiter(kernel_pagetable, addr).try_map(addr, perm);
   41d72:	ba 07 00 00 00       	mov    $0x7,%edx
   41d77:	48 89 de             	mov    %rbx,%rsi
   41d7a:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
   41d7e:	e8 d5 06 00 00       	call   42458 <vmiter::try_map(unsigned long, int)>
        assert(r == 0); // mappings during kernel_start MUST NOT fail
   41d83:	85 c0                	test   %eax,%eax
   41d85:	0f 85 de fe ff ff    	jne    41c69 <kernel_start(char const*)+0x4d>
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {
   41d8b:	48 81 c3 00 10 00 00 	add    $0x1000,%rbx
   41d92:	48 81 fb 00 00 20 00 	cmp    $0x200000,%rbx
   41d99:	75 83                	jne    41d1e <kernel_start(char const*)+0x102>
   41d9b:	ba 28 42 06 00       	mov    $0x64228,%edx
        ptable[i].pid = i;
   41da0:	89 02                	mov    %eax,(%rdx)
        ptable[i].state = P_FREE;
   41da2:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%rdx)
    for (pid_t i = 0; i < PID_MAX; i++) {
   41da9:	83 c0 01             	add    $0x1,%eax
   41dac:	48 81 c2 d8 00 00 00 	add    $0xd8,%rdx
   41db3:	83 f8 10             	cmp    $0x10,%eax
   41db6:	75 e8                	jne    41da0 <kernel_start(char const*)+0x184>
        command = WEENSYOS_FIRST_PROCESS;
   41db8:	4d 85 ed             	test   %r13,%r13
   41dbb:	b8 4f 5f 04 00       	mov    $0x45f4f,%eax
   41dc0:	4c 0f 44 e8          	cmove  %rax,%r13
    if (!program_image(command).empty()) {
   41dc4:	4c 89 ee             	mov    %r13,%rsi
   41dc7:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
   41dcb:	e8 14 26 00 00       	call   443e4 <program_image::program_image(char const*)>
   41dd0:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
   41dd4:	e8 49 26 00 00       	call   44422 <program_image::empty() const>
   41dd9:	84 c0                	test   %al,%al
   41ddb:	0f 85 a1 fe ff ff    	jne    41c82 <kernel_start(char const*)+0x66>
        process_setup(1, command);
   41de1:	4c 89 ee             	mov    %r13,%rsi
   41de4:	bf 01 00 00 00       	mov    $0x1,%edi
   41de9:	e8 ad ef ff ff       	call   40d9b <process_setup(int, char const*)>
    run(&ptable[1]);
   41dee:	bf f8 42 06 00       	mov    $0x642f8,%edi
   41df3:	e8 d9 fd ff ff       	call   41bd1 <run(proc*)>

0000000000041df8 <memshow()>:
// memshow()
//    Draw a picture of memory (physical and virtual) on the CGA console.
//    Switches to a new process's virtual memory map every 0.25 sec.
//    Uses `console_memviewer()`, a function defined in `k-memviewer.cc`.

void memshow() {
   41df8:	f3 0f 1e fa          	endbr64
   41dfc:	55                   	push   %rbp
   41dfd:	48 89 e5             	mov    %rsp,%rbp
    static unsigned last_ticks = 0;
    static int showing = 0;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2) {
   41e00:	83 3d 9d 31 02 00 00 	cmpl   $0x0,0x2319d(%rip)        # 64fa4 <memshow()::last_ticks>
   41e07:	74 16                	je     41e1f <memshow()+0x27>
	memory_order __b __attribute__ ((__unused__))
	  = __m & __memory_order_mask;
	__glibcxx_assert(__b != memory_order_release);
	__glibcxx_assert(__b != memory_order_acq_rel);

	return __atomic_load_n(&_M_i, int(__m));
   41e09:	48 8b 05 98 31 02 00 	mov    0x23198(%rip),%rax        # 64fa8 <ticks>
   41e10:	8b 15 8e 31 02 00    	mov    0x2318e(%rip),%edx        # 64fa4 <memshow()::last_ticks>
   41e16:	48 29 d0             	sub    %rdx,%rax
   41e19:	48 83 f8 31          	cmp    $0x31,%rax
   41e1d:	76 27                	jbe    41e46 <memshow()+0x4e>
   41e1f:	48 8b 05 82 31 02 00 	mov    0x23182(%rip),%rax        # 64fa8 <ticks>
        last_ticks = ticks;
   41e26:	89 05 78 31 02 00    	mov    %eax,0x23178(%rip)        # 64fa4 <memshow()::last_ticks>
        showing = (showing + 1) % PID_MAX;
   41e2c:	8b 05 6e 31 02 00    	mov    0x2316e(%rip),%eax        # 64fa0 <memshow()::showing>
   41e32:	83 c0 01             	add    $0x1,%eax
   41e35:	99                   	cltd
   41e36:	c1 ea 1c             	shr    $0x1c,%edx
   41e39:	01 d0                	add    %edx,%eax
   41e3b:	83 e0 0f             	and    $0xf,%eax
   41e3e:	29 d0                	sub    %edx,%eax
   41e40:	89 05 5a 31 02 00    	mov    %eax,0x2315a(%rip)        # 64fa0 <memshow()::showing>
    }

    proc* p = nullptr;
    for (int search = 0; !p && search < PID_MAX; ++search) {
   41e46:	8b 05 54 31 02 00    	mov    0x23154(%rip),%eax        # 64fa0 <memshow()::showing>
void memshow() {
   41e4c:	be 10 00 00 00       	mov    $0x10,%esi
   41e51:	b9 00 00 00 00       	mov    $0x0,%ecx
   41e56:	bf 01 00 00 00       	mov    $0x1,%edi
   41e5b:	eb 1c                	jmp    41e79 <memshow()+0x81>
        if (ptable[showing].state != P_FREE
            && ptable[showing].pagetable) {
            p = &ptable[showing];
        } else {
            showing = (showing + 1) % PID_MAX;
   41e5d:	83 c0 01             	add    $0x1,%eax
   41e60:	89 c1                	mov    %eax,%ecx
   41e62:	c1 f9 1f             	sar    $0x1f,%ecx
   41e65:	c1 e9 1c             	shr    $0x1c,%ecx
   41e68:	8d 14 08             	lea    (%rax,%rcx,1),%edx
   41e6b:	83 e2 0f             	and    $0xf,%edx
   41e6e:	29 ca                	sub    %ecx,%edx
   41e70:	89 d0                	mov    %edx,%eax
    for (int search = 0; !p && search < PID_MAX; ++search) {
   41e72:	89 f9                	mov    %edi,%ecx
   41e74:	83 ee 01             	sub    $0x1,%esi
   41e77:	74 4e                	je     41ec7 <memshow()+0xcf>
        if (ptable[showing].state != P_FREE
   41e79:	48 63 d0             	movslq %eax,%rdx
   41e7c:	48 8d 14 52          	lea    (%rdx,%rdx,2),%rdx
   41e80:	48 8d 14 d2          	lea    (%rdx,%rdx,8),%rdx
   41e84:	83 3c d5 2c 42 06 00 	cmpl   $0x0,0x6422c(,%rdx,8)
   41e8b:	00 
   41e8c:	74 cf                	je     41e5d <memshow()+0x65>
            && ptable[showing].pagetable) {
   41e8e:	48 63 d0             	movslq %eax,%rdx
   41e91:	48 8d 14 52          	lea    (%rdx,%rdx,2),%rdx
   41e95:	48 8d 14 d2          	lea    (%rdx,%rdx,8),%rdx
   41e99:	48 83 3c d5 20 42 06 	cmpq   $0x0,0x64220(,%rdx,8)
   41ea0:	00 00 
   41ea2:	74 b9                	je     41e5d <memshow()+0x65>
   41ea4:	84 c9                	test   %cl,%cl
   41ea6:	74 06                	je     41eae <memshow()+0xb6>
   41ea8:	89 05 f2 30 02 00    	mov    %eax,0x230f2(%rip)        # 64fa0 <memshow()::showing>
            p = &ptable[showing];
   41eae:	48 98                	cltq
   41eb0:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
   41eb4:	48 8d 04 c0          	lea    (%rax,%rax,8),%rax
   41eb8:	48 8d 3c c5 20 42 06 	lea    0x64220(,%rax,8),%rdi
   41ebf:	00 
        }
    }

    console_memviewer(p);
   41ec0:	e8 97 2f 00 00       	call   44e5c <console_memviewer(proc*)>
    if (!p) {
        console_printf(CPOS(10, 26), 0x0F00, "   VIRTUAL ADDRESS SPACE\n"
            "                          [All processes have exited]\n"
            "\n\n\n\n\n\n\n\n\n\n\n");
    }
   41ec5:	5d                   	pop    %rbp
   41ec6:	c3                   	ret
   41ec7:	89 15 d3 30 02 00    	mov    %edx,0x230d3(%rip)        # 64fa0 <memshow()::showing>
    console_memviewer(p);
   41ecd:	bf 00 00 00 00       	mov    $0x0,%edi
   41ed2:	e8 85 2f 00 00       	call   44e5c <console_memviewer(proc*)>
        console_printf(CPOS(10, 26), 0x0F00, "   VIRTUAL ADDRESS SPACE\n"
   41ed7:	ba d8 62 04 00       	mov    $0x462d8,%edx
   41edc:	be 00 0f 00 00       	mov    $0xf00,%esi
   41ee1:	bf 3a 03 00 00       	mov    $0x33a,%edi
   41ee6:	b8 00 00 00 00       	mov    $0x0,%eax
   41eeb:	e8 55 3f 00 00       	call   45e45 <console_printf(int, int, char const*, ...)>
   41ef0:	eb d3                	jmp    41ec5 <memshow()+0xcd>

0000000000041ef2 <schedule()>:
void schedule() {
   41ef2:	f3 0f 1e fa          	endbr64
   41ef6:	55                   	push   %rbp
   41ef7:	48 89 e5             	mov    %rsp,%rbp
   41efa:	41 54                	push   %r12
   41efc:	53                   	push   %rbx
    pid_t pid = current->pid;
   41efd:	48 8b 05 fc 22 02 00 	mov    0x222fc(%rip),%rax        # 64200 <current>
        pid = (pid + 1) % PID_MAX;
   41f04:	8b 40 08             	mov    0x8(%rax),%eax
   41f07:	83 c0 01             	add    $0x1,%eax
   41f0a:	99                   	cltd
   41f0b:	c1 ea 1c             	shr    $0x1c,%edx
   41f0e:	01 d0                	add    %edx,%eax
   41f10:	83 e0 0f             	and    $0xf,%eax
   41f13:	29 d0                	sub    %edx,%eax
   41f15:	41 89 c4             	mov    %eax,%r12d
        if (ptable[pid].state == P_RUNNABLE) {
   41f18:	48 98                	cltq
   41f1a:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
   41f1e:	48 8d 04 c0          	lea    (%rax,%rax,8),%rax
    for (unsigned spins = 1; true; ++spins) {
   41f22:	bb 01 00 00 00       	mov    $0x1,%ebx
        if (ptable[pid].state == P_RUNNABLE) {
   41f27:	83 3c c5 2c 42 06 00 	cmpl   $0x1,0x6422c(,%rax,8)
   41f2e:	01 
   41f2f:	75 42                	jne    41f73 <schedule()+0x81>
            run(&ptable[pid]);
   41f31:	4d 63 e4             	movslq %r12d,%r12
   41f34:	4b 8d 04 64          	lea    (%r12,%r12,2),%rax
   41f38:	48 8d 04 c0          	lea    (%rax,%rax,8),%rax
   41f3c:	48 8d 3c c5 20 42 06 	lea    0x64220(,%rax,8),%rdi
   41f43:	00 
   41f44:	e8 88 fc ff ff       	call   41bd1 <run(proc*)>
    for (unsigned spins = 1; true; ++spins) {
   41f49:	83 c3 01             	add    $0x1,%ebx
        pid = (pid + 1) % PID_MAX;
   41f4c:	41 8d 44 24 01       	lea    0x1(%r12),%eax
   41f51:	99                   	cltd
   41f52:	c1 ea 1c             	shr    $0x1c,%edx
   41f55:	01 d0                	add    %edx,%eax
   41f57:	83 e0 0f             	and    $0xf,%eax
   41f5a:	29 d0                	sub    %edx,%eax
   41f5c:	41 89 c4             	mov    %eax,%r12d
        if (ptable[pid].state == P_RUNNABLE) {
   41f5f:	48 98                	cltq
   41f61:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
   41f65:	48 8d 04 c0          	lea    (%rax,%rax,8),%rax
   41f69:	83 3c c5 2c 42 06 00 	cmpl   $0x1,0x6422c(,%rax,8)
   41f70:	01 
   41f71:	74 be                	je     41f31 <schedule()+0x3f>
        check_keyboard();
   41f73:	e8 27 21 00 00       	call   4409f <check_keyboard()>
        if (spins % (1 << 12) == 0) {
   41f78:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
   41f7e:	75 c9                	jne    41f49 <schedule()+0x57>
            memshow();
   41f80:	e8 73 fe ff ff       	call   41df8 <memshow()>
   41f85:	eb c2                	jmp    41f49 <schedule()+0x57>

0000000000041f87 <sys_sleep(unsigned int)>:
int sys_sleep(unsigned int sleep) {
   41f87:	f3 0f 1e fa          	endbr64
    if (sleep == 0) {
   41f8b:	85 ff                	test   %edi,%edi
   41f8d:	74 59                	je     41fe8 <sys_sleep(unsigned int)+0x61>
   41f8f:	48 8b 05 12 30 02 00 	mov    0x23012(%rip),%rax        # 64fa8 <ticks>
    current->sleeping_ticks = ticks + sleep;  
   41f96:	01 f8                	add    %edi,%eax
   41f98:	48 8b 15 61 22 02 00 	mov    0x22261(%rip),%rdx        # 64200 <current>
   41f9f:	89 82 d0 00 00 00    	mov    %eax,0xd0(%rdx)
   41fa5:	48 8b 05 fc 2f 02 00 	mov    0x22ffc(%rip),%rax        # 64fa8 <ticks>
   41fac:	48 8b 15 f5 2f 02 00 	mov    0x22ff5(%rip),%rdx        # 64fa8 <ticks>
    while (ticks < ticks + sleep) {
   41fb3:	89 ff                	mov    %edi,%edi
   41fb5:	48 01 d7             	add    %rdx,%rdi
   41fb8:	48 39 f8             	cmp    %rdi,%rax
   41fbb:	72 14                	jb     41fd1 <sys_sleep(unsigned int)+0x4a>
    current->state = P_RUNNABLE;
   41fbd:	48 8b 05 3c 22 02 00 	mov    0x2223c(%rip),%rax        # 64200 <current>
   41fc4:	c7 40 0c 01 00 00 00 	movl   $0x1,0xc(%rax)
    return 0;
   41fcb:	b8 00 00 00 00       	mov    $0x0,%eax
   41fd0:	c3                   	ret
int sys_sleep(unsigned int sleep) {
   41fd1:	55                   	push   %rbp
   41fd2:	48 89 e5             	mov    %rsp,%rbp
        current->state = P_SLEEPING;  
   41fd5:	48 8b 05 24 22 02 00 	mov    0x22224(%rip),%rax        # 64200 <current>
   41fdc:	c7 40 0c 04 00 00 00 	movl   $0x4,0xc(%rax)
        schedule();  
   41fe3:	e8 0a ff ff ff       	call   41ef2 <schedule()>
        return -1;
   41fe8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   41fed:	c3                   	ret

0000000000041fee <exception(regstate*)>:
void exception(regstate* regs) {
   41fee:	f3 0f 1e fa          	endbr64
   41ff2:	55                   	push   %rbp
   41ff3:	48 89 e5             	mov    %rsp,%rbp
   41ff6:	53                   	push   %rbx
   41ff7:	48 83 ec 08          	sub    $0x8,%rsp
   41ffb:	48 89 fe             	mov    %rdi,%rsi
    current->regs = *regs;
   41ffe:	48 8b 1d fb 21 02 00 	mov    0x221fb(%rip),%rbx        # 64200 <current>
   42005:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
   42009:	b9 18 00 00 00       	mov    $0x18,%ecx
   4200e:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    console_show_cursor(cursorpos);
   42011:	8b 3d e5 6f 07 00    	mov    0x76fe5(%rip),%edi        # b8ffc <cursorpos>
   42017:	e8 1c 0b 00 00       	call   42b38 <console_show_cursor(int)>
    if (regs->reg_intno != INT_PF || (regs->reg_errcode & PTE_U)) {
   4201c:	83 bb 98 00 00 00 0e 	cmpl   $0xe,0x98(%rbx)
   42023:	75 09                	jne    4202e <exception(regstate*)+0x40>
   42025:	f6 83 a0 00 00 00 04 	testb  $0x4,0xa0(%rbx)
   4202c:	74 05                	je     42033 <exception(regstate*)+0x45>
        memshow();
   4202e:	e8 c5 fd ff ff       	call   41df8 <memshow()>
    check_keyboard();
   42033:	e8 67 20 00 00       	call   4409f <check_keyboard()>
    log_printf("2: inside kernel::exception(), going to run process %d %d\n", current->pid, current->state);
   42038:	48 8b 05 c1 21 02 00 	mov    0x221c1(%rip),%rax        # 64200 <current>
   4203f:	8b 50 0c             	mov    0xc(%rax),%edx
   42042:	8b 70 08             	mov    0x8(%rax),%esi
   42045:	bf 38 63 04 00       	mov    $0x46338,%edi
   4204a:	b8 00 00 00 00       	mov    $0x0,%eax
   4204f:	e8 96 0c 00 00       	call   42cea <log_printf(char const*, ...)>
    switch (regs->reg_intno) {
   42054:	8b 93 98 00 00 00    	mov    0x98(%rbx),%edx
   4205a:	83 fa 0e             	cmp    $0xe,%edx
   4205d:	74 22                	je     42081 <exception(regstate*)+0x93>
   4205f:	83 fa 20             	cmp    $0x20,%edx
   42062:	0f 85 00 01 00 00    	jne    42168 <exception(regstate*)+0x17a>
      { return __atomic_add_fetch(&_M_i, 1, int(memory_order_seq_cst)); }
   42068:	f0 48 83 05 37 2f 02 	lock addq $0x1,0x22f37(%rip)        # 64fa8 <ticks>
   4206f:	00 01 
}
inline uint32_t lapicstate::read(int reg) const {
    return reg_[reg].v;
}
inline void lapicstate::write(int reg, uint32_t v) {
    reg_[reg].v = v;
   42071:	b8 b0 00 e0 fe       	mov    $0xfee000b0,%eax
   42076:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
        schedule();
   4207c:	e8 71 fe ff ff       	call   41ef2 <schedule()>
    asm volatile("movq %0, %%cr0" : : "r" (x));
}

__always_inline uintptr_t rdcr2() {
    uintptr_t x;
    asm volatile("movq %%cr2, %0" : "=r" (x));
   42081:	0f 20 d2             	mov    %cr2,%rdx
        const char* operation = regs->reg_errcode & PTE_W
   42084:	48 8b 83 a0 00 00 00 	mov    0xa0(%rbx),%rax
                ? "write" : "read";
   4208b:	a8 02                	test   $0x2,%al
   4208d:	b9 9e 5f 04 00       	mov    $0x45f9e,%ecx
   42092:	be 98 5f 04 00       	mov    $0x45f98,%esi
   42097:	48 0f 45 ce          	cmovne %rsi,%rcx
                ? "protection problem" : "missing page";
   4209b:	a8 01                	test   $0x1,%al
   4209d:	41 b8 b6 5f 04 00    	mov    $0x45fb6,%r8d
   420a3:	be a3 5f 04 00       	mov    $0x45fa3,%esi
   420a8:	4c 0f 45 c6          	cmovne %rsi,%r8
        if (!(regs->reg_errcode & PTE_U)) {
   420ac:	a8 04                	test   $0x4,%al
   420ae:	75 1d                	jne    420cd <exception(regstate*)+0xdf>
            proc_panic(current, "Kernel page fault on %p (%s %s, rip=%p)!\n",
   420b0:	4c 8b 8b a8 00 00 00 	mov    0xa8(%rbx),%r9
   420b7:	be 78 63 04 00       	mov    $0x46378,%esi
   420bc:	48 8b 3d 3d 21 02 00 	mov    0x2213d(%rip),%rdi        # 64200 <current>
   420c3:	b8 00 00 00 00       	mov    $0x0,%eax
   420c8:	e8 f8 20 00 00       	call   441c5 <proc_panic(proc const*, char const*, ...)>
        error_printf(CPOS(24, 0), COLOR_ERROR,
   420cd:	48 8b 05 2c 21 02 00 	mov    0x2212c(%rip),%rax        # 64200 <current>
   420d4:	8b 40 08             	mov    0x8(%rax),%eax
   420d7:	ff b3 a8 00 00 00    	push   0xa8(%rbx)
   420dd:	41 50                	push   %r8
   420df:	49 89 c9             	mov    %rcx,%r9
   420e2:	41 89 c0             	mov    %eax,%r8d
   420e5:	48 89 d1             	mov    %rdx,%rcx
   420e8:	ba a8 63 04 00       	mov    $0x463a8,%edx
   420ed:	be 00 c0 00 00       	mov    $0xc000,%esi
   420f2:	bf 80 07 00 00       	mov    $0x780,%edi
   420f7:	b8 00 00 00 00       	mov    $0x0,%eax
   420fc:	e8 7e 3d 00 00       	call   45e7f <error_printf(int, int, char const*, ...)>
        log_print_backtrace(current);
   42101:	48 8b 3d f8 20 02 00 	mov    0x220f8(%rip),%rdi        # 64200 <current>
   42108:	e8 7e 15 00 00       	call   4368b <log_print_backtrace(proc const*)>
        current->state = P_FAULTED;
   4210d:	48 8b 05 ec 20 02 00 	mov    0x220ec(%rip),%rax        # 64200 <current>
   42114:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%rax)
    log_printf("3: inside kernel::exception(), going to run process %d %d\n", current->pid, current->state);
   4211b:	8b 70 08             	mov    0x8(%rax),%esi
   4211e:	ba 03 00 00 00       	mov    $0x3,%edx
   42123:	bf d8 63 04 00       	mov    $0x463d8,%edi
   42128:	b8 00 00 00 00       	mov    $0x0,%eax
   4212d:	e8 b8 0b 00 00       	call   42cea <log_printf(char const*, ...)>
    if (current->state == P_RUNNABLE) {
   42132:	48 8b 05 c7 20 02 00 	mov    0x220c7(%rip),%rax        # 64200 <current>
   42139:	8b 50 0c             	mov    0xc(%rax),%edx
   4213c:	48 83 c4 10          	add    $0x10,%rsp
   42140:	83 fa 01             	cmp    $0x1,%edx
   42143:	75 40                	jne    42185 <exception(regstate*)+0x197>
       log_printf("4: inside kernel::exception(), going to run process %d %d\n", current->pid, current->state);
   42145:	8b 70 08             	mov    0x8(%rax),%esi
   42148:	ba 01 00 00 00       	mov    $0x1,%edx
   4214d:	bf 40 64 04 00       	mov    $0x46440,%edi
   42152:	b8 00 00 00 00       	mov    $0x0,%eax
   42157:	e8 8e 0b 00 00       	call   42cea <log_printf(char const*, ...)>
        run(current);
   4215c:	48 8b 3d 9d 20 02 00 	mov    0x2209d(%rip),%rdi        # 64200 <current>
   42163:	e8 69 fa ff ff       	call   41bd1 <run(proc*)>
        proc_panic(current, "Unhandled exception %d (rip=%p)!\n",
   42168:	48 8b 8b a8 00 00 00 	mov    0xa8(%rbx),%rcx
   4216f:	be 18 64 04 00       	mov    $0x46418,%esi
   42174:	48 8b 3d 85 20 02 00 	mov    0x22085(%rip),%rdi        # 64200 <current>
   4217b:	b8 00 00 00 00       	mov    $0x0,%eax
   42180:	e8 40 20 00 00       	call   441c5 <proc_panic(proc const*, char const*, ...)>
        log_printf("5: inside kernel::exception(), going to run process %d %d\n", current->pid, current->state);
   42185:	8b 70 08             	mov    0x8(%rax),%esi
   42188:	bf 80 64 04 00       	mov    $0x46480,%edi
   4218d:	b8 00 00 00 00       	mov    $0x0,%eax
   42192:	e8 53 0b 00 00       	call   42cea <log_printf(char const*, ...)>
        schedule();
   42197:	e8 56 fd ff ff       	call   41ef2 <schedule()>

000000000004219c <syscall(regstate*)>:
uintptr_t syscall(regstate* regs) {
   4219c:	f3 0f 1e fa          	endbr64
   421a0:	55                   	push   %rbp
   421a1:	48 89 e5             	mov    %rsp,%rbp
   421a4:	53                   	push   %rbx
   421a5:	48 83 ec 08          	sub    $0x8,%rsp
   421a9:	48 89 fe             	mov    %rdi,%rsi
    current->regs = *regs;
   421ac:	48 8b 1d 4d 20 02 00 	mov    0x2204d(%rip),%rbx        # 64200 <current>
   421b3:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
   421b7:	b9 18 00 00 00       	mov    $0x18,%ecx
   421bc:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    console_show_cursor(cursorpos);
   421bf:	8b 3d 37 6e 07 00    	mov    0x76e37(%rip),%edi        # b8ffc <cursorpos>
   421c5:	e8 6e 09 00 00       	call   42b38 <console_show_cursor(int)>
    memshow();
   421ca:	e8 29 fc ff ff       	call   41df8 <memshow()>
    check_keyboard();
   421cf:	e8 cb 1e 00 00       	call   4409f <check_keyboard()>
    switch (regs->reg_rax) {
   421d4:	48 8b 53 10          	mov    0x10(%rbx),%rdx
   421d8:	48 83 fa 08          	cmp    $0x8,%rdx
   421dc:	0f 87 90 00 00 00    	ja     42272 <syscall(regstate*)+0xd6>
   421e2:	3e ff 24 d5 90 69 04 	notrack jmp *0x46990(,%rdx,8)
   421e9:	00 
        user_panic(current);
   421ea:	48 8b 3d 0f 20 02 00 	mov    0x2200f(%rip),%rdi        # 64200 <current>
   421f1:	e8 2d 20 00 00       	call   44223 <user_panic(proc const*)>
        return current->pid;
   421f6:	48 8b 05 03 20 02 00 	mov    0x22003(%rip),%rax        # 64200 <current>
   421fd:	48 63 40 08          	movslq 0x8(%rax),%rax
}
   42201:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   42205:	c9                   	leave
   42206:	c3                   	ret
        current->regs.reg_rax = 0;
   42207:	48 8b 05 f2 1f 02 00 	mov    0x21ff2(%rip),%rax        # 64200 <current>
   4220e:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
   42215:	00 
        schedule();             // does not return
   42216:	e8 d7 fc ff ff       	call   41ef2 <schedule()>
        return syscall_page_alloc(current->regs.reg_rdi);
   4221b:	48 8b 05 de 1f 02 00 	mov    0x21fde(%rip),%rax        # 64200 <current>
   42222:	48 8b 78 40          	mov    0x40(%rax),%rdi
   42226:	e8 91 f8 ff ff       	call   41abc <syscall_page_alloc(unsigned long)>
   4222b:	48 98                	cltq
   4222d:	eb d2                	jmp    42201 <syscall(regstate*)+0x65>
        return syscall_fork();
   4222f:	e8 18 f4 ff ff       	call   4164c <syscall_fork()>
   42234:	48 98                	cltq
   42236:	eb c9                	jmp    42201 <syscall(regstate*)+0x65>
        sys_exit(current->pid);
   42238:	48 8b 05 c1 1f 02 00 	mov    0x21fc1(%rip),%rax        # 64200 <current>
   4223f:	8b 78 08             	mov    0x8(%rax),%edi
   42242:	e8 ba f3 ff ff       	call   41601 <sys_exit(int)>
        schedule();
   42247:	e8 a6 fc ff ff       	call   41ef2 <schedule()>
        return sys_sleep(current->regs.reg_rdi);
   4224c:	48 8b 05 ad 1f 02 00 	mov    0x21fad(%rip),%rax        # 64200 <current>
   42253:	8b 78 40             	mov    0x40(%rax),%edi
   42256:	e8 2c fd ff ff       	call   41f87 <sys_sleep(unsigned int)>
   4225b:	48 98                	cltq
   4225d:	eb a2                	jmp    42201 <syscall(regstate*)+0x65>
        return sys_kill(current->regs.reg_rdi);
   4225f:	48 8b 05 9a 1f 02 00 	mov    0x21f9a(%rip),%rax        # 64200 <current>
   42266:	8b 78 40             	mov    0x40(%rax),%edi
   42269:	e8 f3 f7 ff ff       	call   41a61 <sys_kill(int)>
   4226e:	48 98                	cltq
   42270:	eb 8f                	jmp    42201 <syscall(regstate*)+0x65>
        proc_panic(current, "Unhandled system call %ld (pid=%d, rip=%p)!\n",
   42272:	48 8b 3d 87 1f 02 00 	mov    0x21f87(%rip),%rdi        # 64200 <current>
   42279:	8b 4f 08             	mov    0x8(%rdi),%ecx
   4227c:	4c 8b 83 a8 00 00 00 	mov    0xa8(%rbx),%r8
   42283:	be c0 64 04 00       	mov    $0x464c0,%esi
   42288:	b8 00 00 00 00       	mov    $0x0,%eax
   4228d:	e8 33 1f 00 00       	call   441c5 <proc_panic(proc const*, char const*, ...)>

0000000000042292 <vmiter::down()>:
#include "k-vmiter.hh"
#include <atomic>

const x86_64_pageentry_t vmiter::zero_pe = 0;

void vmiter::down() {
   42292:	f3 0f 1e fa          	endbr64
   42296:	48 89 f8             	mov    %rdi,%rax
    while (lbits_ > PAGEOFFBITS && (*pep_ & (PTE_P | PTE_PS)) == PTE_P) {
   42299:	8b 4f 10             	mov    0x10(%rdi),%ecx
        perm_ &= *pep_ | ~(PTE_P | PTE_W | PTE_U);
        lbits_ -= PAGEINDEXBITS;
        uintptr_t pa = *pep_ & PTE_PAMASK;
   4229c:	49 b8 00 f0 ff ff ff 	movabs $0xffffffffff000,%r8
   422a3:	ff 0f 00 
    while (lbits_ > PAGEOFFBITS && (*pep_ & (PTE_P | PTE_PS)) == PTE_P) {
   422a6:	83 f9 0c             	cmp    $0xc,%ecx
   422a9:	7e 42                	jle    422ed <vmiter::down()+0x5b>
   422ab:	48 8b 70 08          	mov    0x8(%rax),%rsi
   422af:	48 8b 16             	mov    (%rsi),%rdx
   422b2:	48 89 d7             	mov    %rdx,%rdi
   422b5:	81 e7 81 00 00 00    	and    $0x81,%edi
   422bb:	48 83 ff 01          	cmp    $0x1,%rdi
   422bf:	75 2c                	jne    422ed <vmiter::down()+0x5b>
        perm_ &= *pep_ | ~(PTE_P | PTE_W | PTE_U);
   422c1:	83 ca f8             	or     $0xfffffff8,%edx
   422c4:	21 50 14             	and    %edx,0x14(%rax)
        lbits_ -= PAGEINDEXBITS;
   422c7:	83 e9 09             	sub    $0x9,%ecx
   422ca:	89 48 10             	mov    %ecx,0x10(%rax)
        uintptr_t pa = *pep_ & PTE_PAMASK;
   422cd:	4c 89 c7             	mov    %r8,%rdi
   422d0:	48 23 3e             	and    (%rsi),%rdi
        x86_64_pagetable* pt = reinterpret_cast<x86_64_pagetable*>(pa);
        pep_ = &pt->entry[(va_ >> lbits_) & 0x1FF];
   422d3:	48 8b 50 18          	mov    0x18(%rax),%rdx
   422d7:	48 d3 ea             	shr    %cl,%rdx
   422da:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
   422e0:	48 8d 14 d7          	lea    (%rdi,%rdx,8),%rdx
   422e4:	48 89 50 08          	mov    %rdx,0x8(%rax)
    while (lbits_ > PAGEOFFBITS && (*pep_ & (PTE_P | PTE_PS)) == PTE_P) {
   422e8:	83 f9 0c             	cmp    $0xc,%ecx
   422eb:	7f be                	jg     422ab <vmiter::down()+0x19>
    }
    if ((*pep_ & PTE_PAMASK) >= 0x100000000UL
   422ed:	48 8b 50 08          	mov    0x8(%rax),%rdx
   422f1:	48 8b 32             	mov    (%rdx),%rsi
   422f4:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   422fb:	ff 0f 00 
   422fe:	48 21 f2             	and    %rsi,%rdx
        && lbits_ < PAGEOFFBITS + 2 * PAGEINDEXBITS) {
   42301:	48 c1 ea 20          	shr    $0x20,%rdx
   42305:	74 05                	je     4230c <vmiter::down()+0x7a>
   42307:	83 f9 1d             	cmp    $0x1d,%ecx
   4230a:	7e 01                	jle    4230d <vmiter::down()+0x7b>
   4230c:	c3                   	ret
void vmiter::down() {
   4230d:	55                   	push   %rbp
   4230e:	48 89 e5             	mov    %rsp,%rbp
        panic("Page table %p may contain uninitialized memory!\n"
   42311:	48 89 f2             	mov    %rsi,%rdx
   42314:	48 8b 30             	mov    (%rax),%rsi
   42317:	bf f0 64 04 00       	mov    $0x464f0,%edi
   4231c:	b8 00 00 00 00       	mov    $0x0,%eax
   42321:	e8 c1 1f 00 00       	call   442e7 <panic(char const*, ...)>

0000000000042326 <vmiter::real_find(unsigned long, bool)>:
              "(Page table contents: %p)\n", pt_, *pep_);
    }
}

void vmiter::real_find(uintptr_t va, bool stepping) {
   42326:	f3 0f 1e fa          	endbr64
   4232a:	55                   	push   %rbp
   4232b:	48 89 e5             	mov    %rsp,%rbp
   4232e:	48 89 f0             	mov    %rsi,%rax
    if (stepping && va == 0) {
   42331:	48 85 f6             	test   %rsi,%rsi
   42334:	75 26                	jne    4235c <vmiter::real_find(unsigned long, bool)+0x36>
   42336:	84 d2                	test   %dl,%dl
   42338:	74 22                	je     4235c <vmiter::real_find(unsigned long, bool)+0x36>
        lbits_ = done_lbits;
   4233a:	c7 47 10 40 00 00 00 	movl   $0x40,0x10(%rdi)
        perm_ = 0;
   42341:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%rdi)
        pep_ = const_cast<x86_64_pageentry_t*>(&zero_pe);
   42348:	ba d8 69 04 00       	mov    $0x469d8,%edx
   4234d:	48 89 57 08          	mov    %rdx,0x8(%rdi)
    } else {
        lbits_ = initial_lbits;
        perm_ = initial_perm;
        pep_ = &pt_->entry[(va >> lbits_) & 0x1FF];
    }
    va_ = va;
   42351:	48 89 47 18          	mov    %rax,0x18(%rdi)
    down();
   42355:	e8 38 ff ff ff       	call   42292 <vmiter::down()>
}
   4235a:	5d                   	pop    %rbp
   4235b:	c3                   	ret
    } else if (lbits_ < initial_lbits
   4235c:	8b 57 10             	mov    0x10(%rdi),%edx
   4235f:	83 fa 26             	cmp    $0x26,%edx
   42362:	7f 44                	jg     423a8 <vmiter::real_find(unsigned long, bool)+0x82>
               && ((va_ ^ va) & (~uintptr_t(0) << (lbits_ + PAGEINDEXBITS))) == 0) {
   42364:	49 89 c0             	mov    %rax,%r8
   42367:	4c 33 47 18          	xor    0x18(%rdi),%r8
   4236b:	8d 4a 09             	lea    0x9(%rdx),%ecx
   4236e:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
   42375:	48 d3 e6             	shl    %cl,%rsi
   42378:	49 85 f0             	test   %rsi,%r8
   4237b:	75 2b                	jne    423a8 <vmiter::real_find(unsigned long, bool)+0x82>
        int curidx = (reinterpret_cast<uintptr_t>(pep_) % PAGESIZE) >> 3;
   4237d:	48 8b 77 08          	mov    0x8(%rdi),%rsi
        pep_ += ((va >> lbits_) & 0x1FF) - curidx;
   42381:	49 89 c1             	mov    %rax,%r9
   42384:	89 d1                	mov    %edx,%ecx
   42386:	49 d3 e9             	shr    %cl,%r9
   42389:	4c 89 ca             	mov    %r9,%rdx
   4238c:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
        int curidx = (reinterpret_cast<uintptr_t>(pep_) % PAGESIZE) >> 3;
   42392:	48 89 f1             	mov    %rsi,%rcx
   42395:	48 c1 e9 03          	shr    $0x3,%rcx
        pep_ += ((va >> lbits_) & 0x1FF) - curidx;
   42399:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
   4239f:	48 29 ca             	sub    %rcx,%rdx
   423a2:	48 8d 14 d6          	lea    (%rsi,%rdx,8),%rdx
    } else if (!va_is_canonical(va)) {
   423a6:	eb a5                	jmp    4234d <vmiter::real_find(unsigned long, bool)+0x27>
    return va <= VA_LOWMAX || va >= VA_HIGHMIN;
   423a8:	48 ba 00 00 00 00 00 	movabs $0xffff800000000000,%rdx
   423af:	80 ff ff 
   423b2:	48 01 c2             	add    %rax,%rdx
   423b5:	48 b9 ff ff ff ff ff 	movabs $0xfffeffffffffffff,%rcx
   423bc:	ff fe ff 
   423bf:	48 39 d1             	cmp    %rdx,%rcx
   423c2:	72 18                	jb     423dc <vmiter::real_find(unsigned long, bool)+0xb6>
        lbits_ = noncanonical_lbits;
   423c4:	c7 47 10 2f 00 00 00 	movl   $0x2f,0x10(%rdi)
        perm_ = 0;
   423cb:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%rdi)
        pep_ = const_cast<x86_64_pageentry_t*>(&zero_pe);
   423d2:	ba d8 69 04 00       	mov    $0x469d8,%edx
   423d7:	e9 71 ff ff ff       	jmp    4234d <vmiter::real_find(unsigned long, bool)+0x27>
        lbits_ = initial_lbits;
   423dc:	c7 47 10 27 00 00 00 	movl   $0x27,0x10(%rdi)
        perm_ = initial_perm;
   423e3:	c7 47 14 ff 0f 00 00 	movl   $0xfff,0x14(%rdi)
        pep_ = &pt_->entry[(va >> lbits_) & 0x1FF];
   423ea:	48 89 c2             	mov    %rax,%rdx
   423ed:	48 c1 ea 24          	shr    $0x24,%rdx
   423f1:	81 e2 f8 0f 00 00    	and    $0xff8,%edx
   423f7:	48 03 17             	add    (%rdi),%rdx
   423fa:	e9 4e ff ff ff       	jmp    4234d <vmiter::real_find(unsigned long, bool)+0x27>
   423ff:	90                   	nop

0000000000042400 <vmiter::next()>:

void vmiter::next() {
   42400:	f3 0f 1e fa          	endbr64
   42404:	55                   	push   %rbp
   42405:	48 89 e5             	mov    %rsp,%rbp
    int lbits = PAGEOFFBITS;
    if (lbits_ > PAGEOFFBITS && !perm()) {
   42408:	8b 4f 10             	mov    0x10(%rdi),%ecx
   4240b:	83 f9 0c             	cmp    $0xc,%ecx
   4240e:	7e 40                	jle    42450 <vmiter::next()+0x50>
    uint64_t ph = *pep_ & perm_;
   42410:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   42414:	48 63 47 14          	movslq 0x14(%rdi),%rax
   42418:	48 23 02             	and    (%rdx),%rax
    return ph & -(ph & PTE_P);
   4241b:	48 89 c2             	mov    %rax,%rdx
   4241e:	83 e2 01             	and    $0x1,%edx
   42421:	48 f7 da             	neg    %rdx
    int lbits = PAGEOFFBITS;
   42424:	48 85 c2             	test   %rax,%rdx
   42427:	b8 0c 00 00 00       	mov    $0xc,%eax
   4242c:	0f 45 c8             	cmovne %eax,%ecx
    return ~(~uintptr_t(0) << lbits);
   4242f:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
   42436:	48 d3 e6             	shl    %cl,%rsi
   42439:	48 f7 d6             	not    %rsi
        lbits = lbits_;
    }
    real_find((va_ | lbits_mask(lbits)) + 1, true);
   4243c:	48 0b 77 18          	or     0x18(%rdi),%rsi
   42440:	48 83 c6 01          	add    $0x1,%rsi
   42444:	ba 01 00 00 00       	mov    $0x1,%edx
   42449:	e8 d8 fe ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
}
   4244e:	5d                   	pop    %rbp
   4244f:	c3                   	ret
    int lbits = PAGEOFFBITS;
   42450:	b9 0c 00 00 00       	mov    $0xc,%ecx
   42455:	eb d8                	jmp    4242f <vmiter::next()+0x2f>
   42457:	90                   	nop

0000000000042458 <vmiter::try_map(unsigned long, int)>:

int vmiter::try_map(uintptr_t pa, int perm) {
   42458:	f3 0f 1e fa          	endbr64
   4245c:	55                   	push   %rbp
   4245d:	48 89 e5             	mov    %rsp,%rbp
   42460:	41 57                	push   %r15
   42462:	41 56                	push   %r14
   42464:	41 55                	push   %r13
   42466:	41 54                	push   %r12
   42468:	53                   	push   %rbx
   42469:	48 83 ec 08          	sub    $0x8,%rsp
   4246d:	49 89 fc             	mov    %rdi,%r12
   42470:	49 89 f6             	mov    %rsi,%r14
   42473:	41 89 d7             	mov    %edx,%r15d
    if (pa == (uintptr_t) -1 && perm == 0) {
   42476:	48 83 fe ff          	cmp    $0xffffffffffffffff,%rsi
   4247a:	75 2a                	jne    424a6 <vmiter::try_map(unsigned long, int)+0x4e>
   4247c:	85 d2                	test   %edx,%edx
   4247e:	75 26                	jne    424a6 <vmiter::try_map(unsigned long, int)+0x4e>
        pa = 0;
    }
    // virtual address is page-aligned
    assert((va_ % PAGESIZE) == 0, "vmiter::try_map va not aligned");
   42480:	4c 8b 77 18          	mov    0x18(%rdi),%r14
   42484:	41 81 e6 ff 0f 00 00 	and    $0xfff,%r14d
   4248b:	74 4a                	je     424d7 <vmiter::try_map(unsigned long, int)+0x7f>
   4248d:	b9 40 65 04 00       	mov    $0x46540,%ecx
   42492:	ba c3 5f 04 00       	mov    $0x45fc3,%edx
   42497:	be 39 00 00 00       	mov    $0x39,%esi
   4249c:	bf d9 5f 04 00       	mov    $0x45fd9,%edi
   424a1:	e8 17 12 00 00       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
   424a6:	66 41 f7 44 24 18 ff 	testw  $0xfff,0x18(%r12)
   424ad:	0f 
   424ae:	75 dd                	jne    4248d <vmiter::try_map(unsigned long, int)+0x35>
    if (perm & PTE_P) {
   424b0:	41 f6 c7 01          	test   $0x1,%r15b
   424b4:	0f 84 e2 00 00 00    	je     4259c <vmiter::try_map(unsigned long, int)+0x144>
        // if mapping present, physical address is page-aligned
        assert(pa != (uintptr_t) -1, "vmiter::try_map mapping nonexistent pa");
   424ba:	49 83 fe ff          	cmp    $0xffffffffffffffff,%r14
   424be:	0f 84 a6 00 00 00    	je     4256a <vmiter::try_map(unsigned long, int)+0x112>
        assert((pa & PTE_PAMASK) == pa, "vmiter::try_map pa not aligned");
   424c4:	48 b8 ff 0f 00 00 00 	movabs $0xfff0000000000fff,%rax
   424cb:	00 f0 ff 
   424ce:	49 85 c6             	test   %rax,%r14
   424d1:	0f 85 ac 00 00 00    	jne    42583 <vmiter::try_map(unsigned long, int)+0x12b>
    } else {
        assert((pa & PTE_P) == 0, "vmiter::try_map invalid pa");
    }
    // new permissions (`perm`) cannot be less restrictive than permissions
    // imposed by higher-level page tables (`perm_`)
    assert(!(perm & ~perm_ & (PTE_P | PTE_W | PTE_U)));
   424d7:	45 8b 6c 24 14       	mov    0x14(%r12),%r13d
   424dc:	41 f7 d5             	not    %r13d
   424df:	45 21 fd             	and    %r15d,%r13d
   424e2:	41 83 e5 07          	and    $0x7,%r13d
   424e6:	0f 85 d3 00 00 00    	jne    425bf <vmiter::try_map(unsigned long, int)+0x167>

    while (lbits_ > PAGEOFFBITS && perm) {
   424ec:	41 8b 44 24 10       	mov    0x10(%r12),%eax
   424f1:	45 85 ff             	test   %r15d,%r15d
   424f4:	74 59                	je     4254f <vmiter::try_map(unsigned long, int)+0xf7>
   424f6:	83 f8 0c             	cmp    $0xc,%eax
   424f9:	7e 54                	jle    4254f <vmiter::try_map(unsigned long, int)+0xf7>
        assert(!(*pep_ & PTE_P));
   424fb:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   42500:	f6 00 01             	testb  $0x1,(%rax)
   42503:	0f 85 cf 00 00 00    	jne    425d8 <vmiter::try_map(unsigned long, int)+0x180>
        x86_64_pagetable* pt = static_cast<x86_64_pagetable*>(kalloc(PAGESIZE));
   42509:	bf 00 10 00 00       	mov    $0x1000,%edi
   4250e:	e8 53 e6 ff ff       	call   40b66 <kalloc(unsigned long)>
   42513:	48 89 c3             	mov    %rax,%rbx
        if (!pt) {
   42516:	48 85 c0             	test   %rax,%rax
   42519:	0f 84 e5 00 00 00    	je     42604 <vmiter::try_map(unsigned long, int)+0x1ac>
            return -1;
        }
        memset(pt, 0, PAGESIZE);
   4251f:	ba 00 10 00 00       	mov    $0x1000,%edx
   42524:	be 00 00 00 00       	mov    $0x0,%esi
   42529:	48 89 c7             	mov    %rax,%rdi
   4252c:	e8 81 2c 00 00       	call   451b2 <memset>
        std::atomic_thread_fence(std::memory_order_release);
        *pep_ = reinterpret_cast<uintptr_t>(pt) | PTE_P | PTE_W | PTE_U;
   42531:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   42536:	48 83 cb 07          	or     $0x7,%rbx
   4253a:	48 89 18             	mov    %rbx,(%rax)
        down();
   4253d:	4c 89 e7             	mov    %r12,%rdi
   42540:	e8 4d fd ff ff       	call   42292 <vmiter::down()>
    while (lbits_ > PAGEOFFBITS && perm) {
   42545:	41 8b 44 24 10       	mov    0x10(%r12),%eax
   4254a:	83 f8 0c             	cmp    $0xc,%eax
   4254d:	7f ac                	jg     424fb <vmiter::try_map(unsigned long, int)+0xa3>
    }

    if (lbits_ == PAGEOFFBITS) {
   4254f:	83 f8 0c             	cmp    $0xc,%eax
   42552:	0f 84 99 00 00 00    	je     425f1 <vmiter::try_map(unsigned long, int)+0x199>
        std::atomic_thread_fence(std::memory_order_release);
        *pep_ = pa | perm;
    }
    return 0;
}
   42558:	44 89 e8             	mov    %r13d,%eax
   4255b:	48 83 c4 08          	add    $0x8,%rsp
   4255f:	5b                   	pop    %rbx
   42560:	41 5c                	pop    %r12
   42562:	41 5d                	pop    %r13
   42564:	41 5e                	pop    %r14
   42566:	41 5f                	pop    %r15
   42568:	5d                   	pop    %rbp
   42569:	c3                   	ret
        assert(pa != (uintptr_t) -1, "vmiter::try_map mapping nonexistent pa");
   4256a:	b9 60 65 04 00       	mov    $0x46560,%ecx
   4256f:	ba e5 5f 04 00       	mov    $0x45fe5,%edx
   42574:	be 3c 00 00 00       	mov    $0x3c,%esi
   42579:	bf d9 5f 04 00       	mov    $0x45fd9,%edi
   4257e:	e8 3a 11 00 00       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
        assert((pa & PTE_PAMASK) == pa, "vmiter::try_map pa not aligned");
   42583:	b9 88 65 04 00       	mov    $0x46588,%ecx
   42588:	ba fa 5f 04 00       	mov    $0x45ffa,%edx
   4258d:	be 3d 00 00 00       	mov    $0x3d,%esi
   42592:	bf d9 5f 04 00       	mov    $0x45fd9,%edi
   42597:	e8 21 11 00 00       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
        assert((pa & PTE_P) == 0, "vmiter::try_map invalid pa");
   4259c:	41 f6 c6 01          	test   $0x1,%r14b
   425a0:	0f 84 31 ff ff ff    	je     424d7 <vmiter::try_map(unsigned long, int)+0x7f>
   425a6:	b9 12 60 04 00       	mov    $0x46012,%ecx
   425ab:	ba 2d 60 04 00       	mov    $0x4602d,%edx
   425b0:	be 3f 00 00 00       	mov    $0x3f,%esi
   425b5:	bf d9 5f 04 00       	mov    $0x45fd9,%edi
   425ba:	e8 fe 10 00 00       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
    assert(!(perm & ~perm_ & (PTE_P | PTE_W | PTE_U)));
   425bf:	b9 00 00 00 00       	mov    $0x0,%ecx
   425c4:	ba a8 65 04 00       	mov    $0x465a8,%edx
   425c9:	be 43 00 00 00       	mov    $0x43,%esi
   425ce:	bf d9 5f 04 00       	mov    $0x45fd9,%edi
   425d3:	e8 e5 10 00 00       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
        assert(!(*pep_ & PTE_P));
   425d8:	b9 00 00 00 00       	mov    $0x0,%ecx
   425dd:	ba 3f 60 04 00       	mov    $0x4603f,%edx
   425e2:	be 46 00 00 00       	mov    $0x46,%esi
   425e7:	bf d9 5f 04 00       	mov    $0x45fd9,%edi
   425ec:	e8 cc 10 00 00       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
        *pep_ = pa | perm;
   425f1:	49 8b 44 24 08       	mov    0x8(%r12),%rax
   425f6:	4d 63 ff             	movslq %r15d,%r15
   425f9:	4d 09 f7             	or     %r14,%r15
   425fc:	4c 89 38             	mov    %r15,(%rax)
   425ff:	e9 54 ff ff ff       	jmp    42558 <vmiter::try_map(unsigned long, int)+0x100>
            return -1;
   42604:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   4260a:	e9 49 ff ff ff       	jmp    42558 <vmiter::try_map(unsigned long, int)+0x100>
   4260f:	90                   	nop

0000000000042610 <vmiter::range_perm(unsigned long) const>:


uint64_t vmiter::range_perm(size_t sz) const {
   42610:	f3 0f 1e fa          	endbr64
   42614:	55                   	push   %rbp
   42615:	48 89 e5             	mov    %rsp,%rbp
   42618:	41 57                	push   %r15
   4261a:	41 56                	push   %r14
   4261c:	41 55                	push   %r13
   4261e:	41 54                	push   %r12
   42620:	53                   	push   %rbx
   42621:	48 83 ec 18          	sub    $0x18,%rsp
   42625:	48 89 fb             	mov    %rdi,%rbx
   42628:	49 89 f4             	mov    %rsi,%r12
    uint64_t p = sz > 0 ? perm() : uint64_t(-1);
   4262b:	48 85 f6             	test   %rsi,%rsi
   4262e:	0f 84 ce 00 00 00    	je     42702 <vmiter::range_perm(unsigned long) const+0xf2>
    uint64_t ph = *pep_ & perm_;
   42634:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   42638:	48 63 47 14          	movslq 0x14(%rdi),%rax
   4263c:	48 23 02             	and    (%rdx),%rax
    return ph & -(ph & PTE_P);
   4263f:	49 89 c5             	mov    %rax,%r13
   42642:	41 83 e5 01          	and    $0x1,%r13d
   42646:	49 f7 dd             	neg    %r13
    uintptr_t sva = va_;
   42649:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   4264d:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
    while (p && sz > last_va() - va()) {
   42651:	49 21 c5             	and    %rax,%r13
    uint64_t p = sz > 0 ? perm() : uint64_t(-1);
   42654:	4d 89 ee             	mov    %r13,%r14
    while (p && sz > last_va() - va()) {
   42657:	0f 85 b4 00 00 00    	jne    42711 <vmiter::range_perm(unsigned long) const+0x101>
   4265d:	e9 84 00 00 00       	jmp    426e6 <vmiter::range_perm(unsigned long) const+0xd6>
    uint64_t ph = *pep_ & perm_;
   42662:	48 8b 43 08          	mov    0x8(%rbx),%rax
   42666:	48 63 53 14          	movslq 0x14(%rbx),%rdx
   4266a:	48 23 10             	and    (%rax),%rdx
    return ph & -(ph & PTE_P);
   4266d:	48 89 d0             	mov    %rdx,%rax
   42670:	83 e0 01             	and    $0x1,%eax
   42673:	48 f7 d8             	neg    %rax
   42676:	48 21 d0             	and    %rdx,%rax
   42679:	49 21 c5             	and    %rax,%r13
   4267c:	74 7a                	je     426f8 <vmiter::range_perm(unsigned long) const+0xe8>
    if (lbits_ == noncanonical_lbits) {
   4267e:	8b 4b 10             	mov    0x10(%rbx),%ecx
        return VA_HIGHMIN;
   42681:	4c 89 fe             	mov    %r15,%rsi
    if (lbits_ == noncanonical_lbits) {
   42684:	83 f9 2f             	cmp    $0x2f,%ecx
   42687:	74 15                	je     4269e <vmiter::range_perm(unsigned long) const+0x8e>
    return ~(~uintptr_t(0) << lbits);
   42689:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
   42690:	48 d3 e6             	shl    %cl,%rsi
   42693:	48 f7 d6             	not    %rsi
        return (va_ | lbits_mask(lbits_)) + 1;
   42696:	48 0b 73 18          	or     0x18(%rbx),%rsi
   4269a:	48 83 c6 01          	add    $0x1,%rsi
    return va_;
   4269e:	48 8b 43 18          	mov    0x18(%rbx),%rax
   426a2:	48 89 f2             	mov    %rsi,%rdx
   426a5:	48 29 c2             	sub    %rax,%rdx
   426a8:	4c 39 e2             	cmp    %r12,%rdx
   426ab:	73 50                	jae    426fd <vmiter::range_perm(unsigned long) const+0xed>
        sz -= last_va() - va();
   426ad:	4c 01 e0             	add    %r12,%rax
   426b0:	48 29 f0             	sub    %rsi,%rax
   426b3:	49 89 c4             	mov    %rax,%r12
    real_find(last_va(), true);
   426b6:	ba 01 00 00 00       	mov    $0x1,%edx
   426bb:	48 89 df             	mov    %rbx,%rdi
   426be:	e8 63 fc ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    return va_;
   426c3:	4c 8b 73 18          	mov    0x18(%rbx),%r14
        const_cast<vmiter*>(this)->next_range();
        p &= va() ? perm() : 0;
   426c7:	4d 85 f6             	test   %r14,%r14
   426ca:	75 96                	jne    42662 <vmiter::range_perm(unsigned long) const+0x52>
    if (va != va_) {
   426cc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   426d0:	48 3b 43 18          	cmp    0x18(%rbx),%rax
   426d4:	74 10                	je     426e6 <vmiter::range_perm(unsigned long) const+0xd6>
        real_find(va, false);
   426d6:	ba 00 00 00 00       	mov    $0x0,%edx
   426db:	48 89 c6             	mov    %rax,%rsi
   426de:	48 89 df             	mov    %rbx,%rdi
   426e1:	e8 40 fc ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    }
    const_cast<vmiter*>(this)->find(sva);
    return p;
}
   426e6:	4c 89 f0             	mov    %r14,%rax
   426e9:	48 83 c4 18          	add    $0x18,%rsp
   426ed:	5b                   	pop    %rbx
   426ee:	41 5c                	pop    %r12
   426f0:	41 5d                	pop    %r13
   426f2:	41 5e                	pop    %r14
   426f4:	41 5f                	pop    %r15
   426f6:	5d                   	pop    %rbp
   426f7:	c3                   	ret
   426f8:	4d 89 ee             	mov    %r13,%r14
   426fb:	eb cf                	jmp    426cc <vmiter::range_perm(unsigned long) const+0xbc>
   426fd:	4d 89 ee             	mov    %r13,%r14
   42700:	eb ca                	jmp    426cc <vmiter::range_perm(unsigned long) const+0xbc>
    uintptr_t sva = va_;
   42702:	48 8b 47 18          	mov    0x18(%rdi),%rax
   42706:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    uint64_t p = sz > 0 ? perm() : uint64_t(-1);
   4270a:	49 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%r13
        return VA_HIGHMIN;
   42711:	49 bf 00 00 00 00 00 	movabs $0xffff800000000000,%r15
   42718:	80 ff ff 
   4271b:	e9 5e ff ff ff       	jmp    4267e <vmiter::range_perm(unsigned long) const+0x6e>

0000000000042720 <ptiter::down(bool)>:
ptiter::ptiter(x86_64_pagetable* pt)
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(vmiter::initial_lbits), va_(0) {
    down(false);
}

void ptiter::down(bool skip) {
   42720:	f3 0f 1e fa          	endbr64
    int stop_lbits = PAGEOFFBITS + PAGEINDEXBITS;
    while (lbits_ < vmiter::done_lbits) {
   42724:	44 8b 47 10          	mov    0x10(%rdi),%r8d
   42728:	41 83 f8 3f          	cmp    $0x3f,%r8d
   4272c:	0f 8f 17 01 00 00    	jg     42849 <ptiter::down(bool)+0x129>
void ptiter::down(bool skip) {
   42732:	55                   	push   %rbp
   42733:	48 89 e5             	mov    %rsp,%rbp
   42736:	41 57                	push   %r15
   42738:	41 56                	push   %r14
   4273a:	41 55                	push   %r13
   4273c:	41 54                	push   %r12
   4273e:	53                   	push   %rbx
    int stop_lbits = PAGEOFFBITS + PAGEINDEXBITS;
   4273f:	41 bb 15 00 00 00    	mov    $0x15,%r11d
    return ~(~uintptr_t(0) << lbits);
   42745:	49 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%r9
   4274c:	49 bd 01 00 00 00 00 	movabs $0xffff800000000001,%r13
   42753:	80 ff ff 
                stop_lbits = lbits_ + PAGEINDEXBITS;
                lbits_ = vmiter::initial_lbits;
                pep_ = &pt_->entry[(va_ >> lbits_) & 0x1FF];
            } else {
                ++pep_;
                va_ = va_is_canonical(va) ? va : VA_HIGHMIN;
   42756:	49 bc ff ff ff ff ff 	movabs $0xfffeffffffffffff,%r12
   4275d:	ff fe ff 
   42760:	48 bb 00 00 00 00 00 	movabs $0xffff800000000000,%rbx
   42767:	80 ff ff 
                uintptr_t pa = *pep_ & PTE_PAMASK;
   4276a:	49 be 00 f0 ff ff ff 	movabs $0xffffffffff000,%r14
   42771:	ff 0f 00 
   42774:	eb 51                	jmp    427c7 <ptiter::down(bool)+0xa7>
            if (lbits_ == stop_lbits) {
   42776:	45 39 d8             	cmp    %r11d,%r8d
   42779:	0f 84 bf 00 00 00    	je     4283e <ptiter::down(bool)+0x11e>
                lbits_ -= PAGEINDEXBITS;
   4277f:	41 8d 48 f7          	lea    -0x9(%r8),%ecx
   42783:	89 4f 10             	mov    %ecx,0x10(%rdi)
                uintptr_t pa = *pep_ & PTE_PAMASK;
   42786:	4c 89 f0             	mov    %r14,%rax
   42789:	48 23 02             	and    (%rdx),%rax
   4278c:	48 89 c2             	mov    %rax,%rdx
                pep_ = &pt->entry[(va_ >> lbits_) & 0x1FF];
   4278f:	48 8b 47 18          	mov    0x18(%rdi),%rax
   42793:	48 d3 e8             	shr    %cl,%rax
   42796:	25 ff 01 00 00       	and    $0x1ff,%eax
   4279b:	48 8d 04 c2          	lea    (%rdx,%rax,8),%rax
        } else {
   4279f:	eb 19                	jmp    427ba <ptiter::down(bool)+0x9a>
                lbits_ = vmiter::initial_lbits;
   427a1:	c7 47 10 27 00 00 00 	movl   $0x27,0x10(%rdi)
                pep_ = &pt_->entry[(va_ >> lbits_) & 0x1FF];
   427a8:	48 89 f0             	mov    %rsi,%rax
   427ab:	48 c1 e8 24          	shr    $0x24,%rax
   427af:	25 f8 0f 00 00       	and    $0xff8,%eax
   427b4:	48 03 07             	add    (%rdi),%rax
                stop_lbits = lbits_ + PAGEINDEXBITS;
   427b7:	41 89 cb             	mov    %ecx,%r11d
                pep_ = &pt->entry[(va_ >> lbits_) & 0x1FF];
   427ba:	48 89 47 08          	mov    %rax,0x8(%rdi)
    while (lbits_ < vmiter::done_lbits) {
   427be:	44 8b 47 10          	mov    0x10(%rdi),%r8d
void ptiter::down(bool skip) {
   427c2:	be 00 00 00 00       	mov    $0x0,%esi
        if (!skip && (*pep_ & (PTE_P | PTE_PS)) == PTE_P) {
   427c7:	40 84 f6             	test   %sil,%sil
   427ca:	75 12                	jne    427de <ptiter::down(bool)+0xbe>
   427cc:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   427d0:	48 8b 02             	mov    (%rdx),%rax
   427d3:	25 81 00 00 00       	and    $0x81,%eax
   427d8:	48 83 f8 01          	cmp    $0x1,%rax
   427dc:	74 98                	je     42776 <ptiter::down(bool)+0x56>
            uintptr_t va = (va_ | vmiter::lbits_mask(lbits_)) + 1;
   427de:	48 8b 77 18          	mov    0x18(%rdi),%rsi
   427e2:	4c 89 ca             	mov    %r9,%rdx
   427e5:	44 89 c1             	mov    %r8d,%ecx
   427e8:	48 d3 e2             	shl    %cl,%rdx
   427eb:	48 f7 d2             	not    %rdx
   427ee:	48 89 d0             	mov    %rdx,%rax
   427f1:	48 09 f0             	or     %rsi,%rax
   427f4:	48 8d 50 01          	lea    0x1(%rax),%rdx
            if ((va ^ va_) & ~vmiter::lbits_mask(lbits_ + PAGEINDEXBITS)) {
   427f8:	41 8d 48 09          	lea    0x9(%r8),%ecx
   427fc:	49 89 f2             	mov    %rsi,%r10
   427ff:	49 31 d2             	xor    %rdx,%r10
   42802:	4d 89 cf             	mov    %r9,%r15
   42805:	49 d3 e7             	shl    %cl,%r15
   42808:	4d 85 fa             	test   %r15,%r10
   4280b:	74 14                	je     42821 <ptiter::down(bool)+0x101>
                if (va == 0 && lbits_ == vmiter::initial_lbits) {
   4280d:	41 83 f8 27          	cmp    $0x27,%r8d
   42811:	75 8e                	jne    427a1 <ptiter::down(bool)+0x81>
   42813:	48 85 d2             	test   %rdx,%rdx
   42816:	75 89                	jne    427a1 <ptiter::down(bool)+0x81>
                    lbits_ = vmiter::done_lbits;
   42818:	c7 47 10 40 00 00 00 	movl   $0x40,0x10(%rdi)
                    break;
   4281f:	eb 1d                	jmp    4283e <ptiter::down(bool)+0x11e>
                ++pep_;
   42821:	48 83 47 08 08       	addq   $0x8,0x8(%rdi)
   42826:	4c 01 e8             	add    %r13,%rax
                va_ = va_is_canonical(va) ? va : VA_HIGHMIN;
   42829:	49 39 c4             	cmp    %rax,%r12
   4282c:	48 0f 43 d3          	cmovae %rbx,%rdx
   42830:	48 89 57 18          	mov    %rdx,0x18(%rdi)
    while (lbits_ < vmiter::done_lbits) {
   42834:	44 8b 47 10          	mov    0x10(%rdi),%r8d
   42838:	41 83 f8 3f          	cmp    $0x3f,%r8d
   4283c:	7e 84                	jle    427c2 <ptiter::down(bool)+0xa2>
            }
            skip = false;
        }
    }
}
   4283e:	5b                   	pop    %rbx
   4283f:	41 5c                	pop    %r12
   42841:	41 5d                	pop    %r13
   42843:	41 5e                	pop    %r14
   42845:	41 5f                	pop    %r15
   42847:	5d                   	pop    %rbp
   42848:	c3                   	ret
   42849:	c3                   	ret

000000000004284a <ptiter::ptiter(x86_64_pagetable*)>:
ptiter::ptiter(x86_64_pagetable* pt)
   4284a:	f3 0f 1e fa          	endbr64
   4284e:	55                   	push   %rbp
   4284f:	48 89 e5             	mov    %rsp,%rbp
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(vmiter::initial_lbits), va_(0) {
   42852:	48 89 37             	mov    %rsi,(%rdi)
   42855:	48 89 77 08          	mov    %rsi,0x8(%rdi)
   42859:	c7 47 10 27 00 00 00 	movl   $0x27,0x10(%rdi)
   42860:	48 c7 47 18 00 00 00 	movq   $0x0,0x18(%rdi)
   42867:	00 
    down(false);
   42868:	be 00 00 00 00       	mov    $0x0,%esi
   4286d:	e8 ae fe ff ff       	call   42720 <ptiter::down(bool)>
}
   42872:	5d                   	pop    %rbp
   42873:	c3                   	ret

0000000000042874 <parallel_port_putc(unsigned char)>:
    (void) inb(0x84);
    (void) inb(0x84);
    (void) inb(0x84);
}

static void parallel_port_putc(unsigned char c) {
   42874:	41 89 f8             	mov    %edi,%r8d
    static int initialized;
    if (!initialized) {
   42877:	83 3d 86 87 02 00 00 	cmpl   $0x0,0x28786(%rip)        # 6b004 <parallel_port_putc(unsigned char)::initialized>
   4287e:	75 15                	jne    42895 <parallel_port_putc(unsigned char)+0x21>
    asm volatile("outb %0, %w1" : : "a" (data), "d" (port));
   42880:	b8 00 00 00 00       	mov    $0x0,%eax
   42885:	ba 7a 03 00 00       	mov    $0x37a,%edx
   4288a:	ee                   	out    %al,(%dx)
        outb(IO_PARALLEL1_CONTROL, 0);
        initialized = 1;
   4288b:	c7 05 6f 87 02 00 01 	movl   $0x1,0x2876f(%rip)        # 6b004 <parallel_port_putc(unsigned char)::initialized>
   42892:	00 00 00 
    asm volatile("inb %w1, %0" : "=a" (data) : "d" (port));
   42895:	ba 79 03 00 00       	mov    $0x379,%edx
   4289a:	ec                   	in     (%dx),%al
    }

    for (int i = 0;
         i < 12800 && (inb(IO_PARALLEL1_STATUS) & IO_PARALLEL_STATUS_BUSY) == 0;
   4289b:	be 00 32 00 00       	mov    $0x3200,%esi
   428a0:	b9 84 00 00 00       	mov    $0x84,%ecx
   428a5:	bf 79 03 00 00       	mov    $0x379,%edi
   428aa:	84 c0                	test   %al,%al
   428ac:	78 12                	js     428c0 <parallel_port_putc(unsigned char)+0x4c>
   428ae:	89 ca                	mov    %ecx,%edx
   428b0:	ec                   	in     (%dx),%al
   428b1:	ec                   	in     (%dx),%al
   428b2:	ec                   	in     (%dx),%al
   428b3:	ec                   	in     (%dx),%al
   428b4:	83 ee 01             	sub    $0x1,%esi
   428b7:	74 07                	je     428c0 <parallel_port_putc(unsigned char)+0x4c>
   428b9:	89 fa                	mov    %edi,%edx
   428bb:	ec                   	in     (%dx),%al
   428bc:	84 c0                	test   %al,%al
   428be:	79 ee                	jns    428ae <parallel_port_putc(unsigned char)+0x3a>
    asm volatile("outb %0, %w1" : : "a" (data), "d" (port));
   428c0:	ba 78 03 00 00       	mov    $0x378,%edx
   428c5:	44 89 c0             	mov    %r8d,%eax
   428c8:	ee                   	out    %al,(%dx)
   428c9:	ba 7a 03 00 00       	mov    $0x37a,%edx
   428ce:	b8 0d 00 00 00       	mov    $0xd,%eax
   428d3:	ee                   	out    %al,(%dx)
   428d4:	b8 0c 00 00 00       	mov    $0xc,%eax
   428d9:	ee                   	out    %al,(%dx)
    outb(IO_PARALLEL1_DATA, c);
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT | IO_PARALLEL_CONTROL_STROBE);
    outb(IO_PARALLEL1_CONTROL, IO_PARALLEL_CONTROL_SELECT
         | IO_PARALLEL_CONTROL_INIT);
}
   428da:	c3                   	ret
   428db:	90                   	nop

00000000000428dc <(anonymous namespace)::log_printer::putc(unsigned char)>:

namespace {
struct log_printer : public printer {
    void putc(unsigned char c) override {
   428dc:	f3 0f 1e fa          	endbr64
   428e0:	55                   	push   %rbp
   428e1:	48 89 e5             	mov    %rsp,%rbp
        parallel_port_putc(c);
   428e4:	40 0f b6 fe          	movzbl %sil,%edi
   428e8:	e8 87 ff ff ff       	call   42874 <parallel_port_putc(unsigned char)>
    }
   428ed:	5d                   	pop    %rbp
   428ee:	c3                   	ret

00000000000428ef <stash_kernel_data(bool)>:

// stash_kernel_data
//    Soft reboot requires that we restore kernel data memory to
//    its initial state, so we store its initial state in unused
//    physical memory.
static void stash_kernel_data(bool reboot) {
   428ef:	55                   	push   %rbp
   428f0:	48 89 e5             	mov    %rsp,%rbp
   428f3:	89 f8                	mov    %edi,%eax
    // stash initial value of data segment for soft-reboot support
    extern uint8_t _data_start[], _edata[], _kernel_end[];
    uintptr_t data_size = (uintptr_t) _edata - (uintptr_t) _data_start;
   428f5:	ba 10 36 06 00       	mov    $0x63610,%edx
   428fa:	48 81 ea 00 80 04 00 	sub    $0x48000,%rdx
    uint8_t* data_stash = (uint8_t*) (SYMTAB_ADDR - data_size);
   42901:	bf 00 80 04 01       	mov    $0x1048000,%edi
   42906:	48 81 ef 10 36 06 00 	sub    $0x63610,%rdi
    if (reboot) {
   4290d:	84 c0                	test   %al,%al
   4290f:	74 2a                	je     4293b <stash_kernel_data(bool)+0x4c>
        memcpy(_data_start, data_stash, data_size);
   42911:	48 89 fe             	mov    %rdi,%rsi
   42914:	bf 00 80 04 00       	mov    $0x48000,%edi
   42919:	e8 70 28 00 00       	call   4518e <memcpy>
        memset(_edata, 0, _kernel_end - _edata);
   4291e:	ba a0 b1 06 00       	mov    $0x6b1a0,%edx
   42923:	48 81 ea 10 36 06 00 	sub    $0x63610,%rdx
   4292a:	be 00 00 00 00       	mov    $0x0,%esi
   4292f:	bf 10 36 06 00       	mov    $0x63610,%edi
   42934:	e8 79 28 00 00       	call   451b2 <memset>
    } else {
        memcpy(data_stash, _data_start, data_size);
    }
}
   42939:	5d                   	pop    %rbp
   4293a:	c3                   	ret
        memcpy(data_stash, _data_start, data_size);
   4293b:	be 00 80 04 00       	mov    $0x48000,%esi
   42940:	e8 49 28 00 00       	call   4518e <memcpy>
}
   42945:	eb f2                	jmp    42939 <stash_kernel_data(bool)+0x4a>
   42947:	90                   	nop

0000000000042948 <(anonymous namespace)::backtracer::check()>:
void backtracer::check() {
   42948:	55                   	push   %rbp
   42949:	48 89 e5             	mov    %rsp,%rbp
   4294c:	53                   	push   %rbx
   4294d:	48 83 ec 28          	sub    $0x28,%rsp
   42951:	48 89 fb             	mov    %rdi,%rbx
    if (pt_
   42954:	48 8b 47 20          	mov    0x20(%rdi),%rax
        && vmiter(pt_, rbp_).range_perm(16, PTE_P)) {
   42958:	48 85 c0             	test   %rax,%rax
   4295b:	74 21                	je     4297e <(anonymous namespace)::backtracer::check()+0x36>
        && rbp_ >= rsp_
   4295d:	48 8b 37             	mov    (%rdi),%rsi
   42960:	48 3b 77 08          	cmp    0x8(%rdi),%rsi
   42964:	72 18                	jb     4297e <(anonymous namespace)::backtracer::check()+0x36>
        && stack_top_ >= rbp_
   42966:	48 8b 57 10          	mov    0x10(%rdi),%rdx
   4296a:	48 39 f2             	cmp    %rsi,%rdx
   4296d:	72 0f                	jb     4297e <(anonymous namespace)::backtracer::check()+0x36>
        && stack_top_ - rbp_ >= 16
   4296f:	48 29 f2             	sub    %rsi,%rdx
   42972:	48 83 fa 0f          	cmp    $0xf,%rdx
   42976:	76 06                	jbe    4297e <(anonymous namespace)::backtracer::check()+0x36>
        && (rbp_ & 7) == 0
   42978:	40 f6 c6 07          	test   $0x7,%sil
   4297c:	74 15                	je     42993 <(anonymous namespace)::backtracer::check()+0x4b>
    rbp_ = rsp_ = 0;
   4297e:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
   42985:	00 
   42986:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
}
   4298d:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   42991:	c9                   	leave
   42992:	c3                   	ret
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   42993:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
   42997:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
   4299b:	c7 45 e0 27 00 00 00 	movl   $0x27,-0x20(%rbp)
      perm_(initial_perm), va_(0) {
   429a2:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   429a9:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   429b0:	00 
    real_find(va, false);
   429b1:	ba 00 00 00 00       	mov    $0x0,%edx
   429b6:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   429ba:	e8 67 f9 ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    return (range_perm(sz) & desired_perm) == desired_perm;
   429bf:	be 10 00 00 00       	mov    $0x10,%esi
   429c4:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   429c8:	e8 43 fc ff ff       	call   42610 <vmiter::range_perm(unsigned long) const>
        && vmiter(pt_, rbp_).range_perm(16, PTE_P)) {
   429cd:	a8 01                	test   $0x1,%al
   429cf:	74 ad                	je     4297e <(anonymous namespace)::backtracer::check()+0x36>
   429d1:	eb ba                	jmp    4298d <(anonymous namespace)::backtracer::check()+0x45>

00000000000429d3 <init_timer(int)>:
void init_timer(int rate) {
   429d3:	f3 0f 1e fa          	endbr64
    if (rate > 0) {
   429d7:	85 ff                	test   %edi,%edi
   429d9:	7e 16                	jle    429f1 <init_timer(int)+0x1e>
        lapic.write(lapic.reg_timer_initial_count, 1000000000 / rate);
   429db:	b8 00 ca 9a 3b       	mov    $0x3b9aca00,%eax
   429e0:	ba 00 00 00 00       	mov    $0x0,%edx
   429e5:	f7 ff                	idiv   %edi
   429e7:	a3 80 03 e0 fe 00 00 	movabs %eax,0xfee00380
   429ee:	00 00 
}
   429f0:	c3                   	ret
    reg_[reg].v = v;
   429f1:	b8 80 03 e0 fe       	mov    $0xfee00380,%eax
   429f6:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
}
   429fc:	c3                   	ret

00000000000429fd <kalloc_pagetable()>:
x86_64_pagetable* kalloc_pagetable() {
   429fd:	f3 0f 1e fa          	endbr64
   42a01:	55                   	push   %rbp
   42a02:	48 89 e5             	mov    %rsp,%rbp
   42a05:	53                   	push   %rbx
   42a06:	48 83 ec 08          	sub    $0x8,%rsp
    x86_64_pagetable* pt = reinterpret_cast<x86_64_pagetable*>(kalloc(PAGESIZE));
   42a0a:	bf 00 10 00 00       	mov    $0x1000,%edi
   42a0f:	e8 52 e1 ff ff       	call   40b66 <kalloc(unsigned long)>
   42a14:	48 89 c3             	mov    %rax,%rbx
    if (pt) {
   42a17:	48 85 c0             	test   %rax,%rax
   42a1a:	74 12                	je     42a2e <kalloc_pagetable()+0x31>
        memset(&pt->entry[0], 0, sizeof(x86_64_pagetable));
   42a1c:	ba 00 10 00 00       	mov    $0x1000,%edx
   42a21:	be 00 00 00 00       	mov    $0x0,%esi
   42a26:	48 89 c7             	mov    %rax,%rdi
   42a29:	e8 84 27 00 00       	call   451b2 <memset>
}
   42a2e:	48 89 d8             	mov    %rbx,%rax
   42a31:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   42a35:	c9                   	leave
   42a36:	c3                   	ret

0000000000042a37 <reserved_physical_address(unsigned long)>:
bool reserved_physical_address(uintptr_t pa) {
   42a37:	f3 0f 1e fa          	endbr64
    return pa < PAGESIZE || (pa >= IOPHYSMEM && pa < EXTPHYSMEM);
   42a3b:	48 8d 87 00 00 f6 ff 	lea    -0xa0000(%rdi),%rax
   42a42:	48 3d ff ff 05 00    	cmp    $0x5ffff,%rax
   42a48:	0f 96 c0             	setbe  %al
   42a4b:	48 81 ff ff 0f 00 00 	cmp    $0xfff,%rdi
   42a52:	0f 96 c2             	setbe  %dl
   42a55:	09 d0                	or     %edx,%eax
}
   42a57:	c3                   	ret

0000000000042a58 <allocatable_physical_address(unsigned long)>:
bool allocatable_physical_address(uintptr_t pa) {
   42a58:	f3 0f 1e fa          	endbr64
   42a5c:	55                   	push   %rbp
   42a5d:	48 89 e5             	mov    %rsp,%rbp
   42a60:	53                   	push   %rbx
   42a61:	48 83 ec 08          	sub    $0x8,%rsp
   42a65:	48 89 fb             	mov    %rdi,%rbx
    return !reserved_physical_address(pa)
   42a68:	e8 ca ff ff ff       	call   42a37 <reserved_physical_address(unsigned long)>
        && pa < MEMSIZE_PHYSICAL;
   42a6d:	84 c0                	test   %al,%al
   42a6f:	75 36                	jne    42aa7 <allocatable_physical_address(unsigned long)+0x4f>
        && (pa < KERNEL_START_ADDR
   42a71:	48 81 fb ff ff 03 00 	cmp    $0x3ffff,%rbx
   42a78:	76 21                	jbe    42a9b <allocatable_physical_address(unsigned long)+0x43>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
   42a7a:	ba 9f c1 06 00       	mov    $0x6c19f,%edx
            || pa >= round_up((uintptr_t) _kernel_end, PAGESIZE))
   42a7f:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
   42a86:	48 39 d3             	cmp    %rdx,%rbx
   42a89:	72 21                	jb     42aac <allocatable_physical_address(unsigned long)+0x54>
            || pa >= KERNEL_STACK_TOP)
   42a8b:	48 8d 93 00 10 f8 ff 	lea    -0x7f000(%rbx),%rdx
        && (pa < KERNEL_STACK_TOP - PAGESIZE
   42a92:	48 81 fa ff 0f 00 00 	cmp    $0xfff,%rdx
   42a99:	76 11                	jbe    42aac <allocatable_physical_address(unsigned long)+0x54>
        && pa < MEMSIZE_PHYSICAL;
   42a9b:	48 81 fb ff ff 1f 00 	cmp    $0x1fffff,%rbx
   42aa2:	0f 96 c0             	setbe  %al
   42aa5:	eb 05                	jmp    42aac <allocatable_physical_address(unsigned long)+0x54>
   42aa7:	b8 00 00 00 00       	mov    $0x0,%eax
}
   42aac:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   42ab0:	c9                   	leave
   42ab1:	c3                   	ret

0000000000042ab2 <init_process(proc*, int)>:
void init_process(proc* p, int flags) {
   42ab2:	f3 0f 1e fa          	endbr64
   42ab6:	55                   	push   %rbp
   42ab7:	48 89 e5             	mov    %rsp,%rbp
   42aba:	41 54                	push   %r12
   42abc:	53                   	push   %rbx
   42abd:	48 89 fb             	mov    %rdi,%rbx
   42ac0:	41 89 f4             	mov    %esi,%r12d
    memset(&p->regs, 0, sizeof(p->regs));
   42ac3:	48 8d 7f 10          	lea    0x10(%rdi),%rdi
   42ac7:	ba c0 00 00 00       	mov    $0xc0,%edx
   42acc:	be 00 00 00 00       	mov    $0x0,%esi
   42ad1:	e8 dc 26 00 00       	call   451b2 <memset>
    p->regs.reg_cs = SEGSEL_APP_CODE | 3;
   42ad6:	48 c7 83 b0 00 00 00 	movq   $0x1b,0xb0(%rbx)
   42add:	1b 00 00 00 
    p->regs.reg_fs = SEGSEL_APP_DATA | 3;
   42ae1:	48 c7 83 88 00 00 00 	movq   $0x23,0x88(%rbx)
   42ae8:	23 00 00 00 
    p->regs.reg_gs = SEGSEL_APP_DATA | 3;
   42aec:	48 c7 83 90 00 00 00 	movq   $0x23,0x90(%rbx)
   42af3:	23 00 00 00 
    p->regs.reg_ss = SEGSEL_APP_DATA | 3;
   42af7:	48 c7 83 c8 00 00 00 	movq   $0x23,0xc8(%rbx)
   42afe:	23 00 00 00 
    if (flags & PROCINIT_ALLOW_PROGRAMMED_IO) {
   42b02:	44 89 e0             	mov    %r12d,%eax
   42b05:	83 e0 01             	and    $0x1,%eax
        p->regs.reg_rflags |= EFLAGS_IOPL_3;
   42b08:	83 f8 01             	cmp    $0x1,%eax
   42b0b:	48 19 c0             	sbb    %rax,%rax
   42b0e:	48 25 00 d0 ff ff    	and    $0xffffffffffffd000,%rax
   42b14:	48 05 00 32 00 00    	add    $0x3200,%rax
    if (flags & PROCINIT_DISABLE_INTERRUPTS) {
   42b1a:	41 f6 c4 02          	test   $0x2,%r12b
   42b1e:	75 09                	jne    42b29 <init_process(proc*, int)+0x77>
   42b20:	48 89 83 b8 00 00 00 	mov    %rax,0xb8(%rbx)
   42b27:	eb 0a                	jmp    42b33 <init_process(proc*, int)+0x81>
        p->regs.reg_rflags &= ~EFLAGS_IF;
   42b29:	80 e4 fd             	and    $0xfd,%ah
   42b2c:	48 89 83 b8 00 00 00 	mov    %rax,0xb8(%rbx)
}
   42b33:	5b                   	pop    %rbx
   42b34:	41 5c                	pop    %r12
   42b36:	5d                   	pop    %rbp
   42b37:	c3                   	ret

0000000000042b38 <console_show_cursor(int)>:
void console_show_cursor(int cpos) {
   42b38:	f3 0f 1e fa          	endbr64
        cpos = 0;
   42b3c:	81 ff d1 07 00 00    	cmp    $0x7d1,%edi
   42b42:	b8 00 00 00 00       	mov    $0x0,%eax
   42b47:	0f 43 f8             	cmovae %eax,%edi
   42b4a:	be d4 03 00 00       	mov    $0x3d4,%esi
   42b4f:	b8 0e 00 00 00       	mov    $0xe,%eax
   42b54:	89 f2                	mov    %esi,%edx
   42b56:	ee                   	out    %al,(%dx)
    outb(0x3D5, cpos / 256);
   42b57:	8d 87 ff 00 00 00    	lea    0xff(%rdi),%eax
   42b5d:	85 ff                	test   %edi,%edi
   42b5f:	0f 49 c7             	cmovns %edi,%eax
   42b62:	c1 f8 08             	sar    $0x8,%eax
   42b65:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
   42b6a:	89 ca                	mov    %ecx,%edx
   42b6c:	ee                   	out    %al,(%dx)
   42b6d:	b8 0f 00 00 00       	mov    $0xf,%eax
   42b72:	89 f2                	mov    %esi,%edx
   42b74:	ee                   	out    %al,(%dx)
    outb(0x3D5, cpos % 256);
   42b75:	89 fa                	mov    %edi,%edx
   42b77:	c1 fa 1f             	sar    $0x1f,%edx
   42b7a:	c1 ea 18             	shr    $0x18,%edx
   42b7d:	8d 04 17             	lea    (%rdi,%rdx,1),%eax
   42b80:	0f b6 c0             	movzbl %al,%eax
   42b83:	29 d0                	sub    %edx,%eax
   42b85:	89 ca                	mov    %ecx,%edx
   42b87:	ee                   	out    %al,(%dx)
}
   42b88:	c3                   	ret

0000000000042b89 <keyboard_readc()>:
int keyboard_readc() {
   42b89:	f3 0f 1e fa          	endbr64
    asm volatile("inb %w1, %0" : "=a" (data) : "d" (port));
   42b8d:	ba 64 00 00 00       	mov    $0x64,%edx
   42b92:	ec                   	in     (%dx),%al
    if ((inb(KEYBOARD_STATUSREG) & KEYBOARD_STATUS_READY) == 0) {
   42b93:	a8 01                	test   $0x1,%al
   42b95:	0f 84 1d 01 00 00    	je     42cb8 <keyboard_readc()+0x12f>
   42b9b:	ba 60 00 00 00       	mov    $0x60,%edx
   42ba0:	ec                   	in     (%dx),%al
    uint8_t escape = last_escape;
   42ba1:	0f b6 15 60 84 02 00 	movzbl 0x28460(%rip),%edx        # 6b008 <keyboard_readc()::last_escape>
    last_escape = 0;
   42ba8:	c6 05 59 84 02 00 00 	movb   $0x0,0x28459(%rip)        # 6b008 <keyboard_readc()::last_escape>
    if (data == 0xE0) {         // mode shift
   42baf:	3c e0                	cmp    $0xe0,%al
   42bb1:	74 2a                	je     42bdd <keyboard_readc()+0x54>
    } else if (data & 0x80) {   // key release: matters only for modifier keys
   42bb3:	84 c0                	test   %al,%al
   42bb5:	78 33                	js     42bea <keyboard_readc()+0x61>
    int ch = (unsigned char) keymap[data | escape];
   42bb7:	09 c2                	or     %eax,%edx
   42bb9:	0f b6 d2             	movzbl %dl,%edx
   42bbc:	0f b6 82 80 6a 04 00 	movzbl 0x46a80(%rdx),%eax
    if (ch >= 'a' && ch <= 'z') {
   42bc3:	89 c1                	mov    %eax,%ecx
   42bc5:	8d 50 9f             	lea    -0x61(%rax),%edx
   42bc8:	83 fa 19             	cmp    $0x19,%edx
   42bcb:	77 76                	ja     42c43 <keyboard_readc()+0xba>
        if (modifiers & MOD_CONTROL) {
   42bcd:	0f b6 15 35 84 02 00 	movzbl 0x28435(%rip),%edx        # 6b009 <keyboard_readc()::modifiers>
   42bd4:	f6 c2 02             	test   $0x2,%dl
   42bd7:	74 50                	je     42c29 <keyboard_readc()+0xa0>
            ch -= 0x60;
   42bd9:	83 e8 60             	sub    $0x60,%eax
   42bdc:	c3                   	ret
        last_escape = 0x80;
   42bdd:	c6 05 24 84 02 00 80 	movb   $0x80,0x28424(%rip)        # 6b008 <keyboard_readc()::last_escape>
        return 0;
   42be4:	b8 00 00 00 00       	mov    $0x0,%eax
   42be9:	c3                   	ret
        int ch = keymap[(data & 0x7F) | escape];
   42bea:	83 e0 7f             	and    $0x7f,%eax
   42bed:	09 d0                	or     %edx,%eax
   42bef:	0f b6 c0             	movzbl %al,%eax
   42bf2:	0f b6 88 80 6a 04 00 	movzbl 0x46a80(%rax),%ecx
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   42bf9:	0f b6 d1             	movzbl %cl,%edx
   42bfc:	81 ea fa 00 00 00    	sub    $0xfa,%edx
        return 0;
   42c02:	b8 00 00 00 00       	mov    $0x0,%eax
        if (ch >= KEY_SHIFT && ch < KEY_CAPSLOCK) {
   42c07:	83 fa 02             	cmp    $0x2,%edx
   42c0a:	0f 87 ad 00 00 00    	ja     42cbd <keyboard_readc()+0x134>
            modifiers &= ~(1 << (ch - KEY_SHIFT));
   42c10:	83 c1 06             	add    $0x6,%ecx
   42c13:	0f b6 05 ef 83 02 00 	movzbl 0x283ef(%rip),%eax        # 6b009 <keyboard_readc()::modifiers>
   42c1a:	0f b3 c8             	btr    %ecx,%eax
   42c1d:	88 05 e6 83 02 00    	mov    %al,0x283e6(%rip)        # 6b009 <keyboard_readc()::modifiers>
        return 0;
   42c23:	b8 00 00 00 00       	mov    $0x0,%eax
   42c28:	c3                   	ret
        } else if (!(modifiers & MOD_SHIFT) != !(modifiers & MOD_CAPSLOCK)) {
   42c29:	89 d1                	mov    %edx,%ecx
   42c2b:	83 f1 01             	xor    $0x1,%ecx
   42c2e:	83 e1 01             	and    $0x1,%ecx
   42c31:	c0 ea 03             	shr    $0x3,%dl
   42c34:	83 f2 01             	xor    $0x1,%edx
   42c37:	83 e2 01             	and    $0x1,%edx
            ch -= 0x20;
   42c3a:	8d 70 e0             	lea    -0x20(%rax),%esi
   42c3d:	38 d1                	cmp    %dl,%cl
   42c3f:	0f 45 c6             	cmovne %esi,%eax
   42c42:	c3                   	ret
    } else if (ch >= KEY_CAPSLOCK) {
   42c43:	3d fc 00 00 00       	cmp    $0xfc,%eax
   42c48:	7e 19                	jle    42c63 <keyboard_readc()+0xda>
        modifiers ^= 1 << (ch - KEY_SHIFT);
   42c4a:	8d 88 06 ff ff ff    	lea    -0xfa(%rax),%ecx
   42c50:	ba 01 00 00 00       	mov    $0x1,%edx
   42c55:	d3 e2                	shl    %cl,%edx
   42c57:	30 15 ac 83 02 00    	xor    %dl,0x283ac(%rip)        # 6b009 <keyboard_readc()::modifiers>
        ch = 0;
   42c5d:	b8 00 00 00 00       	mov    $0x0,%eax
   42c62:	c3                   	ret
    } else if (ch >= KEY_SHIFT) {
   42c63:	3d f9 00 00 00       	cmp    $0xf9,%eax
   42c68:	7e 19                	jle    42c83 <keyboard_readc()+0xfa>
        modifiers |= 1 << (ch - KEY_SHIFT);
   42c6a:	8d 88 06 ff ff ff    	lea    -0xfa(%rax),%ecx
   42c70:	ba 01 00 00 00       	mov    $0x1,%edx
   42c75:	d3 e2                	shl    %cl,%edx
   42c77:	08 15 8c 83 02 00    	or     %dl,0x2838c(%rip)        # 6b009 <keyboard_readc()::modifiers>
        ch = 0;
   42c7d:	b8 00 00 00 00       	mov    $0x0,%eax
   42c82:	c3                   	ret
    } else if (ch >= CKEY(0) && ch <= CKEY(21)) {
   42c83:	83 c1 80             	add    $0xffffff80,%ecx
   42c86:	83 f9 15             	cmp    $0x15,%ecx
   42c89:	77 18                	ja     42ca3 <keyboard_readc()+0x11a>
        ch = complex_keymap[ch - CKEY(0)].map[modifiers & 3];
   42c8b:	0f b6 15 77 83 02 00 	movzbl 0x28377(%rip),%edx        # 6b009 <keyboard_readc()::modifiers>
   42c92:	83 e2 03             	and    $0x3,%edx
   42c95:	83 c0 80             	add    $0xffffff80,%eax
   42c98:	48 98                	cltq
   42c9a:	0f b6 84 82 20 6a 04 	movzbl 0x46a20(%rdx,%rax,4),%eax
   42ca1:	00 
   42ca2:	c3                   	ret
    } else if (ch < 0x80 && (modifiers & MOD_CONTROL)) {
   42ca3:	83 f8 7f             	cmp    $0x7f,%eax
   42ca6:	7f 15                	jg     42cbd <keyboard_readc()+0x134>
        ch = 0;
   42ca8:	f6 05 5a 83 02 00 02 	testb  $0x2,0x2835a(%rip)        # 6b009 <keyboard_readc()::modifiers>
   42caf:	ba 00 00 00 00       	mov    $0x0,%edx
   42cb4:	0f 45 c2             	cmovne %edx,%eax
   42cb7:	c3                   	ret
        return -1;
   42cb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   42cbd:	c3                   	ret

0000000000042cbe <log_vprintf(char const*, __va_list_tag*)>:
void log_vprintf(const char* format, va_list val) {
   42cbe:	f3 0f 1e fa          	endbr64
   42cc2:	55                   	push   %rbp
   42cc3:	48 89 e5             	mov    %rsp,%rbp
   42cc6:	48 83 ec 10          	sub    $0x10,%rsp
   42cca:	48 89 f2             	mov    %rsi,%rdx
    log_printer pr;
   42ccd:	48 c7 45 f0 f0 69 04 	movq   $0x469f0,-0x10(%rbp)
   42cd4:	00 
   42cd5:	c7 45 f8 00 07 00 00 	movl   $0x700,-0x8(%rbp)
    pr.vprintf(format, val);
   42cdc:	48 89 fe             	mov    %rdi,%rsi
   42cdf:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
   42ce3:	e8 40 26 00 00       	call   45328 <printer::vprintf(char const*, __va_list_tag*)>
}
   42ce8:	c9                   	leave
   42ce9:	c3                   	ret

0000000000042cea <log_printf(char const*, ...)>:
void log_printf(const char* format, ...) {
   42cea:	f3 0f 1e fa          	endbr64
   42cee:	55                   	push   %rbp
   42cef:	48 89 e5             	mov    %rsp,%rbp
   42cf2:	48 83 ec 50          	sub    $0x50,%rsp
   42cf6:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   42cfa:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   42cfe:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   42d02:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   42d06:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_start(val, format);
   42d0a:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   42d11:	48 8d 45 10          	lea    0x10(%rbp),%rax
   42d15:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   42d19:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   42d1d:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    log_vprintf(format, val);
   42d21:	48 8d 75 b8          	lea    -0x48(%rbp),%rsi
   42d25:	e8 94 ff ff ff       	call   42cbe <log_vprintf(char const*, __va_list_tag*)>
}
   42d2a:	c9                   	leave
   42d2b:	c3                   	ret

0000000000042d2c <lookup_symbol(unsigned long, char const**, unsigned long*)>:
bool lookup_symbol(uintptr_t addr, const char** name, uintptr_t* start) {
   42d2c:	f3 0f 1e fa          	endbr64
   42d30:	55                   	push   %rbp
   42d31:	48 89 e5             	mov    %rsp,%rbp
   42d34:	41 54                	push   %r12
   42d36:	53                   	push   %rbx
   42d37:	49 89 f8             	mov    %rdi,%r8
   42d3a:	48 89 f3             	mov    %rsi,%rbx
   42d3d:	49 89 d4             	mov    %rdx,%r12
    if (!kernel_pagetable[2].entry[SYMTAB_ADDR / 0x200000]) {
   42d40:	48 83 3d f8 52 02 00 	cmpq   $0x0,0x252f8(%rip)        # 68040 <kernel_pagetable+0x2040>
   42d47:	00 
   42d48:	75 0b                	jne    42d55 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x29>
        kernel_pagetable[2].entry[SYMTAB_ADDR / 0x200000] =
   42d4a:	48 c7 05 eb 52 02 00 	movq   $0x1000083,0x252eb(%rip)        # 68040 <kernel_pagetable+0x2040>
   42d51:	83 00 00 01 
    size_t r = symtab.nsym;
   42d55:	4c 8b 1d 6c 53 00 00 	mov    0x536c(%rip),%r11        # 480c8 <symtab+0x8>
        auto& sym = symtab.sym[m];
   42d5c:	4c 8b 15 5d 53 00 00 	mov    0x535d(%rip),%r10        # 480c0 <symtab>
    size_t r = symtab.nsym;
   42d63:	4c 89 d9             	mov    %r11,%rcx
    size_t l = 0;
   42d66:	ba 00 00 00 00       	mov    $0x0,%edx
    while (l < r) {
   42d6b:	eb 25                	jmp    42d92 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x66>
                ? addr < sym.st_value + 0x1000
   42d6d:	4c 8d 8e 00 10 00 00 	lea    0x1000(%rsi),%r9
            && (m + 1 == symtab.nsym
   42d74:	4d 39 c8             	cmp    %r9,%r8
   42d77:	73 11                	jae    42d8a <lookup_symbol(unsigned long, char const**, unsigned long*)+0x5e>
            && (sym.st_size == 0 || addr <= sym.st_value + sym.st_size)) {
   42d79:	4c 8b 4f 10          	mov    0x10(%rdi),%r9
   42d7d:	4d 85 c9             	test   %r9,%r9
   42d80:	74 43                	je     42dc5 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x99>
   42d82:	49 01 f1             	add    %rsi,%r9
   42d85:	4d 39 c1             	cmp    %r8,%r9
   42d88:	73 3b                	jae    42dc5 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x99>
        } else if (sym.st_value < addr) {
   42d8a:	4c 39 c6             	cmp    %r8,%rsi
   42d8d:	72 6a                	jb     42df9 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xcd>
    size_t l = 0;
   42d8f:	48 89 c1             	mov    %rax,%rcx
    while (l < r) {
   42d92:	48 39 ca             	cmp    %rcx,%rdx
   42d95:	73 68                	jae    42dff <lookup_symbol(unsigned long, char const**, unsigned long*)+0xd3>
        size_t m = l + ((r - l) >> 1);
   42d97:	48 89 c8             	mov    %rcx,%rax
   42d9a:	48 29 d0             	sub    %rdx,%rax
   42d9d:	48 d1 e8             	shr    $1,%rax
   42da0:	48 01 d0             	add    %rdx,%rax
        auto& sym = symtab.sym[m];
   42da3:	48 8d 34 40          	lea    (%rax,%rax,2),%rsi
   42da7:	49 8d 3c f2          	lea    (%r10,%rsi,8),%rdi
        if (sym.st_value <= addr
   42dab:	48 8b 77 08          	mov    0x8(%rdi),%rsi
   42daf:	49 39 f0             	cmp    %rsi,%r8
   42db2:	72 db                	jb     42d8f <lookup_symbol(unsigned long, char const**, unsigned long*)+0x63>
            && (m + 1 == symtab.nsym
   42db4:	4c 8d 48 01          	lea    0x1(%rax),%r9
        if (sym.st_value <= addr
   42db8:	4d 39 d9             	cmp    %r11,%r9
   42dbb:	74 b0                	je     42d6d <lookup_symbol(unsigned long, char const**, unsigned long*)+0x41>
                ? addr < sym.st_value + 0x1000
   42dbd:	4c 3b 47 20          	cmp    0x20(%rdi),%r8
   42dc1:	73 c7                	jae    42d8a <lookup_symbol(unsigned long, char const**, unsigned long*)+0x5e>
   42dc3:	eb b4                	jmp    42d79 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x4d>
                return false;
   42dc5:	b8 00 00 00 00       	mov    $0x0,%eax
            if (!sym.st_value) {
   42dca:	48 85 f6             	test   %rsi,%rsi
   42dcd:	74 35                	je     42e04 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xd8>
            if (name) {
   42dcf:	48 85 db             	test   %rbx,%rbx
   42dd2:	74 0c                	je     42de0 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xb4>
                *name = symtab.strtab + sym.st_name;
   42dd4:	8b 07                	mov    (%rdi),%eax
   42dd6:	48 03 05 f3 52 00 00 	add    0x52f3(%rip),%rax        # 480d0 <symtab+0x10>
   42ddd:	48 89 03             	mov    %rax,(%rbx)
            return true;
   42de0:	b8 01 00 00 00       	mov    $0x1,%eax
            if (start) {
   42de5:	4d 85 e4             	test   %r12,%r12
   42de8:	74 1a                	je     42e04 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xd8>
                *start = sym.st_value;
   42dea:	48 8b 47 08          	mov    0x8(%rdi),%rax
   42dee:	49 89 04 24          	mov    %rax,(%r12)
            return true;
   42df2:	b8 01 00 00 00       	mov    $0x1,%eax
   42df7:	eb 0b                	jmp    42e04 <lookup_symbol(unsigned long, char const**, unsigned long*)+0xd8>
            l = m + 1;
   42df9:	48 8d 50 01          	lea    0x1(%rax),%rdx
   42dfd:	eb 93                	jmp    42d92 <lookup_symbol(unsigned long, char const**, unsigned long*)+0x66>
    return false;
   42dff:	b8 00 00 00 00       	mov    $0x0,%eax
}
   42e04:	5b                   	pop    %rbx
   42e05:	41 5c                	pop    %r12
   42e07:	5d                   	pop    %rbp
   42e08:	c3                   	ret

0000000000042e09 <error_vprintf(int, int, char const*, __va_list_tag*)>:
void error_vprintf(int cpos, int color, const char* format, va_list val) {
   42e09:	f3 0f 1e fa          	endbr64
   42e0d:	55                   	push   %rbp
   42e0e:	48 89 e5             	mov    %rsp,%rbp
   42e11:	41 54                	push   %r12
   42e13:	53                   	push   %rbx
   42e14:	48 83 ec 20          	sub    $0x20,%rsp
   42e18:	48 89 d3             	mov    %rdx,%rbx
   42e1b:	49 89 cc             	mov    %rcx,%r12
    error_printer pr(cpos, cpos < 0, color);
   42e1e:	89 fa                	mov    %edi,%edx
   42e20:	c1 ea 1f             	shr    $0x1f,%edx
        : console_printer(cpos, scroll, color) {
   42e23:	89 f1                	mov    %esi,%ecx
   42e25:	89 fe                	mov    %edi,%esi
   42e27:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   42e2b:	e8 16 2e 00 00       	call   45c46 <console_printer::console_printer(int, bool, int)>
   42e30:	48 c7 45 d0 08 6a 04 	movq   $0x46a08,-0x30(%rbp)
   42e37:	00 
    pr.vprintf(format, val);
   42e38:	4c 89 e2             	mov    %r12,%rdx
   42e3b:	48 89 de             	mov    %rbx,%rsi
   42e3e:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   42e42:	e8 e1 24 00 00       	call   45328 <printer::vprintf(char const*, __va_list_tag*)>
}
   42e47:	48 83 c4 20          	add    $0x20,%rsp
   42e4b:	5b                   	pop    %rbx
   42e4c:	41 5c                	pop    %r12
   42e4e:	5d                   	pop    %rbp
   42e4f:	c3                   	ret

0000000000042e50 <strlcpy_from_user(char*, vmiter, unsigned long)>:
void strlcpy_from_user(char* buf, vmiter it, size_t maxlen) {
   42e50:	f3 0f 1e fa          	endbr64
   42e54:	55                   	push   %rbp
   42e55:	48 89 e5             	mov    %rsp,%rbp
   42e58:	41 57                	push   %r15
   42e5a:	41 56                	push   %r14
   42e5c:	41 55                	push   %r13
   42e5e:	41 54                	push   %r12
   42e60:	53                   	push   %rbx
   42e61:	48 83 ec 08          	sub    $0x8,%rsp
   42e65:	49 89 fc             	mov    %rdi,%r12
   42e68:	49 89 f7             	mov    %rsi,%r15
    while (i + 1 < maxlen && it.user()) {
   42e6b:	48 83 fe 01          	cmp    $0x1,%rsi
   42e6f:	0f 86 bb 00 00 00    	jbe    42f30 <strlcpy_from_user(char*, vmiter, unsigned long)+0xe0>
   42e75:	4c 8d 6e ff          	lea    -0x1(%rsi),%r13
   42e79:	bb 00 00 00 00       	mov    $0x0,%ebx
    return ~(~uintptr_t(0) << lbits);
   42e7e:	49 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%r14
   42e85:	eb 27                	jmp    42eae <strlcpy_from_user(char*, vmiter, unsigned long)+0x5e>
        return nullptr;
   42e87:	b8 00 00 00 00       	mov    $0x0,%eax
        buf[i] = *it.kptr<const char*>();
   42e8c:	0f b6 00             	movzbl (%rax),%eax
   42e8f:	41 88 04 34          	mov    %al,(%r12,%rsi,1)
    return find(va_ + 1);
   42e93:	48 8b 45 28          	mov    0x28(%rbp),%rax
   42e97:	48 8d 70 01          	lea    0x1(%rax),%rsi
        real_find(va, false);
   42e9b:	ba 00 00 00 00       	mov    $0x0,%edx
   42ea0:	48 8d 7d 10          	lea    0x10(%rbp),%rdi
   42ea4:	e8 7d f4 ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    while (i + 1 < maxlen && it.user()) {
   42ea9:	49 39 dd             	cmp    %rbx,%r13
   42eac:	74 66                	je     42f14 <strlcpy_from_user(char*, vmiter, unsigned long)+0xc4>
   42eae:	48 89 de             	mov    %rbx,%rsi
   42eb1:	48 83 c3 01          	add    $0x1,%rbx
    uint64_t ph = *pep_ & perm_;
   42eb5:	48 8b 45 18          	mov    0x18(%rbp),%rax
   42eb9:	48 8b 10             	mov    (%rax),%rdx
   42ebc:	48 63 4d 24          	movslq 0x24(%rbp),%rcx
   42ec0:	48 21 d1             	and    %rdx,%rcx
    return ph & -(ph & PTE_P);
   42ec3:	48 89 c8             	mov    %rcx,%rax
   42ec6:	83 e0 01             	and    $0x1,%eax
   42ec9:	48 f7 d8             	neg    %rax
   42ecc:	48 21 c8             	and    %rcx,%rax
   42ecf:	48 f7 d0             	not    %rax
   42ed2:	a8 05                	test   $0x5,%al
   42ed4:	75 41                	jne    42f17 <strlcpy_from_user(char*, vmiter, unsigned long)+0xc7>
    if (*pep_ & PTE_P) {
   42ed6:	f6 c2 01             	test   $0x1,%dl
   42ed9:	74 ac                	je     42e87 <strlcpy_from_user(char*, vmiter, unsigned long)+0x37>
        if (lbits_ > PAGEOFFBITS) {
   42edb:	8b 4d 20             	mov    0x20(%rbp),%ecx
        uintptr_t pa = *pep_ & PTE_PAMASK;
   42ede:	48 bf 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdi
   42ee5:	ff 0f 00 
   42ee8:	48 21 d7             	and    %rdx,%rdi
   42eeb:	48 b8 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rax
   42ef2:	ff 0f 00 
   42ef5:	48 21 c2             	and    %rax,%rdx
   42ef8:	83 f9 0c             	cmp    $0xc,%ecx
   42efb:	48 0f 4f fa          	cmovg  %rdx,%rdi
    return ~(~uintptr_t(0) << lbits);
   42eff:	4c 89 f0             	mov    %r14,%rax
   42f02:	48 d3 e0             	shl    %cl,%rax
   42f05:	48 f7 d0             	not    %rax
        return pa + (va_ & lbits_mask(lbits_));
   42f08:	48 23 45 28          	and    0x28(%rbp),%rax
   42f0c:	48 01 f8             	add    %rdi,%rax
        return reinterpret_cast<T>(pa());
   42f0f:	e9 78 ff ff ff       	jmp    42e8c <strlcpy_from_user(char*, vmiter, unsigned long)+0x3c>
   42f14:	48 89 de             	mov    %rbx,%rsi
    if (i < maxlen) {
   42f17:	4c 39 fe             	cmp    %r15,%rsi
   42f1a:	73 05                	jae    42f21 <strlcpy_from_user(char*, vmiter, unsigned long)+0xd1>
        buf[i] = '\0';
   42f1c:	41 c6 04 34 00       	movb   $0x0,(%r12,%rsi,1)
}
   42f21:	48 83 c4 08          	add    $0x8,%rsp
   42f25:	5b                   	pop    %rbx
   42f26:	41 5c                	pop    %r12
   42f28:	41 5d                	pop    %r13
   42f2a:	41 5e                	pop    %r14
   42f2c:	41 5f                	pop    %r15
   42f2e:	5d                   	pop    %rbp
   42f2f:	c3                   	ret
    size_t i = 0;
   42f30:	be 00 00 00 00       	mov    $0x0,%esi
   42f35:	eb e0                	jmp    42f17 <strlcpy_from_user(char*, vmiter, unsigned long)+0xc7>

0000000000042f37 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)>:
                     x86_64_pagetable* pt, bool exclude_rip = false) {
   42f37:	f3 0f 1e fa          	endbr64
   42f3b:	55                   	push   %rbp
   42f3c:	48 89 e5             	mov    %rsp,%rbp
   42f3f:	41 57                	push   %r15
   42f41:	41 56                	push   %r14
   42f43:	41 55                	push   %r13
   42f45:	41 54                	push   %r12
   42f47:	53                   	push   %rbx
   42f48:	48 83 ec 68          	sub    $0x68,%rsp
   42f4c:	49 89 fe             	mov    %rdi,%r14
   42f4f:	48 89 f3             	mov    %rsi,%rbx
   42f52:	89 8d 7c ff ff ff    	mov    %ecx,-0x84(%rbp)
        : backtracer(regs, round_up(regs.reg_rsp, PAGESIZE), pt) {
   42f58:	4c 8b be b0 00 00 00 	mov    0xb0(%rsi),%r15
   42f5f:	4d 8d a7 ff 0f 00 00 	lea    0xfff(%r15),%r12
   42f66:	49 81 e4 00 f0 ff ff 	and    $0xfffffffffffff000,%r12
        : rbp_(regs.reg_rbp), rsp_(regs.reg_rsp), stack_top_(stack_top),
   42f6d:	48 8b 46 20          	mov    0x20(%rsi),%rax
   42f71:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
   42f75:	4c 89 7d b0          	mov    %r15,-0x50(%rbp)
   42f79:	4c 89 65 b8          	mov    %r12,-0x48(%rbp)
          pt_(pt) {
   42f7d:	c6 45 c0 00          	movb   $0x0,-0x40(%rbp)
   42f81:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
          && stack_top_ >= rsp_
   42f85:	4d 39 fc             	cmp    %r15,%r12
   42f88:	72 1a                	jb     42fa4 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x6d>
   42f8a:	49 89 d5             	mov    %rdx,%r13
   42f8d:	48 85 d2             	test   %rdx,%rdx
   42f90:	74 12                	je     42fa4 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x6d>
          && stack_top_ - rsp_ >= 8
   42f92:	4c 89 e0             	mov    %r12,%rax
   42f95:	4c 29 f8             	sub    %r15,%rax
   42f98:	48 83 f8 07          	cmp    $0x7,%rax
   42f9c:	76 06                	jbe    42fa4 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x6d>
          && (rsp_ & 7) == 0
   42f9e:	41 f6 c7 07          	test   $0x7,%r15b
   42fa2:	74 5f                	je     43003 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0xcc>
            check();
   42fa4:	48 8d 7d a8          	lea    -0x58(%rbp),%rdi
   42fa8:	e8 9b f9 ff ff       	call   42948 <(anonymous namespace)::backtracer::check()>
        return rsp_;
   42fad:	4c 8b 6d b0          	mov    -0x50(%rbp),%r13
        return rbp_;
   42fb1:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
        && round_up(bt.rsp(), PAGESIZE) == round_down(bt.rbp(), PAGESIZE)) {
   42fb5:	49 39 cd             	cmp    %rcx,%r13
   42fb8:	74 16                	je     42fd0 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x99>
   42fba:	49 8d 85 ff 0f 00 00 	lea    0xfff(%r13),%rax
   42fc1:	48 31 c8             	xor    %rcx,%rax
   42fc4:	48 3d ff 0f 00 00    	cmp    $0xfff,%rax
   42fca:	0f 86 8b 02 00 00    	jbe    4325b <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x324>
    if (!exclude_rip && regs.reg_rip) {
   42fd0:	80 bd 7c ff ff ff 00 	cmpb   $0x0,-0x84(%rbp)
   42fd7:	75 10                	jne    42fe9 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0xb2>
   42fd9:	48 8b bb 98 00 00 00 	mov    0x98(%rbx),%rdi
   42fe0:	48 85 ff             	test   %rdi,%rdi
   42fe3:	0f 85 8c 02 00 00    	jne    43275 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x33e>
    for (int frame = 1; bt.ok(); bt.step(), ++frame) {
   42fe9:	4d 85 ed             	test   %r13,%r13
   42fec:	0f 84 8d 05 00 00    	je     4357f <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x648>
   42ff2:	bb 01 00 00 00       	mov    $0x1,%ebx
    return ~(~uintptr_t(0) << lbits);
   42ff7:	49 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%r15
   42ffe:	e9 27 03 00 00       	jmp    4332a <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x3f3>
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   43003:	48 89 55 88          	mov    %rdx,-0x78(%rbp)
   43007:	48 89 55 90          	mov    %rdx,-0x70(%rbp)
   4300b:	c7 45 98 27 00 00 00 	movl   $0x27,-0x68(%rbp)
      perm_(initial_perm), va_(0) {
   43012:	c7 45 9c ff 0f 00 00 	movl   $0xfff,-0x64(%rbp)
   43019:	48 c7 45 a0 00 00 00 	movq   $0x0,-0x60(%rbp)
   43020:	00 
    real_find(va, false);
   43021:	ba 00 00 00 00       	mov    $0x0,%edx
   43026:	4c 89 fe             	mov    %r15,%rsi
   43029:	48 8d 7d 88          	lea    -0x78(%rbp),%rdi
   4302d:	e8 f4 f2 ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    return (range_perm(sz) & desired_perm) == desired_perm;
   43032:	be 08 00 00 00       	mov    $0x8,%esi
   43037:	48 8d 7d 88          	lea    -0x78(%rbp),%rdi
   4303b:	e8 d0 f5 ff ff       	call   42610 <vmiter::range_perm(unsigned long) const>
    if (!(pt_
   43040:	a8 01                	test   $0x1,%al
   43042:	0f 84 5c ff ff ff    	je     42fa4 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x6d>
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   43048:	4c 89 6d 88          	mov    %r13,-0x78(%rbp)
   4304c:	4c 89 6d 90          	mov    %r13,-0x70(%rbp)
   43050:	c7 45 98 27 00 00 00 	movl   $0x27,-0x68(%rbp)
      perm_(initial_perm), va_(0) {
   43057:	c7 45 9c ff 0f 00 00 	movl   $0xfff,-0x64(%rbp)
   4305e:	48 c7 45 a0 00 00 00 	movq   $0x0,-0x60(%rbp)
   43065:	00 
    real_find(va, false);
   43066:	ba 00 00 00 00       	mov    $0x0,%edx
   4306b:	4c 89 fe             	mov    %r15,%rsi
   4306e:	48 8d 7d 88          	lea    -0x78(%rbp),%rdi
   43072:	e8 af f2 ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    if (*pep_ & PTE_P) {
   43077:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   4307b:	48 8b 00             	mov    (%rax),%rax
   4307e:	a8 01                	test   $0x1,%al
   43080:	0f 84 ab 00 00 00    	je     43131 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x1fa>
        if (lbits_ > PAGEOFFBITS) {
   43086:	8b 4d 98             	mov    -0x68(%rbp),%ecx
            pa &= ~0x1000UL;
   43089:	48 ba 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rdx
   43090:	ff 0f 00 
   43093:	48 21 c2             	and    %rax,%rdx
        if (lbits_ > PAGEOFFBITS) {
   43096:	83 f9 0c             	cmp    $0xc,%ecx
   43099:	7f 0d                	jg     430a8 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x171>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   4309b:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   430a2:	ff 0f 00 
   430a5:	48 21 c2             	and    %rax,%rdx
    return ~(~uintptr_t(0) << lbits);
   430a8:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   430af:	48 d3 e0             	shl    %cl,%rax
   430b2:	48 f7 d0             	not    %rax
        return pa + (va_ & lbits_mask(lbits_));
   430b5:	48 23 45 a0          	and    -0x60(%rbp),%rax
   430b9:	48 01 d0             	add    %rdx,%rax
        return *vmiter(pt_, va).kptr<const uintptr_t*>();
   430bc:	4c 8b 38             	mov    (%rax),%r15
    if ((intptr_t) (retaddr - regs.reg_rip) > 0x10000
   430bf:	4c 89 f8             	mov    %r15,%rax
   430c2:	48 2b 83 98 00 00 00 	sub    0x98(%rbx),%rax
   430c9:	48 3d 00 00 01 00    	cmp    $0x10000,%rax
   430cf:	0f 8f cf fe ff ff    	jg     42fa4 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x6d>
        || (retaddr >= stack_top_ - PAGESIZE && retaddr <= stack_top_)) {
   430d5:	49 8d 84 24 00 f0 ff 	lea    -0x1000(%r12),%rax
   430dc:	ff 
   430dd:	49 39 c7             	cmp    %rax,%r15
   430e0:	72 09                	jb     430eb <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x1b4>
   430e2:	4d 39 fc             	cmp    %r15,%r12
   430e5:	0f 83 b9 fe ff ff    	jae    42fa4 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x6d>
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   430eb:	4c 89 6d 88          	mov    %r13,-0x78(%rbp)
   430ef:	4c 89 6d 90          	mov    %r13,-0x70(%rbp)
   430f3:	c7 45 98 27 00 00 00 	movl   $0x27,-0x68(%rbp)
      perm_(initial_perm), va_(0) {
   430fa:	c7 45 9c ff 0f 00 00 	movl   $0xfff,-0x64(%rbp)
   43101:	48 c7 45 a0 00 00 00 	movq   $0x0,-0x60(%rbp)
   43108:	00 
    vmiter it(pt_, retaddr - 5);
   43109:	49 8d 77 fb          	lea    -0x5(%r15),%rsi
    real_find(va, false);
   4310d:	ba 00 00 00 00       	mov    $0x0,%edx
   43112:	48 8d 7d 88          	lea    -0x78(%rbp),%rdi
   43116:	e8 0b f2 ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    for (n = 0; n < 5 && it.present(); ++it, ++n) {
   4311b:	48 8d 45 83          	lea    -0x7d(%rbp),%rax
   4311f:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
   43126:	49 89 c5             	mov    %rax,%r13
   43129:	41 bc 00 00 00 00    	mov    $0x0,%r12d
   4312f:	eb 3b                	jmp    4316c <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x235>
        return nullptr;
   43131:	b8 00 00 00 00       	mov    $0x0,%eax
   43136:	eb 84                	jmp    430bc <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x185>
   43138:	b8 00 00 00 00       	mov    $0x0,%eax
        ibuf[n] = *it.kptr<unsigned char*>();
   4313d:	0f b6 00             	movzbl (%rax),%eax
   43140:	41 88 45 00          	mov    %al,0x0(%r13)
    return find(va_ + 1);
   43144:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   43148:	48 8d 70 01          	lea    0x1(%rax),%rsi
        real_find(va, false);
   4314c:	ba 00 00 00 00       	mov    $0x0,%edx
   43151:	48 8d 7d 88          	lea    -0x78(%rbp),%rdi
   43155:	e8 cc f1 ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    for (n = 0; n < 5 && it.present(); ++it, ++n) {
   4315a:	41 83 c4 01          	add    $0x1,%r12d
   4315e:	49 83 c5 01          	add    $0x1,%r13
   43162:	41 83 fc 05          	cmp    $0x5,%r12d
   43166:	0f 84 9f 03 00 00    	je     4350b <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x5d4>
    uint64_t ph = *pep_ & perm_;
   4316c:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   43170:	48 8b 00             	mov    (%rax),%rax
   43173:	48 63 55 9c          	movslq -0x64(%rbp),%rdx
   43177:	48 21 c2             	and    %rax,%rdx
   4317a:	f6 c2 01             	test   $0x1,%dl
   4317d:	0f 84 21 fe ff ff    	je     42fa4 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x6d>
    if (*pep_ & PTE_P) {
   43183:	a8 01                	test   $0x1,%al
   43185:	74 b1                	je     43138 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x201>
        if (lbits_ > PAGEOFFBITS) {
   43187:	8b 4d 98             	mov    -0x68(%rbp),%ecx
        uintptr_t pa = *pep_ & PTE_PAMASK;
   4318a:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   43191:	ff 0f 00 
   43194:	48 21 c2             	and    %rax,%rdx
   43197:	48 be 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rsi
   4319e:	ff 0f 00 
   431a1:	48 21 f0             	and    %rsi,%rax
   431a4:	83 f9 0c             	cmp    $0xc,%ecx
   431a7:	48 0f 4f d0          	cmovg  %rax,%rdx
    return ~(~uintptr_t(0) << lbits);
   431ab:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   431b2:	48 d3 e0             	shl    %cl,%rax
   431b5:	48 f7 d0             	not    %rax
        return pa + (va_ & lbits_mask(lbits_));
   431b8:	48 23 45 a0          	and    -0x60(%rbp),%rax
   431bc:	48 01 d0             	add    %rdx,%rax
        return reinterpret_cast<T>(pa());
   431bf:	e9 79 ff ff ff       	jmp    4313d <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x206>
        real_find(va, false);
   431c4:	ba 00 00 00 00       	mov    $0x0,%edx
   431c9:	48 8d 7d 88          	lea    -0x78(%rbp),%rdi
   431cd:	e8 54 f1 ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
   431d2:	e9 8c 03 00 00       	jmp    43563 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x62c>
        return nullptr;
   431d7:	b8 00 00 00 00       	mov    $0x0,%eax
        ibuf[n] = *it.kptr<unsigned char*>();
   431dc:	0f b6 00             	movzbl (%rax),%eax
   431df:	48 8b 8d 70 ff ff ff 	mov    -0x90(%rbp),%rcx
   431e6:	88 01                	mov    %al,(%rcx)
    return find(va_ + 1);
   431e8:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
   431ec:	48 8d 70 01          	lea    0x1(%rax),%rsi
        real_find(va, false);
   431f0:	ba 00 00 00 00       	mov    $0x0,%edx
   431f5:	48 8d 7d 88          	lea    -0x78(%rbp),%rdi
   431f9:	e8 28 f1 ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    for (n = 0; n < 5 && it.present(); ++it, ++n) {
   431fe:	41 83 c4 01          	add    $0x1,%r12d
   43202:	48 83 85 70 ff ff ff 	addq   $0x1,-0x90(%rbp)
   43209:	01 
   4320a:	41 83 fc 05          	cmp    $0x5,%r12d
   4320e:	0f 84 c9 02 00 00    	je     434dd <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x5a6>
    uint64_t ph = *pep_ & perm_;
   43214:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   43218:	48 8b 00             	mov    (%rax),%rax
   4321b:	48 63 55 9c          	movslq -0x64(%rbp),%rdx
   4321f:	48 21 c2             	and    %rax,%rdx
   43222:	f6 c2 01             	test   $0x1,%dl
   43225:	0f 84 79 fd ff ff    	je     42fa4 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x6d>
    if (*pep_ & PTE_P) {
   4322b:	a8 01                	test   $0x1,%al
   4322d:	74 a8                	je     431d7 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x2a0>
        if (lbits_ > PAGEOFFBITS) {
   4322f:	8b 4d 98             	mov    -0x68(%rbp),%ecx
        uintptr_t pa = *pep_ & PTE_PAMASK;
   43232:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   43239:	ff 0f 00 
   4323c:	48 21 c2             	and    %rax,%rdx
   4323f:	4c 21 e8             	and    %r13,%rax
   43242:	83 f9 0c             	cmp    $0xc,%ecx
   43245:	48 0f 4f d0          	cmovg  %rax,%rdx
    return ~(~uintptr_t(0) << lbits);
   43249:	4c 89 f8             	mov    %r15,%rax
   4324c:	48 d3 e0             	shl    %cl,%rax
   4324f:	48 f7 d0             	not    %rax
        return pa + (va_ & lbits_mask(lbits_));
   43252:	48 23 45 a0          	and    -0x60(%rbp),%rax
   43256:	48 01 d0             	add    %rdx,%rax
        return reinterpret_cast<T>(pa());
   43259:	eb 81                	jmp    431dc <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x2a5>
        pr.printf("  warning: possible stack overflow (rsp %p, rbp %p)\n",
   4325b:	4c 89 ea             	mov    %r13,%rdx
   4325e:	be d8 65 04 00       	mov    $0x465d8,%esi
   43263:	4c 89 f7             	mov    %r14,%rdi
   43266:	b8 00 00 00 00       	mov    $0x0,%eax
   4326b:	e8 6c 29 00 00       	call   45bdc <printer::printf(char const*, ...)>
   43270:	e9 5b fd ff ff       	jmp    42fd0 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x99>
        if (lookup_symbol(regs.reg_rip, &name, nullptr)) {
   43275:	ba 00 00 00 00       	mov    $0x0,%edx
   4327a:	48 8d 75 88          	lea    -0x78(%rbp),%rsi
   4327e:	e8 a9 fa ff ff       	call   42d2c <lookup_symbol(unsigned long, char const**, unsigned long*)>
   43283:	84 c0                	test   %al,%al
   43285:	74 22                	je     432a9 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x372>
            pr.printf("  #0  %p  <%s>\n", regs.reg_rip, name);
   43287:	48 8b 93 98 00 00 00 	mov    0x98(%rbx),%rdx
   4328e:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
   43292:	be 56 60 04 00       	mov    $0x46056,%esi
   43297:	4c 89 f7             	mov    %r14,%rdi
   4329a:	b8 00 00 00 00       	mov    $0x0,%eax
   4329f:	e8 38 29 00 00       	call   45bdc <printer::printf(char const*, ...)>
   432a4:	e9 40 fd ff ff       	jmp    42fe9 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0xb2>
            pr.printf("  #0  %p\n", regs.reg_rip);
   432a9:	48 8b 93 98 00 00 00 	mov    0x98(%rbx),%rdx
   432b0:	be 66 60 04 00       	mov    $0x46066,%esi
   432b5:	4c 89 f7             	mov    %r14,%rdi
   432b8:	b8 00 00 00 00       	mov    $0x0,%eax
   432bd:	e8 1a 29 00 00       	call   45bdc <printer::printf(char const*, ...)>
   432c2:	e9 22 fd ff ff       	jmp    42fe9 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0xb2>
        return nullptr;
   432c7:	b8 00 00 00 00       	mov    $0x0,%eax
        return *vmiter(pt_, va).kptr<const uintptr_t*>();
   432cc:	4c 8b 28             	mov    (%rax),%r13
        if (lookup_symbol(ret_rip - 2, &name, nullptr)) {
   432cf:	49 8d 7d fe          	lea    -0x2(%r13),%rdi
   432d3:	ba 00 00 00 00       	mov    $0x0,%edx
   432d8:	48 8d 75 88          	lea    -0x78(%rbp),%rsi
   432dc:	e8 4b fa ff ff       	call   42d2c <lookup_symbol(unsigned long, char const**, unsigned long*)>
   432e1:	84 c0                	test   %al,%al
   432e3:	0f 84 4c 01 00 00    	je     43435 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x4fe>
            pr.printf("  #%d  %p  <%s>\n", frame, ret_rip, name);
   432e9:	4c 8b 45 88          	mov    -0x78(%rbp),%r8
   432ed:	4c 89 e9             	mov    %r13,%rcx
   432f0:	89 da                	mov    %ebx,%edx
   432f2:	be 70 60 04 00       	mov    $0x46070,%esi
   432f7:	4c 89 f7             	mov    %r14,%rdi
   432fa:	b8 00 00 00 00       	mov    $0x0,%eax
   432ff:	e8 d8 28 00 00       	call   45bdc <printer::printf(char const*, ...)>
        if (leaf_) {
   43304:	45 84 e4             	test   %r12b,%r12b
   43307:	0f 84 44 01 00 00    	je     43451 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x51a>
            leaf_ = false;
   4330d:	c6 45 c0 00          	movb   $0x0,-0x40(%rbp)
        check();
   43311:	48 8d 7d a8          	lea    -0x58(%rbp),%rdi
   43315:	e8 2e f6 ff ff       	call   42948 <(anonymous namespace)::backtracer::check()>
    for (int frame = 1; bt.ok(); bt.step(), ++frame) {
   4331a:	83 c3 01             	add    $0x1,%ebx
        return rsp_ != 0;
   4331d:	4c 8b 6d b0          	mov    -0x50(%rbp),%r13
    for (int frame = 1; bt.ok(); bt.step(), ++frame) {
   43321:	4d 85 ed             	test   %r13,%r13
   43324:	0f 84 55 02 00 00    	je     4357f <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x648>
        if (leaf_) {
   4332a:	44 0f b6 65 c0       	movzbl -0x40(%rbp),%r12d
   4332f:	45 84 e4             	test   %r12b,%r12b
   43332:	74 7b                	je     433af <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x478>
        return *vmiter(pt_, va).kptr<const uintptr_t*>();
   43334:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   43338:	48 89 45 88          	mov    %rax,-0x78(%rbp)
   4333c:	48 89 45 90          	mov    %rax,-0x70(%rbp)
   43340:	c7 45 98 27 00 00 00 	movl   $0x27,-0x68(%rbp)
      perm_(initial_perm), va_(0) {
   43347:	c7 45 9c ff 0f 00 00 	movl   $0xfff,-0x64(%rbp)
   4334e:	48 c7 45 a0 00 00 00 	movq   $0x0,-0x60(%rbp)
   43355:	00 
    real_find(va, false);
   43356:	ba 00 00 00 00       	mov    $0x0,%edx
   4335b:	4c 89 ee             	mov    %r13,%rsi
   4335e:	48 8d 7d 88          	lea    -0x78(%rbp),%rdi
   43362:	e8 bf ef ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    if (*pep_ & PTE_P) {
   43367:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   4336b:	48 8b 00             	mov    (%rax),%rax
   4336e:	a8 01                	test   $0x1,%al
   43370:	0f 84 51 ff ff ff    	je     432c7 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x390>
        if (lbits_ > PAGEOFFBITS) {
   43376:	8b 4d 98             	mov    -0x68(%rbp),%ecx
        uintptr_t pa = *pep_ & PTE_PAMASK;
   43379:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   43380:	ff 0f 00 
   43383:	48 21 c2             	and    %rax,%rdx
   43386:	48 be 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rsi
   4338d:	ff 0f 00 
   43390:	48 21 f0             	and    %rsi,%rax
   43393:	83 f9 0c             	cmp    $0xc,%ecx
   43396:	48 0f 4f d0          	cmovg  %rax,%rdx
    return ~(~uintptr_t(0) << lbits);
   4339a:	4c 89 f8             	mov    %r15,%rax
   4339d:	48 d3 e0             	shl    %cl,%rax
   433a0:	48 f7 d0             	not    %rax
        return pa + (va_ & lbits_mask(lbits_));
   433a3:	48 23 45 a0          	and    -0x60(%rbp),%rax
   433a7:	48 01 d0             	add    %rdx,%rax
        return reinterpret_cast<T>(pa());
   433aa:	e9 1d ff ff ff       	jmp    432cc <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x395>
            return deref(rbp_ + 8);
   433af:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   433b3:	48 8d 70 08          	lea    0x8(%rax),%rsi
        return *vmiter(pt_, va).kptr<const uintptr_t*>();
   433b7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   433bb:	48 89 45 88          	mov    %rax,-0x78(%rbp)
   433bf:	48 89 45 90          	mov    %rax,-0x70(%rbp)
   433c3:	c7 45 98 27 00 00 00 	movl   $0x27,-0x68(%rbp)
      perm_(initial_perm), va_(0) {
   433ca:	c7 45 9c ff 0f 00 00 	movl   $0xfff,-0x64(%rbp)
   433d1:	48 c7 45 a0 00 00 00 	movq   $0x0,-0x60(%rbp)
   433d8:	00 
    real_find(va, false);
   433d9:	ba 00 00 00 00       	mov    $0x0,%edx
   433de:	48 8d 7d 88          	lea    -0x78(%rbp),%rdi
   433e2:	e8 3f ef ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    if (*pep_ & PTE_P) {
   433e7:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   433eb:	48 8b 00             	mov    (%rax),%rax
   433ee:	a8 01                	test   $0x1,%al
   433f0:	74 3c                	je     4342e <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x4f7>
        if (lbits_ > PAGEOFFBITS) {
   433f2:	8b 4d 98             	mov    -0x68(%rbp),%ecx
        uintptr_t pa = *pep_ & PTE_PAMASK;
   433f5:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   433fc:	ff 0f 00 
   433ff:	48 21 c2             	and    %rax,%rdx
   43402:	48 be 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rsi
   43409:	ff 0f 00 
   4340c:	48 21 f0             	and    %rsi,%rax
   4340f:	83 f9 0c             	cmp    $0xc,%ecx
   43412:	48 0f 4f d0          	cmovg  %rax,%rdx
    return ~(~uintptr_t(0) << lbits);
   43416:	4c 89 f8             	mov    %r15,%rax
   43419:	48 d3 e0             	shl    %cl,%rax
   4341c:	48 f7 d0             	not    %rax
        return pa + (va_ & lbits_mask(lbits_));
   4341f:	48 23 45 a0          	and    -0x60(%rbp),%rax
   43423:	48 01 d0             	add    %rdx,%rax
   43426:	4c 8b 28             	mov    (%rax),%r13
            return deref(rbp_ + 8);
   43429:	e9 a1 fe ff ff       	jmp    432cf <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x398>
        return nullptr;
   4342e:	b8 00 00 00 00       	mov    $0x0,%eax
   43433:	eb f1                	jmp    43426 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x4ef>
            pr.printf("  #%d  %p\n", frame, ret_rip);
   43435:	4c 89 e9             	mov    %r13,%rcx
   43438:	89 da                	mov    %ebx,%edx
   4343a:	be 81 60 04 00       	mov    $0x46081,%esi
   4343f:	4c 89 f7             	mov    %r14,%rdi
   43442:	b8 00 00 00 00       	mov    $0x0,%eax
   43447:	e8 90 27 00 00       	call   45bdc <printer::printf(char const*, ...)>
   4344c:	e9 b3 fe ff ff       	jmp    43304 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x3cd>
            rsp_ = rbp_ + 16;
   43451:	48 8b 75 a8          	mov    -0x58(%rbp),%rsi
   43455:	48 8d 46 10          	lea    0x10(%rsi),%rax
   43459:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
        return *vmiter(pt_, va).kptr<const uintptr_t*>();
   4345d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   43461:	48 89 45 88          	mov    %rax,-0x78(%rbp)
   43465:	48 89 45 90          	mov    %rax,-0x70(%rbp)
   43469:	c7 45 98 27 00 00 00 	movl   $0x27,-0x68(%rbp)
      perm_(initial_perm), va_(0) {
   43470:	c7 45 9c ff 0f 00 00 	movl   $0xfff,-0x64(%rbp)
   43477:	48 c7 45 a0 00 00 00 	movq   $0x0,-0x60(%rbp)
   4347e:	00 
    real_find(va, false);
   4347f:	ba 00 00 00 00       	mov    $0x0,%edx
   43484:	48 8d 7d 88          	lea    -0x78(%rbp),%rdi
   43488:	e8 99 ee ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    if (*pep_ & PTE_P) {
   4348d:	48 8b 45 90          	mov    -0x70(%rbp),%rax
   43491:	48 8b 00             	mov    (%rax),%rax
   43494:	a8 01                	test   $0x1,%al
   43496:	74 3e                	je     434d6 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x59f>
        if (lbits_ > PAGEOFFBITS) {
   43498:	8b 4d 98             	mov    -0x68(%rbp),%ecx
            pa &= ~0x1000UL;
   4349b:	48 ba 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rdx
   434a2:	ff 0f 00 
   434a5:	48 21 c2             	and    %rax,%rdx
        if (lbits_ > PAGEOFFBITS) {
   434a8:	83 f9 0c             	cmp    $0xc,%ecx
   434ab:	7f 0d                	jg     434ba <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x583>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   434ad:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   434b4:	ff 0f 00 
   434b7:	48 21 c2             	and    %rax,%rdx
    return ~(~uintptr_t(0) << lbits);
   434ba:	4c 89 f8             	mov    %r15,%rax
   434bd:	48 d3 e0             	shl    %cl,%rax
   434c0:	48 f7 d0             	not    %rax
        return pa + (va_ & lbits_mask(lbits_));
   434c3:	48 23 45 a0          	and    -0x60(%rbp),%rax
   434c7:	48 01 d0             	add    %rdx,%rax
   434ca:	48 8b 00             	mov    (%rax),%rax
            rbp_ = deref(rbp_);
   434cd:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
   434d1:	e9 3b fe ff ff       	jmp    43311 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x3da>
        return nullptr;
   434d6:	b8 00 00 00 00       	mov    $0x0,%eax
   434db:	eb ed                	jmp    434ca <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x593>
        || ibuf[0] == 0x55 /* `push %rbp` */
   434dd:	80 7d 83 55          	cmpb   $0x55,-0x7d(%rbp)
   434e1:	0f 84 bd fa ff ff    	je     42fa4 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x6d>
        || memcmp(ibuf, "\xf3\x0f\x1e\xf1\x55", 5) == 0 /* `endbr64; push %rbp` */) {
   434e7:	ba 05 00 00 00       	mov    $0x5,%edx
   434ec:	be 50 60 04 00       	mov    $0x46050,%esi
   434f1:	48 8d 7d 83          	lea    -0x7d(%rbp),%rdi
   434f5:	e8 d7 1c 00 00       	call   451d1 <memcmp>
   434fa:	85 c0                	test   %eax,%eax
   434fc:	0f 84 a2 fa ff ff    	je     42fa4 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x6d>
    leaf_ = true;
   43502:	c6 45 c0 01          	movb   $0x1,-0x40(%rbp)
        if (!leaf_) {
   43506:	e9 a2 fa ff ff       	jmp    42fad <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x76>
        || ibuf[0] != 0xe8 /* `call` */) {
   4350b:	80 7d 83 e8          	cmpb   $0xe8,-0x7d(%rbp)
   4350f:	0f 85 8f fa ff ff    	jne    42fa4 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x6d>
    unsigned offset = ibuf[1] + (ibuf[2] << 8) + (ibuf[3] << 16) + (ibuf[4] << 24);
   43515:	0f b6 75 85          	movzbl -0x7b(%rbp),%esi
   43519:	c1 e6 08             	shl    $0x8,%esi
   4351c:	0f b6 45 84          	movzbl -0x7c(%rbp),%eax
   43520:	01 c6                	add    %eax,%esi
   43522:	0f b6 45 86          	movzbl -0x7a(%rbp),%eax
   43526:	c1 e0 10             	shl    $0x10,%eax
   43529:	01 c6                	add    %eax,%esi
   4352b:	0f b6 45 87          	movzbl -0x79(%rbp),%eax
   4352f:	c1 e0 18             	shl    $0x18,%eax
   43532:	01 c6                	add    %eax,%esi
    uintptr_t fnaddr = retaddr + (int) offset;
   43534:	48 63 f6             	movslq %esi,%rsi
   43537:	4c 01 fe             	add    %r15,%rsi
    if (fnaddr > regs.reg_rip
   4353a:	48 8b 83 98 00 00 00 	mov    0x98(%rbx),%rax
   43541:	48 39 f0             	cmp    %rsi,%rax
   43544:	0f 82 5a fa ff ff    	jb     42fa4 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x6d>
        || regs.reg_rip - fnaddr > 0x1000) {
   4354a:	48 29 f0             	sub    %rsi,%rax
   4354d:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
   43553:	0f 87 4b fa ff ff    	ja     42fa4 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x6d>
    if (va != va_) {
   43559:	48 3b 75 a0          	cmp    -0x60(%rbp),%rsi
   4355d:	0f 85 61 fc ff ff    	jne    431c4 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x28d>
        return nullptr;
   43563:	41 bc 00 00 00 00    	mov    $0x0,%r12d
            pa &= ~0x1000UL;
   43569:	49 bd 00 e0 ff ff ff 	movabs $0xfffffffffe000,%r13
   43570:	ff 0f 00 
    return ~(~uintptr_t(0) << lbits);
   43573:	49 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%r15
   4357a:	e9 95 fc ff ff       	jmp    43214 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)+0x2dd>
}
   4357f:	48 83 c4 68          	add    $0x68,%rsp
   43583:	5b                   	pop    %rbx
   43584:	41 5c                	pop    %r12
   43586:	41 5d                	pop    %r13
   43588:	41 5e                	pop    %r14
   4358a:	41 5f                	pop    %r15
   4358c:	5d                   	pop    %rbp
   4358d:	c3                   	ret

000000000004358e <vpanic(regstate const&, x86_64_pagetable*, char const*, __va_list_tag*)>:
                   const char* format, va_list val) {
   4358e:	55                   	push   %rbp
   4358f:	48 89 e5             	mov    %rsp,%rbp
   43592:	41 56                	push   %r14
   43594:	41 55                	push   %r13
   43596:	41 54                	push   %r12
   43598:	53                   	push   %rbx
   43599:	48 83 ec 20          	sub    $0x20,%rsp
   4359d:	48 89 fb             	mov    %rdi,%rbx
   435a0:	49 89 f4             	mov    %rsi,%r12
   435a3:	49 89 d5             	mov    %rdx,%r13
   435a6:	49 89 ce             	mov    %rcx,%r14
__always_inline void wrcr4(uint64_t x) {
    asm volatile("movq %0, %%cr4" : : "r" (x));
}

__always_inline void cli() {
    asm volatile("cli");
   435a9:	fa                   	cli
	__atomic_store_n(&_M_i, __i, int(__m));
   435aa:	b8 01 00 00 00       	mov    $0x1,%eax
   435af:	86 05 53 1a 02 00    	xchg   %al,0x21a53(%rip)        # 65008 <panicking>
        : console_printer(cpos, scroll, color) {
   435b5:	b9 00 c0 00 00       	mov    $0xc000,%ecx
   435ba:	ba 01 00 00 00       	mov    $0x1,%edx
   435bf:	be d0 07 00 00       	mov    $0x7d0,%esi
   435c4:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   435c8:	e8 79 26 00 00       	call   45c46 <console_printer::console_printer(int, bool, int)>
   435cd:	48 c7 45 c0 08 6a 04 	movq   $0x46a08,-0x40(%rbp)
   435d4:	00 
        format = "PANIC";
   435d5:	4d 85 ed             	test   %r13,%r13
   435d8:	b8 91 61 04 00       	mov    $0x46191,%eax
   435dd:	4c 0f 44 e8          	cmove  %rax,%r13
    if (strstr(format, "PANIC") == nullptr) {
   435e1:	48 89 c6             	mov    %rax,%rsi
   435e4:	4c 89 ef             	mov    %r13,%rdi
   435e7:	e8 e9 1c 00 00       	call   452d5 <strstr>
   435ec:	48 85 c0             	test   %rax,%rax
   435ef:	74 72                	je     43663 <vpanic(regstate const&, x86_64_pagetable*, char const*, __va_list_tag*)+0xd5>
    pr.vprintf(format, val);
   435f1:	4c 89 f2             	mov    %r14,%rdx
   435f4:	4c 89 ee             	mov    %r13,%rsi
   435f7:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   435fb:	e8 28 1d 00 00       	call   45328 <printer::vprintf(char const*, __va_list_tag*)>
    if (CCOL(pr.cell_ - console)) {
   43600:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
   43604:	48 81 e9 00 80 0b 00 	sub    $0xb8000,%rcx
   4360b:	48 89 ce             	mov    %rcx,%rsi
   4360e:	48 d1 fe             	sar    $1,%rsi
   43611:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
   43618:	66 66 66 
   4361b:	48 89 f0             	mov    %rsi,%rax
   4361e:	48 f7 ea             	imul   %rdx
   43621:	48 c1 fa 05          	sar    $0x5,%rdx
   43625:	48 c1 f9 3f          	sar    $0x3f,%rcx
   43629:	48 29 ca             	sub    %rcx,%rdx
   4362c:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
   43630:	48 c1 e0 04          	shl    $0x4,%rax
   43634:	48 39 c6             	cmp    %rax,%rsi
   43637:	75 3d                	jne    43676 <vpanic(regstate const&, x86_64_pagetable*, char const*, __va_list_tag*)+0xe8>
    print_backtrace(pr, regs, pt);
   43639:	b9 00 00 00 00       	mov    $0x0,%ecx
   4363e:	4c 89 e2             	mov    %r12,%rdx
   43641:	48 89 de             	mov    %rbx,%rsi
   43644:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   43648:	e8 ea f8 ff ff       	call   42f37 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)>
    pr.move_cursor();
   4364d:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   43651:	e8 66 27 00 00       	call   45dbc <console_printer::move_cursor()>
}
   43656:	48 83 c4 20          	add    $0x20,%rsp
   4365a:	5b                   	pop    %rbx
   4365b:	41 5c                	pop    %r12
   4365d:	41 5d                	pop    %r13
   4365f:	41 5e                	pop    %r14
   43661:	5d                   	pop    %rbp
   43662:	c3                   	ret
        pr.printf("PANIC: ");
   43663:	be 8c 60 04 00       	mov    $0x4608c,%esi
   43668:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   4366c:	e8 6b 25 00 00       	call   45bdc <printer::printf(char const*, ...)>
   43671:	e9 7b ff ff ff       	jmp    435f1 <vpanic(regstate const&, x86_64_pagetable*, char const*, __va_list_tag*)+0x63>
        pr.printf("\n");
   43676:	be 64 61 04 00       	mov    $0x46164,%esi
   4367b:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   4367f:	b8 00 00 00 00       	mov    $0x0,%eax
   43684:	e8 53 25 00 00       	call   45bdc <printer::printf(char const*, ...)>
   43689:	eb ae                	jmp    43639 <vpanic(regstate const&, x86_64_pagetable*, char const*, __va_list_tag*)+0xab>

000000000004368b <log_print_backtrace(proc const*)>:
void log_print_backtrace(const proc* p) {
   4368b:	f3 0f 1e fa          	endbr64
   4368f:	55                   	push   %rbp
   43690:	48 89 e5             	mov    %rsp,%rbp
   43693:	48 83 ec 10          	sub    $0x10,%rsp
    log_printer pr;
   43697:	48 c7 45 f0 f0 69 04 	movq   $0x469f0,-0x10(%rbp)
   4369e:	00 
   4369f:	c7 45 f8 00 07 00 00 	movl   $0x700,-0x8(%rbp)
    print_backtrace(pr, p->regs, p->pagetable);
   436a6:	48 8b 17             	mov    (%rdi),%rdx
   436a9:	48 8d 77 10          	lea    0x10(%rdi),%rsi
   436ad:	b9 00 00 00 00       	mov    $0x0,%ecx
   436b2:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
   436b6:	e8 7c f8 ff ff       	call   42f37 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)>
}
   436bb:	c9                   	leave
   436bc:	c3                   	ret

00000000000436bd <assert_fail(char const*, int, char const*, char const*)>:
                 const char* description) {
   436bd:	f3 0f 1e fa          	endbr64
   436c1:	55                   	push   %rbp
   436c2:	48 89 e5             	mov    %rsp,%rbp
   436c5:	41 56                	push   %r14
   436c7:	41 55                	push   %r13
   436c9:	41 54                	push   %r12
   436cb:	53                   	push   %rbx
   436cc:	48 83 ec 20          	sub    $0x20,%rsp
   436d0:	48 89 fb             	mov    %rdi,%rbx
   436d3:	41 89 f4             	mov    %esi,%r12d
   436d6:	49 89 d6             	mov    %rdx,%r14
   436d9:	49 89 cd             	mov    %rcx,%r13
    cursorpos = CPOS(23, 0);
   436dc:	c7 05 16 59 07 00 30 	movl   $0x730,0x75916(%rip)        # b8ffc <cursorpos>
   436e3:	07 00 00 
        : console_printer(cpos, scroll, color) {
   436e6:	b9 00 c0 00 00       	mov    $0xc000,%ecx
   436eb:	ba 01 00 00 00       	mov    $0x1,%edx
   436f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
   436f5:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   436f9:	e8 48 25 00 00       	call   45c46 <console_printer::console_printer(int, bool, int)>
   436fe:	48 c7 45 c0 08 6a 04 	movq   $0x46a08,-0x40(%rbp)
   43705:	00 
    if (description) {
   43706:	4d 85 ed             	test   %r13,%r13
   43709:	74 19                	je     43724 <assert_fail(char const*, int, char const*, char const*)+0x67>
        pr.printf("%s:%d: %s\n", file, line, description);
   4370b:	4d 89 e8             	mov    %r13,%r8
   4370e:	44 89 e1             	mov    %r12d,%ecx
   43711:	48 89 da             	mov    %rbx,%rdx
   43714:	be 94 60 04 00       	mov    $0x46094,%esi
   43719:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   4371d:	b0 00                	mov    $0x0,%al
   4371f:	e8 b8 24 00 00       	call   45bdc <printer::printf(char const*, ...)>
    pr.printf("%s:%d: kernel assertion '%s' failed\n", file, line, msg);
   43724:	4d 89 f0             	mov    %r14,%r8
   43727:	44 89 e1             	mov    %r12d,%ecx
   4372a:	48 89 da             	mov    %rbx,%rdx
   4372d:	be 10 66 04 00       	mov    $0x46610,%esi
   43732:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   43736:	b0 00                	mov    $0x0,%al
   43738:	e8 9f 24 00 00       	call   45bdc <printer::printf(char const*, ...)>
    asm volatile("movq %%cr3, %0" : "=r" (x));
   4373d:	0f 20 da             	mov    %cr3,%rdx
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
   43740:	48 89 e0             	mov    %rsp,%rax
    backtrace_kernel_regs.reg_rsp = rdrsp();
   43743:	48 89 05 46 7a 02 00 	mov    %rax,0x27a46(%rip)        # 6b190 <backtrace_current_regs()::backtrace_kernel_regs+0xb0>
    asm volatile("movq %%rbp, %0" : "=r" (x));
   4374a:	48 89 e8             	mov    %rbp,%rax
    backtrace_kernel_regs.reg_rbp = rdrbp();
   4374d:	48 89 05 ac 79 02 00 	mov    %rax,0x279ac(%rip)        # 6b100 <backtrace_current_regs()::backtrace_kernel_regs+0x20>
    backtrace_kernel_regs.reg_rip = 0;
   43754:	48 c7 05 19 7a 02 00 	movq   $0x0,0x27a19(%rip)        # 6b178 <backtrace_current_regs()::backtrace_kernel_regs+0x98>
   4375b:	00 00 00 00 
    print_backtrace(pr, backtrace_current_regs(),
   4375f:	b9 01 00 00 00       	mov    $0x1,%ecx
   43764:	be e0 b0 06 00       	mov    $0x6b0e0,%esi
   43769:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   4376d:	e8 c5 f7 ff ff       	call   42f37 <print_backtrace(printer&, regstate const&, x86_64_pagetable*, bool)>
    pr.move_cursor();
   43772:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   43776:	e8 41 26 00 00       	call   45dbc <console_printer::move_cursor()>
        check_keyboard();
   4377b:	e8 1f 09 00 00       	call   4409f <check_keyboard()>
    while (true) {
   43780:	eb f9                	jmp    4377b <assert_fail(char const*, int, char const*, char const*)+0xbe>

0000000000043782 <init_hardware()>:
void init_hardware() {
   43782:	f3 0f 1e fa          	endbr64
   43786:	55                   	push   %rbp
   43787:	48 89 e5             	mov    %rsp,%rbp
   4378a:	53                   	push   %rbx
   4378b:	48 83 ec 38          	sub    $0x38,%rsp
    stash_kernel_data(false);
   4378f:	bf 00 00 00 00       	mov    $0x0,%edi
   43794:	e8 56 f1 ff ff       	call   428ef <stash_kernel_data(bool)>
    gdt_segments[0] = 0;
   43799:	48 c7 05 fc 78 02 00 	movq   $0x0,0x278fc(%rip)        # 6b0a0 <gdt_segments>
   437a0:	00 00 00 00 
    *segment = type
   437a4:	48 b8 00 00 00 00 00 	movabs $0x20980000000000,%rax
   437ab:	98 20 00 
   437ae:	48 89 05 f3 78 02 00 	mov    %rax,0x278f3(%rip)        # 6b0a8 <gdt_segments+0x8>
   437b5:	48 b8 00 00 00 00 00 	movabs $0x920000000000,%rax
   437bc:	92 00 00 
   437bf:	48 89 05 ea 78 02 00 	mov    %rax,0x278ea(%rip)        # 6b0b0 <gdt_segments+0x10>
    gdt.limit = sizeof(gdt_segments[0]) * 3 - 1;
   437c6:	66 c7 45 c6 17 00    	movw   $0x17,-0x3a(%rbp)
    gdt.base = (uint64_t) gdt_segments;
   437cc:	48 c7 45 c8 a0 b0 06 	movq   $0x6b0a0,-0x38(%rbp)
   437d3:	00 
    asm volatile("lgdt %0" : : "m" (gdt.limit));
   437d4:	0f 01 55 c6          	lgdt   -0x3a(%rbp)
    memset(kernel_pagetable, 0, sizeof(kernel_pagetable));
   437d8:	ba 00 50 00 00       	mov    $0x5000,%edx
   437dd:	be 00 00 00 00       	mov    $0x0,%esi
   437e2:	bf 00 60 06 00       	mov    $0x66000,%edi
   437e7:	e8 c6 19 00 00       	call   451b2 <memset>
        kptr2pa(&kernel_pagetable[1]) | PTE_P | PTE_W | PTE_U;
   437ec:	b8 00 70 06 00       	mov    $0x67000,%eax
   437f1:	48 83 c8 07          	or     $0x7,%rax
   437f5:	48 89 05 04 28 02 00 	mov    %rax,0x22804(%rip)        # 66000 <kernel_pagetable>
        kptr2pa(&kernel_pagetable[2]) | PTE_P | PTE_W | PTE_U;
   437fc:	b8 00 80 06 00       	mov    $0x68000,%eax
   43801:	48 83 c8 07          	or     $0x7,%rax
   43805:	48 89 05 f4 37 02 00 	mov    %rax,0x237f4(%rip)        # 67000 <kernel_pagetable+0x1000>
        kptr2pa(&kernel_pagetable[3]) | PTE_P | PTE_W | PTE_U;
   4380c:	b8 00 90 06 00       	mov    $0x69000,%eax
   43811:	48 83 c8 07          	or     $0x7,%rax
   43815:	48 89 05 e4 47 02 00 	mov    %rax,0x247e4(%rip)        # 68000 <kernel_pagetable+0x2000>
        kptr2pa(&kernel_pagetable[4]) | PTE_P | PTE_W | PTE_U;
   4381c:	b8 00 a0 06 00       	mov    $0x6a000,%eax
   43821:	48 83 c8 07          	or     $0x7,%rax
   43825:	48 89 05 dc 47 02 00 	mov    %rax,0x247dc(%rip)        # 68008 <kernel_pagetable+0x2008>
    kernel_pagetable[1].entry[1] =
   4382c:	48 c7 05 d1 37 02 00 	movq   $0x40000083,0x237d1(%rip)        # 67008 <kernel_pagetable+0x1008>
   43833:	83 00 00 40 
    kernel_pagetable[1].entry[2] =
   43837:	b8 83 00 00 80       	mov    $0x80000083,%eax
   4383c:	48 89 05 cd 37 02 00 	mov    %rax,0x237cd(%rip)        # 67010 <kernel_pagetable+0x1010>
    kernel_pagetable[1].entry[3] =
   43843:	48 8d 80 00 00 00 40 	lea    0x40000000(%rax),%rax
   4384a:	48 89 05 c7 37 02 00 	mov    %rax,0x237c7(%rip)        # 67018 <kernel_pagetable+0x1018>
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   43851:	48 c7 45 d0 00 60 06 	movq   $0x66000,-0x30(%rbp)
   43858:	00 
   43859:	48 c7 45 d8 00 60 06 	movq   $0x66000,-0x28(%rbp)
   43860:	00 
   43861:	c7 45 e0 27 00 00 00 	movl   $0x27,-0x20(%rbp)
      perm_(initial_perm), va_(0) {
   43868:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   4386f:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   43876:	00 
    real_find(va, false);
   43877:	ba 00 00 00 00       	mov    $0x0,%edx
   4387c:	be 00 00 00 00       	mov    $0x0,%esi
   43881:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   43885:	e8 9c ea ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    return va_;
   4388a:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
         it.va() < MEMSIZE_PHYSICAL;
   4388e:	48 81 fe ff ff 1f 00 	cmp    $0x1fffff,%rsi
   43895:	76 77                	jbe    4390e <init_hardware()+0x18c>
    asm volatile("movq %0, %%cr3" : : "r" (x) : "memory");
   43897:	b8 00 60 06 00       	mov    $0x66000,%eax
   4389c:	0f 22 d8             	mov    %rax,%cr3
    cursorpos = 3 * CONSOLE_COLUMNS;
   4389f:	c7 05 53 57 07 00 f0 	movl   $0xf0,0x75753(%rip)        # b8ffc <cursorpos>
   438a6:	00 00 00 
   438a9:	b9 10 26 06 00       	mov    $0x62610,%ecx
    for (int i = 0; i < 256; ++i) {
   438ae:	be 00 00 00 00       	mov    $0x0,%esi
        | ((addr & 0x00000000FFFF0000UL) << 32);
   438b3:	49 b8 00 00 00 00 00 	movabs $0xffff000000000000,%r8
   438ba:	00 ff ff 
   438bd:	49 b9 00 00 00 00 00 	movabs $0x600000000000,%r9
   438c4:	60 00 00 
   438c7:	48 bf 00 00 08 00 00 	movabs $0x8e0000080000,%rdi
   438ce:	8e 00 00 
   438d1:	e9 fe 00 00 00       	jmp    439d4 <init_hardware()+0x252>
    int r = try_map(pa, perm);
   438d6:	ba 07 00 00 00       	mov    $0x7,%edx
   438db:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   438df:	e8 74 eb ff ff       	call   42458 <vmiter::try_map(unsigned long, int)>
    assert(r == 0, "vmiter::map failed");
   438e4:	85 c0                	test   %eax,%eax
   438e6:	75 2d                	jne    43915 <init_hardware()+0x193>
    return find(va_ + delta);
   438e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
   438ec:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va, false);
   438f3:	ba 00 00 00 00       	mov    $0x0,%edx
   438f8:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   438fc:	e8 25 ea ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    return va_;
   43901:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
         it.va() < MEMSIZE_PHYSICAL;
   43905:	48 81 fe ff ff 1f 00 	cmp    $0x1fffff,%rsi
   4390c:	77 89                	ja     43897 <init_hardware()+0x115>
        if (it.va() != 0) {
   4390e:	48 85 f6             	test   %rsi,%rsi
   43911:	74 d5                	je     438e8 <init_hardware()+0x166>
   43913:	eb c1                	jmp    438d6 <init_hardware()+0x154>
    assert(r == 0, "vmiter::map failed");
   43915:	b9 08 5f 04 00       	mov    $0x45f08,%ecx
   4391a:	ba 1b 5f 04 00       	mov    $0x45f1b,%edx
   4391f:	be 10 01 00 00       	mov    $0x110,%esi
   43924:	bf 22 5f 04 00       	mov    $0x45f22,%edi
   43929:	e8 8f fd ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
    assert(cpuid(1).edx & (1 << 9));
   4392e:	b9 00 00 00 00       	mov    $0x0,%ecx
   43933:	ba 9f 60 04 00       	mov    $0x4609f,%edx
   43938:	be a4 00 00 00       	mov    $0xa4,%esi
   4393d:	bf b7 60 04 00       	mov    $0x460b7,%edi
   43942:	e8 76 fd ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
    assert(apic_base & IA32_APIC_BASE_ENABLED);
   43947:	b9 00 00 00 00       	mov    $0x0,%ecx
   4394c:	ba 38 66 04 00       	mov    $0x46638,%edx
   43951:	be a6 00 00 00       	mov    $0xa6,%esi
   43956:	bf b7 60 04 00       	mov    $0x460b7,%edi
   4395b:	e8 5d fd ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
    assert((apic_base & 0xFFFFFFFFF000) == lapicstate::lapic_pa);
   43960:	b9 00 00 00 00       	mov    $0x0,%ecx
   43965:	ba 60 66 04 00       	mov    $0x46660,%edx
   4396a:	be a7 00 00 00       	mov    $0xa7,%esi
   4396f:	bf b7 60 04 00       	mov    $0x460b7,%edi
   43974:	e8 44 fd ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
    assert((ioapic_ver & 0xFF) == 0x11 || (ioapic_ver & 0xFF) == 0x20);
   43979:	b9 00 00 00 00       	mov    $0x0,%ecx
   4397e:	ba 98 66 04 00       	mov    $0x46698,%edx
   43983:	be ac 00 00 00       	mov    $0xac,%esi
   43988:	bf b7 60 04 00       	mov    $0x460b7,%edi
   4398d:	e8 2b fd ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
    assert((ioapic_ver >> 16) >= 0x17);
   43992:	b9 00 00 00 00       	mov    $0x0,%ecx
   43997:	ba c5 60 04 00       	mov    $0x460c5,%edx
   4399c:	be ad 00 00 00       	mov    $0xad,%esi
   439a1:	bf b7 60 04 00       	mov    $0x460b7,%edi
   439a6:	e8 12 fd ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
        | ((addr & 0x00000000FFFF0000UL) << 32);
   439ab:	48 89 d0             	mov    %rdx,%rax
   439ae:	48 c1 e0 20          	shl    $0x20,%rax
   439b2:	4c 21 c0             	and    %r8,%rax
    gate->gd_low = (addr & 0x000000000000FFFFUL)
   439b5:	44 0f b7 d2          	movzwl %dx,%r10d
        | ((addr & 0x00000000FFFF0000UL) << 32);
   439b9:	4d 09 ca             	or     %r9,%r10
   439bc:	4c 09 d0             	or     %r10,%rax
   439bf:	48 09 f8             	or     %rdi,%rax
   439c2:	48 89 01             	mov    %rax,(%rcx)
    gate->gd_high = addr >> 32;
   439c5:	48 c1 ea 20          	shr    $0x20,%rdx
   439c9:	48 89 51 08          	mov    %rdx,0x8(%rcx)
    for (int i = 0; i < 256; ++i) {
   439cd:	83 c6 01             	add    $0x1,%esi
   439d0:	48 83 c1 10          	add    $0x10,%rcx
        uintptr_t addr = interrupt_descriptors[i].gd_low;
   439d4:	48 8b 11             	mov    (%rcx),%rdx
        set_gate(&interrupt_descriptors[i], addr,
   439d7:	83 fe 03             	cmp    $0x3,%esi
   439da:	74 cf                	je     439ab <init_hardware()+0x229>
        | ((addr & 0x00000000FFFF0000UL) << 32);
   439dc:	48 89 d0             	mov    %rdx,%rax
   439df:	48 c1 e0 20          	shl    $0x20,%rax
   439e3:	4c 21 c0             	and    %r8,%rax
    gate->gd_low = (addr & 0x000000000000FFFFUL)
   439e6:	44 0f b7 d2          	movzwl %dx,%r10d
        | ((addr & 0x00000000FFFF0000UL) << 32);
   439ea:	4c 09 d0             	or     %r10,%rax
   439ed:	48 09 f8             	or     %rdi,%rax
   439f0:	48 89 01             	mov    %rax,(%rcx)
    gate->gd_high = addr >> 32;
   439f3:	48 c1 ea 20          	shr    $0x20,%rdx
   439f7:	48 89 51 08          	mov    %rdx,0x8(%rcx)
    for (int i = 0; i < 256; ++i) {
   439fb:	83 c6 01             	add    $0x1,%esi
   439fe:	48 83 c1 10          	add    $0x10,%rcx
   43a02:	81 fe 00 01 00 00    	cmp    $0x100,%esi
   43a08:	75 ca                	jne    439d4 <init_hardware()+0x252>
    uint32_t eax, ebx, ecx, edx;
} x86_64_cpuid_t;

__always_inline x86_64_cpuid_t cpuid(uint32_t leaf) {
    x86_64_cpuid_t ret;
    asm volatile("cpuid"
   43a0a:	b8 01 00 00 00       	mov    $0x1,%eax
   43a0f:	0f a2                	cpuid
    assert(cpuid(1).edx & (1 << 9));
   43a11:	f6 c6 02             	test   $0x2,%dh
   43a14:	0f 84 14 ff ff ff    	je     4392e <init_hardware()+0x1ac>
    return ret;
}

__always_inline uint64_t rdmsr(uint32_t msr) {
    uint64_t low, high;
    asm volatile("rdmsr" : "=a" (low), "=d" (high) : "c" (msr));
   43a1a:	b9 1b 00 00 00       	mov    $0x1b,%ecx
   43a1f:	0f 32                	rdmsr
    return low | (high << 32);
   43a21:	48 c1 e2 20          	shl    $0x20,%rdx
   43a25:	48 09 c2             	or     %rax,%rdx
    assert(apic_base & IA32_APIC_BASE_ENABLED);
   43a28:	f6 c4 08             	test   $0x8,%ah
   43a2b:	0f 84 16 ff ff ff    	je     43947 <init_hardware()+0x1c5>
    assert((apic_base & 0xFFFFFFFFF000) == lapicstate::lapic_pa);
   43a31:	48 b8 00 f0 ff ff ff 	movabs $0xfffffffff000,%rax
   43a38:	ff 00 00 
   43a3b:	48 21 c2             	and    %rax,%rdx
   43a3e:	b8 00 00 e0 fe       	mov    $0xfee00000,%eax
   43a43:	48 39 c2             	cmp    %rax,%rdx
   43a46:	0f 85 14 ff ff ff    	jne    43960 <init_hardware()+0x1de>
inline void ioapicstate::disable_irq(int entry) {
    write(reg_redtbl + 2 * entry, redtbl_masked);
    write(reg_redtbl + 2 * entry + 1, 0);
}
inline uint32_t ioapicstate::read(int reg) const {
    reg_[0].v = reg;
   43a4c:	b8 00 00 c0 fe       	mov    $0xfec00000,%eax
   43a51:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
    return reg_[1].v;
   43a57:	8b 40 10             	mov    0x10(%rax),%eax
    assert((ioapic_ver & 0xFF) == 0x11 || (ioapic_ver & 0xFF) == 0x20);
   43a5a:	0f b6 d0             	movzbl %al,%edx
   43a5d:	3c 20                	cmp    $0x20,%al
   43a5f:	74 09                	je     43a6a <init_hardware()+0x2e8>
   43a61:	83 fa 11             	cmp    $0x11,%edx
   43a64:	0f 85 0f ff ff ff    	jne    43979 <init_hardware()+0x1f7>
    assert((ioapic_ver >> 16) >= 0x17);
   43a6a:	3d ff ff 16 00       	cmp    $0x16ffff,%eax
   43a6f:	0f 86 1d ff ff ff    	jbe    43992 <init_hardware()+0x210>
    asm volatile("outb %0, %w1" : : "a" (data), "d" (port));
   43a75:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   43a7a:	ba 21 00 00 00       	mov    $0x21,%edx
   43a7f:	ee                   	out    %al,(%dx)
   43a80:	ba a1 00 00 00       	mov    $0xa1,%edx
   43a85:	ee                   	out    %al,(%dx)
    for (auto fp = __init_array_start; fp != __init_array_end; ++fp) {
   43a86:	b8 c0 72 04 00       	mov    $0x472c0,%eax
   43a8b:	48 3d c0 72 04 00    	cmp    $0x472c0,%rax
   43a91:	74 12                	je     43aa5 <init_hardware()+0x323>
   43a93:	48 89 c3             	mov    %rax,%rbx
        (*fp)();
   43a96:	ff 13                	call   *(%rbx)
    for (auto fp = __init_array_start; fp != __init_array_end; ++fp) {
   43a98:	48 83 c3 08          	add    $0x8,%rbx
   43a9c:	48 81 fb c0 72 04 00 	cmp    $0x472c0,%rbx
   43aa3:	75 f1                	jne    43a96 <init_hardware()+0x314>
    gdt_segments[0] = 0;
   43aa5:	48 c7 05 f0 75 02 00 	movq   $0x0,0x275f0(%rip)        # 6b0a0 <gdt_segments>
   43aac:	00 00 00 00 
    *segment = type
   43ab0:	48 b8 00 00 00 00 00 	movabs $0x20980000000000,%rax
   43ab7:	98 20 00 
   43aba:	48 89 05 e7 75 02 00 	mov    %rax,0x275e7(%rip)        # 6b0a8 <gdt_segments+0x8>
   43ac1:	48 b8 00 00 00 00 00 	movabs $0x920000000000,%rax
   43ac8:	92 00 00 
   43acb:	48 89 05 de 75 02 00 	mov    %rax,0x275de(%rip)        # 6b0b0 <gdt_segments+0x10>
   43ad2:	48 b8 00 00 00 00 00 	movabs $0x20f80000000000,%rax
   43ad9:	f8 20 00 
   43adc:	48 89 05 d5 75 02 00 	mov    %rax,0x275d5(%rip)        # 6b0b8 <gdt_segments+0x18>
   43ae3:	48 b8 00 00 00 00 00 	movabs $0xf20000000000,%rax
   43aea:	f2 00 00 
   43aed:	48 89 05 cc 75 02 00 	mov    %rax,0x275cc(%rip)        # 6b0c0 <gdt_segments+0x20>
    set_sys_segment(&gdt_segments[SEGSEL_TASKSTATE >> 3],
   43af4:	ba 20 b0 06 00       	mov    $0x6b020,%edx
    segment[0] = ((addr & 0x0000000000FFFFFFUL) << 16)
   43af9:	48 89 d0             	mov    %rdx,%rax
   43afc:	48 c1 e0 10          	shl    $0x10,%rax
   43b00:	48 b9 00 00 ff ff ff 	movabs $0xffffff0000,%rcx
   43b07:	00 00 00 
   43b0a:	48 21 c8             	and    %rcx,%rax
        | ((addr & 0x00000000FF000000UL) << 32)
   43b0d:	48 89 d1             	mov    %rdx,%rcx
   43b10:	48 c1 e1 20          	shl    $0x20,%rcx
   43b14:	48 be 00 00 00 00 00 	movabs $0xff00000000000000,%rsi
   43b1b:	00 00 ff 
   43b1e:	48 21 f1             	and    %rsi,%rcx
   43b21:	48 09 c8             	or     %rcx,%rax
        | X86SEG_P;                   // segment present
   43b24:	48 b9 67 00 00 00 00 	movabs $0x890000000067,%rcx
   43b2b:	89 00 00 
   43b2e:	48 09 c8             	or     %rcx,%rax
   43b31:	48 89 05 90 75 02 00 	mov    %rax,0x27590(%rip)        # 6b0c8 <gdt_segments+0x28>
    segment[1] = addr >> 32;
   43b38:	48 c1 ea 20          	shr    $0x20,%rdx
   43b3c:	48 89 15 8d 75 02 00 	mov    %rdx,0x2758d(%rip)        # 6b0d0 <gdt_segments+0x30>
    memset(&taskstate, 0, sizeof(taskstate));
   43b43:	ba 68 00 00 00       	mov    $0x68,%edx
   43b48:	be 00 00 00 00       	mov    $0x0,%esi
   43b4d:	bf 20 b0 06 00       	mov    $0x6b020,%edi
   43b52:	e8 5b 16 00 00       	call   451b2 <memset>
    taskstate.ts_rsp[0] = KERNEL_STACK_TOP;
   43b57:	48 c7 05 c2 74 02 00 	movq   $0x80000,0x274c2(%rip)        # 6b024 <taskstate+0x4>
   43b5e:	00 00 08 00 
    gdt.limit = sizeof(gdt_segments) - 1;
   43b62:	66 c7 45 c6 37 00    	movw   $0x37,-0x3a(%rbp)
    gdt.base = (uint64_t) gdt_segments;
   43b68:	48 c7 45 c8 a0 b0 06 	movq   $0x6b0a0,-0x38(%rbp)
   43b6f:	00 
    idt.limit = sizeof(interrupt_descriptors) - 1;
   43b70:	66 c7 45 d6 ff 0f    	movw   $0xfff,-0x2a(%rbp)
    idt.base = (uint64_t) interrupt_descriptors;
   43b76:	48 c7 45 d8 10 26 06 	movq   $0x62610,-0x28(%rbp)
   43b7d:	00 
    asm volatile("lgdt %0; ltr %1; lidt %2"
   43b7e:	b8 28 00 00 00       	mov    $0x28,%eax
   43b83:	0f 01 55 c6          	lgdt   -0x3a(%rbp)
   43b87:	0f 00 d8             	ltr    %eax
   43b8a:	0f 01 5d d6          	lidt   -0x2a(%rbp)
    asm volatile("movw %%ax, %%fs; movw %%ax, %%gs"
   43b8e:	b8 10 00 00 00       	mov    $0x10,%eax
   43b93:	8e e0                	mov    %eax,%fs
   43b95:	8e e8                	mov    %eax,%gs
    asm volatile("movq %%cr0, %0" : "=r" (x));
   43b97:	0f 20 c0             	mov    %cr0,%rax
    wrcr0(cr0);
   43b9a:	0d 23 00 05 80       	or     $0x80050023,%eax
    asm volatile("movq %0, %%cr0" : : "r" (x));
   43b9f:	0f 22 c0             	mov    %rax,%cr0
}
__always_inline void wrmsr(uint32_t msr, uint64_t x) {
    asm volatile("wrmsr" : : "c" (msr), "a" ((uint32_t) x), "d" (x >> 32));
   43ba2:	b9 81 00 00 c0       	mov    $0xc0000081,%ecx
   43ba7:	b8 00 00 00 00       	mov    $0x0,%eax
   43bac:	ba 08 00 18 00       	mov    $0x180008,%edx
   43bb1:	0f 30                	wrmsr
    wrmsr(MSR_IA32_LSTAR, reinterpret_cast<uint64_t>(syscall_entry));
   43bb3:	b8 d6 0a 04 00       	mov    $0x40ad6,%eax
   43bb8:	48 89 c2             	mov    %rax,%rdx
   43bbb:	48 c1 ea 20          	shr    $0x20,%rdx
   43bbf:	b9 82 00 00 c0       	mov    $0xc0000082,%ecx
   43bc4:	0f 30                	wrmsr
   43bc6:	b9 84 00 00 c0       	mov    $0xc0000084,%ecx
   43bcb:	b8 00 77 04 00       	mov    $0x47700,%eax
   43bd0:	ba 00 00 00 00       	mov    $0x0,%edx
   43bd5:	0f 30                	wrmsr
    return reg_[reg].v;
   43bd7:	b8 00 00 e0 fe       	mov    $0xfee00000,%eax
   43bdc:	8b 90 f0 00 00 00    	mov    0xf0(%rax),%edx
    write(reg_svr, (read(reg_svr) & ~0xFF) | 0x100 | vector);
   43be2:	81 e2 00 fe ff ff    	and    $0xfffffe00,%edx
   43be8:	81 ca 3f 01 00 00    	or     $0x13f,%edx
    reg_[reg].v = v;
   43bee:	89 90 f0 00 00 00    	mov    %edx,0xf0(%rax)
   43bf4:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%rax)
   43bfb:	00 00 00 
   43bfe:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%rax)
   43c05:	00 02 00 
   43c08:	c7 80 80 03 00 00 00 	movl   $0x0,0x380(%rax)
   43c0f:	00 00 00 
   43c12:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%rax)
   43c19:	00 01 00 
   43c1c:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%rax)
   43c23:	00 01 00 
   43c26:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%rax)
   43c2d:	00 00 00 
   43c30:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%rax)
   43c37:	00 00 00 
    return reg_[reg].v;
   43c3a:	8b 90 80 02 00 00    	mov    0x280(%rax),%edx
    reg_[reg].v = v;
   43c40:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%rax)
   43c47:	00 00 00 
}
   43c4a:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   43c4e:	c9                   	leave
   43c4f:	c3                   	ret

0000000000043c50 <check_process_registers(proc const*)>:
void check_process_registers(const proc* p) {
   43c50:	f3 0f 1e fa          	endbr64
   43c54:	55                   	push   %rbp
   43c55:	48 89 e5             	mov    %rsp,%rbp
    assert(p->regs.reg_rsp >= PROC_START_ADDR);
   43c58:	48 8b 87 c0 00 00 00 	mov    0xc0(%rdi),%rax
   43c5f:	48 3d ff ff 0f 00    	cmp    $0xfffff,%rax
   43c65:	76 18                	jbe    43c7f <check_process_registers(proc const*)+0x2f>
    assert(p->regs.reg_rsp <= MEMSIZE_VIRTUAL);
   43c67:	48 3d 00 00 30 00    	cmp    $0x300000,%rax
   43c6d:	77 29                	ja     43c98 <check_process_registers(proc const*)+0x48>
    assert((p->regs.reg_cs & 3) == 3);
   43c6f:	48 8b 87 b0 00 00 00 	mov    0xb0(%rdi),%rax
   43c76:	48 f7 d0             	not    %rax
   43c79:	a8 03                	test   $0x3,%al
   43c7b:	75 34                	jne    43cb1 <check_process_registers(proc const*)+0x61>
}
   43c7d:	5d                   	pop    %rbp
   43c7e:	c3                   	ret
    assert(p->regs.reg_rsp >= PROC_START_ADDR);
   43c7f:	b9 00 00 00 00       	mov    $0x0,%ecx
   43c84:	ba d8 66 04 00       	mov    $0x466d8,%edx
   43c89:	be 2d 01 00 00       	mov    $0x12d,%esi
   43c8e:	bf b7 60 04 00       	mov    $0x460b7,%edi
   43c93:	e8 25 fa ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
    assert(p->regs.reg_rsp <= MEMSIZE_VIRTUAL);
   43c98:	b9 00 00 00 00       	mov    $0x0,%ecx
   43c9d:	ba 00 67 04 00       	mov    $0x46700,%edx
   43ca2:	be 2e 01 00 00       	mov    $0x12e,%esi
   43ca7:	bf b7 60 04 00       	mov    $0x460b7,%edi
   43cac:	e8 0c fa ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
    assert((p->regs.reg_cs & 3) == 3);
   43cb1:	b9 00 00 00 00       	mov    $0x0,%ecx
   43cb6:	ba e0 60 04 00       	mov    $0x460e0,%edx
   43cbb:	be 2f 01 00 00       	mov    $0x12f,%esi
   43cc0:	bf b7 60 04 00       	mov    $0x460b7,%edi
   43cc5:	e8 f3 f9 ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>

0000000000043cca <check_pagetable(x86_64_pagetable*)>:
void check_pagetable(x86_64_pagetable* pagetable) {
   43cca:	f3 0f 1e fa          	endbr64
   43cce:	55                   	push   %rbp
   43ccf:	48 89 e5             	mov    %rsp,%rbp
   43cd2:	53                   	push   %rbx
   43cd3:	48 83 ec 28          	sub    $0x28,%rsp
    assert(((uintptr_t) pagetable % PAGESIZE) == 0); // must be page aligned
   43cd7:	f7 c7 ff 0f 00 00    	test   $0xfff,%edi
   43cdd:	0f 85 92 01 00 00    	jne    43e75 <check_pagetable(x86_64_pagetable*)+0x1ab>
   43ce3:	48 89 fb             	mov    %rdi,%rbx
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   43ce6:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
   43cea:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   43cee:	c7 45 e0 27 00 00 00 	movl   $0x27,-0x20(%rbp)
      perm_(initial_perm), va_(0) {
   43cf5:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   43cfc:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   43d03:	00 
    real_find(va, false);
   43d04:	ba 00 00 00 00       	mov    $0x0,%edx
   43d09:	be 72 0a 04 00       	mov    $0x40a72,%esi
   43d0e:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   43d12:	e8 0f e6 ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    if (*pep_ & PTE_P) {
   43d17:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43d1b:	48 8b 00             	mov    (%rax),%rax
   43d1e:	a8 01                	test   $0x1,%al
   43d20:	0f 84 68 01 00 00    	je     43e8e <check_pagetable(x86_64_pagetable*)+0x1c4>
        if (lbits_ > PAGEOFFBITS) {
   43d26:	8b 4d e0             	mov    -0x20(%rbp),%ecx
            pa &= ~0x1000UL;
   43d29:	48 ba 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rdx
   43d30:	ff 0f 00 
   43d33:	48 21 c2             	and    %rax,%rdx
        if (lbits_ > PAGEOFFBITS) {
   43d36:	83 f9 0c             	cmp    $0xc,%ecx
   43d39:	7f 0d                	jg     43d48 <check_pagetable(x86_64_pagetable*)+0x7e>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   43d3b:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   43d42:	ff 0f 00 
   43d45:	48 21 c2             	and    %rax,%rdx
    return ~(~uintptr_t(0) << lbits);
   43d48:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   43d4f:	48 d3 e0             	shl    %cl,%rax
   43d52:	48 f7 d0             	not    %rax
        return pa + (va_ & lbits_mask(lbits_));
   43d55:	48 23 45 e8          	and    -0x18(%rbp),%rax
   43d59:	48 01 d0             	add    %rdx,%rax
    assert(vmiter(pagetable, (uintptr_t) exception_entry).pa()
   43d5c:	ba 72 0a 04 00       	mov    $0x40a72,%edx
   43d61:	48 39 c2             	cmp    %rax,%rdx
   43d64:	0f 85 24 01 00 00    	jne    43e8e <check_pagetable(x86_64_pagetable*)+0x1c4>
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   43d6a:	48 c7 45 d0 00 60 06 	movq   $0x66000,-0x30(%rbp)
   43d71:	00 
   43d72:	48 c7 45 d8 00 60 06 	movq   $0x66000,-0x28(%rbp)
   43d79:	00 
   43d7a:	c7 45 e0 27 00 00 00 	movl   $0x27,-0x20(%rbp)
      perm_(initial_perm), va_(0) {
   43d81:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   43d88:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   43d8f:	00 
    real_find(va, false);
   43d90:	ba 00 00 00 00       	mov    $0x0,%edx
   43d95:	48 89 de             	mov    %rbx,%rsi
   43d98:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   43d9c:	e8 85 e5 ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    if (*pep_ & PTE_P) {
   43da1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43da5:	48 8b 00             	mov    (%rax),%rax
   43da8:	a8 01                	test   $0x1,%al
   43daa:	0f 84 f7 00 00 00    	je     43ea7 <check_pagetable(x86_64_pagetable*)+0x1dd>
        if (lbits_ > PAGEOFFBITS) {
   43db0:	8b 4d e0             	mov    -0x20(%rbp),%ecx
            pa &= ~0x1000UL;
   43db3:	48 ba 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rdx
   43dba:	ff 0f 00 
   43dbd:	48 21 c2             	and    %rax,%rdx
        if (lbits_ > PAGEOFFBITS) {
   43dc0:	83 f9 0c             	cmp    $0xc,%ecx
   43dc3:	7f 0d                	jg     43dd2 <check_pagetable(x86_64_pagetable*)+0x108>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   43dc5:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   43dcc:	ff 0f 00 
   43dcf:	48 21 c2             	and    %rax,%rdx
    return ~(~uintptr_t(0) << lbits);
   43dd2:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   43dd9:	48 d3 e0             	shl    %cl,%rax
   43ddc:	48 f7 d0             	not    %rax
        return pa + (va_ & lbits_mask(lbits_));
   43ddf:	48 23 45 e8          	and    -0x18(%rbp),%rax
   43de3:	48 01 d0             	add    %rdx,%rax
    assert(vmiter(kernel_pagetable, (uintptr_t) pagetable).pa()
   43de6:	48 39 c3             	cmp    %rax,%rbx
   43de9:	0f 85 b8 00 00 00    	jne    43ea7 <check_pagetable(x86_64_pagetable*)+0x1dd>
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   43def:	48 89 5d d0          	mov    %rbx,-0x30(%rbp)
   43df3:	48 89 5d d8          	mov    %rbx,-0x28(%rbp)
   43df7:	c7 45 e0 27 00 00 00 	movl   $0x27,-0x20(%rbp)
      perm_(initial_perm), va_(0) {
   43dfe:	c7 45 e4 ff 0f 00 00 	movl   $0xfff,-0x1c(%rbp)
   43e05:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
   43e0c:	00 
    real_find(va, false);
   43e0d:	ba 00 00 00 00       	mov    $0x0,%edx
   43e12:	be 00 60 06 00       	mov    $0x66000,%esi
   43e17:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
   43e1b:	e8 06 e5 ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    if (*pep_ & PTE_P) {
   43e20:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   43e24:	48 8b 00             	mov    (%rax),%rax
   43e27:	a8 01                	test   $0x1,%al
   43e29:	0f 84 91 00 00 00    	je     43ec0 <check_pagetable(x86_64_pagetable*)+0x1f6>
        if (lbits_ > PAGEOFFBITS) {
   43e2f:	8b 4d e0             	mov    -0x20(%rbp),%ecx
            pa &= ~0x1000UL;
   43e32:	48 ba 00 e0 ff ff ff 	movabs $0xfffffffffe000,%rdx
   43e39:	ff 0f 00 
   43e3c:	48 21 c2             	and    %rax,%rdx
        if (lbits_ > PAGEOFFBITS) {
   43e3f:	83 f9 0c             	cmp    $0xc,%ecx
   43e42:	7f 0d                	jg     43e51 <check_pagetable(x86_64_pagetable*)+0x187>
        uintptr_t pa = *pep_ & PTE_PAMASK;
   43e44:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   43e4b:	ff 0f 00 
   43e4e:	48 21 c2             	and    %rax,%rdx
    return ~(~uintptr_t(0) << lbits);
   43e51:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   43e58:	48 d3 e0             	shl    %cl,%rax
   43e5b:	48 f7 d0             	not    %rax
        return pa + (va_ & lbits_mask(lbits_));
   43e5e:	48 23 45 e8          	and    -0x18(%rbp),%rax
   43e62:	48 01 d0             	add    %rdx,%rax
    assert(vmiter(pagetable, (uintptr_t) kernel_pagetable).pa()
   43e65:	ba 00 60 06 00       	mov    $0x66000,%edx
   43e6a:	48 39 c2             	cmp    %rax,%rdx
   43e6d:	75 51                	jne    43ec0 <check_pagetable(x86_64_pagetable*)+0x1f6>
}
   43e6f:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   43e73:	c9                   	leave
   43e74:	c3                   	ret
    assert(((uintptr_t) pagetable % PAGESIZE) == 0); // must be page aligned
   43e75:	b9 00 00 00 00       	mov    $0x0,%ecx
   43e7a:	ba 28 67 04 00       	mov    $0x46728,%edx
   43e7f:	be 38 01 00 00       	mov    $0x138,%esi
   43e84:	bf b7 60 04 00       	mov    $0x460b7,%edi
   43e89:	e8 2f f8 ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
    assert(vmiter(pagetable, (uintptr_t) exception_entry).pa()
   43e8e:	b9 00 00 00 00       	mov    $0x0,%ecx
   43e93:	ba 50 67 04 00       	mov    $0x46750,%edx
   43e98:	be 39 01 00 00       	mov    $0x139,%esi
   43e9d:	bf b7 60 04 00       	mov    $0x460b7,%edi
   43ea2:	e8 16 f8 ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
    assert(vmiter(kernel_pagetable, (uintptr_t) pagetable).pa()
   43ea7:	b9 00 00 00 00       	mov    $0x0,%ecx
   43eac:	ba a0 67 04 00       	mov    $0x467a0,%edx
   43eb1:	be 3b 01 00 00       	mov    $0x13b,%esi
   43eb6:	bf b7 60 04 00       	mov    $0x460b7,%edi
   43ebb:	e8 fd f7 ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
    assert(vmiter(pagetable, (uintptr_t) kernel_pagetable).pa()
   43ec0:	b9 00 00 00 00       	mov    $0x0,%ecx
   43ec5:	ba f0 67 04 00       	mov    $0x467f0,%edx
   43eca:	be 3d 01 00 00       	mov    $0x13d,%esi
   43ecf:	bf b7 60 04 00       	mov    $0x460b7,%edi
   43ed4:	e8 e4 f7 ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
   43ed9:	90                   	nop

0000000000043eda <pcistate::next(int) const>:
int pcistate::next(int addr) const {
   43eda:	f3 0f 1e fa          	endbr64
   43ede:	55                   	push   %rbp
   43edf:	48 89 e5             	mov    %rsp,%rbp
    }
    return addr;
}

inline uint32_t pcistate::readl(int addr) const {
    assert(addr >= 0 && !(addr & 3));
   43ee2:	89 f0                	mov    %esi,%eax
   43ee4:	83 c0 0c             	add    $0xc,%eax
   43ee7:	78 23                	js     43f0c <pcistate::next(int) const+0x32>
   43ee9:	a8 03                	test   $0x3,%al
   43eeb:	75 1f                	jne    43f0c <pcistate::next(int) const+0x32>
    outl(reg_host_bridge_config_addr, 0x80000000U | addr);
   43eed:	0d 00 00 00 80       	or     $0x80000000,%eax
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   43ef2:	ba f8 0c 00 00       	mov    $0xcf8,%edx
   43ef7:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   43ef8:	ba fc 0c 00 00       	mov    $0xcfc,%edx
   43efd:	ed                   	in     (%dx),%eax
   43efe:	89 c2                	mov    %eax,%edx
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   43f00:	bf f8 0c 00 00       	mov    $0xcf8,%edi
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   43f05:	b9 fc 0c 00 00       	mov    $0xcfc,%ecx
   43f0a:	eb 5b                	jmp    43f67 <pcistate::next(int) const+0x8d>
    assert(addr >= 0 && !(addr & 3));
   43f0c:	b9 00 00 00 00       	mov    $0x0,%ecx
   43f11:	ba 1c 61 04 00       	mov    $0x4611c,%edx
   43f16:	be 57 00 00 00       	mov    $0x57,%esi
   43f1b:	bf 13 61 04 00       	mov    $0x46113,%edi
   43f20:	e8 98 f7 ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
    assert(addr >= 0 && addr < 0x1000000);
   43f25:	b9 00 00 00 00       	mov    $0x0,%ecx
   43f2a:	ba 35 61 04 00       	mov    $0x46135,%edx
   43f2f:	be 4a 00 00 00       	mov    $0x4a,%esi
   43f34:	bf 13 61 04 00       	mov    $0x46113,%edi
   43f39:	e8 7f f7 ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
            addr += make_addr(0, 0, 1);
   43f3e:	81 c6 00 01 00 00    	add    $0x100,%esi
        if (addr >= addr_end) {
   43f44:	81 fe ff ff 07 00    	cmp    $0x7ffff,%esi
   43f4a:	7f 5d                	jg     43fa9 <pcistate::next(int) const+0xcf>
        x = readl(addr + config_lthb);
   43f4c:	8d 46 0c             	lea    0xc(%rsi),%eax
    assert(addr >= 0 && !(addr & 3));
   43f4f:	40 f6 c6 03          	test   $0x3,%sil
   43f53:	75 37                	jne    43f8c <pcistate::next(int) const+0xb2>
    outl(reg_host_bridge_config_addr, 0x80000000U | addr);
   43f55:	0d 00 00 00 80       	or     $0x80000000,%eax
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   43f5a:	89 fa                	mov    %edi,%edx
   43f5c:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   43f5d:	89 ca                	mov    %ecx,%edx
   43f5f:	ed                   	in     (%dx),%eax
   43f60:	89 c2                	mov    %eax,%edx
        if (x != uint32_t(-1)) {
   43f62:	83 f8 ff             	cmp    $0xffffffff,%eax
   43f65:	75 3e                	jne    43fa5 <pcistate::next(int) const+0xcb>
    assert(addr >= 0 && addr < 0x1000000);
   43f67:	81 fe ff ff ff 00    	cmp    $0xffffff,%esi
   43f6d:	77 b6                	ja     43f25 <pcistate::next(int) const+0x4b>
            && (x == uint32_t(-1) || !(x & 0x800000))) {
   43f6f:	f7 c6 00 07 00 00    	test   $0x700,%esi
   43f75:	75 c7                	jne    43f3e <pcistate::next(int) const+0x64>
   43f77:	83 fa ff             	cmp    $0xffffffff,%edx
   43f7a:	74 08                	je     43f84 <pcistate::next(int) const+0xaa>
   43f7c:	f7 c2 00 00 80 00    	test   $0x800000,%edx
   43f82:	75 ba                	jne    43f3e <pcistate::next(int) const+0x64>
            addr += make_addr(0, 1, 0);
   43f84:	81 c6 00 08 00 00    	add    $0x800,%esi
   43f8a:	eb b8                	jmp    43f44 <pcistate::next(int) const+0x6a>
    assert(addr >= 0 && !(addr & 3));
   43f8c:	b9 00 00 00 00       	mov    $0x0,%ecx
   43f91:	ba 1c 61 04 00       	mov    $0x4611c,%edx
   43f96:	be 57 00 00 00       	mov    $0x57,%esi
   43f9b:	bf 13 61 04 00       	mov    $0x46113,%edi
   43fa0:	e8 18 f7 ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
            return addr;
   43fa5:	89 f0                	mov    %esi,%eax
   43fa7:	eb 05                	jmp    43fae <pcistate::next(int) const+0xd4>
            return -1;
   43fa9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   43fae:	5d                   	pop    %rbp
   43faf:	c3                   	ret

0000000000043fb0 <poweroff()>:
void poweroff() {
   43fb0:	f3 0f 1e fa          	endbr64
   43fb4:	55                   	push   %rbp
   43fb5:	48 89 e5             	mov    %rsp,%rbp
   43fb8:	53                   	push   %rbx
   43fb9:	48 83 ec 08          	sub    $0x8,%rsp
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   43fbd:	b8 00 00 00 80       	mov    $0x80000000,%eax
   43fc2:	ba f8 0c 00 00       	mov    $0xcf8,%edx
   43fc7:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   43fc8:	ba fc 0c 00 00       	mov    $0xcfc,%edx
   43fcd:	ed                   	in     (%dx),%eax
    while (addr >= 0 && !predicate(addr)) {
   43fce:	3d 86 80 13 71       	cmp    $0x71138086,%eax
   43fd3:	0f 84 bf 00 00 00    	je     44098 <poweroff()+0xe8>
   43fd9:	3d 86 80 18 29       	cmp    $0x29188086,%eax
   43fde:	0f 84 b4 00 00 00    	je     44098 <poweroff()+0xe8>
   43fe4:	be 00 00 00 00       	mov    $0x0,%esi
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   43fe9:	bb f8 0c 00 00       	mov    $0xcf8,%ebx
        addr = next(addr);
   43fee:	bf 00 b0 06 00       	mov    $0x6b000,%edi
   43ff3:	e8 e2 fe ff ff       	call   43eda <pcistate::next(int) const>
   43ff8:	89 c6                	mov    %eax,%esi
    while (addr >= 0 && !predicate(addr)) {
   43ffa:	85 c0                	test   %eax,%eax
   43ffc:	78 4d                	js     4404b <poweroff()+0x9b>
    assert(addr >= 0 && !(addr & 3));
   43ffe:	40 f6 c6 03          	test   $0x3,%sil
   44002:	75 62                	jne    44066 <poweroff()+0xb6>
    outl(reg_host_bridge_config_addr, 0x80000000U | addr);
   44004:	89 f0                	mov    %esi,%eax
   44006:	0d 00 00 00 80       	or     $0x80000000,%eax
   4400b:	89 da                	mov    %ebx,%edx
   4400d:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   4400e:	ba fc 0c 00 00       	mov    $0xcfc,%edx
   44013:	ed                   	in     (%dx),%eax
    while (addr >= 0 && !predicate(addr)) {
   44014:	3d 86 80 13 71       	cmp    $0x71138086,%eax
   44019:	74 07                	je     44022 <poweroff()+0x72>
   4401b:	3d 86 80 18 29       	cmp    $0x29188086,%eax
   44020:	75 cc                	jne    43fee <poweroff()+0x3e>
        int pm_io_base = pci.readl(addr + 0x40) & 0xFFC0;
   44022:	8d 46 40             	lea    0x40(%rsi),%eax
    assert(addr >= 0 && !(addr & 3));
   44025:	40 f6 c6 03          	test   $0x3,%sil
   44029:	75 54                	jne    4407f <poweroff()+0xcf>
    outl(reg_host_bridge_config_addr, 0x80000000U | addr);
   4402b:	0d 00 00 00 80       	or     $0x80000000,%eax
    asm volatile("outl %0, %w1" : : "a" (data), "d" (port));
   44030:	ba f8 0c 00 00       	mov    $0xcf8,%edx
   44035:	ef                   	out    %eax,(%dx)
    asm volatile("inl %w1, %0" : "=a" (data) : "d" (port));
   44036:	ba fc 0c 00 00       	mov    $0xcfc,%edx
   4403b:	ed                   	in     (%dx),%eax
   4403c:	25 c0 ff 00 00       	and    $0xffc0,%eax
        outw(pm_io_base + 4, 0x2000);
   44041:	8d 50 04             	lea    0x4(%rax),%edx
    asm volatile("outw %0, %w1" : : "a" (data), "d" (port));
   44044:	b8 00 20 00 00       	mov    $0x2000,%eax
   44049:	66 ef                	out    %ax,(%dx)
    console_printf(CPOS(24, 0), 0xC000, "Cannot power off!\n");
   4404b:	ba 53 61 04 00       	mov    $0x46153,%edx
   44050:	be 00 c0 00 00       	mov    $0xc000,%esi
   44055:	bf 80 07 00 00       	mov    $0x780,%edi
   4405a:	b8 00 00 00 00       	mov    $0x0,%eax
   4405f:	e8 e1 1d 00 00       	call   45e45 <console_printf(int, int, char const*, ...)>
    while (true) {
   44064:	eb fe                	jmp    44064 <poweroff()+0xb4>
    assert(addr >= 0 && !(addr & 3));
   44066:	b9 00 00 00 00       	mov    $0x0,%ecx
   4406b:	ba 1c 61 04 00       	mov    $0x4611c,%edx
   44070:	be 57 00 00 00       	mov    $0x57,%esi
   44075:	bf 13 61 04 00       	mov    $0x46113,%edi
   4407a:	e8 3e f6 ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
   4407f:	b9 00 00 00 00       	mov    $0x0,%ecx
   44084:	ba 1c 61 04 00       	mov    $0x4611c,%edx
   44089:	be 57 00 00 00       	mov    $0x57,%esi
   4408e:	bf 13 61 04 00       	mov    $0x46113,%edi
   44093:	e8 25 f6 ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
        int pm_io_base = pci.readl(addr + 0x40) & 0xFFC0;
   44098:	b8 40 00 00 00       	mov    $0x40,%eax
   4409d:	eb 8c                	jmp    4402b <poweroff()+0x7b>

000000000004409f <check_keyboard()>:
int check_keyboard() {
   4409f:	f3 0f 1e fa          	endbr64
   440a3:	55                   	push   %rbp
   440a4:	48 89 e5             	mov    %rsp,%rbp
   440a7:	41 54                	push   %r12
   440a9:	53                   	push   %rbx
   440aa:	48 83 ec 20          	sub    $0x20,%rsp
    int c = keyboard_readc();
   440ae:	e8 d6 ea ff ff       	call   42b89 <keyboard_readc()>
   440b3:	41 89 c4             	mov    %eax,%r12d
    if (c == 'a' || c == 'f' || c == 'e') {
   440b6:	8d 40 9b             	lea    -0x65(%rax),%eax
   440b9:	83 f8 01             	cmp    $0x1,%eax
   440bc:	76 1b                	jbe    440d9 <check_keyboard()+0x3a>
   440be:	41 83 fc 61          	cmp    $0x61,%r12d
   440c2:	74 15                	je     440d9 <check_keyboard()+0x3a>
    } else if (c == 0x03 || c == 'q') {
   440c4:	41 83 fc 03          	cmp    $0x3,%r12d
   440c8:	74 0a                	je     440d4 <check_keyboard()+0x35>
   440ca:	41 83 fc 71          	cmp    $0x71,%r12d
   440ce:	0f 85 cc 00 00 00    	jne    441a0 <check_keyboard()+0x101>
        poweroff();
   440d4:	e8 d7 fe ff ff       	call   43fb0 <poweroff()>
   440d9:	b8 80 03 e0 fe       	mov    $0xfee00380,%eax
   440de:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
        memset(pt, 0, PAGESIZE * 2);
   440e4:	ba 00 20 00 00       	mov    $0x2000,%edx
   440e9:	be 00 00 00 00       	mov    $0x0,%esi
   440ee:	bf 00 10 00 00       	mov    $0x1000,%edi
   440f3:	e8 ba 10 00 00       	call   451b2 <memset>
        pt[0].entry[0] = 0x2000 | PTE_P | PTE_W;
   440f8:	48 c7 04 25 00 10 00 	movq   $0x2003,0x1000
   440ff:	00 03 20 00 00 
        pt[1].entry[0] = PTE_P | PTE_W | PTE_PS;
   44104:	48 c7 04 25 00 20 00 	movq   $0x83,0x2000
   4410b:	00 83 00 00 00 
    asm volatile("movq %0, %%cr3" : : "r" (x) : "memory");
   44110:	b8 00 10 00 00       	mov    $0x1000,%eax
   44115:	0f 22 d8             	mov    %rax,%cr3
        multiboot_info[0] = 4;
   44118:	c7 45 dc 04 00 00 00 	movl   $0x4,-0x24(%rbp)
            argument = "allocators";
   4411f:	b8 4f 5f 04 00       	mov    $0x45f4f,%eax
        if (c == 'a') {
   44124:	41 83 fc 61          	cmp    $0x61,%r12d
   44128:	74 12                	je     4413c <check_keyboard()+0x9d>
        const char* argument = "fork";
   4412a:	41 83 fc 65          	cmp    $0x65,%r12d
   4412e:	b8 6b 61 04 00       	mov    $0x4616b,%eax
   44133:	ba 66 61 04 00       	mov    $0x46166,%edx
   44138:	48 0f 45 c2          	cmovne %rdx,%rax
        assert(argument_ptr < 0x100000000L);
   4413c:	48 89 c1             	mov    %rax,%rcx
   4413f:	48 c1 e9 20          	shr    $0x20,%rcx
   44143:	75 67                	jne    441ac <check_keyboard()+0x10d>
        multiboot_info[4] = (uint32_t) argument_ptr;
   44145:	89 45 ec             	mov    %eax,-0x14(%rbp)
        stash_kernel_data(true);
   44148:	bf 01 00 00 00       	mov    $0x1,%edi
   4414d:	e8 9d e7 ff ff       	call   428ef <stash_kernel_data(bool)>
        uintptr_t zero_size = (uintptr_t) _kernel_end - (uintptr_t) _edata;
   44152:	bb a0 b1 06 00       	mov    $0x6b1a0,%ebx
   44157:	48 81 eb 10 36 06 00 	sub    $0x63610,%rbx
        uintptr_t data_size = (uintptr_t) _edata - (uintptr_t) _data_start;
   4415e:	ba 10 36 06 00       	mov    $0x63610,%edx
   44163:	48 81 ea 00 80 04 00 	sub    $0x48000,%rdx
        uint8_t* data_stash = (uint8_t*) (SYMTAB_ADDR - data_size);
   4416a:	be 00 80 04 01       	mov    $0x1048000,%esi
   4416f:	48 81 ee 10 36 06 00 	sub    $0x63610,%rsi
        memcpy(_data_start, data_stash, data_size);
   44176:	bf 00 80 04 00       	mov    $0x48000,%edi
   4417b:	e8 0e 10 00 00       	call   4518e <memcpy>
        memset(_edata, 0, zero_size);
   44180:	48 89 da             	mov    %rbx,%rdx
   44183:	be 00 00 00 00       	mov    $0x0,%esi
   44188:	bf 10 36 06 00       	mov    $0x63610,%edi
   4418d:	e8 20 10 00 00       	call   451b2 <memset>
        asm volatile("movl $0x2BADB002, %%eax; jmp kernel_entry"
   44192:	48 8d 5d dc          	lea    -0x24(%rbp),%rbx
   44196:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
   4419b:	e9 60 be ff ff       	jmp    40000 <_kernel_start>
}
   441a0:	44 89 e0             	mov    %r12d,%eax
   441a3:	48 83 c4 20          	add    $0x20,%rsp
   441a7:	5b                   	pop    %rbx
   441a8:	41 5c                	pop    %r12
   441aa:	5d                   	pop    %rbp
   441ab:	c3                   	ret
        assert(argument_ptr < 0x100000000L);
   441ac:	b9 00 00 00 00       	mov    $0x0,%ecx
   441b1:	ba 70 61 04 00       	mov    $0x46170,%edx
   441b6:	be 63 03 00 00       	mov    $0x363,%esi
   441bb:	bf b7 60 04 00       	mov    $0x460b7,%edi
   441c0:	e8 f8 f4 ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>

00000000000441c5 <proc_panic(proc const*, char const*, ...)>:
void proc_panic(const proc* p, const char* format, ...) {
   441c5:	f3 0f 1e fa          	endbr64
   441c9:	55                   	push   %rbp
   441ca:	48 89 e5             	mov    %rsp,%rbp
   441cd:	48 83 ec 50          	sub    $0x50,%rsp
   441d1:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   441d5:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   441d9:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   441dd:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_start(val, format);
   441e1:	c7 45 b8 10 00 00 00 	movl   $0x10,-0x48(%rbp)
   441e8:	48 8d 45 10          	lea    0x10(%rbp),%rax
   441ec:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   441f0:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   441f4:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    if ((p->regs.reg_cs & 3) == 0) {
   441f8:	f6 87 b0 00 00 00 03 	testb  $0x3,0xb0(%rdi)
   441ff:	74 1d                	je     4421e <proc_panic(proc const*, char const*, ...)+0x59>
        pt = p->pagetable;
   44201:	48 8b 07             	mov    (%rdi),%rax
    vpanic(p->regs, pt, format, val);
   44204:	48 83 c7 10          	add    $0x10,%rdi
   44208:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   4420c:	48 89 f2             	mov    %rsi,%rdx
   4420f:	48 89 c6             	mov    %rax,%rsi
   44212:	e8 77 f3 ff ff       	call   4358e <vpanic(regstate const&, x86_64_pagetable*, char const*, __va_list_tag*)>
        check_keyboard();
   44217:	e8 83 fe ff ff       	call   4409f <check_keyboard()>
    while (true) {
   4421c:	eb f9                	jmp    44217 <proc_panic(proc const*, char const*, ...)+0x52>
    asm volatile("movq %%cr3, %0" : "=r" (x));
   4421e:	0f 20 d8             	mov    %cr3,%rax
    return reinterpret_cast<uint64_t>(kptr);
}
inline uint64_t pa2ka(uint64_t pa) {
    return pa;
}
template <typename T = void*> inline T pa2kptr(uint64_t pa) {
   44221:	eb e1                	jmp    44204 <proc_panic(proc const*, char const*, ...)+0x3f>

0000000000044223 <user_panic(proc const*)>:
void user_panic(const proc* p) {
   44223:	f3 0f 1e fa          	endbr64
   44227:	55                   	push   %rbp
   44228:	48 89 e5             	mov    %rsp,%rbp
   4422b:	41 54                	push   %r12
   4422d:	53                   	push   %rbx
   4422e:	48 81 ec 20 01 00 00 	sub    $0x120,%rsp
   44235:	48 89 fb             	mov    %rdi,%rbx
    memset(buf, 0, sizeof(buf));
   44238:	ba 00 01 00 00       	mov    $0x100,%edx
   4423d:	be 00 00 00 00       	mov    $0x0,%esi
   44242:	48 8d bd f0 fe ff ff 	lea    -0x110(%rbp),%rdi
   44249:	e8 64 0f 00 00       	call   451b2 <memset>
    if (p->regs.reg_rdi == 0) {
   4424e:	48 8b 43 40          	mov    0x40(%rbx),%rax
        fmt = "USER PANIC";
   44252:	be 8c 61 04 00       	mov    $0x4618c,%esi
    if (p->regs.reg_rdi == 0) {
   44257:	48 85 c0             	test   %rax,%rax
   4425a:	75 14                	jne    44270 <user_panic(proc const*)+0x4d>
    proc_panic(p, fmt, buf);
   4425c:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
   44263:	48 89 df             	mov    %rbx,%rdi
   44266:	b8 00 00 00 00       	mov    $0x0,%eax
   4426b:	e8 55 ff ff ff       	call   441c5 <proc_panic(proc const*, char const*, ...)>
    : vmiter(p->pagetable, va) {
   44270:	48 8b 13             	mov    (%rbx),%rdx
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   44273:	48 89 95 d0 fe ff ff 	mov    %rdx,-0x130(%rbp)
   4427a:	48 89 95 d8 fe ff ff 	mov    %rdx,-0x128(%rbp)
   44281:	c7 85 e0 fe ff ff 27 	movl   $0x27,-0x120(%rbp)
   44288:	00 00 00 
      perm_(initial_perm), va_(0) {
   4428b:	c7 85 e4 fe ff ff ff 	movl   $0xfff,-0x11c(%rbp)
   44292:	0f 00 00 
   44295:	48 c7 85 e8 fe ff ff 	movq   $0x0,-0x118(%rbp)
   4429c:	00 00 00 00 
    real_find(va, false);
   442a0:	4c 8d a5 d0 fe ff ff 	lea    -0x130(%rbp),%r12
   442a7:	ba 00 00 00 00       	mov    $0x0,%edx
   442ac:	48 89 c6             	mov    %rax,%rsi
   442af:	4c 89 e7             	mov    %r12,%rdi
   442b2:	e8 6f e0 ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
        strlcpy_from_user(buf, vmiter(p, p->regs.reg_rdi), sizeof(buf));
   442b7:	48 83 ec 20          	sub    $0x20,%rsp
   442bb:	b9 08 00 00 00       	mov    $0x8,%ecx
   442c0:	48 89 e7             	mov    %rsp,%rdi
   442c3:	4c 89 e6             	mov    %r12,%rsi
   442c6:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
   442c8:	be 00 01 00 00       	mov    $0x100,%esi
   442cd:	48 8d bd f0 fe ff ff 	lea    -0x110(%rbp),%rdi
   442d4:	e8 77 eb ff ff       	call   42e50 <strlcpy_from_user(char*, vmiter, unsigned long)>
   442d9:	48 83 c4 20          	add    $0x20,%rsp
        fmt = "USER PANIC: %s";
   442dd:	be 97 61 04 00       	mov    $0x46197,%esi
   442e2:	e9 75 ff ff ff       	jmp    4425c <user_panic(proc const*)+0x39>

00000000000442e7 <panic(char const*, ...)>:
void panic(const char* format, ...) {
   442e7:	f3 0f 1e fa          	endbr64
   442eb:	55                   	push   %rbp
   442ec:	48 89 e5             	mov    %rsp,%rbp
   442ef:	48 83 ec 50          	sub    $0x50,%rsp
   442f3:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   442f7:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   442fb:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   442ff:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   44303:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_start(val, format);
   44307:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%rbp)
   4430e:	48 8d 45 10          	lea    0x10(%rbp),%rax
   44312:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   44316:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   4431a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
   4431e:	0f 20 de             	mov    %cr3,%rsi
    asm volatile("movq %%rsp, %0" : "=r" (x));
   44321:	48 89 e0             	mov    %rsp,%rax
    backtrace_kernel_regs.reg_rsp = rdrsp();
   44324:	48 89 05 65 6e 02 00 	mov    %rax,0x26e65(%rip)        # 6b190 <backtrace_current_regs()::backtrace_kernel_regs+0xb0>
    asm volatile("movq %%rbp, %0" : "=r" (x));
   4432b:	48 89 e8             	mov    %rbp,%rax
    backtrace_kernel_regs.reg_rbp = rdrbp();
   4432e:	48 89 05 cb 6d 02 00 	mov    %rax,0x26dcb(%rip)        # 6b100 <backtrace_current_regs()::backtrace_kernel_regs+0x20>
    backtrace_kernel_regs.reg_rip = 0;
   44335:	48 c7 05 38 6e 02 00 	movq   $0x0,0x26e38(%rip)        # 6b178 <backtrace_current_regs()::backtrace_kernel_regs+0x98>
   4433c:	00 00 00 00 
    vpanic(backtrace_current_regs(), backtrace_current_pagetable(),
   44340:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   44344:	48 89 fa             	mov    %rdi,%rdx
   44347:	bf e0 b0 06 00       	mov    $0x6b0e0,%edi
   4434c:	e8 3d f2 ff ff       	call   4358e <vpanic(regstate const&, x86_64_pagetable*, char const*, __va_list_tag*)>
        check_keyboard();
   44351:	e8 49 fd ff ff       	call   4409f <check_keyboard()>
    while (true) {
   44356:	eb f9                	jmp    44351 <panic(char const*, ...)+0x6a>

0000000000044358 <program_image::program_image(int)>:
program_image::program_image(int program_number) {
   44358:	f3 0f 1e fa          	endbr64
    elf_ = nullptr;
   4435c:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
    if (program_number >= 0
   44363:	83 fe 07             	cmp    $0x7,%esi
   44366:	77 1a                	ja     44382 <program_image::program_image(int)+0x2a>
        elf_ = (elf_header*) ramimages[program_number].begin;
   44368:	48 63 f6             	movslq %esi,%rsi
   4436b:	48 8d 04 76          	lea    (%rsi,%rsi,2),%rax
   4436f:	48 8b 04 c5 08 80 04 	mov    0x48008(,%rax,8),%rax
   44376:	00 
   44377:	48 89 07             	mov    %rax,(%rdi)
        assert(elf_->e_magic == ELF_MAGIC);
   4437a:	81 38 7f 45 4c 46    	cmpl   $0x464c457f,(%rax)
   44380:	75 01                	jne    44383 <program_image::program_image(int)+0x2b>
   44382:	c3                   	ret
program_image::program_image(int program_number) {
   44383:	55                   	push   %rbp
   44384:	48 89 e5             	mov    %rsp,%rbp
        assert(elf_->e_magic == ELF_MAGIC);
   44387:	b9 00 00 00 00       	mov    $0x0,%ecx
   4438c:	ba a6 61 04 00       	mov    $0x461a6,%edx
   44391:	be 2f 04 00 00       	mov    $0x42f,%esi
   44396:	bf b7 60 04 00       	mov    $0x460b7,%edi
   4439b:	e8 1d f3 ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>

00000000000443a0 <program_image::program_number(char const*)>:
int program_image::program_number(const char* program_name) {
   443a0:	f3 0f 1e fa          	endbr64
   443a4:	55                   	push   %rbp
   443a5:	48 89 e5             	mov    %rsp,%rbp
   443a8:	41 54                	push   %r12
   443aa:	53                   	push   %rbx
   443ab:	49 89 fc             	mov    %rdi,%r12
    for (size_t i = 0; i != sizeof(ramimages) / sizeof(ramimages[0]); ++i) {
   443ae:	bb 00 00 00 00       	mov    $0x0,%ebx
        if (strcmp(program_name, ramimages[i].name) == 0) {
   443b3:	48 8d 04 5b          	lea    (%rbx,%rbx,2),%rax
   443b7:	48 8b 34 c5 00 80 04 	mov    0x48000(,%rax,8),%rsi
   443be:	00 
   443bf:	4c 89 e7             	mov    %r12,%rdi
   443c2:	e8 90 0e 00 00       	call   45257 <strcmp>
   443c7:	85 c0                	test   %eax,%eax
   443c9:	74 14                	je     443df <program_image::program_number(char const*)+0x3f>
    for (size_t i = 0; i != sizeof(ramimages) / sizeof(ramimages[0]); ++i) {
   443cb:	48 83 c3 01          	add    $0x1,%rbx
   443cf:	48 83 fb 08          	cmp    $0x8,%rbx
   443d3:	75 de                	jne    443b3 <program_image::program_number(char const*)+0x13>
    return -1;
   443d5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
   443da:	5b                   	pop    %rbx
   443db:	41 5c                	pop    %r12
   443dd:	5d                   	pop    %rbp
   443de:	c3                   	ret
            return i;
   443df:	89 d8                	mov    %ebx,%eax
   443e1:	eb f7                	jmp    443da <program_image::program_number(char const*)+0x3a>
   443e3:	90                   	nop

00000000000443e4 <program_image::program_image(char const*)>:
program_image::program_image(const char* program_name)
   443e4:	f3 0f 1e fa          	endbr64
   443e8:	55                   	push   %rbp
   443e9:	48 89 e5             	mov    %rsp,%rbp
   443ec:	53                   	push   %rbx
   443ed:	48 83 ec 08          	sub    $0x8,%rsp
   443f1:	48 89 fb             	mov    %rdi,%rbx
   443f4:	48 89 f7             	mov    %rsi,%rdi
    : program_image(program_number(program_name)) {
   443f7:	e8 a4 ff ff ff       	call   443a0 <program_image::program_number(char const*)>
   443fc:	89 c6                	mov    %eax,%esi
   443fe:	48 89 df             	mov    %rbx,%rdi
   44401:	e8 52 ff ff ff       	call   44358 <program_image::program_image(int)>
}
   44406:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
   4440a:	c9                   	leave
   4440b:	c3                   	ret

000000000004440c <program_image::entry() const>:
uintptr_t program_image::entry() const {
   4440c:	f3 0f 1e fa          	endbr64
    return elf_ ? elf_->e_entry : 0;
   44410:	48 8b 17             	mov    (%rdi),%rdx
   44413:	b8 00 00 00 00       	mov    $0x0,%eax
   44418:	48 85 d2             	test   %rdx,%rdx
   4441b:	74 04                	je     44421 <program_image::entry() const+0x15>
   4441d:	48 8b 42 18          	mov    0x18(%rdx),%rax
}
   44421:	c3                   	ret

0000000000044422 <program_image::empty() const>:
bool program_image::empty() const {
   44422:	f3 0f 1e fa          	endbr64
    return !elf_ || elf_->e_phnum == 0;
   44426:	48 8b 17             	mov    (%rdi),%rdx
   44429:	b8 01 00 00 00       	mov    $0x1,%eax
   4442e:	48 85 d2             	test   %rdx,%rdx
   44431:	74 08                	je     4443b <program_image::empty() const+0x19>
   44433:	66 83 7a 38 00       	cmpw   $0x0,0x38(%rdx)
   44438:	0f 94 c0             	sete   %al
}
   4443b:	c3                   	ret

000000000004443c <program_image_segment::program_image_segment(elf_program*, elf_header*)>:
program_image_segment::program_image_segment(elf_program* ph, elf_header* elf)
   4443c:	f3 0f 1e fa          	endbr64
    : ph_(ph), elf_(elf) {
   44440:	48 89 37             	mov    %rsi,(%rdi)
   44443:	48 89 57 08          	mov    %rdx,0x8(%rdi)
    if (elf) {
   44447:	48 85 d2             	test   %rdx,%rdx
   4444a:	74 1a                	je     44466 <program_image_segment::program_image_segment(elf_program*, elf_header*)+0x2a>
        return ph + (end ? elf->e_phnum : 0);
   4444c:	0f b7 4a 38          	movzwl 0x38(%rdx),%ecx
   44450:	48 8d 04 cd 00 00 00 	lea    0x0(,%rcx,8),%rax
   44457:	00 
   44458:	48 29 c8             	sub    %rcx,%rax
   4445b:	48 8d 04 c2          	lea    (%rdx,%rax,8),%rax
   4445f:	48 03 42 20          	add    0x20(%rdx),%rax
   44463:	48 89 c2             	mov    %rax,%rdx
    while (ph_ != eph && ph_->p_type != ELF_PTYPE_LOAD) {
   44466:	48 39 d6             	cmp    %rdx,%rsi
   44469:	74 12                	je     4447d <program_image_segment::program_image_segment(elf_program*, elf_header*)+0x41>
   4446b:	83 3e 01             	cmpl   $0x1,(%rsi)
   4446e:	74 0c                	je     4447c <program_image_segment::program_image_segment(elf_program*, elf_header*)+0x40>
        ++ph_;
   44470:	48 83 c6 38          	add    $0x38,%rsi
   44474:	48 89 37             	mov    %rsi,(%rdi)
    while (ph_ != eph && ph_->p_type != ELF_PTYPE_LOAD) {
   44477:	48 39 d6             	cmp    %rdx,%rsi
   4447a:	75 ef                	jne    4446b <program_image_segment::program_image_segment(elf_program*, elf_header*)+0x2f>
}
   4447c:	c3                   	ret
   4447d:	c3                   	ret

000000000004447e <program_image::begin() const>:
program_image_segment program_image::begin() const {
   4447e:	f3 0f 1e fa          	endbr64
   44482:	55                   	push   %rbp
   44483:	48 89 e5             	mov    %rsp,%rbp
   44486:	48 83 ec 10          	sub    $0x10,%rsp
    return program_image_segment(elf_header_program(elf_, false), elf_);
   4448a:	48 8b 17             	mov    (%rdi),%rdx
    if (elf) {
   4448d:	48 85 d2             	test   %rdx,%rdx
   44490:	74 1a                	je     444ac <program_image::begin() const+0x2e>
        return ph + (end ? elf->e_phnum : 0);
   44492:	48 89 d6             	mov    %rdx,%rsi
   44495:	48 03 72 20          	add    0x20(%rdx),%rsi
    return program_image_segment(elf_header_program(elf_, false), elf_);
   44499:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
   4449d:	e8 9a ff ff ff       	call   4443c <program_image_segment::program_image_segment(elf_program*, elf_header*)>
}
   444a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   444a6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   444aa:	c9                   	leave
   444ab:	c3                   	ret
        return nullptr;
   444ac:	48 89 d6             	mov    %rdx,%rsi
   444af:	eb e8                	jmp    44499 <program_image::begin() const+0x1b>
   444b1:	90                   	nop

00000000000444b2 <program_image::end() const>:
program_image_segment program_image::end() const {
   444b2:	f3 0f 1e fa          	endbr64
   444b6:	55                   	push   %rbp
   444b7:	48 89 e5             	mov    %rsp,%rbp
   444ba:	48 83 ec 10          	sub    $0x10,%rsp
    return program_image_segment(elf_header_program(elf_, true), elf_);
   444be:	48 8b 17             	mov    (%rdi),%rdx
    if (elf) {
   444c1:	48 85 d2             	test   %rdx,%rdx
   444c4:	74 2a                	je     444f0 <program_image::end() const+0x3e>
        return ph + (end ? elf->e_phnum : 0);
   444c6:	0f b7 4a 38          	movzwl 0x38(%rdx),%ecx
   444ca:	48 8d 04 cd 00 00 00 	lea    0x0(,%rcx,8),%rax
   444d1:	00 
   444d2:	48 29 c8             	sub    %rcx,%rax
   444d5:	48 8d 34 c2          	lea    (%rdx,%rax,8),%rsi
   444d9:	48 03 72 20          	add    0x20(%rdx),%rsi
    return program_image_segment(elf_header_program(elf_, true), elf_);
   444dd:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
   444e1:	e8 56 ff ff ff       	call   4443c <program_image_segment::program_image_segment(elf_program*, elf_header*)>
}
   444e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
   444ea:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
   444ee:	c9                   	leave
   444ef:	c3                   	ret
        return nullptr;
   444f0:	48 89 d6             	mov    %rdx,%rsi
   444f3:	eb e8                	jmp    444dd <program_image::end() const+0x2b>
   444f5:	90                   	nop

00000000000444f6 <program_image_segment::va() const>:
uintptr_t program_image_segment::va() const {
   444f6:	f3 0f 1e fa          	endbr64
    return ph_->p_va;
   444fa:	48 8b 07             	mov    (%rdi),%rax
   444fd:	48 8b 40 10          	mov    0x10(%rax),%rax
}
   44501:	c3                   	ret

0000000000044502 <program_image_segment::size() const>:
size_t program_image_segment::size() const {
   44502:	f3 0f 1e fa          	endbr64
    return ph_->p_memsz;
   44506:	48 8b 07             	mov    (%rdi),%rax
   44509:	48 8b 40 28          	mov    0x28(%rax),%rax
}
   4450d:	c3                   	ret

000000000004450e <program_image_segment::data() const>:
const char* program_image_segment::data() const {
   4450e:	f3 0f 1e fa          	endbr64
    return (const char*) elf_ + ph_->p_offset;
   44512:	48 8b 07             	mov    (%rdi),%rax
   44515:	48 8b 40 08          	mov    0x8(%rax),%rax
   44519:	48 03 47 08          	add    0x8(%rdi),%rax
}
   4451d:	c3                   	ret

000000000004451e <program_image_segment::data_size() const>:
size_t program_image_segment::data_size() const {
   4451e:	f3 0f 1e fa          	endbr64
    return ph_->p_filesz;
   44522:	48 8b 07             	mov    (%rdi),%rax
   44525:	48 8b 40 20          	mov    0x20(%rax),%rax
}
   44529:	c3                   	ret

000000000004452a <program_image_segment::writable() const>:
bool program_image_segment::writable() const {
   4452a:	f3 0f 1e fa          	endbr64
    return ph_->p_flags & ELF_PFLAG_WRITE;
   4452e:	48 8b 07             	mov    (%rdi),%rax
   44531:	8b 40 04             	mov    0x4(%rax),%eax
   44534:	d1 e8                	shr    $1,%eax
   44536:	83 e0 01             	and    $0x1,%eax
}
   44539:	c3                   	ret

000000000004453a <program_image_segment::operator!=(program_image_segment const&) const>:
bool program_image_segment::operator!=(const program_image_segment& x) const {
   4453a:	f3 0f 1e fa          	endbr64
    return ph_ != x.ph_;
   4453e:	48 8b 06             	mov    (%rsi),%rax
   44541:	48 39 07             	cmp    %rax,(%rdi)
   44544:	0f 95 c0             	setne  %al
}
   44547:	c3                   	ret

0000000000044548 <program_image_segment::operator++()>:
void program_image_segment::operator++() {
   44548:	f3 0f 1e fa          	endbr64
    assert(ph_ != elf_header_program(elf_, true));
   4454c:	48 8b 07             	mov    (%rdi),%rax
   4454f:	48 8b 57 08          	mov    0x8(%rdi),%rdx
    if (elf) {
   44553:	48 85 d2             	test   %rdx,%rdx
   44556:	74 73                	je     445cb <program_image_segment::operator++()+0x83>
        return ph + (end ? elf->e_phnum : 0);
   44558:	0f b7 72 38          	movzwl 0x38(%rdx),%esi
   4455c:	48 8d 0c f5 00 00 00 	lea    0x0(,%rsi,8),%rcx
   44563:	00 
   44564:	48 29 f1             	sub    %rsi,%rcx
   44567:	48 8d 0c ca          	lea    (%rdx,%rcx,8),%rcx
   4456b:	48 03 4a 20          	add    0x20(%rdx),%rcx
    assert(ph_ != elf_header_program(elf_, true));
   4456f:	48 39 c8             	cmp    %rcx,%rax
   44572:	74 38                	je     445ac <program_image_segment::operator++()+0x64>
    ++ph_;
   44574:	48 83 c0 38          	add    $0x38,%rax
   44578:	48 89 07             	mov    %rax,(%rdi)
        return ph + (end ? elf->e_phnum : 0);
   4457b:	0f b7 72 38          	movzwl 0x38(%rdx),%esi
   4457f:	48 8d 0c f5 00 00 00 	lea    0x0(,%rsi,8),%rcx
   44586:	00 
   44587:	48 29 f1             	sub    %rsi,%rcx
   4458a:	48 8d 0c ca          	lea    (%rdx,%rcx,8),%rcx
   4458e:	48 03 4a 20          	add    0x20(%rdx),%rcx
   44592:	48 89 ca             	mov    %rcx,%rdx
    while (ph_ != eph && ph_->p_type != ELF_PTYPE_LOAD) {
   44595:	48 39 c1             	cmp    %rax,%rcx
   44598:	74 30                	je     445ca <program_image_segment::operator++()+0x82>
   4459a:	83 38 01             	cmpl   $0x1,(%rax)
   4459d:	74 2a                	je     445c9 <program_image_segment::operator++()+0x81>
        ++ph_;
   4459f:	48 83 c0 38          	add    $0x38,%rax
   445a3:	48 89 07             	mov    %rax,(%rdi)
    while (ph_ != eph && ph_->p_type != ELF_PTYPE_LOAD) {
   445a6:	48 39 c2             	cmp    %rax,%rdx
   445a9:	75 ef                	jne    4459a <program_image_segment::operator++()+0x52>
   445ab:	c3                   	ret
void program_image_segment::operator++() {
   445ac:	55                   	push   %rbp
   445ad:	48 89 e5             	mov    %rsp,%rbp
    assert(ph_ != elf_header_program(elf_, true));
   445b0:	b9 00 00 00 00       	mov    $0x0,%ecx
   445b5:	ba 48 68 04 00       	mov    $0x46848,%edx
   445ba:	be 75 04 00 00       	mov    $0x475,%esi
   445bf:	bf b7 60 04 00       	mov    $0x460b7,%edi
   445c4:	e8 f4 f0 ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
   445c9:	c3                   	ret
   445ca:	c3                   	ret
   445cb:	48 85 c0             	test   %rax,%rax
   445ce:	74 dc                	je     445ac <program_image_segment::operator++()+0x64>
    ++ph_;
   445d0:	48 83 c0 38          	add    $0x38,%rax
   445d4:	48 89 07             	mov    %rax,(%rdi)
    while (ph_ != eph && ph_->p_type != ELF_PTYPE_LOAD) {
   445d7:	eb c1                	jmp    4459a <program_image_segment::operator++()+0x52>
   445d9:	90                   	nop

00000000000445da <(anonymous namespace)::error_printer::putc(unsigned char)>:
    void putc(unsigned char c) override {
   445da:	f3 0f 1e fa          	endbr64
   445de:	55                   	push   %rbp
   445df:	48 89 e5             	mov    %rsp,%rbp
   445e2:	41 54                	push   %r12
   445e4:	53                   	push   %rbx
   445e5:	49 89 fc             	mov    %rdi,%r12
        parallel_port_putc(c);
   445e8:	40 0f b6 de          	movzbl %sil,%ebx
   445ec:	89 df                	mov    %ebx,%edi
   445ee:	e8 81 e2 ff ff       	call   42874 <parallel_port_putc(unsigned char)>
        console_printer::putc(c);
   445f3:	89 de                	mov    %ebx,%esi
   445f5:	4c 89 e7             	mov    %r12,%rdi
   445f8:	e8 15 17 00 00       	call   45d12 <console_printer::putc(unsigned char)>
    }
   445fd:	5b                   	pop    %rbx
   445fe:	41 5c                	pop    %r12
   44600:	5d                   	pop    %rbp
   44601:	c3                   	ret

0000000000044602 <memusage::refresh()>:

// memusage::refresh()
//    Calculate the current physical usage map, using the current process
//    table.

void memusage::refresh() {
   44602:	f3 0f 1e fa          	endbr64
   44606:	55                   	push   %rbp
   44607:	48 89 e5             	mov    %rsp,%rbp
   4460a:	41 57                	push   %r15
   4460c:	41 56                	push   %r14
   4460e:	41 55                	push   %r13
   44610:	41 54                	push   %r12
   44612:	53                   	push   %rbx
   44613:	48 83 ec 38          	sub    $0x38,%rsp
   44617:	49 89 ff             	mov    %rdi,%r15
    if (!v_) {
   4461a:	48 83 3f 00          	cmpq   $0x0,(%rdi)
   4461e:	74 32                	je     44652 <memusage::refresh()+0x50>
        v_ = reinterpret_cast<unsigned*>(kalloc(PAGESIZE));
        assert(v_ != nullptr);
    }

    memset(v_, 0, (maxpa / PAGESIZE) * sizeof(*v_));
   44620:	49 8b 3f             	mov    (%r15),%rdi
   44623:	ba 00 10 00 00       	mov    $0x1000,%edx
   44628:	be 00 00 00 00       	mov    $0x0,%esi
   4462d:	e8 80 0b 00 00       	call   451b2 <memset>

    // mark kernel page tables
    for (ptiter it(kernel_pagetable); !it.done(); it.next()) {
   44632:	be 00 60 06 00       	mov    $0x66000,%esi
   44637:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   4463b:	e8 0a e2 ff ff       	call   4284a <ptiter::ptiter(x86_64_pagetable*)>
   44640:	83 7d c0 40          	cmpl   $0x40,-0x40(%rbp)
   44644:	74 6d                	je     446b3 <memusage::refresh()+0xb1>
    return *pep_ & PTE_PAMASK;
   44646:	48 bb 00 f0 ff ff ff 	movabs $0xffffffffff000,%rbx
   4464d:	ff 0f 00 
   44650:	eb 3f                	jmp    44691 <memusage::refresh()+0x8f>
        v_ = reinterpret_cast<unsigned*>(kalloc(PAGESIZE));
   44652:	bf 00 10 00 00       	mov    $0x1000,%edi
   44657:	e8 0a c5 ff ff       	call   40b66 <kalloc(unsigned long)>
   4465c:	49 89 07             	mov    %rax,(%r15)
        assert(v_ != nullptr);
   4465f:	48 85 c0             	test   %rax,%rax
   44662:	75 bc                	jne    44620 <memusage::refresh()+0x1e>
   44664:	b9 00 00 00 00       	mov    $0x0,%ecx
   44669:	ba d4 61 04 00       	mov    $0x461d4,%edx
   4466e:	be 53 00 00 00       	mov    $0x53,%esi
   44673:	bf e2 61 04 00       	mov    $0x461e2,%edi
   44678:	e8 40 f0 ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
    down(true);
   4467d:	be 01 00 00 00       	mov    $0x1,%esi
   44682:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   44686:	e8 95 e0 ff ff       	call   42720 <ptiter::down(bool)>
    for (ptiter it(kernel_pagetable); !it.done(); it.next()) {
   4468b:	83 7d c0 40          	cmpl   $0x40,-0x40(%rbp)
   4468f:	74 22                	je     446b3 <memusage::refresh()+0xb1>
    return *pep_ & PTE_PAMASK;
   44691:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   44695:	48 89 d9             	mov    %rbx,%rcx
   44698:	48 23 08             	and    (%rax),%rcx
   4469b:	48 89 c8             	mov    %rcx,%rax
        if (pa < maxpa) {
   4469e:	48 81 f9 ff ff 3f 00 	cmp    $0x3fffff,%rcx
   446a5:	77 d6                	ja     4467d <memusage::refresh()+0x7b>
            v_[pa / PAGESIZE] |= flags;
   446a7:	48 c1 e8 0a          	shr    $0xa,%rax
   446ab:	49 03 07             	add    (%r15),%rax
   446ae:	83 08 01             	orl    $0x1,(%rax)
   446b1:	eb ca                	jmp    4467d <memusage::refresh()+0x7b>
    return reinterpret_cast<uint64_t>(kptr);
   446b3:	b8 00 60 06 00       	mov    $0x66000,%eax
        if (pa < maxpa) {
   446b8:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
   446be:	77 0b                	ja     446cb <memusage::refresh()+0xc9>
            v_[pa / PAGESIZE] |= flags;
   446c0:	48 c1 e8 0c          	shr    $0xc,%rax
   446c4:	49 8b 17             	mov    (%r15),%rdx
   446c7:	83 0c 82 01          	orl    $0x1,(%rdx,%rax,4)
        mark(it.pa(), f_kernel);
    }
    mark(kptr2pa(kernel_pagetable), f_kernel);
    mark(kptr2pa(v_), f_kernel);
   446cb:	49 8b 07             	mov    (%r15),%rax
        if (pa < maxpa) {
   446ce:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
   446d4:	77 0b                	ja     446e1 <memusage::refresh()+0xdf>
            v_[pa / PAGESIZE] |= flags;
   446d6:	48 89 c2             	mov    %rax,%rdx
   446d9:	48 c1 ea 0c          	shr    $0xc,%rdx
   446dd:	83 0c 90 01          	orl    $0x1,(%rax,%rdx,4)

    // mark pages accessible from each process's page table
    separate_tables_ = false;
   446e1:	41 c6 47 0c 00       	movb   $0x0,0xc(%r15)
    for (int pid = 1; pid < PID_MAX; ++pid) {
   446e6:	41 bc f8 42 06 00    	mov    $0x642f8,%r12d
   446ec:	bb 01 00 00 00       	mov    $0x1,%ebx
        if (p->state != P_FREE
            && p->pagetable
            && p->pagetable != kernel_pagetable) {
            separate_tables_ = true;

            for (ptiter it(p); it.va() < VA_LOWEND; it.next()) {
   446f1:	49 bd ff ff ff ff ff 	movabs $0x7fffffffffff,%r13
   446f8:	7f 00 00 
   446fb:	e9 66 01 00 00       	jmp    44866 <memusage::refresh()+0x264>
            return 0;
   44700:	c7 45 ac 00 00 00 00 	movl   $0x0,-0x54(%rbp)
   44707:	e9 79 01 00 00       	jmp    44885 <memusage::refresh()+0x283>
    down(true);
   4470c:	be 01 00 00 00       	mov    $0x1,%esi
   44711:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   44715:	e8 06 e0 ff ff       	call   42720 <ptiter::down(bool)>
    return ~(~uintptr_t(0) << lbits);
   4471a:	8b 4d c0             	mov    -0x40(%rbp),%ecx
   4471d:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   44724:	48 d3 e0             	shl    %cl,%rax
    return va_ & ~vmiter::lbits_mask(lbits_);
   44727:	48 23 45 c8          	and    -0x38(%rbp),%rax
            for (ptiter it(p); it.va() < VA_LOWEND; it.next()) {
   4472b:	49 39 c5             	cmp    %rax,%r13
   4472e:	0f 82 8c 01 00 00    	jb     448c0 <memusage::refresh()+0x2be>
    return *pep_ & PTE_PAMASK;
   44734:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   44738:	48 bf 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdi
   4473f:	ff 0f 00 
   44742:	48 23 38             	and    (%rax),%rdi
   44745:	48 89 f8             	mov    %rdi,%rax
        if (pa < maxpa) {
   44748:	48 81 ff ff ff 3f 00 	cmp    $0x3fffff,%rdi
   4474f:	77 bb                	ja     4470c <memusage::refresh()+0x10a>
            v_[pa / PAGESIZE] |= flags;
   44751:	48 c1 e8 0a          	shr    $0xa,%rax
   44755:	49 03 07             	add    (%r15),%rax
   44758:	8b 55 ac             	mov    -0x54(%rbp),%edx
   4475b:	0b 10                	or     (%rax),%edx
   4475d:	83 ca 01             	or     $0x1,%edx
   44760:	89 10                	mov    %edx,(%rax)
   44762:	eb a8                	jmp    4470c <memusage::refresh()+0x10a>
        if (pa < maxpa) {
   44764:	48 81 ff ff ff 3f 00 	cmp    $0x3fffff,%rdi
   4476b:	77 15                	ja     44782 <memusage::refresh()+0x180>
            v_[pa / PAGESIZE] |= flags;
   4476d:	48 c1 ef 0c          	shr    $0xc,%rdi
   44771:	49 8b 07             	mov    (%r15),%rax
   44774:	48 8d 14 b8          	lea    (%rax,%rdi,4),%rdx
   44778:	8b 45 ac             	mov    -0x54(%rbp),%eax
   4477b:	0b 02                	or     (%rdx),%eax
   4477d:	83 c8 02             	or     $0x2,%eax
   44780:	89 02                	mov    %eax,(%rdx)
                    if (it.va() == it.pa()) {
                        mark(it.pa(), f_user | pidflag);
                    } else {
                        mark(it.pa(), f_user | f_nonidentity | pidflag);
                    }
                    it.next();
   44782:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   44786:	e8 75 dc ff ff       	call   42400 <vmiter::next()>
    return va_;
   4478b:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
            for (vmiter it(p, 0); it.va() < VA_LOWEND; ) {
   4478f:	49 39 fd             	cmp    %rdi,%r13
   44792:	0f 82 bb 00 00 00    	jb     44853 <memusage::refresh()+0x251>
    uint64_t ph = *pep_ & perm_;
   44798:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   4479c:	48 8b 30             	mov    (%rax),%rsi
   4479f:	48 63 55 c4          	movslq -0x3c(%rbp),%rdx
   447a3:	48 21 f2             	and    %rsi,%rdx
    return ph & -(ph & PTE_P);
   447a6:	48 89 d0             	mov    %rdx,%rax
   447a9:	83 e0 01             	and    $0x1,%eax
   447ac:	48 f7 d8             	neg    %rax
   447af:	48 21 d0             	and    %rdx,%rax
                if (it.user()) {
   447b2:	48 f7 d0             	not    %rax
   447b5:	a8 05                	test   $0x5,%al
   447b7:	75 61                	jne    4481a <memusage::refresh()+0x218>
    if (*pep_ & PTE_P) {
   447b9:	40 f6 c6 01          	test   $0x1,%sil
   447bd:	74 c3                	je     44782 <memusage::refresh()+0x180>
        if (lbits_ > PAGEOFFBITS) {
   447bf:	8b 4d c0             	mov    -0x40(%rbp),%ecx
            pa &= ~0x1000UL;
   447c2:	48 89 f0             	mov    %rsi,%rax
   447c5:	4c 21 f0             	and    %r14,%rax
        uintptr_t pa = *pep_ & PTE_PAMASK;
   447c8:	48 ba 00 f0 ff ff ff 	movabs $0xffffffffff000,%rdx
   447cf:	ff 0f 00 
   447d2:	48 21 f2             	and    %rsi,%rdx
   447d5:	83 f9 0c             	cmp    $0xc,%ecx
   447d8:	48 0f 4f d0          	cmovg  %rax,%rdx
    return ~(~uintptr_t(0) << lbits);
   447dc:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   447e3:	48 d3 e0             	shl    %cl,%rax
   447e6:	48 f7 d0             	not    %rax
        return pa + (va_ & lbits_mask(lbits_));
   447e9:	48 21 f8             	and    %rdi,%rax
   447ec:	48 01 d0             	add    %rdx,%rax
                    if (it.va() == it.pa()) {
   447ef:	48 39 f8             	cmp    %rdi,%rax
   447f2:	0f 84 6c ff ff ff    	je     44764 <memusage::refresh()+0x162>
        if (pa < maxpa) {
   447f8:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
   447fe:	77 82                	ja     44782 <memusage::refresh()+0x180>
            v_[pa / PAGESIZE] |= flags;
   44800:	48 c1 e8 0c          	shr    $0xc,%rax
   44804:	49 8b 17             	mov    (%r15),%rdx
   44807:	48 8d 14 82          	lea    (%rdx,%rax,4),%rdx
   4480b:	8b 45 ac             	mov    -0x54(%rbp),%eax
   4480e:	0b 02                	or     (%rdx),%eax
   44810:	83 c8 06             	or     $0x6,%eax
   44813:	89 02                	mov    %eax,(%rdx)
   44815:	e9 68 ff ff ff       	jmp    44782 <memusage::refresh()+0x180>
    if (lbits_ == noncanonical_lbits) {
   4481a:	8b 4d c0             	mov    -0x40(%rbp),%ecx
        return VA_HIGHMIN;
   4481d:	48 be 00 00 00 00 00 	movabs $0xffff800000000000,%rsi
   44824:	80 ff ff 
    if (lbits_ == noncanonical_lbits) {
   44827:	83 f9 2f             	cmp    $0x2f,%ecx
   4482a:	74 14                	je     44840 <memusage::refresh()+0x23e>
    return ~(~uintptr_t(0) << lbits);
   4482c:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
   44833:	48 d3 e6             	shl    %cl,%rsi
   44836:	48 f7 d6             	not    %rsi
        return (va_ | lbits_mask(lbits_)) + 1;
   44839:	48 09 fe             	or     %rdi,%rsi
   4483c:	48 83 c6 01          	add    $0x1,%rsi
    real_find(last_va(), true);
   44840:	ba 01 00 00 00       	mov    $0x1,%edx
   44845:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   44849:	e8 d8 da ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
}
   4484e:	e9 38 ff ff ff       	jmp    4478b <memusage::refresh()+0x189>
    for (int pid = 1; pid < PID_MAX; ++pid) {
   44853:	83 c3 01             	add    $0x1,%ebx
   44856:	49 81 c4 d8 00 00 00 	add    $0xd8,%r12
   4485d:	83 fb 10             	cmp    $0x10,%ebx
   44860:	0f 84 ca 00 00 00    	je     44930 <memusage::refresh()+0x32e>
        } else if (pid >= 1) {
   44866:	85 db                	test   %ebx,%ebx
   44868:	0f 8e 4d 02 00 00    	jle    44abb <memusage::refresh()+0x4b9>
        if (p->state != P_FREE
   4486e:	4d 89 e6             	mov    %r12,%r14
   44871:	41 83 7c 24 0c 00    	cmpl   $0x0,0xc(%r12)
   44877:	74 da                	je     44853 <memusage::refresh()+0x251>
            return 4U << pid;
   44879:	b8 04 00 00 00       	mov    $0x4,%eax
   4487e:	89 d9                	mov    %ebx,%ecx
   44880:	d3 e0                	shl    %cl,%eax
   44882:	89 45 ac             	mov    %eax,-0x54(%rbp)
            && p->pagetable
   44885:	49 8b 06             	mov    (%r14),%rax
            && p->pagetable != kernel_pagetable) {
   44888:	48 85 c0             	test   %rax,%rax
   4488b:	74 c6                	je     44853 <memusage::refresh()+0x251>
   4488d:	48 3d 00 60 06 00    	cmp    $0x66000,%rax
   44893:	74 be                	je     44853 <memusage::refresh()+0x251>
            separate_tables_ = true;
   44895:	41 c6 47 0c 01       	movb   $0x1,0xc(%r15)
    : ptiter(p->pagetable) {
   4489a:	49 8b 36             	mov    (%r14),%rsi
   4489d:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   448a1:	e8 a4 df ff ff       	call   4284a <ptiter::ptiter(x86_64_pagetable*)>
    return ~(~uintptr_t(0) << lbits);
   448a6:	8b 4d c0             	mov    -0x40(%rbp),%ecx
   448a9:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   448b0:	48 d3 e0             	shl    %cl,%rax
    return va_ & ~vmiter::lbits_mask(lbits_);
   448b3:	48 23 45 c8          	and    -0x38(%rbp),%rax
            for (ptiter it(p); it.va() < VA_LOWEND; it.next()) {
   448b7:	49 39 c5             	cmp    %rax,%r13
   448ba:	0f 83 74 fe ff ff    	jae    44734 <memusage::refresh()+0x132>
   448c0:	49 8b 06             	mov    (%r14),%rax
        if (pa < maxpa) {
   448c3:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
   448c9:	77 15                	ja     448e0 <memusage::refresh()+0x2de>
            v_[pa / PAGESIZE] |= flags;
   448cb:	48 c1 e8 0c          	shr    $0xc,%rax
   448cf:	49 8b 17             	mov    (%r15),%rdx
   448d2:	48 8d 14 82          	lea    (%rdx,%rax,4),%rdx
   448d6:	8b 45 ac             	mov    -0x54(%rbp),%eax
   448d9:	0b 02                	or     (%rdx),%eax
   448db:	83 c8 01             	or     $0x1,%eax
   448de:	89 02                	mov    %eax,(%rdx)
    : vmiter(p->pagetable, va) {
   448e0:	49 8b 06             	mov    (%r14),%rax
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   448e3:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   448e7:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
   448eb:	c7 45 c0 27 00 00 00 	movl   $0x27,-0x40(%rbp)
      perm_(initial_perm), va_(0) {
   448f2:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   448f9:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   44900:	00 
    real_find(va, false);
   44901:	ba 00 00 00 00       	mov    $0x0,%edx
   44906:	be 00 00 00 00       	mov    $0x0,%esi
   4490b:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   4490f:	e8 12 da ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    return va_;
   44914:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
            for (vmiter it(p, 0); it.va() < VA_LOWEND; ) {
   44918:	49 39 fd             	cmp    %rdi,%r13
   4491b:	0f 82 32 ff ff ff    	jb     44853 <memusage::refresh()+0x251>
            pa &= ~0x1000UL;
   44921:	49 be 00 e0 ff ff ff 	movabs $0xfffffffffe000,%r14
   44928:	ff 0f 00 
   4492b:	e9 68 fe ff ff       	jmp    44798 <memusage::refresh()+0x196>
            }
        }
    }

    // if no different process page tables, use physical address instead
    if (!separate_tables_) {
   44930:	41 80 7f 0c 00       	cmpb   $0x0,0xc(%r15)
   44935:	74 0f                	je     44946 <memusage::refresh()+0x344>
            } else {
                it.next_range();
            }
        }
    }
}
   44937:	48 83 c4 38          	add    $0x38,%rsp
   4493b:	5b                   	pop    %rbx
   4493c:	41 5c                	pop    %r12
   4493e:	41 5d                	pop    %r13
   44940:	41 5e                	pop    %r14
   44942:	41 5f                	pop    %r15
   44944:	5d                   	pop    %rbp
   44945:	c3                   	ret
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   44946:	48 c7 45 b0 00 60 06 	movq   $0x66000,-0x50(%rbp)
   4494d:	00 
   4494e:	48 c7 45 b8 00 60 06 	movq   $0x66000,-0x48(%rbp)
   44955:	00 
   44956:	c7 45 c0 27 00 00 00 	movl   $0x27,-0x40(%rbp)
      perm_(initial_perm), va_(0) {
   4495d:	c7 45 c4 ff 0f 00 00 	movl   $0xfff,-0x3c(%rbp)
   44964:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
   4496b:	00 
    real_find(va, false);
   4496c:	ba 00 00 00 00       	mov    $0x0,%edx
   44971:	be 00 00 00 00       	mov    $0x0,%esi
   44976:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   4497a:	e8 a7 d9 ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    return va_;
   4497f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
        for (vmiter it(kernel_pagetable, 0); it.va() < VA_LOWEND; ) {
   44983:	48 89 d0             	mov    %rdx,%rax
   44986:	48 c1 e8 2f          	shr    $0x2f,%rax
   4498a:	75 ab                	jne    44937 <memusage::refresh()+0x335>
        return VA_HIGHMIN;
   4498c:	49 bc 00 00 00 00 00 	movabs $0xffff800000000000,%r12
   44993:	80 ff ff 
            pa &= ~0x1000UL;
   44996:	49 be 00 e0 ff ff ff 	movabs $0xfffffffffe000,%r14
   4499d:	ff 0f 00 
        uintptr_t pa = *pep_ & PTE_PAMASK;
   449a0:	49 bd 00 f0 ff ff ff 	movabs $0xffffffffff000,%r13
   449a7:	ff 0f 00 
   449aa:	48 bb ff ff ff ff ff 	movabs $0x7fffffffffff,%rbx
   449b1:	7f 00 00 
   449b4:	eb 6c                	jmp    44a22 <memusage::refresh()+0x420>
    return ~(~uintptr_t(0) << lbits);
   449b6:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   449bd:	48 d3 e0             	shl    %cl,%rax
   449c0:	48 f7 d0             	not    %rax
        return pa + (va_ & lbits_mask(lbits_));
   449c3:	48 21 d0             	and    %rdx,%rax
            pa &= ~0x1000UL;
   449c6:	4c 21 f6             	and    %r14,%rsi
        return pa + (va_ & lbits_mask(lbits_));
   449c9:	48 01 f0             	add    %rsi,%rax
                && it.pa() < MEMSIZE_PHYSICAL
   449cc:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   449d2:	77 14                	ja     449e8 <memusage::refresh()+0x3e6>
                && physpages[it.pa() / PAGESIZE].used()) {
   449d4:	48 89 c6             	mov    %rax,%rsi
   449d7:	48 c1 ee 0c          	shr    $0xc,%rsi
   449db:	80 be 00 40 06 00 00 	cmpb   $0x0,0x64000(%rsi)
   449e2:	0f 85 97 00 00 00    	jne    44a7f <memusage::refresh()+0x47d>
    if (lbits_ == noncanonical_lbits) {
   449e8:	8b 4d c0             	mov    -0x40(%rbp),%ecx
        return VA_HIGHMIN;
   449eb:	4c 89 e6             	mov    %r12,%rsi
    if (lbits_ == noncanonical_lbits) {
   449ee:	83 f9 2f             	cmp    $0x2f,%ecx
   449f1:	74 14                	je     44a07 <memusage::refresh()+0x405>
    return ~(~uintptr_t(0) << lbits);
   449f3:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
   449fa:	48 d3 e6             	shl    %cl,%rsi
   449fd:	48 f7 d6             	not    %rsi
        return (va_ | lbits_mask(lbits_)) + 1;
   44a00:	48 09 d6             	or     %rdx,%rsi
   44a03:	48 83 c6 01          	add    $0x1,%rsi
    real_find(last_va(), true);
   44a07:	ba 01 00 00 00       	mov    $0x1,%edx
   44a0c:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   44a10:	e8 11 d9 ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    return va_;
   44a15:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
        for (vmiter it(kernel_pagetable, 0); it.va() < VA_LOWEND; ) {
   44a19:	48 39 d3             	cmp    %rdx,%rbx
   44a1c:	0f 82 15 ff ff ff    	jb     44937 <memusage::refresh()+0x335>
    uint64_t ph = *pep_ & perm_;
   44a22:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
   44a26:	48 8b 30             	mov    (%rax),%rsi
   44a29:	48 63 4d c4          	movslq -0x3c(%rbp),%rcx
   44a2d:	48 21 f1             	and    %rsi,%rcx
    return ph & -(ph & PTE_P);
   44a30:	48 89 c8             	mov    %rcx,%rax
   44a33:	83 e0 01             	and    $0x1,%eax
   44a36:	48 f7 d8             	neg    %rax
   44a39:	48 21 c8             	and    %rcx,%rax
                && physpages[it.pa() / PAGESIZE].used()) {
   44a3c:	48 f7 d0             	not    %rax
   44a3f:	a8 05                	test   $0x5,%al
   44a41:	75 a5                	jne    449e8 <memusage::refresh()+0x3e6>
    if (*pep_ & PTE_P) {
   44a43:	40 f6 c6 01          	test   $0x1,%sil
   44a47:	74 9f                	je     449e8 <memusage::refresh()+0x3e6>
        if (lbits_ > PAGEOFFBITS) {
   44a49:	8b 4d c0             	mov    -0x40(%rbp),%ecx
   44a4c:	83 f9 0c             	cmp    $0xc,%ecx
   44a4f:	0f 8f 61 ff ff ff    	jg     449b6 <memusage::refresh()+0x3b4>
    return ~(~uintptr_t(0) << lbits);
   44a55:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
   44a5c:	48 d3 e0             	shl    %cl,%rax
   44a5f:	48 f7 d0             	not    %rax
        return pa + (va_ & lbits_mask(lbits_));
   44a62:	48 21 d0             	and    %rdx,%rax
        uintptr_t pa = *pep_ & PTE_PAMASK;
   44a65:	4c 21 ee             	and    %r13,%rsi
        return pa + (va_ & lbits_mask(lbits_));
   44a68:	48 01 f0             	add    %rsi,%rax
                && it.pa() < MEMSIZE_PHYSICAL
   44a6b:	48 3d ff ff 1f 00    	cmp    $0x1fffff,%rax
   44a71:	0f 86 5d ff ff ff    	jbe    449d4 <memusage::refresh()+0x3d2>
    if (lbits_ == noncanonical_lbits) {
   44a77:	8b 4d c0             	mov    -0x40(%rbp),%ecx
   44a7a:	e9 74 ff ff ff       	jmp    449f3 <memusage::refresh()+0x3f1>
                unsigned owner = (it.pa() - PROC_START_ADDR) / 0x40000;
   44a7f:	48 2d 00 00 10 00    	sub    $0x100000,%rax
   44a85:	48 c1 e8 12          	shr    $0x12,%rax
            return 0;
   44a89:	ba 00 00 00 00       	mov    $0x0,%edx
        } else if (pid >= 1) {
   44a8e:	83 f8 1b             	cmp    $0x1b,%eax
   44a91:	76 1c                	jbe    44aaf <memusage::refresh()+0x4ad>
            v_[pa / PAGESIZE] |= flags;
   44a93:	49 8b 07             	mov    (%r15),%rax
   44a96:	48 8d 04 b0          	lea    (%rax,%rsi,4),%rax
   44a9a:	0b 10                	or     (%rax),%edx
   44a9c:	83 ca 02             	or     $0x2,%edx
   44a9f:	89 10                	mov    %edx,(%rax)
                it.next();
   44aa1:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   44aa5:	e8 56 d9 ff ff       	call   42400 <vmiter::next()>
   44aaa:	e9 66 ff ff ff       	jmp    44a15 <memusage::refresh()+0x413>
                mark(it.pa(), f_user | f_process(owner + 1));
   44aaf:	8d 48 01             	lea    0x1(%rax),%ecx
            return 4U << pid;
   44ab2:	ba 04 00 00 00       	mov    $0x4,%edx
   44ab7:	d3 e2                	shl    %cl,%edx
   44ab9:	eb d8                	jmp    44a93 <memusage::refresh()+0x491>
        if (p->state != P_FREE
   44abb:	4d 89 e6             	mov    %r12,%r14
   44abe:	41 83 7c 24 0c 00    	cmpl   $0x0,0xc(%r12)
   44ac4:	0f 85 36 fc ff ff    	jne    44700 <memusage::refresh()+0xfe>
    for (int pid = 1; pid < PID_MAX; ++pid) {
   44aca:	83 c3 01             	add    $0x1,%ebx
   44acd:	49 81 c4 d8 00 00 00 	add    $0xd8,%r12
   44ad4:	e9 8d fd ff ff       	jmp    44866 <memusage::refresh()+0x264>
   44ad9:	90                   	nop

0000000000044ada <memusage::page_error(unsigned long, char const*, int) const>:

void memusage::page_error(uintptr_t pa, const char* desc, int pid) const {
   44ada:	f3 0f 1e fa          	endbr64
   44ade:	55                   	push   %rbp
   44adf:	48 89 e5             	mov    %rsp,%rbp
   44ae2:	41 57                	push   %r15
   44ae4:	41 56                	push   %r14
   44ae6:	41 55                	push   %r13
   44ae8:	41 54                	push   %r12
   44aea:	53                   	push   %rbx
   44aeb:	48 83 ec 08          	sub    $0x8,%rsp
   44aef:	49 89 fc             	mov    %rdi,%r12
   44af2:	49 89 f6             	mov    %rsi,%r14
   44af5:	49 89 d7             	mov    %rdx,%r15
   44af8:	89 cb                	mov    %ecx,%ebx
    if (error_sympos_ >= 0 && error_sympos_ < END_CPOS) {
   44afa:	8b 47 10             	mov    0x10(%rdi),%eax
   44afd:	3d cf 07 00 00       	cmp    $0x7cf,%eax
   44b02:	77 0c                	ja     44b10 <memusage::page_error(unsigned long, char const*, int) const+0x36>
        console[error_sympos_] = '*' | 0xF400;
   44b04:	48 98                	cltq
   44b06:	66 c7 84 00 00 80 0b 	movw   $0xf42a,0xb8000(%rax,%rax,1)
   44b0d:	00 2a f4 
    }
    const char* fmt = pid >= 0
        ? "PAGE TABLE ERROR: %lx: %s (pid %d)\n"
   44b10:	85 db                	test   %ebx,%ebx
   44b12:	41 bd f1 61 04 00    	mov    $0x461f1,%r13d
   44b18:	b8 a0 68 04 00       	mov    $0x468a0,%eax
   44b1d:	4c 0f 49 e8          	cmovns %rax,%r13
        : "PAGE TABLE ERROR: %lx: %s\n";
    error_printf(CPOS(22, 0), COLOR_ERROR, fmt, pa, desc, pid);
   44b21:	41 89 d9             	mov    %ebx,%r9d
   44b24:	4d 89 f8             	mov    %r15,%r8
   44b27:	4c 89 f1             	mov    %r14,%rcx
   44b2a:	4c 89 ea             	mov    %r13,%rdx
   44b2d:	be 00 c0 00 00       	mov    $0xc000,%esi
   44b32:	bf e0 06 00 00       	mov    $0x6e0,%edi
   44b37:	b0 00                	mov    $0x0,%al
   44b39:	e8 41 13 00 00       	call   45e7f <error_printf(int, int, char const*, ...)>
    if (nerrors_ < 0xFFFFFFFF) {
   44b3e:	41 8b 44 24 08       	mov    0x8(%r12),%eax
   44b43:	83 f8 ff             	cmp    $0xffffffff,%eax
   44b46:	74 1e                	je     44b66 <memusage::page_error(unsigned long, char const*, int) const+0x8c>
        ++nerrors_;
   44b48:	ff c0                	inc    %eax
   44b4a:	41 89 44 24 08       	mov    %eax,0x8(%r12)
    }
    if (nerrors_ < 10) {
   44b4f:	83 f8 09             	cmp    $0x9,%eax
   44b52:	77 12                	ja     44b66 <memusage::page_error(unsigned long, char const*, int) const+0x8c>
        log_printf(fmt, pa, desc, pid);
   44b54:	89 d9                	mov    %ebx,%ecx
   44b56:	4c 89 fa             	mov    %r15,%rdx
   44b59:	4c 89 f6             	mov    %r14,%rsi
   44b5c:	4c 89 ef             	mov    %r13,%rdi
   44b5f:	b0 00                	mov    $0x0,%al
   44b61:	e8 84 e1 ff ff       	call   42cea <log_printf(char const*, ...)>
    }
}
   44b66:	48 83 c4 08          	add    $0x8,%rsp
   44b6a:	5b                   	pop    %rbx
   44b6b:	41 5c                	pop    %r12
   44b6d:	41 5d                	pop    %r13
   44b6f:	41 5e                	pop    %r14
   44b71:	41 5f                	pop    %r15
   44b73:	5d                   	pop    %rbp
   44b74:	c3                   	ret
   44b75:	90                   	nop

0000000000044b76 <memusage::symbol_at(unsigned long) const>:

uint16_t memusage::symbol_at(uintptr_t pa) const {
   44b76:	f3 0f 1e fa          	endbr64
   44b7a:	55                   	push   %rbp
   44b7b:	48 89 e5             	mov    %rsp,%rbp
   44b7e:	41 57                	push   %r15
   44b80:	41 56                	push   %r14
   44b82:	41 55                	push   %r13
   44b84:	41 54                	push   %r12
   44b86:	53                   	push   %rbx
   44b87:	48 83 ec 18          	sub    $0x18,%rsp
   44b8b:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   44b8f:	48 89 f3             	mov    %rsi,%rbx
    bool is_reserved = reserved_physical_address(pa);
   44b92:	48 89 f7             	mov    %rsi,%rdi
   44b95:	e8 9d de ff ff       	call   42a37 <reserved_physical_address(unsigned long)>
   44b9a:	41 89 c4             	mov    %eax,%r12d
    bool is_kernel = !is_reserved && !allocatable_physical_address(pa);
   44b9d:	41 be 00 00 00 00    	mov    $0x0,%r14d
   44ba3:	84 c0                	test   %al,%al
   44ba5:	74 4c                	je     44bf3 <memusage::symbol_at(unsigned long) const+0x7d>

    unsigned pn = pa / PAGESIZE;
   44ba7:	49 89 dd             	mov    %rbx,%r13
   44baa:	49 c1 ed 0c          	shr    $0xc,%r13
    if (pn < NPAGES && !physpages[pn].valid()) {
   44bae:	41 81 fd ff 01 00 00 	cmp    $0x1ff,%r13d
   44bb5:	77 0c                	ja     44bc3 <memusage::symbol_at(unsigned long) const+0x4d>
        return this->refcount <= PID_MAX;
   44bb7:	44 89 e8             	mov    %r13d,%eax
   44bba:	80 b8 00 40 06 00 10 	cmpb   $0x10,0x64000(%rax)
   44bc1:	77 40                	ja     44c03 <memusage::symbol_at(unsigned long) const+0x8d>
        page_error(pa, "invalid reference count", -1);
    }

    if (pa >= maxpa) {
   44bc3:	48 81 fb ff ff 3f 00 	cmp    $0x3fffff,%rbx
   44bca:	76 4f                	jbe    44c1b <memusage::symbol_at(unsigned long) const+0xa5>
        if (is_kernel) {
            return 'K' | 0x4000;
   44bcc:	b8 4b 40 00 00       	mov    $0x404b,%eax
        if (is_kernel) {
   44bd1:	45 84 f6             	test   %r14b,%r14b
   44bd4:	75 0e                	jne    44be4 <memusage::symbol_at(unsigned long) const+0x6e>
        } else if (is_reserved) {
            return '?' | 0x4000;
   44bd6:	41 80 fc 01          	cmp    $0x1,%r12b
   44bda:	19 c0                	sbb    %eax,%eax
   44bdc:	66 25 00 b0          	and    $0xb000,%ax
   44be0:	66 05 3f 40          	add    $0x403f,%ax
                ch |= names[pid];
            }
            return ch;
        }
    }
}
   44be4:	48 83 c4 18          	add    $0x18,%rsp
   44be8:	5b                   	pop    %rbx
   44be9:	41 5c                	pop    %r12
   44beb:	41 5d                	pop    %r13
   44bed:	41 5e                	pop    %r14
   44bef:	41 5f                	pop    %r15
   44bf1:	5d                   	pop    %rbp
   44bf2:	c3                   	ret
    bool is_kernel = !is_reserved && !allocatable_physical_address(pa);
   44bf3:	48 89 df             	mov    %rbx,%rdi
   44bf6:	e8 5d de ff ff       	call   42a58 <allocatable_physical_address(unsigned long)>
   44bfb:	83 f0 01             	xor    $0x1,%eax
   44bfe:	41 89 c6             	mov    %eax,%r14d
   44c01:	eb a4                	jmp    44ba7 <memusage::symbol_at(unsigned long) const+0x31>
        page_error(pa, "invalid reference count", -1);
   44c03:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
   44c08:	ba 0c 62 04 00       	mov    $0x4620c,%edx
   44c0d:	48 89 de             	mov    %rbx,%rsi
   44c10:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
   44c14:	e8 c1 fe ff ff       	call   44ada <memusage::page_error(unsigned long, char const*, int) const>
   44c19:	eb a8                	jmp    44bc3 <memusage::symbol_at(unsigned long) const+0x4d>
    auto v = v_[pn];
   44c1b:	44 89 e8             	mov    %r13d,%eax
   44c1e:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
   44c22:	48 8b 11             	mov    (%rcx),%rdx
   44c25:	8b 04 82             	mov    (%rdx,%rax,4),%eax
   44c28:	89 45 c0             	mov    %eax,-0x40(%rbp)
        return lsb(v >> 3);
   44c2b:	89 c2                	mov    %eax,%edx
   44c2d:	c1 ea 03             	shr    $0x3,%edx
    return __builtin_ffs(x);
   44c30:	44 0f bc fa          	bsf    %edx,%r15d
   44c34:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   44c39:	44 0f 44 f8          	cmove  %eax,%r15d
   44c3d:	41 83 c7 01          	add    $0x1,%r15d
    if (pa >= (uintptr_t) console && pa < (uintptr_t) console + PAGESIZE) {
   44c41:	48 81 fb 00 80 0b 00 	cmp    $0xb8000,%rbx
   44c48:	72 3f                	jb     44c89 <memusage::symbol_at(unsigned long) const+0x113>
        return 'C' | 0x0700;
   44c4a:	b8 43 07 00 00       	mov    $0x743,%eax
    if (pa >= (uintptr_t) console && pa < (uintptr_t) console + PAGESIZE) {
   44c4f:	48 81 fb 00 90 0b 00 	cmp    $0xb9000,%rbx
   44c56:	72 8c                	jb     44be4 <memusage::symbol_at(unsigned long) const+0x6e>
    } else if (is_reserved && pid != 0) {
   44c58:	85 d2                	test   %edx,%edx
   44c5a:	0f 95 45 c7          	setne  -0x39(%rbp)
   44c5e:	0f b6 45 c7          	movzbl -0x39(%rbp),%eax
   44c62:	45 84 e4             	test   %r12b,%r12b
   44c65:	74 2f                	je     44c96 <memusage::symbol_at(unsigned long) const+0x120>
   44c67:	84 c0                	test   %al,%al
   44c69:	74 2b                	je     44c96 <memusage::symbol_at(unsigned long) const+0x120>
            page_error(pa, "reserved physical page mapped for user", marked_pid(v));
   44c6b:	44 89 f9             	mov    %r15d,%ecx
   44c6e:	ba f0 68 04 00       	mov    $0x468f0,%edx
   44c73:	48 89 de             	mov    %rbx,%rsi
   44c76:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
   44c7a:	e8 5b fe ff ff       	call   44ada <memusage::page_error(unsigned long, char const*, int) const>
        return 'R' | 0x0C00;
   44c7f:	b8 52 0c 00 00       	mov    $0xc52,%eax
   44c84:	e9 5b ff ff ff       	jmp    44be4 <memusage::symbol_at(unsigned long) const+0x6e>
    } else if (is_reserved && pid != 0) {
   44c89:	85 d2                	test   %edx,%edx
   44c8b:	0f 95 45 c7          	setne  -0x39(%rbp)
   44c8f:	74 05                	je     44c96 <memusage::symbol_at(unsigned long) const+0x120>
   44c91:	45 84 e4             	test   %r12b,%r12b
   44c94:	75 2d                	jne    44cc3 <memusage::symbol_at(unsigned long) const+0x14d>
        return 'R' | 0x0700;
   44c96:	b8 52 07 00 00       	mov    $0x752,%eax
    } else if (is_reserved) {
   44c9b:	45 84 e4             	test   %r12b,%r12b
   44c9e:	0f 85 40 ff ff ff    	jne    44be4 <memusage::symbol_at(unsigned long) const+0x6e>
    } else if (is_kernel && pid != 0 && separate_tables_) {
   44ca4:	45 84 f6             	test   %r14b,%r14b
   44ca7:	74 5c                	je     44d05 <memusage::symbol_at(unsigned long) const+0x18f>
   44ca9:	80 7d c7 00          	cmpb   $0x0,-0x39(%rbp)
   44cad:	74 56                	je     44d05 <memusage::symbol_at(unsigned long) const+0x18f>
   44caf:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   44cb3:	80 78 0c 00          	cmpb   $0x0,0xc(%rax)
   44cb7:	75 2f                	jne    44ce8 <memusage::symbol_at(unsigned long) const+0x172>
        return 'K' | 0x0D00;
   44cb9:	b8 4b 0d 00 00       	mov    $0xd4b,%eax
   44cbe:	e9 21 ff ff ff       	jmp    44be4 <memusage::symbol_at(unsigned long) const+0x6e>
        if (pa == 0) {
   44cc3:	48 85 db             	test   %rbx,%rbx
   44cc6:	75 a3                	jne    44c6b <memusage::symbol_at(unsigned long) const+0xf5>
            page_error(pa, "nullptr physical page mapped for user", marked_pid(v));
   44cc8:	44 89 f9             	mov    %r15d,%ecx
   44ccb:	ba c8 68 04 00       	mov    $0x468c8,%edx
   44cd0:	be 00 00 00 00       	mov    $0x0,%esi
   44cd5:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
   44cd9:	e8 fc fd ff ff       	call   44ada <memusage::page_error(unsigned long, char const*, int) const>
        return 'R' | 0x0C00;
   44cde:	b8 52 0c 00 00       	mov    $0xc52,%eax
   44ce3:	e9 fc fe ff ff       	jmp    44be4 <memusage::symbol_at(unsigned long) const+0x6e>
        page_error(pa, "kernel data page mapped for user", marked_pid(v));
   44ce8:	44 89 f9             	mov    %r15d,%ecx
   44ceb:	ba 18 69 04 00       	mov    $0x46918,%edx
   44cf0:	48 89 de             	mov    %rbx,%rsi
   44cf3:	48 89 c7             	mov    %rax,%rdi
   44cf6:	e8 df fd ff ff       	call   44ada <memusage::page_error(unsigned long, char const*, int) const>
        return 'K' | 0xCD00;
   44cfb:	b8 4b cd ff ff       	mov    $0xffffcd4b,%eax
   44d00:	e9 df fe ff ff       	jmp    44be4 <memusage::symbol_at(unsigned long) const+0x6e>
    } else if (is_kernel) {
   44d05:	45 84 f6             	test   %r14b,%r14b
   44d08:	0f 85 30 01 00 00    	jne    44e3e <memusage::symbol_at(unsigned long) const+0x2c8>
        return ' ' | 0x0700;
   44d0e:	b8 20 07 00 00       	mov    $0x720,%eax
    } else if (pa >= MEMSIZE_PHYSICAL) {
   44d13:	48 81 fb ff ff 1f 00 	cmp    $0x1fffff,%rbx
   44d1a:	0f 87 c4 fe ff ff    	ja     44be4 <memusage::symbol_at(unsigned long) const+0x6e>
        if (vx == 0) {
   44d20:	8b 45 c0             	mov    -0x40(%rbp),%eax
   44d23:	83 e0 fb             	and    $0xfffffffb,%eax
   44d26:	75 1a                	jne    44d42 <memusage::symbol_at(unsigned long) const+0x1cc>
        return this->refcount != 0;
   44d28:	45 89 ed             	mov    %r13d,%r13d
                return 'L' | 0x0300;
   44d2b:	41 80 bd 00 40 06 00 	cmpb   $0x1,0x64000(%r13)
   44d32:	01 
   44d33:	19 c0                	sbb    %eax,%eax
   44d35:	66 25 e2 03          	and    $0x3e2,%ax
   44d39:	66 05 4c 03          	add    $0x34c,%ax
   44d3d:	e9 a2 fe ff ff       	jmp    44be4 <memusage::symbol_at(unsigned long) const+0x6e>
        } else if (vx == f_kernel) {
   44d42:	83 f8 01             	cmp    $0x1,%eax
   44d45:	0f 84 fd 00 00 00    	je     44e48 <memusage::symbol_at(unsigned long) const+0x2d2>
        } else if (vx == f_user) {
   44d4b:	83 f8 02             	cmp    $0x2,%eax
   44d4e:	0f 84 fe 00 00 00    	je     44e52 <memusage::symbol_at(unsigned long) const+0x2dc>
        } else if ((v & f_kernel) && (v & f_user) && separate_tables_) {
   44d54:	8b 45 c0             	mov    -0x40(%rbp),%eax
   44d57:	f7 d0                	not    %eax
   44d59:	a8 03                	test   $0x3,%al
   44d5b:	74 72                	je     44dcf <memusage::symbol_at(unsigned long) const+0x259>
            uint16_t ch = colors[pid % 5] << 8;
   44d5d:	49 63 c7             	movslq %r15d,%rax
   44d60:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
   44d67:	48 c1 f8 21          	sar    $0x21,%rax
   44d6b:	44 89 fa             	mov    %r15d,%edx
   44d6e:	c1 fa 1f             	sar    $0x1f,%edx
   44d71:	29 d0                	sub    %edx,%eax
   44d73:	8d 14 80             	lea    (%rax,%rax,4),%edx
   44d76:	44 89 f8             	mov    %r15d,%eax
   44d79:	29 d0                	sub    %edx,%eax
   44d7b:	48 98                	cltq
   44d7d:	0f b6 80 a1 6b 04 00 	movzbl 0x46ba1(%rax),%eax
   44d84:	c1 e0 08             	shl    $0x8,%eax
   44d87:	41 89 c4             	mov    %eax,%r12d
            if (v & f_kernel) {
   44d8a:	f6 45 c0 01          	testb  $0x1,-0x40(%rbp)
   44d8e:	74 14                	je     44da4 <memusage::symbol_at(unsigned long) const+0x22e>
                ch = 0x4000 | (ch == 0x0C00 ? 0x0F00 : ch);
   44d90:	89 c2                	mov    %eax,%edx
   44d92:	80 ce 40             	or     $0x40,%dh
   44d95:	66 3d 00 0c          	cmp    $0xc00,%ax
   44d99:	b8 00 4f 00 00       	mov    $0x4f00,%eax
   44d9e:	0f 45 c2             	cmovne %edx,%eax
   44da1:	41 89 c4             	mov    %eax,%r12d
   44da4:	45 89 ed             	mov    %r13d,%r13d
            if (!physpages[pn].used() && (v & f_nonidentity)) {
   44da7:	41 80 bd 00 40 06 00 	cmpb   $0x0,0x64000(%r13)
   44dae:	00 
   44daf:	75 06                	jne    44db7 <memusage::symbol_at(unsigned long) const+0x241>
   44db1:	f6 45 c0 04          	testb  $0x4,-0x40(%rbp)
   44db5:	75 3f                	jne    44df6 <memusage::symbol_at(unsigned long) const+0x280>
        } else if (pid >= 1) {
   44db7:	41 83 ff 1c          	cmp    $0x1c,%r15d
   44dbb:	7f 55                	jg     44e12 <memusage::symbol_at(unsigned long) const+0x29c>
   44dbd:	80 7d c7 00          	cmpb   $0x0,-0x39(%rbp)
   44dc1:	74 4f                	je     44e12 <memusage::symbol_at(unsigned long) const+0x29c>
            return 4U << pid;
   44dc3:	ba 04 00 00 00       	mov    $0x4,%edx
   44dc8:	44 89 f9             	mov    %r15d,%ecx
   44dcb:	d3 e2                	shl    %cl,%edx
   44dcd:	eb 48                	jmp    44e17 <memusage::symbol_at(unsigned long) const+0x2a1>
        } else if ((v & f_kernel) && (v & f_user) && separate_tables_) {
   44dcf:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   44dd3:	80 78 0c 00          	cmpb   $0x0,0xc(%rax)
   44dd7:	74 84                	je     44d5d <memusage::symbol_at(unsigned long) const+0x1e7>
            page_error(pa, "kernel allocated page mapped for user",
   44dd9:	44 89 f9             	mov    %r15d,%ecx
   44ddc:	ba 40 69 04 00       	mov    $0x46940,%edx
   44de1:	48 89 de             	mov    %rbx,%rsi
   44de4:	48 89 c7             	mov    %rax,%rdi
   44de7:	e8 ee fc ff ff       	call   44ada <memusage::page_error(unsigned long, char const*, int) const>
            return '*' | 0xF400;
   44dec:	b8 2a f4 ff ff       	mov    $0xfffff42a,%eax
   44df1:	e9 ee fd ff ff       	jmp    44be4 <memusage::symbol_at(unsigned long) const+0x6e>
                page_error(pa, "freed page mapped for user", pid);
   44df6:	44 89 f9             	mov    %r15d,%ecx
   44df9:	ba 24 62 04 00       	mov    $0x46224,%edx
   44dfe:	48 89 de             	mov    %rbx,%rsi
   44e01:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
   44e05:	e8 d0 fc ff ff       	call   44ada <memusage::page_error(unsigned long, char const*, int) const>
                ch |= 0xF000;
   44e0a:	66 41 81 cc 00 f0    	or     $0xf000,%r12w
   44e10:	eb a5                	jmp    44db7 <memusage::symbol_at(unsigned long) const+0x241>
            return 0;
   44e12:	ba 00 00 00 00       	mov    $0x0,%edx
            if (v > (f_process(pid) | f_kernel | f_user | f_nonidentity)) {
   44e17:	83 ca 07             	or     $0x7,%edx
                ch = 'S' | 0x0F00;
   44e1a:	b8 53 0f 00 00       	mov    $0xf53,%eax
            if (v > (f_process(pid) | f_kernel | f_user | f_nonidentity)) {
   44e1f:	8b 4d c0             	mov    -0x40(%rbp),%ecx
   44e22:	39 ca                	cmp    %ecx,%edx
   44e24:	0f 82 ba fd ff ff    	jb     44be4 <memusage::symbol_at(unsigned long) const+0x6e>
                ch |= names[pid];
   44e2a:	4d 63 ff             	movslq %r15d,%r15
   44e2d:	66 41 0f be 87 80 6b 	movsbw 0x46b80(%r15),%ax
   44e34:	04 00 
   44e36:	44 09 e0             	or     %r12d,%eax
   44e39:	e9 a6 fd ff ff       	jmp    44be4 <memusage::symbol_at(unsigned long) const+0x6e>
        return 'K' | 0x0D00;
   44e3e:	b8 4b 0d 00 00       	mov    $0xd4b,%eax
   44e43:	e9 9c fd ff ff       	jmp    44be4 <memusage::symbol_at(unsigned long) const+0x6e>
            return 'K' | 0x0D00;
   44e48:	b8 4b 0d 00 00       	mov    $0xd4b,%eax
   44e4d:	e9 92 fd ff ff       	jmp    44be4 <memusage::symbol_at(unsigned long) const+0x6e>
            return '.' | 0x0700;
   44e52:	b8 2e 07 00 00       	mov    $0x72e,%eax
   44e57:	e9 88 fd ff ff       	jmp    44be4 <memusage::symbol_at(unsigned long) const+0x6e>

0000000000044e5c <console_memviewer(proc*)>:
        console[mu.sympos(11, pn)] = ch;
    }
}


void console_memviewer(proc* vmp) {
   44e5c:	f3 0f 1e fa          	endbr64
   44e60:	55                   	push   %rbp
   44e61:	48 89 e5             	mov    %rsp,%rbp
   44e64:	41 56                	push   %r14
   44e66:	41 55                	push   %r13
   44e68:	41 54                	push   %r12
   44e6a:	53                   	push   %rbx
   44e6b:	48 83 ec 20          	sub    $0x20,%rsp
    // Process 0 must never be used.
    assert(ptable[0].state == P_FREE);
   44e6f:	8b 1d b7 f3 01 00    	mov    0x1f3b7(%rip),%ebx        # 6422c <ptable+0xc>
   44e75:	85 db                	test   %ebx,%ebx
   44e77:	75 2e                	jne    44ea7 <console_memviewer(proc*)+0x4b>
   44e79:	49 89 fd             	mov    %rdi,%r13

    // track physical memory
    static memusage mu;
    mu.refresh();
   44e7c:	bf e0 80 04 00       	mov    $0x480e0,%edi
   44e81:	e8 7c f7 ff ff       	call   44602 <memusage::refresh()>

    // print physical memory
    console_printf(CPOS(0, 32), 0x0F00, "PHYSICAL MEMORY\n");
   44e86:	ba 64 62 04 00       	mov    $0x46264,%edx
   44e8b:	be 00 0f 00 00       	mov    $0xf00,%esi
   44e90:	bf 20 00 00 00       	mov    $0x20,%edi
   44e95:	b8 00 00 00 00       	mov    $0x0,%eax
   44e9a:	e8 a6 0f 00 00       	call   45e45 <console_printf(int, int, char const*, ...)>
   44e9f:	41 bc 00 00 00 00    	mov    $0x0,%r12d
   44ea5:	eb 72                	jmp    44f19 <console_memviewer(proc*)+0xbd>
    assert(ptable[0].state == P_FREE);
   44ea7:	b9 00 00 00 00       	mov    $0x0,%ecx
   44eac:	ba 4a 62 04 00       	mov    $0x4624a,%edx
   44eb1:	be 17 01 00 00       	mov    $0x117,%esi
   44eb6:	bf e2 61 04 00       	mov    $0x461e2,%edi
   44ebb:	e8 fd e7 ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
        return CPOS(initial_row + pn / 64, 12 + pn % 64);
   44ec0:	8d 43 3f             	lea    0x3f(%rbx),%eax
   44ec3:	85 db                	test   %ebx,%ebx
   44ec5:	0f 49 c3             	cmovns %ebx,%eax
   44ec8:	c1 f8 06             	sar    $0x6,%eax
   44ecb:	8d 4c 80 05          	lea    0x5(%rax,%rax,4),%ecx
   44ecf:	c1 e1 04             	shl    $0x4,%ecx
   44ed2:	89 da                	mov    %ebx,%edx
   44ed4:	c1 fa 1f             	sar    $0x1f,%edx
   44ed7:	c1 ea 1a             	shr    $0x1a,%edx
   44eda:	8d 04 13             	lea    (%rbx,%rdx,1),%eax
   44edd:	83 e0 3f             	and    $0x3f,%eax
   44ee0:	29 d0                	sub    %edx,%eax
   44ee2:	44 8d 74 01 0c       	lea    0xc(%rcx,%rax,1),%r14d
        error_sympos_ = sympos;
   44ee7:	44 89 35 02 32 00 00 	mov    %r14d,0x3202(%rip)        # 480f0 <console_memviewer(proc*)::mu+0x10>
    for (int pn = 0; pn * PAGESIZE < memusage::max_view_pa; ++pn) {
        if (pn % 64 == 0) {
            console_printf(mu.sympos(1, pn) - 9, 0x0F00, "0x%06X ", pn << 12);
        }
        mu.set_error_sympos(mu.sympos(1, pn));
        console[mu.sympos(1, pn)] = mu.symbol_at(pn * PAGESIZE);
   44eee:	4c 89 e6             	mov    %r12,%rsi
   44ef1:	bf e0 80 04 00       	mov    $0x480e0,%edi
   44ef6:	e8 7b fc ff ff       	call   44b76 <memusage::symbol_at(unsigned long) const>
   44efb:	4d 63 f6             	movslq %r14d,%r14
   44efe:	66 43 89 84 36 00 80 	mov    %ax,0xb8000(%r14,%r14,1)
   44f05:	0b 00 
    for (int pn = 0; pn * PAGESIZE < memusage::max_view_pa; ++pn) {
   44f07:	83 c3 01             	add    $0x1,%ebx
   44f0a:	49 81 c4 00 10 00 00 	add    $0x1000,%r12
   44f11:	81 fb 00 02 00 00    	cmp    $0x200,%ebx
   44f17:	74 47                	je     44f60 <console_memviewer(proc*)+0x104>
        if (pn % 64 == 0) {
   44f19:	f6 c3 3f             	test   $0x3f,%bl
   44f1c:	75 a2                	jne    44ec0 <console_memviewer(proc*)+0x64>
        return CPOS(initial_row + pn / 64, 12 + pn % 64);
   44f1e:	8d 43 3f             	lea    0x3f(%rbx),%eax
   44f21:	85 db                	test   %ebx,%ebx
   44f23:	0f 49 c3             	cmovns %ebx,%eax
   44f26:	c1 f8 06             	sar    $0x6,%eax
   44f29:	8d 4c 80 05          	lea    0x5(%rax,%rax,4),%ecx
   44f2d:	c1 e1 04             	shl    $0x4,%ecx
   44f30:	89 da                	mov    %ebx,%edx
   44f32:	c1 fa 1f             	sar    $0x1f,%edx
   44f35:	c1 ea 1a             	shr    $0x1a,%edx
   44f38:	8d 04 13             	lea    (%rbx,%rdx,1),%eax
   44f3b:	83 e0 3f             	and    $0x3f,%eax
   44f3e:	29 d0                	sub    %edx,%eax
            console_printf(mu.sympos(1, pn) - 9, 0x0F00, "0x%06X ", pn << 12);
   44f40:	8d 7c 01 03          	lea    0x3(%rcx,%rax,1),%edi
   44f44:	44 89 e1             	mov    %r12d,%ecx
   44f47:	ba 75 62 04 00       	mov    $0x46275,%edx
   44f4c:	be 00 0f 00 00       	mov    $0xf00,%esi
   44f51:	b8 00 00 00 00       	mov    $0x0,%eax
   44f56:	e8 ea 0e 00 00       	call   45e45 <console_printf(int, int, char const*, ...)>
   44f5b:	e9 60 ff ff ff       	jmp    44ec0 <console_memviewer(proc*)+0x64>
        error_sympos_ = sympos;
   44f60:	c7 05 86 31 00 00 ff 	movl   $0xffffffff,0x3186(%rip)        # 480f0 <console_memviewer(proc*)::mu+0x10>
   44f67:	ff ff ff 
    }
    mu.set_error_sympos(-1);

    // print virtual memory
    if (vmp) {
   44f6a:	4d 85 ed             	test   %r13,%r13
   44f6d:	0f 84 0e 02 00 00    	je     45181 <console_memviewer(proc*)+0x325>
    assert(vmp->pagetable != nullptr);
   44f73:	49 83 7d 00 00       	cmpq   $0x0,0x0(%r13)
   44f78:	0f 84 9d 00 00 00    	je     4501b <console_memviewer(proc*)+0x1bf>
    const char* statemsg = vmp->state == P_FAULTED ? " (faulted)" : "";
   44f7e:	41 83 7d 0c 03       	cmpl   $0x3,0xc(%r13)
    console_printf(CPOS(10, 26), 0x0F00,
   44f83:	41 8b 4d 08          	mov    0x8(%r13),%ecx
   44f87:	41 b9 65 61 04 00    	mov    $0x46165,%r9d
   44f8d:	b8 3f 62 04 00       	mov    $0x4623f,%eax
   44f92:	4c 0f 44 c8          	cmove  %rax,%r9
   44f96:	41 b8 00 07 00 00    	mov    $0x700,%r8d
   44f9c:	ba 68 69 04 00       	mov    $0x46968,%edx
   44fa1:	be 00 0f 00 00       	mov    $0xf00,%esi
   44fa6:	bf 3a 03 00 00       	mov    $0x33a,%edi
   44fab:	b8 00 00 00 00       	mov    $0x0,%eax
   44fb0:	e8 90 0e 00 00       	call   45e45 <console_printf(int, int, char const*, ...)>
    : vmiter(p->pagetable, va) {
   44fb5:	49 8b 45 00          	mov    0x0(%r13),%rax
    : pt_(pt), pep_(&pt_->entry[0]), lbits_(initial_lbits),
   44fb9:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   44fbd:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
   44fc1:	c7 45 d0 27 00 00 00 	movl   $0x27,-0x30(%rbp)
      perm_(initial_perm), va_(0) {
   44fc8:	c7 45 d4 ff 0f 00 00 	movl   $0xfff,-0x2c(%rbp)
   44fcf:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
   44fd6:	00 
    real_find(va, false);
   44fd7:	ba 00 00 00 00       	mov    $0x0,%edx
   44fdc:	be 00 00 00 00       	mov    $0x0,%esi
   44fe1:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   44fe5:	e8 3c d3 ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    return va_;
   44fea:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
         it.va() < memusage::max_view_va;
   44fee:	48 81 f9 ff ff 2f 00 	cmp    $0x2fffff,%rcx
   44ff5:	0f 87 86 01 00 00    	ja     45181 <console_memviewer(proc*)+0x325>
        return -1;
   44ffb:	49 c7 c4 ff ff ff ff 	mov    $0xffffffffffffffff,%r12
            pa &= ~0x1000UL;
   45002:	49 bd 00 e0 ff ff ff 	movabs $0xfffffffffe000,%r13
   45009:	ff 0f 00 
        uintptr_t pa = *pep_ & PTE_PAMASK;
   4500c:	49 be 00 f0 ff ff ff 	movabs $0xffffffffff000,%r14
   45013:	ff 0f 00 
   45016:	e9 b3 00 00 00       	jmp    450ce <console_memviewer(proc*)+0x272>
    assert(vmp->pagetable != nullptr);
   4501b:	b9 00 00 00 00       	mov    $0x0,%ecx
   45020:	ba 7d 62 04 00       	mov    $0x4627d,%edx
   45025:	be f4 00 00 00       	mov    $0xf4,%esi
   4502a:	bf e2 61 04 00       	mov    $0x461e2,%edi
   4502f:	e8 89 e6 ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
        return CPOS(initial_row + pn / 64, 12 + pn % 64);
   45034:	8d 43 3f             	lea    0x3f(%rbx),%eax
   45037:	85 db                	test   %ebx,%ebx
   45039:	0f 49 c3             	cmovns %ebx,%eax
   4503c:	c1 f8 06             	sar    $0x6,%eax
   4503f:	8d 74 80 37          	lea    0x37(%rax,%rax,4),%esi
   45043:	c1 e6 04             	shl    $0x4,%esi
   45046:	89 da                	mov    %ebx,%edx
   45048:	c1 fa 1f             	sar    $0x1f,%edx
   4504b:	c1 ea 1a             	shr    $0x1a,%edx
   4504e:	8d 04 1a             	lea    (%rdx,%rbx,1),%eax
   45051:	83 e0 3f             	and    $0x3f,%eax
   45054:	29 d0                	sub    %edx,%eax
            console_printf(mu.sympos(11, pn) - 9, 0x0F00, "0x%06X ", it.va());
   45056:	8d 7c 06 03          	lea    0x3(%rsi,%rax,1),%edi
   4505a:	ba 75 62 04 00       	mov    $0x46275,%edx
   4505f:	be 00 0f 00 00       	mov    $0xf00,%esi
   45064:	b8 00 00 00 00       	mov    $0x0,%eax
   45069:	e8 d7 0d 00 00       	call   45e45 <console_printf(int, int, char const*, ...)>
   4506e:	eb 71                	jmp    450e1 <console_memviewer(proc*)+0x285>
                    ch ^= 0xFE00;
   45070:	ba 53 f1 ff ff       	mov    $0xfffff153,%edx
        return CPOS(initial_row + pn / 64, 12 + pn % 64);
   45075:	8d 43 3f             	lea    0x3f(%rbx),%eax
   45078:	85 db                	test   %ebx,%ebx
   4507a:	0f 49 c3             	cmovns %ebx,%eax
   4507d:	c1 f8 06             	sar    $0x6,%eax
   45080:	8d 4c 80 37          	lea    0x37(%rax,%rax,4),%ecx
   45084:	c1 e1 04             	shl    $0x4,%ecx
   45087:	89 d8                	mov    %ebx,%eax
   45089:	c1 f8 1f             	sar    $0x1f,%eax
   4508c:	c1 e8 1a             	shr    $0x1a,%eax
   4508f:	01 c3                	add    %eax,%ebx
   45091:	83 e3 3f             	and    $0x3f,%ebx
   45094:	29 c3                	sub    %eax,%ebx
   45096:	8d 44 19 0c          	lea    0xc(%rcx,%rbx,1),%eax
        console[mu.sympos(11, pn)] = ch;
   4509a:	48 98                	cltq
   4509c:	66 89 94 00 00 80 0b 	mov    %dx,0xb8000(%rax,%rax,1)
   450a3:	00 
    return find(va_ + delta);
   450a4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
   450a8:	48 8d b0 00 10 00 00 	lea    0x1000(%rax),%rsi
        real_find(va, false);
   450af:	ba 00 00 00 00       	mov    $0x0,%edx
   450b4:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   450b8:	e8 69 d2 ff ff       	call   42326 <vmiter::real_find(unsigned long, bool)>
    return va_;
   450bd:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
         it.va() < memusage::max_view_va;
   450c1:	48 81 f9 ff ff 2f 00 	cmp    $0x2fffff,%rcx
   450c8:	0f 87 b3 00 00 00    	ja     45181 <console_memviewer(proc*)+0x325>
        unsigned long pn = it.va() / PAGESIZE;
   450ce:	48 89 cb             	mov    %rcx,%rbx
   450d1:	48 c1 eb 0c          	shr    $0xc,%rbx
        if (pn % 64 == 0) {
   450d5:	f7 c1 00 f0 03 00    	test   $0x3f000,%ecx
   450db:	0f 84 53 ff ff ff    	je     45034 <console_memviewer(proc*)+0x1d8>
    uint64_t ph = *pep_ & perm_;
   450e1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   450e5:	48 8b 30             	mov    (%rax),%rsi
   450e8:	48 63 45 d4          	movslq -0x2c(%rbp),%rax
   450ec:	48 21 f0             	and    %rsi,%rax
            ch = ' ';
   450ef:	ba 20 00 00 00       	mov    $0x20,%edx
        if (!it.present()) {
   450f4:	a8 01                	test   $0x1,%al
   450f6:	0f 84 79 ff ff ff    	je     45075 <console_memviewer(proc*)+0x219>
        return -1;
   450fc:	4c 89 e0             	mov    %r12,%rax
    if (*pep_ & PTE_P) {
   450ff:	40 f6 c6 01          	test   $0x1,%sil
   45103:	74 26                	je     4512b <console_memviewer(proc*)+0x2cf>
        if (lbits_ > PAGEOFFBITS) {
   45105:	8b 4d d0             	mov    -0x30(%rbp),%ecx
            pa &= ~0x1000UL;
   45108:	48 89 f0             	mov    %rsi,%rax
   4510b:	4c 21 e8             	and    %r13,%rax
        uintptr_t pa = *pep_ & PTE_PAMASK;
   4510e:	48 89 f2             	mov    %rsi,%rdx
   45111:	4c 21 f2             	and    %r14,%rdx
   45114:	83 f9 0c             	cmp    $0xc,%ecx
   45117:	48 0f 4f d0          	cmovg  %rax,%rdx
    return ~(~uintptr_t(0) << lbits);
   4511b:	4c 89 e0             	mov    %r12,%rax
   4511e:	48 d3 e0             	shl    %cl,%rax
   45121:	48 f7 d0             	not    %rax
        return pa + (va_ & lbits_mask(lbits_));
   45124:	48 23 45 d8          	and    -0x28(%rbp),%rax
   45128:	48 01 d0             	add    %rdx,%rax
            ch = mu.symbol_at(it.pa());
   4512b:	48 89 c6             	mov    %rax,%rsi
   4512e:	bf e0 80 04 00       	mov    $0x480e0,%edi
   45133:	e8 3e fa ff ff       	call   44b76 <memusage::symbol_at(unsigned long) const>
   45138:	89 c2                	mov    %eax,%edx
    uint64_t ph = *pep_ & perm_;
   4513a:	48 63 4d d4          	movslq -0x2c(%rbp),%rcx
   4513e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
   45142:	48 23 08             	and    (%rax),%rcx
    return ph & -(ph & PTE_P);
   45145:	48 89 c8             	mov    %rcx,%rax
   45148:	83 e0 01             	and    $0x1,%eax
   4514b:	48 f7 d8             	neg    %rax
   4514e:	48 21 c8             	and    %rcx,%rax
            if (it.user()) { // switch foreground & background colors
   45151:	48 f7 d0             	not    %rax
   45154:	a8 05                	test   $0x5,%al
   45156:	0f 85 19 ff ff ff    	jne    45075 <console_memviewer(proc*)+0x219>
                if (ch == (0x0F00 | 'S')) {
   4515c:	66 81 fa 53 0f       	cmp    $0xf53,%dx
   45161:	0f 84 09 ff ff ff    	je     45070 <console_memviewer(proc*)+0x214>
                    uint16_t z = (ch & 0x0F00) ^ ((ch & 0xF000) >> 4);
   45167:	89 d0                	mov    %edx,%eax
   45169:	66 c1 e8 04          	shr    $0x4,%ax
   4516d:	31 d0                	xor    %edx,%eax
   4516f:	66 25 00 0f          	and    $0xf00,%ax
   45173:	89 c1                	mov    %eax,%ecx
   45175:	c1 e1 04             	shl    $0x4,%ecx
   45178:	01 c8                	add    %ecx,%eax
                    ch ^= z | (z << 4);
   4517a:	31 c2                	xor    %eax,%edx
   4517c:	e9 f4 fe ff ff       	jmp    45075 <console_memviewer(proc*)+0x219>
        console_memviewer_virtual(mu, vmp);
    }
}
   45181:	48 83 c4 20          	add    $0x20,%rsp
   45185:	5b                   	pop    %rbx
   45186:	41 5c                	pop    %r12
   45188:	41 5d                	pop    %r13
   4518a:	41 5e                	pop    %r14
   4518c:	5d                   	pop    %rbp
   4518d:	c3                   	ret

000000000004518e <memcpy>:
// memcpy, memmove, memset, memcmp, memchr, strlen, strnlen,
// strcpy, strncpy, strlcpy, strcmp, strncmp, strchr, strstr,
// strtoul, strtol
//    We must provide our own implementations.

void* memcpy(void* dst, const void* src, size_t n) {
   4518e:	f3 0f 1e fa          	endbr64
   45192:	48 89 f8             	mov    %rdi,%rax
    const char* s = (const char*) src;
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   45195:	48 85 d2             	test   %rdx,%rdx
   45198:	74 17                	je     451b1 <memcpy+0x23>
   4519a:	b9 00 00 00 00       	mov    $0x0,%ecx
        *d = *s;
   4519f:	44 0f b6 04 0e       	movzbl (%rsi,%rcx,1),%r8d
   451a4:	44 88 04 08          	mov    %r8b,(%rax,%rcx,1)
    for (char* d = (char*) dst; n > 0; --n, ++s, ++d) {
   451a8:	48 83 c1 01          	add    $0x1,%rcx
   451ac:	48 39 d1             	cmp    %rdx,%rcx
   451af:	75 ee                	jne    4519f <memcpy+0x11>
    }
    return dst;
}
   451b1:	c3                   	ret

00000000000451b2 <memset>:
        }
    }
    return dst;
}

void* memset(void* v, int c, size_t n) {
   451b2:	f3 0f 1e fa          	endbr64
   451b6:	48 89 f8             	mov    %rdi,%rax
    for (char* p = (char*) v; n > 0; ++p, --n) {
   451b9:	48 85 d2             	test   %rdx,%rdx
   451bc:	74 12                	je     451d0 <memset+0x1e>
   451be:	48 01 fa             	add    %rdi,%rdx
   451c1:	48 89 f9             	mov    %rdi,%rcx
        *p = c;
   451c4:	40 88 31             	mov    %sil,(%rcx)
    for (char* p = (char*) v; n > 0; ++p, --n) {
   451c7:	48 83 c1 01          	add    $0x1,%rcx
   451cb:	48 39 ca             	cmp    %rcx,%rdx
   451ce:	75 f4                	jne    451c4 <memset+0x12>
    }
    return v;
}
   451d0:	c3                   	ret

00000000000451d1 <memcmp>:

int memcmp(const void* a, const void* b, size_t n) {
   451d1:	f3 0f 1e fa          	endbr64
    const uint8_t* sa = reinterpret_cast<const uint8_t*>(a);
    const uint8_t* sb = reinterpret_cast<const uint8_t*>(b);
    for (; n > 0; ++sa, ++sb, --n) {
   451d5:	48 85 d2             	test   %rdx,%rdx
   451d8:	74 32                	je     4520c <memcmp+0x3b>
   451da:	b8 00 00 00 00       	mov    $0x0,%eax
        if (*sa != *sb) {
   451df:	44 0f b6 04 07       	movzbl (%rdi,%rax,1),%r8d
   451e4:	0f b6 0c 06          	movzbl (%rsi,%rax,1),%ecx
   451e8:	41 38 c8             	cmp    %cl,%r8b
   451eb:	75 0f                	jne    451fc <memcmp+0x2b>
    for (; n > 0; ++sa, ++sb, --n) {
   451ed:	48 83 c0 01          	add    $0x1,%rax
   451f1:	48 39 c2             	cmp    %rax,%rdx
   451f4:	75 e9                	jne    451df <memcmp+0xe>
            return (*sa > *sb) - (*sa < *sb);
        }
    }
    return 0;
   451f6:	b8 00 00 00 00       	mov    $0x0,%eax
   451fb:	c3                   	ret
            return (*sa > *sb) - (*sa < *sb);
   451fc:	44 38 c1             	cmp    %r8b,%cl
   451ff:	0f 92 c0             	setb   %al
   45202:	0f b6 c0             	movzbl %al,%eax
   45205:	41 38 c8             	cmp    %cl,%r8b
   45208:	83 d8 00             	sbb    $0x0,%eax
   4520b:	c3                   	ret
    return 0;
   4520c:	b8 00 00 00 00       	mov    $0x0,%eax
}
   45211:	c3                   	ret

0000000000045212 <strlen>:
        }
    }
    return nullptr;
}

size_t strlen(const char* s) {
   45212:	f3 0f 1e fa          	endbr64
    size_t n;
    for (n = 0; *s != '\0'; ++s) {
   45216:	80 3f 00             	cmpb   $0x0,(%rdi)
   45219:	74 10                	je     4522b <strlen+0x19>
   4521b:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
   45220:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
   45224:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
   45228:	75 f6                	jne    45220 <strlen+0xe>
   4522a:	c3                   	ret
   4522b:	b8 00 00 00 00       	mov    $0x0,%eax
    }
    return n;
}
   45230:	c3                   	ret

0000000000045231 <strnlen>:

size_t strnlen(const char* s, size_t maxlen) {
   45231:	f3 0f 1e fa          	endbr64
   45235:	48 89 f0             	mov    %rsi,%rax
    size_t n;
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   45238:	ba 00 00 00 00       	mov    $0x0,%edx
   4523d:	48 85 f6             	test   %rsi,%rsi
   45240:	74 10                	je     45252 <strnlen+0x21>
   45242:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
   45246:	74 0b                	je     45253 <strnlen+0x22>
        ++n;
   45248:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
   4524c:	48 39 d0             	cmp    %rdx,%rax
   4524f:	75 f1                	jne    45242 <strnlen+0x11>
   45251:	c3                   	ret
   45252:	c3                   	ret
   45253:	48 89 d0             	mov    %rdx,%rax
    }
    return n;
}
   45256:	c3                   	ret

0000000000045257 <strcmp>:
        dst[nn] = '\0';
    }
    return n;
}

int strcmp(const char* a, const char* b) {
   45257:	f3 0f 1e fa          	endbr64
    while (true) {
        unsigned char ac = *a, bc = *b;
   4525b:	0f b6 17             	movzbl (%rdi),%edx
   4525e:	0f b6 0e             	movzbl (%rsi),%ecx
        if (ac == '\0' || bc == '\0' || ac != bc) {
   45261:	84 d2                	test   %dl,%dl
   45263:	0f 94 c0             	sete   %al
   45266:	38 ca                	cmp    %cl,%dl
   45268:	41 0f 95 c0          	setne  %r8b
   4526c:	44 08 c0             	or     %r8b,%al
   4526f:	75 2a                	jne    4529b <strcmp+0x44>
   45271:	b8 01 00 00 00       	mov    $0x1,%eax
   45276:	84 c9                	test   %cl,%cl
   45278:	74 21                	je     4529b <strcmp+0x44>
        unsigned char ac = *a, bc = *b;
   4527a:	0f b6 14 07          	movzbl (%rdi,%rax,1),%edx
   4527e:	0f b6 0c 06          	movzbl (%rsi,%rax,1),%ecx
        if (ac == '\0' || bc == '\0' || ac != bc) {
   45282:	48 83 c0 01          	add    $0x1,%rax
   45286:	84 d2                	test   %dl,%dl
   45288:	41 0f 94 c0          	sete   %r8b
   4528c:	84 c9                	test   %cl,%cl
   4528e:	41 0f 94 c1          	sete   %r9b
   45292:	45 08 c8             	or     %r9b,%r8b
   45295:	75 04                	jne    4529b <strcmp+0x44>
   45297:	38 ca                	cmp    %cl,%dl
   45299:	74 df                	je     4527a <strcmp+0x23>
            return (ac > bc) - (ac < bc);
   4529b:	38 d1                	cmp    %dl,%cl
   4529d:	0f 92 c0             	setb   %al
   452a0:	0f b6 c0             	movzbl %al,%eax
   452a3:	38 ca                	cmp    %cl,%dl
   452a5:	83 d8 00             	sbb    $0x0,%eax
        }
        ++a, ++b;
    }
}
   452a8:	c3                   	ret

00000000000452a9 <strchr>:
        }
        ++a, ++b, --n;
    }
}

char* strchr(const char* s, int c) {
   452a9:	f3 0f 1e fa          	endbr64
    while (*s != '\0' && *s != (char) c) {
   452ad:	0f b6 07             	movzbl (%rdi),%eax
   452b0:	84 c0                	test   %al,%al
   452b2:	74 10                	je     452c4 <strchr+0x1b>
   452b4:	40 38 f0             	cmp    %sil,%al
   452b7:	74 18                	je     452d1 <strchr+0x28>
        ++s;
   452b9:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
   452bd:	0f b6 07             	movzbl (%rdi),%eax
   452c0:	84 c0                	test   %al,%al
   452c2:	75 f0                	jne    452b4 <strchr+0xb>
    }
    if (*s == (char) c) {
        return (char*) s;
   452c4:	40 84 f6             	test   %sil,%sil
   452c7:	b8 00 00 00 00       	mov    $0x0,%eax
   452cc:	48 0f 44 c7          	cmove  %rdi,%rax
    } else {
        return nullptr;
    }
}
   452d0:	c3                   	ret
        return (char*) s;
   452d1:	48 89 f8             	mov    %rdi,%rax
   452d4:	c3                   	ret

00000000000452d5 <strstr>:

char* strstr(const char* hs, const char* ns) {
   452d5:	f3 0f 1e fa          	endbr64
    size_t i = 0, j = 0;
    while (hs[i] != '\0' && ns[j] != '\0') {
   452d9:	49 89 f8             	mov    %rdi,%r8
    size_t i = 0, j = 0;
   452dc:	b8 00 00 00 00       	mov    $0x0,%eax
   452e1:	ba 00 00 00 00       	mov    $0x0,%edx
    while (hs[i] != '\0' && ns[j] != '\0') {
   452e6:	80 3f 00             	cmpb   $0x0,(%rdi)
   452e9:	75 1f                	jne    4530a <strstr+0x35>
        }
    }
    if (ns[j] == '\0') {
        return const_cast<char*>(&hs[i]);
    } else {
        return nullptr;
   452eb:	80 3c 06 00          	cmpb   $0x0,(%rsi,%rax,1)
   452ef:	b8 00 00 00 00       	mov    $0x0,%eax
   452f4:	4c 0f 45 c0          	cmovne %rax,%r8
    }
}
   452f8:	4c 89 c0             	mov    %r8,%rax
   452fb:	c3                   	ret
            ++j;
   452fc:	48 83 c0 01          	add    $0x1,%rax
    while (hs[i] != '\0' && ns[j] != '\0') {
   45300:	4c 8d 04 17          	lea    (%rdi,%rdx,1),%r8
   45304:	41 80 38 00          	cmpb   $0x0,(%r8)
   45308:	74 e1                	je     452eb <strstr+0x16>
   4530a:	0f b6 0c 06          	movzbl (%rsi,%rax,1),%ecx
   4530e:	84 c9                	test   %cl,%cl
   45310:	74 e6                	je     452f8 <strstr+0x23>
        if (hs[i + j] == ns[j]) {
   45312:	4c 8d 04 17          	lea    (%rdi,%rdx,1),%r8
   45316:	41 38 0c 00          	cmp    %cl,(%r8,%rax,1)
   4531a:	74 e0                	je     452fc <strstr+0x27>
            ++i;
   4531c:	48 83 c2 01          	add    $0x1,%rdx
            j = 0;
   45320:	b8 00 00 00 00       	mov    $0x0,%eax
   45325:	eb d9                	jmp    45300 <strstr+0x2b>
   45327:	90                   	nop

0000000000045328 <printer::vprintf(char const*, __va_list_tag*)>:
    va_start(val, format);
    vprintf(format, val);
    va_end(val);
}

void printer::vprintf(const char* format, va_list val) {
   45328:	f3 0f 1e fa          	endbr64
   4532c:	55                   	push   %rbp
   4532d:	48 89 e5             	mov    %rsp,%rbp
   45330:	41 57                	push   %r15
   45332:	41 56                	push   %r14
   45334:	41 55                	push   %r13
   45336:	41 54                	push   %r12
   45338:	53                   	push   %rbx
   45339:	48 83 ec 48          	sub    $0x48,%rsp
   4533d:	49 89 ff             	mov    %rdi,%r15
   45340:	49 89 f4             	mov    %rsi,%r12
   45343:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
#define NUMBUFSIZ 32
    char numbuf[NUMBUFSIZ];

    for (; *format; ++format) {
   45347:	0f b6 06             	movzbl (%rsi),%eax
   4534a:	84 c0                	test   %al,%al
   4534c:	0f 85 94 05 00 00    	jne    458e6 <printer::vprintf(char const*, __va_list_tag*)+0x5be>
        }
        for (; width > 0; --width) {
            putc(' ');
        }
    }
}
   45352:	48 83 c4 48          	add    $0x48,%rsp
   45356:	5b                   	pop    %rbx
   45357:	41 5c                	pop    %r12
   45359:	41 5d                	pop    %r13
   4535b:	41 5e                	pop    %r14
   4535d:	41 5f                	pop    %r15
   4535f:	5d                   	pop    %rbp
   45360:	c3                   	ret
        for (++format; *format; ++format) {
   45361:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
   45366:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
   4536c:	45 84 e4             	test   %r12b,%r12b
   4536f:	0f 84 01 01 00 00    	je     45476 <printer::vprintf(char const*, __va_list_tag*)+0x14e>
        int flags = 0;
   45375:	41 be 00 00 00 00    	mov    $0x0,%r14d
            const char* flagc = strchr(flag_chars, *format);
   4537b:	41 0f be f4          	movsbl %r12b,%esi
   4537f:	bf a1 72 04 00       	mov    $0x472a1,%edi
   45384:	e8 20 ff ff ff       	call   452a9 <strchr>
   45389:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
   4538c:	48 85 c0             	test   %rax,%rax
   4538f:	74 70                	je     45401 <printer::vprintf(char const*, __va_list_tag*)+0xd9>
                flags |= 1 << (flagc - flag_chars);
   45391:	48 81 e9 a1 72 04 00 	sub    $0x472a1,%rcx
   45398:	b8 01 00 00 00       	mov    $0x1,%eax
   4539d:	d3 e0                	shl    %cl,%eax
   4539f:	41 09 c6             	or     %eax,%r14d
        for (++format; *format; ++format) {
   453a2:	48 83 c3 01          	add    $0x1,%rbx
   453a6:	44 0f b6 23          	movzbl (%rbx),%r12d
   453aa:	45 84 e4             	test   %r12b,%r12b
   453ad:	75 cc                	jne    4537b <printer::vprintf(char const*, __va_list_tag*)+0x53>
        int width = -1;
   453af:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
        int precision = -1;
   453b5:	c7 45 a4 ff ff ff ff 	movl   $0xffffffff,-0x5c(%rbp)
        if (*format == '.') {
   453bc:	80 3b 2e             	cmpb   $0x2e,(%rbx)
   453bf:	0f 84 d8 00 00 00    	je     4549d <printer::vprintf(char const*, __va_list_tag*)+0x175>
        switch (*format) {
   453c5:	0f b6 03             	movzbl (%rbx),%eax
   453c8:	3c 6c                	cmp    $0x6c,%al
   453ca:	0f 84 73 01 00 00    	je     45543 <printer::vprintf(char const*, __va_list_tag*)+0x21b>
   453d0:	0f 8f 4e 01 00 00    	jg     45524 <printer::vprintf(char const*, __va_list_tag*)+0x1fc>
   453d6:	3c 68                	cmp    $0x68,%al
   453d8:	0f 85 88 01 00 00    	jne    45566 <printer::vprintf(char const*, __va_list_tag*)+0x23e>
            ++format;
   453de:	48 8d 43 01          	lea    0x1(%rbx),%rax
   453e2:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
   453e6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   453ea:	8d 50 bd             	lea    -0x43(%rax),%edx
   453ed:	80 fa 35             	cmp    $0x35,%dl
   453f0:	0f 87 a6 05 00 00    	ja     4599c <printer::vprintf(char const*, __va_list_tag*)+0x674>
   453f6:	0f b6 d2             	movzbl %dl,%edx
   453f9:	3e ff 24 d5 b0 6b 04 	notrack jmp *0x46bb0(,%rdx,8)
   45400:	00 
        if (*format >= '1' && *format <= '9') {
   45401:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
   45406:	3c 08                	cmp    $0x8,%al
   45408:	77 32                	ja     4543c <printer::vprintf(char const*, __va_list_tag*)+0x114>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   4540a:	0f b6 03             	movzbl (%rbx),%eax
   4540d:	8d 50 d0             	lea    -0x30(%rax),%edx
   45410:	80 fa 09             	cmp    $0x9,%dl
   45413:	77 72                	ja     45487 <printer::vprintf(char const*, __va_list_tag*)+0x15f>
   45415:	41 bd 00 00 00 00    	mov    $0x0,%r13d
                width = 10 * width + *format++ - '0';
   4541b:	48 83 c3 01          	add    $0x1,%rbx
   4541f:	43 8d 54 ad 00       	lea    0x0(%r13,%r13,4),%edx
   45424:	0f be c0             	movsbl %al,%eax
   45427:	44 8d 6c 50 d0       	lea    -0x30(%rax,%rdx,2),%r13d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   4542c:	0f b6 03             	movzbl (%rbx),%eax
   4542f:	8d 50 d0             	lea    -0x30(%rax),%edx
   45432:	80 fa 09             	cmp    $0x9,%dl
   45435:	76 e4                	jbe    4541b <printer::vprintf(char const*, __va_list_tag*)+0xf3>
   45437:	e9 79 ff ff ff       	jmp    453b5 <printer::vprintf(char const*, __va_list_tag*)+0x8d>
        } else if (*format == '*') {
   4543c:	41 80 fc 2a          	cmp    $0x2a,%r12b
   45440:	75 50                	jne    45492 <printer::vprintf(char const*, __va_list_tag*)+0x16a>
            width = va_arg(val, int);
   45442:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
   45446:	8b 01                	mov    (%rcx),%eax
   45448:	83 f8 2f             	cmp    $0x2f,%eax
   4544b:	77 17                	ja     45464 <printer::vprintf(char const*, __va_list_tag*)+0x13c>
   4544d:	89 c2                	mov    %eax,%edx
   4544f:	48 03 51 10          	add    0x10(%rcx),%rdx
   45453:	83 c0 08             	add    $0x8,%eax
   45456:	89 01                	mov    %eax,(%rcx)
   45458:	44 8b 2a             	mov    (%rdx),%r13d
            ++format;
   4545b:	48 83 c3 01          	add    $0x1,%rbx
   4545f:	e9 51 ff ff ff       	jmp    453b5 <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            width = va_arg(val, int);
   45464:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
   45468:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   4546c:	48 8d 42 08          	lea    0x8(%rdx),%rax
   45470:	48 89 41 08          	mov    %rax,0x8(%rcx)
   45474:	eb e2                	jmp    45458 <printer::vprintf(char const*, __va_list_tag*)+0x130>
        int flags = 0;
   45476:	41 be 00 00 00 00    	mov    $0x0,%r14d
        int width = -1;
   4547c:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   45482:	e9 2e ff ff ff       	jmp    453b5 <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
   45487:	41 bd 00 00 00 00    	mov    $0x0,%r13d
   4548d:	e9 23 ff ff ff       	jmp    453b5 <printer::vprintf(char const*, __va_list_tag*)+0x8d>
        int width = -1;
   45492:	41 bd ff ff ff ff    	mov    $0xffffffff,%r13d
   45498:	e9 18 ff ff ff       	jmp    453b5 <printer::vprintf(char const*, __va_list_tag*)+0x8d>
            ++format;
   4549d:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
   454a1:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   454a5:	8d 48 d0             	lea    -0x30(%rax),%ecx
   454a8:	80 f9 09             	cmp    $0x9,%cl
   454ab:	76 13                	jbe    454c0 <printer::vprintf(char const*, __va_list_tag*)+0x198>
            } else if (*format == '*') {
   454ad:	3c 2a                	cmp    $0x2a,%al
   454af:	74 33                	je     454e4 <printer::vprintf(char const*, __va_list_tag*)+0x1bc>
            ++format;
   454b1:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
   454b4:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
   454bb:	e9 05 ff ff ff       	jmp    453c5 <printer::vprintf(char const*, __va_list_tag*)+0x9d>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   454c0:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
   454c5:	48 83 c2 01          	add    $0x1,%rdx
   454c9:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
   454cc:	0f be c0             	movsbl %al,%eax
   454cf:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
   454d3:	0f b6 02             	movzbl (%rdx),%eax
   454d6:	8d 70 d0             	lea    -0x30(%rax),%esi
   454d9:	40 80 fe 09          	cmp    $0x9,%sil
   454dd:	76 e6                	jbe    454c5 <printer::vprintf(char const*, __va_list_tag*)+0x19d>
   454df:	48 89 d3             	mov    %rdx,%rbx
   454e2:	eb 1c                	jmp    45500 <printer::vprintf(char const*, __va_list_tag*)+0x1d8>
                precision = va_arg(val, int);
   454e4:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
   454e8:	8b 07                	mov    (%rdi),%eax
   454ea:	83 f8 2f             	cmp    $0x2f,%eax
   454ed:	77 23                	ja     45512 <printer::vprintf(char const*, __va_list_tag*)+0x1ea>
   454ef:	89 c2                	mov    %eax,%edx
   454f1:	48 03 57 10          	add    0x10(%rdi),%rdx
   454f5:	83 c0 08             	add    $0x8,%eax
   454f8:	89 07                	mov    %eax,(%rdi)
   454fa:	8b 0a                	mov    (%rdx),%ecx
                ++format;
   454fc:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
   45500:	85 c9                	test   %ecx,%ecx
   45502:	b8 00 00 00 00       	mov    $0x0,%eax
   45507:	0f 49 c1             	cmovns %ecx,%eax
   4550a:	89 45 a4             	mov    %eax,-0x5c(%rbp)
   4550d:	e9 b3 fe ff ff       	jmp    453c5 <printer::vprintf(char const*, __va_list_tag*)+0x9d>
                precision = va_arg(val, int);
   45512:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
   45516:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   4551a:	48 8d 42 08          	lea    0x8(%rdx),%rax
   4551e:	48 89 47 08          	mov    %rax,0x8(%rdi)
   45522:	eb d6                	jmp    454fa <printer::vprintf(char const*, __va_list_tag*)+0x1d2>
        switch (*format) {
   45524:	3c 74                	cmp    $0x74,%al
   45526:	74 1b                	je     45543 <printer::vprintf(char const*, __va_list_tag*)+0x21b>
   45528:	3c 7a                	cmp    $0x7a,%al
   4552a:	74 17                	je     45543 <printer::vprintf(char const*, __va_list_tag*)+0x21b>
        switch (*format) {
   4552c:	8d 50 bd             	lea    -0x43(%rax),%edx
   4552f:	80 fa 35             	cmp    $0x35,%dl
   45532:	0f 87 5e 06 00 00    	ja     45b96 <printer::vprintf(char const*, __va_list_tag*)+0x86e>
   45538:	0f b6 d2             	movzbl %dl,%edx
   4553b:	3e ff 24 d5 60 6d 04 	notrack jmp *0x46d60(,%rdx,8)
   45542:	00 
            ++format;
   45543:	48 8d 43 01          	lea    0x1(%rbx),%rax
   45547:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
   4554b:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
   4554f:	8d 50 bd             	lea    -0x43(%rax),%edx
   45552:	80 fa 35             	cmp    $0x35,%dl
   45555:	0f 87 41 04 00 00    	ja     4599c <printer::vprintf(char const*, __va_list_tag*)+0x674>
   4555b:	0f b6 d2             	movzbl %dl,%edx
   4555e:	3e ff 24 d5 10 6f 04 	notrack jmp *0x46f10(,%rdx,8)
   45565:	00 
   45566:	8d 50 bd             	lea    -0x43(%rax),%edx
   45569:	80 fa 35             	cmp    $0x35,%dl
   4556c:	0f 87 26 04 00 00    	ja     45998 <printer::vprintf(char const*, __va_list_tag*)+0x670>
   45572:	0f b6 d2             	movzbl %dl,%edx
   45575:	3e ff 24 d5 c0 70 04 	notrack jmp *0x470c0(,%rdx,8)
   4557c:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
   4557d:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
   45581:	8b 07                	mov    (%rdi),%eax
   45583:	83 f8 2f             	cmp    $0x2f,%eax
   45586:	77 36                	ja     455be <printer::vprintf(char const*, __va_list_tag*)+0x296>
   45588:	89 c2                	mov    %eax,%edx
   4558a:	48 03 57 10          	add    0x10(%rdi),%rdx
   4558e:	83 c0 08             	add    $0x8,%eax
   45591:	89 07                	mov    %eax,(%rdi)
   45593:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
   45596:	48 89 d0             	mov    %rdx,%rax
   45599:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
   4559d:	49 89 d3             	mov    %rdx,%r11
   455a0:	49 f7 db             	neg    %r11
   455a3:	25 00 01 00 00       	and    $0x100,%eax
   455a8:	4c 0f 44 da          	cmove  %rdx,%r11
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
   455ac:	44 09 f0             	or     %r14d,%eax
   455af:	0c c0                	or     $0xc0,%al
   455b1:	41 89 c6             	mov    %eax,%r14d
        const char* data = "";
   455b4:	bb 65 61 04 00       	mov    $0x46165,%ebx
            break;
   455b9:	e9 f4 01 00 00       	jmp    457b2 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
            long x = length ? va_arg(val, long) : va_arg(val, int);
   455be:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
   455c2:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   455c6:	48 8d 42 08          	lea    0x8(%rdx),%rax
   455ca:	48 89 41 08          	mov    %rax,0x8(%rcx)
   455ce:	eb c3                	jmp    45593 <printer::vprintf(char const*, __va_list_tag*)+0x26b>
        switch (*format) {
   455d0:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   455d4:	eb 04                	jmp    455da <printer::vprintf(char const*, __va_list_tag*)+0x2b2>
   455d6:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            long x = length ? va_arg(val, long) : va_arg(val, int);
   455da:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
   455de:	8b 01                	mov    (%rcx),%eax
   455e0:	83 f8 2f             	cmp    $0x2f,%eax
   455e3:	77 10                	ja     455f5 <printer::vprintf(char const*, __va_list_tag*)+0x2cd>
   455e5:	89 c2                	mov    %eax,%edx
   455e7:	48 03 51 10          	add    0x10(%rcx),%rdx
   455eb:	83 c0 08             	add    $0x8,%eax
   455ee:	89 01                	mov    %eax,(%rcx)
   455f0:	48 63 12             	movslq (%rdx),%rdx
   455f3:	eb a1                	jmp    45596 <printer::vprintf(char const*, __va_list_tag*)+0x26e>
   455f5:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
   455f9:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   455fd:	48 8d 42 08          	lea    0x8(%rdx),%rax
   45601:	48 89 47 08          	mov    %rax,0x8(%rdi)
   45605:	eb e9                	jmp    455f0 <printer::vprintf(char const*, __va_list_tag*)+0x2c8>
        switch (*format) {
   45607:	b8 01 00 00 00       	mov    $0x1,%eax
   4560c:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
   45613:	e9 9d 00 00 00       	jmp    456b5 <printer::vprintf(char const*, __va_list_tag*)+0x38d>
   45618:	b8 00 00 00 00       	mov    $0x0,%eax
   4561d:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
   45624:	e9 8c 00 00 00       	jmp    456b5 <printer::vprintf(char const*, __va_list_tag*)+0x38d>
   45629:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   4562d:	b8 00 00 00 00       	mov    $0x0,%eax
   45632:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
   45639:	eb 7a                	jmp    456b5 <printer::vprintf(char const*, __va_list_tag*)+0x38d>
   4563b:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   4563f:	b8 00 00 00 00       	mov    $0x0,%eax
   45644:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
   4564b:	eb 68                	jmp    456b5 <printer::vprintf(char const*, __va_list_tag*)+0x38d>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   4564d:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
   45651:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   45655:	48 8d 42 08          	lea    0x8(%rdx),%rax
   45659:	48 89 47 08          	mov    %rax,0x8(%rdi)
   4565d:	eb 70                	jmp    456cf <printer::vprintf(char const*, __va_list_tag*)+0x3a7>
   4565f:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
   45663:	8b 07                	mov    (%rdi),%eax
   45665:	83 f8 2f             	cmp    $0x2f,%eax
   45668:	77 10                	ja     4567a <printer::vprintf(char const*, __va_list_tag*)+0x352>
   4566a:	89 c2                	mov    %eax,%edx
   4566c:	48 03 57 10          	add    0x10(%rdi),%rdx
   45670:	83 c0 08             	add    $0x8,%eax
   45673:	89 07                	mov    %eax,(%rdi)
   45675:	44 8b 1a             	mov    (%rdx),%r11d
   45678:	eb 58                	jmp    456d2 <printer::vprintf(char const*, __va_list_tag*)+0x3aa>
   4567a:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
   4567e:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   45682:	48 8d 42 08          	lea    0x8(%rdx),%rax
   45686:	48 89 41 08          	mov    %rax,0x8(%rcx)
   4568a:	eb e9                	jmp    45675 <printer::vprintf(char const*, __va_list_tag*)+0x34d>
        switch (*format) {
   4568c:	b8 01 00 00 00       	mov    $0x1,%eax
   45691:	eb 1b                	jmp    456ae <printer::vprintf(char const*, __va_list_tag*)+0x386>
   45693:	b8 00 00 00 00       	mov    $0x0,%eax
   45698:	eb 14                	jmp    456ae <printer::vprintf(char const*, __va_list_tag*)+0x386>
   4569a:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   4569e:	b8 00 00 00 00       	mov    $0x0,%eax
   456a3:	eb 09                	jmp    456ae <printer::vprintf(char const*, __va_list_tag*)+0x386>
   456a5:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   456a9:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
   456ae:	c7 45 a0 f0 ff ff ff 	movl   $0xfffffff0,-0x60(%rbp)
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
   456b5:	85 c0                	test   %eax,%eax
   456b7:	74 a6                	je     4565f <printer::vprintf(char const*, __va_list_tag*)+0x337>
   456b9:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
   456bd:	8b 07                	mov    (%rdi),%eax
   456bf:	83 f8 2f             	cmp    $0x2f,%eax
   456c2:	77 89                	ja     4564d <printer::vprintf(char const*, __va_list_tag*)+0x325>
   456c4:	89 c2                	mov    %eax,%edx
   456c6:	48 03 57 10          	add    0x10(%rdi),%rdx
   456ca:	83 c0 08             	add    $0x8,%eax
   456cd:	89 07                	mov    %eax,(%rdi)
   456cf:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_NUMERIC;
   456d2:	44 89 f0             	mov    %r14d,%eax
   456d5:	83 c8 40             	or     $0x40,%eax
    if (base < 0) {
   456d8:	83 7d a0 00          	cmpl   $0x0,-0x60(%rbp)
   456dc:	0f 89 de 02 00 00    	jns    459c0 <printer::vprintf(char const*, __va_list_tag*)+0x698>
    *--pos = '\0';
   456e2:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
   456e6:	a8 20                	test   $0x20,%al
   456e8:	0f 85 01 03 00 00    	jne    459ef <printer::vprintf(char const*, __va_list_tag*)+0x6c7>
   456ee:	41 89 c6             	mov    %eax,%r14d
        digits = lower_digits;
   456f1:	41 ba 70 72 04 00    	mov    $0x47270,%r10d
        base = -base;
   456f7:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
   456fd:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = nullptr;
   45704:	bf 00 00 00 00       	mov    $0x0,%edi
   45709:	e9 03 03 00 00       	jmp    45a11 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
        switch (*format) {
   4570e:	b8 01 00 00 00       	mov    $0x1,%eax
   45713:	eb 1b                	jmp    45730 <printer::vprintf(char const*, __va_list_tag*)+0x408>
   45715:	b8 00 00 00 00       	mov    $0x0,%eax
   4571a:	eb 14                	jmp    45730 <printer::vprintf(char const*, __va_list_tag*)+0x408>
   4571c:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   45720:	b8 00 00 00 00       	mov    $0x0,%eax
   45725:	eb 09                	jmp    45730 <printer::vprintf(char const*, __va_list_tag*)+0x408>
   45727:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   4572b:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
   45730:	c7 45 a0 10 00 00 00 	movl   $0x10,-0x60(%rbp)
            goto format_unsigned;
   45737:	e9 79 ff ff ff       	jmp    456b5 <printer::vprintf(char const*, __va_list_tag*)+0x38d>
        switch (*format) {
   4573c:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   45740:	eb 04                	jmp    45746 <printer::vprintf(char const*, __va_list_tag*)+0x41e>
   45742:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            num = (uintptr_t) va_arg(val, void*);
   45746:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
   4574a:	8b 01                	mov    (%rcx),%eax
   4574c:	83 f8 2f             	cmp    $0x2f,%eax
   4574f:	77 22                	ja     45773 <printer::vprintf(char const*, __va_list_tag*)+0x44b>
   45751:	89 c2                	mov    %eax,%edx
   45753:	48 03 51 10          	add    0x10(%rcx),%rdx
   45757:	83 c0 08             	add    $0x8,%eax
   4575a:	89 01                	mov    %eax,(%rcx)
   4575c:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
   4575f:	44 89 f0             	mov    %r14d,%eax
   45762:	0d 41 02 00 00       	or     $0x241,%eax
            base = -16;
   45767:	c7 45 a0 f0 ff ff ff 	movl   $0xfffffff0,-0x60(%rbp)
   4576e:	e9 6f ff ff ff       	jmp    456e2 <printer::vprintf(char const*, __va_list_tag*)+0x3ba>
            num = (uintptr_t) va_arg(val, void*);
   45773:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
   45777:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   4577b:	48 8d 42 08          	lea    0x8(%rdx),%rax
   4577f:	48 89 47 08          	mov    %rax,0x8(%rdi)
   45783:	eb d7                	jmp    4575c <printer::vprintf(char const*, __va_list_tag*)+0x434>
        switch (*format) {
   45785:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   45789:	eb 04                	jmp    4578f <printer::vprintf(char const*, __va_list_tag*)+0x467>
   4578b:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = va_arg(val, char*);
   4578f:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
   45793:	8b 01                	mov    (%rcx),%eax
   45795:	83 f8 2f             	cmp    $0x2f,%eax
   45798:	0f 87 61 01 00 00    	ja     458ff <printer::vprintf(char const*, __va_list_tag*)+0x5d7>
   4579e:	89 c2                	mov    %eax,%edx
   457a0:	48 03 51 10          	add    0x10(%rcx),%rdx
   457a4:	83 c0 08             	add    $0x8,%eax
   457a7:	89 01                	mov    %eax,(%rcx)
   457a9:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
   457ac:	41 bb 00 00 00 00    	mov    $0x0,%r11d
        if (flags & FLAG_NUMERIC) {
   457b2:	44 89 f0             	mov    %r14d,%eax
   457b5:	83 e0 40             	and    $0x40,%eax
   457b8:	89 45 94             	mov    %eax,-0x6c(%rbp)
        const char* prefix = "";
   457bb:	41 bc 65 61 04 00    	mov    $0x46165,%r12d
        if (flags & FLAG_NUMERIC) {
   457c1:	0f 85 e9 03 00 00    	jne    45bb0 <printer::vprintf(char const*, __va_list_tag*)+0x888>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
   457c7:	8b 55 a4             	mov    -0x5c(%rbp),%edx
   457ca:	89 d0                	mov    %edx,%eax
   457cc:	f7 d0                	not    %eax
   457ce:	c1 e8 1f             	shr    $0x1f,%eax
   457d1:	89 45 90             	mov    %eax,-0x70(%rbp)
   457d4:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
   457d8:	0f 85 54 03 00 00    	jne    45b32 <printer::vprintf(char const*, __va_list_tag*)+0x80a>
   457de:	84 c0                	test   %al,%al
   457e0:	0f 84 4c 03 00 00    	je     45b32 <printer::vprintf(char const*, __va_list_tag*)+0x80a>
            datalen = strnlen(data, precision);
   457e6:	48 63 f2             	movslq %edx,%rsi
   457e9:	48 89 df             	mov    %rbx,%rdi
   457ec:	e8 40 fa ff ff       	call   45231 <strnlen>
   457f1:	89 45 a0             	mov    %eax,-0x60(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
   457f4:	44 89 f0             	mov    %r14d,%eax
   457f7:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
   457fa:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
   45801:	83 f8 42             	cmp    $0x42,%eax
   45804:	0f 84 60 03 00 00    	je     45b6a <printer::vprintf(char const*, __va_list_tag*)+0x842>
        width -= datalen + zeros + strlen(prefix);
   4580a:	4c 89 e7             	mov    %r12,%rdi
   4580d:	e8 00 fa ff ff       	call   45212 <strlen>
   45812:	8b 55 a4             	mov    -0x5c(%rbp),%edx
   45815:	8b 7d a0             	mov    -0x60(%rbp),%edi
   45818:	8d 0c 3a             	lea    (%rdx,%rdi,1),%ecx
   4581b:	44 89 ea             	mov    %r13d,%edx
   4581e:	29 ca                	sub    %ecx,%edx
   45820:	29 c2                	sub    %eax,%edx
   45822:	41 89 d5             	mov    %edx,%r13d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   45825:	41 f6 c6 04          	test   $0x4,%r14b
   45829:	75 31                	jne    4585c <printer::vprintf(char const*, __va_list_tag*)+0x534>
   4582b:	85 d2                	test   %edx,%edx
   4582d:	7e 2d                	jle    4585c <printer::vprintf(char const*, __va_list_tag*)+0x534>
        width -= datalen + zeros + strlen(prefix);
   4582f:	41 89 d6             	mov    %edx,%r14d
            putc(' ');
   45832:	49 8b 07             	mov    (%r15),%rax
   45835:	be 20 00 00 00       	mov    $0x20,%esi
   4583a:	4c 89 ff             	mov    %r15,%rdi
   4583d:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
   4583f:	41 83 ed 01          	sub    $0x1,%r13d
   45843:	45 85 ed             	test   %r13d,%r13d
   45846:	7f ea                	jg     45832 <printer::vprintf(char const*, __va_list_tag*)+0x50a>
   45848:	44 89 f2             	mov    %r14d,%edx
   4584b:	45 85 f6             	test   %r14d,%r14d
   4584e:	b8 01 00 00 00       	mov    $0x1,%eax
   45853:	41 0f 4f c6          	cmovg  %r14d,%eax
   45857:	29 c2                	sub    %eax,%edx
   45859:	41 89 d5             	mov    %edx,%r13d
        for (; *prefix; ++prefix) {
   4585c:	41 0f b6 04 24       	movzbl (%r12),%eax
   45861:	84 c0                	test   %al,%al
   45863:	74 18                	je     4587d <printer::vprintf(char const*, __va_list_tag*)+0x555>
            putc(*prefix);
   45865:	0f b6 f0             	movzbl %al,%esi
   45868:	49 8b 07             	mov    (%r15),%rax
   4586b:	4c 89 ff             	mov    %r15,%rdi
   4586e:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
   45870:	49 83 c4 01          	add    $0x1,%r12
   45874:	41 0f b6 04 24       	movzbl (%r12),%eax
   45879:	84 c0                	test   %al,%al
   4587b:	75 e8                	jne    45865 <printer::vprintf(char const*, __va_list_tag*)+0x53d>
        for (; zeros > 0; --zeros) {
   4587d:	44 8b 65 a4          	mov    -0x5c(%rbp),%r12d
   45881:	45 85 e4             	test   %r12d,%r12d
   45884:	7e 13                	jle    45899 <printer::vprintf(char const*, __va_list_tag*)+0x571>
            putc('0');
   45886:	49 8b 07             	mov    (%r15),%rax
   45889:	be 30 00 00 00       	mov    $0x30,%esi
   4588e:	4c 89 ff             	mov    %r15,%rdi
   45891:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
   45893:	41 83 ec 01          	sub    $0x1,%r12d
   45897:	75 ed                	jne    45886 <printer::vprintf(char const*, __va_list_tag*)+0x55e>
        for (; datalen > 0; ++data, --datalen) {
   45899:	8b 45 a0             	mov    -0x60(%rbp),%eax
   4589c:	85 c0                	test   %eax,%eax
   4589e:	7e 1a                	jle    458ba <printer::vprintf(char const*, __va_list_tag*)+0x592>
   458a0:	41 89 c6             	mov    %eax,%r14d
   458a3:	49 01 de             	add    %rbx,%r14
            putc(*data);
   458a6:	0f b6 33             	movzbl (%rbx),%esi
   458a9:	49 8b 07             	mov    (%r15),%rax
   458ac:	4c 89 ff             	mov    %r15,%rdi
   458af:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
   458b1:	48 83 c3 01          	add    $0x1,%rbx
   458b5:	49 39 de             	cmp    %rbx,%r14
   458b8:	75 ec                	jne    458a6 <printer::vprintf(char const*, __va_list_tag*)+0x57e>
        for (; width > 0; --width) {
   458ba:	45 85 ed             	test   %r13d,%r13d
   458bd:	7e 13                	jle    458d2 <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            putc(' ');
   458bf:	49 8b 07             	mov    (%r15),%rax
   458c2:	be 20 00 00 00       	mov    $0x20,%esi
   458c7:	4c 89 ff             	mov    %r15,%rdi
   458ca:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
   458cc:	41 83 ed 01          	sub    $0x1,%r13d
   458d0:	75 ed                	jne    458bf <printer::vprintf(char const*, __va_list_tag*)+0x597>
    for (; *format; ++format) {
   458d2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
   458d6:	4c 8d 60 01          	lea    0x1(%rax),%r12
   458da:	0f b6 40 01          	movzbl 0x1(%rax),%eax
   458de:	84 c0                	test   %al,%al
   458e0:	0f 84 6c fa ff ff    	je     45352 <printer::vprintf(char const*, __va_list_tag*)+0x2a>
        if (*format != '%') {
   458e6:	3c 25                	cmp    $0x25,%al
   458e8:	0f 84 73 fa ff ff    	je     45361 <printer::vprintf(char const*, __va_list_tag*)+0x39>
            putc(*format);
   458ee:	0f b6 f0             	movzbl %al,%esi
   458f1:	49 8b 07             	mov    (%r15),%rax
   458f4:	4c 89 ff             	mov    %r15,%rdi
   458f7:	ff 10                	call   *(%rax)
            continue;
   458f9:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
   458fd:	eb d3                	jmp    458d2 <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            data = va_arg(val, char*);
   458ff:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
   45903:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   45907:	48 8d 42 08          	lea    0x8(%rdx),%rax
   4590b:	48 89 41 08          	mov    %rax,0x8(%rcx)
   4590f:	e9 95 fe ff ff       	jmp    457a9 <printer::vprintf(char const*, __va_list_tag*)+0x481>
        switch (*format) {
   45914:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   45918:	eb 04                	jmp    4591e <printer::vprintf(char const*, __va_list_tag*)+0x5f6>
   4591a:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            color_ = va_arg(val, int);
   4591e:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
   45922:	8b 07                	mov    (%rdi),%eax
   45924:	83 f8 2f             	cmp    $0x2f,%eax
   45927:	77 13                	ja     4593c <printer::vprintf(char const*, __va_list_tag*)+0x614>
   45929:	89 c2                	mov    %eax,%edx
   4592b:	48 03 57 10          	add    0x10(%rdi),%rdx
   4592f:	83 c0 08             	add    $0x8,%eax
   45932:	89 07                	mov    %eax,(%rdi)
   45934:	8b 02                	mov    (%rdx),%eax
   45936:	41 89 47 08          	mov    %eax,0x8(%r15)
            continue;
   4593a:	eb 96                	jmp    458d2 <printer::vprintf(char const*, __va_list_tag*)+0x5aa>
            color_ = va_arg(val, int);
   4593c:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
   45940:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   45944:	48 8d 42 08          	lea    0x8(%rdx),%rax
   45948:	48 89 47 08          	mov    %rax,0x8(%rdi)
   4594c:	eb e6                	jmp    45934 <printer::vprintf(char const*, __va_list_tag*)+0x60c>
        switch (*format) {
   4594e:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
   45952:	eb 04                	jmp    45958 <printer::vprintf(char const*, __va_list_tag*)+0x630>
   45954:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = va_arg(val, int);
   45958:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
   4595c:	8b 01                	mov    (%rcx),%eax
   4595e:	83 f8 2f             	cmp    $0x2f,%eax
   45961:	77 23                	ja     45986 <printer::vprintf(char const*, __va_list_tag*)+0x65e>
   45963:	89 c2                	mov    %eax,%edx
   45965:	48 03 51 10          	add    0x10(%rcx),%rdx
   45969:	83 c0 08             	add    $0x8,%eax
   4596c:	89 01                	mov    %eax,(%rcx)
   4596e:	8b 02                	mov    (%rdx),%eax
   45970:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
   45973:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
   45977:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
   4597b:	41 bb 00 00 00 00    	mov    $0x0,%r11d
            break;
   45981:	e9 2c fe ff ff       	jmp    457b2 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
            numbuf[0] = va_arg(val, int);
   45986:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
   4598a:	48 8b 51 08          	mov    0x8(%rcx),%rdx
   4598e:	48 8d 42 08          	lea    0x8(%rdx),%rax
   45992:	48 89 41 08          	mov    %rax,0x8(%rcx)
   45996:	eb d6                	jmp    4596e <printer::vprintf(char const*, __va_list_tag*)+0x646>
        switch (*format) {
   45998:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = (*format ? *format : '%');
   4599c:	84 c0                	test   %al,%al
   4599e:	0f 85 ee 01 00 00    	jne    45b92 <printer::vprintf(char const*, __va_list_tag*)+0x86a>
   459a4:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
   459a8:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
   459ac:	48 83 6d a8 01       	subq   $0x1,-0x58(%rbp)
            data = numbuf;
   459b1:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
   459b5:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   459bb:	e9 f2 fd ff ff       	jmp    457b2 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
    *--pos = '\0';
   459c0:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
   459c4:	41 f6 c6 20          	test   $0x20,%r14b
   459c8:	74 73                	je     45a3d <printer::vprintf(char const*, __va_list_tag*)+0x715>
        thousands_pos = pos - (base == 10 ? 3 : 4);
   459ca:	8b 55 a0             	mov    -0x60(%rbp),%edx
   459cd:	41 89 d1             	mov    %edx,%r9d
   459d0:	41 89 c6             	mov    %eax,%r14d
   459d3:	41 ba 90 72 04 00    	mov    $0x47290,%r10d
   459d9:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
   459e0:	83 fa 0a             	cmp    $0xa,%edx
   459e3:	0f 94 c0             	sete   %al
   459e6:	0f b6 c0             	movzbl %al,%eax
   459e9:	48 83 e8 04          	sub    $0x4,%rax
   459ed:	eb 1d                	jmp    45a0c <printer::vprintf(char const*, __va_list_tag*)+0x6e4>
    if (flags & FLAG_THOUSANDS) {
   459ef:	41 89 c6             	mov    %eax,%r14d
        digits = lower_digits;
   459f2:	41 ba 70 72 04 00    	mov    $0x47270,%r10d
        base = -base;
   459f8:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
   459fe:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
   45a05:	48 c7 c0 fc ff ff ff 	mov    $0xfffffffffffffffc,%rax
   45a0c:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
   45a11:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
   45a15:	4c 89 d8             	mov    %r11,%rax
            *--pos = digits[val % base];
   45a18:	49 63 f1             	movslq %r9d,%rsi
    } while (val != 0 && pos != buf);
   45a1b:	4c 8d 45 b0          	lea    -0x50(%rbp),%r8
   45a1f:	eb 57                	jmp    45a78 <printer::vprintf(char const*, __va_list_tag*)+0x750>
    if (flags & FLAG_THOUSANDS) {
   45a21:	41 ba 90 72 04 00    	mov    $0x47290,%r10d
   45a27:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
   45a2d:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
   45a34:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
   45a3b:	eb cf                	jmp    45a0c <printer::vprintf(char const*, __va_list_tag*)+0x6e4>
   45a3d:	44 8b 4d a0          	mov    -0x60(%rbp),%r9d
   45a41:	41 89 c6             	mov    %eax,%r14d
   45a44:	41 ba 90 72 04 00    	mov    $0x47290,%r10d
   45a4a:	c7 45 94 40 00 00 00 	movl   $0x40,-0x6c(%rbp)
        thousands_pos = nullptr;
   45a51:	bf 00 00 00 00       	mov    $0x0,%edi
   45a56:	eb b9                	jmp    45a11 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
            *--pos = digits[val % base];
   45a58:	48 89 cb             	mov    %rcx,%rbx
   45a5b:	ba 00 00 00 00       	mov    $0x0,%edx
   45a60:	48 f7 f6             	div    %rsi
   45a63:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
   45a68:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
   45a6a:	48 83 e9 01          	sub    $0x1,%rcx
   45a6e:	48 85 c0             	test   %rax,%rax
   45a71:	74 2d                	je     45aa0 <printer::vprintf(char const*, __va_list_tag*)+0x778>
   45a73:	4c 39 c3             	cmp    %r8,%rbx
   45a76:	74 28                	je     45aa0 <printer::vprintf(char const*, __va_list_tag*)+0x778>
        if (pos == thousands_pos) {
   45a78:	48 8d 51 01          	lea    0x1(%rcx),%rdx
   45a7c:	48 39 d7             	cmp    %rdx,%rdi
   45a7f:	75 d7                	jne    45a58 <printer::vprintf(char const*, __va_list_tag*)+0x730>
            *--pos = base == 10 ? ',' : '\'';
   45a81:	48 89 cb             	mov    %rcx,%rbx
   45a84:	41 83 f9 0a          	cmp    $0xa,%r9d
   45a88:	0f 94 c2             	sete   %dl
   45a8b:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
   45a8f:	40 0f 94 c7          	sete   %dil
   45a93:	40 0f b6 ff          	movzbl %dil,%edi
   45a97:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
   45a99:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
   45a9e:	eb ca                	jmp    45a6a <printer::vprintf(char const*, __va_list_tag*)+0x742>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
   45aa0:	44 89 f0             	mov    %r14d,%eax
   45aa3:	f7 d0                	not    %eax
   45aa5:	a8 c0                	test   $0xc0,%al
   45aa7:	75 3b                	jne    45ae4 <printer::vprintf(char const*, __va_list_tag*)+0x7bc>
                prefix = "-";
   45aa9:	41 bc ae 62 04 00    	mov    $0x462ae,%r12d
            if (flags & FLAG_NEGATIVE) {
   45aaf:	41 f7 c6 00 01 00 00 	test   $0x100,%r14d
   45ab6:	0f 85 0b fd ff ff    	jne    457c7 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                prefix = "+";
   45abc:	41 bc a9 62 04 00    	mov    $0x462a9,%r12d
            } else if (flags & FLAG_PLUSPOSITIVE) {
   45ac2:	41 f6 c6 10          	test   $0x10,%r14b
   45ac6:	0f 85 fb fc ff ff    	jne    457c7 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
        const char* prefix = "";
   45acc:	41 f6 c6 08          	test   $0x8,%r14b
   45ad0:	41 bc 92 60 04 00    	mov    $0x46092,%r12d
   45ad6:	b8 65 61 04 00       	mov    $0x46165,%eax
   45adb:	4c 0f 44 e0          	cmove  %rax,%r12
   45adf:	e9 e3 fc ff ff       	jmp    457c7 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
   45ae4:	41 bc 65 61 04 00    	mov    $0x46165,%r12d
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
   45aea:	44 89 f0             	mov    %r14d,%eax
   45aed:	f7 d0                	not    %eax
   45aef:	a8 41                	test   $0x41,%al
   45af1:	0f 85 d0 fc ff ff    	jne    457c7 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                   && (base == 16 || base == -16)
   45af7:	8b 45 a0             	mov    -0x60(%rbp),%eax
   45afa:	83 c0 10             	add    $0x10,%eax
   45afd:	a9 df ff ff ff       	test   $0xffffffdf,%eax
   45b02:	0f 85 bf fc ff ff    	jne    457c7 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
                   && (num || (flags & FLAG_ALT2))) {
   45b08:	4d 85 db             	test   %r11,%r11
   45b0b:	75 0d                	jne    45b1a <printer::vprintf(char const*, __va_list_tag*)+0x7f2>
   45b0d:	41 f7 c6 00 02 00 00 	test   $0x200,%r14d
   45b14:	0f 84 ad fc ff ff    	je     457c7 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
            prefix = (base == -16 ? "0x" : "0X");
   45b1a:	83 7d a0 f0          	cmpl   $0xfffffff0,-0x60(%rbp)
   45b1e:	41 bc ab 62 04 00    	mov    $0x462ab,%r12d
   45b24:	b8 b0 62 04 00       	mov    $0x462b0,%eax
   45b29:	4c 0f 44 e0          	cmove  %rax,%r12
   45b2d:	e9 95 fc ff ff       	jmp    457c7 <printer::vprintf(char const*, __va_list_tag*)+0x49f>
            datalen = strlen(data);
   45b32:	48 89 df             	mov    %rbx,%rdi
   45b35:	e8 d8 f6 ff ff       	call   45212 <strlen>
   45b3a:	89 45 a0             	mov    %eax,-0x60(%rbp)
            && precision >= 0) {
   45b3d:	83 7d 94 00          	cmpl   $0x0,-0x6c(%rbp)
   45b41:	0f 84 ad fc ff ff    	je     457f4 <printer::vprintf(char const*, __va_list_tag*)+0x4cc>
   45b47:	80 7d 90 00          	cmpb   $0x0,-0x70(%rbp)
   45b4b:	0f 84 a3 fc ff ff    	je     457f4 <printer::vprintf(char const*, __va_list_tag*)+0x4cc>
            zeros = precision > datalen ? precision - datalen : 0;
   45b51:	8b 7d a4             	mov    -0x5c(%rbp),%edi
   45b54:	89 fa                	mov    %edi,%edx
   45b56:	29 c2                	sub    %eax,%edx
   45b58:	39 c7                	cmp    %eax,%edi
   45b5a:	b8 00 00 00 00       	mov    $0x0,%eax
   45b5f:	0f 4f c2             	cmovg  %edx,%eax
   45b62:	89 45 a4             	mov    %eax,-0x5c(%rbp)
   45b65:	e9 a0 fc ff ff       	jmp    4580a <printer::vprintf(char const*, __va_list_tag*)+0x4e2>
                   && datalen + (int) strlen(prefix) < width) {
   45b6a:	4c 89 e7             	mov    %r12,%rdi
   45b6d:	e8 a0 f6 ff ff       	call   45212 <strlen>
   45b72:	8b 7d a0             	mov    -0x60(%rbp),%edi
   45b75:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
   45b78:	44 89 e9             	mov    %r13d,%ecx
   45b7b:	29 f9                	sub    %edi,%ecx
   45b7d:	29 c1                	sub    %eax,%ecx
   45b7f:	44 39 ea             	cmp    %r13d,%edx
   45b82:	b8 00 00 00 00       	mov    $0x0,%eax
   45b87:	0f 4c c1             	cmovl  %ecx,%eax
   45b8a:	89 45 a4             	mov    %eax,-0x5c(%rbp)
   45b8d:	e9 78 fc ff ff       	jmp    4580a <printer::vprintf(char const*, __va_list_tag*)+0x4e2>
   45b92:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
            numbuf[0] = (*format ? *format : '%');
   45b96:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
   45b99:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
   45b9d:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = numbuf;
   45ba1:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
   45ba5:	41 bb 00 00 00 00    	mov    $0x0,%r11d
   45bab:	e9 02 fc ff ff       	jmp    457b2 <printer::vprintf(char const*, __va_list_tag*)+0x48a>
    *--pos = '\0';
   45bb0:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
   45bb4:	41 f6 c6 20          	test   $0x20,%r14b
   45bb8:	0f 85 63 fe ff ff    	jne    45a21 <printer::vprintf(char const*, __va_list_tag*)+0x6f9>
   45bbe:	41 ba 90 72 04 00    	mov    $0x47290,%r10d
   45bc4:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
   45bca:	c7 45 a0 0a 00 00 00 	movl   $0xa,-0x60(%rbp)
        thousands_pos = nullptr;
   45bd1:	bf 00 00 00 00       	mov    $0x0,%edi
   45bd6:	e9 36 fe ff ff       	jmp    45a11 <printer::vprintf(char const*, __va_list_tag*)+0x6e9>
   45bdb:	90                   	nop

0000000000045bdc <printer::printf(char const*, ...)>:
void printer::printf(const char* format, ...) {
   45bdc:	f3 0f 1e fa          	endbr64
   45be0:	55                   	push   %rbp
   45be1:	48 89 e5             	mov    %rsp,%rbp
   45be4:	48 83 ec 50          	sub    $0x50,%rsp
   45be8:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
   45bec:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   45bf0:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   45bf4:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_start(val, format);
   45bf8:	c7 45 b8 10 00 00 00 	movl   $0x10,-0x48(%rbp)
   45bff:	48 8d 45 10          	lea    0x10(%rbp),%rax
   45c03:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   45c07:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   45c0b:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    vprintf(format, val);
   45c0f:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
   45c13:	e8 10 f7 ff ff       	call   45328 <printer::vprintf(char const*, __va_list_tag*)>
}
   45c18:	c9                   	leave
   45c19:	c3                   	ret

0000000000045c1a <console_clear()>:


// console_clear
//    Erases the console and moves the cursor to the upper left (CPOS(0, 0)).

void console_clear() {
   45c1a:	f3 0f 1e fa          	endbr64
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   45c1e:	b8 00 00 00 00       	mov    $0x0,%eax
        console[i] = ' ' | 0x0700;
   45c23:	48 63 d0             	movslq %eax,%rdx
   45c26:	66 c7 84 12 00 80 0b 	movw   $0x720,0xb8000(%rdx,%rdx,1)
   45c2d:	00 20 07 
    for (int i = 0; i < CONSOLE_ROWS * CONSOLE_COLUMNS; ++i) {
   45c30:	83 c0 01             	add    $0x1,%eax
   45c33:	3d d0 07 00 00       	cmp    $0x7d0,%eax
   45c38:	75 e9                	jne    45c23 <console_clear()+0x9>
    }
    cursorpos = 0;
   45c3a:	c7 05 b8 33 07 00 00 	movl   $0x0,0x733b8(%rip)        # b8ffc <cursorpos>
   45c41:	00 00 00 
}
   45c44:	c3                   	ret
   45c45:	90                   	nop

0000000000045c46 <console_printer::console_printer(int, bool, int)>:

// console_puts
//    Put a string to the console, starting at the given cursor position.

__noinline
console_printer::console_printer(int cpos, bool scroll, int color)
   45c46:	f3 0f 1e fa          	endbr64
    : cell_(console), scroll_(scroll) {
   45c4a:	48 c7 07 b8 72 04 00 	movq   $0x472b8,(%rdi)
   45c51:	48 c7 47 10 00 80 0b 	movq   $0xb8000,0x10(%rdi)
   45c58:	00 
   45c59:	88 57 18             	mov    %dl,0x18(%rdi)
    color_ = color;
   45c5c:	89 4f 08             	mov    %ecx,0x8(%rdi)
    if (cpos < 0) {
   45c5f:	85 f6                	test   %esi,%esi
   45c61:	78 18                	js     45c7b <console_printer::console_printer(int, bool, int)+0x35>
        cell_ += cursorpos;
    } else if (cpos <= CONSOLE_ROWS * CONSOLE_COLUMNS) {
   45c63:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
   45c69:	7f 0f                	jg     45c7a <console_printer::console_printer(int, bool, int)+0x34>
        cell_ += cpos;
   45c6b:	48 63 f6             	movslq %esi,%rsi
   45c6e:	48 8d 84 36 00 80 0b 	lea    0xb8000(%rsi,%rsi,1),%rax
   45c75:	00 
   45c76:	48 89 47 10          	mov    %rax,0x10(%rdi)
    }
}
   45c7a:	c3                   	ret
        cell_ += cursorpos;
   45c7b:	8b 05 7b 33 07 00    	mov    0x7337b(%rip),%eax        # b8ffc <cursorpos>
   45c81:	48 98                	cltq
   45c83:	48 8d 84 00 00 80 0b 	lea    0xb8000(%rax,%rax,1),%rax
   45c8a:	00 
   45c8b:	48 89 47 10          	mov    %rax,0x10(%rdi)
   45c8f:	c3                   	ret

0000000000045c90 <console_printer::scroll()>:

__noinline
void console_printer::scroll() {
   45c90:	f3 0f 1e fa          	endbr64
    assert(cell_ >= console + END_CPOS);
   45c94:	48 81 7f 10 a0 8f 0b 	cmpq   $0xb8fa0,0x10(%rdi)
   45c9b:	00 
   45c9c:	72 56                	jb     45cf4 <console_printer::scroll()+0x64>
    if (scroll_) {
   45c9e:	b8 00 80 0b 00       	mov    $0xb8000,%eax
   45ca3:	80 7f 18 00          	cmpb   $0x0,0x18(%rdi)
   45ca7:	74 46                	je     45cef <console_printer::scroll()+0x5f>
        for (int i = 0; i != END_CPOS - CONSOLE_COLUMNS; ++i) {
   45ca9:	b8 00 00 00 00       	mov    $0x0,%eax
            console[i] = console[i + CONSOLE_COLUMNS];
   45cae:	8d 50 50             	lea    0x50(%rax),%edx
   45cb1:	b9 00 80 0b 00       	mov    $0xb8000,%ecx
   45cb6:	48 63 d2             	movslq %edx,%rdx
   45cb9:	0f b7 34 51          	movzwl (%rcx,%rdx,2),%esi
   45cbd:	48 63 d0             	movslq %eax,%rdx
   45cc0:	66 89 34 51          	mov    %si,(%rcx,%rdx,2)
        for (int i = 0; i != END_CPOS - CONSOLE_COLUMNS; ++i) {
   45cc4:	83 c0 01             	add    $0x1,%eax
   45cc7:	3d 80 07 00 00       	cmp    $0x780,%eax
   45ccc:	75 e0                	jne    45cae <console_printer::scroll()+0x1e>
        }
        for (int i = END_CPOS - CONSOLE_COLUMNS; i != END_CPOS; ++i) {
            console[i] = 0;
   45cce:	48 63 d0             	movslq %eax,%rdx
   45cd1:	66 c7 84 12 00 80 0b 	movw   $0x0,0xb8000(%rdx,%rdx,1)
   45cd8:	00 00 00 
        for (int i = END_CPOS - CONSOLE_COLUMNS; i != END_CPOS; ++i) {
   45cdb:	83 c0 01             	add    $0x1,%eax
   45cde:	3d d0 07 00 00       	cmp    $0x7d0,%eax
   45ce3:	75 e9                	jne    45cce <console_printer::scroll()+0x3e>
        }
        cell_ -= CONSOLE_COLUMNS;
   45ce5:	48 8b 47 10          	mov    0x10(%rdi),%rax
   45ce9:	48 2d a0 00 00 00    	sub    $0xa0,%rax
   45cef:	48 89 47 10          	mov    %rax,0x10(%rdi)
   45cf3:	c3                   	ret
void console_printer::scroll() {
   45cf4:	55                   	push   %rbp
   45cf5:	48 89 e5             	mov    %rsp,%rbp
    assert(cell_ >= console + END_CPOS);
   45cf8:	b9 00 00 00 00       	mov    $0x0,%ecx
   45cfd:	ba b3 62 04 00       	mov    $0x462b3,%edx
   45d02:	be 8a 02 00 00       	mov    $0x28a,%esi
   45d07:	bf a2 62 04 00       	mov    $0x462a2,%edi
   45d0c:	e8 ac d9 ff ff       	call   436bd <assert_fail(char const*, int, char const*, char const*)>
   45d11:	90                   	nop

0000000000045d12 <console_printer::putc(unsigned char)>:
    extern void console_show_cursor(int);
    console_show_cursor(cursorpos);
#endif
}

void console_printer::putc(unsigned char c) {
   45d12:	f3 0f 1e fa          	endbr64
   45d16:	55                   	push   %rbp
   45d17:	48 89 e5             	mov    %rsp,%rbp
   45d1a:	41 54                	push   %r12
   45d1c:	53                   	push   %rbx
   45d1d:	48 89 fb             	mov    %rdi,%rbx
   45d20:	41 89 f4             	mov    %esi,%r12d
    while (cell_ >= console + END_CPOS) {
   45d23:	48 8b 47 10          	mov    0x10(%rdi),%rax
   45d27:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
   45d2d:	72 14                	jb     45d43 <console_printer::putc(unsigned char)+0x31>
        scroll();
   45d2f:	48 89 df             	mov    %rbx,%rdi
   45d32:	e8 59 ff ff ff       	call   45c90 <console_printer::scroll()>
    while (cell_ >= console + END_CPOS) {
   45d37:	48 8b 43 10          	mov    0x10(%rbx),%rax
   45d3b:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
   45d41:	73 ec                	jae    45d2f <console_printer::putc(unsigned char)+0x1d>
    }
    if (c == '\n') {
   45d43:	41 80 fc 0a          	cmp    $0xa,%r12b
   45d47:	74 1a                	je     45d63 <console_printer::putc(unsigned char)+0x51>
        while (pos != 80) {
            *cell_++ = ' ' | color_;
            ++pos;
        }
    } else {
        *cell_++ = c | color_;
   45d49:	45 0f b6 e4          	movzbl %r12b,%r12d
   45d4d:	66 44 0b 63 08       	or     0x8(%rbx),%r12w
   45d52:	48 8d 50 02          	lea    0x2(%rax),%rdx
   45d56:	48 89 53 10          	mov    %rdx,0x10(%rbx)
   45d5a:	66 44 89 20          	mov    %r12w,(%rax)
    }
}
   45d5e:	5b                   	pop    %rbx
   45d5f:	41 5c                	pop    %r12
   45d61:	5d                   	pop    %rbp
   45d62:	c3                   	ret
        int pos = (cell_ - console) % 80;
   45d63:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   45d69:	48 89 c1             	mov    %rax,%rcx
   45d6c:	48 89 c6             	mov    %rax,%rsi
   45d6f:	48 d1 fe             	sar    $1,%rsi
   45d72:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
   45d79:	66 66 66 
   45d7c:	48 89 f0             	mov    %rsi,%rax
   45d7f:	48 f7 ea             	imul   %rdx
   45d82:	48 c1 fa 05          	sar    $0x5,%rdx
   45d86:	48 89 c8             	mov    %rcx,%rax
   45d89:	48 c1 f8 3f          	sar    $0x3f,%rax
   45d8d:	48 29 c2             	sub    %rax,%rdx
   45d90:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
   45d94:	48 c1 e2 04          	shl    $0x4,%rdx
   45d98:	89 f0                	mov    %esi,%eax
   45d9a:	29 d0                	sub    %edx,%eax
            *cell_++ = ' ' | color_;
   45d9c:	0f b7 53 08          	movzwl 0x8(%rbx),%edx
   45da0:	83 ca 20             	or     $0x20,%edx
   45da3:	48 8b 4b 10          	mov    0x10(%rbx),%rcx
   45da7:	48 8d 71 02          	lea    0x2(%rcx),%rsi
   45dab:	48 89 73 10          	mov    %rsi,0x10(%rbx)
   45daf:	66 89 11             	mov    %dx,(%rcx)
            ++pos;
   45db2:	83 c0 01             	add    $0x1,%eax
        while (pos != 80) {
   45db5:	83 f8 50             	cmp    $0x50,%eax
   45db8:	75 e2                	jne    45d9c <console_printer::putc(unsigned char)+0x8a>
   45dba:	eb a2                	jmp    45d5e <console_printer::putc(unsigned char)+0x4c>

0000000000045dbc <console_printer::move_cursor()>:
void console_printer::move_cursor() {
   45dbc:	f3 0f 1e fa          	endbr64
   45dc0:	55                   	push   %rbp
   45dc1:	48 89 e5             	mov    %rsp,%rbp
    cursorpos = cell_ - console;
   45dc4:	48 8b 47 10          	mov    0x10(%rdi),%rax
   45dc8:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   45dce:	48 d1 f8             	sar    $1,%rax
   45dd1:	89 05 25 32 07 00    	mov    %eax,0x73225(%rip)        # b8ffc <cursorpos>
    console_show_cursor(cursorpos);
   45dd7:	8b 3d 1f 32 07 00    	mov    0x7321f(%rip),%edi        # b8ffc <cursorpos>
   45ddd:	e8 56 cd ff ff       	call   42b38 <console_show_cursor(int)>
}
   45de2:	5d                   	pop    %rbp
   45de3:	c3                   	ret

0000000000045de4 <console_vprintf(int, int, char const*, __va_list_tag*)>:

// console_vprintf, console_printf
//    Print a message onto the console, starting at the given cursor position.

__noinline
int console_vprintf(int cpos, int color, const char* format, va_list val) {
   45de4:	f3 0f 1e fa          	endbr64
   45de8:	55                   	push   %rbp
   45de9:	48 89 e5             	mov    %rsp,%rbp
   45dec:	41 55                	push   %r13
   45dee:	41 54                	push   %r12
   45df0:	53                   	push   %rbx
   45df1:	48 83 ec 28          	sub    $0x28,%rsp
   45df5:	89 fb                	mov    %edi,%ebx
   45df7:	49 89 d4             	mov    %rdx,%r12
   45dfa:	49 89 cd             	mov    %rcx,%r13
    console_printer cp(cpos, cpos < 0, color);
   45dfd:	89 fa                	mov    %edi,%edx
   45dff:	c1 ea 1f             	shr    $0x1f,%edx
   45e02:	89 f1                	mov    %esi,%ecx
   45e04:	89 fe                	mov    %edi,%esi
   45e06:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   45e0a:	e8 37 fe ff ff       	call   45c46 <console_printer::console_printer(int, bool, int)>
    cp.vprintf(format, val);
   45e0f:	4c 89 ea             	mov    %r13,%rdx
   45e12:	4c 89 e6             	mov    %r12,%rsi
   45e15:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   45e19:	e8 0a f5 ff ff       	call   45328 <printer::vprintf(char const*, __va_list_tag*)>
    if (cpos < 0) {
   45e1e:	85 db                	test   %ebx,%ebx
   45e20:	78 18                	js     45e3a <console_vprintf(int, int, char const*, __va_list_tag*)+0x56>
        cp.move_cursor();
    }
    return cp.cell_ - console;
   45e22:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
   45e26:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
   45e2c:	48 d1 f8             	sar    $1,%rax
}
   45e2f:	48 83 c4 28          	add    $0x28,%rsp
   45e33:	5b                   	pop    %rbx
   45e34:	41 5c                	pop    %r12
   45e36:	41 5d                	pop    %r13
   45e38:	5d                   	pop    %rbp
   45e39:	c3                   	ret
        cp.move_cursor();
   45e3a:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   45e3e:	e8 79 ff ff ff       	call   45dbc <console_printer::move_cursor()>
   45e43:	eb dd                	jmp    45e22 <console_vprintf(int, int, char const*, __va_list_tag*)+0x3e>

0000000000045e45 <console_printf(int, int, char const*, ...)>:

__noinline
int console_printf(int cpos, int color, const char* format, ...) {
   45e45:	f3 0f 1e fa          	endbr64
   45e49:	55                   	push   %rbp
   45e4a:	48 89 e5             	mov    %rsp,%rbp
   45e4d:	48 83 ec 50          	sub    $0x50,%rsp
   45e51:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   45e55:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   45e59:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   45e5d:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   45e64:	48 8d 45 10          	lea    0x10(%rbp),%rax
   45e68:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   45e6c:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   45e70:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
   45e74:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   45e78:	e8 67 ff ff ff       	call   45de4 <console_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
    return cpos;
}
   45e7d:	c9                   	leave
   45e7e:	c3                   	ret

0000000000045e7f <error_printf(int, int, char const*, ...)>:


// k-hardware.cc/u-lib.cc supply error_vprintf

__noinline
void error_printf(int cpos, int color, const char* format, ...) {
   45e7f:	f3 0f 1e fa          	endbr64
   45e83:	55                   	push   %rbp
   45e84:	48 89 e5             	mov    %rsp,%rbp
   45e87:	48 83 ec 50          	sub    $0x50,%rsp
   45e8b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
   45e8f:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
   45e93:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
   45e97:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
   45e9e:	48 8d 45 10          	lea    0x10(%rbp),%rax
   45ea2:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
   45ea6:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
   45eaa:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    error_vprintf(cpos, color, format, val);
   45eae:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
   45eb2:	e8 52 cf ff ff       	call   42e09 <error_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
}
   45eb7:	c9                   	leave
   45eb8:	c3                   	ret

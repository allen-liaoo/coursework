
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000003000 <_init>:
    3000:	f3 0f 1e fa          	endbr64 
    3004:	48 83 ec 08          	sub    $0x8,%rsp
    3008:	48 8b 05 d9 5f 00 00 	mov    0x5fd9(%rip),%rax        # 8fe8 <__gmon_start__>
    300f:	48 85 c0             	test   %rax,%rax
    3012:	74 02                	je     3016 <_init+0x16>
    3014:	ff d0                	callq  *%rax
    3016:	48 83 c4 08          	add    $0x8,%rsp
    301a:	c3                   	retq   

Disassembly of section .plt:

0000000000003020 <.plt>:
    3020:	ff 35 c2 5e 00 00    	pushq  0x5ec2(%rip)        # 8ee8 <_GLOBAL_OFFSET_TABLE_+0x8>
    3026:	f2 ff 25 c3 5e 00 00 	bnd jmpq *0x5ec3(%rip)        # 8ef0 <_GLOBAL_OFFSET_TABLE_+0x10>
    302d:	0f 1f 00             	nopl   (%rax)
    3030:	f3 0f 1e fa          	endbr64 
    3034:	68 00 00 00 00       	pushq  $0x0
    3039:	f2 e9 e1 ff ff ff    	bnd jmpq 3020 <.plt>
    303f:	90                   	nop
    3040:	f3 0f 1e fa          	endbr64 
    3044:	68 01 00 00 00       	pushq  $0x1
    3049:	f2 e9 d1 ff ff ff    	bnd jmpq 3020 <.plt>
    304f:	90                   	nop
    3050:	f3 0f 1e fa          	endbr64 
    3054:	68 02 00 00 00       	pushq  $0x2
    3059:	f2 e9 c1 ff ff ff    	bnd jmpq 3020 <.plt>
    305f:	90                   	nop
    3060:	f3 0f 1e fa          	endbr64 
    3064:	68 03 00 00 00       	pushq  $0x3
    3069:	f2 e9 b1 ff ff ff    	bnd jmpq 3020 <.plt>
    306f:	90                   	nop
    3070:	f3 0f 1e fa          	endbr64 
    3074:	68 04 00 00 00       	pushq  $0x4
    3079:	f2 e9 a1 ff ff ff    	bnd jmpq 3020 <.plt>
    307f:	90                   	nop
    3080:	f3 0f 1e fa          	endbr64 
    3084:	68 05 00 00 00       	pushq  $0x5
    3089:	f2 e9 91 ff ff ff    	bnd jmpq 3020 <.plt>
    308f:	90                   	nop
    3090:	f3 0f 1e fa          	endbr64 
    3094:	68 06 00 00 00       	pushq  $0x6
    3099:	f2 e9 81 ff ff ff    	bnd jmpq 3020 <.plt>
    309f:	90                   	nop
    30a0:	f3 0f 1e fa          	endbr64 
    30a4:	68 07 00 00 00       	pushq  $0x7
    30a9:	f2 e9 71 ff ff ff    	bnd jmpq 3020 <.plt>
    30af:	90                   	nop
    30b0:	f3 0f 1e fa          	endbr64 
    30b4:	68 08 00 00 00       	pushq  $0x8
    30b9:	f2 e9 61 ff ff ff    	bnd jmpq 3020 <.plt>
    30bf:	90                   	nop
    30c0:	f3 0f 1e fa          	endbr64 
    30c4:	68 09 00 00 00       	pushq  $0x9
    30c9:	f2 e9 51 ff ff ff    	bnd jmpq 3020 <.plt>
    30cf:	90                   	nop
    30d0:	f3 0f 1e fa          	endbr64 
    30d4:	68 0a 00 00 00       	pushq  $0xa
    30d9:	f2 e9 41 ff ff ff    	bnd jmpq 3020 <.plt>
    30df:	90                   	nop
    30e0:	f3 0f 1e fa          	endbr64 
    30e4:	68 0b 00 00 00       	pushq  $0xb
    30e9:	f2 e9 31 ff ff ff    	bnd jmpq 3020 <.plt>
    30ef:	90                   	nop
    30f0:	f3 0f 1e fa          	endbr64 
    30f4:	68 0c 00 00 00       	pushq  $0xc
    30f9:	f2 e9 21 ff ff ff    	bnd jmpq 3020 <.plt>
    30ff:	90                   	nop
    3100:	f3 0f 1e fa          	endbr64 
    3104:	68 0d 00 00 00       	pushq  $0xd
    3109:	f2 e9 11 ff ff ff    	bnd jmpq 3020 <.plt>
    310f:	90                   	nop
    3110:	f3 0f 1e fa          	endbr64 
    3114:	68 0e 00 00 00       	pushq  $0xe
    3119:	f2 e9 01 ff ff ff    	bnd jmpq 3020 <.plt>
    311f:	90                   	nop
    3120:	f3 0f 1e fa          	endbr64 
    3124:	68 0f 00 00 00       	pushq  $0xf
    3129:	f2 e9 f1 fe ff ff    	bnd jmpq 3020 <.plt>
    312f:	90                   	nop
    3130:	f3 0f 1e fa          	endbr64 
    3134:	68 10 00 00 00       	pushq  $0x10
    3139:	f2 e9 e1 fe ff ff    	bnd jmpq 3020 <.plt>
    313f:	90                   	nop
    3140:	f3 0f 1e fa          	endbr64 
    3144:	68 11 00 00 00       	pushq  $0x11
    3149:	f2 e9 d1 fe ff ff    	bnd jmpq 3020 <.plt>
    314f:	90                   	nop
    3150:	f3 0f 1e fa          	endbr64 
    3154:	68 12 00 00 00       	pushq  $0x12
    3159:	f2 e9 c1 fe ff ff    	bnd jmpq 3020 <.plt>
    315f:	90                   	nop
    3160:	f3 0f 1e fa          	endbr64 
    3164:	68 13 00 00 00       	pushq  $0x13
    3169:	f2 e9 b1 fe ff ff    	bnd jmpq 3020 <.plt>
    316f:	90                   	nop
    3170:	f3 0f 1e fa          	endbr64 
    3174:	68 14 00 00 00       	pushq  $0x14
    3179:	f2 e9 a1 fe ff ff    	bnd jmpq 3020 <.plt>
    317f:	90                   	nop
    3180:	f3 0f 1e fa          	endbr64 
    3184:	68 15 00 00 00       	pushq  $0x15
    3189:	f2 e9 91 fe ff ff    	bnd jmpq 3020 <.plt>
    318f:	90                   	nop
    3190:	f3 0f 1e fa          	endbr64 
    3194:	68 16 00 00 00       	pushq  $0x16
    3199:	f2 e9 81 fe ff ff    	bnd jmpq 3020 <.plt>
    319f:	90                   	nop
    31a0:	f3 0f 1e fa          	endbr64 
    31a4:	68 17 00 00 00       	pushq  $0x17
    31a9:	f2 e9 71 fe ff ff    	bnd jmpq 3020 <.plt>
    31af:	90                   	nop
    31b0:	f3 0f 1e fa          	endbr64 
    31b4:	68 18 00 00 00       	pushq  $0x18
    31b9:	f2 e9 61 fe ff ff    	bnd jmpq 3020 <.plt>
    31bf:	90                   	nop
    31c0:	f3 0f 1e fa          	endbr64 
    31c4:	68 19 00 00 00       	pushq  $0x19
    31c9:	f2 e9 51 fe ff ff    	bnd jmpq 3020 <.plt>
    31cf:	90                   	nop
    31d0:	f3 0f 1e fa          	endbr64 
    31d4:	68 1a 00 00 00       	pushq  $0x1a
    31d9:	f2 e9 41 fe ff ff    	bnd jmpq 3020 <.plt>
    31df:	90                   	nop
    31e0:	f3 0f 1e fa          	endbr64 
    31e4:	68 1b 00 00 00       	pushq  $0x1b
    31e9:	f2 e9 31 fe ff ff    	bnd jmpq 3020 <.plt>
    31ef:	90                   	nop

Disassembly of section .plt.got:

00000000000031f0 <__cxa_finalize@plt>:
    31f0:	f3 0f 1e fa          	endbr64 
    31f4:	f2 ff 25 fd 5d 00 00 	bnd jmpq *0x5dfd(%rip)        # 8ff8 <__cxa_finalize@GLIBC_2.2.5>
    31fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000003200 <getenv@plt>:
    3200:	f3 0f 1e fa          	endbr64 
    3204:	f2 ff 25 ed 5c 00 00 	bnd jmpq *0x5ced(%rip)        # 8ef8 <getenv@GLIBC_2.2.5>
    320b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003210 <__snprintf_chk@plt>:
    3210:	f3 0f 1e fa          	endbr64 
    3214:	f2 ff 25 e5 5c 00 00 	bnd jmpq *0x5ce5(%rip)        # 8f00 <__snprintf_chk@GLIBC_2.3.4>
    321b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003220 <strcasecmp@plt>:
    3220:	f3 0f 1e fa          	endbr64 
    3224:	f2 ff 25 dd 5c 00 00 	bnd jmpq *0x5cdd(%rip)        # 8f08 <strcasecmp@GLIBC_2.2.5>
    322b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003230 <__errno_location@plt>:
    3230:	f3 0f 1e fa          	endbr64 
    3234:	f2 ff 25 d5 5c 00 00 	bnd jmpq *0x5cd5(%rip)        # 8f10 <__errno_location@GLIBC_2.2.5>
    323b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003240 <strcpy@plt>:
    3240:	f3 0f 1e fa          	endbr64 
    3244:	f2 ff 25 cd 5c 00 00 	bnd jmpq *0x5ccd(%rip)        # 8f18 <strcpy@GLIBC_2.2.5>
    324b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003250 <puts@plt>:
    3250:	f3 0f 1e fa          	endbr64 
    3254:	f2 ff 25 c5 5c 00 00 	bnd jmpq *0x5cc5(%rip)        # 8f20 <puts@GLIBC_2.2.5>
    325b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003260 <write@plt>:
    3260:	f3 0f 1e fa          	endbr64 
    3264:	f2 ff 25 bd 5c 00 00 	bnd jmpq *0x5cbd(%rip)        # 8f28 <write@GLIBC_2.2.5>
    326b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003270 <__stack_chk_fail@plt>:
    3270:	f3 0f 1e fa          	endbr64 
    3274:	f2 ff 25 b5 5c 00 00 	bnd jmpq *0x5cb5(%rip)        # 8f30 <__stack_chk_fail@GLIBC_2.4>
    327b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003280 <alarm@plt>:
    3280:	f3 0f 1e fa          	endbr64 
    3284:	f2 ff 25 ad 5c 00 00 	bnd jmpq *0x5cad(%rip)        # 8f38 <alarm@GLIBC_2.2.5>
    328b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003290 <close@plt>:
    3290:	f3 0f 1e fa          	endbr64 
    3294:	f2 ff 25 a5 5c 00 00 	bnd jmpq *0x5ca5(%rip)        # 8f40 <close@GLIBC_2.2.5>
    329b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000032a0 <read@plt>:
    32a0:	f3 0f 1e fa          	endbr64 
    32a4:	f2 ff 25 9d 5c 00 00 	bnd jmpq *0x5c9d(%rip)        # 8f48 <read@GLIBC_2.2.5>
    32ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000032b0 <fgets@plt>:
    32b0:	f3 0f 1e fa          	endbr64 
    32b4:	f2 ff 25 95 5c 00 00 	bnd jmpq *0x5c95(%rip)        # 8f50 <fgets@GLIBC_2.2.5>
    32bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000032c0 <signal@plt>:
    32c0:	f3 0f 1e fa          	endbr64 
    32c4:	f2 ff 25 8d 5c 00 00 	bnd jmpq *0x5c8d(%rip)        # 8f58 <signal@GLIBC_2.2.5>
    32cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000032d0 <gethostbyname@plt>:
    32d0:	f3 0f 1e fa          	endbr64 
    32d4:	f2 ff 25 85 5c 00 00 	bnd jmpq *0x5c85(%rip)        # 8f60 <gethostbyname@GLIBC_2.2.5>
    32db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000032e0 <__memmove_chk@plt>:
    32e0:	f3 0f 1e fa          	endbr64 
    32e4:	f2 ff 25 7d 5c 00 00 	bnd jmpq *0x5c7d(%rip)        # 8f68 <__memmove_chk@GLIBC_2.3.4>
    32eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000032f0 <strtol@plt>:
    32f0:	f3 0f 1e fa          	endbr64 
    32f4:	f2 ff 25 75 5c 00 00 	bnd jmpq *0x5c75(%rip)        # 8f70 <strtol@GLIBC_2.2.5>
    32fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003300 <fflush@plt>:
    3300:	f3 0f 1e fa          	endbr64 
    3304:	f2 ff 25 6d 5c 00 00 	bnd jmpq *0x5c6d(%rip)        # 8f78 <fflush@GLIBC_2.2.5>
    330b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003310 <__isoc99_sscanf@plt>:
    3310:	f3 0f 1e fa          	endbr64 
    3314:	f2 ff 25 65 5c 00 00 	bnd jmpq *0x5c65(%rip)        # 8f80 <__isoc99_sscanf@GLIBC_2.7>
    331b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003320 <__printf_chk@plt>:
    3320:	f3 0f 1e fa          	endbr64 
    3324:	f2 ff 25 5d 5c 00 00 	bnd jmpq *0x5c5d(%rip)        # 8f88 <__printf_chk@GLIBC_2.3.4>
    332b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003330 <fopen@plt>:
    3330:	f3 0f 1e fa          	endbr64 
    3334:	f2 ff 25 55 5c 00 00 	bnd jmpq *0x5c55(%rip)        # 8f90 <fopen@GLIBC_2.2.5>
    333b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003340 <gethostname@plt>:
    3340:	f3 0f 1e fa          	endbr64 
    3344:	f2 ff 25 4d 5c 00 00 	bnd jmpq *0x5c4d(%rip)        # 8f98 <gethostname@GLIBC_2.2.5>
    334b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003350 <exit@plt>:
    3350:	f3 0f 1e fa          	endbr64 
    3354:	f2 ff 25 45 5c 00 00 	bnd jmpq *0x5c45(%rip)        # 8fa0 <exit@GLIBC_2.2.5>
    335b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003360 <connect@plt>:
    3360:	f3 0f 1e fa          	endbr64 
    3364:	f2 ff 25 3d 5c 00 00 	bnd jmpq *0x5c3d(%rip)        # 8fa8 <connect@GLIBC_2.2.5>
    336b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003370 <__fprintf_chk@plt>:
    3370:	f3 0f 1e fa          	endbr64 
    3374:	f2 ff 25 35 5c 00 00 	bnd jmpq *0x5c35(%rip)        # 8fb0 <__fprintf_chk@GLIBC_2.3.4>
    337b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003380 <sleep@plt>:
    3380:	f3 0f 1e fa          	endbr64 
    3384:	f2 ff 25 2d 5c 00 00 	bnd jmpq *0x5c2d(%rip)        # 8fb8 <sleep@GLIBC_2.2.5>
    338b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000003390 <__ctype_b_loc@plt>:
    3390:	f3 0f 1e fa          	endbr64 
    3394:	f2 ff 25 25 5c 00 00 	bnd jmpq *0x5c25(%rip)        # 8fc0 <__ctype_b_loc@GLIBC_2.3>
    339b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000033a0 <__sprintf_chk@plt>:
    33a0:	f3 0f 1e fa          	endbr64 
    33a4:	f2 ff 25 1d 5c 00 00 	bnd jmpq *0x5c1d(%rip)        # 8fc8 <__sprintf_chk@GLIBC_2.3.4>
    33ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000033b0 <socket@plt>:
    33b0:	f3 0f 1e fa          	endbr64 
    33b4:	f2 ff 25 15 5c 00 00 	bnd jmpq *0x5c15(%rip)        # 8fd0 <socket@GLIBC_2.2.5>
    33bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000000033c0 <_start>:
    33c0:	f3 0f 1e fa          	endbr64 
    33c4:	31 ed                	xor    %ebp,%ebp
    33c6:	49 89 d1             	mov    %rdx,%r9
    33c9:	5e                   	pop    %rsi
    33ca:	48 89 e2             	mov    %rsp,%rdx
    33cd:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    33d1:	50                   	push   %rax
    33d2:	54                   	push   %rsp
    33d3:	4c 8d 05 36 1c 00 00 	lea    0x1c36(%rip),%r8        # 5010 <__libc_csu_fini>
    33da:	48 8d 0d bf 1b 00 00 	lea    0x1bbf(%rip),%rcx        # 4fa0 <__libc_csu_init>
    33e1:	48 8d 3d c1 00 00 00 	lea    0xc1(%rip),%rdi        # 34a9 <main>
    33e8:	ff 15 f2 5b 00 00    	callq  *0x5bf2(%rip)        # 8fe0 <__libc_start_main@GLIBC_2.2.5>
    33ee:	f4                   	hlt    
    33ef:	90                   	nop

00000000000033f0 <deregister_tm_clones>:
    33f0:	48 8d 3d 89 66 00 00 	lea    0x6689(%rip),%rdi        # 9a80 <stdout@@GLIBC_2.2.5>
    33f7:	48 8d 05 82 66 00 00 	lea    0x6682(%rip),%rax        # 9a80 <stdout@@GLIBC_2.2.5>
    33fe:	48 39 f8             	cmp    %rdi,%rax
    3401:	74 15                	je     3418 <deregister_tm_clones+0x28>
    3403:	48 8b 05 ce 5b 00 00 	mov    0x5bce(%rip),%rax        # 8fd8 <_ITM_deregisterTMCloneTable>
    340a:	48 85 c0             	test   %rax,%rax
    340d:	74 09                	je     3418 <deregister_tm_clones+0x28>
    340f:	ff e0                	jmpq   *%rax
    3411:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    3418:	c3                   	retq   
    3419:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000003420 <register_tm_clones>:
    3420:	48 8d 3d 59 66 00 00 	lea    0x6659(%rip),%rdi        # 9a80 <stdout@@GLIBC_2.2.5>
    3427:	48 8d 35 52 66 00 00 	lea    0x6652(%rip),%rsi        # 9a80 <stdout@@GLIBC_2.2.5>
    342e:	48 29 fe             	sub    %rdi,%rsi
    3431:	48 89 f0             	mov    %rsi,%rax
    3434:	48 c1 ee 3f          	shr    $0x3f,%rsi
    3438:	48 c1 f8 03          	sar    $0x3,%rax
    343c:	48 01 c6             	add    %rax,%rsi
    343f:	48 d1 fe             	sar    %rsi
    3442:	74 14                	je     3458 <register_tm_clones+0x38>
    3444:	48 8b 05 a5 5b 00 00 	mov    0x5ba5(%rip),%rax        # 8ff0 <_ITM_registerTMCloneTable>
    344b:	48 85 c0             	test   %rax,%rax
    344e:	74 08                	je     3458 <register_tm_clones+0x38>
    3450:	ff e0                	jmpq   *%rax
    3452:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    3458:	c3                   	retq   
    3459:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000003460 <__do_global_dtors_aux>:
    3460:	f3 0f 1e fa          	endbr64 
    3464:	80 3d 3d 66 00 00 00 	cmpb   $0x0,0x663d(%rip)        # 9aa8 <completed.8060>
    346b:	75 2b                	jne    3498 <__do_global_dtors_aux+0x38>
    346d:	55                   	push   %rbp
    346e:	48 83 3d 82 5b 00 00 	cmpq   $0x0,0x5b82(%rip)        # 8ff8 <__cxa_finalize@GLIBC_2.2.5>
    3475:	00 
    3476:	48 89 e5             	mov    %rsp,%rbp
    3479:	74 0c                	je     3487 <__do_global_dtors_aux+0x27>
    347b:	48 8b 3d 86 5b 00 00 	mov    0x5b86(%rip),%rdi        # 9008 <__dso_handle>
    3482:	e8 69 fd ff ff       	callq  31f0 <__cxa_finalize@plt>
    3487:	e8 64 ff ff ff       	callq  33f0 <deregister_tm_clones>
    348c:	c6 05 15 66 00 00 01 	movb   $0x1,0x6615(%rip)        # 9aa8 <completed.8060>
    3493:	5d                   	pop    %rbp
    3494:	c3                   	retq   
    3495:	0f 1f 00             	nopl   (%rax)
    3498:	c3                   	retq   
    3499:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000034a0 <frame_dummy>:
    34a0:	f3 0f 1e fa          	endbr64 
    34a4:	e9 77 ff ff ff       	jmpq   3420 <register_tm_clones>

00000000000034a9 <main>:
    34a9:	f3 0f 1e fa          	endbr64 
    34ad:	53                   	push   %rbx
    34ae:	83 ff 01             	cmp    $0x1,%edi
    34b1:	0f 84 f8 00 00 00    	je     35af <main+0x106>
    34b7:	48 89 f3             	mov    %rsi,%rbx
    34ba:	83 ff 02             	cmp    $0x2,%edi
    34bd:	0f 85 21 01 00 00    	jne    35e4 <main+0x13b>
    34c3:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
    34c7:	48 8d 35 36 2b 00 00 	lea    0x2b36(%rip),%rsi        # 6004 <_IO_stdin_used+0x4>
    34ce:	e8 5d fe ff ff       	callq  3330 <fopen@plt>
    34d3:	48 89 05 d6 65 00 00 	mov    %rax,0x65d6(%rip)        # 9ab0 <infile>
    34da:	48 85 c0             	test   %rax,%rax
    34dd:	0f 84 df 00 00 00    	je     35c2 <main+0x119>
    34e3:	e8 ff 07 00 00       	callq  3ce7 <initialize_bomb>
    34e8:	48 8d 3d 99 2b 00 00 	lea    0x2b99(%rip),%rdi        # 6088 <_IO_stdin_used+0x88>
    34ef:	e8 5c fd ff ff       	callq  3250 <puts@plt>
    34f4:	48 8d 3d cd 2b 00 00 	lea    0x2bcd(%rip),%rdi        # 60c8 <_IO_stdin_used+0xc8>
    34fb:	e8 50 fd ff ff       	callq  3250 <puts@plt>
    3500:	e8 53 0b 00 00       	callq  4058 <read_line>
    3505:	48 89 c7             	mov    %rax,%rdi
    3508:	e8 fa 00 00 00       	callq  3607 <phase_1>
    350d:	e8 8e 0c 00 00       	callq  41a0 <phase_defused>
    3512:	48 8d 3d df 2b 00 00 	lea    0x2bdf(%rip),%rdi        # 60f8 <_IO_stdin_used+0xf8>
    3519:	e8 32 fd ff ff       	callq  3250 <puts@plt>
    351e:	e8 35 0b 00 00       	callq  4058 <read_line>
    3523:	48 89 c7             	mov    %rax,%rdi
    3526:	e8 00 01 00 00       	callq  362b <phase_2>
    352b:	e8 70 0c 00 00       	callq  41a0 <phase_defused>
    3530:	48 8d 3d 06 2b 00 00 	lea    0x2b06(%rip),%rdi        # 603d <_IO_stdin_used+0x3d>
    3537:	e8 14 fd ff ff       	callq  3250 <puts@plt>
    353c:	e8 17 0b 00 00       	callq  4058 <read_line>
    3541:	48 89 c7             	mov    %rax,%rdi
    3544:	e8 60 01 00 00       	callq  36a9 <phase_3>
    3549:	e8 52 0c 00 00       	callq  41a0 <phase_defused>
    354e:	48 8d 3d 06 2b 00 00 	lea    0x2b06(%rip),%rdi        # 605b <_IO_stdin_used+0x5b>
    3555:	e8 f6 fc ff ff       	callq  3250 <puts@plt>
    355a:	e8 f9 0a 00 00       	callq  4058 <read_line>
    355f:	48 89 c7             	mov    %rax,%rdi
    3562:	e8 7d 03 00 00       	callq  38e4 <phase_4>
    3567:	e8 34 0c 00 00       	callq  41a0 <phase_defused>
    356c:	48 8d 3d b5 2b 00 00 	lea    0x2bb5(%rip),%rdi        # 6128 <_IO_stdin_used+0x128>
    3573:	e8 d8 fc ff ff       	callq  3250 <puts@plt>
    3578:	e8 db 0a 00 00       	callq  4058 <read_line>
    357d:	48 89 c7             	mov    %rax,%rdi
    3580:	e8 07 04 00 00       	callq  398c <phase_5>
    3585:	e8 16 0c 00 00       	callq  41a0 <phase_defused>
    358a:	48 8d 3d d9 2a 00 00 	lea    0x2ad9(%rip),%rdi        # 606a <_IO_stdin_used+0x6a>
    3591:	e8 ba fc ff ff       	callq  3250 <puts@plt>
    3596:	e8 bd 0a 00 00       	callq  4058 <read_line>
    359b:	48 89 c7             	mov    %rax,%rdi
    359e:	e8 35 04 00 00       	callq  39d8 <phase_6>
    35a3:	e8 f8 0b 00 00       	callq  41a0 <phase_defused>
    35a8:	b8 00 00 00 00       	mov    $0x0,%eax
    35ad:	5b                   	pop    %rbx
    35ae:	c3                   	retq   
    35af:	48 8b 05 da 64 00 00 	mov    0x64da(%rip),%rax        # 9a90 <stdin@@GLIBC_2.2.5>
    35b6:	48 89 05 f3 64 00 00 	mov    %rax,0x64f3(%rip)        # 9ab0 <infile>
    35bd:	e9 21 ff ff ff       	jmpq   34e3 <main+0x3a>
    35c2:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
    35c6:	48 8b 13             	mov    (%rbx),%rdx
    35c9:	48 8d 35 36 2a 00 00 	lea    0x2a36(%rip),%rsi        # 6006 <_IO_stdin_used+0x6>
    35d0:	bf 01 00 00 00       	mov    $0x1,%edi
    35d5:	e8 46 fd ff ff       	callq  3320 <__printf_chk@plt>
    35da:	bf 08 00 00 00       	mov    $0x8,%edi
    35df:	e8 6c fd ff ff       	callq  3350 <exit@plt>
    35e4:	48 8b 16             	mov    (%rsi),%rdx
    35e7:	48 8d 35 35 2a 00 00 	lea    0x2a35(%rip),%rsi        # 6023 <_IO_stdin_used+0x23>
    35ee:	bf 01 00 00 00       	mov    $0x1,%edi
    35f3:	b8 00 00 00 00       	mov    $0x0,%eax
    35f8:	e8 23 fd ff ff       	callq  3320 <__printf_chk@plt>
    35fd:	bf 08 00 00 00       	mov    $0x8,%edi
    3602:	e8 49 fd ff ff       	callq  3350 <exit@plt>

0000000000003607 <phase_1>:
    3607:	f3 0f 1e fa          	endbr64 
    360b:	48 83 ec 08          	sub    $0x8,%rsp
    360f:	48 8d 35 3a 2b 00 00 	lea    0x2b3a(%rip),%rsi        # 6150 <_IO_stdin_used+0x150>
    3616:	e8 6c 06 00 00       	callq  3c87 <strings_not_equal>
    361b:	85 c0                	test   %eax,%eax
    361d:	75 05                	jne    3624 <phase_1+0x1d>
    361f:	48 83 c4 08          	add    $0x8,%rsp
    3623:	c3                   	retq   
    3624:	e8 a8 09 00 00       	callq  3fd1 <explode_bomb>
    3629:	eb f4                	jmp    361f <phase_1+0x18>

000000000000362b <phase_2>:
    362b:	f3 0f 1e fa          	endbr64 
    362f:	55                   	push   %rbp
    3630:	53                   	push   %rbx
    3631:	48 83 ec 28          	sub    $0x28,%rsp
    3635:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    363c:	00 00 
    363e:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    3643:	31 c0                	xor    %eax,%eax
    3645:	48 89 e6             	mov    %rsp,%rsi
    3648:	e8 c6 09 00 00       	callq  4013 <read_six_numbers>
    364d:	83 3c 24 02          	cmpl   $0x2,(%rsp)
    3651:	75 11                	jne    3664 <phase_2+0x39>
    3653:	83 7c 24 04 03       	cmpl   $0x3,0x4(%rsp)
    3658:	75 11                	jne    366b <phase_2+0x40>
    365a:	48 89 e3             	mov    %rsp,%rbx
    365d:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
    3662:	eb 1c                	jmp    3680 <phase_2+0x55>
    3664:	e8 68 09 00 00       	callq  3fd1 <explode_bomb>
    3669:	eb e8                	jmp    3653 <phase_2+0x28>
    366b:	e8 61 09 00 00       	callq  3fd1 <explode_bomb>
    3670:	eb e8                	jmp    365a <phase_2+0x2f>
    3672:	e8 5a 09 00 00       	callq  3fd1 <explode_bomb>
    3677:	48 83 c3 04          	add    $0x4,%rbx
    367b:	48 39 eb             	cmp    %rbp,%rbx
    367e:	74 0d                	je     368d <phase_2+0x62>
    3680:	8b 43 04             	mov    0x4(%rbx),%eax
    3683:	0f af 03             	imul   (%rbx),%eax
    3686:	39 43 08             	cmp    %eax,0x8(%rbx)
    3689:	74 ec                	je     3677 <phase_2+0x4c>
    368b:	eb e5                	jmp    3672 <phase_2+0x47>
    368d:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    3692:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    3699:	00 00 
    369b:	75 07                	jne    36a4 <phase_2+0x79>
    369d:	48 83 c4 28          	add    $0x28,%rsp
    36a1:	5b                   	pop    %rbx
    36a2:	5d                   	pop    %rbp
    36a3:	c3                   	retq   
    36a4:	e8 c7 fb ff ff       	callq  3270 <__stack_chk_fail@plt>

00000000000036a9 <phase_3>:
    36a9:	f3 0f 1e fa          	endbr64 
    36ad:	48 83 ec 28          	sub    $0x28,%rsp
    36b1:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    36b8:	00 00 
    36ba:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    36bf:	31 c0                	xor    %eax,%eax
    36c1:	48 8d 4c 24 0f       	lea    0xf(%rsp),%rcx
    36c6:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
    36cb:	4c 8d 44 24 14       	lea    0x14(%rsp),%r8
    36d0:	48 8d 35 d7 2a 00 00 	lea    0x2ad7(%rip),%rsi        # 61ae <_IO_stdin_used+0x1ae>
    36d7:	e8 34 fc ff ff       	callq  3310 <__isoc99_sscanf@plt>
    36dc:	83 f8 02             	cmp    $0x2,%eax
    36df:	7e 20                	jle    3701 <phase_3+0x58>
    36e1:	83 7c 24 10 07       	cmpl   $0x7,0x10(%rsp)
    36e6:	0f 87 0d 01 00 00    	ja     37f9 <phase_3+0x150>
    36ec:	8b 44 24 10          	mov    0x10(%rsp),%eax
    36f0:	48 8d 15 c9 2a 00 00 	lea    0x2ac9(%rip),%rdx        # 61c0 <_IO_stdin_used+0x1c0>
    36f7:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
    36fb:	48 01 d0             	add    %rdx,%rax
    36fe:	3e ff e0             	notrack jmpq *%rax
    3701:	e8 cb 08 00 00       	callq  3fd1 <explode_bomb>
    3706:	eb d9                	jmp    36e1 <phase_3+0x38>
    3708:	b8 76 00 00 00       	mov    $0x76,%eax
    370d:	81 7c 24 14 a6 01 00 	cmpl   $0x1a6,0x14(%rsp)
    3714:	00 
    3715:	0f 84 e8 00 00 00    	je     3803 <phase_3+0x15a>
    371b:	e8 b1 08 00 00       	callq  3fd1 <explode_bomb>
    3720:	b8 76 00 00 00       	mov    $0x76,%eax
    3725:	e9 d9 00 00 00       	jmpq   3803 <phase_3+0x15a>
    372a:	b8 65 00 00 00       	mov    $0x65,%eax
    372f:	81 7c 24 14 e4 00 00 	cmpl   $0xe4,0x14(%rsp)
    3736:	00 
    3737:	0f 84 c6 00 00 00    	je     3803 <phase_3+0x15a>
    373d:	e8 8f 08 00 00       	callq  3fd1 <explode_bomb>
    3742:	b8 65 00 00 00       	mov    $0x65,%eax
    3747:	e9 b7 00 00 00       	jmpq   3803 <phase_3+0x15a>
    374c:	b8 76 00 00 00       	mov    $0x76,%eax
    3751:	81 7c 24 14 07 03 00 	cmpl   $0x307,0x14(%rsp)
    3758:	00 
    3759:	0f 84 a4 00 00 00    	je     3803 <phase_3+0x15a>
    375f:	e8 6d 08 00 00       	callq  3fd1 <explode_bomb>
    3764:	b8 76 00 00 00       	mov    $0x76,%eax
    3769:	e9 95 00 00 00       	jmpq   3803 <phase_3+0x15a>
    376e:	b8 74 00 00 00       	mov    $0x74,%eax
    3773:	81 7c 24 14 13 01 00 	cmpl   $0x113,0x14(%rsp)
    377a:	00 
    377b:	0f 84 82 00 00 00    	je     3803 <phase_3+0x15a>
    3781:	e8 4b 08 00 00       	callq  3fd1 <explode_bomb>
    3786:	b8 74 00 00 00       	mov    $0x74,%eax
    378b:	eb 76                	jmp    3803 <phase_3+0x15a>
    378d:	b8 73 00 00 00       	mov    $0x73,%eax
    3792:	81 7c 24 14 4d 02 00 	cmpl   $0x24d,0x14(%rsp)
    3799:	00 
    379a:	74 67                	je     3803 <phase_3+0x15a>
    379c:	e8 30 08 00 00       	callq  3fd1 <explode_bomb>
    37a1:	b8 73 00 00 00       	mov    $0x73,%eax
    37a6:	eb 5b                	jmp    3803 <phase_3+0x15a>
    37a8:	b8 77 00 00 00       	mov    $0x77,%eax
    37ad:	81 7c 24 14 30 01 00 	cmpl   $0x130,0x14(%rsp)
    37b4:	00 
    37b5:	74 4c                	je     3803 <phase_3+0x15a>
    37b7:	e8 15 08 00 00       	callq  3fd1 <explode_bomb>
    37bc:	b8 77 00 00 00       	mov    $0x77,%eax
    37c1:	eb 40                	jmp    3803 <phase_3+0x15a>
    37c3:	b8 76 00 00 00       	mov    $0x76,%eax
    37c8:	81 7c 24 14 3d 03 00 	cmpl   $0x33d,0x14(%rsp)
    37cf:	00 
    37d0:	74 31                	je     3803 <phase_3+0x15a>
    37d2:	e8 fa 07 00 00       	callq  3fd1 <explode_bomb>
    37d7:	b8 76 00 00 00       	mov    $0x76,%eax
    37dc:	eb 25                	jmp    3803 <phase_3+0x15a>
    37de:	b8 78 00 00 00       	mov    $0x78,%eax
    37e3:	81 7c 24 14 b1 03 00 	cmpl   $0x3b1,0x14(%rsp)
    37ea:	00 
    37eb:	74 16                	je     3803 <phase_3+0x15a>
    37ed:	e8 df 07 00 00       	callq  3fd1 <explode_bomb>
    37f2:	b8 78 00 00 00       	mov    $0x78,%eax
    37f7:	eb 0a                	jmp    3803 <phase_3+0x15a>
    37f9:	e8 d3 07 00 00       	callq  3fd1 <explode_bomb>
    37fe:	b8 6b 00 00 00       	mov    $0x6b,%eax
    3803:	38 44 24 0f          	cmp    %al,0xf(%rsp)
    3807:	75 15                	jne    381e <phase_3+0x175>
    3809:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    380e:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    3815:	00 00 
    3817:	75 0c                	jne    3825 <phase_3+0x17c>
    3819:	48 83 c4 28          	add    $0x28,%rsp
    381d:	c3                   	retq   
    381e:	e8 ae 07 00 00       	callq  3fd1 <explode_bomb>
    3823:	eb e4                	jmp    3809 <phase_3+0x160>
    3825:	e8 46 fa ff ff       	callq  3270 <__stack_chk_fail@plt>

000000000000382a <func4>:
    382a:	f3 0f 1e fa          	endbr64 
    382e:	55                   	push   %rbp
    382f:	53                   	push   %rbx
    3830:	48 83 ec 08          	sub    $0x8,%rsp
    3834:	89 fb                	mov    %edi,%ebx                # edi = ebx = 1234
    3836:	48 89 f5             	mov    %rsi,%rbp                # *(rsi) = *(rbp) = -46
    3839:	83 ff 09             	cmp    $0x9,%edi                # edi - 9
    383c:	77 2d                	ja     386b <func4+0x41>        # >, jump
    383e:	8b 16                	mov    (%rsi),%edx
    3840:	48 63 c2             	movslq %edx,%rax
    3843:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
    384a:	48 c1 f8 22          	sar    $0x22,%rax
    384e:	89 d1                	mov    %edx,%ecx
    3850:	c1 f9 1f             	sar    $0x1f,%ecx
    3853:	29 c8                	sub    %ecx,%eax                # eax -= num >> 31
    3855:	8d 04 80             	lea    (%rax,%rax,4),%eax       # eax *= 5
    3858:	01 c0                	add    %eax,%eax                # eax *= 2
    385a:	29 c2                	sub    %eax,%edx                # edi = edx - eax
    385c:	39 fa                	cmp    %edi,%edx                # compare edi and edx
    385e:	0f 94 c0             	sete   %al
    3861:	0f b6 c0             	movzbl %al,%eax                 # eax must not be 0, so edi must == edx 
    3864:	48 83 c4 08          	add    $0x8,%rsp
    3868:	5b                   	pop    %rbx
    3869:	5d                   	pop    %rbp
    386a:	c3                   	retq   # return
    386b:	48 63 ff             	movslq %edi,%rdi                # edi sign extend to rdi
    386e:	48 69 ff 67 66 66 66 	imul   $0x66666667,%rdi,%rdi    # rdi *= 0x66666667 (about 2^30)
    3875:	48 c1 ff 22          	sar    $0x22,%rdi               # rdi >> 34     (rdi lose one right-most digit)
    3879:	89 d8                	mov    %ebx,%eax                # ebx = eax = 1234
    387b:	c1 f8 1f             	sar    $0x1f,%eax               # eax >> 31
    387e:	29 c7                	sub    %eax,%edi                # edi -= eax
    3880:	e8 a5 ff ff ff       	callq  382a <func4>
    3885:	85 c0                	test   %eax,%eax                # eax must != 0
    3887:	74 db                	je     3864 <func4+0x3a>        # don't jump, otherwise return val = 0, will explode
    3889:	8b 55 00             	mov    0x0(%rbp),%edx
    388c:	48 63 c2             	movslq %edx,%rax
    388f:	48 69 c0 67 66 66 66 	imul   $0x66666667,%rax,%rax
    3896:	48 c1 f8 22          	sar    $0x22,%rax
    389a:	c1 fa 1f             	sar    $0x1f,%edx
    389d:	29 d0                	sub    %edx,%eax
    389f:	89 45 00             	mov    %eax,0x0(%rbp)
    38a2:	48 63 d3             	movslq %ebx,%rdx
    38a5:	48 69 d2 67 66 66 66 	imul   $0x66666667,%rdx,%rdx
    38ac:	48 c1 fa 22          	sar    $0x22,%rdx
    38b0:	89 d9                	mov    %ebx,%ecx
    38b2:	c1 f9 1f             	sar    $0x1f,%ecx
    38b5:	29 ca                	sub    %ecx,%edx
    38b7:	8d 14 92             	lea    (%rdx,%rdx,4),%edx
    38ba:	01 d2                	add    %edx,%edx
    38bc:	29 d3                	sub    %edx,%ebx
    38be:	48 63 d0             	movslq %eax,%rdx
    38c1:	48 69 d2 67 66 66 66 	imul   $0x66666667,%rdx,%rdx
    38c8:	48 c1 fa 22          	sar    $0x22,%rdx
    38cc:	89 c1                	mov    %eax,%ecx
    38ce:	c1 f9 1f             	sar    $0x1f,%ecx
    38d1:	29 ca                	sub    %ecx,%edx
    38d3:	8d 14 92             	lea    (%rdx,%rdx,4),%edx
    38d6:	01 d2                	add    %edx,%edx
    38d8:	29 d0                	sub    %edx,%eax
    38da:	39 c3                	cmp    %eax,%ebx
    38dc:	0f 94 c0             	sete   %al
    38df:	0f b6 c0             	movzbl %al,%eax
    38e2:	eb 80                	jmp    3864 <func4+0x3a>

00000000000038e4 <phase_4>:
    38e4:	f3 0f 1e fa          	endbr64 
    38e8:	53                   	push   %rbx
    38e9:	48 83 ec 20          	sub    $0x20,%rsp
    38ed:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    38f4:	00 00 
    38f6:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    38fb:	31 c0                	xor    %eax,%eax
    38fd:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx   # rsp+12 = 2ndnum
    3902:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx   # rsp+8 = 1stnum
    3907:	48 8d 35 d6 2b 00 00 	lea    0x2bd6(%rip),%rsi        # 64e4 <array.3484+0x304>
    390e:	e8 fd f9 ff ff       	callq  3310 <__isoc99_sscanf@plt>
    3913:	83 f8 02             	cmp    $0x2,%eax        # if return val != 2, explode
    3916:	75 1b                	jne    3933 <phase_4+0x4f>
    3918:	8b 44 24 08          	mov    0x8(%rsp),%eax
    391c:	3d d1 04 00 00       	cmp    $0x4d1,%eax  # if 1stnum <= 1233, explode
    3921:	7e 10                	jle    3933 <phase_4+0x4f>
    3923:	8b 54 24 0c          	mov    0xc(%rsp),%edx
    3927:	39 d0                	cmp    %edx,%eax    # if 2ndnum == return val, explode
    3929:	74 08                	je     3933 <phase_4+0x4f>
    392b:	81 fa 38 30 00 00    	cmp    $0x3038,%edx     # if 2ndnum <= 12344, explode
    3931:	7f 05                	jg     3938 <phase_4+0x54>
    3933:	e8 99 06 00 00       	callq  3fd1 <explode_bomb>
                                                            # func4 #1, test first number
    3938:	8b 7c 24 08          	mov    0x8(%rsp),%edi  
    393c:	89 7c 24 10          	mov    %edi,0x10(%rsp)  
    3940:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    3944:	89 44 24 14          	mov    %eax,0x14(%rsp)
    3948:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
    394d:	e8 d8 fe ff ff       	callq  382a <func4>
                                                            # func4 #2, test second number
    3952:	89 c3                	mov    %eax,%ebx
    3954:	48 8d 74 24 14       	lea    0x14(%rsp),%rsi
    3959:	8b 7c 24 0c          	mov    0xc(%rsp),%edi   # edi
    395d:	e8 c8 fe ff ff       	callq  382a <func4>
    3962:	85 db                	test   %ebx,%ebx        # if ebx = 0, explode; ebx is the return val from func4#1, 394d
    3964:	74 1a                	je     3980 <phase_4+0x9c>
    3966:	85 c0                	test   %eax,%eax        # if eax = 0, explode; eax is the return val from func4#2, 395d
    3968:	74 16                	je     3980 <phase_4+0x9c>
    396a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    396f:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    3976:	00 00 
    3978:	75 0d                	jne    3987 <phase_4+0xa3>
    397a:	48 83 c4 20          	add    $0x20,%rsp
    397e:	5b                   	pop    %rbx
    397f:	c3                   	retq   
    3980:	e8 4c 06 00 00       	callq  3fd1 <explode_bomb>
    3985:	eb e3                	jmp    396a <phase_4+0x86>
    3987:	e8 e4 f8 ff ff       	callq  3270 <__stack_chk_fail@plt>

000000000000398c <phase_5>:
    398c:	f3 0f 1e fa          	endbr64 
    3990:	53                   	push   %rbx
    3991:	48 89 fb             	mov    %rdi,%rbx
    3994:	e8 cd 02 00 00       	callq  3c66 <string_length>
    3999:	83 f8 06             	cmp    $0x6,%eax                # length of string must equal 6
    399c:	75 2c                	jne    39ca <phase_5+0x3e>
    399e:	48 89 d8             	mov    %rbx,%rax
    39a1:	48 8d 7b 06          	lea    0x6(%rbx),%rdi
    39a5:	b9 00 00 00 00       	mov    $0x0,%ecx
    39aa:	48 8d 35 2f 28 00 00 	lea    0x282f(%rip),%rsi        # 61e0 <array.3484>
    # rsi = 2, +4 = 10, +8 = 6, +12 = 1, +16 = 12, +20 = 16, +24 = 9, +28 = 3, +32 = 4, , +36 = 7...
    # 10     + 10 + 10 + 3   +  4     + 6   = 43
    # 0001               0111   1000    10
    # A(65)              G (71) H(72)   B (66)
    39b1:	0f b6 10             	movzbl (%rax),%edx
    39b4:	83 e2 0f             	and    $0xf,%edx
    39b7:	03 0c 96             	add    (%rsi,%rdx,4),%ecx
    39ba:	48 83 c0 01          	add    $0x1,%rax
    39be:	48 39 f8             	cmp    %rdi,%rax                
    39c1:	75 ee                	jne    39b1 <phase_5+0x25>
    39c3:	83 f9 2b             	cmp    $0x2b,%ecx               # ecx must equal 43
    39c6:	75 09                	jne    39d1 <phase_5+0x45>
    39c8:	5b                   	pop    %rbx
    39c9:	c3                   	retq   
    39ca:	e8 02 06 00 00       	callq  3fd1 <explode_bomb>
    39cf:	eb cd                	jmp    399e <phase_5+0x12>
    39d1:	e8 fb 05 00 00       	callq  3fd1 <explode_bomb>
    39d6:	eb f0                	jmp    39c8 <phase_5+0x3c>

00000000000039d8 <phase_6>:
    39d8:	f3 0f 1e fa          	endbr64 
    39dc:	41 57                	push   %r15
    39de:	41 56                	push   %r14
    39e0:	41 55                	push   %r13
    39e2:	41 54                	push   %r12
    39e4:	55                   	push   %rbp
    39e5:	53                   	push   %rbx
    39e6:	48 83 ec 68          	sub    $0x68,%rsp
    39ea:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    39f1:	00 00 
    39f3:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
    39f8:	31 c0                	xor    %eax,%eax
    39fa:	49 89 e6             	mov    %rsp,%r14
    39fd:	4c 89 f6             	mov    %r14,%rsi
    3a00:	e8 0e 06 00 00       	callq  4013 <read_six_numbers>
    3a05:	4d 89 f4             	mov    %r14,%r12
    3a08:	41 bf 01 00 00 00    	mov    $0x1,%r15d
    3a0e:	49 89 e5             	mov    %rsp,%r13
    3a11:	e9 c1 00 00 00       	jmpq   3ad7 <phase_6+0xff>
    3a16:	e8 b6 05 00 00       	callq  3fd1 <explode_bomb>
    3a1b:	e9 c9 00 00 00       	jmpq   3ae9 <phase_6+0x111>
    3a20:	e8 ac 05 00 00       	callq  3fd1 <explode_bomb>
    3a25:	48 83 c3 01          	add    $0x1,%rbx                # increment rbx and check again
    3a29:	83 fb 05             	cmp    $0x5,%ebx
    3a2c:	0f 8f 9d 00 00 00    	jg     3acf <phase_6+0xf7>
    # second jump
    3a32:	41 8b 44 9d 00       	mov    0x0(%r13,%rbx,4),%eax    # rbx = r15d = 1. r13 = rsp
    3a37:	39 45 00             	cmp    %eax,0x0(%rbp)           # rbp = r14 = rsp
    3a3a:	75 e9                	jne    3a25 <phase_6+0x4d>      # if two numbers are equal, explode
    3a3c:	eb e2                	jmp    3a20 <phase_6+0x48>
    # once checked no numbers are equal, jump here
    3a3e:	49 8d 4c 24 18       	lea    0x18(%r12),%rcx          # r12 = rsp, rcx = rsp+24, outside of six num range
    3a43:	ba 07 00 00 00       	mov    $0x7,%edx
    3a48:	89 d0                	mov    %edx,%eax
    3a4a:	41 2b 04 24          	sub    (%r12),%eax              # subtract n from 7
    3a4e:	41 89 04 24          	mov    %eax,(%r12)              # n = 7 - n
    3a52:	49 83 c4 04          	add    $0x4,%r12
    3a56:	4c 39 e1             	cmp    %r12,%rcx                # if next n != rcx (end/return address), loop
    3a59:	75 ed                	jne    3a48 <phase_6+0x70>
    3a5b:	be 00 00 00 00       	mov    $0x0,%esi
    3a60:	8b 0c b4             	mov    (%rsp,%rsi,4),%ecx       # ecx = 
    3a63:	b8 01 00 00 00       	mov    $0x1,%eax                # eax = 1
    3a68:	48 8d 15 c1 57 00 00 	lea    0x57c1(%rip),%rdx        # 9230 <node1>
    3a6f:	83 f9 01             	cmp    $0x1,%ecx
    3a72:	7e 0b                	jle    3a7f <phase_6+0xa7>
    3a74:	48 8b 52 08          	mov    0x8(%rdx),%rdx
    3a78:	83 c0 01             	add    $0x1,%eax
    3a7b:	39 c8                	cmp    %ecx,%eax
    3a7d:	75 f5                	jne    3a74 <phase_6+0x9c>
    3a7f:	48 89 54 f4 20       	mov    %rdx,0x20(%rsp,%rsi,8)
    3a84:	48 83 c6 01          	add    $0x1,%rsi
    3a88:	48 83 fe 06          	cmp    $0x6,%rsi
    3a8c:	75 d2                	jne    3a60 <phase_6+0x88>
    3a8e:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx      # rbx = rsp + 32
    3a93:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
    3a98:	48 89 43 08          	mov    %rax,0x8(%rbx)       # rbx + 8 = rsp + 40
    3a9c:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
    3aa1:	48 89 50 08          	mov    %rdx,0x8(%rax)
    3aa5:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
    3aaa:	48 89 42 08          	mov    %rax,0x8(%rdx)
    3aae:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
    3ab3:	48 89 50 08          	mov    %rdx,0x8(%rax)
    3ab7:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
    3abc:	48 89 42 08          	mov    %rax,0x8(%rdx)
    3ac0:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    3ac7:	00 
    3ac8:	bd 05 00 00 00       	mov    $0x5,%ebp
    3acd:	eb 35                	jmp    3b04 <phase_6+0x12c>
    3acf:	49 83 c7 01          	add    $0x1,%r15
    3ad3:	49 83 c6 04          	add    $0x4,%r14
    # first jump here
    3ad7:	4c 89 f5             	mov    %r14,%rbp                # r14 = rsp
    3ada:	41 8b 06             	mov    (%r14),%eax              # eax = num
    3add:	83 e8 01             	sub    $0x1,%eax
    3ae0:	83 f8 05             	cmp    $0x5,%eax                # if num - 1 > 5, explode
    3ae3:	0f 87 2d ff ff ff    	ja     3a16 <phase_6+0x3e>
    3ae9:	41 83 ff 05          	cmp    $0x5,%r15d               # r15d = 1
    3aed:	0f 8f 4b ff ff ff    	jg     3a3e <phase_6+0x66>
    3af3:	4c 89 fb             	mov    %r15,%rbx
    3af6:	e9 37 ff ff ff       	jmpq   3a32 <phase_6+0x5a>      # second jump
    3afb:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
    3aff:	83 ed 01             	sub    $0x1,%ebp                # ebp = 5 originally, decrements by 1; loop 5 times
    3b02:	74 11                	je     3b15 <phase_6+0x13d>     # jump to returning sequence of instructions
    3b04:	48 8b 43 08          	mov    0x8(%rbx),%rax
    3b08:	8b 00                	mov    (%rax),%eax
    3b0a:	39 03                	cmp    %eax,(%rbx)
    3b0c:	7d ed                	jge    3afb <phase_6+0x123>     # any num at rbx must >= the next (+8) num
    3b0e:	e8 be 04 00 00       	callq  3fd1 <explode_bomb>
    3b13:	eb e6                	jmp    3afb <phase_6+0x123>
    # start of returning sequence of instructions
    3b15:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
    3b1a:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    3b21:	00 00 
    3b23:	75 0f                	jne    3b34 <phase_6+0x15c>
    3b25:	48 83 c4 68          	add    $0x68,%rsp
    3b29:	5b                   	pop    %rbx
    3b2a:	5d                   	pop    %rbp
    3b2b:	41 5c                	pop    %r12
    3b2d:	41 5d                	pop    %r13
    3b2f:	41 5e                	pop    %r14
    3b31:	41 5f                	pop    %r15
    3b33:	c3                   	retq   
    3b34:	e8 37 f7 ff ff       	callq  3270 <__stack_chk_fail@plt>

0000000000003b39 <fun7>:
    3b39:	f3 0f 1e fa          	endbr64 
    3b3d:	48 85 ff             	test   %rdi,%rdi
    3b40:	74 32                	je     3b74 <fun7+0x3b>
    3b42:	48 83 ec 08          	sub    $0x8,%rsp
    3b46:	8b 17                	mov    (%rdi),%edx
    3b48:	39 f2                	cmp    %esi,%edx
    3b4a:	7f 0c                	jg     3b58 <fun7+0x1f>
    3b4c:	b8 00 00 00 00       	mov    $0x0,%eax
    3b51:	75 12                	jne    3b65 <fun7+0x2c>
    3b53:	48 83 c4 08          	add    $0x8,%rsp
    3b57:	c3                   	retq   
    3b58:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
    3b5c:	e8 d8 ff ff ff       	callq  3b39 <fun7>
    3b61:	01 c0                	add    %eax,%eax
    3b63:	eb ee                	jmp    3b53 <fun7+0x1a>
    3b65:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
    3b69:	e8 cb ff ff ff       	callq  3b39 <fun7>
    3b6e:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
    3b72:	eb df                	jmp    3b53 <fun7+0x1a>
    3b74:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3b79:	c3                   	retq   

0000000000003b7a <secret_phase>:
    3b7a:	f3 0f 1e fa          	endbr64 
    3b7e:	53                   	push   %rbx
    3b7f:	e8 d4 04 00 00       	callq  4058 <read_line>
    3b84:	48 89 c7             	mov    %rax,%rdi
    3b87:	ba 0a 00 00 00       	mov    $0xa,%edx
    3b8c:	be 00 00 00 00       	mov    $0x0,%esi
    3b91:	e8 5a f7 ff ff       	callq  32f0 <strtol@plt>
    3b96:	48 89 c3             	mov    %rax,%rbx
    3b99:	8d 40 ff             	lea    -0x1(%rax),%eax
    3b9c:	3d e8 03 00 00       	cmp    $0x3e8,%eax
    3ba1:	77 26                	ja     3bc9 <secret_phase+0x4f>
    3ba3:	89 de                	mov    %ebx,%esi
    3ba5:	48 8d 3d a4 55 00 00 	lea    0x55a4(%rip),%rdi        # 9150 <n1>
    3bac:	e8 88 ff ff ff       	callq  3b39 <fun7>
    3bb1:	83 f8 03             	cmp    $0x3,%eax
    3bb4:	75 1a                	jne    3bd0 <secret_phase+0x56>
    3bb6:	48 8d 3d cb 25 00 00 	lea    0x25cb(%rip),%rdi        # 6188 <_IO_stdin_used+0x188>
    3bbd:	e8 8e f6 ff ff       	callq  3250 <puts@plt>
    3bc2:	e8 d9 05 00 00       	callq  41a0 <phase_defused>
    3bc7:	5b                   	pop    %rbx
    3bc8:	c3                   	retq   
    3bc9:	e8 03 04 00 00       	callq  3fd1 <explode_bomb>
    3bce:	eb d3                	jmp    3ba3 <secret_phase+0x29>
    3bd0:	e8 fc 03 00 00       	callq  3fd1 <explode_bomb>
    3bd5:	eb df                	jmp    3bb6 <secret_phase+0x3c>

0000000000003bd7 <sig_handler>:
    3bd7:	f3 0f 1e fa          	endbr64 
    3bdb:	50                   	push   %rax
    3bdc:	58                   	pop    %rax
    3bdd:	48 83 ec 08          	sub    $0x8,%rsp
    3be1:	48 8d 3d 38 26 00 00 	lea    0x2638(%rip),%rdi        # 6220 <array.3484+0x40>
    3be8:	e8 63 f6 ff ff       	callq  3250 <puts@plt>
    3bed:	bf 03 00 00 00       	mov    $0x3,%edi
    3bf2:	e8 89 f7 ff ff       	callq  3380 <sleep@plt>
    3bf7:	48 8d 35 40 28 00 00 	lea    0x2840(%rip),%rsi        # 643e <array.3484+0x25e>
    3bfe:	bf 01 00 00 00       	mov    $0x1,%edi
    3c03:	b8 00 00 00 00       	mov    $0x0,%eax
    3c08:	e8 13 f7 ff ff       	callq  3320 <__printf_chk@plt>
    3c0d:	48 8b 3d 6c 5e 00 00 	mov    0x5e6c(%rip),%rdi        # 9a80 <stdout@@GLIBC_2.2.5>
    3c14:	e8 e7 f6 ff ff       	callq  3300 <fflush@plt>
    3c19:	bf 01 00 00 00       	mov    $0x1,%edi
    3c1e:	e8 5d f7 ff ff       	callq  3380 <sleep@plt>
    3c23:	48 8d 3d 1c 28 00 00 	lea    0x281c(%rip),%rdi        # 6446 <array.3484+0x266>
    3c2a:	e8 21 f6 ff ff       	callq  3250 <puts@plt>
    3c2f:	bf 10 00 00 00       	mov    $0x10,%edi
    3c34:	e8 17 f7 ff ff       	callq  3350 <exit@plt>

0000000000003c39 <invalid_phase>:
    3c39:	f3 0f 1e fa          	endbr64 
    3c3d:	50                   	push   %rax
    3c3e:	58                   	pop    %rax
    3c3f:	48 83 ec 08          	sub    $0x8,%rsp
    3c43:	48 89 fa             	mov    %rdi,%rdx
    3c46:	48 8d 35 01 28 00 00 	lea    0x2801(%rip),%rsi        # 644e <array.3484+0x26e>
    3c4d:	bf 01 00 00 00       	mov    $0x1,%edi
    3c52:	b8 00 00 00 00       	mov    $0x0,%eax
    3c57:	e8 c4 f6 ff ff       	callq  3320 <__printf_chk@plt>
    3c5c:	bf 08 00 00 00       	mov    $0x8,%edi
    3c61:	e8 ea f6 ff ff       	callq  3350 <exit@plt>

0000000000003c66 <string_length>:
    3c66:	f3 0f 1e fa          	endbr64 
    3c6a:	80 3f 00             	cmpb   $0x0,(%rdi)
    3c6d:	74 12                	je     3c81 <string_length+0x1b>
    3c6f:	b8 00 00 00 00       	mov    $0x0,%eax
    3c74:	48 83 c7 01          	add    $0x1,%rdi
    3c78:	83 c0 01             	add    $0x1,%eax
    3c7b:	80 3f 00             	cmpb   $0x0,(%rdi)
    3c7e:	75 f4                	jne    3c74 <string_length+0xe>
    3c80:	c3                   	retq   
    3c81:	b8 00 00 00 00       	mov    $0x0,%eax
    3c86:	c3                   	retq   

0000000000003c87 <strings_not_equal>:
    3c87:	f3 0f 1e fa          	endbr64 
    3c8b:	41 54                	push   %r12
    3c8d:	55                   	push   %rbp
    3c8e:	53                   	push   %rbx
    3c8f:	48 89 fb             	mov    %rdi,%rbx
    3c92:	48 89 f5             	mov    %rsi,%rbp
    3c95:	e8 cc ff ff ff       	callq  3c66 <string_length>
    3c9a:	41 89 c4             	mov    %eax,%r12d
    3c9d:	48 89 ef             	mov    %rbp,%rdi
    3ca0:	e8 c1 ff ff ff       	callq  3c66 <string_length>
    3ca5:	89 c2                	mov    %eax,%edx
    3ca7:	b8 01 00 00 00       	mov    $0x1,%eax
    3cac:	41 39 d4             	cmp    %edx,%r12d
    3caf:	75 31                	jne    3ce2 <strings_not_equal+0x5b>
    3cb1:	0f b6 13             	movzbl (%rbx),%edx
    3cb4:	84 d2                	test   %dl,%dl
    3cb6:	74 1e                	je     3cd6 <strings_not_equal+0x4f>
    3cb8:	b8 00 00 00 00       	mov    $0x0,%eax
    3cbd:	38 54 05 00          	cmp    %dl,0x0(%rbp,%rax,1)
    3cc1:	75 1a                	jne    3cdd <strings_not_equal+0x56>
    3cc3:	48 83 c0 01          	add    $0x1,%rax
    3cc7:	0f b6 14 03          	movzbl (%rbx,%rax,1),%edx
    3ccb:	84 d2                	test   %dl,%dl
    3ccd:	75 ee                	jne    3cbd <strings_not_equal+0x36>
    3ccf:	b8 00 00 00 00       	mov    $0x0,%eax
    3cd4:	eb 0c                	jmp    3ce2 <strings_not_equal+0x5b>
    3cd6:	b8 00 00 00 00       	mov    $0x0,%eax
    3cdb:	eb 05                	jmp    3ce2 <strings_not_equal+0x5b>
    3cdd:	b8 01 00 00 00       	mov    $0x1,%eax
    3ce2:	5b                   	pop    %rbx
    3ce3:	5d                   	pop    %rbp
    3ce4:	41 5c                	pop    %r12
    3ce6:	c3                   	retq   

0000000000003ce7 <initialize_bomb>:
    3ce7:	f3 0f 1e fa          	endbr64 
    3ceb:	55                   	push   %rbp
    3cec:	53                   	push   %rbx
    3ced:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    3cf4:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    3cf9:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    3d00:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    3d05:	48 83 ec 58          	sub    $0x58,%rsp
    3d09:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    3d10:	00 00 
    3d12:	48 89 84 24 48 20 00 	mov    %rax,0x2048(%rsp)
    3d19:	00 
    3d1a:	31 c0                	xor    %eax,%eax
    3d1c:	48 8d 35 b4 fe ff ff 	lea    -0x14c(%rip),%rsi        # 3bd7 <sig_handler>
    3d23:	bf 02 00 00 00       	mov    $0x2,%edi
    3d28:	e8 93 f5 ff ff       	callq  32c0 <signal@plt>
    3d2d:	48 89 e7             	mov    %rsp,%rdi
    3d30:	be 40 00 00 00       	mov    $0x40,%esi
    3d35:	e8 06 f6 ff ff       	callq  3340 <gethostname@plt>
    3d3a:	85 c0                	test   %eax,%eax
    3d3c:	0f 85 9b 00 00 00    	jne    3ddd <initialize_bomb+0xf6>
    3d42:	48 8b 3d 37 55 00 00 	mov    0x5537(%rip),%rdi        # 9280 <host_table>
    3d49:	48 8d 1d 38 55 00 00 	lea    0x5538(%rip),%rbx        # 9288 <host_table+0x8>
    3d50:	48 89 e5             	mov    %rsp,%rbp
    3d53:	48 85 ff             	test   %rdi,%rdi
    3d56:	74 1d                	je     3d75 <initialize_bomb+0x8e>
    3d58:	48 89 ee             	mov    %rbp,%rsi
    3d5b:	e8 c0 f4 ff ff       	callq  3220 <strcasecmp@plt>
    3d60:	85 c0                	test   %eax,%eax
    3d62:	0f 84 b0 00 00 00    	je     3e18 <initialize_bomb+0x131>
    3d68:	48 83 c3 08          	add    $0x8,%rbx
    3d6c:	48 8b 7b f8          	mov    -0x8(%rbx),%rdi
    3d70:	48 85 ff             	test   %rdi,%rdi
    3d73:	75 e3                	jne    3d58 <initialize_bomb+0x71>
    3d75:	48 89 e2             	mov    %rsp,%rdx
    3d78:	48 8d 35 11 25 00 00 	lea    0x2511(%rip),%rsi        # 6290 <array.3484+0xb0>
    3d7f:	bf 01 00 00 00       	mov    $0x1,%edi
    3d84:	b8 00 00 00 00       	mov    $0x0,%eax
    3d89:	e8 92 f5 ff ff       	callq  3320 <__printf_chk@plt>
    3d8e:	48 8d 3d ea 26 00 00 	lea    0x26ea(%rip),%rdi        # 647f <array.3484+0x29f>
    3d95:	e8 b6 f4 ff ff       	callq  3250 <puts@plt>
    3d9a:	48 8b 15 df 54 00 00 	mov    0x54df(%rip),%rdx        # 9280 <host_table>
    3da1:	48 8d 1d e0 54 00 00 	lea    0x54e0(%rip),%rbx        # 9288 <host_table+0x8>
    3da8:	48 8d 2d b0 26 00 00 	lea    0x26b0(%rip),%rbp        # 645f <array.3484+0x27f>
    3daf:	48 85 d2             	test   %rdx,%rdx
    3db2:	74 1f                	je     3dd3 <initialize_bomb+0xec>
    3db4:	48 89 ee             	mov    %rbp,%rsi
    3db7:	bf 01 00 00 00       	mov    $0x1,%edi
    3dbc:	b8 00 00 00 00       	mov    $0x0,%eax
    3dc1:	e8 5a f5 ff ff       	callq  3320 <__printf_chk@plt>
    3dc6:	48 83 c3 08          	add    $0x8,%rbx
    3dca:	48 8b 53 f8          	mov    -0x8(%rbx),%rdx
    3dce:	48 85 d2             	test   %rdx,%rdx
    3dd1:	75 e1                	jne    3db4 <initialize_bomb+0xcd>
    3dd3:	bf 08 00 00 00       	mov    $0x8,%edi
    3dd8:	e8 73 f5 ff ff       	callq  3350 <exit@plt>
    3ddd:	48 8d 3d 74 24 00 00 	lea    0x2474(%rip),%rdi        # 6258 <array.3484+0x78>
    3de4:	e8 67 f4 ff ff       	callq  3250 <puts@plt>
    3de9:	bf 08 00 00 00       	mov    $0x8,%edi
    3dee:	e8 5d f5 ff ff       	callq  3350 <exit@plt>
    3df3:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
    3df8:	48 8d 35 66 26 00 00 	lea    0x2666(%rip),%rsi        # 6465 <array.3484+0x285>
    3dff:	bf 01 00 00 00       	mov    $0x1,%edi
    3e04:	b8 00 00 00 00       	mov    $0x0,%eax
    3e09:	e8 12 f5 ff ff       	callq  3320 <__printf_chk@plt>
    3e0e:	bf 08 00 00 00       	mov    $0x8,%edi
    3e13:	e8 38 f5 ff ff       	callq  3350 <exit@plt>
    3e18:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    3e1d:	e8 09 0f 00 00       	callq  4d2b <init_driver>
    3e22:	85 c0                	test   %eax,%eax
    3e24:	78 cd                	js     3df3 <initialize_bomb+0x10c>
    3e26:	48 8b 84 24 48 20 00 	mov    0x2048(%rsp),%rax
    3e2d:	00 
    3e2e:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    3e35:	00 00 
    3e37:	75 0a                	jne    3e43 <initialize_bomb+0x15c>
    3e39:	48 81 c4 58 20 00 00 	add    $0x2058,%rsp
    3e40:	5b                   	pop    %rbx
    3e41:	5d                   	pop    %rbp
    3e42:	c3                   	retq   
    3e43:	e8 28 f4 ff ff       	callq  3270 <__stack_chk_fail@plt>

0000000000003e48 <initialize_bomb_solve>:
    3e48:	f3 0f 1e fa          	endbr64 
    3e4c:	c3                   	retq   

0000000000003e4d <blank_line>:
    3e4d:	f3 0f 1e fa          	endbr64 
    3e51:	55                   	push   %rbp
    3e52:	53                   	push   %rbx
    3e53:	48 83 ec 08          	sub    $0x8,%rsp
    3e57:	48 89 fd             	mov    %rdi,%rbp
    3e5a:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
    3e5e:	84 db                	test   %bl,%bl
    3e60:	74 1e                	je     3e80 <blank_line+0x33>
    3e62:	e8 29 f5 ff ff       	callq  3390 <__ctype_b_loc@plt>
    3e67:	48 83 c5 01          	add    $0x1,%rbp
    3e6b:	48 0f be db          	movsbq %bl,%rbx
    3e6f:	48 8b 00             	mov    (%rax),%rax
    3e72:	f6 44 58 01 20       	testb  $0x20,0x1(%rax,%rbx,2)
    3e77:	75 e1                	jne    3e5a <blank_line+0xd>
    3e79:	b8 00 00 00 00       	mov    $0x0,%eax
    3e7e:	eb 05                	jmp    3e85 <blank_line+0x38>
    3e80:	b8 01 00 00 00       	mov    $0x1,%eax
    3e85:	48 83 c4 08          	add    $0x8,%rsp
    3e89:	5b                   	pop    %rbx
    3e8a:	5d                   	pop    %rbp
    3e8b:	c3                   	retq   

0000000000003e8c <skip>:
    3e8c:	f3 0f 1e fa          	endbr64 
    3e90:	55                   	push   %rbp
    3e91:	53                   	push   %rbx
    3e92:	48 83 ec 08          	sub    $0x8,%rsp
    3e96:	48 8d 2d 23 5c 00 00 	lea    0x5c23(%rip),%rbp        # 9ac0 <input_strings>
    3e9d:	48 63 05 08 5c 00 00 	movslq 0x5c08(%rip),%rax        # 9aac <num_input_strings>
    3ea4:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
    3ea8:	48 c1 e7 04          	shl    $0x4,%rdi
    3eac:	48 01 ef             	add    %rbp,%rdi
    3eaf:	48 8b 15 fa 5b 00 00 	mov    0x5bfa(%rip),%rdx        # 9ab0 <infile>
    3eb6:	be 50 00 00 00       	mov    $0x50,%esi
    3ebb:	e8 f0 f3 ff ff       	callq  32b0 <fgets@plt>
    3ec0:	48 89 c3             	mov    %rax,%rbx
    3ec3:	48 85 c0             	test   %rax,%rax
    3ec6:	74 0c                	je     3ed4 <skip+0x48>
    3ec8:	48 89 c7             	mov    %rax,%rdi
    3ecb:	e8 7d ff ff ff       	callq  3e4d <blank_line>
    3ed0:	85 c0                	test   %eax,%eax
    3ed2:	75 c9                	jne    3e9d <skip+0x11>
    3ed4:	48 89 d8             	mov    %rbx,%rax
    3ed7:	48 83 c4 08          	add    $0x8,%rsp
    3edb:	5b                   	pop    %rbx
    3edc:	5d                   	pop    %rbp
    3edd:	c3                   	retq   

0000000000003ede <send_msg>:
    3ede:	f3 0f 1e fa          	endbr64 
    3ee2:	53                   	push   %rbx
    3ee3:	4c 8d 9c 24 00 c0 ff 	lea    -0x4000(%rsp),%r11
    3eea:	ff 
    3eeb:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    3ef2:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    3ef7:	4c 39 dc             	cmp    %r11,%rsp
    3efa:	75 ef                	jne    3eeb <send_msg+0xd>
    3efc:	48 83 ec 10          	sub    $0x10,%rsp
    3f00:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    3f07:	00 00 
    3f09:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
    3f10:	00 
    3f11:	31 c0                	xor    %eax,%eax
    3f13:	8b 15 93 5b 00 00    	mov    0x5b93(%rip),%edx        # 9aac <num_input_strings>
    3f19:	8d 42 ff             	lea    -0x1(%rdx),%eax
    3f1c:	48 98                	cltq   
    3f1e:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    3f22:	48 c1 e0 04          	shl    $0x4,%rax
    3f26:	48 8d 0d 93 5b 00 00 	lea    0x5b93(%rip),%rcx        # 9ac0 <input_strings>
    3f2d:	48 01 c8             	add    %rcx,%rax
    3f30:	85 ff                	test   %edi,%edi
    3f32:	4c 8d 0d 62 25 00 00 	lea    0x2562(%rip),%r9        # 649b <array.3484+0x2bb>
    3f39:	48 8d 0d 63 25 00 00 	lea    0x2563(%rip),%rcx        # 64a3 <array.3484+0x2c3>
    3f40:	4c 0f 44 c9          	cmove  %rcx,%r9
    3f44:	48 89 e3             	mov    %rsp,%rbx
    3f47:	50                   	push   %rax
    3f48:	52                   	push   %rdx
    3f49:	44 8b 05 f4 51 00 00 	mov    0x51f4(%rip),%r8d        # 9144 <bomb_id>
    3f50:	48 8d 0d 55 25 00 00 	lea    0x2555(%rip),%rcx        # 64ac <array.3484+0x2cc>
    3f57:	ba 00 20 00 00       	mov    $0x2000,%edx
    3f5c:	be 01 00 00 00       	mov    $0x1,%esi
    3f61:	48 89 df             	mov    %rbx,%rdi
    3f64:	b8 00 00 00 00       	mov    $0x0,%eax
    3f69:	e8 32 f4 ff ff       	callq  33a0 <__sprintf_chk@plt>
    3f6e:	4c 8d 84 24 10 20 00 	lea    0x2010(%rsp),%r8
    3f75:	00 
    3f76:	b9 00 00 00 00       	mov    $0x0,%ecx
    3f7b:	48 89 da             	mov    %rbx,%rdx
    3f7e:	48 8d 35 9b 51 00 00 	lea    0x519b(%rip),%rsi        # 9120 <user_password>
    3f85:	48 8d 3d ac 51 00 00 	lea    0x51ac(%rip),%rdi        # 9138 <userid>
    3f8c:	e8 8f 0f 00 00       	callq  4f20 <driver_post>
    3f91:	48 83 c4 10          	add    $0x10,%rsp
    3f95:	85 c0                	test   %eax,%eax
    3f97:	78 1c                	js     3fb5 <send_msg+0xd7>
    3f99:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
    3fa0:	00 
    3fa1:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    3fa8:	00 00 
    3faa:	75 20                	jne    3fcc <send_msg+0xee>
    3fac:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
    3fb3:	5b                   	pop    %rbx
    3fb4:	c3                   	retq   
    3fb5:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
    3fbc:	00 
    3fbd:	e8 8e f2 ff ff       	callq  3250 <puts@plt>
    3fc2:	bf 00 00 00 00       	mov    $0x0,%edi
    3fc7:	e8 84 f3 ff ff       	callq  3350 <exit@plt>
    3fcc:	e8 9f f2 ff ff       	callq  3270 <__stack_chk_fail@plt>

0000000000003fd1 <explode_bomb>:
    3fd1:	f3 0f 1e fa          	endbr64 
    3fd5:	50                   	push   %rax
    3fd6:	58                   	pop    %rax
    3fd7:	48 83 ec 08          	sub    $0x8,%rsp
    3fdb:	48 8d 3d d6 24 00 00 	lea    0x24d6(%rip),%rdi        # 64b8 <array.3484+0x2d8>
    3fe2:	e8 69 f2 ff ff       	callq  3250 <puts@plt>
    3fe7:	48 8d 3d d3 24 00 00 	lea    0x24d3(%rip),%rdi        # 64c1 <array.3484+0x2e1>
    3fee:	e8 5d f2 ff ff       	callq  3250 <puts@plt>
    3ff3:	bf 00 00 00 00       	mov    $0x0,%edi
    3ff8:	e8 e1 fe ff ff       	callq  3ede <send_msg>
    3ffd:	48 8d 3d bc 22 00 00 	lea    0x22bc(%rip),%rdi        # 62c0 <array.3484+0xe0>
    4004:	e8 47 f2 ff ff       	callq  3250 <puts@plt>
    4009:	bf 08 00 00 00       	mov    $0x8,%edi
    400e:	e8 3d f3 ff ff       	callq  3350 <exit@plt>

0000000000004013 <read_six_numbers>:
    4013:	f3 0f 1e fa          	endbr64 
    4017:	48 83 ec 08          	sub    $0x8,%rsp
    401b:	48 89 f2             	mov    %rsi,%rdx
    401e:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
    4022:	48 8d 46 14          	lea    0x14(%rsi),%rax
    4026:	50                   	push   %rax
    4027:	48 8d 46 10          	lea    0x10(%rsi),%rax
    402b:	50                   	push   %rax
    402c:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
    4030:	4c 8d 46 08          	lea    0x8(%rsi),%r8
    4034:	48 8d 35 9d 24 00 00 	lea    0x249d(%rip),%rsi        # 64d8 <array.3484+0x2f8>
    403b:	b8 00 00 00 00       	mov    $0x0,%eax
    4040:	e8 cb f2 ff ff       	callq  3310 <__isoc99_sscanf@plt>
    4045:	48 83 c4 10          	add    $0x10,%rsp
    4049:	83 f8 05             	cmp    $0x5,%eax
    404c:	7e 05                	jle    4053 <read_six_numbers+0x40>
    404e:	48 83 c4 08          	add    $0x8,%rsp
    4052:	c3                   	retq   
    4053:	e8 79 ff ff ff       	callq  3fd1 <explode_bomb>

0000000000004058 <read_line>:
    4058:	f3 0f 1e fa          	endbr64 
    405c:	48 83 ec 08          	sub    $0x8,%rsp
    4060:	b8 00 00 00 00       	mov    $0x0,%eax
    4065:	e8 22 fe ff ff       	callq  3e8c <skip>
    406a:	48 85 c0             	test   %rax,%rax
    406d:	74 6f                	je     40de <read_line+0x86>
    406f:	8b 35 37 5a 00 00    	mov    0x5a37(%rip),%esi        # 9aac <num_input_strings>
    4075:	48 63 c6             	movslq %esi,%rax
    4078:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
    407c:	48 c1 e2 04          	shl    $0x4,%rdx
    4080:	48 8d 05 39 5a 00 00 	lea    0x5a39(%rip),%rax        # 9ac0 <input_strings>
    4087:	48 01 c2             	add    %rax,%rdx
    408a:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    4091:	b8 00 00 00 00       	mov    $0x0,%eax
    4096:	48 89 d7             	mov    %rdx,%rdi
    4099:	f2 ae                	repnz scas %es:(%rdi),%al
    409b:	48 f7 d1             	not    %rcx
    409e:	48 83 e9 01          	sub    $0x1,%rcx
    40a2:	83 f9 4e             	cmp    $0x4e,%ecx
    40a5:	0f 8f ab 00 00 00    	jg     4156 <read_line+0xfe>
    40ab:	83 e9 01             	sub    $0x1,%ecx
    40ae:	48 63 c9             	movslq %ecx,%rcx
    40b1:	48 63 c6             	movslq %esi,%rax
    40b4:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
    40b8:	48 c1 e0 04          	shl    $0x4,%rax
    40bc:	48 89 c7             	mov    %rax,%rdi
    40bf:	48 8d 05 fa 59 00 00 	lea    0x59fa(%rip),%rax        # 9ac0 <input_strings>
    40c6:	48 01 f8             	add    %rdi,%rax
    40c9:	c6 04 08 00          	movb   $0x0,(%rax,%rcx,1)
    40cd:	83 c6 01             	add    $0x1,%esi
    40d0:	89 35 d6 59 00 00    	mov    %esi,0x59d6(%rip)        # 9aac <num_input_strings>
    40d6:	48 89 d0             	mov    %rdx,%rax
    40d9:	48 83 c4 08          	add    $0x8,%rsp
    40dd:	c3                   	retq   
    40de:	48 8b 05 ab 59 00 00 	mov    0x59ab(%rip),%rax        # 9a90 <stdin@@GLIBC_2.2.5>
    40e5:	48 39 05 c4 59 00 00 	cmp    %rax,0x59c4(%rip)        # 9ab0 <infile>
    40ec:	74 1b                	je     4109 <read_line+0xb1>
    40ee:	48 8d 3d 13 24 00 00 	lea    0x2413(%rip),%rdi        # 6508 <array.3484+0x328>
    40f5:	e8 06 f1 ff ff       	callq  3200 <getenv@plt>
    40fa:	48 85 c0             	test   %rax,%rax
    40fd:	74 20                	je     411f <read_line+0xc7>
    40ff:	bf 00 00 00 00       	mov    $0x0,%edi
    4104:	e8 47 f2 ff ff       	callq  3350 <exit@plt>
    4109:	48 8d 3d da 23 00 00 	lea    0x23da(%rip),%rdi        # 64ea <array.3484+0x30a>
    4110:	e8 3b f1 ff ff       	callq  3250 <puts@plt>
    4115:	bf 08 00 00 00       	mov    $0x8,%edi
    411a:	e8 31 f2 ff ff       	callq  3350 <exit@plt>
    411f:	48 8b 05 6a 59 00 00 	mov    0x596a(%rip),%rax        # 9a90 <stdin@@GLIBC_2.2.5>
    4126:	48 89 05 83 59 00 00 	mov    %rax,0x5983(%rip)        # 9ab0 <infile>
    412d:	b8 00 00 00 00       	mov    $0x0,%eax
    4132:	e8 55 fd ff ff       	callq  3e8c <skip>
    4137:	48 85 c0             	test   %rax,%rax
    413a:	0f 85 2f ff ff ff    	jne    406f <read_line+0x17>
    4140:	48 8d 3d a3 23 00 00 	lea    0x23a3(%rip),%rdi        # 64ea <array.3484+0x30a>
    4147:	e8 04 f1 ff ff       	callq  3250 <puts@plt>
    414c:	bf 00 00 00 00       	mov    $0x0,%edi
    4151:	e8 fa f1 ff ff       	callq  3350 <exit@plt>
    4156:	48 8d 3d b6 23 00 00 	lea    0x23b6(%rip),%rdi        # 6513 <array.3484+0x333>
    415d:	e8 ee f0 ff ff       	callq  3250 <puts@plt>
    4162:	8b 05 44 59 00 00    	mov    0x5944(%rip),%eax        # 9aac <num_input_strings>
    4168:	8d 50 01             	lea    0x1(%rax),%edx
    416b:	89 15 3b 59 00 00    	mov    %edx,0x593b(%rip)        # 9aac <num_input_strings>
    4171:	48 98                	cltq   
    4173:	48 6b c0 50          	imul   $0x50,%rax,%rax
    4177:	48 8d 15 42 59 00 00 	lea    0x5942(%rip),%rdx        # 9ac0 <input_strings>
    417e:	48 be 2a 2a 2a 74 72 	movabs $0x636e7572742a2a2a,%rsi
    4185:	75 6e 63 
    4188:	48 bf 61 74 65 64 2a 	movabs $0x2a2a2a64657461,%rdi
    418f:	2a 2a 00 
    4192:	48 89 34 02          	mov    %rsi,(%rdx,%rax,1)
    4196:	48 89 7c 02 08       	mov    %rdi,0x8(%rdx,%rax,1)
    419b:	e8 31 fe ff ff       	callq  3fd1 <explode_bomb>

00000000000041a0 <phase_defused>:
    41a0:	f3 0f 1e fa          	endbr64 
    41a4:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
    41ab:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    41b2:	00 00 
    41b4:	48 89 84 24 88 00 00 	mov    %rax,0x88(%rsp)
    41bb:	00 
    41bc:	31 c0                	xor    %eax,%eax
    41be:	bf 01 00 00 00       	mov    $0x1,%edi
    41c3:	e8 16 fd ff ff       	callq  3ede <send_msg>
    41c8:	83 3d dd 58 00 00 06 	cmpl   $0x6,0x58dd(%rip)        # 9aac <num_input_strings>
    41cf:	74 1f                	je     41f0 <phase_defused+0x50>
    41d1:	48 8b 84 24 88 00 00 	mov    0x88(%rsp),%rax
    41d8:	00 
    41d9:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    41e0:	00 00 
    41e2:	0f 85 77 01 00 00    	jne    435f <phase_defused+0x1bf>
    41e8:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
    41ef:	c3                   	retq   
    41f0:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
    41f5:	48 8d 4c 24 14       	lea    0x14(%rsp),%rcx
    41fa:	48 83 ec 08          	sub    $0x8,%rsp
    41fe:	48 8d 44 24 38       	lea    0x38(%rsp),%rax
    4203:	50                   	push   %rax
    4204:	48 8d 44 24 34       	lea    0x34(%rsp),%rax
    4209:	50                   	push   %rax
    420a:	48 8d 44 24 38       	lea    0x38(%rsp),%rax
    420f:	50                   	push   %rax
    4210:	4c 8d 4c 24 3c       	lea    0x3c(%rsp),%r9
    4215:	4c 8d 44 24 38       	lea    0x38(%rsp),%r8
    421a:	48 8d 35 0d 23 00 00 	lea    0x230d(%rip),%rsi        # 652e <array.3484+0x34e>
    4221:	48 8d 3d e8 58 00 00 	lea    0x58e8(%rip),%rdi        # 9b10 <input_strings+0x50>
    4228:	b8 00 00 00 00       	mov    $0x0,%eax
    422d:	e8 de f0 ff ff       	callq  3310 <__isoc99_sscanf@plt>
    4232:	48 83 c4 20          	add    $0x20,%rsp
    4236:	83 f8 07             	cmp    $0x7,%eax
    4239:	0f 84 e0 00 00 00    	je     431f <phase_defused+0x17f>
    423f:	48 8d 3d 0a 21 00 00 	lea    0x210a(%rip),%rdi        # 6350 <array.3484+0x170>
    4246:	e8 05 f0 ff ff       	callq  3250 <puts@plt>
    424b:	48 8d 3d 2e 21 00 00 	lea    0x212e(%rip),%rdi        # 6380 <array.3484+0x1a0>
    4252:	e8 f9 ef ff ff       	callq  3250 <puts@plt>
    4257:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
    425c:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
    4261:	4c 8d 44 24 30       	lea    0x30(%rsp),%r8
    4266:	48 8d 35 cd 22 00 00 	lea    0x22cd(%rip),%rsi        # 653a <array.3484+0x35a>
    426d:	48 8d 3d 3c 59 00 00 	lea    0x593c(%rip),%rdi        # 9bb0 <input_strings+0xf0>
    4274:	b8 00 00 00 00       	mov    $0x0,%eax
    4279:	e8 92 f0 ff ff       	callq  3310 <__isoc99_sscanf@plt>
    427e:	83 f8 03             	cmp    $0x3,%eax
    4281:	0f 85 4a ff ff ff    	jne    41d1 <phase_defused+0x31>
    4287:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    428c:	48 8d 35 b9 22 00 00 	lea    0x22b9(%rip),%rsi        # 654c <array.3484+0x36c>
    4293:	e8 ef f9 ff ff       	callq  3c87 <strings_not_equal>
    4298:	85 c0                	test   %eax,%eax
    429a:	0f 85 31 ff ff ff    	jne    41d1 <phase_defused+0x31>
    42a0:	48 8d 3d d1 22 00 00 	lea    0x22d1(%rip),%rdi        # 6578 <array.3484+0x398>
    42a7:	e8 a4 ef ff ff       	callq  3250 <puts@plt>
    42ac:	bf 02 00 00 00       	mov    $0x2,%edi
    42b1:	e8 ca f0 ff ff       	callq  3380 <sleep@plt>
    42b6:	48 8d 3d 96 22 00 00 	lea    0x2296(%rip),%rdi        # 6553 <array.3484+0x373>
    42bd:	e8 8e ef ff ff       	callq  3250 <puts@plt>
    42c2:	bf 03 00 00 00       	mov    $0x3,%edi
    42c7:	e8 b4 f0 ff ff       	callq  3380 <sleep@plt>
    42cc:	48 8d 3d 93 22 00 00 	lea    0x2293(%rip),%rdi        # 6566 <array.3484+0x386>
    42d3:	e8 78 ef ff ff       	callq  3250 <puts@plt>
    42d8:	bf 04 00 00 00       	mov    $0x4,%edi
    42dd:	e8 9e f0 ff ff       	callq  3380 <sleep@plt>
    42e2:	48 8d 3d 93 22 00 00 	lea    0x2293(%rip),%rdi        # 657c <array.3484+0x39c>
    42e9:	e8 62 ef ff ff       	callq  3250 <puts@plt>
    42ee:	bf 05 00 00 00       	mov    $0x5,%edi
    42f3:	e8 88 f0 ff ff       	callq  3380 <sleep@plt>
    42f8:	48 8d 3d c9 20 00 00 	lea    0x20c9(%rip),%rdi        # 63c8 <array.3484+0x1e8>
    42ff:	e8 4c ef ff ff       	callq  3250 <puts@plt>
    4304:	bf 05 00 00 00       	mov    $0x5,%edi
    4309:	e8 72 f0 ff ff       	callq  3380 <sleep@plt>
    430e:	48 8d 3d eb 20 00 00 	lea    0x20eb(%rip),%rdi        # 6400 <array.3484+0x220>
    4315:	e8 36 ef ff ff       	callq  3250 <puts@plt>
    431a:	e9 b2 fe ff ff       	jmpq   41d1 <phase_defused+0x31>
    431f:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
    4324:	48 8d 35 18 22 00 00 	lea    0x2218(%rip),%rsi        # 6543 <array.3484+0x363>
    432b:	e8 57 f9 ff ff       	callq  3c87 <strings_not_equal>
    4330:	85 c0                	test   %eax,%eax
    4332:	0f 85 07 ff ff ff    	jne    423f <phase_defused+0x9f>
    4338:	48 8d 3d a9 1f 00 00 	lea    0x1fa9(%rip),%rdi        # 62e8 <array.3484+0x108>
    433f:	e8 0c ef ff ff       	callq  3250 <puts@plt>
    4344:	48 8d 3d cd 1f 00 00 	lea    0x1fcd(%rip),%rdi        # 6318 <array.3484+0x138>
    434b:	e8 00 ef ff ff       	callq  3250 <puts@plt>
    4350:	b8 00 00 00 00       	mov    $0x0,%eax
    4355:	e8 20 f8 ff ff       	callq  3b7a <secret_phase>
    435a:	e9 e0 fe ff ff       	jmpq   423f <phase_defused+0x9f>
    435f:	e8 0c ef ff ff       	callq  3270 <__stack_chk_fail@plt>

0000000000004364 <sigalrm_handler>:
    4364:	f3 0f 1e fa          	endbr64 
    4368:	50                   	push   %rax
    4369:	58                   	pop    %rax
    436a:	48 83 ec 08          	sub    $0x8,%rsp
    436e:	b9 00 00 00 00       	mov    $0x0,%ecx
    4373:	48 8d 15 1e 2d 00 00 	lea    0x2d1e(%rip),%rdx        # 7098 <array.3484+0xeb8>
    437a:	be 01 00 00 00       	mov    $0x1,%esi
    437f:	48 8b 3d 1a 57 00 00 	mov    0x571a(%rip),%rdi        # 9aa0 <stderr@@GLIBC_2.2.5>
    4386:	b8 00 00 00 00       	mov    $0x0,%eax
    438b:	e8 e0 ef ff ff       	callq  3370 <__fprintf_chk@plt>
    4390:	bf 01 00 00 00       	mov    $0x1,%edi
    4395:	e8 b6 ef ff ff       	callq  3350 <exit@plt>

000000000000439a <rio_readlineb>:
    439a:	41 56                	push   %r14
    439c:	41 55                	push   %r13
    439e:	41 54                	push   %r12
    43a0:	55                   	push   %rbp
    43a1:	53                   	push   %rbx
    43a2:	48 89 f5             	mov    %rsi,%rbp
    43a5:	48 83 fa 01          	cmp    $0x1,%rdx
    43a9:	0f 86 90 00 00 00    	jbe    443f <rio_readlineb+0xa5>
    43af:	48 89 fb             	mov    %rdi,%rbx
    43b2:	4c 8d 74 16 ff       	lea    -0x1(%rsi,%rdx,1),%r14
    43b7:	41 bd 01 00 00 00    	mov    $0x1,%r13d
    43bd:	4c 8d 67 10          	lea    0x10(%rdi),%r12
    43c1:	eb 54                	jmp    4417 <rio_readlineb+0x7d>
    43c3:	e8 68 ee ff ff       	callq  3230 <__errno_location@plt>
    43c8:	83 38 04             	cmpl   $0x4,(%rax)
    43cb:	75 53                	jne    4420 <rio_readlineb+0x86>
    43cd:	ba 00 20 00 00       	mov    $0x2000,%edx
    43d2:	4c 89 e6             	mov    %r12,%rsi
    43d5:	8b 3b                	mov    (%rbx),%edi
    43d7:	e8 c4 ee ff ff       	callq  32a0 <read@plt>
    43dc:	89 c2                	mov    %eax,%edx
    43de:	89 43 04             	mov    %eax,0x4(%rbx)
    43e1:	85 c0                	test   %eax,%eax
    43e3:	78 de                	js     43c3 <rio_readlineb+0x29>
    43e5:	85 c0                	test   %eax,%eax
    43e7:	74 40                	je     4429 <rio_readlineb+0x8f>
    43e9:	4c 89 63 08          	mov    %r12,0x8(%rbx)
    43ed:	48 8b 43 08          	mov    0x8(%rbx),%rax
    43f1:	0f b6 08             	movzbl (%rax),%ecx
    43f4:	48 83 c0 01          	add    $0x1,%rax
    43f8:	48 89 43 08          	mov    %rax,0x8(%rbx)
    43fc:	83 ea 01             	sub    $0x1,%edx
    43ff:	89 53 04             	mov    %edx,0x4(%rbx)
    4402:	48 83 c5 01          	add    $0x1,%rbp
    4406:	88 4d ff             	mov    %cl,-0x1(%rbp)
    4409:	80 f9 0a             	cmp    $0xa,%cl
    440c:	74 3c                	je     444a <rio_readlineb+0xb0>
    440e:	41 83 c5 01          	add    $0x1,%r13d
    4412:	4c 39 f5             	cmp    %r14,%rbp
    4415:	74 30                	je     4447 <rio_readlineb+0xad>
    4417:	8b 53 04             	mov    0x4(%rbx),%edx
    441a:	85 d2                	test   %edx,%edx
    441c:	7e af                	jle    43cd <rio_readlineb+0x33>
    441e:	eb cd                	jmp    43ed <rio_readlineb+0x53>
    4420:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    4427:	eb 05                	jmp    442e <rio_readlineb+0x94>
    4429:	b8 00 00 00 00       	mov    $0x0,%eax
    442e:	85 c0                	test   %eax,%eax
    4430:	75 28                	jne    445a <rio_readlineb+0xc0>
    4432:	b8 00 00 00 00       	mov    $0x0,%eax
    4437:	41 83 fd 01          	cmp    $0x1,%r13d
    443b:	75 0d                	jne    444a <rio_readlineb+0xb0>
    443d:	eb 12                	jmp    4451 <rio_readlineb+0xb7>
    443f:	41 bd 01 00 00 00    	mov    $0x1,%r13d
    4445:	eb 03                	jmp    444a <rio_readlineb+0xb0>
    4447:	4c 89 f5             	mov    %r14,%rbp
    444a:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
    444e:	49 63 c5             	movslq %r13d,%rax
    4451:	5b                   	pop    %rbx
    4452:	5d                   	pop    %rbp
    4453:	41 5c                	pop    %r12
    4455:	41 5d                	pop    %r13
    4457:	41 5e                	pop    %r14
    4459:	c3                   	retq   
    445a:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    4461:	eb ee                	jmp    4451 <rio_readlineb+0xb7>

0000000000004463 <submitr>:
    4463:	f3 0f 1e fa          	endbr64 
    4467:	41 57                	push   %r15
    4469:	41 56                	push   %r14
    446b:	41 55                	push   %r13
    446d:	41 54                	push   %r12
    446f:	55                   	push   %rbp
    4470:	53                   	push   %rbx
    4471:	4c 8d 9c 24 00 60 ff 	lea    -0xa000(%rsp),%r11
    4478:	ff 
    4479:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
    4480:	48 83 0c 24 00       	orq    $0x0,(%rsp)
    4485:	4c 39 dc             	cmp    %r11,%rsp
    4488:	75 ef                	jne    4479 <submitr+0x16>
    448a:	48 83 ec 68          	sub    $0x68,%rsp
    448e:	49 89 fd             	mov    %rdi,%r13
    4491:	89 f5                	mov    %esi,%ebp
    4493:	48 89 14 24          	mov    %rdx,(%rsp)
    4497:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    449c:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
    44a1:	4c 89 4c 24 10       	mov    %r9,0x10(%rsp)
    44a6:	48 8b 9c 24 a0 a0 00 	mov    0xa0a0(%rsp),%rbx
    44ad:	00 
    44ae:	4c 8b bc 24 a8 a0 00 	mov    0xa0a8(%rsp),%r15
    44b5:	00 
    44b6:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    44bd:	00 00 
    44bf:	48 89 84 24 58 a0 00 	mov    %rax,0xa058(%rsp)
    44c6:	00 
    44c7:	31 c0                	xor    %eax,%eax
    44c9:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%rsp)
    44d0:	00 
    44d1:	ba 00 00 00 00       	mov    $0x0,%edx
    44d6:	be 01 00 00 00       	mov    $0x1,%esi
    44db:	bf 02 00 00 00       	mov    $0x2,%edi
    44e0:	e8 cb ee ff ff       	callq  33b0 <socket@plt>
    44e5:	85 c0                	test   %eax,%eax
    44e7:	0f 88 17 01 00 00    	js     4604 <submitr+0x1a1>
    44ed:	41 89 c4             	mov    %eax,%r12d
    44f0:	4c 89 ef             	mov    %r13,%rdi
    44f3:	e8 d8 ed ff ff       	callq  32d0 <gethostbyname@plt>
    44f8:	48 85 c0             	test   %rax,%rax
    44fb:	0f 84 53 01 00 00    	je     4654 <submitr+0x1f1>
    4501:	4c 8d 6c 24 30       	lea    0x30(%rsp),%r13
    4506:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
    450d:	00 00 
    450f:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
    4516:	00 00 
    4518:	66 c7 44 24 30 02 00 	movw   $0x2,0x30(%rsp)
    451f:	48 63 50 14          	movslq 0x14(%rax),%rdx
    4523:	48 8b 40 18          	mov    0x18(%rax),%rax
    4527:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
    452c:	b9 0c 00 00 00       	mov    $0xc,%ecx
    4531:	48 8b 30             	mov    (%rax),%rsi
    4534:	e8 a7 ed ff ff       	callq  32e0 <__memmove_chk@plt>
    4539:	66 c1 c5 08          	rol    $0x8,%bp
    453d:	66 89 6c 24 32       	mov    %bp,0x32(%rsp)
    4542:	ba 10 00 00 00       	mov    $0x10,%edx
    4547:	4c 89 ee             	mov    %r13,%rsi
    454a:	44 89 e7             	mov    %r12d,%edi
    454d:	e8 0e ee ff ff       	callq  3360 <connect@plt>
    4552:	85 c0                	test   %eax,%eax
    4554:	0f 88 65 01 00 00    	js     46bf <submitr+0x25c>
    455a:	49 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%r9
    4561:	b8 00 00 00 00       	mov    $0x0,%eax
    4566:	4c 89 c9             	mov    %r9,%rcx
    4569:	48 89 df             	mov    %rbx,%rdi
    456c:	f2 ae                	repnz scas %es:(%rdi),%al
    456e:	48 f7 d1             	not    %rcx
    4571:	48 89 ce             	mov    %rcx,%rsi
    4574:	4c 89 c9             	mov    %r9,%rcx
    4577:	48 8b 3c 24          	mov    (%rsp),%rdi
    457b:	f2 ae                	repnz scas %es:(%rdi),%al
    457d:	49 89 c8             	mov    %rcx,%r8
    4580:	4c 89 c9             	mov    %r9,%rcx
    4583:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    4588:	f2 ae                	repnz scas %es:(%rdi),%al
    458a:	48 89 ca             	mov    %rcx,%rdx
    458d:	48 f7 d2             	not    %rdx
    4590:	4c 89 c9             	mov    %r9,%rcx
    4593:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    4598:	f2 ae                	repnz scas %es:(%rdi),%al
    459a:	4c 29 c2             	sub    %r8,%rdx
    459d:	48 29 ca             	sub    %rcx,%rdx
    45a0:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
    45a5:	48 8d 44 02 7b       	lea    0x7b(%rdx,%rax,1),%rax
    45aa:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
    45b0:	0f 87 66 01 00 00    	ja     471c <submitr+0x2b9>
    45b6:	48 8d 94 24 50 40 00 	lea    0x4050(%rsp),%rdx
    45bd:	00 
    45be:	b9 00 04 00 00       	mov    $0x400,%ecx
    45c3:	b8 00 00 00 00       	mov    $0x0,%eax
    45c8:	48 89 d7             	mov    %rdx,%rdi
    45cb:	f3 48 ab             	rep stos %rax,%es:(%rdi)
    45ce:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    45d5:	48 89 df             	mov    %rbx,%rdi
    45d8:	f2 ae                	repnz scas %es:(%rdi),%al
    45da:	48 f7 d1             	not    %rcx
    45dd:	48 8d 41 ff          	lea    -0x1(%rcx),%rax
    45e1:	83 f9 01             	cmp    $0x1,%ecx
    45e4:	0f 84 84 06 00 00    	je     4c6e <submitr+0x80b>
    45ea:	8d 40 ff             	lea    -0x1(%rax),%eax
    45ed:	4c 8d 74 03 01       	lea    0x1(%rbx,%rax,1),%r14
    45f2:	48 89 d5             	mov    %rdx,%rbp
    45f5:	49 bd d9 ff 00 00 00 	movabs $0x2000000000ffd9,%r13
    45fc:	00 20 00 
    45ff:	e9 a6 01 00 00       	jmpq   47aa <submitr+0x347>
    4604:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    460b:	3a 20 43 
    460e:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    4615:	20 75 6e 
    4618:	49 89 07             	mov    %rax,(%r15)
    461b:	49 89 57 08          	mov    %rdx,0x8(%r15)
    461f:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    4626:	74 6f 20 
    4629:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    4630:	65 20 73 
    4633:	49 89 47 10          	mov    %rax,0x10(%r15)
    4637:	49 89 57 18          	mov    %rdx,0x18(%r15)
    463b:	41 c7 47 20 6f 63 6b 	movl   $0x656b636f,0x20(%r15)
    4642:	65 
    4643:	66 41 c7 47 24 74 00 	movw   $0x74,0x24(%r15)
    464a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    464f:	e9 92 04 00 00       	jmpq   4ae6 <submitr+0x683>
    4654:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    465b:	3a 20 44 
    465e:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    4665:	20 75 6e 
    4668:	49 89 07             	mov    %rax,(%r15)
    466b:	49 89 57 08          	mov    %rdx,0x8(%r15)
    466f:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    4676:	74 6f 20 
    4679:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    4680:	76 65 20 
    4683:	49 89 47 10          	mov    %rax,0x10(%r15)
    4687:	49 89 57 18          	mov    %rdx,0x18(%r15)
    468b:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    4692:	72 20 61 
    4695:	49 89 47 20          	mov    %rax,0x20(%r15)
    4699:	41 c7 47 28 64 64 72 	movl   $0x65726464,0x28(%r15)
    46a0:	65 
    46a1:	66 41 c7 47 2c 73 73 	movw   $0x7373,0x2c(%r15)
    46a8:	41 c6 47 2e 00       	movb   $0x0,0x2e(%r15)
    46ad:	44 89 e7             	mov    %r12d,%edi
    46b0:	e8 db eb ff ff       	callq  3290 <close@plt>
    46b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    46ba:	e9 27 04 00 00       	jmpq   4ae6 <submitr+0x683>
    46bf:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
    46c6:	3a 20 55 
    46c9:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
    46d0:	20 74 6f 
    46d3:	49 89 07             	mov    %rax,(%r15)
    46d6:	49 89 57 08          	mov    %rdx,0x8(%r15)
    46da:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
    46e1:	65 63 74 
    46e4:	48 ba 20 74 6f 20 74 	movabs $0x20656874206f7420,%rdx
    46eb:	68 65 20 
    46ee:	49 89 47 10          	mov    %rax,0x10(%r15)
    46f2:	49 89 57 18          	mov    %rdx,0x18(%r15)
    46f6:	41 c7 47 20 73 65 72 	movl   $0x76726573,0x20(%r15)
    46fd:	76 
    46fe:	66 41 c7 47 24 65 72 	movw   $0x7265,0x24(%r15)
    4705:	41 c6 47 26 00       	movb   $0x0,0x26(%r15)
    470a:	44 89 e7             	mov    %r12d,%edi
    470d:	e8 7e eb ff ff       	callq  3290 <close@plt>
    4712:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4717:	e9 ca 03 00 00       	jmpq   4ae6 <submitr+0x683>
    471c:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    4723:	3a 20 52 
    4726:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    472d:	20 73 74 
    4730:	49 89 07             	mov    %rax,(%r15)
    4733:	49 89 57 08          	mov    %rdx,0x8(%r15)
    4737:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
    473e:	74 6f 6f 
    4741:	48 ba 20 6c 61 72 67 	movabs $0x202e656772616c20,%rdx
    4748:	65 2e 20 
    474b:	49 89 47 10          	mov    %rax,0x10(%r15)
    474f:	49 89 57 18          	mov    %rdx,0x18(%r15)
    4753:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
    475a:	61 73 65 
    475d:	48 ba 20 53 55 42 4d 	movabs $0x5254494d42555320,%rdx
    4764:	49 54 52 
    4767:	49 89 47 20          	mov    %rax,0x20(%r15)
    476b:	49 89 57 28          	mov    %rdx,0x28(%r15)
    476f:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
    4776:	55 46 00 
    4779:	49 89 47 30          	mov    %rax,0x30(%r15)
    477d:	44 89 e7             	mov    %r12d,%edi
    4780:	e8 0b eb ff ff       	callq  3290 <close@plt>
    4785:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    478a:	e9 57 03 00 00       	jmpq   4ae6 <submitr+0x683>
    478f:	49 0f a3 c5          	bt     %rax,%r13
    4793:	73 21                	jae    47b6 <submitr+0x353>
    4795:	44 88 45 00          	mov    %r8b,0x0(%rbp)
    4799:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    479d:	48 83 c3 01          	add    $0x1,%rbx
    47a1:	4c 39 f3             	cmp    %r14,%rbx
    47a4:	0f 84 c4 04 00 00    	je     4c6e <submitr+0x80b>
    47aa:	44 0f b6 03          	movzbl (%rbx),%r8d
    47ae:	41 8d 40 d6          	lea    -0x2a(%r8),%eax
    47b2:	3c 35                	cmp    $0x35,%al
    47b4:	76 d9                	jbe    478f <submitr+0x32c>
    47b6:	44 89 c0             	mov    %r8d,%eax
    47b9:	83 e0 df             	and    $0xffffffdf,%eax
    47bc:	83 e8 41             	sub    $0x41,%eax
    47bf:	3c 19                	cmp    $0x19,%al
    47c1:	76 d2                	jbe    4795 <submitr+0x332>
    47c3:	41 80 f8 20          	cmp    $0x20,%r8b
    47c7:	74 63                	je     482c <submitr+0x3c9>
    47c9:	41 8d 40 e0          	lea    -0x20(%r8),%eax
    47cd:	3c 5f                	cmp    $0x5f,%al
    47cf:	76 0a                	jbe    47db <submitr+0x378>
    47d1:	41 80 f8 09          	cmp    $0x9,%r8b
    47d5:	0f 85 06 04 00 00    	jne    4be1 <submitr+0x77e>
    47db:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
    47e2:	00 
    47e3:	45 0f b6 c0          	movzbl %r8b,%r8d
    47e7:	48 8d 0d 80 29 00 00 	lea    0x2980(%rip),%rcx        # 716e <array.3484+0xf8e>
    47ee:	ba 08 00 00 00       	mov    $0x8,%edx
    47f3:	be 01 00 00 00       	mov    $0x1,%esi
    47f8:	b8 00 00 00 00       	mov    $0x0,%eax
    47fd:	e8 9e eb ff ff       	callq  33a0 <__sprintf_chk@plt>
    4802:	0f b6 84 24 50 80 00 	movzbl 0x8050(%rsp),%eax
    4809:	00 
    480a:	88 45 00             	mov    %al,0x0(%rbp)
    480d:	0f b6 84 24 51 80 00 	movzbl 0x8051(%rsp),%eax
    4814:	00 
    4815:	88 45 01             	mov    %al,0x1(%rbp)
    4818:	0f b6 84 24 52 80 00 	movzbl 0x8052(%rsp),%eax
    481f:	00 
    4820:	88 45 02             	mov    %al,0x2(%rbp)
    4823:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
    4827:	e9 71 ff ff ff       	jmpq   479d <submitr+0x33a>
    482c:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
    4830:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    4834:	e9 64 ff ff ff       	jmpq   479d <submitr+0x33a>
    4839:	48 b8 45 72 72 6f 72 	movabs $0x47203a726f727245,%rax
    4840:	3a 20 47 
    4843:	48 ba 45 54 20 72 65 	movabs $0x6575716572205445,%rdx
    484a:	71 75 65 
    484d:	49 89 07             	mov    %rax,(%r15)
    4850:	49 89 57 08          	mov    %rdx,0x8(%r15)
    4854:	48 b8 73 74 20 65 78 	movabs $0x6565637865207473,%rax
    485b:	63 65 65 
    485e:	48 ba 64 73 20 62 75 	movabs $0x6566667562207364,%rdx
    4865:	66 66 65 
    4868:	49 89 47 10          	mov    %rax,0x10(%r15)
    486c:	49 89 57 18          	mov    %rdx,0x18(%r15)
    4870:	41 c7 47 20 72 20 73 	movl   $0x69732072,0x20(%r15)
    4877:	69 
    4878:	66 41 c7 47 24 7a 65 	movw   $0x657a,0x24(%r15)
    487f:	41 c6 47 26 00       	movb   $0x0,0x26(%r15)
    4884:	44 89 e7             	mov    %r12d,%edi
    4887:	e8 04 ea ff ff       	callq  3290 <close@plt>
    488c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4891:	e9 50 02 00 00       	jmpq   4ae6 <submitr+0x683>
    4896:	48 01 c5             	add    %rax,%rbp
    4899:	48 29 c3             	sub    %rax,%rbx
    489c:	74 26                	je     48c4 <submitr+0x461>
    489e:	48 89 da             	mov    %rbx,%rdx
    48a1:	48 89 ee             	mov    %rbp,%rsi
    48a4:	44 89 e7             	mov    %r12d,%edi
    48a7:	e8 b4 e9 ff ff       	callq  3260 <write@plt>
    48ac:	48 85 c0             	test   %rax,%rax
    48af:	7f e5                	jg     4896 <submitr+0x433>
    48b1:	e8 7a e9 ff ff       	callq  3230 <__errno_location@plt>
    48b6:	83 38 04             	cmpl   $0x4,(%rax)
    48b9:	0f 85 c3 02 00 00    	jne    4b82 <submitr+0x71f>
    48bf:	4c 89 e8             	mov    %r13,%rax
    48c2:	eb d2                	jmp    4896 <submitr+0x433>
    48c4:	44 89 64 24 40       	mov    %r12d,0x40(%rsp)
    48c9:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%rsp)
    48d0:	00 
    48d1:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    48d6:	48 8d 44 24 50       	lea    0x50(%rsp),%rax
    48db:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
    48e0:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    48e7:	00 
    48e8:	ba 00 20 00 00       	mov    $0x2000,%edx
    48ed:	e8 a8 fa ff ff       	callq  439a <rio_readlineb>
    48f2:	48 85 c0             	test   %rax,%rax
    48f5:	0f 8e ec 00 00 00    	jle    49e7 <submitr+0x584>
    48fb:	48 8d 4c 24 2c       	lea    0x2c(%rsp),%rcx
    4900:	48 8d 94 24 50 60 00 	lea    0x6050(%rsp),%rdx
    4907:	00 
    4908:	48 8d bc 24 50 20 00 	lea    0x2050(%rsp),%rdi
    490f:	00 
    4910:	4c 8d 84 24 50 80 00 	lea    0x8050(%rsp),%r8
    4917:	00 
    4918:	48 8d 35 56 28 00 00 	lea    0x2856(%rip),%rsi        # 7175 <array.3484+0xf95>
    491f:	b8 00 00 00 00       	mov    $0x0,%eax
    4924:	e8 e7 e9 ff ff       	callq  3310 <__isoc99_sscanf@plt>
    4929:	44 8b 44 24 2c       	mov    0x2c(%rsp),%r8d
    492e:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
    4935:	0f 85 20 01 00 00    	jne    4a5b <submitr+0x5f8>
    493b:	48 8d 1d 44 28 00 00 	lea    0x2844(%rip),%rbx        # 7186 <array.3484+0xfa6>
    4942:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    4949:	00 
    494a:	b9 03 00 00 00       	mov    $0x3,%ecx
    494f:	48 89 df             	mov    %rbx,%rdi
    4952:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    4954:	0f 97 c0             	seta   %al
    4957:	1c 00                	sbb    $0x0,%al
    4959:	84 c0                	test   %al,%al
    495b:	0f 84 31 01 00 00    	je     4a92 <submitr+0x62f>
    4961:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    4968:	00 
    4969:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    496e:	ba 00 20 00 00       	mov    $0x2000,%edx
    4973:	e8 22 fa ff ff       	callq  439a <rio_readlineb>
    4978:	48 85 c0             	test   %rax,%rax
    497b:	7f c5                	jg     4942 <submitr+0x4df>
    497d:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    4984:	3a 20 43 
    4987:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    498e:	20 75 6e 
    4991:	49 89 07             	mov    %rax,(%r15)
    4994:	49 89 57 08          	mov    %rdx,0x8(%r15)
    4998:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    499f:	74 6f 20 
    49a2:	48 ba 72 65 61 64 20 	movabs $0x6165682064616572,%rdx
    49a9:	68 65 61 
    49ac:	49 89 47 10          	mov    %rax,0x10(%r15)
    49b0:	49 89 57 18          	mov    %rdx,0x18(%r15)
    49b4:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
    49bb:	66 72 6f 
    49be:	48 ba 6d 20 73 65 72 	movabs $0x726576726573206d,%rdx
    49c5:	76 65 72 
    49c8:	49 89 47 20          	mov    %rax,0x20(%r15)
    49cc:	49 89 57 28          	mov    %rdx,0x28(%r15)
    49d0:	41 c6 47 30 00       	movb   $0x0,0x30(%r15)
    49d5:	44 89 e7             	mov    %r12d,%edi
    49d8:	e8 b3 e8 ff ff       	callq  3290 <close@plt>
    49dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    49e2:	e9 ff 00 00 00       	jmpq   4ae6 <submitr+0x683>
    49e7:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    49ee:	3a 20 43 
    49f1:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    49f8:	20 75 6e 
    49fb:	49 89 07             	mov    %rax,(%r15)
    49fe:	49 89 57 08          	mov    %rdx,0x8(%r15)
    4a02:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    4a09:	74 6f 20 
    4a0c:	48 ba 72 65 61 64 20 	movabs $0x7269662064616572,%rdx
    4a13:	66 69 72 
    4a16:	49 89 47 10          	mov    %rax,0x10(%r15)
    4a1a:	49 89 57 18          	mov    %rdx,0x18(%r15)
    4a1e:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
    4a25:	61 64 65 
    4a28:	48 ba 72 20 66 72 6f 	movabs $0x73206d6f72662072,%rdx
    4a2f:	6d 20 73 
    4a32:	49 89 47 20          	mov    %rax,0x20(%r15)
    4a36:	49 89 57 28          	mov    %rdx,0x28(%r15)
    4a3a:	41 c7 47 30 65 72 76 	movl   $0x65767265,0x30(%r15)
    4a41:	65 
    4a42:	66 41 c7 47 34 72 00 	movw   $0x72,0x34(%r15)
    4a49:	44 89 e7             	mov    %r12d,%edi
    4a4c:	e8 3f e8 ff ff       	callq  3290 <close@plt>
    4a51:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4a56:	e9 8b 00 00 00       	jmpq   4ae6 <submitr+0x683>
    4a5b:	4c 8d 8c 24 50 80 00 	lea    0x8050(%rsp),%r9
    4a62:	00 
    4a63:	48 8d 0d 56 26 00 00 	lea    0x2656(%rip),%rcx        # 70c0 <array.3484+0xee0>
    4a6a:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    4a71:	be 01 00 00 00       	mov    $0x1,%esi
    4a76:	4c 89 ff             	mov    %r15,%rdi
    4a79:	b8 00 00 00 00       	mov    $0x0,%eax
    4a7e:	e8 1d e9 ff ff       	callq  33a0 <__sprintf_chk@plt>
    4a83:	44 89 e7             	mov    %r12d,%edi
    4a86:	e8 05 e8 ff ff       	callq  3290 <close@plt>
    4a8b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4a90:	eb 54                	jmp    4ae6 <submitr+0x683>
    4a92:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    4a99:	00 
    4a9a:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
    4a9f:	ba 00 20 00 00       	mov    $0x2000,%edx
    4aa4:	e8 f1 f8 ff ff       	callq  439a <rio_readlineb>
    4aa9:	48 85 c0             	test   %rax,%rax
    4aac:	7e 61                	jle    4b0f <submitr+0x6ac>
    4aae:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
    4ab5:	00 
    4ab6:	4c 89 ff             	mov    %r15,%rdi
    4ab9:	e8 82 e7 ff ff       	callq  3240 <strcpy@plt>
    4abe:	44 89 e7             	mov    %r12d,%edi
    4ac1:	e8 ca e7 ff ff       	callq  3290 <close@plt>
    4ac6:	b9 03 00 00 00       	mov    $0x3,%ecx
    4acb:	48 8d 3d b7 26 00 00 	lea    0x26b7(%rip),%rdi        # 7189 <array.3484+0xfa9>
    4ad2:	4c 89 fe             	mov    %r15,%rsi
    4ad5:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    4ad7:	0f 97 c0             	seta   %al
    4ada:	1c 00                	sbb    $0x0,%al
    4adc:	84 c0                	test   %al,%al
    4ade:	0f 95 c0             	setne  %al
    4ae1:	0f b6 c0             	movzbl %al,%eax
    4ae4:	f7 d8                	neg    %eax
    4ae6:	48 8b 94 24 58 a0 00 	mov    0xa058(%rsp),%rdx
    4aed:	00 
    4aee:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
    4af5:	00 00 
    4af7:	0f 85 fb 01 00 00    	jne    4cf8 <submitr+0x895>
    4afd:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
    4b04:	5b                   	pop    %rbx
    4b05:	5d                   	pop    %rbp
    4b06:	41 5c                	pop    %r12
    4b08:	41 5d                	pop    %r13
    4b0a:	41 5e                	pop    %r14
    4b0c:	41 5f                	pop    %r15
    4b0e:	c3                   	retq   
    4b0f:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    4b16:	3a 20 43 
    4b19:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    4b20:	20 75 6e 
    4b23:	49 89 07             	mov    %rax,(%r15)
    4b26:	49 89 57 08          	mov    %rdx,0x8(%r15)
    4b2a:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    4b31:	74 6f 20 
    4b34:	48 ba 72 65 61 64 20 	movabs $0x6174732064616572,%rdx
    4b3b:	73 74 61 
    4b3e:	49 89 47 10          	mov    %rax,0x10(%r15)
    4b42:	49 89 57 18          	mov    %rdx,0x18(%r15)
    4b46:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
    4b4d:	65 73 73 
    4b50:	48 ba 61 67 65 20 66 	movabs $0x6d6f726620656761,%rdx
    4b57:	72 6f 6d 
    4b5a:	49 89 47 20          	mov    %rax,0x20(%r15)
    4b5e:	49 89 57 28          	mov    %rdx,0x28(%r15)
    4b62:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
    4b69:	65 72 00 
    4b6c:	49 89 47 30          	mov    %rax,0x30(%r15)
    4b70:	44 89 e7             	mov    %r12d,%edi
    4b73:	e8 18 e7 ff ff       	callq  3290 <close@plt>
    4b78:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4b7d:	e9 64 ff ff ff       	jmpq   4ae6 <submitr+0x683>
    4b82:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    4b89:	3a 20 43 
    4b8c:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    4b93:	20 75 6e 
    4b96:	49 89 07             	mov    %rax,(%r15)
    4b99:	49 89 57 08          	mov    %rdx,0x8(%r15)
    4b9d:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    4ba4:	74 6f 20 
    4ba7:	48 ba 77 72 69 74 65 	movabs $0x6f74206574697277,%rdx
    4bae:	20 74 6f 
    4bb1:	49 89 47 10          	mov    %rax,0x10(%r15)
    4bb5:	49 89 57 18          	mov    %rdx,0x18(%r15)
    4bb9:	48 b8 20 74 68 65 20 	movabs $0x7265732065687420,%rax
    4bc0:	73 65 72 
    4bc3:	49 89 47 20          	mov    %rax,0x20(%r15)
    4bc7:	41 c7 47 28 76 65 72 	movl   $0x726576,0x28(%r15)
    4bce:	00 
    4bcf:	44 89 e7             	mov    %r12d,%edi
    4bd2:	e8 b9 e6 ff ff       	callq  3290 <close@plt>
    4bd7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4bdc:	e9 05 ff ff ff       	jmpq   4ae6 <submitr+0x683>
    4be1:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    4be8:	3a 20 52 
    4beb:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    4bf2:	20 73 74 
    4bf5:	49 89 07             	mov    %rax,(%r15)
    4bf8:	49 89 57 08          	mov    %rdx,0x8(%r15)
    4bfc:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
    4c03:	63 6f 6e 
    4c06:	48 ba 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rdx
    4c0d:	20 61 6e 
    4c10:	49 89 47 10          	mov    %rax,0x10(%r15)
    4c14:	49 89 57 18          	mov    %rdx,0x18(%r15)
    4c18:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
    4c1f:	67 61 6c 
    4c22:	48 ba 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rdx
    4c29:	6e 70 72 
    4c2c:	49 89 47 20          	mov    %rax,0x20(%r15)
    4c30:	49 89 57 28          	mov    %rdx,0x28(%r15)
    4c34:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
    4c3b:	6c 65 20 
    4c3e:	48 ba 63 68 61 72 61 	movabs $0x6574636172616863,%rdx
    4c45:	63 74 65 
    4c48:	49 89 47 30          	mov    %rax,0x30(%r15)
    4c4c:	49 89 57 38          	mov    %rdx,0x38(%r15)
    4c50:	66 41 c7 47 40 72 2e 	movw   $0x2e72,0x40(%r15)
    4c57:	41 c6 47 42 00       	movb   $0x0,0x42(%r15)
    4c5c:	44 89 e7             	mov    %r12d,%edi
    4c5f:	e8 2c e6 ff ff       	callq  3290 <close@plt>
    4c64:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4c69:	e9 78 fe ff ff       	jmpq   4ae6 <submitr+0x683>
    4c6e:	48 8d bc 24 50 20 00 	lea    0x2050(%rsp),%rdi
    4c75:	00 
    4c76:	48 8d 84 24 50 40 00 	lea    0x4050(%rsp),%rax
    4c7d:	00 
    4c7e:	50                   	push   %rax
    4c7f:	ff 74 24 18          	pushq  0x18(%rsp)
    4c83:	ff 74 24 28          	pushq  0x28(%rsp)
    4c87:	ff 74 24 20          	pushq  0x20(%rsp)
    4c8b:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
    4c90:	4c 8d 05 59 24 00 00 	lea    0x2459(%rip),%r8        # 70f0 <array.3484+0xf10>
    4c97:	b9 00 20 00 00       	mov    $0x2000,%ecx
    4c9c:	ba 01 00 00 00       	mov    $0x1,%edx
    4ca1:	be 00 20 00 00       	mov    $0x2000,%esi
    4ca6:	b8 00 00 00 00       	mov    $0x0,%eax
    4cab:	e8 60 e5 ff ff       	callq  3210 <__snprintf_chk@plt>
    4cb0:	48 83 c4 20          	add    $0x20,%rsp
    4cb4:	3d ff 1f 00 00       	cmp    $0x1fff,%eax
    4cb9:	0f 8f 7a fb ff ff    	jg     4839 <submitr+0x3d6>
    4cbf:	48 8d bc 24 50 20 00 	lea    0x2050(%rsp),%rdi
    4cc6:	00 
    4cc7:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    4cce:	b8 00 00 00 00       	mov    $0x0,%eax
    4cd3:	f2 ae                	repnz scas %es:(%rdi),%al
    4cd5:	48 f7 d1             	not    %rcx
    4cd8:	48 89 cb             	mov    %rcx,%rbx
    4cdb:	48 83 eb 01          	sub    $0x1,%rbx
    4cdf:	0f 84 df fb ff ff    	je     48c4 <submitr+0x461>
    4ce5:	48 8d ac 24 50 20 00 	lea    0x2050(%rsp),%rbp
    4cec:	00 
    4ced:	41 bd 00 00 00 00    	mov    $0x0,%r13d
    4cf3:	e9 a6 fb ff ff       	jmpq   489e <submitr+0x43b>
    4cf8:	e8 73 e5 ff ff       	callq  3270 <__stack_chk_fail@plt>

0000000000004cfd <init_timeout>:
    4cfd:	f3 0f 1e fa          	endbr64 
    4d01:	85 ff                	test   %edi,%edi
    4d03:	75 01                	jne    4d06 <init_timeout+0x9>
    4d05:	c3                   	retq   
    4d06:	53                   	push   %rbx
    4d07:	89 fb                	mov    %edi,%ebx
    4d09:	48 8d 35 54 f6 ff ff 	lea    -0x9ac(%rip),%rsi        # 4364 <sigalrm_handler>
    4d10:	bf 0e 00 00 00       	mov    $0xe,%edi
    4d15:	e8 a6 e5 ff ff       	callq  32c0 <signal@plt>
    4d1a:	85 db                	test   %ebx,%ebx
    4d1c:	bf 00 00 00 00       	mov    $0x0,%edi
    4d21:	0f 49 fb             	cmovns %ebx,%edi
    4d24:	e8 57 e5 ff ff       	callq  3280 <alarm@plt>
    4d29:	5b                   	pop    %rbx
    4d2a:	c3                   	retq   

0000000000004d2b <init_driver>:
    4d2b:	f3 0f 1e fa          	endbr64 
    4d2f:	41 54                	push   %r12
    4d31:	55                   	push   %rbp
    4d32:	53                   	push   %rbx
    4d33:	48 83 ec 20          	sub    $0x20,%rsp
    4d37:	48 89 fd             	mov    %rdi,%rbp
    4d3a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    4d41:	00 00 
    4d43:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    4d48:	31 c0                	xor    %eax,%eax
    4d4a:	be 01 00 00 00       	mov    $0x1,%esi
    4d4f:	bf 0d 00 00 00       	mov    $0xd,%edi
    4d54:	e8 67 e5 ff ff       	callq  32c0 <signal@plt>
    4d59:	be 01 00 00 00       	mov    $0x1,%esi
    4d5e:	bf 1d 00 00 00       	mov    $0x1d,%edi
    4d63:	e8 58 e5 ff ff       	callq  32c0 <signal@plt>
    4d68:	be 01 00 00 00       	mov    $0x1,%esi
    4d6d:	bf 1d 00 00 00       	mov    $0x1d,%edi
    4d72:	e8 49 e5 ff ff       	callq  32c0 <signal@plt>
    4d77:	ba 00 00 00 00       	mov    $0x0,%edx
    4d7c:	be 01 00 00 00       	mov    $0x1,%esi
    4d81:	bf 02 00 00 00       	mov    $0x2,%edi
    4d86:	e8 25 e6 ff ff       	callq  33b0 <socket@plt>
    4d8b:	85 c0                	test   %eax,%eax
    4d8d:	0f 88 9c 00 00 00    	js     4e2f <init_driver+0x104>
    4d93:	89 c3                	mov    %eax,%ebx
    4d95:	48 8d 3d f0 23 00 00 	lea    0x23f0(%rip),%rdi        # 718c <array.3484+0xfac>
    4d9c:	e8 2f e5 ff ff       	callq  32d0 <gethostbyname@plt>
    4da1:	48 85 c0             	test   %rax,%rax
    4da4:	0f 84 d1 00 00 00    	je     4e7b <init_driver+0x150>
    4daa:	49 89 e4             	mov    %rsp,%r12
    4dad:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
    4db4:	00 
    4db5:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    4dbc:	00 00 
    4dbe:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
    4dc4:	48 63 50 14          	movslq 0x14(%rax),%rdx
    4dc8:	48 8b 40 18          	mov    0x18(%rax),%rax
    4dcc:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
    4dd1:	b9 0c 00 00 00       	mov    $0xc,%ecx
    4dd6:	48 8b 30             	mov    (%rax),%rsi
    4dd9:	e8 02 e5 ff ff       	callq  32e0 <__memmove_chk@plt>
    4dde:	66 c7 44 24 02 3b 6e 	movw   $0x6e3b,0x2(%rsp)
    4de5:	ba 10 00 00 00       	mov    $0x10,%edx
    4dea:	4c 89 e6             	mov    %r12,%rsi
    4ded:	89 df                	mov    %ebx,%edi
    4def:	e8 6c e5 ff ff       	callq  3360 <connect@plt>
    4df4:	85 c0                	test   %eax,%eax
    4df6:	0f 88 e7 00 00 00    	js     4ee3 <init_driver+0x1b8>
    4dfc:	89 df                	mov    %ebx,%edi
    4dfe:	e8 8d e4 ff ff       	callq  3290 <close@plt>
    4e03:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
    4e09:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
    4e0d:	b8 00 00 00 00       	mov    $0x0,%eax
    4e12:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    4e17:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    4e1e:	00 00 
    4e20:	0f 85 f5 00 00 00    	jne    4f1b <init_driver+0x1f0>
    4e26:	48 83 c4 20          	add    $0x20,%rsp
    4e2a:	5b                   	pop    %rbx
    4e2b:	5d                   	pop    %rbp
    4e2c:	41 5c                	pop    %r12
    4e2e:	c3                   	retq   
    4e2f:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    4e36:	3a 20 43 
    4e39:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    4e40:	20 75 6e 
    4e43:	48 89 45 00          	mov    %rax,0x0(%rbp)
    4e47:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    4e4b:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    4e52:	74 6f 20 
    4e55:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    4e5c:	65 20 73 
    4e5f:	48 89 45 10          	mov    %rax,0x10(%rbp)
    4e63:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    4e67:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
    4e6e:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
    4e74:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4e79:	eb 97                	jmp    4e12 <init_driver+0xe7>
    4e7b:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    4e82:	3a 20 44 
    4e85:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    4e8c:	20 75 6e 
    4e8f:	48 89 45 00          	mov    %rax,0x0(%rbp)
    4e93:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    4e97:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    4e9e:	74 6f 20 
    4ea1:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    4ea8:	76 65 20 
    4eab:	48 89 45 10          	mov    %rax,0x10(%rbp)
    4eaf:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    4eb3:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    4eba:	72 20 61 
    4ebd:	48 89 45 20          	mov    %rax,0x20(%rbp)
    4ec1:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
    4ec8:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
    4ece:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
    4ed2:	89 df                	mov    %ebx,%edi
    4ed4:	e8 b7 e3 ff ff       	callq  3290 <close@plt>
    4ed9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4ede:	e9 2f ff ff ff       	jmpq   4e12 <init_driver+0xe7>
    4ee3:	4c 8d 05 a2 22 00 00 	lea    0x22a2(%rip),%r8        # 718c <array.3484+0xfac>
    4eea:	48 8d 0d 57 22 00 00 	lea    0x2257(%rip),%rcx        # 7148 <array.3484+0xf68>
    4ef1:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
    4ef8:	be 01 00 00 00       	mov    $0x1,%esi
    4efd:	48 89 ef             	mov    %rbp,%rdi
    4f00:	b8 00 00 00 00       	mov    $0x0,%eax
    4f05:	e8 96 e4 ff ff       	callq  33a0 <__sprintf_chk@plt>
    4f0a:	89 df                	mov    %ebx,%edi
    4f0c:	e8 7f e3 ff ff       	callq  3290 <close@plt>
    4f11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4f16:	e9 f7 fe ff ff       	jmpq   4e12 <init_driver+0xe7>
    4f1b:	e8 50 e3 ff ff       	callq  3270 <__stack_chk_fail@plt>

0000000000004f20 <driver_post>:
    4f20:	f3 0f 1e fa          	endbr64 
    4f24:	53                   	push   %rbx
    4f25:	4c 89 c3             	mov    %r8,%rbx
    4f28:	85 c9                	test   %ecx,%ecx
    4f2a:	75 17                	jne    4f43 <driver_post+0x23>
    4f2c:	48 85 ff             	test   %rdi,%rdi
    4f2f:	74 05                	je     4f36 <driver_post+0x16>
    4f31:	80 3f 00             	cmpb   $0x0,(%rdi)
    4f34:	75 33                	jne    4f69 <driver_post+0x49>
    4f36:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    4f3b:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    4f3f:	89 c8                	mov    %ecx,%eax
    4f41:	5b                   	pop    %rbx
    4f42:	c3                   	retq   
    4f43:	48 8d 35 5d 22 00 00 	lea    0x225d(%rip),%rsi        # 71a7 <array.3484+0xfc7>
    4f4a:	bf 01 00 00 00       	mov    $0x1,%edi
    4f4f:	b8 00 00 00 00       	mov    $0x0,%eax
    4f54:	e8 c7 e3 ff ff       	callq  3320 <__printf_chk@plt>
    4f59:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    4f5e:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    4f62:	b8 00 00 00 00       	mov    $0x0,%eax
    4f67:	eb d8                	jmp    4f41 <driver_post+0x21>
    4f69:	41 50                	push   %r8
    4f6b:	52                   	push   %rdx
    4f6c:	4c 8d 0d 4b 22 00 00 	lea    0x224b(%rip),%r9        # 71be <array.3484+0xfde>
    4f73:	49 89 f0             	mov    %rsi,%r8
    4f76:	48 89 f9             	mov    %rdi,%rcx
    4f79:	48 8d 15 42 22 00 00 	lea    0x2242(%rip),%rdx        # 71c2 <array.3484+0xfe2>
    4f80:	be 6e 3b 00 00       	mov    $0x3b6e,%esi
    4f85:	48 8d 3d 00 22 00 00 	lea    0x2200(%rip),%rdi        # 718c <array.3484+0xfac>
    4f8c:	e8 d2 f4 ff ff       	callq  4463 <submitr>
    4f91:	48 83 c4 10          	add    $0x10,%rsp
    4f95:	eb aa                	jmp    4f41 <driver_post+0x21>
    4f97:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    4f9e:	00 00 

0000000000004fa0 <__libc_csu_init>:
    4fa0:	f3 0f 1e fa          	endbr64 
    4fa4:	41 57                	push   %r15
    4fa6:	4c 8d 3d 33 3d 00 00 	lea    0x3d33(%rip),%r15        # 8ce0 <__frame_dummy_init_array_entry>
    4fad:	41 56                	push   %r14
    4faf:	49 89 d6             	mov    %rdx,%r14
    4fb2:	41 55                	push   %r13
    4fb4:	49 89 f5             	mov    %rsi,%r13
    4fb7:	41 54                	push   %r12
    4fb9:	41 89 fc             	mov    %edi,%r12d
    4fbc:	55                   	push   %rbp
    4fbd:	48 8d 2d 24 3d 00 00 	lea    0x3d24(%rip),%rbp        # 8ce8 <__do_global_dtors_aux_fini_array_entry>
    4fc4:	53                   	push   %rbx
    4fc5:	4c 29 fd             	sub    %r15,%rbp
    4fc8:	48 83 ec 08          	sub    $0x8,%rsp
    4fcc:	e8 2f e0 ff ff       	callq  3000 <_init>
    4fd1:	48 c1 fd 03          	sar    $0x3,%rbp
    4fd5:	74 1f                	je     4ff6 <__libc_csu_init+0x56>
    4fd7:	31 db                	xor    %ebx,%ebx
    4fd9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    4fe0:	4c 89 f2             	mov    %r14,%rdx
    4fe3:	4c 89 ee             	mov    %r13,%rsi
    4fe6:	44 89 e7             	mov    %r12d,%edi
    4fe9:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    4fed:	48 83 c3 01          	add    $0x1,%rbx
    4ff1:	48 39 dd             	cmp    %rbx,%rbp
    4ff4:	75 ea                	jne    4fe0 <__libc_csu_init+0x40>
    4ff6:	48 83 c4 08          	add    $0x8,%rsp
    4ffa:	5b                   	pop    %rbx
    4ffb:	5d                   	pop    %rbp
    4ffc:	41 5c                	pop    %r12
    4ffe:	41 5d                	pop    %r13
    5000:	41 5e                	pop    %r14
    5002:	41 5f                	pop    %r15
    5004:	c3                   	retq   
    5005:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    500c:	00 00 00 00 

0000000000005010 <__libc_csu_fini>:
    5010:	f3 0f 1e fa          	endbr64 
    5014:	c3                   	retq   

Disassembly of section .fini:

0000000000005018 <_fini>:
    5018:	f3 0f 1e fa          	endbr64 
    501c:	48 83 ec 08          	sub    $0x8,%rsp
    5020:	48 83 c4 08          	add    $0x8,%rsp
    5024:	c3                   	retq   


bufbomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	f3 0f 1e fa          	endbr64
  401004:	48 83 ec 08          	sub    $0x8,%rsp
  401008:	48 8b 05 e9 3f 00 00 	mov    0x3fe9(%rip),%rax        # 404ff8 <__gmon_start__@Base>
  40100f:	48 85 c0             	test   %rax,%rax
  401012:	74 02                	je     401016 <_init+0x16>
  401014:	ff d0                	call   *%rax
  401016:	48 83 c4 08          	add    $0x8,%rsp
  40101a:	c3                   	ret

Disassembly of section .plt:

0000000000401020 <strcasecmp@plt-0x10>:
  401020:	ff 35 e2 3f 00 00    	push   0x3fe2(%rip)        # 405008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	ff 25 e4 3f 00 00    	jmp    *0x3fe4(%rip)        # 405010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401030 <strcasecmp@plt>:
  401030:	ff 25 e2 3f 00 00    	jmp    *0x3fe2(%rip)        # 405018 <strcasecmp@GLIBC_2.2.5>
  401036:	68 00 00 00 00       	push   $0x0
  40103b:	e9 e0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401040 <__errno_location@plt>:
  401040:	ff 25 da 3f 00 00    	jmp    *0x3fda(%rip)        # 405020 <__errno_location@GLIBC_2.2.5>
  401046:	68 01 00 00 00       	push   $0x1
  40104b:	e9 d0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401050 <srandom@plt>:
  401050:	ff 25 d2 3f 00 00    	jmp    *0x3fd2(%rip)        # 405028 <srandom@GLIBC_2.2.5>
  401056:	68 02 00 00 00       	push   $0x2
  40105b:	e9 c0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401060 <strcpy@plt>:
  401060:	ff 25 ca 3f 00 00    	jmp    *0x3fca(%rip)        # 405030 <strcpy@GLIBC_2.2.5>
  401066:	68 03 00 00 00       	push   $0x3
  40106b:	e9 b0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401070 <puts@plt>:
  401070:	ff 25 c2 3f 00 00    	jmp    *0x3fc2(%rip)        # 405038 <puts@GLIBC_2.2.5>
  401076:	68 04 00 00 00       	push   $0x4
  40107b:	e9 a0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401080 <write@plt>:
  401080:	ff 25 ba 3f 00 00    	jmp    *0x3fba(%rip)        # 405040 <write@GLIBC_2.2.5>
  401086:	68 05 00 00 00       	push   $0x5
  40108b:	e9 90 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401090 <getpid@plt>:
  401090:	ff 25 b2 3f 00 00    	jmp    *0x3fb2(%rip)        # 405048 <getpid@GLIBC_2.2.5>
  401096:	68 06 00 00 00       	push   $0x6
  40109b:	e9 80 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010a0 <strlen@plt>:
  4010a0:	ff 25 aa 3f 00 00    	jmp    *0x3faa(%rip)        # 405050 <strlen@GLIBC_2.2.5>
  4010a6:	68 07 00 00 00       	push   $0x7
  4010ab:	e9 70 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010b0 <__stack_chk_fail@plt>:
  4010b0:	ff 25 a2 3f 00 00    	jmp    *0x3fa2(%rip)        # 405058 <__stack_chk_fail@GLIBC_2.4>
  4010b6:	68 08 00 00 00       	push   $0x8
  4010bb:	e9 60 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010c0 <mmap@plt>:
  4010c0:	ff 25 9a 3f 00 00    	jmp    *0x3f9a(%rip)        # 405060 <mmap@GLIBC_2.2.5>
  4010c6:	68 09 00 00 00       	push   $0x9
  4010cb:	e9 50 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010d0 <htons@plt>:
  4010d0:	ff 25 92 3f 00 00    	jmp    *0x3f92(%rip)        # 405068 <htons@GLIBC_2.2.5>
  4010d6:	68 0a 00 00 00       	push   $0xa
  4010db:	e9 40 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010e0 <printf@plt>:
  4010e0:	ff 25 8a 3f 00 00    	jmp    *0x3f8a(%rip)        # 405070 <printf@GLIBC_2.2.5>
  4010e6:	68 0b 00 00 00       	push   $0xb
  4010eb:	e9 30 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010f0 <memset@plt>:
  4010f0:	ff 25 82 3f 00 00    	jmp    *0x3f82(%rip)        # 405078 <memset@GLIBC_2.2.5>
  4010f6:	68 0c 00 00 00       	push   $0xc
  4010fb:	e9 20 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401100 <alarm@plt>:
  401100:	ff 25 7a 3f 00 00    	jmp    *0x3f7a(%rip)        # 405080 <alarm@GLIBC_2.2.5>
  401106:	68 0d 00 00 00       	push   $0xd
  40110b:	e9 10 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401110 <close@plt>:
  401110:	ff 25 72 3f 00 00    	jmp    *0x3f72(%rip)        # 405088 <close@GLIBC_2.2.5>
  401116:	68 0e 00 00 00       	push   $0xe
  40111b:	e9 00 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401120 <read@plt>:
  401120:	ff 25 6a 3f 00 00    	jmp    *0x3f6a(%rip)        # 405090 <read@GLIBC_2.2.5>
  401126:	68 0f 00 00 00       	push   $0xf
  40112b:	e9 f0 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401130 <srand@plt>:
  401130:	ff 25 62 3f 00 00    	jmp    *0x3f62(%rip)        # 405098 <srand@GLIBC_2.2.5>
  401136:	68 10 00 00 00       	push   $0x10
  40113b:	e9 e0 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401140 <calloc@plt>:
  401140:	ff 25 5a 3f 00 00    	jmp    *0x3f5a(%rip)        # 4050a0 <calloc@GLIBC_2.2.5>
  401146:	68 11 00 00 00       	push   $0x11
  40114b:	e9 d0 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401150 <strcmp@plt>:
  401150:	ff 25 52 3f 00 00    	jmp    *0x3f52(%rip)        # 4050a8 <strcmp@GLIBC_2.2.5>
  401156:	68 12 00 00 00       	push   $0x12
  40115b:	e9 c0 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401160 <signal@plt>:
  401160:	ff 25 4a 3f 00 00    	jmp    *0x3f4a(%rip)        # 4050b0 <signal@GLIBC_2.2.5>
  401166:	68 13 00 00 00       	push   $0x13
  40116b:	e9 b0 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401170 <gethostbyname@plt>:
  401170:	ff 25 42 3f 00 00    	jmp    *0x3f42(%rip)        # 4050b8 <gethostbyname@GLIBC_2.2.5>
  401176:	68 14 00 00 00       	push   $0x14
  40117b:	e9 a0 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401180 <memcpy@plt>:
  401180:	ff 25 3a 3f 00 00    	jmp    *0x3f3a(%rip)        # 4050c0 <memcpy@GLIBC_2.14>
  401186:	68 15 00 00 00       	push   $0x15
  40118b:	e9 90 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401190 <random@plt>:
  401190:	ff 25 32 3f 00 00    	jmp    *0x3f32(%rip)        # 4050c8 <random@GLIBC_2.2.5>
  401196:	68 16 00 00 00       	push   $0x16
  40119b:	e9 80 fe ff ff       	jmp    401020 <_init+0x20>

00000000004011a0 <__isoc99_sscanf@plt>:
  4011a0:	ff 25 2a 3f 00 00    	jmp    *0x3f2a(%rip)        # 4050d0 <__isoc99_sscanf@GLIBC_2.7>
  4011a6:	68 17 00 00 00       	push   $0x17
  4011ab:	e9 70 fe ff ff       	jmp    401020 <_init+0x20>

00000000004011b0 <munmap@plt>:
  4011b0:	ff 25 22 3f 00 00    	jmp    *0x3f22(%rip)        # 4050d8 <munmap@GLIBC_2.2.5>
  4011b6:	68 18 00 00 00       	push   $0x18
  4011bb:	e9 60 fe ff ff       	jmp    401020 <_init+0x20>

00000000004011c0 <memmove@plt>:
  4011c0:	ff 25 1a 3f 00 00    	jmp    *0x3f1a(%rip)        # 4050e0 <memmove@GLIBC_2.2.5>
  4011c6:	68 19 00 00 00       	push   $0x19
  4011cb:	e9 50 fe ff ff       	jmp    401020 <_init+0x20>

00000000004011d0 <getopt@plt>:
  4011d0:	ff 25 12 3f 00 00    	jmp    *0x3f12(%rip)        # 4050e8 <getopt@GLIBC_2.2.5>
  4011d6:	68 1a 00 00 00       	push   $0x1a
  4011db:	e9 40 fe ff ff       	jmp    401020 <_init+0x20>

00000000004011e0 <gethostname@plt>:
  4011e0:	ff 25 0a 3f 00 00    	jmp    *0x3f0a(%rip)        # 4050f0 <gethostname@GLIBC_2.2.5>
  4011e6:	68 1b 00 00 00       	push   $0x1b
  4011eb:	e9 30 fe ff ff       	jmp    401020 <_init+0x20>

00000000004011f0 <sprintf@plt>:
  4011f0:	ff 25 02 3f 00 00    	jmp    *0x3f02(%rip)        # 4050f8 <sprintf@GLIBC_2.2.5>
  4011f6:	68 1c 00 00 00       	push   $0x1c
  4011fb:	e9 20 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401200 <exit@plt>:
  401200:	ff 25 fa 3e 00 00    	jmp    *0x3efa(%rip)        # 405100 <exit@GLIBC_2.2.5>
  401206:	68 1d 00 00 00       	push   $0x1d
  40120b:	e9 10 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401210 <connect@plt>:
  401210:	ff 25 f2 3e 00 00    	jmp    *0x3ef2(%rip)        # 405108 <connect@GLIBC_2.2.5>
  401216:	68 1e 00 00 00       	push   $0x1e
  40121b:	e9 00 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401220 <fwrite@plt>:
  401220:	ff 25 ea 3e 00 00    	jmp    *0x3eea(%rip)        # 405110 <fwrite@GLIBC_2.2.5>
  401226:	68 1f 00 00 00       	push   $0x1f
  40122b:	e9 f0 fd ff ff       	jmp    401020 <_init+0x20>

0000000000401230 <strdup@plt>:
  401230:	ff 25 e2 3e 00 00    	jmp    *0x3ee2(%rip)        # 405118 <strdup@GLIBC_2.2.5>
  401236:	68 20 00 00 00       	push   $0x20
  40123b:	e9 e0 fd ff ff       	jmp    401020 <_init+0x20>

0000000000401240 <getc@plt>:
  401240:	ff 25 da 3e 00 00    	jmp    *0x3eda(%rip)        # 405120 <getc@GLIBC_2.2.5>
  401246:	68 21 00 00 00       	push   $0x21
  40124b:	e9 d0 fd ff ff       	jmp    401020 <_init+0x20>

0000000000401250 <rand@plt>:
  401250:	ff 25 d2 3e 00 00    	jmp    *0x3ed2(%rip)        # 405128 <rand@GLIBC_2.2.5>
  401256:	68 22 00 00 00       	push   $0x22
  40125b:	e9 c0 fd ff ff       	jmp    401020 <_init+0x20>

0000000000401260 <socket@plt>:
  401260:	ff 25 ca 3e 00 00    	jmp    *0x3eca(%rip)        # 405130 <socket@GLIBC_2.2.5>
  401266:	68 23 00 00 00       	push   $0x23
  40126b:	e9 b0 fd ff ff       	jmp    401020 <_init+0x20>

Disassembly of section .text:

0000000000401270 <_start>:
  401270:	f3 0f 1e fa          	endbr64
  401274:	31 ed                	xor    %ebp,%ebp
  401276:	49 89 d1             	mov    %rdx,%r9
  401279:	5e                   	pop    %rsi
  40127a:	48 89 e2             	mov    %rsp,%rdx
  40127d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  401281:	50                   	push   %rax
  401282:	54                   	push   %rsp
  401283:	45 31 c0             	xor    %r8d,%r8d
  401286:	31 c9                	xor    %ecx,%ecx
  401288:	48 c7 c7 d0 19 40 00 	mov    $0x4019d0,%rdi
  40128f:	ff 15 5b 3d 00 00    	call   *0x3d5b(%rip)        # 404ff0 <__libc_start_main@GLIBC_2.34>
  401295:	f4                   	hlt
  401296:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40129d:	00 00 00 

00000000004012a0 <_dl_relocate_static_pie>:
  4012a0:	f3 0f 1e fa          	endbr64
  4012a4:	c3                   	ret
  4012a5:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4012ac:	00 00 00 
  4012af:	90                   	nop

00000000004012b0 <deregister_tm_clones>:
  4012b0:	b8 b8 51 40 00       	mov    $0x4051b8,%eax
  4012b5:	48 3d b8 51 40 00    	cmp    $0x4051b8,%rax
  4012bb:	74 13                	je     4012d0 <deregister_tm_clones+0x20>
  4012bd:	b8 00 00 00 00       	mov    $0x0,%eax
  4012c2:	48 85 c0             	test   %rax,%rax
  4012c5:	74 09                	je     4012d0 <deregister_tm_clones+0x20>
  4012c7:	bf b8 51 40 00       	mov    $0x4051b8,%edi
  4012cc:	ff e0                	jmp    *%rax
  4012ce:	66 90                	xchg   %ax,%ax
  4012d0:	c3                   	ret
  4012d1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  4012d8:	00 00 00 00 
  4012dc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004012e0 <register_tm_clones>:
  4012e0:	be b8 51 40 00       	mov    $0x4051b8,%esi
  4012e5:	48 81 ee b8 51 40 00 	sub    $0x4051b8,%rsi
  4012ec:	48 89 f0             	mov    %rsi,%rax
  4012ef:	48 c1 ee 3f          	shr    $0x3f,%rsi
  4012f3:	48 c1 f8 03          	sar    $0x3,%rax
  4012f7:	48 01 c6             	add    %rax,%rsi
  4012fa:	48 d1 fe             	sar    $1,%rsi
  4012fd:	74 11                	je     401310 <register_tm_clones+0x30>
  4012ff:	b8 00 00 00 00       	mov    $0x0,%eax
  401304:	48 85 c0             	test   %rax,%rax
  401307:	74 07                	je     401310 <register_tm_clones+0x30>
  401309:	bf b8 51 40 00       	mov    $0x4051b8,%edi
  40130e:	ff e0                	jmp    *%rax
  401310:	c3                   	ret
  401311:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  401318:	00 00 00 00 
  40131c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401320 <__do_global_dtors_aux>:
  401320:	f3 0f 1e fa          	endbr64
  401324:	80 3d dd 3e 00 00 00 	cmpb   $0x0,0x3edd(%rip)        # 405208 <completed.0>
  40132b:	75 13                	jne    401340 <__do_global_dtors_aux+0x20>
  40132d:	55                   	push   %rbp
  40132e:	48 89 e5             	mov    %rsp,%rbp
  401331:	e8 7a ff ff ff       	call   4012b0 <deregister_tm_clones>
  401336:	c6 05 cb 3e 00 00 01 	movb   $0x1,0x3ecb(%rip)        # 405208 <completed.0>
  40133d:	5d                   	pop    %rbp
  40133e:	c3                   	ret
  40133f:	90                   	nop
  401340:	c3                   	ret
  401341:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  401348:	00 00 00 00 
  40134c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401350 <frame_dummy>:
  401350:	f3 0f 1e fa          	endbr64
  401354:	eb 8a                	jmp    4012e0 <register_tm_clones>

0000000000401356 <RAND_FUNC>:
  401356:	55                   	push   %rbp
  401357:	48 89 e5             	mov    %rsp,%rbp
  40135a:	48 83 ec 30          	sub    $0x30,%rsp
  40135e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401365:	00 00 
  401367:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  40136b:	31 c0                	xor    %eax,%eax
  40136d:	48 b8 42 65 6c 6c 20 	movabs $0x62614c206c6c6542,%rax
  401374:	4c 61 62 
  401377:	48 ba 73 20 75 73 65 	movabs $0x7420646573752073,%rdx
  40137e:	64 20 74 
  401381:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  401385:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  401389:	48 b8 68 65 20 61 2e 	movabs $0x74756f2e61206568,%rax
  401390:	6f 75 74 
  401393:	48 ba 20 66 6f 72 6d 	movabs $0x2e74616d726f6620,%rdx
  40139a:	61 74 2e 
  40139d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  4013a1:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  4013a5:	c6 45 f0 00          	movb   $0x0,-0x10(%rbp)
  4013a9:	0f b6 45 f1          	movzbl -0xf(%rbp),%eax
  4013ad:	88 45 d0             	mov    %al,-0x30(%rbp)
  4013b0:	90                   	nop
  4013b1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4013b5:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  4013bc:	00 00 
  4013be:	74 05                	je     4013c5 <RAND_FUNC+0x6f>
  4013c0:	e8 eb fc ff ff       	call   4010b0 <__stack_chk_fail@plt>
  4013c5:	c9                   	leave
  4013c6:	c3                   	ret

00000000004013c7 <smoke>:
  4013c7:	55                   	push   %rbp
  4013c8:	48 89 e5             	mov    %rsp,%rbp
  4013cb:	bf 08 30 40 00       	mov    $0x403008,%edi
  4013d0:	e8 9b fc ff ff       	call   401070 <puts@plt>
  4013d5:	bf 00 00 00 00       	mov    $0x0,%edi
  4013da:	e8 0f 0a 00 00       	call   401dee <validate>
  4013df:	bf 00 00 00 00       	mov    $0x0,%edi
  4013e4:	e8 17 fe ff ff       	call   401200 <exit@plt>

00000000004013e9 <fizz>:
  4013e9:	55                   	push   %rbp
  4013ea:	48 89 e5             	mov    %rsp,%rbp
  4013ed:	48 83 ec 10          	sub    $0x10,%rsp
  4013f1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  4013f4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  4013f7:	8b 05 3b 3e 00 00    	mov    0x3e3b(%rip),%eax        # 405238 <cookie>
  4013fd:	39 c2                	cmp    %eax,%edx
  4013ff:	75 20                	jne    401421 <fizz+0x38>
  401401:	8b 45 fc             	mov    -0x4(%rbp),%eax
  401404:	89 c6                	mov    %eax,%esi
  401406:	bf 23 30 40 00       	mov    $0x403023,%edi
  40140b:	b8 00 00 00 00       	mov    $0x0,%eax
  401410:	e8 cb fc ff ff       	call   4010e0 <printf@plt>
  401415:	bf 01 00 00 00       	mov    $0x1,%edi
  40141a:	e8 cf 09 00 00       	call   401dee <validate>
  40141f:	eb 14                	jmp    401435 <fizz+0x4c>
  401421:	8b 45 fc             	mov    -0x4(%rbp),%eax
  401424:	89 c6                	mov    %eax,%esi
  401426:	bf 48 30 40 00       	mov    $0x403048,%edi
  40142b:	b8 00 00 00 00       	mov    $0x0,%eax
  401430:	e8 ab fc ff ff       	call   4010e0 <printf@plt>
  401435:	bf 00 00 00 00       	mov    $0x0,%edi
  40143a:	e8 c1 fd ff ff       	call   401200 <exit@plt>

000000000040143f <bang>:
  40143f:	55                   	push   %rbp
  401440:	48 89 e5             	mov    %rsp,%rbp
  401443:	48 83 ec 10          	sub    $0x10,%rsp
  401447:	89 7d fc             	mov    %edi,-0x4(%rbp)
  40144a:	8b 05 f0 3d 00 00    	mov    0x3df0(%rip),%eax        # 405240 <global_value>
  401450:	89 c2                	mov    %eax,%edx
  401452:	8b 05 e0 3d 00 00    	mov    0x3de0(%rip),%eax        # 405238 <cookie>
  401458:	39 c2                	cmp    %eax,%edx
  40145a:	75 23                	jne    40147f <bang+0x40>
  40145c:	8b 05 de 3d 00 00    	mov    0x3dde(%rip),%eax        # 405240 <global_value>
  401462:	89 c6                	mov    %eax,%esi
  401464:	bf 68 30 40 00       	mov    $0x403068,%edi
  401469:	b8 00 00 00 00       	mov    $0x0,%eax
  40146e:	e8 6d fc ff ff       	call   4010e0 <printf@plt>
  401473:	bf 02 00 00 00       	mov    $0x2,%edi
  401478:	e8 71 09 00 00       	call   401dee <validate>
  40147d:	eb 17                	jmp    401496 <bang+0x57>
  40147f:	8b 05 bb 3d 00 00    	mov    0x3dbb(%rip),%eax        # 405240 <global_value>
  401485:	89 c6                	mov    %eax,%esi
  401487:	bf 8d 30 40 00       	mov    $0x40308d,%edi
  40148c:	b8 00 00 00 00       	mov    $0x0,%eax
  401491:	e8 4a fc ff ff       	call   4010e0 <printf@plt>
  401496:	bf 00 00 00 00       	mov    $0x0,%edi
  40149b:	e8 60 fd ff ff       	call   401200 <exit@plt>

00000000004014a0 <test>:
  4014a0:	55                   	push   %rbp
  4014a1:	48 89 e5             	mov    %rsp,%rbp
  4014a4:	48 83 ec 10          	sub    $0x10,%rsp
  4014a8:	b8 00 00 00 00       	mov    $0x0,%eax
  4014ad:	e8 07 05 00 00       	call   4019b9 <uniqueval>
  4014b2:	89 45 f8             	mov    %eax,-0x8(%rbp)
  4014b5:	b8 00 00 00 00       	mov    $0x0,%eax
  4014ba:	e8 56 07 00 00       	call   401c15 <getbuf>
  4014bf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  4014c2:	b8 00 00 00 00       	mov    $0x0,%eax
  4014c7:	e8 ed 04 00 00       	call   4019b9 <uniqueval>
  4014cc:	8b 55 f8             	mov    -0x8(%rbp),%edx
  4014cf:	39 d0                	cmp    %edx,%eax
  4014d1:	74 0c                	je     4014df <test+0x3f>
  4014d3:	bf b0 30 40 00       	mov    $0x4030b0,%edi
  4014d8:	e8 93 fb ff ff       	call   401070 <puts@plt>
  4014dd:	eb 41                	jmp    401520 <test+0x80>
  4014df:	8b 55 fc             	mov    -0x4(%rbp),%edx
  4014e2:	8b 05 50 3d 00 00    	mov    0x3d50(%rip),%eax        # 405238 <cookie>
  4014e8:	39 c2                	cmp    %eax,%edx
  4014ea:	75 20                	jne    40150c <test+0x6c>
  4014ec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4014ef:	89 c6                	mov    %eax,%esi
  4014f1:	bf d9 30 40 00       	mov    $0x4030d9,%edi
  4014f6:	b8 00 00 00 00       	mov    $0x0,%eax
  4014fb:	e8 e0 fb ff ff       	call   4010e0 <printf@plt>
  401500:	bf 03 00 00 00       	mov    $0x3,%edi
  401505:	e8 e4 08 00 00       	call   401dee <validate>
  40150a:	eb 14                	jmp    401520 <test+0x80>
  40150c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  40150f:	89 c6                	mov    %eax,%esi
  401511:	bf f6 30 40 00       	mov    $0x4030f6,%edi
  401516:	b8 00 00 00 00       	mov    $0x0,%eax
  40151b:	e8 c0 fb ff ff       	call   4010e0 <printf@plt>
  401520:	90                   	nop
  401521:	c9                   	leave
  401522:	c3                   	ret

0000000000401523 <testn>:
  401523:	55                   	push   %rbp
  401524:	48 89 e5             	mov    %rsp,%rbp
  401527:	48 83 ec 10          	sub    $0x10,%rsp
  40152b:	b8 00 00 00 00       	mov    $0x0,%eax
  401530:	e8 84 04 00 00       	call   4019b9 <uniqueval>
  401535:	89 45 f8             	mov    %eax,-0x8(%rbp)
  401538:	b8 00 00 00 00       	mov    $0x0,%eax
  40153d:	e8 ee 06 00 00       	call   401c30 <getbufn>
  401542:	89 45 fc             	mov    %eax,-0x4(%rbp)
  401545:	b8 00 00 00 00       	mov    $0x0,%eax
  40154a:	e8 6a 04 00 00       	call   4019b9 <uniqueval>
  40154f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  401552:	39 d0                	cmp    %edx,%eax
  401554:	74 0c                	je     401562 <testn+0x3f>
  401556:	bf b0 30 40 00       	mov    $0x4030b0,%edi
  40155b:	e8 10 fb ff ff       	call   401070 <puts@plt>
  401560:	eb 41                	jmp    4015a3 <testn+0x80>
  401562:	8b 55 fc             	mov    -0x4(%rbp),%edx
  401565:	8b 05 cd 3c 00 00    	mov    0x3ccd(%rip),%eax        # 405238 <cookie>
  40156b:	39 c2                	cmp    %eax,%edx
  40156d:	75 20                	jne    40158f <testn+0x6c>
  40156f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  401572:	89 c6                	mov    %eax,%esi
  401574:	bf 18 31 40 00       	mov    $0x403118,%edi
  401579:	b8 00 00 00 00       	mov    $0x0,%eax
  40157e:	e8 5d fb ff ff       	call   4010e0 <printf@plt>
  401583:	bf 04 00 00 00       	mov    $0x4,%edi
  401588:	e8 61 08 00 00       	call   401dee <validate>
  40158d:	eb 14                	jmp    4015a3 <testn+0x80>
  40158f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  401592:	89 c6                	mov    %eax,%esi
  401594:	bf 38 31 40 00       	mov    $0x403138,%edi
  401599:	b8 00 00 00 00       	mov    $0x0,%eax
  40159e:	e8 3d fb ff ff       	call   4010e0 <printf@plt>
  4015a3:	90                   	nop
  4015a4:	c9                   	leave
  4015a5:	c3                   	ret

00000000004015a6 <save_char>:
  4015a6:	55                   	push   %rbp
  4015a7:	48 89 e5             	mov    %rsp,%rbp
  4015aa:	89 f8                	mov    %edi,%eax
  4015ac:	88 45 fc             	mov    %al,-0x4(%rbp)
  4015af:	8b 05 8f 3c 00 00    	mov    0x3c8f(%rip),%eax        # 405244 <gets_cnt>
  4015b5:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  4015ba:	0f 8f 81 00 00 00    	jg     401641 <save_char+0x9b>
  4015c0:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
  4015c4:	c0 f8 04             	sar    $0x4,%al
  4015c7:	0f be c0             	movsbl %al,%eax
  4015ca:	83 e0 0f             	and    $0xf,%eax
  4015cd:	89 c6                	mov    %eax,%esi
  4015cf:	8b 15 6f 3c 00 00    	mov    0x3c6f(%rip),%edx        # 405244 <gets_cnt>
  4015d5:	89 d0                	mov    %edx,%eax
  4015d7:	01 c0                	add    %eax,%eax
  4015d9:	8d 0c 10             	lea    (%rax,%rdx,1),%ecx
  4015dc:	48 63 c6             	movslq %esi,%rax
  4015df:	0f b6 90 90 51 40 00 	movzbl 0x405190(%rax),%edx
  4015e6:	48 63 c1             	movslq %ecx,%rax
  4015e9:	88 90 60 52 40 00    	mov    %dl,0x405260(%rax)
  4015ef:	0f be 45 fc          	movsbl -0x4(%rbp),%eax
  4015f3:	83 e0 0f             	and    $0xf,%eax
  4015f6:	89 c6                	mov    %eax,%esi
  4015f8:	8b 15 46 3c 00 00    	mov    0x3c46(%rip),%edx        # 405244 <gets_cnt>
  4015fe:	89 d0                	mov    %edx,%eax
  401600:	01 c0                	add    %eax,%eax
  401602:	01 d0                	add    %edx,%eax
  401604:	8d 48 01             	lea    0x1(%rax),%ecx
  401607:	48 63 c6             	movslq %esi,%rax
  40160a:	0f b6 90 90 51 40 00 	movzbl 0x405190(%rax),%edx
  401611:	48 63 c1             	movslq %ecx,%rax
  401614:	88 90 60 52 40 00    	mov    %dl,0x405260(%rax)
  40161a:	8b 15 24 3c 00 00    	mov    0x3c24(%rip),%edx        # 405244 <gets_cnt>
  401620:	89 d0                	mov    %edx,%eax
  401622:	01 c0                	add    %eax,%eax
  401624:	01 d0                	add    %edx,%eax
  401626:	83 c0 02             	add    $0x2,%eax
  401629:	48 98                	cltq
  40162b:	c6 80 60 52 40 00 20 	movb   $0x20,0x405260(%rax)
  401632:	8b 05 0c 3c 00 00    	mov    0x3c0c(%rip),%eax        # 405244 <gets_cnt>
  401638:	83 c0 01             	add    $0x1,%eax
  40163b:	89 05 03 3c 00 00    	mov    %eax,0x3c03(%rip)        # 405244 <gets_cnt>
  401641:	90                   	nop
  401642:	5d                   	pop    %rbp
  401643:	c3                   	ret

0000000000401644 <save_term>:
  401644:	55                   	push   %rbp
  401645:	48 89 e5             	mov    %rsp,%rbp
  401648:	8b 15 f6 3b 00 00    	mov    0x3bf6(%rip),%edx        # 405244 <gets_cnt>
  40164e:	89 d0                	mov    %edx,%eax
  401650:	01 c0                	add    %eax,%eax
  401652:	01 d0                	add    %edx,%eax
  401654:	48 98                	cltq
  401656:	c6 80 60 52 40 00 00 	movb   $0x0,0x405260(%rax)
  40165d:	90                   	nop
  40165e:	5d                   	pop    %rbp
  40165f:	c3                   	ret

0000000000401660 <Gets>:
  401660:	55                   	push   %rbp
  401661:	48 89 e5             	mov    %rsp,%rbp
  401664:	48 83 ec 20          	sub    $0x20,%rsp
  401668:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  40166c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  401670:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401674:	c7 05 c6 3b 00 00 00 	movl   $0x0,0x3bc6(%rip)        # 405244 <gets_cnt>
  40167b:	00 00 00 
  40167e:	eb 1e                	jmp    40169e <Gets+0x3e>
  401680:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401684:	48 8d 50 01          	lea    0x1(%rax),%rdx
  401688:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  40168c:	8b 55 f4             	mov    -0xc(%rbp),%edx
  40168f:	88 10                	mov    %dl,(%rax)
  401691:	8b 45 f4             	mov    -0xc(%rbp),%eax
  401694:	0f be c0             	movsbl %al,%eax
  401697:	89 c7                	mov    %eax,%edi
  401699:	e8 08 ff ff ff       	call   4015a6 <save_char>
  40169e:	48 8b 05 8b 3b 00 00 	mov    0x3b8b(%rip),%rax        # 405230 <infile>
  4016a5:	48 89 c7             	mov    %rax,%rdi
  4016a8:	e8 93 fb ff ff       	call   401240 <getc@plt>
  4016ad:	89 45 f4             	mov    %eax,-0xc(%rbp)
  4016b0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%rbp)
  4016b4:	74 06                	je     4016bc <Gets+0x5c>
  4016b6:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  4016ba:	75 c4                	jne    401680 <Gets+0x20>
  4016bc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4016c0:	48 8d 50 01          	lea    0x1(%rax),%rdx
  4016c4:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  4016c8:	c6 00 00             	movb   $0x0,(%rax)
  4016cb:	b8 00 00 00 00       	mov    $0x0,%eax
  4016d0:	e8 6f ff ff ff       	call   401644 <save_term>
  4016d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4016d9:	c9                   	leave
  4016da:	c3                   	ret

00000000004016db <usage>:
  4016db:	55                   	push   %rbp
  4016dc:	48 89 e5             	mov    %rsp,%rbp
  4016df:	48 83 ec 10          	sub    $0x10,%rsp
  4016e3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  4016e7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4016eb:	48 89 c6             	mov    %rax,%rsi
  4016ee:	bf 54 31 40 00       	mov    $0x403154,%edi
  4016f3:	b8 00 00 00 00       	mov    $0x0,%eax
  4016f8:	e8 e3 f9 ff ff       	call   4010e0 <printf@plt>
  4016fd:	bf 72 31 40 00       	mov    $0x403172,%edi
  401702:	e8 69 f9 ff ff       	call   401070 <puts@plt>
  401707:	bf 88 31 40 00       	mov    $0x403188,%edi
  40170c:	e8 5f f9 ff ff       	call   401070 <puts@plt>
  401711:	bf a8 31 40 00       	mov    $0x4031a8,%edi
  401716:	e8 55 f9 ff ff       	call   401070 <puts@plt>
  40171b:	bf e8 31 40 00       	mov    $0x4031e8,%edi
  401720:	e8 4b f9 ff ff       	call   401070 <puts@plt>
  401725:	bf 00 00 00 00       	mov    $0x0,%edi
  40172a:	e8 d1 fa ff ff       	call   401200 <exit@plt>

000000000040172f <bushandler>:
  40172f:	55                   	push   %rbp
  401730:	48 89 e5             	mov    %rsp,%rbp
  401733:	48 83 ec 10          	sub    $0x10,%rsp
  401737:	89 7d fc             	mov    %edi,-0x4(%rbp)
  40173a:	bf 10 32 40 00       	mov    $0x403210,%edi
  40173f:	e8 2c f9 ff ff       	call   401070 <puts@plt>
  401744:	bf 30 32 40 00       	mov    $0x403230,%edi
  401749:	e8 22 f9 ff ff       	call   401070 <puts@plt>
  40174e:	bf 00 00 00 00       	mov    $0x0,%edi
  401753:	e8 a8 fa ff ff       	call   401200 <exit@plt>

0000000000401758 <seghandler>:
  401758:	55                   	push   %rbp
  401759:	48 89 e5             	mov    %rsp,%rbp
  40175c:	48 83 ec 10          	sub    $0x10,%rsp
  401760:	89 7d fc             	mov    %edi,-0x4(%rbp)
  401763:	bf 48 32 40 00       	mov    $0x403248,%edi
  401768:	e8 03 f9 ff ff       	call   401070 <puts@plt>
  40176d:	bf 30 32 40 00       	mov    $0x403230,%edi
  401772:	e8 f9 f8 ff ff       	call   401070 <puts@plt>
  401777:	bf 00 00 00 00       	mov    $0x0,%edi
  40177c:	e8 7f fa ff ff       	call   401200 <exit@plt>

0000000000401781 <illegalhandler>:
  401781:	55                   	push   %rbp
  401782:	48 89 e5             	mov    %rsp,%rbp
  401785:	48 83 ec 10          	sub    $0x10,%rsp
  401789:	89 7d fc             	mov    %edi,-0x4(%rbp)
  40178c:	bf 70 32 40 00       	mov    $0x403270,%edi
  401791:	e8 da f8 ff ff       	call   401070 <puts@plt>
  401796:	bf 30 32 40 00       	mov    $0x403230,%edi
  40179b:	e8 d0 f8 ff ff       	call   401070 <puts@plt>
  4017a0:	bf 00 00 00 00       	mov    $0x0,%edi
  4017a5:	e8 56 fa ff ff       	call   401200 <exit@plt>

00000000004017aa <launch>:
  4017aa:	55                   	push   %rbp
  4017ab:	48 89 e5             	mov    %rsp,%rbp
  4017ae:	48 83 ec 70          	sub    $0x70,%rsp
  4017b2:	89 7d 9c             	mov    %edi,-0x64(%rbp)
  4017b5:	89 75 98             	mov    %esi,-0x68(%rbp)
  4017b8:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4017bf:	00 00 
  4017c1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4017c5:	31 c0                	xor    %eax,%eax
  4017c7:	48 c7 45 a0 00 00 00 	movq   $0x0,-0x60(%rbp)
  4017ce:	00 
  4017cf:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
  4017d3:	25 f0 3f 00 00       	and    $0x3ff0,%eax
  4017d8:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
  4017dc:	8b 45 98             	mov    -0x68(%rbp),%eax
  4017df:	48 63 d0             	movslq %eax,%rdx
  4017e2:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
  4017e6:	48 01 d0             	add    %rdx,%rax
  4017e9:	48 8d 50 08          	lea    0x8(%rax),%rdx
  4017ed:	b8 10 00 00 00       	mov    $0x10,%eax
  4017f2:	48 83 e8 01          	sub    $0x1,%rax
  4017f6:	48 01 d0             	add    %rdx,%rax
  4017f9:	be 10 00 00 00       	mov    $0x10,%esi
  4017fe:	ba 00 00 00 00       	mov    $0x0,%edx
  401803:	48 f7 f6             	div    %rsi
  401806:	48 6b c0 10          	imul   $0x10,%rax,%rax
  40180a:	48 89 c1             	mov    %rax,%rcx
  40180d:	48 81 e1 00 f0 ff ff 	and    $0xfffffffffffff000,%rcx
  401814:	48 89 e2             	mov    %rsp,%rdx
  401817:	48 29 ca             	sub    %rcx,%rdx
  40181a:	48 39 d4             	cmp    %rdx,%rsp
  40181d:	74 12                	je     401831 <launch+0x87>
  40181f:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
  401826:	48 83 8c 24 f8 0f 00 	orq    $0x0,0xff8(%rsp)
  40182d:	00 00 
  40182f:	eb e9                	jmp    40181a <launch+0x70>
  401831:	48 89 c2             	mov    %rax,%rdx
  401834:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  40183a:	48 29 d4             	sub    %rdx,%rsp
  40183d:	48 89 c2             	mov    %rax,%rdx
  401840:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  401846:	48 85 d2             	test   %rdx,%rdx
  401849:	74 10                	je     40185b <launch+0xb1>
  40184b:	25 ff 0f 00 00       	and    $0xfff,%eax
  401850:	48 83 e8 08          	sub    $0x8,%rax
  401854:	48 01 e0             	add    %rsp,%rax
  401857:	48 83 08 00          	orq    $0x0,(%rax)
  40185b:	48 89 e0             	mov    %rsp,%rax
  40185e:	48 83 c0 0f          	add    $0xf,%rax
  401862:	48 c1 e8 04          	shr    $0x4,%rax
  401866:	48 c1 e0 04          	shl    $0x4,%rax
  40186a:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  40186e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  401872:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  401876:	be f4 00 00 00       	mov    $0xf4,%esi
  40187b:	48 89 c7             	mov    %rax,%rdi
  40187e:	e8 6d f8 ff ff       	call   4010f0 <memset@plt>
  401883:	bf 9b 32 40 00       	mov    $0x40329b,%edi
  401888:	b8 00 00 00 00       	mov    $0x0,%eax
  40188d:	e8 4e f8 ff ff       	call   4010e0 <printf@plt>
  401892:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  401896:	74 0c                	je     4018a4 <launch+0xfa>
  401898:	b8 00 00 00 00       	mov    $0x0,%eax
  40189d:	e8 81 fc ff ff       	call   401523 <testn>
  4018a2:	eb 0a                	jmp    4018ae <launch+0x104>
  4018a4:	b8 00 00 00 00       	mov    $0x0,%eax
  4018a9:	e8 f2 fb ff ff       	call   4014a0 <test>
  4018ae:	8b 05 88 39 00 00    	mov    0x3988(%rip),%eax        # 40523c <success>
  4018b4:	85 c0                	test   %eax,%eax
  4018b6:	75 14                	jne    4018cc <launch+0x122>
  4018b8:	bf 30 32 40 00       	mov    $0x403230,%edi
  4018bd:	e8 ae f7 ff ff       	call   401070 <puts@plt>
  4018c2:	c7 05 70 39 00 00 00 	movl   $0x0,0x3970(%rip)        # 40523c <success>
  4018c9:	00 00 00 
  4018cc:	90                   	nop
  4018cd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4018d1:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  4018d8:	00 00 
  4018da:	74 05                	je     4018e1 <launch+0x137>
  4018dc:	e8 cf f7 ff ff       	call   4010b0 <__stack_chk_fail@plt>
  4018e1:	c9                   	leave
  4018e2:	c3                   	ret

00000000004018e3 <launcher>:
  4018e3:	55                   	push   %rbp
  4018e4:	48 89 e5             	mov    %rsp,%rbp
  4018e7:	48 83 ec 20          	sub    $0x20,%rsp
  4018eb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  4018ee:	89 75 e8             	mov    %esi,-0x18(%rbp)
  4018f1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  4018f4:	89 05 6a 45 00 00    	mov    %eax,0x456a(%rip)        # 405e64 <global_nitro>
  4018fa:	8b 45 e8             	mov    -0x18(%rbp),%eax
  4018fd:	89 05 65 45 00 00    	mov    %eax,0x4565(%rip)        # 405e68 <global_offset>
  401903:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  401909:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  40190f:	b9 32 01 00 00       	mov    $0x132,%ecx
  401914:	ba 07 00 00 00       	mov    $0x7,%edx
  401919:	be 00 00 10 00       	mov    $0x100000,%esi
  40191e:	bf 00 90 57 55       	mov    $0x55579000,%edi
  401923:	e8 98 f7 ff ff       	call   4010c0 <mmap@plt>
  401928:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  40192c:	48 81 7d f8 00 90 57 	cmpq   $0x55579000,-0x8(%rbp)
  401933:	55 
  401934:	74 28                	je     40195e <launcher+0x7b>
  401936:	48 8b 05 c3 38 00 00 	mov    0x38c3(%rip),%rax        # 405200 <stderr@GLIBC_2.2.5>
  40193d:	48 89 c1             	mov    %rax,%rcx
  401940:	ba 47 00 00 00       	mov    $0x47,%edx
  401945:	be 01 00 00 00       	mov    $0x1,%esi
  40194a:	bf a8 32 40 00       	mov    $0x4032a8,%edi
  40194f:	e8 cc f8 ff ff       	call   401220 <fwrite@plt>
  401954:	bf 01 00 00 00       	mov    $0x1,%edi
  401959:	e8 a2 f8 ff ff       	call   401200 <exit@plt>
  40195e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401962:	48 05 f0 ff 0f 00    	add    $0xffff0,%rax
  401968:	48 89 05 01 45 00 00 	mov    %rax,0x4501(%rip)        # 405e70 <stack_top>
  40196f:	48 8b 15 fa 44 00 00 	mov    0x44fa(%rip),%rdx        # 405e70 <stack_top>
  401976:	48 89 e0             	mov    %rsp,%rax
  401979:	48 89 d4             	mov    %rdx,%rsp
  40197c:	48 89 c2             	mov    %rax,%rdx
  40197f:	48 89 15 f2 44 00 00 	mov    %rdx,0x44f2(%rip)        # 405e78 <global_save_stack>
  401986:	8b 15 dc 44 00 00    	mov    0x44dc(%rip),%edx        # 405e68 <global_offset>
  40198c:	8b 05 d2 44 00 00    	mov    0x44d2(%rip),%eax        # 405e64 <global_nitro>
  401992:	89 d6                	mov    %edx,%esi
  401994:	89 c7                	mov    %eax,%edi
  401996:	e8 0f fe ff ff       	call   4017aa <launch>
  40199b:	48 8b 05 d6 44 00 00 	mov    0x44d6(%rip),%rax        # 405e78 <global_save_stack>
  4019a2:	48 89 c4             	mov    %rax,%rsp
  4019a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4019a9:	be 00 00 10 00       	mov    $0x100000,%esi
  4019ae:	48 89 c7             	mov    %rax,%rdi
  4019b1:	e8 fa f7 ff ff       	call   4011b0 <munmap@plt>
  4019b6:	90                   	nop
  4019b7:	c9                   	leave
  4019b8:	c3                   	ret

00000000004019b9 <uniqueval>:
  4019b9:	55                   	push   %rbp
  4019ba:	48 89 e5             	mov    %rsp,%rbp
  4019bd:	e8 ce f6 ff ff       	call   401090 <getpid@plt>
  4019c2:	89 c7                	mov    %eax,%edi
  4019c4:	e8 87 f6 ff ff       	call   401050 <srandom@plt>
  4019c9:	e8 c2 f7 ff ff       	call   401190 <random@plt>
  4019ce:	5d                   	pop    %rbp
  4019cf:	c3                   	ret

00000000004019d0 <main>:
  4019d0:	55                   	push   %rbp
  4019d1:	48 89 e5             	mov    %rsp,%rbp
  4019d4:	48 83 ec 30          	sub    $0x30,%rsp
  4019d8:	89 7d dc             	mov    %edi,-0x24(%rbp)
  4019db:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  4019df:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  4019e6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
  4019ed:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%rbp)
  4019f4:	be 58 17 40 00       	mov    $0x401758,%esi
  4019f9:	bf 0b 00 00 00       	mov    $0xb,%edi
  4019fe:	e8 5d f7 ff ff       	call   401160 <signal@plt>
  401a03:	be 2f 17 40 00       	mov    $0x40172f,%esi
  401a08:	bf 07 00 00 00       	mov    $0x7,%edi
  401a0d:	e8 4e f7 ff ff       	call   401160 <signal@plt>
  401a12:	be 81 17 40 00       	mov    $0x401781,%esi
  401a17:	bf 04 00 00 00       	mov    $0x4,%edi
  401a1c:	e8 3f f7 ff ff       	call   401160 <signal@plt>
  401a21:	48 8b 05 98 37 00 00 	mov    0x3798(%rip),%rax        # 4051c0 <stdin@GLIBC_2.2.5>
  401a28:	48 89 05 01 38 00 00 	mov    %rax,0x3801(%rip)        # 405230 <infile>
  401a2f:	e9 97 00 00 00       	jmp    401acb <main+0xfb>
  401a34:	0f be 45 e7          	movsbl -0x19(%rbp),%eax
  401a38:	83 e8 67             	sub    $0x67,%eax
  401a3b:	83 f8 0e             	cmp    $0xe,%eax
  401a3e:	77 7c                	ja     401abc <main+0xec>
  401a40:	89 c0                	mov    %eax,%eax
  401a42:	48 8b 04 c5 68 33 40 	mov    0x403368(,%rax,8),%rax
  401a49:	00 
  401a4a:	ff e0                	jmp    *%rax
  401a4c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  401a50:	48 8b 00             	mov    (%rax),%rax
  401a53:	48 89 c7             	mov    %rax,%rdi
  401a56:	e8 80 fc ff ff       	call   4016db <usage>
  401a5b:	eb 6e                	jmp    401acb <main+0xfb>
  401a5d:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%rbp)
  401a64:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%rbp)
  401a6b:	eb 5e                	jmp    401acb <main+0xfb>
  401a6d:	48 8b 05 6c 37 00 00 	mov    0x376c(%rip),%rax        # 4051e0 <optarg@GLIBC_2.2.5>
  401a74:	48 89 c7             	mov    %rax,%rdi
  401a77:	e8 b4 f7 ff ff       	call   401230 <strdup@plt>
  401a7c:	48 89 05 9d 37 00 00 	mov    %rax,0x379d(%rip)        # 405220 <userid>
  401a83:	48 8b 05 96 37 00 00 	mov    0x3796(%rip),%rax        # 405220 <userid>
  401a8a:	48 89 c7             	mov    %rax,%rdi
  401a8d:	e8 fd 13 00 00       	call   402e8f <gencookie>
  401a92:	89 05 a0 37 00 00    	mov    %eax,0x37a0(%rip)        # 405238 <cookie>
  401a98:	eb 31                	jmp    401acb <main+0xfb>
  401a9a:	bf f0 32 40 00       	mov    $0x4032f0,%edi
  401a9f:	e8 cc f5 ff ff       	call   401070 <puts@plt>
  401aa4:	c7 05 7a 37 00 00 00 	movl   $0x0,0x377a(%rip)        # 405228 <notify>
  401aab:	00 00 00 
  401aae:	eb 1b                	jmp    401acb <main+0xfb>
  401ab0:	c7 05 72 37 00 00 01 	movl   $0x1,0x3772(%rip)        # 40522c <autograde>
  401ab7:	00 00 00 
  401aba:	eb 0f                	jmp    401acb <main+0xfb>
  401abc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  401ac0:	48 8b 00             	mov    (%rax),%rax
  401ac3:	48 89 c7             	mov    %rax,%rdi
  401ac6:	e8 10 fc ff ff       	call   4016db <usage>
  401acb:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  401acf:	8b 45 dc             	mov    -0x24(%rbp),%eax
  401ad2:	ba 18 33 40 00       	mov    $0x403318,%edx
  401ad7:	48 89 ce             	mov    %rcx,%rsi
  401ada:	89 c7                	mov    %eax,%edi
  401adc:	e8 ef f6 ff ff       	call   4011d0 <getopt@plt>
  401ae1:	88 45 e7             	mov    %al,-0x19(%rbp)
  401ae4:	80 7d e7 ff          	cmpb   $0xff,-0x19(%rbp)
  401ae8:	0f 85 46 ff ff ff    	jne    401a34 <main+0x64>
  401aee:	48 8b 05 2b 37 00 00 	mov    0x372b(%rip),%rax        # 405220 <userid>
  401af5:	48 85 c0             	test   %rax,%rax
  401af8:	75 28                	jne    401b22 <main+0x152>
  401afa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  401afe:	48 8b 00             	mov    (%rax),%rax
  401b01:	48 89 c6             	mov    %rax,%rsi
  401b04:	bf 20 33 40 00       	mov    $0x403320,%edi
  401b09:	b8 00 00 00 00       	mov    $0x0,%eax
  401b0e:	e8 cd f5 ff ff       	call   4010e0 <printf@plt>
  401b13:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  401b17:	48 8b 00             	mov    (%rax),%rax
  401b1a:	48 89 c7             	mov    %rax,%rdi
  401b1d:	e8 b9 fb ff ff       	call   4016db <usage>
  401b22:	e8 2a 01 00 00       	call   401c51 <initialize_bomb>
  401b27:	48 8b 05 f2 36 00 00 	mov    0x36f2(%rip),%rax        # 405220 <userid>
  401b2e:	48 89 c6             	mov    %rax,%rsi
  401b31:	bf 4c 33 40 00       	mov    $0x40334c,%edi
  401b36:	b8 00 00 00 00       	mov    $0x0,%eax
  401b3b:	e8 a0 f5 ff ff       	call   4010e0 <printf@plt>
  401b40:	8b 05 f2 36 00 00    	mov    0x36f2(%rip),%eax        # 405238 <cookie>
  401b46:	89 c6                	mov    %eax,%esi
  401b48:	bf 58 33 40 00       	mov    $0x403358,%edi
  401b4d:	b8 00 00 00 00       	mov    $0x0,%eax
  401b52:	e8 89 f5 ff ff       	call   4010e0 <printf@plt>
  401b57:	8b 05 db 36 00 00    	mov    0x36db(%rip),%eax        # 405238 <cookie>
  401b5d:	89 c7                	mov    %eax,%edi
  401b5f:	e8 ec f4 ff ff       	call   401050 <srandom@plt>
  401b64:	e8 27 f6 ff ff       	call   401190 <random@plt>
  401b69:	25 f0 0f 00 00       	and    $0xff0,%eax
  401b6e:	05 00 01 00 00       	add    $0x100,%eax
  401b73:	89 45 f4             	mov    %eax,-0xc(%rbp)
  401b76:	8b 45 f0             	mov    -0x10(%rbp),%eax
  401b79:	48 98                	cltq
  401b7b:	be 04 00 00 00       	mov    $0x4,%esi
  401b80:	48 89 c7             	mov    %rax,%rdi
  401b83:	e8 b8 f5 ff ff       	call   401140 <calloc@plt>
  401b88:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401b8c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401b90:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  401b96:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%rbp)
  401b9d:	eb 2b                	jmp    401bca <main+0x1fa>
  401b9f:	e8 ec f5 ff ff       	call   401190 <random@plt>
  401ba4:	25 f0 00 00 00       	and    $0xf0,%eax
  401ba9:	ba 80 00 00 00       	mov    $0x80,%edx
  401bae:	29 c2                	sub    %eax,%edx
  401bb0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  401bb3:	48 98                	cltq
  401bb5:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
  401bbc:	00 
  401bbd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401bc1:	48 01 c8             	add    %rcx,%rax
  401bc4:	89 10                	mov    %edx,(%rax)
  401bc6:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
  401bca:	8b 45 ec             	mov    -0x14(%rbp),%eax
  401bcd:	3b 45 f0             	cmp    -0x10(%rbp),%eax
  401bd0:	7c cd                	jl     401b9f <main+0x1cf>
  401bd2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  401bd9:	eb 2b                	jmp    401c06 <main+0x236>
  401bdb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  401bde:	48 98                	cltq
  401be0:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  401be7:	00 
  401be8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401bec:	48 01 d0             	add    %rdx,%rax
  401bef:	8b 10                	mov    (%rax),%edx
  401bf1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  401bf4:	01 c2                	add    %eax,%edx
  401bf6:	8b 45 e8             	mov    -0x18(%rbp),%eax
  401bf9:	89 d6                	mov    %edx,%esi
  401bfb:	89 c7                	mov    %eax,%edi
  401bfd:	e8 e1 fc ff ff       	call   4018e3 <launcher>
  401c02:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
  401c06:	8b 45 ec             	mov    -0x14(%rbp),%eax
  401c09:	3b 45 f0             	cmp    -0x10(%rbp),%eax
  401c0c:	7c cd                	jl     401bdb <main+0x20b>
  401c0e:	b8 00 00 00 00       	mov    $0x0,%eax
  401c13:	c9                   	leave
  401c14:	c3                   	ret

0000000000401c15 <getbuf>:
  401c15:	55                   	push   %rbp
  401c16:	48 89 e5             	mov    %rsp,%rbp
  401c19:	48 83 ec 40          	sub    $0x40,%rsp
  401c1d:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
  401c21:	48 89 c7             	mov    %rax,%rdi
  401c24:	e8 37 fa ff ff       	call   401660 <Gets>
  401c29:	b8 01 00 00 00       	mov    $0x1,%eax
  401c2e:	c9                   	leave
  401c2f:	c3                   	ret

0000000000401c30 <getbufn>:
  401c30:	55                   	push   %rbp
  401c31:	48 89 e5             	mov    %rsp,%rbp
  401c34:	48 81 ec 10 02 00 00 	sub    $0x210,%rsp
  401c3b:	48 8d 85 f0 fd ff ff 	lea    -0x210(%rbp),%rax
  401c42:	48 89 c7             	mov    %rax,%rdi
  401c45:	e8 16 fa ff ff       	call   401660 <Gets>
  401c4a:	b8 01 00 00 00       	mov    $0x1,%eax
  401c4f:	c9                   	leave
  401c50:	c3                   	ret

0000000000401c51 <initialize_bomb>:
  401c51:	55                   	push   %rbp
  401c52:	48 89 e5             	mov    %rsp,%rbp
  401c55:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
  401c5c:	48 83 0c 24 00       	orq    $0x0,(%rsp)
  401c61:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
  401c68:	48 83 0c 24 00       	orq    $0x0,(%rsp)
  401c6d:	48 81 ec 20 04 00 00 	sub    $0x420,%rsp
  401c74:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401c7b:	00 00 
  401c7d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401c81:	31 c0                	xor    %eax,%eax
  401c83:	c7 85 ec db ff ff 00 	movl   $0x0,-0x2414(%rbp)
  401c8a:	00 00 00 
  401c8d:	8b 05 99 35 00 00    	mov    0x3599(%rip),%eax        # 40522c <autograde>
  401c93:	85 c0                	test   %eax,%eax
  401c95:	74 0a                	je     401ca1 <initialize_bomb+0x50>
  401c97:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  401c9c:	e8 a5 0e 00 00       	call   402b46 <init_timeout>
  401ca1:	8b 05 81 35 00 00    	mov    0x3581(%rip),%eax        # 405228 <notify>
  401ca7:	85 c0                	test   %eax,%eax
  401ca9:	0f 84 28 01 00 00    	je     401dd7 <initialize_bomb+0x186>
  401caf:	48 8d 85 f0 db ff ff 	lea    -0x2410(%rbp),%rax
  401cb6:	be 00 04 00 00       	mov    $0x400,%esi
  401cbb:	48 89 c7             	mov    %rax,%rdi
  401cbe:	e8 1d f5 ff ff       	call   4011e0 <gethostname@plt>
  401cc3:	85 c0                	test   %eax,%eax
  401cc5:	74 14                	je     401cdb <initialize_bomb+0x8a>
  401cc7:	bf e0 33 40 00       	mov    $0x4033e0,%edi
  401ccc:	e8 9f f3 ff ff       	call   401070 <puts@plt>
  401cd1:	bf 08 00 00 00       	mov    $0x8,%edi
  401cd6:	e8 25 f5 ff ff       	call   401200 <exit@plt>
  401cdb:	c7 85 e8 db ff ff 00 	movl   $0x0,-0x2418(%rbp)
  401ce2:	00 00 00 
  401ce5:	eb 39                	jmp    401d20 <initialize_bomb+0xcf>
  401ce7:	8b 85 e8 db ff ff    	mov    -0x2418(%rbp),%eax
  401ced:	48 98                	cltq
  401cef:	48 8b 04 c5 80 5e 40 	mov    0x405e80(,%rax,8),%rax
  401cf6:	00 
  401cf7:	48 8d 95 f0 db ff ff 	lea    -0x2410(%rbp),%rdx
  401cfe:	48 89 d6             	mov    %rdx,%rsi
  401d01:	48 89 c7             	mov    %rax,%rdi
  401d04:	e8 27 f3 ff ff       	call   401030 <strcasecmp@plt>
  401d09:	85 c0                	test   %eax,%eax
  401d0b:	75 0c                	jne    401d19 <initialize_bomb+0xc8>
  401d0d:	c7 85 ec db ff ff 01 	movl   $0x1,-0x2414(%rbp)
  401d14:	00 00 00 
  401d17:	eb 1c                	jmp    401d35 <initialize_bomb+0xe4>
  401d19:	83 85 e8 db ff ff 01 	addl   $0x1,-0x2418(%rbp)
  401d20:	8b 85 e8 db ff ff    	mov    -0x2418(%rbp),%eax
  401d26:	48 98                	cltq
  401d28:	48 8b 04 c5 80 5e 40 	mov    0x405e80(,%rax,8),%rax
  401d2f:	00 
  401d30:	48 85 c0             	test   %rax,%rax
  401d33:	75 b2                	jne    401ce7 <initialize_bomb+0x96>
  401d35:	83 bd ec db ff ff 00 	cmpl   $0x0,-0x2414(%rbp)
  401d3c:	75 63                	jne    401da1 <initialize_bomb+0x150>
  401d3e:	48 8d 85 f0 db ff ff 	lea    -0x2410(%rbp),%rax
  401d45:	48 89 c6             	mov    %rax,%rsi
  401d48:	bf 18 34 40 00       	mov    $0x403418,%edi
  401d4d:	b8 00 00 00 00       	mov    $0x0,%eax
  401d52:	e8 89 f3 ff ff       	call   4010e0 <printf@plt>
  401d57:	c7 85 e8 db ff ff 00 	movl   $0x0,-0x2418(%rbp)
  401d5e:	00 00 00 
  401d61:	eb 1f                	jmp    401d82 <initialize_bomb+0x131>
  401d63:	8b 85 e8 db ff ff    	mov    -0x2418(%rbp),%eax
  401d69:	48 98                	cltq
  401d6b:	48 8b 04 c5 80 5e 40 	mov    0x405e80(,%rax,8),%rax
  401d72:	00 
  401d73:	48 89 c7             	mov    %rax,%rdi
  401d76:	e8 f5 f2 ff ff       	call   401070 <puts@plt>
  401d7b:	83 85 e8 db ff ff 01 	addl   $0x1,-0x2418(%rbp)
  401d82:	8b 85 e8 db ff ff    	mov    -0x2418(%rbp),%eax
  401d88:	48 98                	cltq
  401d8a:	48 8b 04 c5 80 5e 40 	mov    0x405e80(,%rax,8),%rax
  401d91:	00 
  401d92:	48 85 c0             	test   %rax,%rax
  401d95:	75 cc                	jne    401d63 <initialize_bomb+0x112>
  401d97:	bf 08 00 00 00       	mov    $0x8,%edi
  401d9c:	e8 5f f4 ff ff       	call   401200 <exit@plt>
  401da1:	48 8d 85 f0 df ff ff 	lea    -0x2010(%rbp),%rax
  401da8:	48 89 c7             	mov    %rax,%rdi
  401dab:	e8 d2 0d 00 00       	call   402b82 <init_driver>
  401db0:	85 c0                	test   %eax,%eax
  401db2:	79 23                	jns    401dd7 <initialize_bomb+0x186>
  401db4:	48 8d 85 f0 df ff ff 	lea    -0x2010(%rbp),%rax
  401dbb:	48 89 c6             	mov    %rax,%rsi
  401dbe:	bf 53 34 40 00       	mov    $0x403453,%edi
  401dc3:	b8 00 00 00 00       	mov    $0x0,%eax
  401dc8:	e8 13 f3 ff ff       	call   4010e0 <printf@plt>
  401dcd:	bf 08 00 00 00       	mov    $0x8,%edi
  401dd2:	e8 29 f4 ff ff       	call   401200 <exit@plt>
  401dd7:	90                   	nop
  401dd8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401ddc:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  401de3:	00 00 
  401de5:	74 05                	je     401dec <initialize_bomb+0x19b>
  401de7:	e8 c4 f2 ff ff       	call   4010b0 <__stack_chk_fail@plt>
  401dec:	c9                   	leave
  401ded:	c3                   	ret

0000000000401dee <validate>:
  401dee:	55                   	push   %rbp
  401def:	48 89 e5             	mov    %rsp,%rbp
  401df2:	4c 8d 9c 24 00 c0 ff 	lea    -0x4000(%rsp),%r11
  401df9:	ff 
  401dfa:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
  401e01:	48 83 0c 24 00       	orq    $0x0,(%rsp)
  401e06:	4c 39 dc             	cmp    %r11,%rsp
  401e09:	75 ef                	jne    401dfa <validate+0xc>
  401e0b:	48 83 ec 30          	sub    $0x30,%rsp
  401e0f:	89 bd dc bf ff ff    	mov    %edi,-0x4024(%rbp)
  401e15:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401e1c:	00 00 
  401e1e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401e22:	31 c0                	xor    %eax,%eax
  401e24:	48 8b 05 f5 33 00 00 	mov    0x33f5(%rip),%rax        # 405220 <userid>
  401e2b:	48 85 c0             	test   %rax,%rax
  401e2e:	75 0f                	jne    401e3f <validate+0x51>
  401e30:	bf 68 34 40 00       	mov    $0x403468,%edi
  401e35:	e8 36 f2 ff ff       	call   401070 <puts@plt>
  401e3a:	e9 39 01 00 00       	jmp    401f78 <validate+0x18a>
  401e3f:	83 bd dc bf ff ff 00 	cmpl   $0x0,-0x4024(%rbp)
  401e46:	78 09                	js     401e51 <validate+0x63>
  401e48:	83 bd dc bf ff ff 04 	cmpl   $0x4,-0x4024(%rbp)
  401e4f:	7e 0f                	jle    401e60 <validate+0x72>
  401e51:	bf 98 34 40 00       	mov    $0x403498,%edi
  401e56:	e8 15 f2 ff ff       	call   401070 <puts@plt>
  401e5b:	e9 18 01 00 00       	jmp    401f78 <validate+0x18a>
  401e60:	c7 05 d2 33 00 00 01 	movl   $0x1,0x33d2(%rip)        # 40523c <success>
  401e67:	00 00 00 
  401e6a:	8b 85 dc bf ff ff    	mov    -0x4024(%rbp),%eax
  401e70:	48 98                	cltq
  401e72:	8b 04 85 a0 51 40 00 	mov    0x4051a0(,%rax,4),%eax
  401e79:	8d 50 ff             	lea    -0x1(%rax),%edx
  401e7c:	8b 85 dc bf ff ff    	mov    -0x4024(%rbp),%eax
  401e82:	48 98                	cltq
  401e84:	89 14 85 a0 51 40 00 	mov    %edx,0x4051a0(,%rax,4)
  401e8b:	8b 85 dc bf ff ff    	mov    -0x4024(%rbp),%eax
  401e91:	48 98                	cltq
  401e93:	8b 04 85 a0 51 40 00 	mov    0x4051a0(,%rax,4),%eax
  401e9a:	85 c0                	test   %eax,%eax
  401e9c:	7e 0f                	jle    401ead <validate+0xbf>
  401e9e:	bf be 34 40 00       	mov    $0x4034be,%edi
  401ea3:	e8 c8 f1 ff ff       	call   401070 <puts@plt>
  401ea8:	e9 cb 00 00 00       	jmp    401f78 <validate+0x18a>
  401ead:	bf c9 34 40 00       	mov    $0x4034c9,%edi
  401eb2:	e8 b9 f1 ff ff       	call   401070 <puts@plt>
  401eb7:	8b 05 6b 33 00 00    	mov    0x336b(%rip),%eax        # 405228 <notify>
  401ebd:	85 c0                	test   %eax,%eax
  401ebf:	0f 84 a9 00 00 00    	je     401f6e <validate+0x180>
  401ec5:	bf 60 52 40 00       	mov    $0x405260,%edi
  401eca:	e8 d1 f1 ff ff       	call   4010a0 <strlen@plt>
  401ecf:	48 83 c0 20          	add    $0x20,%rax
  401ed3:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  401ed9:	76 0f                	jbe    401eea <validate+0xfc>
  401edb:	bf d0 34 40 00       	mov    $0x4034d0,%edi
  401ee0:	e8 8b f1 ff ff       	call   401070 <puts@plt>
  401ee5:	e9 8e 00 00 00       	jmp    401f78 <validate+0x18a>
  401eea:	8b 0d 48 33 00 00    	mov    0x3348(%rip),%ecx        # 405238 <cookie>
  401ef0:	8b 95 dc bf ff ff    	mov    -0x4024(%rbp),%edx
  401ef6:	48 8d 85 f0 bf ff ff 	lea    -0x4010(%rbp),%rax
  401efd:	41 b8 60 52 40 00    	mov    $0x405260,%r8d
  401f03:	be 07 35 40 00       	mov    $0x403507,%esi
  401f08:	48 89 c7             	mov    %rax,%rdi
  401f0b:	b8 00 00 00 00       	mov    $0x0,%eax
  401f10:	e8 db f2 ff ff       	call   4011f0 <sprintf@plt>
  401f15:	48 8b 05 04 33 00 00 	mov    0x3304(%rip),%rax        # 405220 <userid>
  401f1c:	48 8d 95 f0 df ff ff 	lea    -0x2010(%rbp),%rdx
  401f23:	48 8d b5 f0 bf ff ff 	lea    -0x4010(%rbp),%rsi
  401f2a:	48 89 d1             	mov    %rdx,%rcx
  401f2d:	ba 00 00 00 00       	mov    $0x0,%edx
  401f32:	48 89 c7             	mov    %rax,%rdi
  401f35:	e8 1f 0e 00 00       	call   402d59 <driver_post>
  401f3a:	89 85 ec bf ff ff    	mov    %eax,-0x4014(%rbp)
  401f40:	83 bd ec bf ff ff 00 	cmpl   $0x0,-0x4014(%rbp)
  401f47:	75 0c                	jne    401f55 <validate+0x167>
  401f49:	bf 10 35 40 00       	mov    $0x403510,%edi
  401f4e:	e8 1d f1 ff ff       	call   401070 <puts@plt>
  401f53:	eb 19                	jmp    401f6e <validate+0x180>
  401f55:	48 8d 85 f0 df ff ff 	lea    -0x2010(%rbp),%rax
  401f5c:	48 89 c6             	mov    %rax,%rsi
  401f5f:	bf 40 35 40 00       	mov    $0x403540,%edi
  401f64:	b8 00 00 00 00       	mov    $0x0,%eax
  401f69:	e8 72 f1 ff ff       	call   4010e0 <printf@plt>
  401f6e:	bf 7e 35 40 00       	mov    $0x40357e,%edi
  401f73:	e8 f8 f0 ff ff       	call   401070 <puts@plt>
  401f78:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401f7c:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  401f83:	00 00 
  401f85:	74 05                	je     401f8c <validate+0x19e>
  401f87:	e8 24 f1 ff ff       	call   4010b0 <__stack_chk_fail@plt>
  401f8c:	c9                   	leave
  401f8d:	c3                   	ret

0000000000401f8e <sigalrm_handler>:
  401f8e:	55                   	push   %rbp
  401f8f:	48 89 e5             	mov    %rsp,%rbp
  401f92:	48 83 ec 10          	sub    $0x10,%rsp
  401f96:	89 7d fc             	mov    %edi,-0x4(%rbp)
  401f99:	be 02 00 00 00       	mov    $0x2,%esi
  401f9e:	bf 88 35 40 00       	mov    $0x403588,%edi
  401fa3:	b8 00 00 00 00       	mov    $0x0,%eax
  401fa8:	e8 33 f1 ff ff       	call   4010e0 <printf@plt>
  401fad:	bf 01 00 00 00       	mov    $0x1,%edi
  401fb2:	e8 49 f2 ff ff       	call   401200 <exit@plt>

0000000000401fb7 <rio_readinitb>:
  401fb7:	55                   	push   %rbp
  401fb8:	48 89 e5             	mov    %rsp,%rbp
  401fbb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  401fbf:	89 75 f4             	mov    %esi,-0xc(%rbp)
  401fc2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401fc6:	8b 55 f4             	mov    -0xc(%rbp),%edx
  401fc9:	89 10                	mov    %edx,(%rax)
  401fcb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401fcf:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
  401fd6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401fda:	48 8d 50 10          	lea    0x10(%rax),%rdx
  401fde:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401fe2:	48 89 50 08          	mov    %rdx,0x8(%rax)
  401fe6:	90                   	nop
  401fe7:	5d                   	pop    %rbp
  401fe8:	c3                   	ret

0000000000401fe9 <rio_read>:
  401fe9:	55                   	push   %rbp
  401fea:	48 89 e5             	mov    %rsp,%rbp
  401fed:	48 83 ec 30          	sub    $0x30,%rsp
  401ff1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  401ff5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  401ff9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  401ffd:	eb 6e                	jmp    40206d <rio_read+0x84>
  401fff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402003:	48 8d 48 10          	lea    0x10(%rax),%rcx
  402007:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40200b:	8b 00                	mov    (%rax),%eax
  40200d:	ba 00 20 00 00       	mov    $0x2000,%edx
  402012:	48 89 ce             	mov    %rcx,%rsi
  402015:	89 c7                	mov    %eax,%edi
  402017:	e8 04 f1 ff ff       	call   401120 <read@plt>
  40201c:	89 c2                	mov    %eax,%edx
  40201e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402022:	89 50 04             	mov    %edx,0x4(%rax)
  402025:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402029:	8b 40 04             	mov    0x4(%rax),%eax
  40202c:	85 c0                	test   %eax,%eax
  40202e:	79 18                	jns    402048 <rio_read+0x5f>
  402030:	e8 0b f0 ff ff       	call   401040 <__errno_location@plt>
  402035:	8b 00                	mov    (%rax),%eax
  402037:	83 f8 04             	cmp    $0x4,%eax
  40203a:	74 31                	je     40206d <rio_read+0x84>
  40203c:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402043:	e9 9d 00 00 00       	jmp    4020e5 <rio_read+0xfc>
  402048:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40204c:	8b 40 04             	mov    0x4(%rax),%eax
  40204f:	85 c0                	test   %eax,%eax
  402051:	75 0a                	jne    40205d <rio_read+0x74>
  402053:	b8 00 00 00 00       	mov    $0x0,%eax
  402058:	e9 88 00 00 00       	jmp    4020e5 <rio_read+0xfc>
  40205d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402061:	48 8d 50 10          	lea    0x10(%rax),%rdx
  402065:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402069:	48 89 50 08          	mov    %rdx,0x8(%rax)
  40206d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402071:	8b 40 04             	mov    0x4(%rax),%eax
  402074:	85 c0                	test   %eax,%eax
  402076:	7e 87                	jle    401fff <rio_read+0x16>
  402078:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40207c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  40207f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402083:	8b 40 04             	mov    0x4(%rax),%eax
  402086:	48 98                	cltq
  402088:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  40208c:	76 0a                	jbe    402098 <rio_read+0xaf>
  40208e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402092:	8b 40 04             	mov    0x4(%rax),%eax
  402095:	89 45 fc             	mov    %eax,-0x4(%rbp)
  402098:	8b 45 fc             	mov    -0x4(%rbp),%eax
  40209b:	48 63 d0             	movslq %eax,%rdx
  40209e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4020a2:	48 8b 48 08          	mov    0x8(%rax),%rcx
  4020a6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  4020aa:	48 89 ce             	mov    %rcx,%rsi
  4020ad:	48 89 c7             	mov    %rax,%rdi
  4020b0:	e8 cb f0 ff ff       	call   401180 <memcpy@plt>
  4020b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4020b9:	48 8b 50 08          	mov    0x8(%rax),%rdx
  4020bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4020c0:	48 98                	cltq
  4020c2:	48 01 c2             	add    %rax,%rdx
  4020c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4020c9:	48 89 50 08          	mov    %rdx,0x8(%rax)
  4020cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4020d1:	8b 40 04             	mov    0x4(%rax),%eax
  4020d4:	2b 45 fc             	sub    -0x4(%rbp),%eax
  4020d7:	89 c2                	mov    %eax,%edx
  4020d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4020dd:	89 50 04             	mov    %edx,0x4(%rax)
  4020e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4020e3:	48 98                	cltq
  4020e5:	c9                   	leave
  4020e6:	c3                   	ret

00000000004020e7 <rio_readlineb>:
  4020e7:	55                   	push   %rbp
  4020e8:	48 89 e5             	mov    %rsp,%rbp
  4020eb:	48 83 ec 40          	sub    $0x40,%rsp
  4020ef:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  4020f3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  4020f7:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  4020fb:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402102:	00 00 
  402104:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  402108:	31 c0                	xor    %eax,%eax
  40210a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  40210e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  402112:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%rbp)
  402119:	eb 5d                	jmp    402178 <rio_readlineb+0x91>
  40211b:	48 8d 4d e7          	lea    -0x19(%rbp),%rcx
  40211f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402123:	ba 01 00 00 00       	mov    $0x1,%edx
  402128:	48 89 ce             	mov    %rcx,%rsi
  40212b:	48 89 c7             	mov    %rax,%rdi
  40212e:	e8 b6 fe ff ff       	call   401fe9 <rio_read>
  402133:	89 45 ec             	mov    %eax,-0x14(%rbp)
  402136:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
  40213a:	75 1c                	jne    402158 <rio_readlineb+0x71>
  40213c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  402140:	48 8d 50 01          	lea    0x1(%rax),%rdx
  402144:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  402148:	0f b6 55 e7          	movzbl -0x19(%rbp),%edx
  40214c:	88 10                	mov    %dl,(%rax)
  40214e:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
  402152:	3c 0a                	cmp    $0xa,%al
  402154:	75 1e                	jne    402174 <rio_readlineb+0x8d>
  402156:	eb 2e                	jmp    402186 <rio_readlineb+0x9f>
  402158:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  40215c:	75 0d                	jne    40216b <rio_readlineb+0x84>
  40215e:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  402162:	75 21                	jne    402185 <rio_readlineb+0x9e>
  402164:	b8 00 00 00 00       	mov    $0x0,%eax
  402169:	eb 27                	jmp    402192 <rio_readlineb+0xab>
  40216b:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402172:	eb 1e                	jmp    402192 <rio_readlineb+0xab>
  402174:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
  402178:	8b 45 e8             	mov    -0x18(%rbp),%eax
  40217b:	48 98                	cltq
  40217d:	48 39 45 c8          	cmp    %rax,-0x38(%rbp)
  402181:	77 98                	ja     40211b <rio_readlineb+0x34>
  402183:	eb 01                	jmp    402186 <rio_readlineb+0x9f>
  402185:	90                   	nop
  402186:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  40218a:	c6 00 00             	movb   $0x0,(%rax)
  40218d:	8b 45 e8             	mov    -0x18(%rbp),%eax
  402190:	48 98                	cltq
  402192:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  402196:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
  40219d:	00 00 
  40219f:	74 05                	je     4021a6 <rio_readlineb+0xbf>
  4021a1:	e8 0a ef ff ff       	call   4010b0 <__stack_chk_fail@plt>
  4021a6:	c9                   	leave
  4021a7:	c3                   	ret

00000000004021a8 <rio_writen>:
  4021a8:	55                   	push   %rbp
  4021a9:	48 89 e5             	mov    %rsp,%rbp
  4021ac:	48 83 ec 40          	sub    $0x40,%rsp
  4021b0:	89 7d dc             	mov    %edi,-0x24(%rbp)
  4021b3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  4021b7:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  4021bb:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  4021bf:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  4021c3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  4021c7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  4021cb:	eb 4f                	jmp    40221c <rio_writen+0x74>
  4021cd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  4021d1:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  4021d5:	8b 45 dc             	mov    -0x24(%rbp),%eax
  4021d8:	48 89 ce             	mov    %rcx,%rsi
  4021db:	89 c7                	mov    %eax,%edi
  4021dd:	e8 9e ee ff ff       	call   401080 <write@plt>
  4021e2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  4021e6:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  4021eb:	7f 1f                	jg     40220c <rio_writen+0x64>
  4021ed:	e8 4e ee ff ff       	call   401040 <__errno_location@plt>
  4021f2:	8b 00                	mov    (%rax),%eax
  4021f4:	83 f8 04             	cmp    $0x4,%eax
  4021f7:	75 0a                	jne    402203 <rio_writen+0x5b>
  4021f9:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  402200:	00 
  402201:	eb 09                	jmp    40220c <rio_writen+0x64>
  402203:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40220a:	eb 1b                	jmp    402227 <rio_writen+0x7f>
  40220c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  402210:	48 29 45 e8          	sub    %rax,-0x18(%rbp)
  402214:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  402218:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  40221c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  402221:	75 aa                	jne    4021cd <rio_writen+0x25>
  402223:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  402227:	c9                   	leave
  402228:	c3                   	ret

0000000000402229 <urlencode>:
  402229:	55                   	push   %rbp
  40222a:	48 89 e5             	mov    %rsp,%rbp
  40222d:	48 83 ec 30          	sub    $0x30,%rsp
  402231:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  402235:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  402239:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402240:	00 00 
  402242:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  402246:	31 c0                	xor    %eax,%eax
  402248:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40224c:	48 89 c7             	mov    %rax,%rdi
  40224f:	e8 4c ee ff ff       	call   4010a0 <strlen@plt>
  402254:	89 45 ec             	mov    %eax,-0x14(%rbp)
  402257:	e9 32 01 00 00       	jmp    40238e <urlencode+0x165>
  40225c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402260:	0f b6 00             	movzbl (%rax),%eax
  402263:	3c 2a                	cmp    $0x2a,%al
  402265:	74 63                	je     4022ca <urlencode+0xa1>
  402267:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40226b:	0f b6 00             	movzbl (%rax),%eax
  40226e:	3c 2d                	cmp    $0x2d,%al
  402270:	74 58                	je     4022ca <urlencode+0xa1>
  402272:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402276:	0f b6 00             	movzbl (%rax),%eax
  402279:	3c 2e                	cmp    $0x2e,%al
  40227b:	74 4d                	je     4022ca <urlencode+0xa1>
  40227d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402281:	0f b6 00             	movzbl (%rax),%eax
  402284:	3c 5f                	cmp    $0x5f,%al
  402286:	74 42                	je     4022ca <urlencode+0xa1>
  402288:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40228c:	0f b6 00             	movzbl (%rax),%eax
  40228f:	3c 2f                	cmp    $0x2f,%al
  402291:	76 0b                	jbe    40229e <urlencode+0x75>
  402293:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402297:	0f b6 00             	movzbl (%rax),%eax
  40229a:	3c 39                	cmp    $0x39,%al
  40229c:	76 2c                	jbe    4022ca <urlencode+0xa1>
  40229e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4022a2:	0f b6 00             	movzbl (%rax),%eax
  4022a5:	3c 40                	cmp    $0x40,%al
  4022a7:	76 0b                	jbe    4022b4 <urlencode+0x8b>
  4022a9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4022ad:	0f b6 00             	movzbl (%rax),%eax
  4022b0:	3c 5a                	cmp    $0x5a,%al
  4022b2:	76 16                	jbe    4022ca <urlencode+0xa1>
  4022b4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4022b8:	0f b6 00             	movzbl (%rax),%eax
  4022bb:	3c 60                	cmp    $0x60,%al
  4022bd:	76 25                	jbe    4022e4 <urlencode+0xbb>
  4022bf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4022c3:	0f b6 00             	movzbl (%rax),%eax
  4022c6:	3c 7a                	cmp    $0x7a,%al
  4022c8:	77 1a                	ja     4022e4 <urlencode+0xbb>
  4022ca:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  4022ce:	48 8d 50 01          	lea    0x1(%rax),%rdx
  4022d2:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  4022d6:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  4022da:	0f b6 12             	movzbl (%rdx),%edx
  4022dd:	88 10                	mov    %dl,(%rax)
  4022df:	e9 a5 00 00 00       	jmp    402389 <urlencode+0x160>
  4022e4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  4022e8:	0f b6 00             	movzbl (%rax),%eax
  4022eb:	3c 20                	cmp    $0x20,%al
  4022ed:	75 14                	jne    402303 <urlencode+0xda>
  4022ef:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  4022f3:	48 8d 50 01          	lea    0x1(%rax),%rdx
  4022f7:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  4022fb:	c6 00 2b             	movb   $0x2b,(%rax)
  4022fe:	e9 86 00 00 00       	jmp    402389 <urlencode+0x160>
  402303:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402307:	0f b6 00             	movzbl (%rax),%eax
  40230a:	3c 1f                	cmp    $0x1f,%al
  40230c:	76 0b                	jbe    402319 <urlencode+0xf0>
  40230e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402312:	0f b6 00             	movzbl (%rax),%eax
  402315:	84 c0                	test   %al,%al
  402317:	79 0b                	jns    402324 <urlencode+0xfb>
  402319:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40231d:	0f b6 00             	movzbl (%rax),%eax
  402320:	3c 09                	cmp    $0x9,%al
  402322:	75 5e                	jne    402382 <urlencode+0x159>
  402324:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402328:	0f b6 00             	movzbl (%rax),%eax
  40232b:	0f b6 d0             	movzbl %al,%edx
  40232e:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  402332:	be ac 35 40 00       	mov    $0x4035ac,%esi
  402337:	48 89 c7             	mov    %rax,%rdi
  40233a:	b8 00 00 00 00       	mov    $0x0,%eax
  40233f:	e8 ac ee ff ff       	call   4011f0 <sprintf@plt>
  402344:	0f b6 4d f0          	movzbl -0x10(%rbp),%ecx
  402348:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  40234c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  402350:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  402354:	89 ca                	mov    %ecx,%edx
  402356:	88 10                	mov    %dl,(%rax)
  402358:	0f b6 4d f1          	movzbl -0xf(%rbp),%ecx
  40235c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  402360:	48 8d 50 01          	lea    0x1(%rax),%rdx
  402364:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  402368:	89 ca                	mov    %ecx,%edx
  40236a:	88 10                	mov    %dl,(%rax)
  40236c:	0f b6 4d f2          	movzbl -0xe(%rbp),%ecx
  402370:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  402374:	48 8d 50 01          	lea    0x1(%rax),%rdx
  402378:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  40237c:	89 ca                	mov    %ecx,%edx
  40237e:	88 10                	mov    %dl,(%rax)
  402380:	eb 07                	jmp    402389 <urlencode+0x160>
  402382:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402387:	eb 1b                	jmp    4023a4 <urlencode+0x17b>
  402389:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  40238e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  402391:	8d 50 ff             	lea    -0x1(%rax),%edx
  402394:	89 55 ec             	mov    %edx,-0x14(%rbp)
  402397:	85 c0                	test   %eax,%eax
  402399:	0f 85 bd fe ff ff    	jne    40225c <urlencode+0x33>
  40239f:	b8 00 00 00 00       	mov    $0x0,%eax
  4023a4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  4023a8:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
  4023af:	00 00 
  4023b1:	74 05                	je     4023b8 <urlencode+0x18f>
  4023b3:	e8 f8 ec ff ff       	call   4010b0 <__stack_chk_fail@plt>
  4023b8:	c9                   	leave
  4023b9:	c3                   	ret

00000000004023ba <submitr>:
  4023ba:	55                   	push   %rbp
  4023bb:	48 89 e5             	mov    %rsp,%rbp
  4023be:	53                   	push   %rbx
  4023bf:	4c 8d 9c 24 00 60 ff 	lea    -0xa000(%rsp),%r11
  4023c6:	ff 
  4023c7:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
  4023ce:	48 83 0c 24 00       	orq    $0x0,(%rsp)
  4023d3:	4c 39 dc             	cmp    %r11,%rsp
  4023d6:	75 ef                	jne    4023c7 <submitr+0xd>
  4023d8:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
  4023df:	48 89 bd 98 5f ff ff 	mov    %rdi,-0xa068(%rbp)
  4023e6:	89 b5 94 5f ff ff    	mov    %esi,-0xa06c(%rbp)
  4023ec:	48 89 95 88 5f ff ff 	mov    %rdx,-0xa078(%rbp)
  4023f3:	48 89 8d 80 5f ff ff 	mov    %rcx,-0xa080(%rbp)
  4023fa:	4c 89 85 78 5f ff ff 	mov    %r8,-0xa088(%rbp)
  402401:	4c 89 8d 70 5f ff ff 	mov    %r9,-0xa090(%rbp)
  402408:	48 8b 45 10          	mov    0x10(%rbp),%rax
  40240c:	48 89 85 68 5f ff ff 	mov    %rax,-0xa098(%rbp)
  402413:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40241a:	00 00 
  40241c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  402420:	31 c0                	xor    %eax,%eax
  402422:	c7 85 a0 5f ff ff 00 	movl   $0x0,-0xa060(%rbp)
  402429:	00 00 00 
  40242c:	ba 00 00 00 00       	mov    $0x0,%edx
  402431:	be 01 00 00 00       	mov    $0x1,%esi
  402436:	bf 02 00 00 00       	mov    $0x2,%edi
  40243b:	e8 20 ee ff ff       	call   401260 <socket@plt>
  402440:	89 85 a4 5f ff ff    	mov    %eax,-0xa05c(%rbp)
  402446:	83 bd a4 5f ff ff 00 	cmpl   $0x0,-0xa05c(%rbp)
  40244d:	79 55                	jns    4024a4 <submitr+0xea>
  40244f:	48 8b 85 68 5f ff ff 	mov    -0xa098(%rbp),%rax
  402456:	48 bb 45 72 72 6f 72 	movabs $0x43203a726f727245,%rbx
  40245d:	3a 20 43 
  402460:	48 be 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rsi
  402467:	20 75 6e 
  40246a:	48 89 18             	mov    %rbx,(%rax)
  40246d:	48 89 70 08          	mov    %rsi,0x8(%rax)
  402471:	48 bb 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rbx
  402478:	74 6f 20 
  40247b:	48 be 63 72 65 61 74 	movabs $0x7320657461657263,%rsi
  402482:	65 20 73 
  402485:	48 89 58 10          	mov    %rbx,0x10(%rax)
  402489:	48 89 70 18          	mov    %rsi,0x18(%rax)
  40248d:	c7 40 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rax)
  402494:	66 c7 40 24 74 00    	movw   $0x74,0x24(%rax)
  40249a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40249f:	e9 88 06 00 00       	jmp    402b2c <submitr+0x772>
  4024a4:	48 8b 85 98 5f ff ff 	mov    -0xa068(%rbp),%rax
  4024ab:	48 89 c7             	mov    %rax,%rdi
  4024ae:	e8 bd ec ff ff       	call   401170 <gethostbyname@plt>
  4024b3:	48 89 85 a8 5f ff ff 	mov    %rax,-0xa058(%rbp)
  4024ba:	48 83 bd a8 5f ff ff 	cmpq   $0x0,-0xa058(%rbp)
  4024c1:	00 
  4024c2:	75 37                	jne    4024fb <submitr+0x141>
  4024c4:	48 8b 95 98 5f ff ff 	mov    -0xa068(%rbp),%rdx
  4024cb:	48 8b 85 68 5f ff ff 	mov    -0xa098(%rbp),%rax
  4024d2:	be b8 35 40 00       	mov    $0x4035b8,%esi
  4024d7:	48 89 c7             	mov    %rax,%rdi
  4024da:	b8 00 00 00 00       	mov    $0x0,%eax
  4024df:	e8 0c ed ff ff       	call   4011f0 <sprintf@plt>
  4024e4:	8b 85 a4 5f ff ff    	mov    -0xa05c(%rbp),%eax
  4024ea:	89 c7                	mov    %eax,%edi
  4024ec:	e8 1f ec ff ff       	call   401110 <close@plt>
  4024f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4024f6:	e9 31 06 00 00       	jmp    402b2c <submitr+0x772>
  4024fb:	48 8d 85 c0 5f ff ff 	lea    -0xa040(%rbp),%rax
  402502:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  402509:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
  402510:	00 
  402511:	66 c7 85 c0 5f ff ff 	movw   $0x2,-0xa040(%rbp)
  402518:	02 00 
  40251a:	48 8b 85 a8 5f ff ff 	mov    -0xa058(%rbp),%rax
  402521:	8b 40 14             	mov    0x14(%rax),%eax
  402524:	48 63 d0             	movslq %eax,%rdx
  402527:	48 8b 85 a8 5f ff ff 	mov    -0xa058(%rbp),%rax
  40252e:	48 8b 40 18          	mov    0x18(%rax),%rax
  402532:	48 8b 00             	mov    (%rax),%rax
  402535:	48 8d 8d c0 5f ff ff 	lea    -0xa040(%rbp),%rcx
  40253c:	48 83 c1 04          	add    $0x4,%rcx
  402540:	48 89 c6             	mov    %rax,%rsi
  402543:	48 89 cf             	mov    %rcx,%rdi
  402546:	e8 75 ec ff ff       	call   4011c0 <memmove@plt>
  40254b:	8b 85 94 5f ff ff    	mov    -0xa06c(%rbp),%eax
  402551:	0f b7 c0             	movzwl %ax,%eax
  402554:	89 c7                	mov    %eax,%edi
  402556:	e8 75 eb ff ff       	call   4010d0 <htons@plt>
  40255b:	66 89 85 c2 5f ff ff 	mov    %ax,-0xa03e(%rbp)
  402562:	48 8d 8d c0 5f ff ff 	lea    -0xa040(%rbp),%rcx
  402569:	8b 85 a4 5f ff ff    	mov    -0xa05c(%rbp),%eax
  40256f:	ba 10 00 00 00       	mov    $0x10,%edx
  402574:	48 89 ce             	mov    %rcx,%rsi
  402577:	89 c7                	mov    %eax,%edi
  402579:	e8 92 ec ff ff       	call   401210 <connect@plt>
  40257e:	85 c0                	test   %eax,%eax
  402580:	79 37                	jns    4025b9 <submitr+0x1ff>
  402582:	48 8b 95 98 5f ff ff 	mov    -0xa068(%rbp),%rdx
  402589:	48 8b 85 68 5f ff ff 	mov    -0xa098(%rbp),%rax
  402590:	be e8 35 40 00       	mov    $0x4035e8,%esi
  402595:	48 89 c7             	mov    %rax,%rdi
  402598:	b8 00 00 00 00       	mov    $0x0,%eax
  40259d:	e8 4e ec ff ff       	call   4011f0 <sprintf@plt>
  4025a2:	8b 85 a4 5f ff ff    	mov    -0xa05c(%rbp),%eax
  4025a8:	89 c7                	mov    %eax,%edi
  4025aa:	e8 61 eb ff ff       	call   401110 <close@plt>
  4025af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025b4:	e9 73 05 00 00       	jmp    402b2c <submitr+0x772>
  4025b9:	48 8b 85 70 5f ff ff 	mov    -0xa090(%rbp),%rax
  4025c0:	48 89 c7             	mov    %rax,%rdi
  4025c3:	e8 d8 ea ff ff       	call   4010a0 <strlen@plt>
  4025c8:	48 89 85 b0 5f ff ff 	mov    %rax,-0xa050(%rbp)
  4025cf:	48 8b 85 88 5f ff ff 	mov    -0xa078(%rbp),%rax
  4025d6:	48 89 c7             	mov    %rax,%rdi
  4025d9:	e8 c2 ea ff ff       	call   4010a0 <strlen@plt>
  4025de:	48 89 c3             	mov    %rax,%rbx
  4025e1:	48 8b 85 80 5f ff ff 	mov    -0xa080(%rbp),%rax
  4025e8:	48 89 c7             	mov    %rax,%rdi
  4025eb:	e8 b0 ea ff ff       	call   4010a0 <strlen@plt>
  4025f0:	48 01 c3             	add    %rax,%rbx
  4025f3:	48 8b 85 78 5f ff ff 	mov    -0xa088(%rbp),%rax
  4025fa:	48 89 c7             	mov    %rax,%rdi
  4025fd:	e8 9e ea ff ff       	call   4010a0 <strlen@plt>
  402602:	48 8d 0c 03          	lea    (%rbx,%rax,1),%rcx
  402606:	48 8b 95 b0 5f ff ff 	mov    -0xa050(%rbp),%rdx
  40260d:	48 89 d0             	mov    %rdx,%rax
  402610:	48 01 c0             	add    %rax,%rax
  402613:	48 01 d0             	add    %rdx,%rax
  402616:	48 01 c8             	add    %rcx,%rax
  402619:	48 83 e8 80          	sub    $0xffffffffffffff80,%rax
  40261d:	48 89 85 b8 5f ff ff 	mov    %rax,-0xa048(%rbp)
  402624:	48 81 bd b8 5f ff ff 	cmpq   $0x2000,-0xa048(%rbp)
  40262b:	00 20 00 00 
  40262f:	76 7f                	jbe    4026b0 <submitr+0x2f6>
  402631:	48 8b 85 68 5f ff ff 	mov    -0xa098(%rbp),%rax
  402638:	48 bb 45 72 72 6f 72 	movabs $0x52203a726f727245,%rbx
  40263f:	3a 20 52 
  402642:	48 be 65 73 75 6c 74 	movabs $0x747320746c757365,%rsi
  402649:	20 73 74 
  40264c:	48 89 18             	mov    %rbx,(%rax)
  40264f:	48 89 70 08          	mov    %rsi,0x8(%rax)
  402653:	48 bb 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rbx
  40265a:	74 6f 6f 
  40265d:	48 be 20 6c 61 72 67 	movabs $0x202e656772616c20,%rsi
  402664:	65 2e 20 
  402667:	48 89 58 10          	mov    %rbx,0x10(%rax)
  40266b:	48 89 70 18          	mov    %rsi,0x18(%rax)
  40266f:	48 bb 49 6e 63 72 65 	movabs $0x6573616572636e49,%rbx
  402676:	61 73 65 
  402679:	48 be 20 53 55 42 4d 	movabs $0x5254494d42555320,%rsi
  402680:	49 54 52 
  402683:	48 89 58 20          	mov    %rbx,0x20(%rax)
  402687:	48 89 70 28          	mov    %rsi,0x28(%rax)
  40268b:	48 bf 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rdi
  402692:	55 46 00 
  402695:	48 89 78 30          	mov    %rdi,0x30(%rax)
  402699:	8b 85 a4 5f ff ff    	mov    -0xa05c(%rbp),%eax
  40269f:	89 c7                	mov    %eax,%edi
  4026a1:	e8 6a ea ff ff       	call   401110 <close@plt>
  4026a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4026ab:	e9 7c 04 00 00       	jmp    402b2c <submitr+0x772>
  4026b0:	48 8d 85 e0 9f ff ff 	lea    -0x6020(%rbp),%rax
  4026b7:	48 89 c6             	mov    %rax,%rsi
  4026ba:	b8 00 00 00 00       	mov    $0x0,%eax
  4026bf:	ba 00 04 00 00       	mov    $0x400,%edx
  4026c4:	48 89 f7             	mov    %rsi,%rdi
  4026c7:	48 89 d1             	mov    %rdx,%rcx
  4026ca:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  4026cd:	48 8d 95 e0 9f ff ff 	lea    -0x6020(%rbp),%rdx
  4026d4:	48 8b 85 70 5f ff ff 	mov    -0xa090(%rbp),%rax
  4026db:	48 89 d6             	mov    %rdx,%rsi
  4026de:	48 89 c7             	mov    %rax,%rdi
  4026e1:	e8 43 fb ff ff       	call   402229 <urlencode>
  4026e6:	85 c0                	test   %eax,%eax
  4026e8:	0f 89 97 00 00 00    	jns    402785 <submitr+0x3cb>
  4026ee:	48 8b 85 68 5f ff ff 	mov    -0xa098(%rbp),%rax
  4026f5:	48 bb 45 72 72 6f 72 	movabs $0x52203a726f727245,%rbx
  4026fc:	3a 20 52 
  4026ff:	48 be 65 73 75 6c 74 	movabs $0x747320746c757365,%rsi
  402706:	20 73 74 
  402709:	48 89 18             	mov    %rbx,(%rax)
  40270c:	48 89 70 08          	mov    %rsi,0x8(%rax)
  402710:	48 bb 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rbx
  402717:	63 6f 6e 
  40271a:	48 be 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rsi
  402721:	20 61 6e 
  402724:	48 89 58 10          	mov    %rbx,0x10(%rax)
  402728:	48 89 70 18          	mov    %rsi,0x18(%rax)
  40272c:	48 bb 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rbx
  402733:	67 61 6c 
  402736:	48 be 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rsi
  40273d:	6e 70 72 
  402740:	48 89 58 20          	mov    %rbx,0x20(%rax)
  402744:	48 89 70 28          	mov    %rsi,0x28(%rax)
  402748:	48 bb 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rbx
  40274f:	6c 65 20 
  402752:	48 be 63 68 61 72 61 	movabs $0x6574636172616863,%rsi
  402759:	63 74 65 
  40275c:	48 89 58 30          	mov    %rbx,0x30(%rax)
  402760:	48 89 70 38          	mov    %rsi,0x38(%rax)
  402764:	66 c7 40 40 72 2e    	movw   $0x2e72,0x40(%rax)
  40276a:	c6 40 42 00          	movb   $0x0,0x42(%rax)
  40276e:	8b 85 a4 5f ff ff    	mov    -0xa05c(%rbp),%eax
  402774:	89 c7                	mov    %eax,%edi
  402776:	e8 95 e9 ff ff       	call   401110 <close@plt>
  40277b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402780:	e9 a7 03 00 00       	jmp    402b2c <submitr+0x772>
  402785:	48 8d bd e0 9f ff ff 	lea    -0x6020(%rbp),%rdi
  40278c:	48 8b b5 78 5f ff ff 	mov    -0xa088(%rbp),%rsi
  402793:	48 8b 8d 80 5f ff ff 	mov    -0xa080(%rbp),%rcx
  40279a:	48 8b 95 88 5f ff ff 	mov    -0xa078(%rbp),%rdx
  4027a1:	48 8d 85 e0 7f ff ff 	lea    -0x8020(%rbp),%rax
  4027a8:	49 89 f9             	mov    %rdi,%r9
  4027ab:	49 89 f0             	mov    %rsi,%r8
  4027ae:	be 10 36 40 00       	mov    $0x403610,%esi
  4027b3:	48 89 c7             	mov    %rax,%rdi
  4027b6:	b8 00 00 00 00       	mov    $0x0,%eax
  4027bb:	e8 30 ea ff ff       	call   4011f0 <sprintf@plt>
  4027c0:	48 8d 85 e0 7f ff ff 	lea    -0x8020(%rbp),%rax
  4027c7:	48 89 c7             	mov    %rax,%rdi
  4027ca:	e8 d1 e8 ff ff       	call   4010a0 <strlen@plt>
  4027cf:	48 89 c2             	mov    %rax,%rdx
  4027d2:	48 8d 8d e0 7f ff ff 	lea    -0x8020(%rbp),%rcx
  4027d9:	8b 85 a4 5f ff ff    	mov    -0xa05c(%rbp),%eax
  4027df:	48 89 ce             	mov    %rcx,%rsi
  4027e2:	89 c7                	mov    %eax,%edi
  4027e4:	e8 bf f9 ff ff       	call   4021a8 <rio_writen>
  4027e9:	48 85 c0             	test   %rax,%rax
  4027ec:	79 6a                	jns    402858 <submitr+0x49e>
  4027ee:	48 8b 85 68 5f ff ff 	mov    -0xa098(%rbp),%rax
  4027f5:	48 bb 45 72 72 6f 72 	movabs $0x43203a726f727245,%rbx
  4027fc:	3a 20 43 
  4027ff:	48 be 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rsi
  402806:	20 75 6e 
  402809:	48 89 18             	mov    %rbx,(%rax)
  40280c:	48 89 70 08          	mov    %rsi,0x8(%rax)
  402810:	48 bb 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rbx
  402817:	74 6f 20 
  40281a:	48 be 77 72 69 74 65 	movabs $0x6f74206574697277,%rsi
  402821:	20 74 6f 
  402824:	48 89 58 10          	mov    %rbx,0x10(%rax)
  402828:	48 89 70 18          	mov    %rsi,0x18(%rax)
  40282c:	48 ba 20 74 68 65 20 	movabs $0x7265732065687420,%rdx
  402833:	73 65 72 
  402836:	48 89 50 20          	mov    %rdx,0x20(%rax)
  40283a:	c7 40 28 76 65 72 00 	movl   $0x726576,0x28(%rax)
  402841:	8b 85 a4 5f ff ff    	mov    -0xa05c(%rbp),%eax
  402847:	89 c7                	mov    %eax,%edi
  402849:	e8 c2 e8 ff ff       	call   401110 <close@plt>
  40284e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402853:	e9 d4 02 00 00       	jmp    402b2c <submitr+0x772>
  402858:	8b 95 a4 5f ff ff    	mov    -0xa05c(%rbp),%edx
  40285e:	48 8d 85 d0 5f ff ff 	lea    -0xa030(%rbp),%rax
  402865:	89 d6                	mov    %edx,%esi
  402867:	48 89 c7             	mov    %rax,%rdi
  40286a:	e8 48 f7 ff ff       	call   401fb7 <rio_readinitb>
  40286f:	48 8d 8d e0 7f ff ff 	lea    -0x8020(%rbp),%rcx
  402876:	48 8d 85 d0 5f ff ff 	lea    -0xa030(%rbp),%rax
  40287d:	ba 00 20 00 00       	mov    $0x2000,%edx
  402882:	48 89 ce             	mov    %rcx,%rsi
  402885:	48 89 c7             	mov    %rax,%rdi
  402888:	e8 5a f8 ff ff       	call   4020e7 <rio_readlineb>
  40288d:	48 85 c0             	test   %rax,%rax
  402890:	7f 7e                	jg     402910 <submitr+0x556>
  402892:	48 8b 85 68 5f ff ff 	mov    -0xa098(%rbp),%rax
  402899:	48 bb 45 72 72 6f 72 	movabs $0x43203a726f727245,%rbx
  4028a0:	3a 20 43 
  4028a3:	48 be 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rsi
  4028aa:	20 75 6e 
  4028ad:	48 89 18             	mov    %rbx,(%rax)
  4028b0:	48 89 70 08          	mov    %rsi,0x8(%rax)
  4028b4:	48 b9 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rcx
  4028bb:	74 6f 20 
  4028be:	48 bb 72 65 61 64 20 	movabs $0x7269662064616572,%rbx
  4028c5:	66 69 72 
  4028c8:	48 89 48 10          	mov    %rcx,0x10(%rax)
  4028cc:	48 89 58 18          	mov    %rbx,0x18(%rax)
  4028d0:	48 b9 73 74 20 68 65 	movabs $0x6564616568207473,%rcx
  4028d7:	61 64 65 
  4028da:	48 bb 72 20 66 72 6f 	movabs $0x73206d6f72662072,%rbx
  4028e1:	6d 20 73 
  4028e4:	48 89 48 20          	mov    %rcx,0x20(%rax)
  4028e8:	48 89 58 28          	mov    %rbx,0x28(%rax)
  4028ec:	c7 40 30 65 72 76 65 	movl   $0x65767265,0x30(%rax)
  4028f3:	66 c7 40 34 72 00    	movw   $0x72,0x34(%rax)
  4028f9:	8b 85 a4 5f ff ff    	mov    -0xa05c(%rbp),%eax
  4028ff:	89 c7                	mov    %eax,%edi
  402901:	e8 0a e8 ff ff       	call   401110 <close@plt>
  402906:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40290b:	e9 1c 02 00 00       	jmp    402b2c <submitr+0x772>
  402910:	48 8d b5 e0 df ff ff 	lea    -0x2020(%rbp),%rsi
  402917:	48 8d 8d a0 5f ff ff 	lea    -0xa060(%rbp),%rcx
  40291e:	48 8d 95 e0 bf ff ff 	lea    -0x4020(%rbp),%rdx
  402925:	48 8d 85 e0 7f ff ff 	lea    -0x8020(%rbp),%rax
  40292c:	49 89 f0             	mov    %rsi,%r8
  40292f:	be 5a 36 40 00       	mov    $0x40365a,%esi
  402934:	48 89 c7             	mov    %rax,%rdi
  402937:	b8 00 00 00 00       	mov    $0x0,%eax
  40293c:	e8 5f e8 ff ff       	call   4011a0 <__isoc99_sscanf@plt>
  402941:	8b 85 a0 5f ff ff    	mov    -0xa060(%rbp),%eax
  402947:	3d c8 00 00 00       	cmp    $0xc8,%eax
  40294c:	0f 84 d5 00 00 00    	je     402a27 <submitr+0x66d>
  402952:	8b 95 a0 5f ff ff    	mov    -0xa060(%rbp),%edx
  402958:	48 8d 8d e0 df ff ff 	lea    -0x2020(%rbp),%rcx
  40295f:	48 8b 85 68 5f ff ff 	mov    -0xa098(%rbp),%rax
  402966:	be 70 36 40 00       	mov    $0x403670,%esi
  40296b:	48 89 c7             	mov    %rax,%rdi
  40296e:	b8 00 00 00 00       	mov    $0x0,%eax
  402973:	e8 78 e8 ff ff       	call   4011f0 <sprintf@plt>
  402978:	8b 85 a4 5f ff ff    	mov    -0xa05c(%rbp),%eax
  40297e:	89 c7                	mov    %eax,%edi
  402980:	e8 8b e7 ff ff       	call   401110 <close@plt>
  402985:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40298a:	e9 9d 01 00 00       	jmp    402b2c <submitr+0x772>
  40298f:	48 8d 8d e0 7f ff ff 	lea    -0x8020(%rbp),%rcx
  402996:	48 8d 85 d0 5f ff ff 	lea    -0xa030(%rbp),%rax
  40299d:	ba 00 20 00 00       	mov    $0x2000,%edx
  4029a2:	48 89 ce             	mov    %rcx,%rsi
  4029a5:	48 89 c7             	mov    %rax,%rdi
  4029a8:	e8 3a f7 ff ff       	call   4020e7 <rio_readlineb>
  4029ad:	48 85 c0             	test   %rax,%rax
  4029b0:	7f 75                	jg     402a27 <submitr+0x66d>
  4029b2:	48 8b 85 68 5f ff ff 	mov    -0xa098(%rbp),%rax
  4029b9:	48 b9 45 72 72 6f 72 	movabs $0x43203a726f727245,%rcx
  4029c0:	3a 20 43 
  4029c3:	48 bb 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rbx
  4029ca:	20 75 6e 
  4029cd:	48 89 08             	mov    %rcx,(%rax)
  4029d0:	48 89 58 08          	mov    %rbx,0x8(%rax)
  4029d4:	48 b9 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rcx
  4029db:	74 6f 20 
  4029de:	48 bb 72 65 61 64 20 	movabs $0x6165682064616572,%rbx
  4029e5:	68 65 61 
  4029e8:	48 89 48 10          	mov    %rcx,0x10(%rax)
  4029ec:	48 89 58 18          	mov    %rbx,0x18(%rax)
  4029f0:	48 b9 64 65 72 73 20 	movabs $0x6f72662073726564,%rcx
  4029f7:	66 72 6f 
  4029fa:	48 bb 6d 20 73 65 72 	movabs $0x726576726573206d,%rbx
  402a01:	76 65 72 
  402a04:	48 89 48 20          	mov    %rcx,0x20(%rax)
  402a08:	48 89 58 28          	mov    %rbx,0x28(%rax)
  402a0c:	c6 40 30 00          	movb   $0x0,0x30(%rax)
  402a10:	8b 85 a4 5f ff ff    	mov    -0xa05c(%rbp),%eax
  402a16:	89 c7                	mov    %eax,%edi
  402a18:	e8 f3 e6 ff ff       	call   401110 <close@plt>
  402a1d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a22:	e9 05 01 00 00       	jmp    402b2c <submitr+0x772>
  402a27:	48 8d 85 e0 7f ff ff 	lea    -0x8020(%rbp),%rax
  402a2e:	be 9d 36 40 00       	mov    $0x40369d,%esi
  402a33:	48 89 c7             	mov    %rax,%rdi
  402a36:	e8 15 e7 ff ff       	call   401150 <strcmp@plt>
  402a3b:	85 c0                	test   %eax,%eax
  402a3d:	0f 85 4c ff ff ff    	jne    40298f <submitr+0x5d5>
  402a43:	48 8d 8d e0 7f ff ff 	lea    -0x8020(%rbp),%rcx
  402a4a:	48 8d 85 d0 5f ff ff 	lea    -0xa030(%rbp),%rax
  402a51:	ba 00 20 00 00       	mov    $0x2000,%edx
  402a56:	48 89 ce             	mov    %rcx,%rsi
  402a59:	48 89 c7             	mov    %rax,%rdi
  402a5c:	e8 86 f6 ff ff       	call   4020e7 <rio_readlineb>
  402a61:	48 85 c0             	test   %rax,%rax
  402a64:	7f 7c                	jg     402ae2 <submitr+0x728>
  402a66:	48 8b 85 68 5f ff ff 	mov    -0xa098(%rbp),%rax
  402a6d:	48 b9 45 72 72 6f 72 	movabs $0x43203a726f727245,%rcx
  402a74:	3a 20 43 
  402a77:	48 bb 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rbx
  402a7e:	20 75 6e 
  402a81:	48 89 08             	mov    %rcx,(%rax)
  402a84:	48 89 58 08          	mov    %rbx,0x8(%rax)
  402a88:	48 ba 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rdx
  402a8f:	74 6f 20 
  402a92:	48 b9 72 65 61 64 20 	movabs $0x6174732064616572,%rcx
  402a99:	73 74 61 
  402a9c:	48 89 50 10          	mov    %rdx,0x10(%rax)
  402aa0:	48 89 48 18          	mov    %rcx,0x18(%rax)
  402aa4:	48 bb 74 75 73 20 6d 	movabs $0x7373656d20737574,%rbx
  402aab:	65 73 73 
  402aae:	48 be 61 67 65 20 66 	movabs $0x6d6f726620656761,%rsi
  402ab5:	72 6f 6d 
  402ab8:	48 89 58 20          	mov    %rbx,0x20(%rax)
  402abc:	48 89 70 28          	mov    %rsi,0x28(%rax)
  402ac0:	48 bf 20 73 65 72 76 	movabs $0x72657672657320,%rdi
  402ac7:	65 72 00 
  402aca:	48 89 78 30          	mov    %rdi,0x30(%rax)
  402ace:	8b 85 a4 5f ff ff    	mov    -0xa05c(%rbp),%eax
  402ad4:	89 c7                	mov    %eax,%edi
  402ad6:	e8 35 e6 ff ff       	call   401110 <close@plt>
  402adb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402ae0:	eb 4a                	jmp    402b2c <submitr+0x772>
  402ae2:	48 8d 95 e0 7f ff ff 	lea    -0x8020(%rbp),%rdx
  402ae9:	48 8b 85 68 5f ff ff 	mov    -0xa098(%rbp),%rax
  402af0:	48 89 d6             	mov    %rdx,%rsi
  402af3:	48 89 c7             	mov    %rax,%rdi
  402af6:	e8 65 e5 ff ff       	call   401060 <strcpy@plt>
  402afb:	8b 85 a4 5f ff ff    	mov    -0xa05c(%rbp),%eax
  402b01:	89 c7                	mov    %eax,%edi
  402b03:	e8 08 e6 ff ff       	call   401110 <close@plt>
  402b08:	48 8b 85 68 5f ff ff 	mov    -0xa098(%rbp),%rax
  402b0f:	be a0 36 40 00       	mov    $0x4036a0,%esi
  402b14:	48 89 c7             	mov    %rax,%rdi
  402b17:	e8 34 e6 ff ff       	call   401150 <strcmp@plt>
  402b1c:	85 c0                	test   %eax,%eax
  402b1e:	75 07                	jne    402b27 <submitr+0x76d>
  402b20:	b8 00 00 00 00       	mov    $0x0,%eax
  402b25:	eb 05                	jmp    402b2c <submitr+0x772>
  402b27:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b2c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  402b30:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
  402b37:	00 00 
  402b39:	74 05                	je     402b40 <submitr+0x786>
  402b3b:	e8 70 e5 ff ff       	call   4010b0 <__stack_chk_fail@plt>
  402b40:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  402b44:	c9                   	leave
  402b45:	c3                   	ret

0000000000402b46 <init_timeout>:
  402b46:	55                   	push   %rbp
  402b47:	48 89 e5             	mov    %rsp,%rbp
  402b4a:	48 83 ec 10          	sub    $0x10,%rsp
  402b4e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  402b51:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  402b55:	74 28                	je     402b7f <init_timeout+0x39>
  402b57:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  402b5b:	79 07                	jns    402b64 <init_timeout+0x1e>
  402b5d:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%rbp)
  402b64:	be 8e 1f 40 00       	mov    $0x401f8e,%esi
  402b69:	bf 0e 00 00 00       	mov    $0xe,%edi
  402b6e:	e8 ed e5 ff ff       	call   401160 <signal@plt>
  402b73:	8b 45 fc             	mov    -0x4(%rbp),%eax
  402b76:	89 c7                	mov    %eax,%edi
  402b78:	e8 83 e5 ff ff       	call   401100 <alarm@plt>
  402b7d:	eb 01                	jmp    402b80 <init_timeout+0x3a>
  402b7f:	90                   	nop
  402b80:	c9                   	leave
  402b81:	c3                   	ret

0000000000402b82 <init_driver>:
  402b82:	55                   	push   %rbp
  402b83:	48 89 e5             	mov    %rsp,%rbp
  402b86:	48 83 ec 50          	sub    $0x50,%rsp
  402b8a:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
  402b8e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402b95:	00 00 
  402b97:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  402b9b:	31 c0                	xor    %eax,%eax
  402b9d:	48 c7 45 d0 a3 36 40 	movq   $0x4036a3,-0x30(%rbp)
  402ba4:	00 
  402ba5:	c7 45 c8 03 d9 00 00 	movl   $0xd903,-0x38(%rbp)
  402bac:	be 01 00 00 00       	mov    $0x1,%esi
  402bb1:	bf 0d 00 00 00       	mov    $0xd,%edi
  402bb6:	e8 a5 e5 ff ff       	call   401160 <signal@plt>
  402bbb:	be 01 00 00 00       	mov    $0x1,%esi
  402bc0:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402bc5:	e8 96 e5 ff ff       	call   401160 <signal@plt>
  402bca:	be 01 00 00 00       	mov    $0x1,%esi
  402bcf:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402bd4:	e8 87 e5 ff ff       	call   401160 <signal@plt>
  402bd9:	ba 00 00 00 00       	mov    $0x0,%edx
  402bde:	be 01 00 00 00       	mov    $0x1,%esi
  402be3:	bf 02 00 00 00       	mov    $0x2,%edi
  402be8:	e8 73 e6 ff ff       	call   401260 <socket@plt>
  402bed:	89 45 cc             	mov    %eax,-0x34(%rbp)
  402bf0:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  402bf4:	79 52                	jns    402c48 <init_driver+0xc6>
  402bf6:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402bfa:	48 be 45 72 72 6f 72 	movabs $0x43203a726f727245,%rsi
  402c01:	3a 20 43 
  402c04:	48 bf 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdi
  402c0b:	20 75 6e 
  402c0e:	48 89 30             	mov    %rsi,(%rax)
  402c11:	48 89 78 08          	mov    %rdi,0x8(%rax)
  402c15:	48 be 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rsi
  402c1c:	74 6f 20 
  402c1f:	48 bf 63 72 65 61 74 	movabs $0x7320657461657263,%rdi
  402c26:	65 20 73 
  402c29:	48 89 70 10          	mov    %rsi,0x10(%rax)
  402c2d:	48 89 78 18          	mov    %rdi,0x18(%rax)
  402c31:	c7 40 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rax)
  402c38:	66 c7 40 24 74 00    	movw   $0x74,0x24(%rax)
  402c3e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402c43:	e9 fb 00 00 00       	jmp    402d43 <init_driver+0x1c1>
  402c48:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  402c4c:	48 89 c7             	mov    %rax,%rdi
  402c4f:	e8 1c e5 ff ff       	call   401170 <gethostbyname@plt>
  402c54:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  402c58:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  402c5d:	75 2e                	jne    402c8d <init_driver+0x10b>
  402c5f:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  402c63:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402c67:	be b8 35 40 00       	mov    $0x4035b8,%esi
  402c6c:	48 89 c7             	mov    %rax,%rdi
  402c6f:	b8 00 00 00 00       	mov    $0x0,%eax
  402c74:	e8 77 e5 ff ff       	call   4011f0 <sprintf@plt>
  402c79:	8b 45 cc             	mov    -0x34(%rbp),%eax
  402c7c:	89 c7                	mov    %eax,%edi
  402c7e:	e8 8d e4 ff ff       	call   401110 <close@plt>
  402c83:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402c88:	e9 b6 00 00 00       	jmp    402d43 <init_driver+0x1c1>
  402c8d:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  402c91:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  402c98:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
  402c9f:	00 
  402ca0:	66 c7 45 e0 02 00    	movw   $0x2,-0x20(%rbp)
  402ca6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402caa:	8b 40 14             	mov    0x14(%rax),%eax
  402cad:	48 63 d0             	movslq %eax,%rdx
  402cb0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  402cb4:	48 8b 40 18          	mov    0x18(%rax),%rax
  402cb8:	48 8b 00             	mov    (%rax),%rax
  402cbb:	48 8d 4d e0          	lea    -0x20(%rbp),%rcx
  402cbf:	48 83 c1 04          	add    $0x4,%rcx
  402cc3:	48 89 c6             	mov    %rax,%rsi
  402cc6:	48 89 cf             	mov    %rcx,%rdi
  402cc9:	e8 f2 e4 ff ff       	call   4011c0 <memmove@plt>
  402cce:	8b 45 c8             	mov    -0x38(%rbp),%eax
  402cd1:	0f b7 c0             	movzwl %ax,%eax
  402cd4:	89 c7                	mov    %eax,%edi
  402cd6:	e8 f5 e3 ff ff       	call   4010d0 <htons@plt>
  402cdb:	66 89 45 e2          	mov    %ax,-0x1e(%rbp)
  402cdf:	48 8d 4d e0          	lea    -0x20(%rbp),%rcx
  402ce3:	8b 45 cc             	mov    -0x34(%rbp),%eax
  402ce6:	ba 10 00 00 00       	mov    $0x10,%edx
  402ceb:	48 89 ce             	mov    %rcx,%rsi
  402cee:	89 c7                	mov    %eax,%edi
  402cf0:	e8 1b e5 ff ff       	call   401210 <connect@plt>
  402cf5:	85 c0                	test   %eax,%eax
  402cf7:	79 2e                	jns    402d27 <init_driver+0x1a5>
  402cf9:	8b 4d c8             	mov    -0x38(%rbp),%ecx
  402cfc:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  402d00:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402d04:	be b8 36 40 00       	mov    $0x4036b8,%esi
  402d09:	48 89 c7             	mov    %rax,%rdi
  402d0c:	b8 00 00 00 00       	mov    $0x0,%eax
  402d11:	e8 da e4 ff ff       	call   4011f0 <sprintf@plt>
  402d16:	8b 45 cc             	mov    -0x34(%rbp),%eax
  402d19:	89 c7                	mov    %eax,%edi
  402d1b:	e8 f0 e3 ff ff       	call   401110 <close@plt>
  402d20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402d25:	eb 1c                	jmp    402d43 <init_driver+0x1c1>
  402d27:	8b 45 cc             	mov    -0x34(%rbp),%eax
  402d2a:	89 c7                	mov    %eax,%edi
  402d2c:	e8 df e3 ff ff       	call   401110 <close@plt>
  402d31:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  402d35:	66 c7 00 4f 4b       	movw   $0x4b4f,(%rax)
  402d3a:	c6 40 02 00          	movb   $0x0,0x2(%rax)
  402d3e:	b8 00 00 00 00       	mov    $0x0,%eax
  402d43:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  402d47:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
  402d4e:	00 00 
  402d50:	74 05                	je     402d57 <init_driver+0x1d5>
  402d52:	e8 59 e3 ff ff       	call   4010b0 <__stack_chk_fail@plt>
  402d57:	c9                   	leave
  402d58:	c3                   	ret

0000000000402d59 <driver_post>:
  402d59:	55                   	push   %rbp
  402d5a:	48 89 e5             	mov    %rsp,%rbp
  402d5d:	48 83 ec 30          	sub    $0x30,%rsp
  402d61:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  402d65:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  402d69:	89 55 dc             	mov    %edx,-0x24(%rbp)
  402d6c:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
  402d70:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  402d74:	74 2a                	je     402da0 <driver_post+0x47>
  402d76:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  402d7a:	48 89 c6             	mov    %rax,%rsi
  402d7d:	bf e1 36 40 00       	mov    $0x4036e1,%edi
  402d82:	b8 00 00 00 00       	mov    $0x0,%eax
  402d87:	e8 54 e3 ff ff       	call   4010e0 <printf@plt>
  402d8c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  402d90:	66 c7 00 4f 4b       	movw   $0x4b4f,(%rax)
  402d95:	c6 40 02 00          	movb   $0x0,0x2(%rax)
  402d99:	b8 00 00 00 00       	mov    $0x0,%eax
  402d9e:	eb 62                	jmp    402e02 <driver_post+0xa9>
  402da0:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  402da5:	74 49                	je     402df0 <driver_post+0x97>
  402da7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402dab:	0f b6 00             	movzbl (%rax),%eax
  402dae:	0f b6 c0             	movzbl %al,%eax
  402db1:	85 c0                	test   %eax,%eax
  402db3:	74 3b                	je     402df0 <driver_post+0x97>
  402db5:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  402db9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402dbd:	48 83 ec 08          	sub    $0x8,%rsp
  402dc1:	ff 75 d0             	push   -0x30(%rbp)
  402dc4:	49 89 d1             	mov    %rdx,%r9
  402dc7:	41 b8 f8 36 40 00    	mov    $0x4036f8,%r8d
  402dcd:	48 89 c1             	mov    %rax,%rcx
  402dd0:	ba ff 36 40 00       	mov    $0x4036ff,%edx
  402dd5:	be 03 d9 00 00       	mov    $0xd903,%esi
  402dda:	bf a3 36 40 00       	mov    $0x4036a3,%edi
  402ddf:	e8 d6 f5 ff ff       	call   4023ba <submitr>
  402de4:	48 83 c4 10          	add    $0x10,%rsp
  402de8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  402deb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  402dee:	eb 12                	jmp    402e02 <driver_post+0xa9>
  402df0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  402df4:	66 c7 00 4f 4b       	movw   $0x4b4f,(%rax)
  402df9:	c6 40 02 00          	movb   $0x0,0x2(%rax)
  402dfd:	b8 00 00 00 00       	mov    $0x0,%eax
  402e02:	c9                   	leave
  402e03:	c3                   	ret

0000000000402e04 <hash>:
  402e04:	55                   	push   %rbp
  402e05:	48 89 e5             	mov    %rsp,%rbp
  402e08:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  402e0c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  402e13:	eb 1d                	jmp    402e32 <hash+0x2e>
  402e15:	8b 45 fc             	mov    -0x4(%rbp),%eax
  402e18:	6b c8 67             	imul   $0x67,%eax,%ecx
  402e1b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402e1f:	48 8d 50 01          	lea    0x1(%rax),%rdx
  402e23:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  402e27:	0f b6 00             	movzbl (%rax),%eax
  402e2a:	0f be c0             	movsbl %al,%eax
  402e2d:	01 c8                	add    %ecx,%eax
  402e2f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  402e32:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402e36:	0f b6 00             	movzbl (%rax),%eax
  402e39:	84 c0                	test   %al,%al
  402e3b:	75 d8                	jne    402e15 <hash+0x11>
  402e3d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  402e40:	5d                   	pop    %rbp
  402e41:	c3                   	ret

0000000000402e42 <check>:
  402e42:	55                   	push   %rbp
  402e43:	48 89 e5             	mov    %rsp,%rbp
  402e46:	89 7d ec             	mov    %edi,-0x14(%rbp)
  402e49:	8b 45 ec             	mov    -0x14(%rbp),%eax
  402e4c:	c1 e8 1c             	shr    $0x1c,%eax
  402e4f:	85 c0                	test   %eax,%eax
  402e51:	75 07                	jne    402e5a <check+0x18>
  402e53:	b8 00 00 00 00       	mov    $0x0,%eax
  402e58:	eb 33                	jmp    402e8d <check+0x4b>
  402e5a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  402e61:	eb 1f                	jmp    402e82 <check+0x40>
  402e63:	8b 45 fc             	mov    -0x4(%rbp),%eax
  402e66:	8b 55 ec             	mov    -0x14(%rbp),%edx
  402e69:	89 c1                	mov    %eax,%ecx
  402e6b:	d3 ea                	shr    %cl,%edx
  402e6d:	89 d0                	mov    %edx,%eax
  402e6f:	0f b6 c0             	movzbl %al,%eax
  402e72:	83 f8 0a             	cmp    $0xa,%eax
  402e75:	75 07                	jne    402e7e <check+0x3c>
  402e77:	b8 00 00 00 00       	mov    $0x0,%eax
  402e7c:	eb 0f                	jmp    402e8d <check+0x4b>
  402e7e:	83 45 fc 08          	addl   $0x8,-0x4(%rbp)
  402e82:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  402e86:	7e db                	jle    402e63 <check+0x21>
  402e88:	b8 01 00 00 00       	mov    $0x1,%eax
  402e8d:	5d                   	pop    %rbp
  402e8e:	c3                   	ret

0000000000402e8f <gencookie>:
  402e8f:	55                   	push   %rbp
  402e90:	48 89 e5             	mov    %rsp,%rbp
  402e93:	48 83 ec 20          	sub    $0x20,%rsp
  402e97:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  402e9b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  402e9f:	48 89 c7             	mov    %rax,%rdi
  402ea2:	e8 5d ff ff ff       	call   402e04 <hash>
  402ea7:	89 c7                	mov    %eax,%edi
  402ea9:	e8 82 e2 ff ff       	call   401130 <srand@plt>
  402eae:	e8 9d e3 ff ff       	call   401250 <rand@plt>
  402eb3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  402eb6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  402eb9:	89 c7                	mov    %eax,%edi
  402ebb:	e8 82 ff ff ff       	call   402e42 <check>
  402ec0:	85 c0                	test   %eax,%eax
  402ec2:	74 ea                	je     402eae <gencookie+0x1f>
  402ec4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  402ec7:	c9                   	leave
  402ec8:	c3                   	ret

Disassembly of section .fini:

0000000000402ecc <_fini>:
  402ecc:	f3 0f 1e fa          	endbr64
  402ed0:	48 83 ec 08          	sub    $0x8,%rsp
  402ed4:	48 83 c4 08          	add    $0x8,%rsp
  402ed8:	c3                   	ret

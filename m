From: Thomas Steudten <alpha@steudten.com>
Subject: Re: raid1.c and gcc problem/oops (was: [INFO] gcc versions used to
 compile a kernel
Date: Mon, 13 Oct 2003 16:41:45 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <3F8AB9A9.9010502@steudten.com>
References: <3F8ACFA0.10239.10815846@localhost>
Reply-To: alpha@steudten.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <3F8ACFA0.10239.10815846@localhost>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

Well maybe for x86.
On alpha, as i described in this list, i got an oops in raid1.c
for kernel 2.4.17..21, 2.6.0-test7 with gcc-2.95.3, gcc-3.3
(3.4 is in work by me).
It seems that=B4t this a problem with gcc and option -O2. With optimizi=
ng
set to -O0 everything is ok. So i think gcc gives bad assembler code.
BUT: This problem still exists until now - latest kernel, latest
stable gcc. Redhat have had a patch for this since RH 7.1  with gcc
2.26. The problem is still there!! OK, why change the kernel code in
raid1.c read_balance, if it=B4s a fault in gcc. And we use gcc 2.95-3,
gcc 3.2.2 ( i don=B4t test it, but i think 3.3 or 3.3.1 is newer
and contains fixes for 3.2.2 ..) and we got still this very old, well
known bug in raid1.c:read_balance() on alpha.

What to do? Everytime patch the raid1.c?

Unable to handle kernel paging request at virtual address 0000000000000=
059
swapper(1): Oops 0
pc =3D [<fffffc000050dd50>]  ra =3D [<fffffc000050e200>]  ps =3D 0007  =
  Not tainted
v0 =3D 0000000000000000  t0 =3D 0000000000000002  t1 =3D 00000000000000=
01
t2 =3D 0000000000000000  t3 =3D fffffc000015d6e8  t4 =3D 00000000000000=
01
t5 =3D fffffc0000182c50  t6 =3D 0000000000000002  t7 =3D fffffc0000c240=
00
s0 =3D fffffc001fcad408  s1 =3D fffffc00001b26e0  s2 =3D 00000000000000=
02
s3 =3D fffffc0000182c50  s4 =3D fffffc00010d5f68  s5 =3D 00000000000000=
02
s6 =3D fffffc0000105148
a0 =3D 0000000000000007  a1 =3D fffffc00010d5f68  a2 =3D fffffc001fcad4=
08
a3 =3D 0000000000000400  a4 =3D 0000000000000018  a5 =3D 00000000000000=
00
t8 =3D 0000000000000000  t9 =3D fffffc000015d6f8  t10=3D 00000000000000=
04
t11=3D 0000000000000001  pv =3D fffffc000043ba20  at =3D 00000000000000=
02
gp =3D fffffc00006df608  sp =3D fffffc0000c27b18
Trace:fffffc0000482c80 fffffc0000329320 fffffc0000482d68 fffffc000037a2=
c8 fffffc0000377340 fffffc00003
77784 fffffc00003d05ec fffffc000037da10 fffffc00003d04a0 fffffc00003d27=
5c fffffc000035646d fffffc00003
7de58 fffffc000039a6a8 fffffc000039ab1c fffffc000039afb8 fffffc000039af=
94 fffffc0000310000 fffffc00003
101ac fffffc00003135b8
Code: a0a60010  47ff041f  40821524  40a03125  a4440000  e440000e <a0220=
058> e420000c

>>RA;  fffffc000050e200 <make_request+e0/3c0>

>>PC;  fffffc000050dd50 <read_balance+170/280>   <=3D=3D=3D=3D=3D

Trace; fffffc0000482c80 <generic_make_request+220/260>
Trace; fffffc0000329320 <autoremove_wake_function+0/60>
Trace; fffffc0000482d68 <submit_bio+a8/c0>
Trace; fffffc000037a2c8 <submit_bh+1a8/1e0>
Trace; fffffc0000377340 <__bread_slow+a0/100>
Trace; fffffc0000377784 <__bread+24/40>
Trace; fffffc00003d05ec <ext3_fill_super+14c/f60>
Trace; fffffc000037da10 <get_sb_bdev+170/240>
Trace; fffffc00003d04a0 <ext3_fill_super+0/f60>
Trace; fffffc00003d275c <ext3_get_sb+1c/60>
Trace; fffffc000035646d <cache_alloc_refill+40d/5c0>
Trace; fffffc000037de58 <do_kern_mount+98/220>
Trace; fffffc000039a6a8 <do_add_mount+a8/220>
Trace; fffffc000039ab1c <do_mount+1dc/220>
Trace; fffffc000039afb8 <sys_mount+b8/160>
Trace; fffffc000039af94 <sys_mount+94/160>
Trace; fffffc0000310000 <_text+0/0>
Trace; fffffc00003101ac <init+2c/100>
Trace; fffffc00003135b8 <kernel_thread+28/90>

Code;  fffffc000050dd38 <read_balance+158/280>
0000000000000000 <_PC>:
Code;  fffffc000050dd38 <read_balance+158/280>
    0:   10 00 a6 a0       ldl  t4,16(t5)
Code;  fffffc000050dd3c <read_balance+15c/280>
    4:   1f 04 ff 47       nop
Code;  fffffc000050dd40 <read_balance+160/280>
    8:   24 15 82 40       subq t3,0x10,t3
Code;  fffffc000050dd44 <read_balance+164/280>
    c:   25 31 a0 40       subl t4,0x1,t4
Code;  fffffc000050dd48 <read_balance+168/280>
   10:   00 00 44 a4       ldq  t1,0(t3)
Code;  fffffc000050dd4c <read_balance+16c/280>
   14:   0e 00 40 e4       beq  t1,50 <_PC+0x50> fffffc000050dd88 <read=
_balance+1a8/280>
Code;  fffffc000050dd50 <read_balance+170/280>   <=3D=3D=3D=3D=3D
   18:   58 00 22 a0       ldl  t0,88(t1)   <=3D=3D=3D=3D=3D
Code;  fffffc000050dd54 <read_balance+174/280>
   1c:   0c 00 20 e4       beq  t0,50 <_PC+0x50> fffffc000050dd88 <read=
_balance+1a8/280>

 From raid1.c:
   if (!conf->mirrors[disk].rdev ||
                     !conf->mirrors[disk].rdev->in_sync)
                         continue;


Kernel panic: Attempted to kill init!


Sebastian Piecha wrote:

> The last days I had a lot of trouble getting different kernel=20
> versions to run. Enclosed is a short report of the experience I made.
>=20
> First I tried to compile all kernels with gcc 3.3.1.

> Then I used gcc 2.95.3 for compiling 2.4.20, 2.4.22-ac4 and 2.6.0-
> test7 and all kernels booted smoothly.
>=20
> It's seems that at least in my configuration gcc 3.3.1 is doing a bad=
=20
> job.
>
--=20
Tom

LINUX user since kernel 0.99.x 1994.
RPM Alpha packages at http://alpha.steudten.com/packages




-
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: =?ISO-8859-1?Q?Ra=FAl_Porcel?= <armin76@gentoo.org>
Subject: Fails to build if CONFIG_ALPHA_MARVEL=y && CONFIG_SMP
Date: Sun, 13 Dec 2009 22:33:30 +0100
Message-ID: <4B255DAA.1090902@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org

make -f scripts/Makefile.build obj=arch/alpha/kernel
  gcc -Wp,-MD,arch/alpha/kernel/.time.o.d  -nostdinc -isystem
/usr/lib/gcc/alpha-unknown-linux-gnu/4.3.4/include -Iinclude
-I/home/armin/tmp/linux-2.6.32/arch/alpha/include -include
include/linux/autoconf.h -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes
-Wno-trigraphs -fno-strict-aliasing -fno-common
-Werror-implicit-function-declaration -Wno-format-security
-fno-delete-null-pointer-checks -O2 -pipe -mno-fp-regs -ffixed-8
-msmall-data -fno-jump-tables -mcpu=ev67 -Wa,-mev6 -fno-stack-protector
-fomit-frame-pointer -Wdeclaration-after-statement -Wno-pointer-sign
-fno-strict-overflow -Werror -Wno-sign-compare   -D"KBUILD_STR(s)=#s"
-D"KBUILD_BASENAME=KBUILD_STR(time)"
-D"KBUILD_MODNAME=KBUILD_STR(time)"  -c -o arch/alpha/kernel/.tmp_time.o
arch/alpha/kernel/time.c
In file included from
/home/armin/tmp/linux-2.6.32/arch/alpha/include/asm/rtc.h:14,
                 from arch/alpha/kernel/time.c:49:
include/asm-generic/rtc.h: In function 'get_rtc_ss':
include/asm-generic/rtc.h:205: error: implicit declaration of function
'marvel_get_rtc_time'
make[1]: *** [arch/alpha/kernel/time.o] Error 1
make: *** [arch/alpha/kernel] Error 2

On kernel 2.6.32

From: Paolo Dovera <pdovera@bmind.it>
Subject: linux-2.6.0-test6 error during linking
Date: Sun, 28 Sep 2003 21:55:09 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <3F773C9D.3080009@bmind.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-alpha@vger.kernel.org

Hello,
   I successfully compiled all linux-2.6.0-testx before test6 on RH7.2 
Alpha APX platform

Applied patch-2.6.0-test6 I receive the following error:

[root@alpha linux-2.6.0-test6]# make
make[1]: `arch/alpha/kernel/asm-offsets.s' is up to date.
 CHK     include/linux/compile.h
 GEN     .version
 CHK     include/linux/compile.h
 UPD     include/linux/compile.h
 CC      init/version.o
 LD      init/built-in.o
 LD      .tmp_vmlinux1
kernel/built-in.o(.text+0x480): In function `try_to_wake_up':
: undefined reference to `sched_clock'
kernel/built-in.o(.text+0x484): In function `try_to_wake_up':
: undefined reference to `sched_clock'
kernel/built-in.o(.text+0x140c): In function `schedule':
: undefined reference to `sched_clock'
kernel/built-in.o(.text+0x1410): In function `schedule':
: undefined reference to `sched_clock'
kernel/built-in.o(.text+0x5068): In function `copy_process':
: undefined reference to `sched_clock'
kernel/built-in.o(.text+0x506c): more undefined references to 
`sched_clock' follow
make: *** [.tmp_vmlinux1] Error 1


Do you have some suggestions?

Bye



From: Stefan Wanner <stefan.wanner@postmail.ch>
Subject: 2.6.5-rc3: traps.c does not compile anymore
Date: Sat, 3 Apr 2004 10:53:11 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <55DC60D2-854C-11D8-8FED-000393C43976@postmail.ch>
Mime-Version: 1.0 (Apple Message framework v613)
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-alpha@vger.kernel.org, rth@kanga.twiddle.home

Hello

Upgrading from 2.6.4 to 2.6.5-rc3, arch/alpha/kernel/traps.c does not 
compile anymore. What's wrong?

alpha:~/src/linux-2.6.5-rc3# make
make[1]: `arch/alpha/kernel/asm-offsets.s' is up to date.
   CHK     include/asm-alpha/asm_offsets.h
   CHK     include/linux/compile.h
   CC      arch/alpha/kernel/traps.o
arch/alpha/kernel/traps.c: In function `opDEC_check':
arch/alpha/kernel/traps.c:55: parse error before `['
make[1]: *** [arch/alpha/kernel/traps.o] Error 1
make: *** [arch/alpha/kernel] Error 2
alpha:~/src/linux-2.6.5-rc3#



Regards
Stefan



alpha:~# gcc -v
Reading specs from /usr/lib/gcc-lib/alpha-linux/2.95.4/specs
gcc version 2.95.4 20011002 (Debian prerelease)
alpha:~# ld -v
GNU ld version 2.14.90.0.7 20031029 Debian GNU/Linux


From: "Carl C." <cc@carlc.com>
Subject: Can't build 2.6.0-test(anything)
Date: Mon, 29 Sep 2003 13:17:58 -0400
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <005301c386ad$a13539b0$13942c0a@fhpmfg.com>
References: <001701c386a0$bffc2cd0$020b10ac@pitzeier.priv.at>
Reply-To: "Carl C." <cc@carlc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org

I've been trying to build 2.6.0-test(any-version) on my alphas. I've seen
this problem listed before, I have the following:

sv4:/home/tmp# gcc --version
3.0.4
sv4:/home/tmp# ld --version
GNU ld version 2.14 20030612

But when I do a build of the kernel, I always get this:

sv4:/usr/src/linux# make
make[1]: `arch/alpha/kernel/asm-offsets.s' is up to date.
  CHK     include/linux/compile.h
  GEN     .version
  CHK     include/linux/compile.h
  UPD     include/linux/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
make: *** [.tmp_vmlinux1] Error 139

This happens on both my Debian and RedHat based AXP servers...

Any suggestions?
Carl

====================
http://www.carlc.com/

      "Price, Performance, Quality. Choose any two you like."

From: Bob Tracy <rct@gherkin.frus.com>
Subject: 4.9.0 build error on Alpha
Date: Tue, 13 Dec 2016 08:07:10 -0600
Message-ID: <20161213140710.GA18471@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

Got all the way to the end of the 4.9-final kernel build, and ran into the
following:

  LD      init/built-in.o
arch/alpha/lib/lib.a(strcat.o): In function `strcat':
(.text+0x60): relocation truncated to fit: BRADDR against symbol `__stxcpy' defined in .text section in arch/alpha/lib/lib.a(stxcpy.o)
arch/alpha/lib/lib.a(strncat.o): In function `strncat':
(.text+0x60): relocation truncated to fit: BRADDR against symbol `__stxncpy' defined in .text section in arch/alpha/lib/lib.a(stxncpy.o)
Makefile:969: recipe for target 'vmlinux' failed
make: *** [vmlinux] Error 1

I didn't try building any of the 4.9 release candidates, so I have no
idea where this issue was introduced except to say 4.8 built fine.

Toolchain is currently as follows, and note that "binutils" was upgraded
within the past 24 hours, i.e., while the kernel build was in progress:

gcc version 6.2.1 20161124
binutils 2.27.51.20161212

--Bob

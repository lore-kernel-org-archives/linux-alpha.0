From: Bob Tracy <rct@gherkin.frus.com>
Subject: [BUG] 4.9.0 build error on Alpha
Date: Thu, 29 Dec 2016 21:08:46 -0600
Message-ID: <20161230030846.GA25929@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: debian-alpha@lists.debian.org, mcree@orcon.net.nz, mattst88@gmail.com, rth@twiddle.net

I'm guessing this is Alpha-specific at the moment, because I'm getting a
world-class lettin' alone from the kernel developers.

Saw another binutils update come through a couple of days ago, so tried
another from-scratch kernel build.  No change in the outcome.  This
"smells" like a gcc or binutils issue, because the Alpha-specific code
being compiled and linked against hasn't changed in a very long time.
Both "strcat" and "stxcpy" come from assembly language source files in
the "arch/alpha/lib" directory.

In addition to trying new toolchain components as updates appear, I've
tried making various changes to my kernel configuration in an attempt to
make the problem move to a different place in the build process or go
away entirely.  Nothing has had any effect whatsoever.

I would reluctantly try downgrading gcc to version 4.x if someone
thought that might make any difference.  I'd rather identify how the
current toolchain is going off in the weeds, if that's what is going on
here.

>   LD      init/built-in.o
> arch/alpha/lib/lib.a(strcat.o): In function `strcat':
> (.text+0x60): relocation truncated to fit: BRADDR against symbol `__stxcpy' defined in .text section in arch/alpha/lib/lib.a(stxcpy.o)
> arch/alpha/lib/lib.a(strncat.o): In function `strncat':
> (.text+0x60): relocation truncated to fit: BRADDR against symbol `__stxncpy' defined in .text section in arch/alpha/lib/lib.a(stxncpy.o)
> Makefile:969: recipe for target 'vmlinux' failed
> make: *** [vmlinux] Error 1

--Bob

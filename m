From: Bob Tracy <rct@gherkin.frus.com>
Subject: [BUG] 4.13.0 kernel build error on Alpha
Date: Sun, 10 Sep 2017 17:34:18 -0500
Message-ID: <20170910223418.GA22820@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-alpha@lists.debian.org
Cc: linux-alpha@vger.kernel.org, mcree@orcon.net.nz, mattst88@gmail.com, deller@gmx.de, macro@linux-mips.org

Here we go again :-(.  Tool versions as follows:

gcc version 7.2.0 (Debian 7.2.0-3)
GNU ld (GNU Binutils for Debian) 2.29 (binutils 2.29-9)

Note evidence of the ".alphalib" section patch first tried with the 4.9
kernel source.  It has worked well up through 4.12.  I didn't try
building any of the 4.13 release candidates because of all the compiler
updates that came through during that time.

  MODPOST vmlinux.o
WARNING: EXPORT symbol "callback_setenv" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "strrchr" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__divl" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__divqu" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__memsetw" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "strchr" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__reml" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "strcat" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__copy_user" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__remq" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "clear_page" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "strncpy" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "memmove" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__remqu" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "memchr" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__memset" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "copy_page" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__divlu" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "strlen" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "strncat" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "callback_save_env" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "memset" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: "saved_config" [vmlinux] is COMMON symbol
WARNING: EXPORT symbol "__clear_user" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "callback_getenv" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__divq" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "strcpy" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "___memset" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__remlu" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "csum_ipv6_magic" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: EXPORT symbol "__constant_c_memset" [vmlinux] version generation failed, symbol will not be versioned.
WARNING: modpost: Found 24 section mismatch(es).
To see full details build your kernel with:
'make CONFIG_DEBUG_SECTION_MISMATCH=y'
arch/alpha/lib/memmove.o: In function `memmove':
(.alphalib+0x2c): relocation truncated to fit: BRSGP against symbol `memcpy' defined in .text section in arch/alpha/lib/memcpy.o
Makefile:1000: recipe for target 'vmlinux' failed
make: *** [vmlinux] Error 1


From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: 4.9.0 build error on Alpha
Date: Wed, 14 Dec 2016 17:40:22 -0600
Message-ID: <20161214234022.GA27406@gherkin.frus.com>
References: <20161213140710.GA18471@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161213140710.GA18471@gherkin.frus.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org, mcree@orcon.net.nz, mattst88@gmail.com

Quick followup: tried another "from scratch" build with a stable
compilation environment.  No difference.  Current gcc and binutils
versions are as follows:

gcc version 6.2.1 20161212 (Debian 6.2.1-6)
GNU ld (GNU Binutils for Debian) 2.27.51.20161212

As always, thanks in advance for any help in resolving this.

--Bob

On Tue, Dec 13, 2016 at 08:07:10AM -0600, Bob Tracy wrote:
> Got all the way to the end of the 4.9-final kernel build, and ran into the
> following:
> 
>   LD      init/built-in.o
> arch/alpha/lib/lib.a(strcat.o): In function `strcat':
> (.text+0x60): relocation truncated to fit: BRADDR against symbol `__stxcpy' defined in .text section in arch/alpha/lib/lib.a(stxcpy.o)
> arch/alpha/lib/lib.a(strncat.o): In function `strncat':
> (.text+0x60): relocation truncated to fit: BRADDR against symbol `__stxncpy' defined in .text section in arch/alpha/lib/lib.a(stxncpy.o)
> Makefile:969: recipe for target 'vmlinux' failed
> make: *** [vmlinux] Error 1

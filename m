From: Thorsten Kranzkowski <dl8bcu@dl8bcu.de>
Subject: Re: BRSGP relocation truncations in linking kernel for Alpha.
Date: Tue, 25 Oct 2016 20:01:36 +0000
Message-ID: <20161025200136.GA8822@Marvin.DL8BCU.ampr.org>
References: <20161022024044.vbfxx4o2rrkwc7gy@tower>
 <580E7616.2020806@gmx.de>
 <65016d6a-3e42-a493-8765-aef683fde537@twiddle.net>
Reply-To: dl8bcu@dl8bcu.de
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <65016d6a-3e42-a493-8765-aef683fde537@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Helge Deller <deller@gmx.de>, Michael Cree <mcree@orcon.net.nz>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>

On Mon, Oct 24, 2016 at 08:13:22PM -0700, Richard Henderson wrote:
> On 10/24/2016 01:59 PM, Helge Deller wrote:
> >Does it only happens for __copy_user() ?
> >If yes, I assume the problem happens because of __copy_tofrom_user_nocheck() in
> >uaccess.h is always inlined. Maybe un-inlining helps?
> >Or, the inline-assembly for jsr/bsr needs tweeking ?
> 
> Indeed.  Try changing #ifdef MODULE above __copy_tofrom_user_nocheck to #if 1.

That makes the BRSGP issue go away for me as well. Yippie! It was a 
long-standing nuisance for me.


Now I only have this one left:

  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  LD      init/built-in.o
arch/alpha/lib/lib.a(strcat.o): In function `strcat':
(.text+0x60): relocation truncated to fit: BRADDR against symbol `__stxcpy' defined in .text section in arch/alpha/lib/lib.a(ev6-stxcpy.o)
arch/alpha/lib/lib.a(strncat.o): In function `strncat':
(.text+0x60): relocation truncated to fit: BRADDR against symbol `__stxncpy' defined in .text section in arch/alpha/lib/lib.a(ev6-stxncpy.o)
make[1]: *** [vmlinux] Error 1
make[1]: Leaving directory `/usr/src/linux-ds20'
make: *** [sub-make] Error 2

Anything for me to try? 


Thanks,
Thorsten

-- 
| Thorsten Kranzkowski        Internet: dl8bcu@dl8bcu.de                      |
| Mobile: ++49 170 1876134       Snail: Kiebitzstr. 14, 49324 Melle, Germany  |
| Ampr: dl8bcu@db0lj.#rpl.deu.eu, dl8bcu@marvin.dl8bcu.ampr.org [44.130.8.19] |

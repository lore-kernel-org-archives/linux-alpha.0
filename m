From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [BUG] 4.9.0 build error on Alpha
Date: Sun, 1 Jan 2017 08:38:51 +1300
Message-ID: <20161231193851.GA214@cree-lap.Home>
References: <20161230030846.GA25929@gherkin.frus.com>
 <CAEdQ38EX1rmir0bbY+S-QMfepyBsUJ1uEUjP3A76z8NF5dyrhA@mail.gmail.com>
 <20161230033747.GB26007@gherkin.frus.com>
 <alpine.LFD.2.20.1612301554130.1811@eddie.linux-mips.org>
 <3a3389e5-e6f5-5ec3-ca26-762162d2a4ac@gmx.de>
 <20161231064337.GA3209@gherkin.frus.com>
 <20161231072032.GA3544@gherkin.frus.com>
 <alpine.LFD.2.20.1612310907560.1811@eddie.linux-mips.org>
 <20161231152037.GA4896@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161231152037.GA4896@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: "Maciej W. Rozycki" <macro@linux-mips.org>, Helge Deller <deller@gmx.de>, Matt Turner <mattst88@gmail.com>, linux-alpha <linux-alpha@vger.kernel.org>, Debian Alpha Mailing List <debian-alpha@lists.debian.org>, Richard Henderson <rth@twiddle.net>

On Sat, Dec 31, 2016 at 09:20:37AM -0600, Bob Tracy wrote:
> On Sat, Dec 31, 2016 at 10:11:45AM +0000, Maciej W. Rozycki wrote:
> > (...) 
> >  You need to keep the `*(.alphalib)' line only, i.e. drop the first and 
> > the last line added by the patch, as the output section statement and its 
> > curly braces surrounding input section specifiers are already produced 
> > elsewhere.
> > (...)
> 
> Thought to try this, but, bad news.
> 
> With '.section .alphalib,"ax"' added to the top of "arch/alpha/lib/*.S"
> (below opening comment block, if present, but prior to any include directives),
> and the modified patch to "arch/alpha/kernel/vmlinux.lds.S", I now get
> multiple relocation errors as follows:
> 
>   LD      init/built-in.o
> arch/alpha/lib/lib.a(strcat.o): In function `strcat':
> (.text+0x60): relocation truncated to fit: BRADDR against symbol `__stxcpy' defined in .text section in arch/alpha/lib/lib.a(stxcpy.o)
> arch/alpha/lib/lib.a(strncat.o): In function `strncat':
> (.text+0x60): relocation truncated to fit: BRADDR against symbol `__stxncpy' defined in .text section in arch/alpha/lib/lib.a(stxncpy.o)
> drivers/built-in.o: In function `radeon_cs_parser_init.part.4':
> drivers/gpu/drm/radeon/radeon_cs.o:(.text+0x119bd0): relocation truncated to fit: BRSGP against symbol `__copy_user' defined in .alphalib section in arch/alpha/lib/lib.a(copy_user.o)

Try changing the #ifdef MODULE above __copy_tofrom_user_nocheck to
#if 1 in uaccess.h.   That should fix the copy_user relocation errors.

Cheers
Michael.

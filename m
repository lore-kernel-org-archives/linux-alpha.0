From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: [BUG] 4.13.0 kernel build error on Alpha
Date: Sun, 10 Sep 2017 22:16:41 -0500
Message-ID: <20170911031641.GA26870@gherkin.frus.com>
References: <20170910223418.GA22820@gherkin.frus.com>
 <CAEdQ38HPnhBF9HBmgibrgoFxQheuHr7Mn+FYd=keTyQNeL_AOA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEdQ38HPnhBF9HBmgibrgoFxQheuHr7Mn+FYd=keTyQNeL_AOA@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Debian Alpha Mailing List <debian-alpha@lists.debian.org>, linux-alpha <linux-alpha@vger.kernel.org>, Michael Cree <mcree@orcon.net.nz>, Helge Deller <deller@gmx.de>, "Maciej W. Rozycki" <macro@linux-mips.org>

On Sun, Sep 10, 2017 at 07:59:40PM -0700, Matt Turner wrote:
> On Sun, Sep 10, 2017 at 3:34 PM, Bob Tracy <rct@gherkin.frus.com> wrote:
> > Here we go again :-(.  Tool versions as follows:
> >
> > gcc version 7.2.0 (Debian 7.2.0-3)
> > GNU ld (GNU Binutils for Debian) 2.29 (binutils 2.29-9)
> >
> > Note evidence of the ".alphalib" section patch first tried with the 4.9
> > kernel source.  It has worked well up through 4.12.  I didn't try
> > building any of the 4.13 release candidates because of all the compiler
> > updates that came through during that time.
> >
> >   MODPOST vmlinux.o
> > WARNING: EXPORT symbol "callback_setenv" [vmlinux] version generation failed, symbol will not be versioned.
> > (...)
> > WARNING: modpost: Found 24 section mismatch(es).
> > To see full details build your kernel with:
> > 'make CONFIG_DEBUG_SECTION_MISMATCH=y'
> 
> All of this is fixed by
> 
> commit 873f9b5bcbf27f6e89e1879714abe4532cacf5d7
> Author: Ben Hutchings <ben@decadent.org.uk>
> Date:   Wed Jul 19 01:01:16 2017 +0100
> 
>     alpha: Restore symbol versions for symbols exported from assembly

I guess that commit hasn't made it into Linus' tree :-(.  If the patch
is short, please forward if you would be so kind.  Many thanks in
advance.

> > arch/alpha/lib/memmove.o: In function `memmove':
> > (.alphalib+0x2c): relocation truncated to fit: BRSGP against symbol `memcpy' defined in .text section in arch/alpha/lib/memcpy.o
> > Makefile:1000: recipe for target 'vmlinux' failed
> > make: *** [vmlinux] Error 1
> 
> I have not yet seen this.

I *think* what I want to do is the equivalent of the ".S" file
'.text --> .section .alphalib,"ax"' substitution for the affected ".c"
files in "arch/alpha/lib".  At the risk of baring my ignorance to the
world, is there a straightforward way of accomplishing that?  The
"objdump" tool confirms it's not a strict renaming of one section
to another: the ".text" section still exists in the compiled ".S"
files that were patched.

--Bob

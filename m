From: Finn Thain <fthain@linux-m68k.org>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
Date: Sun, 8 May 2022 09:59:37 +1000 (AEST)
Message-ID: <6f33385-5612-7042-e1b3-aa32895e91e0@linux-m68k.org>
References: <20220505195342.GA509942@bhelgaas> <22bec167-241f-2cbe-829f-a3f65e40e71@linux-m68k.org> <105ccec439f709846e82b69cb854ac825d7a6a49.camel@linux.ibm.com> <7dfa7578-039-e132-c573-ad89bd3215@linux-m68k.org>
 <CAK8P3a3tds8O+Gg2nF3MfrVVcmtLbtdQ2TnCJaDYz28cyhhWkg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651967990; x=
        1651975190; bh=QTgRzNLqn7nTVpn4kEmk9hjonN4SIouDolNH8iVgiLs=; b=x
        yhXwE5TnGDXuuNwf54vPo1myGUH3NoA0fbqOh35QFU69RQVVilaeCqHjF4940KGW
        ObQCxFRPvPnismpi8nsZySyqcbu72zxQxx+eLsmlVQKIh8aN2Mac6nsj6wtJHNaa
        EWebIh9iDQOmBp75hegASiIr+LraEUUQQHN/TtU/mWjGf1OH5vKlxzYzxlEy7B7g
        r9dNK0XzD7Za9S2u8mjB85p/tkE3XYzle24fsW3pI/MrTI6I58Jqfuh35WmmvmRE
        GBFK1VnfhrO5G5PO+YBhtHiXZgJ/7MTB3Wjzi80yCETO2PpoyypGdjh7Dig1WtGZ
        y+/DWCIgG0ZchwYn4Uebg==
In-Reply-To: <CAK8P3a3tds8O+Gg2nF3MfrVVcmtLbtdQ2TnCJaDYz28cyhhWkg@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@kernel.org>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael


Hi Arnd,

On Sat, 7 May 2022, Arnd Bergmann wrote:

> On Sat, May 7, 2022 at 2:01 AM Finn Thain <fthain@linux-m68k.org> wrote:
> > On Fri, 6 May 2022, Niklas Schnelle wrote:
> > > On Fri, 2022-05-06 at 19:12 +1000, Finn Thain wrote:
> > > > On Thu, 5 May 2022, Bjorn Helgaas wrote:
> > > > >
> > > > > I mooted a s390 inb() implementation like "return ~0" because that's
> > > > > what happens on most arches when there's no device to respond to the
> > > > > inb().
> > > > >
> > > > > The HAS_IOPORT dependencies are fairly ugly IMHO, and they clutter
> > > > > drivers that use I/O ports in some cases but not others.  But maybe
> > > > > it's the most practical way.
> > > > >
> > > >
> > > > Do you mean, "the most practical way to avoid a compiler warning on
> > > > s390"? What about "#pragma GCC diagnostic ignored"?
> > >
> > > This actually happens with clang.
> >
> > That suggests a clang bug to me. If you believe GCC should behave like
> > clang, then I guess the pragma above really is the one you want. If you
> > somehow feel that the kernel should cater to gcc and clang even where they
> > disagree then you would have to use "#pragma clang diagnostic ignored".
> 
> I don't see how you can blame the compiler for this. On architectures
> with a zero PCI_IOBASE, an inb(0x2f8) literally becomes
> 
>         var = *(u8*)((NULL + 0x2f8);
> 
> If you run a driver that does this, the kernel gets a page fault for
> the NULL page
> and reports an Oops. clang tells you 'warning: performing pointer
> arithmetic on a null pointer has undefined behavior', which is not exactly
> spot on, but close enough to warn you that you probably shouldn't do this. gcc
> doesn't warn here, but it does warn about an array out-of-bounds access when
> you pass such a pointer into memcpy or another string function.
> 

The appeal to UB is weak IMHO. Pointer arithmetic with a zero value is 
unambiguous and the compiler generates the code to implement the expected 
behaviour just fine.

UB is literally an omission in the standard. Well, low level programming 
has always been beyond the scope of C standards. If architectural-level 
code wants to do arithmetic with an arbitrary integer values, and the 
compiler doesn't like it, then the relevant warnings should be disabled 
for those expressions.

> > > Apart from that, I think this would also fall under the same argument as
> > > the original patch Linus unpulled. We would just paint over someting
> > > that we know at compile time won't work:
> > >
> > > https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
> > >
> >
> > I wasn't advocating adding any warnings.
> >
> > If you know at compile time that a driver won't work, the usual solution
> > is scripts/config -d CONFIG_SOME_UNDESIRED_DRIVER. Why is that no
> > longer appropriate for drivers that use IO ports?
> 
> This was never an option, we rely on 'make allmodconfig' to build 
> without warnings on all architectures for finding regressions.

"All modules on all architectures with all compilers and checkers with all 
warnings enabled"? That's not even vaguely realistic.

How about, "All modules on all architectures with a nominated compiler 
with the appropriate warnings enabled."

> Any driver that depends on architecture specific interfaces must not get 
> selected on architectures that don't have those interfaces.
> 

Kconfig always met that need before we got saddled with -Werror.

That suggests to me that we need a "bool CONFIG_WARINGS_INTO_ERRORS" to 
control -Werror, which could be disabled for .config files (like make 
allmodconfig) where it is not helping.

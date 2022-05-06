From: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
Date: Fri, 06 May 2022 11:38:52 +0200
Message-ID: <157602011a72061dd31f92bd699e8c1f9a81c988.camel@linux.ibm.com>
References: <20220505195342.GA509942@bhelgaas>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ATADAeU7AzydfhIN4/8/97TK5dyqxtus7XYokE/Psd4=;
 b=Jcy81Rkmal8Ld6yZwfu+2ng9HRucfxxxvmTh1NcKgDURoKFNvKpcm1ZHWAW9Ir4VsKXR
 pd2y9S2Hvk8+LLCXqCCGIlcAHnksaOG7x62nNIk7f9u5OsqdJlmnp7qjrs5zh8BXekJW
 UxLN/+RAJYjcDJLpHGe/XPvOzrvx5TmFwBMZ5C22DhmJMbWejrrQcvD8oXjVn2NCDlpv
 QlIXdMIK26thZIaJjEsL3zoyAVmuJWopg/ichRaLmBnr8LBayjLn4CEljPGJtUz3/LBw
 0D355aTEY3BPvr5wc49SyvN85iKKd7lM1rKR9YtXX8gl85JhRC5yd6ytJiuTYFSjc6G8 Cw== 
In-Reply-To: <20220505195342.GA509942@bhelgaas>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
To: Bjorn Helgaas <helgaas@kernel.org>, Arnd Bergmann <arnd@kernel.org>, John Garry <john.garry@huawei.com>
Cc: Rich Felker <dalias@libc.org>, "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>, "open list:SUPERH" <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>, "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pci <linux-pci@vger.kernel.org>, Matt Turner <mattst88@gm>

On Thu, 2022-05-05 at 14:53 -0500, Bjorn Helgaas wrote:
> On Thu, May 05, 2022 at 07:39:42PM +0200, Arnd Bergmann wrote:
> > On Thu, May 5, 2022 at 6:10 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Wed, May 04, 2022 at 11:31:28PM +0200, Arnd Bergmann wrote:
> > > > The main goal is to avoid c), which is what happens on s390, but
> > > > can also happen elsewhere. Catching b) would be nice as well,
> > > > but is much harder to do from generic code as you'd need an
> > > > architecture specific inline asm statement to insert a ex_table
> > > > fixup, or a runtime conditional on each access.
> > > 
> > > Or s390 could implement its own inb().
> > > 
> > > I'm hearing that generic powerpc kernels have to run both on machines
> > > that have I/O port space and those that don't.  That makes me think
> > > s390 could do something similar.
> > 
> > No, this is actually the current situation, and it makes absolutely no
> > sense. s390 has no way of implementing inb()/outb() because there
> > are no instructions for it and it cannot tunnel them through a virtual
> > address mapping like on most of the other architectures. (it has special
> > instructions for accessing memory space, which is not the same as
> > a pointer dereference here).
> > 
> > The existing implementation gets flagged as a NULL pointer dereference
> > by a compiler warning because it effectively is.
> 
> I think s390 currently uses the inb() in asm-generic/io.h, i.e.,
> "__raw_readb(PCI_IOBASE + addr)".  I understand that's a NULL pointer
> dereference because the default PCI_IOBASE is 0.
> 
> I mooted a s390 inb() implementation like "return ~0" because that's
> what happens on most arches when there's no device to respond to the
> inb().
> 
> The HAS_IOPORT dependencies are fairly ugly IMHO, and they clutter
> drivers that use I/O ports in some cases but not others.  But maybe
> it's the most practical way.
> 
> Bjorn

I fear such stubs are kind of equivalent to my previous patch doing the
same in asm-generic/io.h that was pulled and then unpulled by Linus.
Maybe it would be slightly different if instead of a warning outX()
would just be a NOP and inX() just returned ~0 but we're in essence
pretending that we have these functions when we know they are nonsense.

Another argument I see is that as shown by POWER9 we might start to see
more platforms that just can't do I/O port access. E.g. I would also be
surprised if Apple's M1 has I/O port access. Sooner or later I expect
distributions on some platforms to only support such systems. For
example on ppc a server distribution might only support IBM POWER
without I/O port support before too long. Then having HAS_IOPORT allows
to get rid of drivers that won't work anyway.

There are also reports of probing a driver with I/O ports causing a
system crash on systems without I/O port support. For example in this
answer by John Garry (added so he may supply more information):

https://lore.kernel.org/lkml/db043b76-880d-5fad-69cf-96abcd9cd34f@huawei.com/


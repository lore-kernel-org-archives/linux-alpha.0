From: Finn Thain <fthain@linux-m68k.org>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
Date: Fri, 6 May 2022 19:12:06 +1000 (AEST)
Message-ID: <22bec167-241f-2cbe-829f-a3f65e40e71@linux-m68k.org>
References: <20220505195342.GA509942@bhelgaas>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651828333; x=
 1651835533; bh=G6gyLdn77rvfE254bKTLUge+Op3KXd37yTLdohreqqM=; b=v
 QKeAQx1x9oi9rnTQnxWzQZ3vTa1sCKU3qAfK8BUdnTNglj/iKAYlugS8ZO/zk5fZ
 DfF7J1EiEgVn1bVYrjCqLYS3iirT+M/yZbaX7X/uei2Gb3LNEQ7gNa/6aO4lyi6K
 Tt7s1lCuwd/NrqgJIxoWaYMl29GOUzitCCOr5c2z9gRbiPjvVQLp/zABVxIqq2ZK
 AaY9nkTVzG/mRRGYLVAR8bBcR5nX8PaiHT4MAiZq+H0Xwj5TbLVla4dy88/3+1AN
 1wI0EAxFufJY3W8/p05bkAWVyXVer+YeXe+Ib7meLr1qgWB/FfkXpkAKjyHMQsJ3
 7g4mWCiNAG2aqihJux0IA==
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
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Rich Felker <dalias@libc.org>, "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>, "open list:SUPERH" <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>, "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pci <linux-pci@vger.kernel.org>, Matt Turner <mattst88@gm>



On Thu, 5 May 2022, Bjorn Helgaas wrote:

> On Thu, May 05, 2022 at 07:39:42PM +0200, Arnd Bergmann wrote:
> > On Thu, May 5, 2022 at 6:10 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Wed, May 04, 2022 at 11:31:28PM +0200, Arnd Bergmann wrote:
> > > >
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

Do you mean, "the most practical way to avoid a compiler warning on s390"? 
What about "#pragma GCC diagnostic ignored"?

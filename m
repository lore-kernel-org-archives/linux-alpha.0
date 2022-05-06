From: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
Date: Fri, 6 May 2022 14:53:49 +0200
Message-ID: <CAK8P3a0EMK0gHOmb-jvtfVLb1dun72kYUMKpb11T_GgXiuR9Mw@mail.gmail.com>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
 <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWAzGX7KR0RKXdAzDuKtOnEjIrMXHGWQRAuYkLL7xbQ=; b=45IqcnpDExlDM5
	JyFwgbMa0L6O8eUHaylNj/3hboUTqQU3d6RCM5IWfVU8C94SOXqggyzTkRqeIqC7uvZKxqIM8be1Z
	6126AkbC9euqOJYnG6jr/Gzh64FYQaoxHrA9HedgQwKbQnb/8+QR46eyUAooQ5avci3JT1AMf7SQf
	voardnN52pieLJJAiYvemCTglF6JGpQWkN+iUJlUMVIGHF/jYfKKDWDi1CMeHcXmAxyjmCOeiIp6w
	qVcnUFyTln+I3fAShxjVsfn/dxOmgpI/xalvRva/ydKe3P0EA2aQz8+CxomsT7x1neBd0kwb9ctwT
	Sy5Jpd1mF6qDySjk349A==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651841658;
 bh=YEsptMS5NZ5sU5R8sBoFFmT8HhhJmSMOqqqMD1wS+1Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=maE6/GoVFXRZNf7dfZPTVoMAWc6wGTVVX44qiwcwuwtsWpQr1FqM/jmMrvvkc1w0m
 /fdrsFTDKxwRvNHNK/1DjgM5J06h70STrSIQAvZkM2OfQAHM0wNC1NP2CMvk75VZVN
 fLTHzZWHgk6Ekdl8uTqjvomjFVgaGddUTcd5lXXPSGhuZCW4nb8nI7JlnC3De74LHw
 WbtQuRK6IFfQaU8R1z+FNZAwJdGy2thD1f0VJD8T7C7xV2945L8kQS1Sga76wR3MHB
 DhKSaRYVUK6746o5RiRAERN5HNbHvcEPu7PKSGLVz3w/nrBuDtObHLXaQUIxo+NIPv
 Ke+TQ+7Lj2NdQ==
In-Reply-To: <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane-mx.org@lists.infradead.org
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <>

On Fri, May 6, 2022 at 2:27 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> On Fri, 6 May 2022, Arnd Bergmann wrote:
>
> > >  If this is PCI/PCIe indeed, then an I/O access is just a different bit
> > > pattern put on the bus/in the TLP in the address phase.  So what is there
> > > inherent to the s390 architecture that prevents that different bit pattern
> > > from being used?
> >
> > The hardware design for PCI on s390 is very different from any other
> > architecture, and more abstract. Rather than implementing MMIO register
> > access as pointer dereference, this is a separate CPU instruction that
> > takes a device/bar plus offset as arguments rather than a pointer, and
> > Linux encodes this back into a fake __iomem token.
>
>  OK, that seems to me like a reasonable and quite a clean design (on the
> hardware side).
>
>  So what happens if the instruction is given an I/O rather than memory BAR
> as the relevant argument?  Is the address space indicator bit (bit #0)
> simply ignored or what?

Not sure. My best guess is that it would actually work as you'd expect,
but is deliberately left out of the architecture specification so they don't
have to to validate the correctness.  Note that only a small number of
PCIe cards are actually supported by IBM, and I think the firmware
only passes devices to the OS if they are whitelisted.

        Arnd

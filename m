From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 02/10] ARM: disable CONFIG_IDE in footbridge_defconfig
Date: Mon, 22 Mar 2021 15:15:03 +0000
Message-ID: <20210322151503.GX1463@shell.armlinux.org.uk>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk>
 <20210319175311.GW1463@shell.armlinux.org.uk>
 <20210322145403.GA30942@lst.de>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7sVj0zne5uraXbQ//kjYO0Rg5Vmtx7bRBUHhpcOjtWQ=; b=19LPYNE1An4Vq30ymjKPv1ir4
 1N4WZ2NotgqYRXFLxWXnEwIwOV0dUrwCADfnIpw65dBPGGRlqgtjlmDZdpZomzdLoTuQSl1zDGFz2
 MQoxJBg0Tjirj7DxXvGfAOsY45sTY60WYtj/ecWab2d57FCLJMv9NjFZCP7xSvzUijmP/FKbBRfBF
 9frim2m7D7TXIeBRPC8bWx0zyxVBpOhiLY8IQtB/VG8Cs+13h5Nv+kRwQVEGCx3dN0i5MwO5C3Kbt
 gNbXO/w+hnl+ZIPO3hxWwCgR4bNb8EaXvi4pXvLw5+FMwe3PVnYHuypHBWrF6eQ9PT3wPT/4kHFZ2
 jycH0GUEg==;
Content-Disposition: inline
In-Reply-To: <20210322145403.GA30942@lst.de>
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
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>

On Mon, Mar 22, 2021 at 03:54:03PM +0100, Christoph Hellwig wrote:
> On Fri, Mar 19, 2021 at 05:53:12PM +0000, Russell King - ARM Linux admin wrote:
> > If I extend the arch/arm/kernel/bios32.c code to kill BARs 2/3 (which
> > actually are not present on the CY82C693) then the IDE driver works
> > for me, but the PATA driver does not:
> > 
> > cy82c693 0000:00:06.1: IDE controller (0x1080:0xc693 rev 0x00)
> > cy82c693 0000:00:06.1: not 100% native mode: will probe irqs later
> > legacy IDE will be removed in 2021, please switch to libata
> > Report any missing HW support to linux-ide@vger.kernel.org
> >     ide0: BM-DMA at 0x1080-0x1087
> >     ide1: BM-DMA at 0x1088-0x108f
> > Probing IDE interface ide0...
> > hda: PIONEER DVD-RW DVR-105, ATAPI CD/DVD-ROM drive
> > hda: host max PIO4 wanted PIO255(auto-tune) selected PIO4
> > ...
> > 
> > (unbind Cypress_IDE and try binding pata_cypress)
> > 
> > pata_cypress 0000:00:06.1: no available native port
> 
> This comes from ata_pci_sff_init_host when it tails to initialize
> a port.  There are three cases why it can't initialize the port:
> 
>  1) because it is marked as dummy, which is the case for the second
>     port of the cypress controller, but you're not using that even
>     with the old ide driver, and we'd still not get that message just
>     because of that second port.
>  2) when ata_resources_present returns false because the BAR has
>     a zero start or length
>  3) because pcim_iomap_regions() fails.  This prints a warning to the
>     log ("failed to request/iomap BARs for port %d (errno=%d)") that you
>     should have seen
> 
> So the problem here has to be number two.  The legacy ide driver OTOH
> seems to lack a lot of these checks, although I'm not sure how it
> manages to actually work without those.
> 
> Can you show how the BAR assignment for the device looks using lscpi
> or a tool of your choice?

There's a big problem here. I have to explicitly zero the resources
(getting rid of the legacy ones assigned by the PCI probe code)
because they are in fact _wrong_ for the CY82C693. The PCI code
assumes that PCI function 1 (primary port) and PCI function 2
(secondary port) are two independent dual-channel IDE ports, and
as the PROG-IF of the class code indicates that all ports are in
legacy mode, the PCI code assigns the legacy ioport resources to
_both_ PCI functions. Essentially, the CY82C693 is a bit of an odd-ball
because it splits the two IDE ports across two functions rather than a
single function.

It gets worse than that though - due to a change to remove
pcibios_min_io from the generic code, moving it into the ARM
architecture code, this has caused a regression that prevents the
legacy resources being registered against the bus resource. So even
if they are there, they cause probe failures. I haven't found a
reasonable way to solve this yet, but until there is, there is no
way that the PATA driver can be used as the "legacy mode" support
is effectively done via the PCI code assigning virtual IO port
resources.

I'm quite surprised that the CY82C693 even works on Alpha - I've
asked for a lspci for that last week but nothing has yet been
forthcoming from whoever responded to your patch for Alpha - so I
can't compare what I'm seeing with what's happening with Alpha.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

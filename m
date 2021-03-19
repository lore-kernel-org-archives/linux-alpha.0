From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 02/10] ARM: disable CONFIG_IDE in footbridge_defconfig
Date: Fri, 19 Mar 2021 17:53:12 +0000
Message-ID: <20210319175311.GW1463@shell.armlinux.org.uk>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5b5bolNJYoHvpbguUfHCrjOiVB1eiZ/SyLUPdIsBqrE=; b=fapckYyyVxKxd05dheNDlrTlv
 uFcmGtMwFwzwBPEbnfZHhBlGlW9zqTLadk1HYzxRYAwklFLtV9Ox76oL3XfZFqn6UE1mg/IROkVj3
 79f+WCg+fD7E2jnn1NqHDS3WGxIyuIatzqJmPNCsZxFSkCBNJu9EFI0JI2gN0m43clGoTG/R0W/fh
 oEixbjDCYeE7nceZZwUWWrI/Ve1MweoQ8ZXHSGEwt/4o53r61OjolSZJcVNk3E10ogAN9vvDsQqgy
 MhUzclWSUDU/yZFF8vu1i02HG9tGrP42frcpWnKzo5X6m8xslMqMzvtfBYxMIR2nmTOd6rlatvgWI
 vvWNoMRwA==;
Content-Disposition: inline
In-Reply-To: <20210319170753.GV1463@shell.armlinux.org.uk>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>

On Fri, Mar 19, 2021 at 05:07:53PM +0000, Russell King - ARM Linux admin wrote:
> On Thu, Mar 18, 2021 at 05:56:58AM +0100, Christoph Hellwig wrote:
> > footbridge_defconfig enables CONFIG_IDE but no actual host controller
> > driver, so just drop it.
> 
> I have been using the Cypress 82C693 IDE driver on Footbridge for a
> CD ROM drive, and I know it doesn't work with the PATA driver - as
> I need to disable BM DMA, otherwise the 82C693/DC21285 combination
> deadlocks the PCI bus. The PATA driver doesn't support disabling
> BM DMA without disabling it for all PATA ports, which is really
> annoying for my IT821x card in the same machine.
> 
> So, I'm rather stuck using the PATA driver for the HDDs and the
> IDE driver for the CD ROM.
> 
> That said, a commit a while back "cleaning up" the PCI layer appears
> to have totally shafted the 82C693, as the kernel tries to request
> IO resources at the legacy IDE addresses against the PCI bus resource
> which only covers 0x1000-0xffff. Hence, the 82C693 IDE ports are non-
> functional at the moment.
> 
> I'm debating about trying to find a fix to the PCI breakage that was
> introduced by "ARM: move PCI i/o resource setup into common code".
> 
> I hadn't noticed it because I don't use the CD ROM drive very often,
> and I don't upgrade the kernel that often either on the machine -
> but it has been running 24x7 for almost two decades.

Okay, a bit more on this...

If I extend the arch/arm/kernel/bios32.c code to kill BARs 2/3 (which
actually are not present on the CY82C693) then the IDE driver works
for me, but the PATA driver does not:

cy82c693 0000:00:06.1: IDE controller (0x1080:0xc693 rev 0x00)
cy82c693 0000:00:06.1: not 100% native mode: will probe irqs later
legacy IDE will be removed in 2021, please switch to libata
Report any missing HW support to linux-ide@vger.kernel.org
    ide0: BM-DMA at 0x1080-0x1087
    ide1: BM-DMA at 0x1088-0x108f
Probing IDE interface ide0...
hda: PIONEER DVD-RW DVR-105, ATAPI CD/DVD-ROM drive
hda: host max PIO4 wanted PIO255(auto-tune) selected PIO4
...

(unbind Cypress_IDE and try binding pata_cypress)

pata_cypress 0000:00:06.1: no available native port


-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 02/10] ARM: disable CONFIG_IDE in footbridge_defconfig
Date: Mon, 22 Mar 2021 16:59:56 +0000
Message-ID: <20210322165956.GY1463@shell.armlinux.org.uk>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk>
 <20210319175311.GW1463@shell.armlinux.org.uk>
 <20210322145403.GA30942@lst.de>
 <20210322151503.GX1463@shell.armlinux.org.uk>
 <20210322151823.GA2764@lst.de>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/wzJhKM6WR08BxO9Rx9F+4jrBkWZ2G6YTLOBTI0aOD0=; b=UkTSwJFrJA41g1Jpc9MQFy2W/
 3nnqiHqPlY4LT6afefhGXkSe38OlG4Cj6N+5xVV14AJBJMevjOhRDBP5Y3UOkxdynEVHg/OYNa8R9
 k1/Nszw3tb5VViTAXoO8RddWSZ2JAGCMwtfo7bPOdavpFJB531CmzgpFgVkNHM5D/nlPV8yMZMbPB
 jx251IdjkhlJbqWh8gNG9EgWx+ciuVMhdCeGv8/y6BoKRw/c8QrVMWOfCmb5xLEBSqjRksgFiN0j7
 oAzOcBF7RbmQ1Hf2ihsxu7hF9Hfsxg7Dzj4O0i88qDZM0GQrqiY+kBQSCFMb1WkgPYx6Cg9N9lZeE
 hSdnyA1hg==;
Content-Disposition: inline
In-Reply-To: <20210322151823.GA2764@lst.de>
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

On Mon, Mar 22, 2021 at 04:18:23PM +0100, Christoph Hellwig wrote:
> On Mon, Mar 22, 2021 at 03:15:03PM +0000, Russell King - ARM Linux admin wrote:
> > It gets worse than that though - due to a change to remove
> > pcibios_min_io from the generic code, moving it into the ARM
> > architecture code, this has caused a regression that prevents the
> > legacy resources being registered against the bus resource. So even
> > if they are there, they cause probe failures. I haven't found a
> > reasonable way to solve this yet, but until there is, there is no
> > way that the PATA driver can be used as the "legacy mode" support
> > is effectively done via the PCI code assigning virtual IO port
> > resources.
> > 
> > I'm quite surprised that the CY82C693 even works on Alpha - I've
> > asked for a lspci for that last week but nothing has yet been
> > forthcoming from whoever responded to your patch for Alpha - so I
> > can't compare what I'm seeing with what's happening with Alpha.
> 
> That sounds like something we could fix with a quirk for function 2
> in the PCI resource assignment code.  Can you show what vendor and
> device ID function 2 has so that I could try to come up with one?

I already have a quirk in arch/arm/kernel/bios32.c for this - but it
is no longer sufficient due to changes in the PCI layer, where much
of this is documented.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

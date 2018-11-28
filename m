From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: remove the ->mapping_error method from dma_map_ops V2
Date: Wed, 28 Nov 2018 19:47:09 +0000
Message-ID: <20181128194708.GP30658@n2100.armlinux.org.uk>
References: <CAHk-=wg5+rXK8dpjkSmK7tuz29VfxVWNEwmTVYB409mmyLkeew@mail.gmail.com>
 <20181128174545.GJ30658@n2100.armlinux.org.uk>
 <CAHk-=whnz4Kty6cas11bc2Gh=9zTzeeRS2k=dV9Hfc4B=xnHkQ@mail.gmail.com>
 <20181128.112717.149234960284639699.davem@davemloft.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2014; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=KBvtpmJNoUWUAhsCVnKaCKgB3XrFxh+KAh2HMOdDpKo=; b=NcfNGhyeiRIIeK0HlIIEVX68A
        GSYhCWehsmBrLW4QAdMBuVwRPmpbIDwdLWCuI3thggvt0abSSzOtNsZFZ47SSHKxFKU9BCP7wreeU
        WoagLP32OQ5Eo8fjeJqPRxOfBz7jyH1PLujRGudwsxZsMeuQ73eJRhrupkNI0P69DYtjE=;
Content-Disposition: inline
In-Reply-To: <20181128.112717.149234960284639699.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: torvalds@linux-foundation.org, hch@lst.de, linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, robin.murphy@arm.com, x86@kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org, xen-devel@lists.xenproject.org, dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org

On Wed, Nov 28, 2018 at 11:27:17AM -0800, David Miller wrote:
> From: Linus Torvalds <torvalds@linux-foundation.org>
> Date: Wed, 28 Nov 2018 10:00:06 -0800
> 
> > Not all memory is accessible even to the kernel. If you have memory
> > that shows up in the last page of phys_addr_t, you just mark it
> > reserved at boot-time.
> 
> It's not the physical memory at the end that needs to be reserved.
> 
> It's the IOMMU mapping arena.

True, if and only if you have an IOMMU.

Where there isn't an IOMMU, then we'd have to reserve every page that
that translates to a bus address in the top 4K of dma_addr_t on any
bus in the system - that means knowing early in the kernel
initialisation about all buses in the system so we can detect and
reserve these pages.

I don't think that's trivial to do.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up

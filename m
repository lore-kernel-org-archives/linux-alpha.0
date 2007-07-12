From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: 2.6.22-rc6 bad page error
Date: Thu, 12 Jul 2007 13:46:06 +0400
Message-ID: <20070712134606.A10012@jurassic.park.msu.ru>
References: <20070709185324.387ACDBA1@gherkin.frus.com> <Pine.LNX.4.64.0707102120550.7594@blonde.wat.veritas.com> <20070711170245.A1148@jurassic.park.msu.ru> <Pine.LNX.4.64.0707111743580.22786@blonde.wat.veritas.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0707111743580.22786@blonde.wat.veritas.com>; from hugh@veritas.com on Wed, Jul 11, 2007 at 06:07:59PM +0100
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hugh Dickins <hugh@veritas.com>
Cc: Bob Tracy <rct@gherkin.frus.com>, Michal Piotrowski <michal.k.k.piotrowski@gmail.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Wed, Jul 11, 2007 at 06:07:59PM +0100, Hugh Dickins wrote:
> > +	gfp &= ~GFP_DMA;
> 
> The canonical form for this masking, even on arches without HIGHMEM,
> appears to be:
> 	gfp &= ~(__GFP_DMA | __GFP_HIGHMEM);
> But I guess that won't make any actual difference.

As far as I can see, none of 64-bit architectures masks the HIGHMEM
(or any other) bits. It's just not obvious because most of their
"alloc_coherent" routines are hidden in iommu_ops or something like that.

> > +	return __pci_alloc_consistent(dev, size, dma, GFP_ATOMIC);
> 
> I was going to ask you why that needs to be GFP_ATOMIC on Alpha.
> But find you're following the example of asm-generic and others.
> So really should be asking Sparc how it gets away with GFP_KERNEL.

According to DMA-mapping.txt GFP_ATOMIC is mandatory for
pci_alloc_consistent() since it can be called from interrupt context.
So sparc code is probably incorrect...

Ivan.

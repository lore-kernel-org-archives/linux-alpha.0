From: Hugh Dickins <hugh@veritas.com>
Subject: Re: 2.6.22-rc6 bad page error
Date: Thu, 12 Jul 2007 17:13:46 +0100 (BST)
Message-ID: <Pine.LNX.4.64.0707121708180.4887@blonde.wat.veritas.com>
References: <20070709185324.387ACDBA1@gherkin.frus.com>
 <Pine.LNX.4.64.0707102120550.7594@blonde.wat.veritas.com>
 <20070711170245.A1148@jurassic.park.msu.ru> <Pine.LNX.4.64.0707111743580.22786@blonde.wat.veritas.com>
 <20070712134606.A10012@jurassic.park.msu.ru>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20070712134606.A10012@jurassic.park.msu.ru>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Irwin <wli@holomorphy.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Bob Tracy <rct@gherkin.frus.com>, Michal Piotrowski <michal.k.k.piotrowski@gmail.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Thu, 12 Jul 2007, Ivan Kokshaysky wrote:
> On Wed, Jul 11, 2007 at 06:07:59PM +0100, Hugh Dickins wrote:
> 
> > > +	return __pci_alloc_consistent(dev, size, dma, GFP_ATOMIC);
> > 
> > I was going to ask you why that needs to be GFP_ATOMIC on Alpha.
> > But find you're following the example of asm-generic and others.
> > So really should be asking Sparc how it gets away with GFP_KERNEL.
> 
> According to DMA-mapping.txt GFP_ATOMIC is mandatory for
> pci_alloc_consistent() since it can be called from interrupt context.
> So sparc code is probably incorrect...

Hi Bill, we've veered away from the original topic, and are wondering
how the sparc32 pci_alloc_consistent() gets away with using GFP_KERNEL,
when GFP_ATOMIC seems to be required?

Hugh

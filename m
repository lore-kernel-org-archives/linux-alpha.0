From: FUJITA Tomonori <tomof@acm.org>
Subject: Re: [regression]2.6.25-rc4: boot panic on alpha
Date: Sun, 9 Mar 2008 19:20:20 +0900
Message-ID: <20080309191950P.tomof@acm.org>
References: <20080307162116.GA18563@jurassic.park.msu.ru>
	<20080308012440.39177DBA2@gherkin.frus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20080308012440.39177DBA2@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: rct@frus.com, ink@jurassic.park.msu.ru
Cc: tomof@acm.org, mingo@elte.hu, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, fujita.tomonori@lab.ntt.co.jp, akpm@linux-foundation.org

On Fri, 7 Mar 2008 19:24:40 -0600 (CST)
rct@frus.com (Bob Tracy) wrote:

> Ivan Kokshaysky wrote:
> > Bob, can you give it a try?
> > 
> > Ivan.
> > 
> > diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
> > index be6fa10..e07a23f 100644
> > --- a/arch/alpha/kernel/pci_iommu.c
> > +++ b/arch/alpha/kernel/pci_iommu.c
> 
> This fixes things for me.  I'm running 2.6.25-rc4 + the above patch as
> I type this.

Great, thanks for testing!

Ivan, can you resend the patch with a description and signed-off-by?

Thanks,

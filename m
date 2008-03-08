From: rct@frus.com (Bob Tracy)
Subject: Re: [regression]2.6.25-rc4: boot panic on alpha
Date: Fri, 7 Mar 2008 19:24:40 -0600 (CST)
Message-ID: <20080308012440.39177DBA2@gherkin.frus.com>
References: <20080307162116.GA18563@jurassic.park.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20080307162116.GA18563@jurassic.park.msu.ru> "from Ivan Kokshaysky
 at Mar 7, 2008 07:21:16 pm"
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: FUJITA Tomonori <tomof@acm.org>, rct@frus.com, mingo@elte.hu, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, fujita.tomonori@lab.ntt.co.jp, akpm@linux-foundation.org

Ivan Kokshaysky wrote:
> Bob, can you give it a try?
> 
> Ivan.
> 
> diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
> index be6fa10..e07a23f 100644
> --- a/arch/alpha/kernel/pci_iommu.c
> +++ b/arch/alpha/kernel/pci_iommu.c

This fixes things for me.  I'm running 2.6.25-rc4 + the above patch as
I type this.

Thanks!

-- 
------------------------------------------------------------------------
Bob Tracy          |  "I was a beta tester for dirt.  They never did
rct@frus.com       |   get all the bugs out." - Steve McGrew on /.
------------------------------------------------------------------------

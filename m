From: Hugh Dickins <hugh@veritas.com>
Subject: Re: 2.6.22-rc6 bad page error
Date: Tue, 10 Jul 2007 21:25:50 +0100 (BST)
Message-ID: <Pine.LNX.4.64.0707102120550.7594@blonde.wat.veritas.com>
References: <20070709185324.387ACDBA1@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20070709185324.387ACDBA1@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

On Mon, 9 Jul 2007, Bob Tracy wrote:
> > 
> > --- 2.6.22-rc7/arch/alpha/kernel/pci_iommu.c	2007-06-05 06:19:19.000000000 +0100
> > +++ linux/arch/alpha/kernel/pci_iommu.c	2007-07-07 15:00:04.000000000 +0100
> 
> That seems to have done the trick.  Normally, I get the "bad page"
> errors on the second NX session, but I'm on the third session of the
> day (thus far), and everything seems to be ok as far as I can tell.

Thanks a lot for the feedback, that tells us we've made the right
guesses, and my __GFP_COMP patch should be a good bandaid for you;
but for the right patch, let's wait to hear from Ivan.

Hugh

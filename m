From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [regression]2.6.25-rc4: boot panic on alpha
Date: Fri, 7 Mar 2008 15:14:40 +0100
Message-ID: <20080307141439.GB23178@elte.hu>
References: <20080307072304.GA25351@elte.hu> <20080307123645.0CB5BDBA2@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080307123645.0CB5BDBA2@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@frus.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, Andrew Morton <akpm@linux-foundation.org>


* Bob Tracy <rct@frus.com> wrote:

> Ingo Molnar wrote:
> > Bob, does latest -git boot if you revert these 4 commits:
> 
> (FUJITA Tomonori's Alpha IOMMU changes)
> 
> I'll get things set up to try that later today...  In the meantime, it 
> appears the regression is relative to -rc3: I'm up and running on that 
> kernel as I type this.

yes, these iommu changes were added post-rc3, they came from -mm and 
were i think declared to be untested on Alpha. So i'd strongly suspect 
them.

	Ingo

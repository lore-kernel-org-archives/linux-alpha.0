From: rct@frus.com (Bob Tracy)
Subject: Re: [regression]2.6.25-rc4: boot panic on alpha
Date: Fri, 7 Mar 2008 06:36:44 -0600 (CST)
Message-ID: <20080307123645.0CB5BDBA2@gherkin.frus.com>
References: <20080307072304.GA25351@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20080307072304.GA25351@elte.hu> "from Ingo Molnar at Mar 7, 2008
 08:23:05 am"
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ingo Molnar <mingo@elte.hu>
Cc: Bob Tracy <rct@frus.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>

Ingo Molnar wrote:
> Bob, does latest -git boot if you revert these 4 commits:

(FUJITA Tomonori's Alpha IOMMU changes)

I'll get things set up to try that later today...  In the meantime, it
appears the regression is relative to -rc3: I'm up and running on that
kernel as I type this.

> * Bob Tracy <rct@frus.com> wrote:
> 
> > (panic with 2.6.24-rc4 on Alpha)
> > The panic is completely reproducible.  The "Code" line at the bottom
> > of the panic output is
> > 
> > 44220001 4821f621 4821b681 4821f62b f420004f 00000081 <0000009b> 0066c012
> > 
> > The first line of the "Trace" section is
> > 
> >  [<fffffc000031a41f>] iommu_arena_alloc+0x64/0xe0
> > 

-- 
------------------------------------------------------------------------
Bob Tracy          |  "I was a beta tester for dirt.  They never did
rct@frus.com       |   get all the bugs out." - Steve McGrew on /.
------------------------------------------------------------------------

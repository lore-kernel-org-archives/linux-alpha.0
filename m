From: Will Deacon <will.deacon@arm.com>
Subject: Re: Question about DEC Alpha memory ordering
Date: Mon, 13 Feb 2017 19:08:39 +0000
Message-ID: <20170213190839.GI10256@arm.com>
References: <20170213183920.GA25191@linux.vnet.ibm.com>
 <ee22c179-9020-7101-96df-30f8e2e469b8@verizon.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ee22c179-9020-7101-96df-30f8e2e469b8@verizon.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bob smith <sfmc68@verizon.net>
Cc: paulmck@linux.vnet.ibm.com, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, stern@rowland.harvard.edu, j.alglave@ucl.ac.uk, luc.maranget@inria.fr, parri.andrea@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 13, 2017 at 01:53:27PM -0500, bob smith wrote:
> On 2/13/17 1:39 PM, Paul E. McKenney wrote:
> > can real DEC Alpha hardware end up with both instances of "r1"
> > having the value 1?
> 
> I thought this question reminded me of something, so I found this:
> > https://www.kernel.org/doc/Documentation/memory-barriers.txt
> 
> and I pasted in the content - David Howells is one of the authors and
> maybe that is why the question sort of reminded me.
> 
> Maybe someone has an update but this is what was said then.
> 
> 			 ============================
> 			 LINUX KERNEL MEMORY BARRIERS
> 			 ============================
> 
> By: David Howells <dhowells@redhat.com>
>     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
      ^^^^^^^^^^^^^^^^

There's only one Paul E. McKenney.

Will

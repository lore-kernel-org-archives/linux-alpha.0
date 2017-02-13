From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Question about DEC Alpha memory ordering
Date: Mon, 13 Feb 2017 12:28:49 -0800
Message-ID: <20170213202849.GO30506@linux.vnet.ibm.com>
References: <20170213183920.GA25191@linux.vnet.ibm.com>
 <ee22c179-9020-7101-96df-30f8e2e469b8@verizon.net>
 <20170213190931.GK30506@linux.vnet.ibm.com>
 <20170213191422.GA64569@skade.schwarzvogel.de>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170213191422.GA64569@skade.schwarzvogel.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bob smith <sfmc68@verizon.net>, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, stern@rowland.harvard.edu, j.alglave@ucl.ac.uk, luc.maranget@inria.fr, parri.andrea@gmail.com, will.deacon@arm.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 13, 2017 at 08:14:23PM +0100, Tobias Klausmann wrote:
> Hi! 
> 
> On Mon, 13 Feb 2017, Paul E. McKenney wrote:
> > On Mon, Feb 13, 2017 at 01:53:27PM -0500, bob smith wrote:
> > > On 2/13/17 1:39 PM, Paul E. McKenney wrote:
> > > > can real DEC Alpha hardware end up with both instances of "r1"
> > > > having the value 1?
> > > 
> > > I thought this question reminded me of something, so I found this:
> > > > https://www.kernel.org/doc/Documentation/memory-barriers.txt
> > > 
> > > and I pasted in the content - David Howells is one of the authors and
> > > maybe that is why the question sort of reminded me.
> > > 
> > > Maybe someone has an update but this is what was said then.
> > 
> > Well, thank you for pointing me to this, but my question was intended to
> > check whether or not the words I helped to write in memory-barriers.txt
> > are in fact accurate.  So if you have an SMP DEC Alpha system that you
> > could provide remote access to, that would be very helpful!
> 
> I have a 4-cpu ES40. Send me a test program and I'll gladly run
> it for you.

Andrea, could you please convert the litmus test below and send it to
Tobias?

							Thanx, Paul

------------------------------------------------------------------------

C auto/C-LB-LRW+OB-Dv
(*
 * Result: Never
 * 
 *)
{
}

P0(int *u0, int *x1)
{
	r1 = READ_ONCE(*u0);
	smp_mb();
	WRITE_ONCE(*x1, 1);
}


P1(int *u0, int *x1)
{
	r1 = rcu_dereference(*x1);
	WRITE_ONCE(*u0, r1);
}

exists
(0:r1=1 /\ 1:r1=1)


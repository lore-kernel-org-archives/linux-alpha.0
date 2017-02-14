From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: Question about DEC Alpha memory ordering
Date: Wed, 15 Feb 2017 08:26:46 +1300
Message-ID: <20170214192646.m6ydg27nwnh7bg7o@tower>
References: <20170213202849.GO30506@linux.vnet.ibm.com>
 <Pine.LNX.4.44L0.1702131604170.1905-100000@iolanthe.rowland.org>
 <20170213212436.GQ30506@linux.vnet.ibm.com>
 <20170214113558.GA15525@andrea>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170214113558.GA15525@andrea>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrea Parri <parri.andrea@gmail.com>
Cc: klausman@schwarzvogel.de, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, stern@rowland.harvard.edu, bob smith <sfmc68@verizon.net>, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr, will.deacon@arm.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Feb 14, 2017 at 12:35:58PM +0100, Andrea Parri wrote:
> On Mon, Feb 13, 2017 at 01:24:36PM -0800, Paul E. McKenney wrote:
> > ------------------------------------------------------------------------
> > 
> > C auto/C-LB-LRW+OB-Ov
> > (*
> >  * Result: Maybe
> >  * P0-P1 rf OB-Ov: Never->Maybe: Note lack of C11 guarantee, control dependency
> >  * P1 Ov,LRW: Note lack of C11 guarantee, control dependency
> >  *)
> > {
> > }
> > 
> > P0(int *u0, int *x1)
> > {
> > 	r1 = READ_ONCE(*u0);
> > 	smp_mb();
> > 	WRITE_ONCE(*x1, 1);
> > }
> > 
> > 
> > P1(int *u0, int *x1)
> > {
> > 	r1 = READ_ONCE(*x1);
> > 	WRITE_ONCE(*u0, r1);
> > }
> > 
> > exists
> > (0:r1=1 /\ 1:r1=1)
> > 
> 
> The (automatically generated) module for this test is at
> 
>    http://retis.sssup.it/~a.parri/lkmm/C-LB-LRW+OB-Ov.tgz ;
> 
> the test is run by cat-ing /sys/kernel/litmus/p_count: this will execute
> the thread bodies for "runs * size" iterations; results can be sentisive
> to the "stride" and "affinity increment" parameters (c.f., the Makefile);
> statistics for each experiments are printed on stdout.

This is the test run on a 3-cpu ES45 with the settings in the Makefile:

Test auto/LB-LRW+OB-Ov Allowed
Histogram (2 states)
5913093	:> 0:r1=0; 1:r1=0; 
4086907	:> 0:r1=0; 1:r1=1; 
No
Witnesses
Positive: 0 Negative: 10000000
Condition exists (0:r1=1 /\ 1:r1=1) is NOT validated
Observation auto/LB-LRW+OB-Ov Never 0 10000000
Time auto/LB-LRW+OB-Ov 9.570
Hash=200258693ffc841829310726a4a0b7e3

How do we interpret these results?

Cheers
Michael.

From: Andrea Parri <parri.andrea@gmail.com>
Subject: Re: Question about DEC Alpha memory ordering
Date: Tue, 14 Feb 2017 21:12:42 +0100
Message-ID: <20170214201242.GA8576@andrea>
References: <20170213202849.GO30506@linux.vnet.ibm.com>
 <Pine.LNX.4.44L0.1702131604170.1905-100000@iolanthe.rowland.org>
 <20170213212436.GQ30506@linux.vnet.ibm.com>
 <20170214113558.GA15525@andrea>
 <20170214192646.m6ydg27nwnh7bg7o@tower>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FdXGdv7nMXMs1zWCtoTirgSUT/WPvq0zbdBWvlS+S24=;
        b=AKU5EbH3u5lGpMh01sRkrWOkPaE9/fj8ltrC+9db7tAzGIbOmgRAImEWAJl8lO+RQR
         VQUluHd2JTsWcNVZoK5fMjQh6QvyWPVFlTylSo65nH6BRaf+Xjxk+TIyZUzb2cBS+A4f
         oqHNalViT+Rv1lq6KRAqXO9huQee1VsB9YCelmFswAY1ZYCBn3yom5Q7IGano5+1hvbH
         3qxOnOAcFbkih1P0q6Rjmbhxdc2sCYbyc3VVZZ/K9Zt8VGxLuwOCYvZuKqzu2ZYE0aAR
         CuZVFdhLBtzXMo1Bex0AXr4Rmc8YBdcsX59BDSTl+KPjUlHoIzkJn9Yqp38S73V5S6fv
         /9/w==
Content-Disposition: inline
In-Reply-To: <20170214192646.m6ydg27nwnh7bg7o@tower>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: klausman@schwarzvogel.de, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, stern@rowland.harvard.edu, bob smith <sfmc68@verizon.net>, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr, will.deacon@arm.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 15, 2017 at 08:26:46AM +1300, Michael Cree wrote:
> On Tue, Feb 14, 2017 at 12:35:58PM +0100, Andrea Parri wrote:
> > On Mon, Feb 13, 2017 at 01:24:36PM -0800, Paul E. McKenney wrote:
> > > ------------------------------------------------------------------------
> > > 
> > > C auto/C-LB-LRW+OB-Ov
> > > (*
> > >  * Result: Maybe
> > >  * P0-P1 rf OB-Ov: Never->Maybe: Note lack of C11 guarantee, control dependency
> > >  * P1 Ov,LRW: Note lack of C11 guarantee, control dependency
> > >  *)
> > > {
> > > }
> > > 
> > > P0(int *u0, int *x1)
> > > {
> > > 	r1 = READ_ONCE(*u0);
> > > 	smp_mb();
> > > 	WRITE_ONCE(*x1, 1);
> > > }
> > > 
> > > 
> > > P1(int *u0, int *x1)
> > > {
> > > 	r1 = READ_ONCE(*x1);
> > > 	WRITE_ONCE(*u0, r1);
> > > }
> > > 
> > > exists
> > > (0:r1=1 /\ 1:r1=1)
> > > 
> > 
> > The (automatically generated) module for this test is at
> > 
> >    http://retis.sssup.it/~a.parri/lkmm/C-LB-LRW+OB-Ov.tgz ;
> > 
> > the test is run by cat-ing /sys/kernel/litmus/p_count: this will execute
> > the thread bodies for "runs * size" iterations; results can be sentisive
> > to the "stride" and "affinity increment" parameters (c.f., the Makefile);
> > statistics for each experiments are printed on stdout.
> 
> This is the test run on a 3-cpu ES45 with the settings in the Makefile:
> 
> Test auto/LB-LRW+OB-Ov Allowed
> Histogram (2 states)
> 5913093	:> 0:r1=0; 1:r1=0; 
> 4086907	:> 0:r1=0; 1:r1=1; 
> No
> Witnesses
> Positive: 0 Negative: 10000000
> Condition exists (0:r1=1 /\ 1:r1=1) is NOT validated
> Observation auto/LB-LRW+OB-Ov Never 0 10000000
> Time auto/LB-LRW+OB-Ov 9.570
> Hash=200258693ffc841829310726a4a0b7e3
> 
> How do we interpret these results?

Hi Michael. The log shows (together w/ other info.) an histogram

  [Total count]   :> [Final state]

where "Total count" is the number of times an execution of the test program
led to the associated "Final state", here represented by the final values
of the registers 0:r1, 1:r1.

The log also shows statistics relative to the final state specified by the
program's "exists" clause, here (0:r1=1 /\ 1:r1=1): this state was never
observed (Positive: 0) over a total of 10000000 iterations/executions.

Thank you for running the test and for sharing these results.

  Andrea

> 
> Cheers
> Michael.

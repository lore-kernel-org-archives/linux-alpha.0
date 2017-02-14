From: Andrea Parri <parri.andrea@gmail.com>
Subject: Re: Question about DEC Alpha memory ordering
Date: Tue, 14 Feb 2017 12:35:58 +0100
Message-ID: <20170214113558.GA15525@andrea>
References: <20170213202849.GO30506@linux.vnet.ibm.com>
 <Pine.LNX.4.44L0.1702131604170.1905-100000@iolanthe.rowland.org>
 <20170213212436.GQ30506@linux.vnet.ibm.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Lj+UqLRm5S0/MQpl/0qpihhIjpdmNl4pWO9+cf6ScTg=;
        b=qcoS//iJl6b8vYlxj2U5IL1L4fMoreRbCj7giGxqMpdgcXob9t/jSQh9AfquoPYw0x
         3e0eLdlyw+RPMk8rsuoh2LwwO+OVcdC9mhENupC2nNySwxB9TwGkLCvvIur/t6WZrkTm
         kl8SvOWx7cr8GwdoovjUcpAQHEx5VF5wFjPx1yvvmogetM3WUGcN9umFXaWttoQFLF6u
         0+M277Ga341+y8t4jqDB6HOngBlaqPliRUyysGIeQNcKuFRpWhqbnfexej145X7pivJw
         SC8kuRU+y2AVD8N727O3dQS0F53sEGGzi5dX8/MZD3jVYm/SwsSBQXSMhmSve0UD7k0X
         YWiA==
Content-Disposition: inline
In-Reply-To: <20170213212436.GQ30506@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: klausman@schwarzvogel.de, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, stern@rowland.harvard.edu
Cc: bob smith <sfmc68@verizon.net>, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, j.alglave@ucl.ac.uk, luc.maranget@inria.fr, will.deacon@arm.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 13, 2017 at 01:24:36PM -0800, Paul E. McKenney wrote:
> On Mon, Feb 13, 2017 at 04:06:21PM -0500, Alan Stern wrote:
> > On Mon, 13 Feb 2017, Paul E. McKenney wrote:
> > 
> > > On Mon, Feb 13, 2017 at 08:14:23PM +0100, Tobias Klausmann wrote:
> > > > Hi! 
> > > > 
> > > > On Mon, 13 Feb 2017, Paul E. McKenney wrote:
> > > > > On Mon, Feb 13, 2017 at 01:53:27PM -0500, bob smith wrote:
> > > > > > On 2/13/17 1:39 PM, Paul E. McKenney wrote:
> > > > > > > can real DEC Alpha hardware end up with both instances of "r1"
> > > > > > > having the value 1?
> > > > > > 
> > > > > > I thought this question reminded me of something, so I found this:
> > > > > > > https://www.kernel.org/doc/Documentation/memory-barriers.txt
> > > > > > 
> > > > > > and I pasted in the content - David Howells is one of the authors and
> > > > > > maybe that is why the question sort of reminded me.
> > > > > > 
> > > > > > Maybe someone has an update but this is what was said then.
> > > > > 
> > > > > Well, thank you for pointing me to this, but my question was intended to
> > > > > check whether or not the words I helped to write in memory-barriers.txt
> > > > > are in fact accurate.  So if you have an SMP DEC Alpha system that you
> > > > > could provide remote access to, that would be very helpful!
> > > > 
> > > > I have a 4-cpu ES40. Send me a test program and I'll gladly run
> > > > it for you.
> > > 
> > > Andrea, could you please convert the litmus test below and send it to
> > > Tobias?
> > > 
> > > 							Thanx, Paul
> > > 
> > > ------------------------------------------------------------------------
> > > 
> > > C auto/C-LB-LRW+OB-Dv
> > > (*
> > >  * Result: Never
> > >  * 
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
> > > 	r1 = rcu_dereference(*x1);
> > 
> > No, please, not this.  It should be:
> > 
> > 	r1 = READ_ONCE(*x1);
> > 
> > That is, the auto/C-LB-LRW+OB-Ov.litmus test.
> > 
> > > 	WRITE_ONCE(*u0, r1);
> > > }
> > > 
> > > exists
> > > (0:r1=1 /\ 1:r1=1)
> 
> Sorry, here is the correct one in full.
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> C auto/C-LB-LRW+OB-Ov
> (*
>  * Result: Maybe
>  * P0-P1 rf OB-Ov: Never->Maybe: Note lack of C11 guarantee, control dependency
>  * P1 Ov,LRW: Note lack of C11 guarantee, control dependency
>  *)
> {
> }
> 
> P0(int *u0, int *x1)
> {
> 	r1 = READ_ONCE(*u0);
> 	smp_mb();
> 	WRITE_ONCE(*x1, 1);
> }
> 
> 
> P1(int *u0, int *x1)
> {
> 	r1 = READ_ONCE(*x1);
> 	WRITE_ONCE(*u0, r1);
> }
> 
> exists
> (0:r1=1 /\ 1:r1=1)
> 

The (automatically generated) module for this test is at

   http://retis.sssup.it/~a.parri/lkmm/C-LB-LRW+OB-Ov.tgz ;

the test is run by cat-ing /sys/kernel/litmus/p_count: this will execute
the thread bodies for "runs * size" iterations; results can be sentisive
to the "stride" and "affinity increment" parameters (c.f., the Makefile);
statistics for each experiments are printed on stdout.

Please let me know should you find any problem with this. Thank you,

  Andrea

Disclaimer: I'm not "excited", to use an euphemism, to post such an ugly
C code to LKML ...; _most importantly_, I've certainly never tested this
on any Alpha machine ...



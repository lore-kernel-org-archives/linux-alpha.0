From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Do any Alpha systems include InfiniBand?
Date: Mon, 23 Oct 2017 10:13:12 -0700
Message-ID: <20171023171312.GL3659@linux.vnet.ibm.com>
References: <20171020194832.GA19016@linux.vnet.ibm.com>
 <20171023085921.jwbntptn6ictbnvj@tower>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171023085921.jwbntptn6ictbnvj@tower>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>, parri.andrea@gmail.com, will.deacon@arm.com, linux-alpha@vger.kernel.org, peterz@infradead.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, mark.rutland@arm.com

On Mon, Oct 23, 2017 at 09:59:21PM +1300, Michael Cree wrote:
> On Fri, Oct 20, 2017 at 12:48:32PM -0700, Paul E. McKenney wrote:
> > Do any of the DEC Alpha systems that run recent kernels have InfiniBand?
> > Given my understanding of the history, I believe the answer to be "no".
> 
> I am not aware of any Alpha systems with InfiniBand.

Very good, then we need not worry about any Alpha-related consequences
of removing smp_read_barrier_depends() invocations from the InfiniBand
driver.  ;-)

							Thanx, Paul


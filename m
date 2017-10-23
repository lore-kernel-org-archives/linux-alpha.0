From: Will Deacon <will.deacon@arm.com>
Subject: Re: Do any Alpha systems include InfiniBand?
Date: Mon, 23 Oct 2017 18:16:25 +0100
Message-ID: <20171023171625.GF6222@arm.com>
References: <20171020194832.GA19016@linux.vnet.ibm.com>
 <20171023085921.jwbntptn6ictbnvj@tower>
 <20171023171312.GL3659@linux.vnet.ibm.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171023171312.GL3659@linux.vnet.ibm.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Michael Cree <mcree@orcon.net.nz>, parri.andrea@gmail.com, linux-alpha@vger.kernel.org, peterz@infradead.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, mark.rutland@arm.com

On Mon, Oct 23, 2017 at 10:13:12AM -0700, Paul E. McKenney wrote:
> On Mon, Oct 23, 2017 at 09:59:21PM +1300, Michael Cree wrote:
> > On Fri, Oct 20, 2017 at 12:48:32PM -0700, Paul E. McKenney wrote:
> > > Do any of the DEC Alpha systems that run recent kernels have InfiniBand?
> > > Given my understanding of the history, I believe the answer to be "no".
> > 
> > I am not aware of any Alpha systems with InfiniBand.
> 
> Very good, then we need not worry about any Alpha-related consequences
> of removing smp_read_barrier_depends() invocations from the InfiniBand
> driver.  ;-)

But maybe make that driver depend on !CONFIG_ALPHA, so as to avoid planting
any subtle ordering bugs?

Will

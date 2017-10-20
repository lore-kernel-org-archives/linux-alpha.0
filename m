From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Do any Alpha systems include InfiniBand?
Date: Fri, 20 Oct 2017 13:15:39 -0700
Message-ID: <20171020201539.GW3521@linux.vnet.ibm.com>
References: <20171020194832.GA19016@linux.vnet.ibm.com>
 <CAEdQ38FosVOEXrawAFzaFjhVPiEwzJVetV1PuiY2Kku8c6Ft0Q@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEdQ38FosVOEXrawAFzaFjhVPiEwzJVetV1PuiY2Kku8c6Ft0Q@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Michael Cree <mcree@orcon.net.nz>, parri.andrea@gmail.com, Will Deacon <will.deacon@arm.com>, linux-alpha <linux-alpha@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, mark.rutland@arm.com

On Fri, Oct 20, 2017 at 01:00:14PM -0700, Matt Turner wrote:
> On Fri, Oct 20, 2017 at 12:48 PM, Paul E. McKenney
> <paulmck@linux.vnet.ibm.com> wrote:
> > Hello, Michael,
> >
> > Do any of the DEC Alpha systems that run recent kernels have InfiniBand?
> > Given my understanding of the history, I believe the answer to be "no".
> > If I am wrong, please let me know, as I will otherwise interpret silence
> > as assent.  ;-)
> 
> I'm not aware of any shipping with Infiniband, and I haven't heard of
> anyone putting Infiniband in an Alpha.
> 
> Why do you ask? :)

Because the Linux-kernel InfiniBand driver contains a bunch of instances
of smp_read_barrier_depends(), which matter only on Alpha.  Plus the
InfiniBand maintainers have not responded to queries about what these
smp_read_barrier_depends() instances are supposed to do.  Now it might be
that they are just busy, or it might be that they don't know themselves.

If Alpha doesn't use InfiniBand, they can simply be removed.  On the
other hand, if Alpha -did- use InfiniBand, it would be necessary to
inspect the code to determine whether if READ_ONCE() needs to be added
somewhere to make up for the removal of smp_read_barrier_depends().

The reason this came up to begin with is that Will Deacon is adding an
smp_read_barrier_depends() to READ_ONCE() and Mark Rutland is converting
all ACCESS_ONCE() instances to either READ_ONCE() or WRITE_ONCE().
With these changes, core code need not know about Alpha, and almost all
instances of smp_read_barrier_depends() can be removed.

Hey, you asked!  ;-)

							Thanx, Paul


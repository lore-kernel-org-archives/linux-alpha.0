From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Question about DEC Alpha memory ordering
Date: Mon, 13 Feb 2017 12:32:00 -0800
Message-ID: <20170213203200.GP30506@linux.vnet.ibm.com>
References: <20170213183920.GA25191@linux.vnet.ibm.com>
 <ee22c179-9020-7101-96df-30f8e2e469b8@verizon.net>
 <20170213190931.GK30506@linux.vnet.ibm.com>
 <20170213192334.rjs5yq3gmw5cg7km@tower>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170213192334.rjs5yq3gmw5cg7km@tower>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>, bob smith <sfmc68@verizon.net>, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, stern@rowland.harvard.edu, j.alglave@ucl.ac.uk, luc.maranget@inria.fr, parri.andrea@gmail.com, will.deacon@arm.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Feb 14, 2017 at 08:23:34AM +1300, Michael Cree wrote:
> Hi Paul,
> 
> On Mon, Feb 13, 2017 at 11:09:31AM -0800, Paul E. McKenney wrote:
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
> I'm that guy with an SMP Alpha system who met you at Linux Conference
> Australia after your talk on memory barriers.  I meant to get back to
> you but tracking down a kernel bug and now a binutils/glibc bug has
> got the better of my time.
> 
> Feel free to email me personally to arrange remote access to an SMP
> Alpha system, preferrably with a GPG signed message.

Would you be willing to extend this offer to Andrea Parri (CCed)?
He is the one who has run such tests in the past.

							Thanx, Paul


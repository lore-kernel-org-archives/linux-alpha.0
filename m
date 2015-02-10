From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH] llist: Fix missing lockless_dereference()
Date: Tue, 10 Feb 2015 03:42:08 +0000 (UTC)
Message-ID: <238033159.95142.1423539728937.JavaMail.zimbra@efficios.com>
References: <1423274934-10625-1-git-send-email-mathieu.desnoyers@efficios.com> <20150207221625.GB31119@kroah.com> <1117480383.90061.1423348244225.JavaMail.zimbra@efficios.com> <20150208004729.GA10472@omega> <1374616625.90941.1423369546750.JavaMail.zimbra@efficios.com> <1423533148.5968.84.camel@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1423533148.5968.84.camel@intel.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Huang Ying <ying.huang@intel.com>
Cc: Michael Cree <mcree@orcon.net.nz>, Greg KH <gregkh@linuxfoundation.org>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-kernel@vger.kernel.org, Paul McKenney <paulmck@linux.vnet.ibm.com>, David Howells <dhowells@redhat.com>, Pranith Kumar <bobby.prani@gmail.com>, stable@vger.kernel.org

----- Original Message -----
> From: "Huang Ying" <ying.huang@intel.com>
> To: "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>
> Cc: "Michael Cree" <mcree@orcon.net.nz>, "Greg KH" <gregkh@linuxfoundation.org>, linux-alpha@vger.kernel.org,
> "Richard Henderson" <rth@twiddle.net>, "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>, "Matt Turner"
> <mattst88@gmail.com>, linux-kernel@vger.kernel.org, "Paul McKenney" <paulmck@linux.vnet.ibm.com>, "David Howells"
> <dhowells@redhat.com>, "Pranith Kumar" <bobby.prani@gmail.com>, stable@vger.kernel.org
> Sent: Monday, February 9, 2015 8:52:28 PM
> Subject: Re: [PATCH] llist: Fix missing lockless_dereference()
> 
> Hi, Mathieu,
> 
> On Sun, 2015-02-08 at 04:25 +0000, Mathieu Desnoyers wrote:
> > ----- Original Message -----
> > > From: "Michael Cree" <mcree@orcon.net.nz>
> > > To: "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>
> > > Cc: "Greg KH" <gregkh@linuxfoundation.org>, linux-alpha@vger.kernel.org,
> > > "Richard Henderson" <rth@twiddle.net>, "Ivan
> > > Kokshaysky" <ink@jurassic.park.msu.ru>, "Matt Turner"
> > > <mattst88@gmail.com>, "Huang Ying" <ying.huang@intel.com>,
> > > linux-kernel@vger.kernel.org, "Paul McKenney"
> > > <paulmck@linux.vnet.ibm.com>, "David Howells" <dhowells@redhat.com>,
> > > "Pranith Kumar" <bobby.prani@gmail.com>, stable@vger.kernel.org
> > > Sent: Saturday, February 7, 2015 7:47:29 PM
> > > Subject: Re: [PATCH] llist: Fix missing lockless_dereference()
> > > 
> > > On Sat, Feb 07, 2015 at 10:30:44PM +0000, Mathieu Desnoyers wrote:
> > > > > On Fri, Feb 06, 2015 at 09:08:21PM -0500, Mathieu Desnoyers wrote:
> > > > > > A lockless_dereference() appears to be missing in
> > > > > > llist_del_first().
> > > > > > It should only matter for Alpha in practice.
> > > 
> > > What could one anticipate to be the symptoms of such a missing
> > > lockless_dereference()?
> > 
> > This can trigger corruption of the lockless linked-list, which is
> > used across a few subsystems. AFAIU, the scenario is as follows.
> > Please bear with me, because it's been a while since I've read on
> > the Alpha multi-cache-banks behavior.
> > 
> > The list here would be initially non-empty. Initial state of
> > new_last->next is unset (newly allocated); IOW: garbage. CPU A
> > adds a node into the list while CPU B removes a node from the
> > head of the list.
> > 
> > CPU A                                      CPU B
> > llist_add_batch()
> > - Stores to new_last->next
> > - implicit full mb before cmpxchg makes the
> >   update to CPU A's cache bank containing
> >   new_last->next visible to other CPUs
> >   before CPU A's cache bank update making
> >   head->first visible to other CPUs.
> > - cmpxchg updates head->first = new_first
> >                                            llist_del_first()
> >                                            - entry = load head->first
> >                                            -> here, lack of barrier on
> >                                            Alpha creates a window where
> >                                               CPU B's cache bank can see
> >                                               the updated "head->first",
> >                                               but the cache bank holding
> >                                               the next value did not
> >                                               receive the update yet, since
> >                                               each cache bank have
> >                                               their own channel, which can
> >                                               be independently
> >                                               saturated.
> >                                            - next = load entry->next
> >                                            (dereference entry pointer)
> >                                            - cmpxchg updates head->first =
> >                                            next
> >                                              -> can store unset "next"
> >                                              value into head->first, thus
> >                                                 corrupting the linked list.
> 
> If my understanding were correct, cmpxchg will imply a full mb before
> and after it, so that there is a mb between load head->first in cmpxchg
> and load entry->next.  If so, the memory barrier is only needed before
> the loop.

Yes, indeed, and by using lockless_dereference(), this is
what we end up doing.

FWIW, the reason why I moved smp_read_barrier_depends() into
the loop was to issue it after the check for NULL pointer,
assuming that getting a NULL pointer was a relatively
frequent case compared to a failing cmpxchg. But we're
talking about very minor optimisations compared to the
upside of lockless_dereference() making the code easier
to understand.

Thanks,

Mathieu

> 
> Best Regards,
> Huang, Ying
> 
> > > 
> > > The Alpha kernel is behaving pretty well provided one builds a machine
> > > specific kernel and UP.  When running an SMP kernel some packages
> > > (most notably the java runtime, but there are a few others) occasionally
> > > lock up in a pthread call --- could be a problem in libc rather then the
> > > kernel.
> > 
> > Are those lockups always occasional, or you have ways to reproduce them
> > frequently with stress-tests ?
> > 
> > Thanks,
> > 
> > Mathieu
> > 
> > > 
> > > > > Meta-comment, do we really care about Alpha anymore?  Is it still
> > > > > consered an "active" arch we support?
> > > 
> > > There are a few of us still running recent kernels on Alpha.  I am
> > > maintaining the unofficial Debian alpha port at debian-ports, and the
> > > Debian popcon shows about 10 installations of Debian Alpha.
> > > 
> > > Cheers
> > > Michael.
> > > 
> > 
> 
> 
> 

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com

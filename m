From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH] llist: Fix missing lockless_dereference()
Date: Sun, 8 Feb 2015 14:12:04 +1300
Message-ID: <20150208011204.GB10472@omega>
References: <1423274934-10625-1-git-send-email-mathieu.desnoyers@efficios.com>
 <20150207221625.GB31119@kroah.com>
 <1117480383.90061.1423348244225.JavaMail.zimbra@efficios.com>
 <20150208004729.GA10472@omega>
 <20150208005941.GA3524@kroah.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150208005941.GA3524@kroah.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Huang Ying <ying.huang@intel.com>, linux-kernel@vger.kernel.org, Paul McKenney <paulmck@linux.vnet.ibm.com>, David Howells <dhowells@redhat.com>, Pranith Kumar <bobby.prani@gmail.com>, stable@vger.kernel.org

On Sun, Feb 08, 2015 at 08:59:41AM +0800, Greg KH wrote:
> On Sun, Feb 08, 2015 at 01:47:29PM +1300, Michael Cree wrote:
> > On Sat, Feb 07, 2015 at 10:30:44PM +0000, Mathieu Desnoyers wrote:
> > > > On Fri, Feb 06, 2015 at 09:08:21PM -0500, Mathieu Desnoyers wrote:
> > > > > A lockless_dereference() appears to be missing in llist_del_first().
> > > > > It should only matter for Alpha in practice.
> > 
> > What could one anticipate to be the symptoms of such a missing
> > lockless_dereference()?
> > 
> > The Alpha kernel is behaving pretty well provided one builds a machine
> > specific kernel and UP.  When running an SMP kernel some packages
> > (most notably the java runtime, but there are a few others) occasionally
> > lock up in a pthread call --- could be a problem in libc rather then the
> > kernel.
> 
> Hm, if only UP alpha needs to be supported, odds are we could rip a lot
> of odd stuff out of the kernel that deals with memory barriers and other
> nasty locking things that the Alpha requires.
> 
> Would that be ok?  Or is someone somewhere going to want to be running a
> SMP kernel on Alpha in the future?

I am running an SMP kernel on a 3-cpu Alpha system; it mostly works
just fine.

I was just noting that there is something up with java---it locks up
occassionally in a pthread call, and there are a few other packages
that occasionally fail in test suites when being built under an SMP
kernel but always pass when built under an UP kernel which suggests
there is a little buglet somewhere in the SMP code, either in the
kernel or in libc.

Running an SMP system for the Debian Alpha build daemon at debian-ports
is really useful for keeping up with the other architectures.

Cheers
Michael.

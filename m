From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH] llist: Fix missing lockless_dereference()
Date: Sun, 8 Feb 2015 13:47:29 +1300
Message-ID: <20150208004729.GA10472@omega>
References: <1423274934-10625-1-git-send-email-mathieu.desnoyers@efficios.com>
 <20150207221625.GB31119@kroah.com>
 <1117480383.90061.1423348244225.JavaMail.zimbra@efficios.com>
Mime-Version: 1.0
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1117480383.90061.1423348244225.JavaMail.zimbra@efficios.com>
Sender: stable-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Huang Ying <ying.huang@intel.com>, linux-kernel@vger.kernel.org, Paul McKenney <paulmck@linux.vnet.ibm.com>, David Howells <dhowells@redhat.com>, Pranith Kumar <bobby.prani@gmail.com>, stable@vger.kernel.org

On Sat, Feb 07, 2015 at 10:30:44PM +0000, Mathieu Desnoyers wrote:
> > On Fri, Feb 06, 2015 at 09:08:21PM -0500, Mathieu Desnoyers wrote:
> > > A lockless_dereference() appears to be missing in llist_del_first().
> > > It should only matter for Alpha in practice.

What could one anticipate to be the symptoms of such a missing
lockless_dereference()?

The Alpha kernel is behaving pretty well provided one builds a machine
specific kernel and UP.  When running an SMP kernel some packages
(most notably the java runtime, but there are a few others) occasionally
lock up in a pthread call --- could be a problem in libc rather then the
kernel.

> > Meta-comment, do we really care about Alpha anymore?  Is it still
> > consered an "active" arch we support? 

There are a few of us still running recent kernels on Alpha.  I am
maintaining the unofficial Debian alpha port at debian-ports, and the
Debian popcon shows about 10 installations of Debian Alpha.

Cheers
Michael.

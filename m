From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH] llist: Fix missing lockless_dereference()
Date: Tue, 10 Feb 2015 22:30:42 +1300
Message-ID: <20150210093042.GA21696@omega>
References: <1423274934-10625-1-git-send-email-mathieu.desnoyers@efficios.com>
 <20150207221625.GB31119@kroah.com>
 <1117480383.90061.1423348244225.JavaMail.zimbra@efficios.com>
 <20150208004729.GA10472@omega>
 <1374616625.90941.1423369546750.JavaMail.zimbra@efficios.com>
Mime-Version: 1.0
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1374616625.90941.1423369546750.JavaMail.zimbra@efficios.com>
Sender: stable-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Huang Ying <ying.huang@intel.com>, linux-kernel@vger.kernel.org, Paul McKenney <paulmck@linux.vnet.ibm.com>, David Howells <dhowells@redhat.com>, Pranith Kumar <bobby.prani@gmail.com>, stable@vger.kernel.org

On Sun, Feb 08, 2015 at 04:25:46AM +0000, Mathieu Desnoyers wrote:
> > From: "Michael Cree" <mcree@orcon.net.nz>
> > The Alpha kernel is behaving pretty well provided one builds a machine
> > specific kernel and UP.  When running an SMP kernel some packages
> > (most notably the java runtime, but there are a few others) occasionally
> > lock up in a pthread call --- could be a problem in libc rather then the
> > kernel.
> 
> Are those lockups always occasional, or you have ways to reproduce them
> frequently with stress-tests ?

They are occasional but a build of openjdk-7 bootstrapping from itself
is very likely to end up with a locked up javac process.  I've just set
such a build going with the openjdk-7 build-dependencies and some extra
debug packages installed in the build chroot to see if I can get a
useful backtrace.  Will be tomorrow morning when I look as I am now
heading off for the night.

Cheers
Michael.

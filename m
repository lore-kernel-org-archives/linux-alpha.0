From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH 01/10] alpha: Add missing RCU idle APIs on idle loop
Date: Thu, 23 Aug 2012 21:32:18 +1200
Message-ID: <5035F8A2.1070702@orcon.net.nz>
References: <1345652628-15060-1-git-send-email-fweisbec@gmail.com> <1345652628-15060-2-git-send-email-fweisbec@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1345652628-15060-2-git-send-email-fweisbec@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, "3.2.x.." <stable@kernel.org>

On 23/08/12 04:23, Frederic Weisbecker wrote:
> In the old times, the whole idle task was considered
> as an RCU quiescent state. But as RCU became more and
> more successful overtime, some RCU read side critical
> section have been added even in the code of some
> architectures idle tasks, for tracing for example.

Fantastic!  It fixes RCU CPU stalls that we were seeing on the SMP
kernel when built for generic Alpha.

A build of glibc and running its test suite reliably triggers RCU CPU
stalls when running a kernel built for generic Alpha.  I have just built
glibc and ran its test suite twice with no RCU CPU stalls with this
patch against a 3.5.2 kernel!  Nice.  Very nice.

I see the stable queue is CCed but I note the patch does not apply
cleanly to the 3.2.y kernel.  It would be nice to have a backport of the
patches for the 3.2 stable kernel.

So feel free to add:

Tested-by:  Michael Cree <mcree@orcon.net.nz>

Cheers
Michael.

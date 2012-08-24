From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 00/11] rcu: Add missing RCU idle APIs on idle loop v2
Date: Fri, 24 Aug 2012 14:26:47 -0700
Message-ID: <20120824212647.GU2472@linux.vnet.ibm.com>
References: <1345733915-20040-1-git-send-email-fweisbec@gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1345733915-20040-1-git-send-email-fweisbec@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Chris Zankel <chris@zankel.net>, "3.2.x.." <stable@vger.kernel.org>, Chen Liqin <liqin.chen@sunplusct.com>, Lennox Wu <lennox.wu@gmail.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Parisc <linux-parisc@vger.kernel.org>, David Howells <dhowells@redhat.com>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, Geert Uytterhoeven <geert@linux-m68k.org>, m68k <linux-m68k@lists.linux-m68k.org>, Hirokazu Takata <takata@linux-m32r.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Cris <linux-cris-kernel@axis.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Michael Cree <mcree@orcon.net.nz>

On Thu, Aug 23, 2012 at 04:58:24PM +0200, Frederic Weisbecker wrote:
> Hi,
> 
> Changes since v1:
> 
> - Fixed preempt handling in alpha idle loop
> - added ack from Geert
> - fixed stable email address, sorry :-/
> 
> This time I built tested everywhere but: h8300 (compiler internal error),
> and mn10300, parisc, score (cross compilers not available in
> ftp://ftp.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.6.3/)
> 
> For testing, you can pull from:
> 
> git://github.com/fweisbec/linux-dynticks.git
> 	rcu/idle-fix-v2 
> 
> Thanks.

I have queued these on -rcu branch rcu/idle:

	git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git

This problem has been in place since 3.3, so it is hard to argue that
it is a regression for this merge window.  I have therefore queued it
for 3.7.

								Thanx, Paul

> Frederic Weisbecker (11):
>   alpha: Fix preemption handling in idle loop
>   alpha: Add missing RCU idle APIs on idle loop
>   cris: Add missing RCU idle APIs on idle loop
>   frv: Add missing RCU idle APIs on idle loop
>   h8300: Add missing RCU idle APIs on idle loop
>   m32r: Add missing RCU idle APIs on idle loop
>   m68k: Add missing RCU idle APIs on idle loop
>   mn10300: Add missing RCU idle APIs on idle loop
>   parisc: Add missing RCU idle APIs on idle loop
>   score: Add missing RCU idle APIs on idle loop
>   xtensa: Add missing RCU idle APIs on idle loop
> 
>  arch/alpha/kernel/process.c   |    6 +++++-
>  arch/alpha/kernel/smp.c       |    1 +
>  arch/cris/kernel/process.c    |    3 +++
>  arch/frv/kernel/process.c     |    3 +++
>  arch/h8300/kernel/process.c   |    3 +++
>  arch/m32r/kernel/process.c    |    3 +++
>  arch/m68k/kernel/process.c    |    3 +++
>  arch/mn10300/kernel/process.c |    3 +++
>  arch/parisc/kernel/process.c  |    3 +++
>  arch/score/kernel/process.c   |    4 +++-
>  arch/xtensa/kernel/process.c  |    3 +++
>  11 files changed, 33 insertions(+), 2 deletions(-)
> 
> -- 
> 1.7.5.4
> 

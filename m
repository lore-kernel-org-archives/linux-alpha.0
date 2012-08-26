From: Tobias Klausmann <klausman@schwarzvogel.de>
Subject: Re: [PATCH 00/11] rcu: Add missing RCU idle APIs on idle loop v2
Date: Sun, 26 Aug 2012 11:21:37 +0200
Message-ID: <20120826092137.GA50543@kaini.schwarzvogel.de>
References: <1345733915-20040-1-git-send-email-fweisbec@gmail.com>
 <20120824212647.GU2472@linux.vnet.ibm.com>
 <1345857554.4840.43.camel@deadeye.wl.decadent.org.uk>
 <20120825035047.GB3436@linux.vnet.ibm.com>
 <20120825131647.GA1994@somewhere>
 <20120825161806.GD3436@linux.vnet.ibm.com>
 <5039406F.9040604@orcon.net.nz>
 <20120826001233.GH3436@linux.vnet.ibm.com>
Mime-Version: 1.0
Return-path: <linux-parisc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120826001233.GH3436@linux.vnet.ibm.com>
Sender: linux-parisc-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Michael Cree <mcree@orcon.net.nz>, Frederic Weisbecker <fweisbec@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, LKML <linux-kernel@vger.kernel.org>, Chris Zankel <chris@zankel.net>, "3.2.x.." <stable@vger.kernel.org>, Chen Liqin <liqin.chen@sunplusct.com>, Lennox Wu <lennox.wu@gmail.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Parisc <linux-parisc@vger.kernel.org>, David Howells <dhowells@redhat.com>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, Geert Uytterhoeven <geert@linux-m68k.org>, m68k <linux-m68k@lists.linux-m68k.org>, Hirokazu Takata <takata@linux-m32r.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Cris <linux-cris-kernel@axis.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <m>

Hi! 

On Sat, 25 Aug 2012, Paul E. McKenney wrote:
> Both Alpha patches should apply as-is back to 3.3, and should also fix
> the problem.  Could you please check this on the versions of interest?

I just now tried them on top of 3.3.8 from linux-stable.git.
While they apply cleanly, I get a compile failure:

  CC      arch/alpha/kernel/process.o
arch/alpha/kernel/process.c: In function 'cpu_idle':
arch/alpha/kernel/process.c:64: error: implicit declaration of function 'schedule_preempt_disabled'
make[1]: *** [arch/alpha/kernel/process.o] Error 1
make: *** [arch/alpha/kernel] Error 2

AFAICT, schedule_preempt_disabled() was only introduced in 3.4
and thus needs to be backported for 3.3.

Regards,
Tobias

-- 
panic("%s: CORRUPTED BTREE OR SOMETHING", __FUNCTION__);
        linux-2.6.6/fs/xfs/xfs_bmap.c

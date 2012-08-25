From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH 00/11] rcu: Add missing RCU idle APIs on idle loop v2
Date: Sat, 25 Aug 2012 15:16:49 +0200
Message-ID: <20120825131647.GA1994@somewhere>
References: <1345733915-20040-1-git-send-email-fweisbec@gmail.com>
 <20120824212647.GU2472@linux.vnet.ibm.com>
 <1345857554.4840.43.camel@deadeye.wl.decadent.org.uk>
 <20120825035047.GB3436@linux.vnet.ibm.com>
Mime-Version: 1.0
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=Lz6yf15lV/uHZkFl8VnBzceb31W7dfWNOkgiSElMnoQ=;
        b=qO82nLda0YFGnpFvvah6Om5ycsDaYGx/ufxVDlDdcoKcx1qAsUi8FeRT2PygYVu34S
         Mu46yGbY1GcKQNNew+gWF8x/0baL9Wme4BOBWQDNJxwfkqyc9C1x06W1gwDpLu8MRda5
         zNWPZy3jSblfD5lw0m66j1DiuDYXwPAp3JH8pNpPIaWdU+sshO9G3ozekkn/R5cTs380
         dSKhpI+XHMqRcDlweSwtYCD0Z/HC9vtDlP3BP9YW4VYJAq7qoQYGKU8sq+8xnSkrMOdn
         ADgFd03GKq7DVSdrENPhRD/0yr3o+Eyx8bt+ClTtjzUxNK3NLywGtm9O6fWTHXTi0xDK
         97Rg==
Content-Disposition: inline
In-Reply-To: <20120825035047.GB3436@linux.vnet.ibm.com>
Sender: linux-parisc-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, LKML <linux-kernel@vger.kernel.org>, Chris Zankel <chris@zankel.net>, "3.2.x.." <stable@vger.kernel.org>, Chen Liqin <liqin.chen@sunplusct.com>, Lennox Wu <lennox.wu@gmail.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Parisc <linux-parisc@vger.kernel.org>, David Howells <dhowells@redhat.com>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, Geert Uytterhoeven <geert@linux-m68k.org>, m68k <linux-m68k@lists.linux-m68k.org>, Hirokazu Takata <takata@linux-m32r.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Cris <linux-cris-kernel@axis.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Michael Cree <>

On Fri, Aug 24, 2012 at 08:50:47PM -0700, Paul E. McKenney wrote:
> On Sat, Aug 25, 2012 at 02:19:14AM +0100, Ben Hutchings wrote:
> > On Fri, 2012-08-24 at 14:26 -0700, Paul E. McKenney wrote:
> > > On Thu, Aug 23, 2012 at 04:58:24PM +0200, Frederic Weisbecker wrote:
> > > > Hi,
> > > > 
> > > > Changes since v1:
> > > > 
> > > > - Fixed preempt handling in alpha idle loop
> > > > - added ack from Geert
> > > > - fixed stable email address, sorry :-/
> > > > 
> > > > This time I built tested everywhere but: h8300 (compiler internal error),
> > > > and mn10300, parisc, score (cross compilers not available in
> > > > ftp://ftp.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.6.3/)
> > > > 
> > > > For testing, you can pull from:
> > > > 
> > > > git://github.com/fweisbec/linux-dynticks.git
> > > > 	rcu/idle-fix-v2 
> > > > 
> > > > Thanks.
> > > 
> > > I have queued these on -rcu branch rcu/idle:
> > > 
> > > 	git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
> > > 
> > > This problem has been in place since 3.3, so it is hard to argue that
> > > it is a regression for this merge window.  I have therefore queued it
> > > for 3.7.
> > 
> > I don't follow that; I would expect any serious bug fix (serious enough
> > for a stable update) to be acceptable for 3.6 at this point.
> 
> OK, if any of the arch maintainers wishes to submit the patch to 3.6,
> they are free to do so -- just let me know and I will drop the patch from
> my tree.
> 
> That said, all this does is cause spurious warnings to be printed, so
> not sure it really qualifies as serious.  But I am happy to leave that
> decision with the individual arch maintainers -- it is their arch,
> after all, so their decision.

Couldn't that cause hung tasks due to long lasting synchronize_rcu() ?

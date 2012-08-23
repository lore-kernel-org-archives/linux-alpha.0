From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH 00/10] rcu: Add missing RCU idle APIs on idle loop
Date: Thu, 23 Aug 2012 13:02:00 +0200
Message-ID: <20120823110157.GC18835@somewhere.redhat.com>
References: <1345652628-15060-1-git-send-email-fweisbec@gmail.com>
 <CAMuHMdUt62GsYsPMAPbUWZUtFL=c2VmYFintpDAQmSwQrWriuA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=AMt4rvEqYqKka3h7S4EJsOvEa/ztbHJGMsmTvob9qwM=;
        b=FVxObIt4TS4flEzyQkrjSTJevkfRCxH3sEs35ArMap/zj46e2yhZPAwFPz1pNXUz0F
         oVOFlYrRv2jstf+2sBikN8JDUR9LGNImCTnnfvD7ypzZB1PMG3/7sz39ZdY3VFumP/Va
         TlSR6jiAw93dZvGtDzzwW7RhW8fVV8Y3yZ9DwFmz340iuUMAZyzR6wPVZaTPlhu5HbWn
         FgQnLeBMrC1q6wrQM8Nvo2s/sq1f329BTZD+ypPq03p5t6lNQq2t0D3PqxwtGFLXvWvb
         eTjxpI9CeMvVBjhHmBhzzT2zkrkTsc30JxGL4G7YvFmKG4IKTDPEtjKbONmYtZhGvLvG
         qYqw==
Content-Disposition: inline
In-Reply-To: <CAMuHMdUt62GsYsPMAPbUWZUtFL=c2VmYFintpDAQmSwQrWriuA@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Chris Zankel <chris@zankel.net>, "3.2.x.." <stable@kernel.org>, Chen Liqin <liqin.chen@sunplusct.com>, Lennox Wu <lennox.wu@gmail.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Parisc <linux-parisc@vger.kernel.org>, David Howells <dhowells@redhat.com>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, m68k <linux-m68k@lists.linux-m68k.org>, Hirokazu Takata <takata@linux-m32r.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Cris <linux-cris-kernel@axis.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>

On Wed, Aug 22, 2012 at 07:18:04PM +0200, Geert Uytterhoeven wrote:
> On Wed, Aug 22, 2012 at 6:23 PM, Frederic Weisbecker <fweisbec@gmail.com> wrote:
> > So this fixes some potential RCU stalls in a bunch of architectures.
> > When rcu_idle_enter()/rcu_idle_exit() became a requirement, we forgot
> > to handle the architectures that don't support CONFIG_NO_HZ.
> >
> > I guess the set should be dispatched into arch maintainer trees.
> 
> I can take the m68k version, but are you sure you want it this way?
> Each of them must be in mainline before they can enter stable.

Yeah, I was thinking the right route is for these patches to be
carried by arch maintainer who then push to Linus and then this goes
to stable.

Is that ok for you?

Otherwise I can carry the patches myself. In a tree of my own, or
Paul's or mmotm. As long as I have your ack.

Thanks.

> 
> > I'm sorry I haven't built tested everywhere. But the changes are
> > small and need to be at least boot tested anyway.
> 
> Builds and boots fine on m68k under ARAnyM.
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> (for m68k)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

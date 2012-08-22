From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 00/10] rcu: Add missing RCU idle APIs on idle loop
Date: Wed, 22 Aug 2012 19:18:04 +0200
Message-ID: <CAMuHMdUt62GsYsPMAPbUWZUtFL=c2VmYFintpDAQmSwQrWriuA@mail.gmail.com>
References: <1345652628-15060-1-git-send-email-fweisbec@gmail.com>
Mime-Version: 1.0
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=Y7BeBYFyOVlXFxIS91R3WFHhgBi7BuzYY/LaN0GFWnE=;
        b=0c+O8O5SjIxA2jIYNTlXK8SaeOpZuce4CIzD2c9bhuPmFNmoUrhYzbCzLu/vpSZH4Q
         8kO75Ey0/icDvhYaiNtdBPIF6btX9S4jc6cGLKNDjnJYAatd0BzbGwnIQ6djBTZdY9Uj
         NiP94xWT/s027SggKFBPaCcHfFu2O+4DUDucoE9w+bUHFZ1G2FjDkFZPKQ7jUn/S4Vyg
         kpku0aICjYBSZd2iF1L+/bpRARern/KUZdOYGvuVHhBzrzAm5FOwi/xtfEhIaFk9m7W4
         xPLmKpsr+LYvDnwMuAV9bqsorhT5j5+1OdT87R4Yj45CKah/BEEwdS2bbhqndw5fjjsZ
         aNPA==
In-Reply-To: <1345652628-15060-1-git-send-email-fweisbec@gmail.com>
Sender: linux-parisc-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Chris Zankel <chris@zankel.net>, "3.2.x.." <stable@kernel.org>, Chen Liqin <liqin.chen@sunplusct.com>, Lennox Wu <lennox.wu@gmail.com>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Parisc <linux-parisc@vger.kernel.org>, David Howells <dhowells@redhat.com>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, m68k <linux-m68k@lists.linux-m68k.org>, Hirokazu Takata <takata@linux-m32r.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Cris <linux-cris-kernel@axis.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>

On Wed, Aug 22, 2012 at 6:23 PM, Frederic Weisbecker <fweisbec@gmail.com> wrote:
> So this fixes some potential RCU stalls in a bunch of architectures.
> When rcu_idle_enter()/rcu_idle_exit() became a requirement, we forgot
> to handle the architectures that don't support CONFIG_NO_HZ.
>
> I guess the set should be dispatched into arch maintainer trees.

I can take the m68k version, but are you sure you want it this way?
Each of them must be in mainline before they can enter stable.

> I'm sorry I haven't built tested everywhere. But the changes are
> small and need to be at least boot tested anyway.

Builds and boots fine on m68k under ARAnyM.
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> (for m68k)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Wed, 15 Sep 2021 12:50:22 -0700
Message-ID: <CAHk-=whSkMh9mc7+OSBZZvpoEEJmS6qY7kX3qixEXTLKGc=wgw@mail.gmail.com>
References: <20210915035227.630204-1-linux@roeck-us.net> <CAHk-=wjXr+NnNPTorhaW81eAbdF90foVo-5pQqRmXZi-ZGaX6Q@mail.gmail.com>
 <47fcc9cc-7d2e-bc79-122b-8eccfe00d8f3@roeck-us.net> <CAHk-=wgdEHPm6vGcJ_Zr-Q_p=Muv1Oby5H2+6QyPGxiZ7_Wv+w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-sparse-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nI3oXjB5y7fgBDUAfkrt5Qjrdw7kij1HF6V7usZScd0=;
        b=dDkQ2iIzDzvrHagUv0HQt/yEqNuVlVfROtNamlO02CizTu2FICtXWd210Bes/CwlqB
         vjF/fdxzFxIz7v0M5Mc4QD77K9x8ec18TENbGfCqGbSG3HiLnbhqoA4lCtQEqvSsm3+w
         v6hYS+kH7FyOqPuDkRIGswKh56YqlIWBTmiYA=
In-Reply-To: <CAHk-=wgdEHPm6vGcJ_Zr-Q_p=Muv1Oby5H2+6QyPGxiZ7_Wv+w@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On Wed, Sep 15, 2021 at 12:47 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> What other notable issues end up being still live? I sent out that one
> patch for sparc, but didn't get any response to it. I'm inclined to
> just apply it (the 'struct mdesc_hdr' pointer misuse one).

Oh, I forgot about the qnx4 one. That happens on sparc, possibly
others, but not on x86-64.

I'll go look at that patch too.

          Linus

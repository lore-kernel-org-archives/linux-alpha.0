From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Thu, 16 Sep 2021 12:47:01 -0700
Message-ID: <CAHk-=wiQPjD_XKhVLyB4w2O6Rsi8mq256qVuhR8jMTSwrMPDqg@mail.gmail.com>
References: <20210915035227.630204-1-linux@roeck-us.net> <CAHk-=wjXr+NnNPTorhaW81eAbdF90foVo-5pQqRmXZi-ZGaX6Q@mail.gmail.com>
 <47fcc9cc-7d2e-bc79-122b-8eccfe00d8f3@roeck-us.net> <CAHk-=wgdEHPm6vGcJ_Zr-Q_p=Muv1Oby5H2+6QyPGxiZ7_Wv+w@mail.gmail.com>
 <20210915223342.GA1556394@roeck-us.net>
Mime-Version: 1.0
Return-path: <linux-sparse-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oRD/cMRbGRL8eW9YNojc5SAnY20xvnXQSyOWFqi/OgQ=;
        b=VVedPAhhXvqQiPi13tSyQOLX8u5tNTR/9Sk0cDvJUoqRmAyM4xwFgAcTzMuUX3x8Qm
         ZQSuXCv1rMT2Y3TZ2fWhNMyoutGjZ6WJE5Xps077l5ng1SPHi96pbXaQZWkufjbUsJ8E
         SwaYeBwWS7O0ujHzV9O6zJeM0kMWN0lvLs7ok=
In-Reply-To: <20210915223342.GA1556394@roeck-us.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>, Andreas Koensgen <ajk@comnets.uni-bremen.de>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On Wed, Sep 15, 2021 at 3:33 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> drivers/net/hamradio/6pack.c: In function 'sixpack_open':
> drivers/net/hamradio/6pack.c:71:41: error:
>         unsigned conversion from 'int' to 'unsigned char' changes value from '256' to '0'
>
> patch:
>         https://lore.kernel.org/lkml/20210909035743.1247042-1-linux@roeck-us.net/
> David says it is wrong, and I don't know the code well enough
> to feel comfortable touching that code. That may be a lost cause.
> "depends on BROKEN if ALPHA" may be appropriate here.

David is wrong.

The code here is bogus, and the docs clearly state that the transmit
data is in units of "10ms":

    https://www.linux-ax25.org/wiki/6PACK

and that

    #define SIXP_TXDELAY                    (HZ/4)  /* in 1 s */

is just wrong, and the actual *uses* of that TX timeout seems correct
for that 10ms value:

        mod_timer(&sp->tx_t, jiffies + ((when + 1) * HZ) / 100);

ie that "when" is clearly given in 100ths of a second, aka 10ms (ok,
that's mainly SIXP_SLOTTIME, with SIXP_TXDELAY being used mainly to
transfer the data to the other side).

So from everything I can see, your patch is correct.

Of course, to make things more confusing, the RESYNC_TIMEOUTs are
indeed given in ticks.

I spent too much time looking at this, but I'm going to apply that
patch. I suspect either nobody uses that driver any more, or the
TXDELAY values don't actually much matter, since they have clearly
been wrong and depended on random kernel configs for a long long time.

I think the most common HZ value on x86 tends to be the modern default
of 250Hz, so the old "HZ/4" means that most people got a TXDELAY of
620ms, rather than the traditional expected 250ms.

The fact that this shows up as an actual compile error on alpha is
just random luck, since alpha uses a 1024Hz clock. CONFIG_HZ_1000
isn't impossible on other platforms either, which happens to compile
cleanly, but causes that TXDELAY byte to sent out as 250, for a 2.5Hz
TX delay.

Of course, it is possible that it's the documentation that is wrong,
but considering that the documentation matches the code (see above on
that "((when + 1) * HZ)/100"), and matches the "it doesn't cause
compiler warnings", I think it's pretty clear that your patch is the
correct fix.

           Linus

From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Wed, 15 Sep 2021 14:19:39 -0700
Message-ID: <CAHk-=wjynK7SSgTOvW7tfpFZZ0pzo67BsOsqtVHYtvju8F_bng@mail.gmail.com>
References: <20210915035227.630204-1-linux@roeck-us.net> <CAHk-=wjXr+NnNPTorhaW81eAbdF90foVo-5pQqRmXZi-ZGaX6Q@mail.gmail.com>
 <47fcc9cc-7d2e-bc79-122b-8eccfe00d8f3@roeck-us.net> <CAHk-=wgdEHPm6vGcJ_Zr-Q_p=Muv1Oby5H2+6QyPGxiZ7_Wv+w@mail.gmail.com>
 <CAHk-=whSkMh9mc7+OSBZZvpoEEJmS6qY7kX3qixEXTLKGc=wgw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-sparse-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w3BMwFy0chXS7YMqLdf36Rg6yUUlp6nBZba3YILPvA0=;
        b=WsNqD0Opa3lPgwayobITOeBYzY09REebVD84cTigbwiVy8RERoiSXisEu8y+Nk+bfI
         rwr6ffFTpZComKTqahfaOR7CdEVqoy7csTG2SKHpEYZNr9AVK2EZciaTVWrgEw6jv2ed
         w803wR6rUWc2E3pW5t7Ag7qcjFS9X02JepaeA=
In-Reply-To: <CAHk-=whSkMh9mc7+OSBZZvpoEEJmS6qY7kX3qixEXTLKGc=wgw@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On Wed, Sep 15, 2021 at 12:50 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Sep 15, 2021 at 12:47 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > What other notable issues end up being still live? I sent out that one
> > patch for sparc, but didn't get any response to it. I'm inclined to
> > just apply it (the 'struct mdesc_hdr' pointer misuse one).
>
> Oh, I forgot about the qnx4 one. That happens on sparc, possibly
> others, but not on x86-64.
>
> I'll go look at that patch too.

Ok, I didn't love any of the patches I saw for the qnx4 problem, so I
silenced that warning with a new patch of my own. Like the sparc64
case, the fix is to describe more extensively to the compiler what the
code is actually doing.

I think it ended up making it clearer what is going on to humans too.
Although that may be the old "peeing in the snow" effect - it looks
more understandable to me only because I spent so much time trying to
understand what it does, and then wrote the fix based on that possibly
flawed understanding. So of course I find it more understandable.

Looking at the qnx4 code-base history, I don't think it has gotten any
actual development outside of cleanups in the git history timeframe,
which makes me suspect nobody uses this code.

But hey, maybe it just works so well for the very specialized user base ...

Anyway, I pushed it out. I have a clean "allmodconfig" build on all
the architectures I tested, but I didn't test _that_ many.  sparc64,
arm64, powerpc64.

Lots of dts warnings (which aren't fatal), though. Particularly for
the powerpc64 build.

             Linus

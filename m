From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Sat, 18 Sep 2021 10:04:20 -0700
Message-ID: <CAHk-=whY5mLggPSr2U00mqgUbRJYnYSxtNZm4FnEtQrHftYr8Q@mail.gmail.com>
References: <20210918095134.GA5001@tower> <202109181311.18IDBKQB005215@valdese.nms.ulrich-teichert.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=StUaahVx5e7+NokI5/qGGzRBPBdQYp4qliDoUWcQ+NI=;
        b=O2VVgZ/0BYoSNWucGr1isvjpQO49OJDF6pzVPSwvw//fNoDVP6xUldb1YiKIncajMB
         iQJJAmxcMdy4SuMhhkT7Zk59C6pD0MGNxyFFsrHY6L3H6c56+67tvszfXITs496M24VY
         8lGb3v+QzA+t9z0ONhrXILrIVYnVmAonIk2YQ=
In-Reply-To: <202109181311.18IDBKQB005215@valdese.nms.ulrich-teichert.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ulrich Teichert <krypton@ulrich-teichert.org>
Cc: Michael Cree <mcree@orcon.net.nz>, Guenter Roeck <linux@roeck-us.net>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

On Sat, Sep 18, 2021 at 6:11 AM Ulrich Teichert
<krypton@ulrich-teichert.org> wrote:
>
> Hi,
>
> >
> > On Thu, Sep 16, 2021 at 11:35:36AM -0700, Linus Torvalds wrote:
> > > Naah. I think the Jensen actually had an ISA slot. Came with a
> > > whopping 8MB too, so the ISA DMA should work just fine.
> > >
> > > Or maybe it was EISA only? I really don't remember.
>
> It's EISA only. I've made some pictures of a somewhat dusty inside of
> a Jensen with 4 EISA cards (from bottom to top: SCSI, video, 2x network):

Ok.

Looking around the config options, there _are_ systems with ISA slots,
but it's not the old Jensen one. It's apparently some evaluation
boards but also the "AlphaPC64" one.

So we do want CONFIG_ISA for alpha, even if not Jensen.

(I forget which alpha I had. For some reason I want to think I had an
EISA machine and probably Jensen. Maybe upgraded to a 164 later?)

> I could not get a recent kernel to boot, but it's booting ancient kernels
> just fine:
>
> Linux version 2.4.27-2-generic (tretkowski@bastille) (gcc version 3.3.5 (Debian 1:3.3.5-12)) #1 Sun May 29 18:40:58 UTC 2005

Ouch. Without having some kind of bisection, I guess we'll never know.
And I assume it's not really been tested since, so it could be
multiple reasons, including compiler updates causing dodgy code to not
work etc etc.

> While we're at it, during my vain attempts to get new kernels to boot,
> I tried to disable PCI support to make the kernels smaller (after all,
> the Jensen has only EISA, so what good would PCI support for?) and
> got it to compile with the attached patch (which fixes some warnings,
> too).

Can you send me your Jensen config?

I do not see why you should be using that horrible __EXERN_INLINE. It
will cause gcc to sometimes not inline at all, and not generate the
out-of-line body either.

Sometimes that is what you want: you want to generate one single body
of the function, and particularly one that is _different_ from the
inlining case (ie for inlining you want to do the simple thing, for
out-of-line you do something fancier).

But that isn't the case here, so this looks like a workaround for
something else. But this code does end up using preprocessor
concatenation etc, so I might be missing some case.

             Linus

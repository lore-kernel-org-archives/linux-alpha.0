From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] Alpha: Remove redundant local asm header redirections
Date: Sat, 25 Feb 2023 21:08:16 -0500
Message-ID: <CAEdQ38GOQxCA53WWzh8FBbsAKe42sARv5n24cWvvi60Q272jwg@mail.gmail.com>
References: <alpine.DEB.2.21.2202131944000.34636@angie.orcam.me.uk>
 <CAEdQ38EpBMnkP-PNZnwaoO4poFJQO5YSFJeZgiQ-obJmjogBFQ@mail.gmail.com> <alpine.DEB.2.21.2204150100380.9383@angie.orcam.me.uk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qT0gdPeLmhMzH6//xbPyFh4VuSW1FnICCx+6PynbN+w=;
        b=gcaQjyjZIcwBaVHU8T1XmPHxNftLyJYZhGbEM8kxRip5sEja4CO6uvKl5tjEbSTlQ4
         JCAYq8hhHO/91Z81F2oXQhMmGjUshgEVKtEPakOVov6CKwh4Y32KbnUNlkmwH3uhW0iw
         x0jkwLS0yBJ+4Yaz2ZWddaU8h01jvKQnKc9MLG99yhm2tpML0L0Y0Ibme7GfLZpogVJL
         gK0tNnbqNtpokinly5pVaW0u8OXHrpGUHkuOaxmgvGS2YwO/Md4lhCN52f4fWJPa87LZ
         VemgTACIuGhDDhaRMcBPsQAQa40OW2PGfODyhSvITyJ79c03JbKG0F/nQdV3IENNshuJ
         QMUg==
In-Reply-To: <alpine.DEB.2.21.2204150100380.9383@angie.orcam.me.uk>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Apr 15, 2022 at 8:26 AM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> On Thu, 14 Apr 2022, Matt Turner wrote:
>
> > Sorry for the delay. I'll apply this. I just haven't had much time for
> > alphas lately.
>
>  No worries, and thanks for chiming in.  I plan to get one of my Alphas
> set up and wired in my remote lab later this year, so I hope to get a bit
> more active with the port.  At least I've got a reasonably recent build of
> the toolchain:
>
> $ alpha-linux-gnu-gcc --version
> alpha-linux-gnu-gcc (GCC) 12.0.1 20220129 (experimental)
> [...]

Thanks for the patch! This was included in my pull request today and
is now upstream in Linus' tree.

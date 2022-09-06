From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: Use generic <asm-generic/io.h>
Date: Tue, 6 Sep 2022 10:59:42 -0400
Message-ID: <CAEdQ38FXieAyHHmP01czaMVC_wX8pzR=i0_-rhKMuzziJcFHNA@mail.gmail.com>
References: <20220818092059.103884-1-linus.walleij@linaro.org>
 <CAK8P3a1x52F8Ya3ShQ+v6x_jANfUsEq0E55u+pOBNaYniRO7cA@mail.gmail.com>
 <CACRpkdZemHScp9WW-7LaGtcXuvT2qzs_7nXS60icSWtPkEwMHg@mail.gmail.com> <8d931abd-ce7d-45da-b47c-239d4c7cd72f@www.fastmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=1TNLh/TqVl+pYztTYCnt8rmiWXduntS2OeyHRPQbFpo=;
        b=j9oFDST+2KjJ0+9CMMgqbDqqGqeDRg0f7I1KYoxAiP05lV99ZZfNC2D/VZdGPkiFjO
         T/gqAst9HPwT+5EI8mKqnjXW/nC5QTHiVQgWFoIfJ2LFB8XH+9d+UwcRK6MI5r/eRBWJ
         oEU8q6nG4zfAKdNewGXBvhOKK90csPunH0MDeSo1k90ZeyOR6E5y6Ji3EcD7vN6jNvNm
         I1hFYXq8+sNPcBq5FMHJlgfhT+BUgJrw6zzWSjOmO+poB1h4gBaIvbt7zDXuz0PzLLb1
         tHcjeRpQCoMUGsXxNbDq7ZK5xXlgIQ/i/lBaHX759dbcQ7FdKqx7Tpn/B55ly+D52Wk9
         i7uQ==
In-Reply-To: <8d931abd-ce7d-45da-b47c-239d4c7cd72f@www.fastmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>

On Mon, Sep 5, 2022 at 4:53 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Sep 5, 2022, at 9:30 PM, Linus Walleij wrote:
> > On Thu, Aug 18, 2022 at 12:28 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >> On Thu, Aug 18, 2022 at 11:20 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> >> > I'd like this applied to the alpha tree if there is such a
> >> > thing otherwise maybe Arnd can apply it to the arch generic
> >> > tree?
> >>
> >> Sure, I can do that.
> >
> > Could you apply this to the arch tree? I see no signs of life from
> > the alpha maintainers.
>
> Sure, I can do that. I also realized that we can actually fold
> all of asm-generic/io.h into linux/io.h directly once this is
> complete for all architectures. Probably better to leave that for
> 6.1 though.
>
> I wonder if I should also add send a patch to mark Alpha as
> 'Orphaned' like we did for arch/ia64 a while ago.
> It's already marked as 'Odd fixes', but the last pull request
> from Matt was over a year ago now.

Sorry, I've just completed a cross-country move and have generally
been very busy with real life for the last year or so.

My alphas are being unpacked now, so I'll try to catch up on things.
Feel free to take any alpha patches through the arch tree. I feel
confident that you have more of a clue about what's going on in kernel
land than I do.

Thanks,
Matt

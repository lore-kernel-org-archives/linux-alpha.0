From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] alpha: Use generic <asm-generic/io.h>
Date: Mon, 5 Sep 2022 21:30:47 +0200
Message-ID: <CACRpkdZemHScp9WW-7LaGtcXuvT2qzs_7nXS60icSWtPkEwMHg@mail.gmail.com>
References: <20220818092059.103884-1-linus.walleij@linaro.org> <CAK8P3a1x52F8Ya3ShQ+v6x_jANfUsEq0E55u+pOBNaYniRO7cA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=fOjvm1AMsZ4nR0oKVwuUuwq6yRIdBGx8cQ5CH0pdOQ8=;
        b=mEBD5Ir8YMB4+1XemGmtRKWBA4PgrHa65B5dZBHw+q9qZY/fFLZAzWJtnnjt3ZabJ1
         k030tzzoAkffYwspwGcjthTDzsdHLi1/EfD5ZrIKQ81gBWJ+iFLi0rB47a8BoHQ1u+Mc
         ONLy2GkBHoKxccBbjIM3ToQDSmBmmUQCVAkJSWv4nkokAx3LqfcZUkbkUWgZc7Unaeoa
         poaOdJs1SSKb8ToZvDtPGjWuP8kkxkwRsMcwiWGeOPNcTEVrtAFYZn6SemA6NMADQmZJ
         +g5EZ+4ms2uJrfpHxIDKT7OlQqfQPnrzMLafL9vYFw9mXzLhNWt3cXdzgwgZ5MvcFakY
         AzVw==
In-Reply-To: <CAK8P3a1x52F8Ya3ShQ+v6x_jANfUsEq0E55u+pOBNaYniRO7cA@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>, linux-arch@vger.kernel.org

Hi Arnd,

On Thu, Aug 18, 2022 at 12:28 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Thu, Aug 18, 2022 at 11:20 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> > I'd like this applied to the alpha tree if there is such a
> > thing otherwise maybe Arnd can apply it to the arch generic
> > tree?
>
> Sure, I can do that.

Could you apply this to the arch tree? I see no signs of life from
the alpha maintainers.

> > +/*
> > + * These defines are necessary to use the generic io.h for filling in
> > + * the missing parts of the API contract. This is because the platform
> > + * uses (inline) functions rather than defines and the generic helper
> > + * fills in the undefined.
> > + */
> > +#define virt_to_phys virt_to_phys
> > +#define phys_to_virt phys_to_virt
> > +#define memset_io memset_io
> > +#define memcpy_fromio memcpy_fromio
>
> We tend to have these next to the function definition rather than
> in a single place. Again, I'm not too worried here, just if you end
> up reworking the patch in some form, or doing the same for the
> other architectures that would be the way to do it.

I looked into this, for parisc it was pretty straight forward. alpha has
a bunch of competing static inlines and externs and what not, I don't
see it helping to inline this, IMO it's actually better like this: "those
were defined somewhere in the birdnest of ifdefs above".

If it is a big issue I can start to pry into it.

Yours,
Linus Walleij

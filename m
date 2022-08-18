From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] alpha: Use generic <asm-generic/io.h>
Date: Thu, 18 Aug 2022 12:28:29 +0200
Message-ID: <CAK8P3a1x52F8Ya3ShQ+v6x_jANfUsEq0E55u+pOBNaYniRO7cA@mail.gmail.com>
References: <20220818092059.103884-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <20220818092059.103884-1-linus.walleij@linaro.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>, linux-arch@vger.kernel.org

On Thu, Aug 18, 2022 at 11:20 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This enables the alpha to use <asm-generic/io.h> to fill in the
> missing (undefined) I/O accessor functions.
>
> This is needed if Alpha ever wants to uses CONFIG_REGMAP_MMIO
> which has been patches to use accelerated _noinc accessors
> such as readsq/writesq that Alpha, while being a 64bit platform,
> as of now not yet provide. readq/writeq is however provided
> so the machine can do 64bit I/O.
>
> This comes with the requirement that everything the architecture
> already provides needs to be defined, rather than just being,
> say, static inline functions.
>
> Bite the bullet and just provide the definitions and make it work.

I see the only other architectures that don't use asm-generic/io.h
yet are hexagon, mips, parisc, sh and sparc64. I wonder if it would
make sense to do this for all of them.

> Alternative approaches:
>
> - Implement proper readsq/writesq inline accessors for alpha

that would be ok with me

> - Rewrite the whole world of io.h to use something like __weak

>   instead of relying on defines
Nak to the use of __weak in anything I maintain, I find this to
be highly confusing whenever I try to find out what code is actually
getting called.

> - Leave regmap MMIO broken on Alpha because none of its drivers
>   use it

no problem for me

> - Make regmap MMIO depend of !ARCH_ALPHA

This doesn't work, because REGMAP_MMIO is selected by 150
drivers: unless you mark each of these individually as 'depends
on !ALPHA', you just get an addition warning from Kconfig
but it still fails to build.

> The latter seems a bit over the top. First option to implement
> readsq/writesq seems possible but I cannot test it (no hardware)
> so using the generic fallbacks seems like a better idea, also in
> general that will provide future defaults for accelerated defines.
>
> Leaving regmap MMIO broken or disabling it for Alpha feels bad
> because it breaks compiler coverage.

I'm not worried about compiler coverage on the less common
architectures, there is little hope of getting random configurations
to build because there are too many other problems.

> I'd like this applied to the alpha tree if there is such a
> thing otherwise maybe Arnd can apply it to the arch generic
> tree?

Sure, I can do that.

> +/*
> + * These defines are necessary to use the generic io.h for filling in
> + * the missing parts of the API contract. This is because the platform
> + * uses (inline) functions rather than defines and the generic helper
> + * fills in the undefined.
> + */
> +#define virt_to_phys virt_to_phys
> +#define phys_to_virt phys_to_virt
> +#define memset_io memset_io
> +#define memcpy_fromio memcpy_fromio

We tend to have these next to the function definition rather than
in a single place. Again, I'm not too worried here, just if you end
up reworking the patch in some form, or doing the same for the
other architectures that would be the way to do it.

      Arnd

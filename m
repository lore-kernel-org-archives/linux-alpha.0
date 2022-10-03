From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] alpha: Use generic <asm-generic/io.h>
Date: Mon, 3 Oct 2022 20:49:07 +0200
Message-ID: <CACRpkdbb7OVy7Vg1KGphw5zLLSTCR+hjJPdFyzs4HQBdw-iMow@mail.gmail.com>
References: <20220818092059.103884-1-linus.walleij@linaro.org>
 <20221002224521.GA968453@roeck-us.net> <fd905ca5-fe0d-4cfb-a0d0-aea8af539cc7@app.fastmail.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=mW0eP1euyTsPufJF3RY6mTasIPwML94yQM8WRieMZv8=;
        b=qQ3UFfhUG4hy4flmVEo19VHjI0ro2bfcPzLjrd7J0A0+0iR41B7TsRFHg4EuUp1DuV
         bCIg4RDg0XRoCnUT6HYlVm4Gv1MbJR2oM51uXQwsRXF2etP263r86D+0Q4bfBI5CYkcg
         wzGzXhrfq1d4eQxPMv7H5DTcDV6dZj+rXa09Xiex27xf9AXV3WiV0MthHDM7yNx6lnlY
         g/jocUTOuCWvRByQ1IgEtXfkcwXcvYu5THZFq8XSeiszjWlZzq+Uy4yx3qBeFItqpXtL
         U4os3n2rHOFEgNpXVXaJN1qvVxtR2iow/rbauane4zOtrYf8W3WEv296qKR0EVxPuSIL
         KslQ==
In-Reply-To: <fd905ca5-fe0d-4cfb-a0d0-aea8af539cc7@app.fastmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>

On Mon, Oct 3, 2022 at 3:04 PM Arnd Bergmann <arnd@arndb.de> wrote:

> From 258382f3ca77b0e50501a0010d8c9abc2d4c51c8 Mon Sep 17 00:00:00 2001
> From: Arnd Bergmann <arnd@arndb.de>
> Date: Mon, 3 Oct 2022 13:12:54 +0200
> Subject: [PATCH] alpha: add full ioread64/iowrite64 implementation
>
> The previous patch introduced ioread64/iowrite64 declarations, but
> this means we no longer get the io-64-nonatomic variant, and
> run into a long error when someone actually wants to use these:
>
> ERROR: modpost: "ioread64" [drivers/net/ethernet/freescale/enetc/fsl-enetc.ko] undefined!
>
> Add the (hopefully) correct implementation for each machine type,
> based on the 32-bit accessor. Since the 32-bit return type does
> not work for ioread64(), change the internal implementation to use
> the correct width consistently, but leave the external interface
> to match the asm-generic/iomap.h header that uses 32-bit or 64-bit
> return values.
>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 7e772dad9913 ("alpha: Use generic <asm-generic/io.h>")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

This patch was really sweet for Alpha, it makes all of the code
more complete and consistent.

Yours,
Linus Walleij

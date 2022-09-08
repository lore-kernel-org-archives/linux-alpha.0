From: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH v2] alpha: Use generic <asm-generic/io.h>
Date: Thu, 08 Sep 2022 16:52:42 +0200
Message-ID: <67ecb725-2e2d-4aae-8c99-76fad5875080@www.fastmail.com>
References: <20220906185939.765081-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1662648785; x=1662652385; bh=kS0JpLcQIj
        ApaQj6/G8PpIMa+Bvf17l4VEilnzuZytk=; b=FGnLltUvdfBYpJDr5Uvp6kDZJ6
        WFoYLQXjcYRVAX/qmhJKfVdhksV4sh2PZuXs560JSWPighI/y9YTPb08H/xZ/hlL
        uV4SneEx+HjtV6bKY5XQl3faYtXdkIXB0zJaQQ4LbriXqS7usT5YwUGrgp5Ln2ax
        QesROQ/JDS2Gn5AsJ+cFFMBpKVTG9JGVDamYpUMHj1i0O6cnZTLJgQ2WXaQj2vQq
        JD+MYZIkvYGXZIDUnPg67vPBGgmxnqrGC3pLRz8M5gH6RjXLfJqGSPuwhBq6psge
        nfbQO1iGR+2/YFoQvUJ/7GviFGNVaG/1pHaG+IwcRd74ZqHc3ahgosvBxT6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1662648785; x=1662652385; bh=kS0JpLcQIjApaQj6/G8PpIMa+Bvf
        17l4VEilnzuZytk=; b=pYC6sf+zD9VOpzCRSngPA5GkUOOAi5c1aLixA22nSSop
        4Z62vUmL/h5l2lbpQPocUdwr6yaxYQLZ9Sn+sB0cl4iZEjQ+nUeoy0lsEGOmi+5H
        sYEMQJJpwHgmia2XwYutWSmDZjqz+7/CRzw4PaCW0UY9/MiebiQne+B5sAFOTRdJ
        FTpGAQCbU5WQMvmbCdo+ja81QslIibF1ZeIDSor6KBy9NirrMQaGvZ/pRKgv0HgE
        vfNmC17f6sbaXKVGsTeqL3harDUe96S1GL/WX9ei82T+XFDhUvYqj1nyJaP9bDxx
        hLesLBfjnhQtG7f1QjFeS36AKGFbj24My8QhFWforQ==
In-Reply-To: <20220906185939.765081-1-linus.walleij@linaro.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>

On Tue, Sep 6, 2022, at 8:59 PM, Linus Walleij wrote:
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
>
> Some defines need to be piled right before the inclusion of
> <asm-generic/io.h> due to the fact that alpha is including
> <asm-generic/iomap.h> without selecting GENERIC_IOMAP.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/linux-mm/202208181447.G9FLcMkI-lkp@intel.com/
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-arch@vger.kernel.org
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied to asm-generic tree, thanks

     Arnd

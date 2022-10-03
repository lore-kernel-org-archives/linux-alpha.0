From: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH] alpha: Fix ioread64/iowrite64 helpers
Date: Mon, 03 Oct 2022 15:04:41 +0200
Message-ID: <49e40308-969f-4b22-a8b5-d7f07e50b8ef@app.fastmail.com>
References: <20221003121316.2540339-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1664802302; x=1664805902; bh=IxedUfhaz4
        AE03vRli7rrJA0oAe3quAOi2FtrsBi/Mc=; b=r9Jdkr/Gr2Kj90IOTigFzOwng6
        fKoFfmdStbz0Wp11GyjQWUrFGqRFUF2hc3m6LeIgE1nJ28dtffrjUZPy50SEFPJu
        no9TYq7W/qbO+PndUGrUGzvMI0vnywcWV9xpQel8FMq+GdkBXl8x3uWOBfLyeUiK
        zOHrhCE/LVAiIOVaVOfO83wWrl54GvkAcEHfIfC0bN5CUgJ4YPp5TY70/6oUni2p
        upUsf9URei5ajXHxw1ZzXHSX9RH+oeQJwKdc9814sbN78a1ikDIoj4b7qNYS+Aki
        LuLTmR0KbEKC8sHPADPhOGZwRpITScr/9SuPLWoWOMDCAwhaW/YoYC5HDPZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1664802302; x=1664805902; bh=IxedUfhaz4AE03vRli7rrJA0oAe3
        quAOi2FtrsBi/Mc=; b=bdjKk2+P6AyfC5zmWszJzPY3kYCbXYq+dq9qC44CR7Dh
        TunlFhpT1JSgYutT3fvqpXpuIDV3L7aggs3H5/VoBE7gdveGxzz+NWjGmTCrx7nR
        3AzAbzPv5cZpGUA4Ch44Vma+wR66Bd6uRNztEpxEepP7HwIDXQiVplZc3LxQoQ6z
        VTVy0wNEF0kIb6CG2Jjh0vIDfIDCvcZD4dh0KSCn87LiGVi8FwFjW9SZiOOfvYUj
        pv1PktfE6zU6v2jCn0X+tcOi0oB18vrTPgoZPs7zskjHtF7+K45jtIN8PgU114c0
        8ZY6peAZ/HI/ZHlDQpmom8QXSXu2qQp3KxETPg8gWg==
In-Reply-To: <20221003121316.2540339-1-linus.walleij@linaro.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Linux-Arch <linux-arch@vger.kernel.org>

On Mon, Oct 3, 2022, at 2:13 PM, Linus Walleij wrote:
> When doing allmod builds it turns out some modules are using
> ioread64() and iowrite64() that the alpha does not implement,
> as it is using <asm-generic/iomap.h> without selecting
> GENERIC_IOMAP.
>
> Fix this by implementing the ioread64()/iowrite64() stubs
> as well, using readq() and writeq() respectively.
>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 7e772dad9913 ("alpha: Use generic <asm-generic/io.h>")
> Link: https://lore.kernel.org/linux-arch/20221002224521.GA968453@roeck-us.net/
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-arch@vger.kernel.org
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Arnd if this looks OK then please apply it on linux-arch
> for fixes.
> --

It looks like we just crossed patches. I also sent a fix a minute
ago, but I think mine is better here because it also works on
I/O ports.

     Arnd

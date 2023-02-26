From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: update config files
Date: Sat, 25 Feb 2023 21:06:14 -0500
Message-ID: <CAEdQ38Gp0rFZjpRKsrYp94WyBQPB6=7YbHu6JvjYwf2odx+TgQ@mail.gmail.com>
References: <20220929101329.31036-1-lukas.bulwahn@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EFQbRxHSsPKNCItLK55Hjyu7uq3Glv5bk5SL/HPENLw=;
        b=pWl9WeshiUsJJpSN94ckZrzGj8ltCX4QfX3dzF6nARHNtRoAXdghfuRZf4/vGXUJUW
         sBbfR7GSZoF0L4vP+oi5w9YxWVGK5Pn2hSymO9bcaYg1mCtKrdACDzuRlCbzHJUPJneR
         cS2G2kA5UMrR+ly5+pz6W/9B6XhTQjXg/0KUsNeOZ1VLEqTINL8i3AW6u6o7vegrbjfN
         XQSqyClPFVy1LrEHgCTr5711M4o6uUvyAKzqWRwfhQOUXdW5A6/iIpIMvX3k+AV3gboi
         2cCgVlNGbFIlazjeF+pRTo/tSfOhu+E9riJK6xid9d+sz7NMmkGcAqCUEwKXOtFlS+ox
         HU/A==
In-Reply-To: <20220929101329.31036-1-lukas.bulwahn@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org

On Thu, Sep 29, 2022 at 6:14 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Clean up config files by:
>   - removing configs that were deleted in the past
>   - removing configs not in tree and without recently pending patches
>   - adding new configs that are replacements for old configs in the file
>
> For some detailed information, see Link.
>
> Link: https://lore.kernel.org/kernel-janitors/20220929090645.1389-1-lukas.bulwahn@gmail.com/
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  arch/alpha/configs/defconfig | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/alpha/configs/defconfig b/arch/alpha/configs/defconfig
> index 6a39fe8ce9e5..1816c1dc22b1 100644
> --- a/arch/alpha/configs/defconfig
> +++ b/arch/alpha/configs/defconfig
> @@ -39,14 +39,12 @@ CONFIG_PATA_CYPRESS=y
>  CONFIG_ATA_GENERIC=y
>  CONFIG_NETDEVICES=y
>  CONFIG_DUMMY=m
> -CONFIG_NET_ETHERNET=y
>  CONFIG_NET_VENDOR_3COM=y
>  CONFIG_VORTEX=y
>  CONFIG_NET_TULIP=y
>  CONFIG_DE2104X=m
>  CONFIG_TULIP=y
>  CONFIG_TULIP_MMIO=y
> -CONFIG_NET_PCI=y
>  CONFIG_YELLOWFIN=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
> --
> 2.17.1
>

Thanks for the patch! This was included in my pull request today and
is now upstream in Linus' tree.

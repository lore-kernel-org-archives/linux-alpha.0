From: Jeroen Roovers <jer@xs4all.nl>
Subject: Re: [PATCH 2/4] net: i825xx: Use absolute_pointer for memcpy on
 fixed memory location
Date: Sun, 12 Sep 2021 18:11:48 +0200
Message-ID: <20210912181148.60f147c8@wim.jer>
References: <20210912160149.2227137-1-linux@roeck-us.net>
        <20210912160149.2227137-3-linux@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1631463114; bh=Rkh5fe5ckn+qv2he4b3qNVogdA8plV7NpPMyL17OrJ0=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From:
         Subject;
        b=tpeNy1kSwSoI+lvdLcKG52+7AwavVNtPziXnSj8+4LWYS6LcGN4DDcnfVZ9v7W33z
         LSUjGuJcEw1KjQK/Nnl7I+SlZA3MPWMlCQMiS5oqo7hpOPJCnhYFHBWJiFcYZSEm+X
         46nzMB1D8F2muY/J8Jaq1ou/0U9CY94ZMayOJGuOldK0QQUQmU0HiFLdHLUfi6i8HJ
         GCw1YTrgoKsLiqVge5lE1ogiNLSeh3E3kjLrdgqJqkZMOhfuoFlYfA3XovSQee9pSy
         bc3Hg9btUwwzvcQ9y5f54BKWWIXNc7GR5n/Zkq4rjVmMyv9rzPffGwbNGKGNULjOpC
         Kq86eZmK0HkyA==
In-Reply-To: <20210912160149.2227137-3-linux@roeck-us.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-sparse@vger.kernel.org

On Sun, 12 Sep 2021 09:01:47 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> gcc 11.x reports the following compiler warning/error.
> 
> drivers/net/ethernet/i825xx/82596.c: In function 'i82596_probe':
>     ./arch/m68k/include/asm/string.h:72:25: error:
>             '__builtin_memcpy' reading 6 bytes from a region of size 0
>                     [-Werror=stringop-overread]
> 
> Use absolute_address() to work around the problem.

=> absolute_pointer()

> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/net/ethernet/i825xx/82596.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/i825xx/82596.c
> b/drivers/net/ethernet/i825xx/82596.c index
> b8a40146b895..b482f6f633bd 100644 ---
> a/drivers/net/ethernet/i825xx/82596.c +++
> b/drivers/net/ethernet/i825xx/82596.c @@ -1144,7 +1144,7 @@ static
> struct net_device * __init i82596_probe(void) err = -ENODEV;
>  			goto out;
>  		}
> -		memcpy(eth_addr, (void *) 0xfffc1f2c,
> ETH_ALEN);	/* YUCK! Get addr from NOVRAM */
> +		memcpy(eth_addr, absolute_pointer(0xfffc1f2c),
> ETH_ALEN); /* YUCK! Get addr from NOVRAM */ dev->base_addr =
> MVME_I596_BASE; dev->irq = (unsigned) MVME16x_IRQ_I596;
>  		goto found;


Regards,
      jer

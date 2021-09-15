From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/4] net: i825xx: Use absolute_pointer for memcpy from
 fixed memory location
Date: Wed, 15 Sep 2021 09:08:19 +0200
Message-ID: <CAMuHMdXM8qq-J_jHjkpNByvKqXG5_NbP-G43NsjKBDyFhS6ufQ@mail.gmail.com>
References: <20210915035227.630204-1-linux@roeck-us.net> <20210915035227.630204-3-linux@roeck-us.net>
Mime-Version: 1.0
Return-path: <linux-sparse-owner@vger.kernel.org>
In-Reply-To: <20210915035227.630204-3-linux@roeck-us.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, netdev <netdev@vger.kernel.org>, linux-sparse@vger.kernel.org

On Wed, Sep 15, 2021 at 5:52 AM Guenter Roeck <linux@roeck-us.net> wrote:
> gcc 11.x reports the following compiler warning/error.
>
> drivers/net/ethernet/i825xx/82596.c: In function 'i82596_probe':
>     ./arch/m68k/include/asm/string.h:72:25: error:
>             '__builtin_memcpy' reading 6 bytes from a region of size 0
>                     [-Werror=stringop-overread]
>
> Use absolute_pointer() to work around the problem.
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

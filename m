From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/4] compiler.h: Introduce absolute_pointer macro
Date: Wed, 15 Sep 2021 09:07:47 +0200
Message-ID: <CAMuHMdWiAc_8Z5wK07c5Fi3Zf72RpPzqv32QHC=iYtBQpi=3dg@mail.gmail.com>
References: <20210915035227.630204-1-linux@roeck-us.net> <20210915035227.630204-2-linux@roeck-us.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20210915035227.630204-2-linux@roeck-us.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, netdev <netdev@vger.kernel.org>, linux-sparse@vger.kernel.org

On Wed, Sep 15, 2021 at 5:52 AM Guenter Roeck <linux@roeck-us.net> wrote:
> absolute_pointer() disassociates a pointer from its originating symbol
> type and context. Use it to prevent compiler warnings/errors such as
>
> drivers/net/ethernet/i825xx/82596.c: In function 'i82596_probe':
> ./arch/m68k/include/asm/string.h:72:25: error:
>         '__builtin_memcpy' reading 6 bytes from a region of size 0
>                 [-Werror=stringop-overread]
>
> Such warnings may be reported by gcc 11.x for string and memory operations
> on fixed addresses.
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

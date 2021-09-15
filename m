From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/4] compiler.h: Introduce absolute_pointer macro
Date: Wed, 15 Sep 2021 09:13:11 +0200
Message-ID: <CAMuHMdXZcrjGAE5OOipKsYpEgk9AZ_hrWKh+v81FMBtQTBv2LA@mail.gmail.com>
References: <20210915035227.630204-1-linux@roeck-us.net> <20210915035227.630204-2-linux@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sparse-owner@vger.kernel.org>
In-Reply-To: <20210915035227.630204-2-linux@roeck-us.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, netdev <netdev@vger.kernel.org>, linux-sparse@vger.kernel.org

Hi G=C3=BCnter,

On Wed, Sep 15, 2021 at 5:52 AM Guenter Roeck <linux@roeck-us.net> wrote:
> absolute_pointer() disassociates a pointer from its originating symbol
> type and context. Use it to prevent compiler warnings/errors such as
>
> drivers/net/ethernet/i825xx/82596.c: In function 'i82596_probe':
> ./arch/m68k/include/asm/string.h:72:25: error:
>         '__builtin_memcpy' reading 6 bytes from a region of size 0
>                 [-Werror=3Dstringop-overread]
>
> Such warnings may be reported by gcc 11.x for string and memory operations
> on fixed addresses.
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: No change
>
>  include/linux/compiler.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index b67261a1e3e9..3d5af56337bd 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -188,6 +188,8 @@ void ftrace_likely_update(struct ftrace_likely_data *=
f, int val,
>      (typeof(ptr)) (__ptr + (off)); })
>  #endif
>
> +#define absolute_pointer(val)  RELOC_HIDE((void *)(val), 0)

I guess we're not worried about "val" being evaluated multiple
times inside RELOC_HIDE(), as this is mainly intended for constants?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

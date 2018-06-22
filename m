From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] time: Make sure jiffies_to_msecs() preserves non-zero
 time periods
Date: Fri, 22 Jun 2018 15:09:59 +0200
Message-ID: <CAMuHMdW9FUMQ568GTJG_p9J8jFbVLOR6hPhsxsaMTttQjp=Wzw@mail.gmail.com>
References: <20180622075421.16001-1-geert@linux-m68k.org> <alpine.DEB.2.21.1806221446230.2402@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.1806221446230.2402@nanos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Gleixner <tglx@linutronix.de>
Cc: John Stultz <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>

Hi Thomas,

On Fri, Jun 22, 2018 at 2:49 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> On Fri, 22 Jun 2018, Geert Uytterhoeven wrote:
> > For the common cases where 1000 is a multiple of HZ, or HZ is a multiple
> > of 1000, jiffies_to_msecs() never returns zero when passed a non-zero
> > time period.
> >
> > However, if HZ > 1000 and not an integer multiple of 1000 (e.g. 1024 or
> > 1200, as used on alpha and DECstation), jiffies_to_msecs() may return
> > zero for small non-zero time periods.  This may break code that relies
> > on receiving back a non-zero value.
> >
> > jiffies_to_usecs() does not need such a fix, as <linux/jiffies.h> does
> > not support values of HZ larger than 12287, thus rejecting any
> > problematic huge values of HZ.
>
> Sorry, I'm not understanding that sentence at all.

Sorry for being unclear.

1 jiffy can only be less than 1=C2=B5s if HZ > 1000000.
But include/linux/jiffies.h checks if HZ >=3D 12288, and does #error otherw=
ise.
In addition, there's a "BUILD_BUG_ON(HZ > USEC_PER_SEC)" in time.c

> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> This lacks a stable tag, right?

Up to the maintainer to add, isn't it?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

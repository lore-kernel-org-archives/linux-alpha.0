From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/6] rtc: m68k: provide rtc_class_ops directly
Date: Wed, 27 Apr 2016 09:47:56 +0200
Message-ID: <CAMuHMdXS0JL_weLvjV4+i0ZPj=N+G6Vs1WDE9jffGUWehq5Xzg@mail.gmail.com>
References: <1461707551-1337971-1-git-send-email-arnd@arndb.de>
	<1461707551-1337971-2-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc;
        bh=xepca+tG7KGA9CRGzxyzyw+piAzr8+zMQmAzSA8qgNc=;
        b=XefMP4+d0QFkJXM2OyNzdElQCNaH77L1Aqj5v34/B6P77VE7M2bD8dQWYh5RCEzBTA
         kg3Vvs+KqewtiSHN/N6CgJLY3shN+di9TNsq0g82brgCbTa2vCnUdYR6DBEafWB361QJ
         AZEgXsvN8aivCO/K2GNOuuAFVXNEG9OleaY0GM0BV0Xjr8jQp7llbAOb/CQbQ7vBIN0L
         jOYPDzCXsgnOeL7zmY114D9uC4IFVRMiBpVDqSNEpThfZxd6P5mPRn7bDyw4zX6+muSe
         ijdNWNMBWfJF5gv2efIuSluc959LSTxy3pQ/aERgw6/33r/guWWyjTTCe/1kpAcDjhuq
         g7Ng==
In-Reply-To: <1461707551-1337971-2-git-send-email-arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Helge Deller <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Rich Felker <dalias@libc.org>, David Howells <dhowells@redhat.com>, alpha <linux-alpha@vger.kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Linux-sh list <linux-sh@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, RTCLINUX <rtc-linux@googlegroups.com>, Linux-Arch <linux-arch@vger.kernel.org>

Hi Arnd,

On Tue, Apr 26, 2016 at 11:52 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> The rtc-generic driver provides an architecture specific
> wrapper on top of the generic rtc_class_ops abstraction,
> and m68k has another abstraction on top, which is a bit
> silly.
>
> This changes the m68k rtc-generic device to provide its
> rtc_class_ops directly, to reduce the number of layers
> by one.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/m68k/kernel/time.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/arch/m68k/kernel/time.c b/arch/m68k/kernel/time.c
> index 3857737e3958..fe35890feede 100644
> --- a/arch/m68k/kernel/time.c
> +++ b/arch/m68k/kernel/time.c
> @@ -86,7 +86,24 @@ void read_persistent_clock(struct timespec *ts)
>         }
>  }
>
> -#ifdef CONFIG_ARCH_USES_GETTIMEOFFSET
> +#if defined(CONFIG_ARCH_USES_GETTIMEOFFSET) && defined(CONFIG_RTC_DRV_GENERIC)

s/defined/IS_ENABLED/ for the modular case.

> @@ -95,7 +112,10 @@ static int __init rtc_init(void)
>         if (!mach_hwclk)
>                 return -ENODEV;
>
> -       pdev = platform_device_register_simple("rtc-generic", -1, NULL, 0);
> +       /* or just call devm_rtc_device_register instead? */

I guess this comment is a bogus leftover? There's no "dev" parameter to
pass to devm_rtc_device_register() here.

> +       pdev = platform_device_register_data(NULL, "rtc-generic", -1,
> +                                            &generic_rtc_ops,
> +                                            sizeof(generic_rtc_ops));
>         return PTR_ERR_OR_ZERO(pdev);
>  }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

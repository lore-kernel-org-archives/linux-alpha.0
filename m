From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v0 42/42] notifier: Return an error when callback is
 already registered
Date: Mon, 8 Nov 2021 15:07:03 +0100
Message-ID: <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
References: <20211108101157.15189-1-bp@alien8.de> <20211108101157.15189-43-bp@alien8.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20211108101157.15189-43-bp@alien8.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Borislav Petkov <bp@alien8.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, Ayush Sawal <ayush.sawal@chelsio.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rohit Maheshwari <rohitm@chelsio.com>, Steven Rostedt <rostedt@goodmis.org>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, ALSA Development Mailing List <alsa-devel@alsa-project.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, intel-gvt-dev@lists.freedesktop.org, alpha <linux-alpha@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, linux-edac@vger.kernel.org, Linux

Hi Borislav,

On Mon, Nov 8, 2021 at 11:13 AM Borislav Petkov <bp@alien8.de> wrote:
> From: Borislav Petkov <bp@suse.de>
>
> The notifier registration routine doesn't return a proper error value
> when a callback has already been registered, leading people to track
> whether that registration has happened at the call site:
>
>   https://lore.kernel.org/amd-gfx/20210512013058.6827-1-mukul.joshi@amd.com/
>
> Which is unnecessary.
>
> Return -EEXIST to signal that case so that callers can act accordingly.
> Enforce callers to check the return value, leading to loud screaming
> during build:
>
>   arch/x86/kernel/cpu/mce/core.c: In function ‘mce_register_decode_chain’:
>   arch/x86/kernel/cpu/mce/core.c:167:2: error: ignoring return value of \
>    ‘blocking_notifier_chain_register’, declared with attribute warn_unused_result [-Werror=unused-result]
>     blocking_notifier_chain_register(&x86_mce_decoder_chain, nb);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Drop the WARN too, while at it.
>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Borislav Petkov <bp@suse.de>

Thanks for your patch!

> --- a/include/linux/notifier.h
> +++ b/include/linux/notifier.h
> @@ -141,13 +141,13 @@ extern void srcu_init_notifier_head(struct srcu_notifier_head *nh);
>
>  #ifdef __KERNEL__
>
> -extern int atomic_notifier_chain_register(struct atomic_notifier_head *nh,
> +extern int __must_check atomic_notifier_chain_register(struct atomic_notifier_head *nh,
>                 struct notifier_block *nb);
> -extern int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
> +extern int __must_check blocking_notifier_chain_register(struct blocking_notifier_head *nh,
>                 struct notifier_block *nb);
> -extern int raw_notifier_chain_register(struct raw_notifier_head *nh,
> +extern int __must_check raw_notifier_chain_register(struct raw_notifier_head *nh,
>                 struct notifier_block *nb);
> -extern int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
> +extern int __must_check srcu_notifier_chain_register(struct srcu_notifier_head *nh,
>                 struct notifier_block *nb);

I think the addition of __must_check is overkill, leading to the
addition of useless error checks and message printing.  Many callers
call this where it cannot fail, and where nothing can be done in the
very unlikely event that the call would ever start to fail.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

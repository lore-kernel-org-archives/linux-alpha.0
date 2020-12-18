From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 01/23] kernel: irq: irqdescs: warn on spurious IRQ
Date: Fri, 18 Dec 2020 17:55:50 +0200
Message-ID: <CAHp75VfYz_K2BYOxqmSx0q+1F2F9Lp1eb70RrNYzJHs3FX+quQ@mail.gmail.com>
References: <20201218143122.19459-1-info@metux.net>
 <20201218143122.19459-2-info@metux.net>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=abkacR5EtfH7n3c7FX6aX1PPXUx2EG3knfWGOF7I8KQ=;
 b=CBfVYlZ7drbVWtqD4bM3rkW3OWAqtTHQ4tOTswiI8hMNopfxOrNSevY5aJbqvp0mM5
 TCt5A9KlDha/typLUMvAinFqZihBhKDs4BnfOvsBgN1UEuOfn2IctSX1c7RAJE00PX2w
 n7klcFUYA8+Wh03OFueMg42mGZ0RkQcUL9Og1KFLwVu3sptluQTtOKanGWeSuBQ6+cvG
 IQarphsJdlgszUZ2XFgxxcoIxIFcXYZtA7DiUUAY+OhzWh0reHMzfpVaZ6Tbo/44jQMr
 d42Q7DDFcqvQMmrXsNBpvMeT3nysS6sMGtm6mQ7XQdIwUbkG3/ZAqQL4skrB49QcSHxQ
 YUtg==
In-Reply-To: <20201218143122.19459-2-info@metux.net>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, Linux-SH <linux-sh@vger.kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-mips@vger.kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, gerg@linux-m68k.org, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Jiri Olsa <jolsa@redhat.com>, Helge Deller <deller@gmx.de>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <c>

On Fri, Dec 18, 2020 at 4:37 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> +               if (printk_ratelimit())
> +                       pr_warn("spurious IRQ: irq=%d hwirq=%d nr_irqs=%d\n",
> +                               irq, hwirq, nr_irqs);

Perhaps you missed pr_warn_ratelimit() macro which is already in the
kernel for a long time.

-- 
With Best Regards,
Andy Shevchenko

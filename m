From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 01/23] kernel: irq: irqdescs: warn on spurious IRQ
Date: Mon, 21 Dec 2020 11:27:27 +0200
Message-ID: <CAHp75VeGs-x0-XgpLS0uB2oZmxKZREfUKM1ByUwmRquqFc2FPg@mail.gmail.com>
References: <20201218143122.19459-1-info@metux.net>
 <20201218143122.19459-2-info@metux.net>
 <CAHp75VfYz_K2BYOxqmSx0q+1F2F9Lp1eb70RrNYzJHs3FX+quQ@mail.gmail.com>
 <87ft3zyaqa.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qMI1qb6jm5Lag9GLrKzNd8c/nLzIAunUnseb/Ze4wwk=;
 b=TNketNi86VoSW7yUCz1xJ0TySRbiCNnk6lgZVPNFHRq1Z0hYh2gKvfrjKM7LrvZdfw
 RQePP3CI0izt8okVH5i0MDqzLe17kJ+gYsfp1t+Ps8IwCEHGQkv7O3PSU8DKD3ZNNffG
 /JlM0O2eWxUHvRwz8qee/+LJwONqHO0lDu8V6J4W8M+AzN/jgGfMEfd8saM3jRp+ynNl
 yyNQ52YpnwxSo70pHdjSzvzY1s3U8IilByiBPR9JecD00QG9hEu5BbgRdRErCXzWs2gF
 45fFo4tr95q3qQ6Y+q0mxPqCFls3IDtt7iuwAPe+p0gTlRoSBsbkFCIhsAdHSkhvZ6+r
 94Mg==
In-Reply-To: <87ft3zyaqa.fsf@mpe.ellerman.id.au>
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
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>, Catalin Marinas <catalin.marinas@arm.com>, Linux-SH <linux-sh@vger.kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-mips@vger.kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org, Will Deacon <will@kernel.org>, gerg@linux-m68k.org, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Jiri Olsa <jolsa@redhat.com>, Helge Deller <deller@gmx.de>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Tony Lindgren <tony@atomide.com>, Geert

On Mon, Dec 21, 2020 at 7:44 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> > On Fri, Dec 18, 2020 at 4:37 PM Enrico Weigelt, metux IT consult
> > <info@metux.net> wrote:
> >
> >> +               if (printk_ratelimit())
> >> +                       pr_warn("spurious IRQ: irq=%d hwirq=%d nr_irqs=%d\n",
> >> +                               irq, hwirq, nr_irqs);
> >
> > Perhaps you missed pr_warn_ratelimit() macro which is already in the
> > kernel for a long time.
>
> pr_warn_ratelimited() which calls printk_ratelimited().

I stand corrected.
Right, that's what I had in mind (actually didn't know that there are variants).

Thanks!

> And see the comment above printk_ratelimit():
>
> /*
>  * Please don't use printk_ratelimit(), because it shares ratelimiting state
>  * with all other unrelated printk_ratelimit() callsites.  Instead use
>  * printk_ratelimited() or plain old __ratelimit().
>  */


-- 
With Best Regards,
Andy Shevchenko

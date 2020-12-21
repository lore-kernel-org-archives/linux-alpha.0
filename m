From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 01/23] kernel: irq: irqdescs: warn on spurious IRQ
Date: Mon, 21 Dec 2020 16:44:13 +1100
Message-ID: <87ft3zyaqa.fsf@mpe.ellerman.id.au>
References: <20201218143122.19459-1-info@metux.net>
 <20201218143122.19459-2-info@metux.net>
 <CAHp75VfYz_K2BYOxqmSx0q+1F2F9Lp1eb70RrNYzJHs3FX+quQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1608529465;
 bh=8q8pjXmt3fb3/FcKFZZhBpNNcXsp66j8Isw1H4VoFss=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZnWF70NmUxyOGkj7ajnBegDo04rv8gH5Ux9NWJhGuiFgnNMVogs2qsK/JPPvTOxX3
 hzwMtUhjiDSqvHc4ZZWFFrTwkUdkYXJq/1ML2X0U5qamtbWBfarkCtNAXDelPjKyYu
 4R5GrwJUkFnZSYIfsBFzv3+C8RVv3a9uzsg9fDjFKnZkRtQDx75FnOmDIw99taeAnd
 QCskX9h/ngj+6oMYoBPKKaJh3wx/SkbDouSAAbUuPyGD0ebzLrrNquc0B/69DXdzQf
 fJmTp61f2fzdZls70bVcMCLTyxKnMkjf3NMjT+RK4eF560XOppbITSBixDl2QbJUdX
 VnJ3dZzhE+mIA==
In-Reply-To: <CAHp75VfYz_K2BYOxqmSx0q+1F2F9Lp1eb70RrNYzJHs3FX+quQ@mail.gmail.com>
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
To: Andy Shevchenko <andy.shevchenko@gmail.com>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, Linux-SH <linux-sh@vger.kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-mips@vger.kernel.org, James Bottomley <James.Bottomley@hansenpartnership.com>, Paul Mackerras <paulus@samba.org>, "H.
 Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, gerg@linux-m68k.org, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Jiri Olsa <jolsa@redhat.com>, Helge Deller <deller@gmx.de>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <>

Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> On Fri, Dec 18, 2020 at 4:37 PM Enrico Weigelt, metux IT consult
> <info@metux.net> wrote:
>
>> +               if (printk_ratelimit())
>> +                       pr_warn("spurious IRQ: irq=%d hwirq=%d nr_irqs=%d\n",
>> +                               irq, hwirq, nr_irqs);
>
> Perhaps you missed pr_warn_ratelimit() macro which is already in the
> kernel for a long time.

pr_warn_ratelimited() which calls printk_ratelimited().

And see the comment above printk_ratelimit():

/*
 * Please don't use printk_ratelimit(), because it shares ratelimiting state
 * with all other unrelated printk_ratelimit() callsites.  Instead use
 * printk_ratelimited() or plain old __ratelimit().
 */


cheers

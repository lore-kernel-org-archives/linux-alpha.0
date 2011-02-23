From: Matt Turner <mattst88@gmail.com>
Subject: Re: [patch 16/19] alpha: titan: Convert irq_chip functions
Date: Wed, 23 Feb 2011 21:30:35 +0000
Message-ID: <AANLkTinUGRXoa_wS-DGEuugXaJe_Zku8NrmLF4LF5WWX@mail.gmail.com>
References: <20110206143037.124533892@linutronix.de> <20110206143149.420669286@linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=V8jx6+7Bfl7glDjI4+m6manTY4Bk2KJN131fwG2Jv7M=;
        b=Q+0RIjL2o2geRH0v5HSeuOiT7gF2lfzCKP8rrbGeBIQItwqUeSRFEYG+UflREvVVC9
         TS9KK0swmaihJ4VJ19ZFIXCDYC1qyPcBTZiaGk3GiHIsWyuposZJhDyGruAOh5cjti7F
         jTdB55c0eGShs7BPapYv3slATHjJrmWHK1muo=
In-Reply-To: <20110206143149.420669286@linutronix.de>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-alpha@vger.kernel.org, Kyle McMartin <kyle@redhat.com>

On Sun, Feb 6, 2011 at 2:32 PM, Thomas Gleixner <tglx@linutronix.de> wr=
ote:
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> =A0arch/alpha/kernel/sys_titan.c | =A0 19 ++++++++++---------
> =A01 file changed, 10 insertions(+), 9 deletions(-)
>
> Index: linux-next/arch/alpha/kernel/sys_titan.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-next.orig/arch/alpha/kernel/sys_titan.c
> +++ linux-next/arch/alpha/kernel/sys_titan.c
> @@ -112,7 +112,7 @@ titan_update_irq_hw(unsigned long mask)
> =A0}
>
> =A0static inline void
> -titan_enable_irq(unsigned int irq)
> +titan_enable_irq(struct irq_data *d)
> =A0{
> =A0 =A0 =A0 =A0spin_lock(&titan_irq_lock);
> =A0 =A0 =A0 =A0titan_cached_irq_mask |=3D 1UL << (irq - 16);
> @@ -121,7 +121,7 @@ titan_enable_irq(unsigned int irq)
> =A0}
>
> =A0static inline void
> -titan_disable_irq(unsigned int irq)
> +titan_disable_irq(struct irq_data *d)
> =A0{
> =A0 =A0 =A0 =A0spin_lock(&titan_irq_lock);
> =A0 =A0 =A0 =A0titan_cached_irq_mask &=3D ~(1UL << (irq - 16));

These hunks are missing a
+       unsigned int irq =3D d->irq;

I can fix that up myself though.
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

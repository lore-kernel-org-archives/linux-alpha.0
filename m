Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C253F54C6
	for <linux-alpha@vger.kernel.org>; Tue, 11 Aug 2026 06:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786430002; cv=pass; b=B9CVyIYRGpn8jQGOVw0oNf07hPE4G2Mv8RQrqoAiz/T9OMJmNvHKjNJv+lNZJiwl6jJoR/tcS+lFOf2h2YFQv6vpgMxnMx+HxR5m1G7Marvw+jAgaWr+ulZ8l9FtUf2zOBdwh+7lAE7esjrzAgG4I0ilLpV8PtQFbyuQOMoBQ+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786430002; c=relaxed/simple;
	bh=3eNEdKZNX11qUjLyYJSeJIvBrSPK7dlCFV5wnh1HIpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g4aA3dF4mhzUi0TQkBslUGP6Nw8birl/CvKcFPHH6mVnZOrsDohdRBTIdIBpC8A1AYsfEf8nrGtwhkx7MHiEzU3e54aZLQry+3U0o3w2dkOdnZCVsj13vhmvhGbUUNNh4yCsEq9iIXw/Adf8liOAteefoDdEDAbPdGhMp4Mim7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCVe8Zdg; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCVe8Zdg"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a1f80fd2e4so1042938a12.1
        for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 23:33:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786429999; cv=none;
        d=google.com; s=arc-20260327;
        b=i9nEDZq5Zt56FMjf9YJy+e9ysa0Yvq7wSe2+sVGxgJJqi/+IVv9t+YfNUqvZevP/OC
         da6jMWlSetXb/iFIQQ5sfoT37NKXI3pClEz4xi2VsxLTAIyFcwFqEEuLWKpc6CQgxSXa
         0v8c8+ZJMdx7RLmwI/pybt4euinuYVpWjb5dWQ/EjBu8V9mtS7oistHCbi9OuNJOABP4
         cXe4b/XI1IlAEKnvHnAMJvserq+IQ2YIkAWZJizgPjLw4k8uBRSIz8o9jSmADV9I5Frb
         +f0RNZLHPpIyGtXU8sUuWZyDIrnqRf8o+mqTMvwZgXjKoo8rAp9LTWbrIaBhASXIrl8u
         X6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xqez7vy+wecyLapZtdwAWvksXKHeW6XcXxvp8KtworM=;
        fh=eaUmn+PmDOkQPvqoMe47InwG945Ca0s8s2tCRhukOxE=;
        b=E5fVquiJjRsNKzFrm6NuQ/vxuQYOh/jO0cDPXwexEJ9s3XvkRBxEJdqz86nREJ+NeM
         81WssOfQ7ku4OSJQyPXxVOZzC1e/ivza+6JIdGqeoQBp5d7GLkVCVCQslz1JCElvVPuR
         MfDw3CCul3YTBveRK/3GuUOT1zukeR499vdcrbhnh3YqlIFUOFupcYgQDHKDXrV/1guf
         zwpO6UCZ+ggNKihP2S2l5/6VszG7Y28+zEFW5vpDS+1cAgcu0rVjHchomPMZVYpJY84S
         p5MNpXwcAWUKU/m859/zHaYgL9HOgRrYRn5wLYiN5WPmRpShPtuKrqLJojfwv3oMXiCe
         IwJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786429999; x=1787034799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xqez7vy+wecyLapZtdwAWvksXKHeW6XcXxvp8KtworM=;
        b=mCVe8ZdgZQaw+m+SmOvZZqbbqLOXOQy7CJWIQJGrt1Brj8lgVHLQFZO1hLhoQZzS5J
         euPaYUunynNbJAcFXsZKN8qOHlw47CV7y5Q9vf68ULM/CmAh13e6xqHvUNoG5mAyQH1a
         CpfpaPWrkL8xKVWJGjWC2zPYjoWizu3xJRfkcozKDnpDvJr4zsm4eHJOILPBEy/ycGp+
         EDjBq6J2K4wd49qbi3UohfYMlT0bX+EUmcn24y4ddqDFaCCv+MYmOU3jXQs1XpA8pU1w
         6MuPJXd/qzTpRnnZhoLCGlOIOEcKIf48nyzzrf2W0Z+FgxZU/HWwT1kfvSIxYwoKo2a+
         afig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786429999; x=1787034799;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xqez7vy+wecyLapZtdwAWvksXKHeW6XcXxvp8KtworM=;
        b=LMzYqkAa/XLMRJg9FT2UCmkSEpEK52nfIvT2V68tVV+u0FzVCeyDVkPGvS1DuhV594
         jf+TAtWNTPSO1lT7jiQZvk0/eR0GpY64YEyWBgoratWinhLEDFc5CGqX5LSIZ2XermJy
         GhKA+rQZfLQ8k7Mr5iQqPvEX4xmcEh93tPwDEMC1AnqN1gMiMnuusqkHnSMOrtbpcvOJ
         VUvpwUmTYAiMEurPKCkieGM03aGdxfLJE92ST7HaGk5JmPD4XV7SR4hwnVIP+tT1udNh
         KMxTLI31G/w4xAIddR/nCmlAUkzo6csxAX5mJnpvYiIjZyjyAmKDmgsW3hEjrdRvJvUF
         AnoA==
X-Gm-Message-State: AOJu0YzaIAPidaAOfVEVuN18SjQ1HJ8hZoed0XJ5tRoWM0xm9I1LTGRs
	p8X/HCyOslBr22DnitCSYMFUqBTqDnGeCKndZrDFKRR2xZziCmaXb22KRP3ZROVuvnL64nUewTs
	G8ZlMrVem3rKQXfK55IqnJwttvRc0Q1M=
X-Gm-Gg: AR+sD12Jf/mYFtX4fHKtvkLVHQZwXYukBQfMbY9lxdDsfIhoZxWg1+FnKF+JiIPMWYx
	kvAL0mYgogx5mpfozvxY76zv2u8QwEhwxSjl7G7dVd6K02rCosVmJ1zputGEk86Jr/tBcDGyhYf
	obAfeGrCYsakg3B6evRD7y2m2yboHKzqf8KzhqVIOaNt1wvBEuSiMEvYFWxDbHGCNArpv4vAr4X
	9AeIaqTGOCqBlHVzkbyBObFqRpMLOPxKOFVy8IduyqMj1XeE4s/7Yarvix0egFj+G+nW2SvsP+e
	snzklwzGo63mXXA4AkAC1bEZ/l3Mcy6O8IzT95SwlNW5aURZdNkfxjUch+rz26lfHBhQlFuaU8V
	eqUNkWMUinO6HifayqWZHX/zuaEdqBAs=
X-Received: by 2002:a05:6402:4542:b0:698:4501:3a8e with SMTP id
 4fb4d7f45d1cf-6a364d7d18dmr302501a12.9.1786429998053; Mon, 10 Aug 2026
 23:33:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810202835.3592833-1-mattst88@gmail.com> <20260810202835.3592833-2-mattst88@gmail.com>
In-Reply-To: <20260810202835.3592833-2-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 11 Aug 2026 08:33:06 +0200
X-Gm-Features: AUfX_mxVx6kC4xQsRMHEXa_jFxXEXB9L4qraQsx1q71sIWp3E0w98CIHqUb5sIo
Message-ID: <CA+=Fv5SWCg0BcJsEY2tA95tb5CY=EPwm2ZG8CCY9m=06ngz+aQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] alpha: annotate hardirqs-off on IPL 7 interrupt entry
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 10:28=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
>
> do_entInt() opens with local_irq_disable(), which with
> CONFIG_TRACE_IRQFLAGS only calls trace_hardirqs_off() if interrupts were
> not already off:
>
>         #define local_irq_disable()                             \
>                 do {                                            \
>                         bool was_disabled =3D raw_irqs_disabled();\
>                         raw_local_irq_disable();                \
>                         if (!was_disabled)                      \
>                                 trace_hardirqs_off();           \
>                 } while (0)
>
> On alpha raw_irqs_disabled() is (rdps() & 7) =3D=3D IPL_MAX, i.e. IPL 7.
> PALcode raises PS.IPL to the level of the interrupt before entInt runs,
> so for an IPL 7 entry - a processor machine check (vector 0x660) or a
> system event (vector 0x680), both IPL_MCHECK =3D=3D IPL_MAX - the gate is
> already true and the annotation is skipped.  lockdep keeps whatever
> hardirq state the interrupted context had.  If that context had
> interrupts enabled, lockdep believes they are still enabled for the
> duration of the handler, and every lockdep_assert_irqs_disabled() in the
> interrupt path fires:
>
>   WARNING: kernel/context_tracking.c:346 at ct_irq_enter+0xc4/0xd0, CPU#0=
: swapper/0/0
>   [...]
>   [<fffffc0001ef74d4>] ct_irq_enter+0xc4/0xd0
>   [<fffffc000105ebd0>] irq_enter+0x20/0x50
>   [<fffffc000103707c>] do_entInt+0x1dc/0x2e0
>   [<fffffc0001031d60>] ret_from_exception+0x0/0x10
>
>   irq event stamp: 735356346
>   hardirqs last  enabled at (735356346): trace_hardirqs_on+0x68/0x220
>   hardirqs last disabled at (735356345): do_idle+0xf0/0x270
>
> The stamps show the problem directly: the most recent event is the
> enable from the interrupted idle loop, and do_entInt() recorded no
> disable at all.  ct_irq_exit() warns the same way on the way out.
>
> Ordinary device interrupts arrive at IPL 3-5 and IPIs and performance
> counter interrupts at IPL 6, so was_disabled is false for them and the
> annotation happens normally.  Only the two IPL 7 vectors are affected,
> which is why this needs an environmental event to show up.
>
> Take the hardware IPL out of the decision and drive the annotation from
> lockdep's own state instead.
>
> This corrects the annotation only.  An IPL 7 event can also interrupt a
> region that has legitimately disabled interrupts, where irq_enter() and
> irq_exit() are not the right primitives and NMI semantics are needed;
> that is a larger change and is left alone here.
>
> Tested on an AlphaServer ES47 (Marvel/EV7) by injecting system events
> through the system management path: fifteen injections, idle and under
> load, with no splat.  The same injection on a freshly booted kernel
> without this change reproduces both warnings.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/irq_alpha.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/irq_alpha.c b/arch/alpha/kernel/irq_alpha.=
c
> index cb4d58079d83..014c1e98e922 100644
> --- a/arch/alpha/kernel/irq_alpha.c
> +++ b/arch/alpha/kernel/irq_alpha.c
> @@ -52,8 +52,19 @@ do_entInt(unsigned long type, unsigned long vector,
>          * Note that there is no matching local_irq_enable() due to
>          * severe problems with RTI at IPL0 and some MILO PALcode
>          * (namely LX164).
> +        *
> +        * PALcode has already raised PS.IPL to the level of the interrup=
t
> +        * being delivered.  For an IPL 7 entry - a machine check or a sy=
stem
> +        * event - that is IPL_MAX, which is what arch_irqs_disabled() te=
sts
> +        * for, so local_irq_disable() would decide interrupts were alrea=
dy
> +        * off and skip trace_hardirqs_off().  lockdep would then spend t=
he
> +        * whole handler believing interrupts are enabled.  Drive the
> +        * annotation from lockdep's own state rather than the hardware I=
PL.
>          */
> -       local_irq_disable();
> +       raw_local_irq_disable();
> +       if (lockdep_hardirqs_enabled())
> +               trace_hardirqs_off();
> +
>         old_regs =3D set_irq_regs(regs);
>
>         switch (type) {
> --

Hi Matt,

Nice catch! On an SMP AlphaServer ES40 with GENERIC_ENTRY and lockdep enabl=
ed,
a PSU state change generates vector 0x680 and reliably triggers the
lockdep/check_flags
and ct_irq_enter warnings without this patch. With the patch applied,
repeated PSU state
changes generate the expected 0x680 reports without any lockdep warnings.

I also exercised normal IRQ traffic under load; lockdep remained enabled wi=
th no
redundant hardirq transitions or other regressions.

For verbose machine checks on tsunami I had also applies this patch:
https://lore.kernel.org/linux-alpha/20251125224352.32034-1-linmag7@gmail.co=
m/

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

Thanks,
Magnus

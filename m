Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF8CE555
	for <linux-alpha@vger.kernel.org>; Sat,  5 Sep 2026 02:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788576199; cv=pass; b=pYGD7QHHa02qexRoYHs/0wGZq9t80WWRKc3/skIzXxx+inlE8u90iBAccyRbFpOLTbMGEm3QajoY8bas7QS7uPyU+Bq0j0xaCJFK6Vpmyte2AePHPPDTs1R1WRQnQpDsN0uOasBUnBUuohfYTSP2NG2LNyG9MtHkg0AMU+Swjtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788576199; c=relaxed/simple;
	bh=twYErhKVgqBqU7Gm8PxAPOGpKdduvfjHWVPWHKQNgHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ym58ANahq3L7NMYkVjFucKaDo2gL8C1YeqlRgGVMS8wIYqx+NAAylQ048RMqkShHxAolQ3rJJ6Ew1M2wi5qAtldySp1+q+kNb+5Q4O8bgck7o9+CwMdGe/HbkWuvSfryPo9JFfLjs3lRZpxZ68d9PQ0mVZ+oTZz87LGeXeZQQZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnw/Z0wW; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnw/Z0wW"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b6188a2c0eso1168222e87.1
        for <linux-alpha@vger.kernel.org>; Fri, 04 Sep 2026 19:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788576195; cv=none;
        d=google.com; s=arc-20260327;
        b=HmsZI3FJ4eJ8lCaJ+vf1ZGbpdVX5yNYW7tKQQ6wGveJlDVrvKJoghCapMnCdGcc2q9
         k4kkBEInLMwC2VQmIyWdZSTezPFQcENj1iCQoR4csqJrPK81RGS4ty8d2dWrqcBF5KYX
         ooJ7rZjPil7/0P0ypP1FHMxHQsD8m2CH9uXBPCgtaaDRzT9jsgn952AoqxcNcukIfFD8
         dcUpiF1jhdMn3v4VJaaPZOKhJNaryou98+E4On+Gme2+ELpTP4GUr7oE1N0J17Jw/pA2
         PSSfE3eIht6uRkITQSMz9JOgHvpHZAQm9Ur/Mk6cF0ltqUnLwS9hXo8GlZmX+avtQs62
         3fYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=90Y+nmSB/SvDSpHXiaKM1v9ANMSfhJiNXw80E/ieTaY=;
        fh=YoohNe5V071jto2x+teLVDcafEz22uZq2Ou4nrFt9Rw=;
        b=hHY4C/cX3mnhFqYXAhNgTFjl4Vgzor2reQyTGuNit4aa8AqlKbzDwf+qnzQXLVs6SC
         THmx3t8lw6490juwmzQbtZr3LDbCiI0flLMQym/BGaQ9MjlemST4gZFIAcgb/Ive0psx
         wfCOQqlgxLKjyFhgBNVbzGJIy7sJ5U6sWW1cklOJ4JFT+ef04SaTFp9Jz4d5AnccuV7n
         e//spBjcOWARqc/72DohXthujiXrTce61H2kZuFy3E/BPiI9YJvhWoO3b3UE0Kvxpy+p
         ypF2vrwH4/0E0Bv8QyO3JvZvNvknikXx6dsq+hggFpdAy1P6EgjmpvEXfmc8uQmiFwGO
         vaSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788576195; x=1789180995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=90Y+nmSB/SvDSpHXiaKM1v9ANMSfhJiNXw80E/ieTaY=;
        b=jnw/Z0wWLee3whrF2sAePXrhbk8/hmlrxJPNVdYBsw4JENIjVv6+Ogtudwmm8ecyf3
         MppmafxukbfXavo1VEQ+Pe+1EfRX/A8jbbYNeimxx5TMWIRMYd8xIvwOoekBFNoyMtHf
         8JK31XWtDm1lSWuEJJW7KctWl1K7pjh+lsVA04hHQW4qWG2ne8I0pXz5UHDCjNCQgtah
         DSH1hNkqZhywwZlqf/iJMFvk1QTDiAPlixripGb71UMsxEmal3ETocwfgS0yilMUsQ4S
         DeYhrmyzgrL8xS7TONpLoYKU+8+68J3rrb1y6W1H/cKMC48mccOp9jMJFpx6O3Y0qSD5
         QReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788576195; x=1789180995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90Y+nmSB/SvDSpHXiaKM1v9ANMSfhJiNXw80E/ieTaY=;
        b=Qfv47WIYXP+HF76cdJH8TyWc0dV+F2EPZZKNsOx+QwEIKrotgd2lGU1egRirL7eiRM
         3FcA52ZRehBDNn0NLPZx7VjJPM6Kctymqp1uhklE1VfUc3br+YhYmr0Xcu6W1M6uFfsi
         JJ4u27YrFpJL3SSXbnnHppdbuw1CetZ92xW+Yp/BwjCgybDKsC3YYZD2HOYHs9lGNREq
         BcRt54BJWB/R6jf9tTKpDHVMcgrk1zIx1CfWUsZDaRyBoNvqpotCFrjrQhVxJRn8QW1U
         oFXZ4WQLvnrQS5eA+KOq6zo7L2L42R8k4mC8WWyI7+keTddR4C7zoXyLI7HW9w+Mq/V8
         96LA==
X-Gm-Message-State: AFuF++kkEkkIAMPp6/I5wFyDE5DZ0hWRuuahn75WypIuKSjnJuLrXHui
	2zr4mowEvar0TFH5xuB2nQLgL1LUkPbXhtrD6lK/MNi1mKdlntyre0gyZiE2VQL1Zmek9Ynveji
	Q+U6vSmGwPhTwl6EwI16U2VnZDbQ3wBU=
X-Gm-Gg: AYBFou2qPrKhJFmXJg3fXSoEDjqp2Rld3NFx7W+l7//v6WKCRoSZuvdSbUzzJTtiIJa
	1xaEXTker435EL6lDiysRXda+gbbf3XKjhFrrPiykMximMrB/VzytPdClTbnWAvm6pniefPa9RM
	ZMAbUS44RMQWOXwymI0MkptpYIXifsuSITO1WC1wO/Xo/bXFn0OYJVdmyPiUHiT9/IG8vhS7ECI
	/yiNt6bOBrHQAYwUgKtTs8YpaxPwio3UNnBWuplWtkwEk9tc3V3by6xlEanPuAsgYfSK/dh88AA
	j4Rj0UGDSkMeA66LJBCh0UmoDGbcfyU1qyNIW0LzhJYjN+y0ESny1AsP4wQIiQHOgFDUONqGrnt
	Nelun5DxeSBNAnw==
X-Received: by 2002:a05:6512:1252:b0:5b6:4ae:19e7 with SMTP id
 2adb3069b0e04-5b61706d22fmr1818771e87.26.1788576194608; Fri, 04 Sep 2026
 19:43:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <3c54e7e410438437640d56501a7a46fb0443427d.1788277742.git.mattst88@gmail.com>
 <CA+=Fv5Rr-Zqs_nfssP0LsZd3x-=hCVybxXtOETDvR=1RGZTnLg@mail.gmail.com>
In-Reply-To: <CA+=Fv5Rr-Zqs_nfssP0LsZd3x-=hCVybxXtOETDvR=1RGZTnLg@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 4 Sep 2026 22:43:02 -0400
X-Gm-Features: AcwNN1Vbr4fIHhsxleCbheamvgLG-ZaL3XtXdEPbTMws2xJTeqak-MMskTBAz6c
Message-ID: <CAEdQ38EUiwdoxF=JvdrDEfs_mmKexCvF9Mp8KgFPpxKrxi24OQ@mail.gmail.com>
Subject: Re: [PATCH 02/24] alpha: enter hardirq context before looking up the
 irq descriptor
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 6:07=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> Hi Matt,
>
> On Tue, Sep 1, 2026 at 5:50=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
> >
> > handle_irq() called irq_to_desc() before irq_enter(), so that lookup ra=
n
> > with the preempt count still saying task context and with RCU not yet
> > watching.  Generic code called from an interrupt handler should see
> > hardirq context, and irq_to_desc() is more than an array index once
> > SPARSE_IRQ is in use.
> >
> > Move irq_enter() to the top of the function and add the matching
> > irq_exit() to the invalid interrupt path.
> >
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Matt Turner <mattst88@gmail.com>
> > ---
> >  arch/alpha/kernel/irq.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git ./arch/alpha/kernel/irq.c ./arch/alpha/kernel/irq.c
> > index 4a6a8b1d5a8b..5867a1655045 100644
> > --- ./arch/alpha/kernel/irq.c
> > +++ ./arch/alpha/kernel/irq.c
> > @@ -107,18 +107,21 @@ handle_irq(int irq)
> >          * handled by some other CPU. (or is disabled)
> >          */
> >         static unsigned int illegal_count=3D0;
> > -       struct irq_desc *desc =3D irq_to_desc(irq);
> > -
> > +       struct irq_desc *desc;
> > +
> > +       irq_enter();
> > +
> > +       desc =3D irq_to_desc(irq);
> >         if (!desc || ((unsigned) irq > ACTUAL_NR_IRQS &&
> >             illegal_count < MAX_ILLEGAL_IRQS)) {
> >                 irq_err_count++;
> >                 illegal_count++;
> >                 printk(KERN_CRIT "device_interrupt: invalid interrupt %=
d\n",
> >                        irq);
> > +               irq_exit();
> >                 return;
> >         }
> >
> > -       irq_enter();
> >         generic_handle_irq_desc(desc);
> >         irq_exit();
> >  }
> > --
> > 2.54.0
> >
>
> Going over this code again, I noticed what may be redundant hardirq
> accounting in the existing device-interrupt path.
>
> For type 3 interrupts, do_entInt() already wraps
> alpha_mv.device_interrupt() in irq_enter()/irq_exit(). The platform
> dispatcher then calls handle_irq(), which enters and exits hardirq
> context again. Therefore, irq_to_desc() is already reached in hardirq
> context before this patch. The patch moves it from nesting level one
> to level two rather than from task context to hardirq context.
>
> The RTC path does not have the outer irq_enter(), so the change is
> needed there.
>
> Would it be cleaner for do_entInt() to own the hardirq context for
> both paths and remove the pair from handle_irq()? Or is there another
> caller which requires handle_irq() to manage it itself?
>
> I tested the patch on a two-CPU UP2000 with lockdep, IRQ flag tracing,
> and sparse IRQs enabled. SCSI and network interrupts operated normally,
> I observed no lockdep or IRQ-related warnings, and debug_locks remained
> enabled in /proc/lockdep_stats.

Hi Magnus,

Good question. Yes, do_entInt() should own irq_enter()/irq_exit() for
the RTC and device-interrupt cases too, same as it already does for
IPI, machine-check, and perf. RTC and device-interrupt are the only
two that don't, and only because handle_irq() does it internally.

There's a wrinkle. A bunch of device_interrupt() implementations call
handle_irq() in a loop over several pending vectors: sys_takara.c,
sys_eiger.c, sys_alcor.c, sys_dp264.c, sys_cabriolet.c,
sys_noritake.c, sys_mikasa.c, sys_rx164.c, irq_pyxis.c, irq_i8259.c.
Right now each of those handle_irq() calls enters and exits hardirq
context on its own, so one hardware interrupt that demuxes to N IRQs
does N enter/exit pairs. Moving the pair up to do_entInt() collapses
that to one per hardware interrupt, matching how the
IPI/machine-check/perf cases already work.

I don't see anything in the per-machine device_interrupt() bodies that
needs task context before the first handle_irq() call -- it's all
vector decode. But I've only got one Marvel box to boot-test on, so
I'm not comfortable folding the reshuffle into this patch without at
least reading through the other machine types more carefully.

I'll send it as a follow-up on top of the series rather than reworking
patch 2. Easier to drop if something turns out to care. Let me know if
you think that's wrong.

Thanks,
Matt

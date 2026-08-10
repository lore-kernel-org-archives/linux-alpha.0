Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6BD32B138
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 02:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786329661; cv=pass; b=J6YQXLGXW2XnoeKZBsrrewjsxzInPnPSde5ej3AshZLhyF6g7O7MXa7WzxP14y61ir0kICvPkTH7/PXVlpmB/S3imY8XpMP52TsxuRg2xZa7I8ZIPrHNk4LUBCquPlOkYE/g6ddUHEXGJgxlTBKKIuPj1Z6nsduiyzgYev7QpBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786329661; c=relaxed/simple;
	bh=nfUQOmF7lyqUO79LW7HVqtQbK5Rcn+hijXYyNZpDcAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dE6RgWXxRLRmQIuuvrVSA5yMKnYtamuyMPnTfMfhan67IWGRDwCSdoTMsBdOLjdWeullSd5sztRqyUVt3jQXTgf1Ue9Hq2oEvID1obsC5ivtMaTr7RoYz7A1k+8eE0IZMWnKvNwKGVGMaleN7YTuTWKWaVmCnmCkpypOW5rbXlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NC3ZExCU; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NC3ZExCU"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b2a44a3b66so1354762e87.1
        for <linux-alpha@vger.kernel.org>; Sun, 09 Aug 2026 19:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786329658; cv=none;
        d=google.com; s=arc-20260327;
        b=ews2tJKIgfhHs/X7rpAwTprkFWTkGj3QEFz4sPtzOE/zktHt1NOljyF9/S+gfH/2w7
         TRMzEMmjPMl/R+6KQq02v7MHCF4QOXOB6BnxCI517OtWdIVdG7tbJkdFxJUws06kOl4v
         i4RE8NxHvfYRF7c4Eg1M81Oljriru+ZmyxYWREXo07Di2apUOpXjIq2NCI/nRBWu4B/8
         W6eNltZXPzjuTUKObpL0FUhfN+XWKnmYsHb8k5KT4ASdfI2KfOEkInIpa6pASP8ivvhh
         egK2QRPxJhNPzz0+MVgOt0D6Lg9IlL1fueOOLuXdcrAg42rWZPA9+QveZ1knkXYZuSn7
         /W8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FizDUoLVoDm1bxWseaYY52VXVilqykXUFsmsHzvdalA=;
        fh=NhL6zoOyO+bwN+vtTshFbnh+4rHRzQDsa1P9zf3d2o0=;
        b=DfP0O0V1Dlp9mROppg5zaH5YxhLG0gdoIRVc053PUi8rXJzycZZerdXX5CUGmxWJ81
         qxOLq5+9J6d7ftHYbiuqpi6YqHtbegUdAOOC0e5voxksN5oRfFrAeLP9qcM+9ujNdiLp
         PPt5fJAPqxh0lySxKmF+16eWc1yFxZSkgPy2WutR4f+nM8mVGYNFdaE0F6FE3zvMGlhZ
         tu+qLsykgpnmmeih5VKByQ/q3ckl7+rYreQgbTv1gewKVsXMqMVP6Vo5SQ6Z+8UaRxaA
         hsVCSRmrUeAYPYoFoNJpWIyAs+eTm6SJVctcN7Iy5rlPq+F4MM5pPT/qTi/v7nmAjI3U
         jmRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786329658; x=1786934458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FizDUoLVoDm1bxWseaYY52VXVilqykXUFsmsHzvdalA=;
        b=NC3ZExCUfbwpPtJWWg4hKSrQFbGmGq3ZtlTYULSrpcjCrSwYXkvzsPNqZloEwVQPfq
         rplz7bYm0NCHVfxtvxZ6eHKgNWI3I1QR3sCk28OZNJhwBDZTDgpPuz3S4j1UhSm2vOoh
         +zUEbGhn+Gxpc8Xfa1yFqZYcDf8T+PPGB8RGJm5+DeVyHq3PCibjjneHZU2gq2qeLDc7
         419G2UmRAEoYLYwMnTdXAuHxFNQENBfhMpIAPg0DDKsxP/ZfOlAjSYAHwj72aQzA2hIk
         1x8i+zjz0NjwX4Xum925waCW/BoxGzefUpshapAVrEk//l+QxE5QBz//ye6r7jNwa24K
         IFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786329658; x=1786934458;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FizDUoLVoDm1bxWseaYY52VXVilqykXUFsmsHzvdalA=;
        b=DVttJ1DIbjtsvZJVNrhyLUDoEOXML088jlI63Aa8Sn6mIA3+4VqCwSfZI/emMVlWyF
         2OsRDrOoKuKRI61ijx5eBrrzA7x6FGgqeG3t+4W3A99nv64lmJ3YDeyHrMg8iKCiCSJn
         C0coybUxN+yYruxR7Nsxd6xfO7k1HtC1nqcgzLMNlIKlArcu5nfeECYeQR0Gk5rRTGGa
         HNPCqnKa6kEkWDCW+qgRfZwpj8sM1xuLz6SiR4TxD8PYyAfpvw3DlEeJUebqkqGXjHA+
         HC46CVLAPs/TyyKvkCyLNy8VrI1LRVMiW2xmRHpGsd6dm3QYaebU0bwPc/FUMkNZufz2
         gdsw==
X-Forwarded-Encrypted: i=1; AHgh+RpV6eZsE/zcP8FQ6RSCw+tDUJ57XmNkTMXPOmdXWQsSFK2iMEvQZBo9Q+7S/sllkGWoz7tK40Lkl8t38A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGASi2HMxfbkqZ0zvNqvhEp5s9mexDBwXSx976fYvfKN+/4PRI
	1uOtTPT3PEdV0SKizjJcCgXhbhz/gyc5e/sA6VeuKu9quzIleQPIZ/mAxmV2hOuVU11pHChrwVO
	hfMCiL37TNGi7SQ53LmmePGq7BDKzvug=
X-Gm-Gg: AR+sD123GGkr2xRgyPHOV9+rS1FQVzBkDeUEmazR8kZKIRSomygk2Dd9B2rW/p1J4sy
	D5XK//piV0PS6XdStm0p4LIKXY/niXtviVHtmySxQmQEvsiEm1SmRyQ8nB83ZZW7Xy7x6UIiZm3
	YW++SCcVqsV84tS3Nt8fqcXTve/fenVL31obDIIMizN/fmQA5fpUDWmQK0oF+LQwPB3uWAkIotF
	AiiehIFkhyxKl+6vxPMjK7mGN08dVc/cTcpPigHxPQCnD7HPsuQBSnOKYcAenfhDMDlTTy/erSR
	WL/QgbKZCMlJuwrxVJQXVbqceEU1MvAe4WCnxzbMnSpDF0wnTBMoMbQlU0dJvjM0WDlCMrSyXsi
	Q7Q==
X-Received: by 2002:a05:6512:688d:10b0:5b2:e956:b45c with SMTP id
 2adb3069b0e04-5b2f4b886d3mr3457350e87.10.1786329658165; Sun, 09 Aug 2026
 19:40:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809085208.3262799-1-linmag7@gmail.com> <20260809085208.3262799-2-linmag7@gmail.com>
 <CAEdQ38EHDfxJVsSOorF30TCsZAoCG1D==Bv6Z0Mz0uyNvRPftQ@mail.gmail.com>
In-Reply-To: <CAEdQ38EHDfxJVsSOorF30TCsZAoCG1D==Bv6Z0Mz0uyNvRPftQ@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 9 Aug 2026 22:40:46 -0400
X-Gm-Features: AUfX_mzGeIIViJimNSawHdGUP3w6h1vAFnWiDAOsu850JYaXaZmPRQTJzO4NOS0
Message-ID: <CAEdQ38E8SieeGYY1GcR6c6vaZM6wWfz2ZZxW=oc-8m29UHXsgA@mail.gmail.com>
Subject: Re: [PATCH 1/6] alpha: run check_mmu_context() from finish_arch_post_lock_switch()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de, mcree@orcon.net.nz, 
	ink@unseen.parts, macro@orcam.me.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 10:37=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Sun, Aug 9, 2026 at 4:55=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com=
> wrote:
> >
> > check_mmu_context() clears asn_lock and acts on need_new_asn, but it ru=
ns
> > only as the tail of switch_to(), after alpha_switch_to() returns. A new=
ly
> > forked task never gets there: its first context switch resumes at
> > ret_from_fork, which goes to schedule_tail() and then to user space rat=
her
> > than returning to the code following alpha_switch_to(). A new kernel
> > thread reaches schedule_tail() the same way, through
> > ret_from_kernel_thread().
> >
> > asn_lock is left set on that CPU, so the forked task runs user space wi=
th
> > it set and interrupts enabled. A TLB shootdown IPI arriving in that win=
dow
> > takes the deferred path, and the need_new_asn handshake meant to cover =
that
> > never runs.
> >
> > finish_task_switch() calls finish_arch_post_lock_switch() with preempti=
on
> > disabled, on the CPU that ran switch_mm(), so hooking check_mmu_context=
()
> > there completes the deferred-ASN bookkeeping for both. Running it when
> > switch_to() has already done the work is harmless: check_mmu_context()
> > clears need_new_asn as it goes.
> >
> > The same hook is also called from kthread_use_mm() and
> > sched_force_init_mm(), outside the scheduler's preemption-disabled swit=
ch
> > tail. check_mmu_context() acts on per-CPU state, so it can only complet=
e
> > this bookkeeping while still on the CPU that ran switch_mm(). Testing
> > preemptible() expresses that condition directly rather than naming call=
ers:
> > where those paths leave preemption enabled the CPU may already have cha=
nged
> > and nothing is done, and where preemption is disabled across the switch=
, or
> > not configured at all, no migration is possible and running it is corre=
ct.
> >
> > Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> > ---
> >  arch/alpha/include/asm/mmu_context.h | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/=
asm/mmu_context.h
> > index eee8fe836a59..f7afc64ca8dd 100644
> > --- a/arch/alpha/include/asm/mmu_context.h
> > +++ b/arch/alpha/include/asm/mmu_context.h
> > @@ -181,6 +181,34 @@ do {                                              =
                 \
> >  #define check_mmu_context()  do { } while(0)
> >  #endif
> >
> > +/*
> > + * check_mmu_context() clears asn_lock and acts on need_new_asn, but i=
t runs
> > + * only as the tail of switch_to(), which a newly forked task never re=
aches:
> > + * it resumes at ret_from_fork instead.  asn_lock is left set and the =
task
> > + * goes on to run user space with it set and interrupts enabled, so a
> > + * shootdown IPI arriving in that window takes the deferred path and t=
he
> > + * need_new_asn handshake meant to cover it never runs.
> > + *
> > + * finish_task_switch() calls this hook with preemption disabled on th=
e CPU
> > + * that ran switch_mm(), which covers that case.  Running it when swit=
ch_to()
> > + * has already done the work is harmless: check_mmu_context() clears
> > + * need_new_asn as it goes.
> > + *
> > + * kthread_use_mm() and sched_force_init_mm() also call this hook, out=
side
> > + * the scheduler's preemption-disabled switch tail.  check_mmu_context=
() acts
> > + * on per-CPU state, so it can only complete this bookkeeping while st=
ill on
> > + * the CPU that ran switch_mm(); preemptible() tests that directly.  W=
here
> > + * those paths leave preemption enabled the CPU may already have chang=
ed and
> > + * nothing is done; where preemption is disabled across the switch, or=
 not
> > + * configured at all, no migration is possible and running it is corre=
ct.
> > + */
> > +#define finish_arch_post_lock_switch finish_arch_post_lock_switch
> > +static inline void finish_arch_post_lock_switch(void)
> > +{
> > +       if (!preemptible())
> > +               check_mmu_context();
> > +}
> > +
> >  __EXTERN_INLINE void
> >  ev5_activate_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm)
> >  {
> > --
> > 2.53.0
> >
>
> This seems to make the check_mmu_context() in switch_to() redundant.
>
> arch/alpha/include/asm/switch_to.h:12 calls it, then finish_task_switch()=
 calls
> the new hook a few lines later. Between them the rq lock is held and IRQs=
 are
> off (finish_lock_switch() =E2=86=92 raw_spin_rq_unlock_irq), so no shootd=
own IPI can
> land in that window.
>
> I think we should drop it from switch_to.h?

Another thing. Pre-existing issue, I believe:

preemptible() is true in kthread_use_mm(), so the hook does nothing,
and ev5_switch_mm()'s asn_lock =3D 1 stays set on that CPU until the
next real switch_to.

Benign, but patch 2 depends on this. patch 2's own commit message says
current->mm can be true with the mm's context not loaded
(kthread_use_mm), and the only thing saving that case is the leaked
asn_lock forcing asn_locked() =E2=86=92 flush_tlb_other(). Should probably
document that in one of these patches.

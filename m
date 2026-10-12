Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897AD4ACC69
	for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 16:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821927; cv=pass; b=et0mAhM62Fhx+scMCUis+gTH7wsKl7JQmjZN9d/NaJp5znVgsNoA8d+G9U65wSHvXQ7ZLA6EZC54KA1OfBAS/mIy9dJlEgSsXp3ALXbw2EWrwXAisAMLFkwrdxYUVAOT676Tg1i3Eyji3NTV8QYO/uqvW506Hyw68IJFXbJwOJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821927; c=relaxed/simple;
	bh=qvVpEPzOzLifjD/7DmAg+LNyF2ciqW2crgsJsv4fMNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1sYKlQP9IylL9SbDkkVPs+3ipkUFVkUAn/DhgjbX8Ydykw9U5s+xTTsBr3+p9gzs0gmJBMBuy3fGHRR4BclTU46bKRX3HSYbA5stKJ8kL4YDcarzhmpAcrxRuropwgRBh+UfdQNQqZIck1SS+dl+yZPtHG8AjhrqpqklVBdpNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsPS4BD7; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsPS4BD7"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so2984886a12.1
        for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 09:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791821924; cv=none;
        d=google.com; s=arc-20260327;
        b=rMBmgxM64ZWd/9uQ5MHhvAulrXyl86P4yFvMq/O3MeFu+ex7ErqcWXx75mgxXKPZiJ
         RCejQnhX354JmIh47g0bkhX0duFxmo+SpTTIm9O/4Z9n8KoJFj4cOSjVI6Zab2qoPQW0
         Uva8XUfe/2ipoadiSWs/e9sS2pIuxevHQpjegimO0YmEayCY0hfJuhElVeEU6FYkfjjE
         /z6D6mJD6rXNkdgMUgp7yPtvNzqMHpSMmftzBV3CpWfsNELdEC09k8k73o82takfSFLT
         CkT+kp9sItLv4TmQVK6q5qlQE2VJ/E8Zs6o3U8hAPMVSAvmKZZtpKAedsOmbwdsUboYp
         5tGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CUeAR5YurRmrLyPWT1WYCY1/iIz0jhnPKKa1Syh0wXc=;
        fh=Fm2xPRNM20uywP69qwa0N191XauKDWY/8+Pdi6fu9Eo=;
        b=R67pV7Jqj65fdNASRygVAMYOAqyUrXXefAHNoe98I5pdbF2ii+xa9GWmBDOui9JphA
         jLn/bN9cQcxBV1QQp8QWITsK/dyoYfxBUCU95H8UlvQbrnFLgJJnF6nCsYuLiQmMhqKs
         FOEBF3DnEeX7YKba2mMkiLfYixDemlwMkij+cEY2uKb54JP0hZn4de0yCHOp914xOhyv
         JS3KLqeHZRf5yG6je4g23fosHzhQBTk7JedmjT59HVKlH8WiEGtfn+Vt2fRS/fyvjF6m
         QX84S6gymQWW/BerzbjKiMNcmD3pG2n+p06q90gf4RYyISmM8rwnN0C9hykyUgBvSbAx
         rFpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791821924; x=1792426724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CUeAR5YurRmrLyPWT1WYCY1/iIz0jhnPKKa1Syh0wXc=;
        b=PsPS4BD7m2jkgUCxRdMk0FNY2z5ZY59lAfo1Ryo47UKC1ju9hpMh4jWUN90HEJprgS
         Z+PRQR0N4FHO8/rzWt0K9670/ixmjyEGtvNvyXmSFP75wzZeEH1zaOf+tR32+jDFpJqe
         ZuISWP8RJ2XqbFu/QDyph1iE0p49cMI7cNH2h8l9KfHhfAazx+pHtYvkqaU8J2jyCVaz
         MPWT3vHhzxXm4aYP1+AwRiQnTVbGa2NXDJGCdNej3Mk7bHUkN/cxVzAnTNkZFN9McSQC
         CXN4VzRUuv/vQwGi3HCnNaElw+i0BqDIwIZWS+TlnGoffcIcf4qf/5Yd6Ae5MJNOZL+u
         qX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791821924; x=1792426724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUeAR5YurRmrLyPWT1WYCY1/iIz0jhnPKKa1Syh0wXc=;
        b=vv4DS30WcYaDlTXP5l3S4EnRrap8Gxa27SXRBpuqXK0ibmjTTXFI4l//X5eqe4vNSu
         vZvqqzdfMkMRhV7N5edAkl3JTCFzASce03X+qtouuK3N/LNVDMAoNEPaIh4Na83WggKz
         vMu1Da/ifqZ+T/3sGiGeK27ITh6SGQe8m9LsHncU1zVsU1KReeFRQDrfajmefBGFwVaZ
         wzzFGiR+37Q/sq27cYzg4OlRQb/csBxgi+Wrj495NtX4hCArMkViyZ/kbXc/Qxu4+bhc
         Dv8ekhDFf5JLoJSkCt8zdUVOeikz38S8EIcKdcSdxcdOYNciZ2DWUWxKwyoxE9HdMZUa
         N0mA==
X-Forwarded-Encrypted: i=1; AKwUvBzCqSnMIOqvh007mjuozScZ4T88+Aj8NAJ8GbIx231h35KcqDyvGIYgACHTWvHgVCfCVaW87jzFhQgp6g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJr7uAVmVFRoguPMgSAAMk+WRXReX0o94nL1mObxhkSBIX4z8FP
	Vq3tPSeGBXASN8uEm4WcrJLvM7anLRaxaDFUK38xQglvQwWAqIJWVVA6s9OMnlyGm3a6ycWTcCW
	9HI3lZtMASv6TO7pydhCRc4Pk1N87tFU=
X-Gm-Gg: AYBFou2Olsi88xV+wkpcLwtfHXFTqskkpONnCn1kNj9+NMma/AMQsmQwRdOaOwVZfwX
	eaGR6l0MgfpyM7CQGBD03sxgtfxSMyelJHuFsIpiGmZlSvvbcG2YqN4ABBUMZUwq3TEHhFRPqCy
	K2ToypbSmY8B1oYh4Oo8pu217f8ewgUaSFBdCeJW6Kab5PqDxNdhfVsE5Wz7NsqmpPaaRgKDzfH
	TG2SfqiB0qPPwpBEwuq1RkVIHx9Xk/saBfPPlOJEac3g2WGEVz/k51ZWYV4SXNLbQ8AlA61neUj
	wOP1UERjqm/P0DGBaTy6ASAwKYr3LNDaBrKIuqEVilR7KAc+DHn/gHXdzGZOs2uRM3o8A8RB6f0
	+1FsA+nSIezI+HpKIp1aPDfjmoSQGZ8I2VnhbPR76PA==
X-Received: by 2002:a17:906:dc8e:b0:c2e:4488:b8a3 with SMTP id
 a640c23a62f3a-c31aa0850bamr1000531266b.33.1791821923522; Mon, 12 Oct 2026
 09:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com> <20261011-alpha-perf-regs-v3-v1-1-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-1-eaa625a39712@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 12 Oct 2026 18:18:32 +0200
X-Gm-Features: AclHuK-nN_rEqA6xqbO4CkyZX0-XsUGhkKaJX3rrOmarOEgQAl1ktERcvGizgjc
Message-ID: <CA+=Fv5RoxY0Bav9Q-E4FpEofokfB26ePOwPPWUmEDp6_sO5S3Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] alpha: fix stale user_stack_pointer()
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sun, Oct 11, 2026 at 10:16=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
>
> PALcode keeps the user stack pointer in the PCB, not the trap frame, so
> pt_regs->usp is only valid where entry code stores it: entSys,
> do_entArith() and do_entIF(). Interrupts, page faults and unaligned
> traps leave it stale, and ptrace and /proc/<pid>/syscall read it
> through user_stack_pointer().
>
> A user-mode pt_regs is at the top of its task's stack, so find the
> thread_info from it and use rdusp() for current or pcb.usp otherwise,
> as KSTK_ESP() and the regset code already do.
>
> Fixes: 8a2857bc2b30 ("alpha: enable regset-based ptrace and core dumps")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/ptrace.h |  7 +------
>  arch/alpha/kernel/ptrace.c      | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptr=
ace.h
> index 430e8dc27ff7..45d1229344b6 100644
> --- a/arch/alpha/include/asm/ptrace.h
> +++ b/arch/alpha/include/asm/ptrace.h
> @@ -26,12 +26,7 @@ static inline unsigned long regs_return_value(struct p=
t_regs *regs)
>         return regs->r0;
>  }
>
> -/* Helpers for working with the user stack pointer */
> -static inline unsigned long user_stack_pointer(struct pt_regs *regs)
> -{
> -       /* Valid for user-mode regs */
> -       return regs->usp;
> -}
> +unsigned long user_stack_pointer(struct pt_regs *regs);
>
>  static __always_inline bool regs_irqs_disabled(struct pt_regs *regs)
>  {
> diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
> index e1d8c2f69688..dba7e9905cfa 100644
> --- a/arch/alpha/kernel/ptrace.c
> +++ b/arch/alpha/kernel/ptrace.c
> @@ -440,6 +440,18 @@ ptrace_cancel_bpt(struct task_struct * child)
>         return (nsaved !=3D 0);
>  }
>
> +/*
> + * PALcode keeps the user stack pointer in the PCB, not the trap frame.
> + * A user-mode pt_regs sits at the top of its task's stack, so the
> + * thread_info is at the base.
> + */
> +unsigned long user_stack_pointer(struct pt_regs *regs)
> +{
> +       struct thread_info *ti =3D (void *)((unsigned long)regs & -THREAD=
_SIZE);
> +
> +       return ti =3D=3D current_thread_info() ? rdusp() : ti->pcb.usp;
> +}
> +
>  void user_enable_single_step(struct task_struct *child)
>  {
>         /* Mark single stepping.  */
>
> --
> 2.55.0
>

Nice work!

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

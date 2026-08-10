Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EA326CE11
	for <linux-alpha@vger.kernel.org>; Mon, 10 Aug 2026 02:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786329483; cv=pass; b=fgMWieWn3WyoEBlzrglqSW6QTYMTWHBZnsVXhC4OHi6eToqUlN2DiJyP7O197py+MrYAWOIdTen38g4yceUd+kuHfpsvUE1sGGUQOMQMZWJf73DCaCIfBCCoVVnDdU56cMKYKNJxc6jkgj91lroOZ/ezMTuRTbed8tUrXdV6ZJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786329483; c=relaxed/simple;
	bh=z0lTHOmIuWvx4AczxTlp8KeIrd/6HERftIhUQksMnvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1dcaqScnj8IPoGSDINtPQCOIrCeDN/QW428I/0/0rvpHTJpiNboBSeP3A7u23ilG1nMA0kx56EijWe4VinUMOi4O4DghYRNgDN17Bd2dl2JgUvgynMZEldTZcmwyjEFkpQEYYogL5QFYQRAp7BKL5uNonSpGYBXv2xM5Nd/rM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzRaXdtg; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzRaXdtg"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so1410590e87.0
        for <linux-alpha@vger.kernel.org>; Sun, 09 Aug 2026 19:38:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786329480; cv=none;
        d=google.com; s=arc-20260327;
        b=eD8S597g5Nh4a+DvfJIagoQFZcBNLOoPJN+nC4pgv7pWxWNi0ZdvuVyclqA0joayYT
         NyYYsVNh+GU8t23Htgccez08A/yfeD7iZ++ThgntmUlq330P7w0qHIhNIC0jNGyWpHXq
         lfcI3DbjuP/QyD7jAgnvhzUbT79/TJ9QI5rzzDe6Q0BKMY1T4paO0tV3pVXqoDqUJwKK
         OT4Am1OQ9urcr5GwpOvIQoTNYpJx5hwMjRW1xLj/ITtCbFDTw95Dn9358Sw+AO9i5puU
         F+jwwI+649Lm0fc+99Qd9bQyOP/7Dkb5MEl5aZYGWabL7yzbct5QUjxJznaOU1yXIL2V
         aIlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XTN2Mu6uvW/GBwoCtZFLQXdl9bgNTXiGGCGKJLiL8Fk=;
        fh=FwXb5JKu+9ptYOyqHAGzBuQjN80y+tXIM3uD53St84M=;
        b=KeZO2DJ9EwrQAwApMcpqf9SABdjgIl2BSKU9ofq3Hj8jtmztxW9sgm6V82YGefGbwy
         Ch1+PahrQV7Dr5Ft880QpdB1lLbMKXtMF6r+fTPDctdKlENb1MaUoKmwJMKrQCiLVcO1
         qDBNH6kZNsGYVHTxSVV3hguEMa8Mqn7zjdB7GvtVR4jCo0OvXdbo/9KT/tHB9FnpPq/P
         QqnaqR5bd3KOcrFXrf62X0LJdsMXb+wRizaeYwsVkMrnQhYzOoxqMf3gzLXTozOrVgqN
         RcO/0GodDGeaurNmCRT6igGGZcj2Z/J/onZfjYHucpPW0szBxGQJ7P1Ke1aavwmee+YK
         +rYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786329480; x=1786934280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XTN2Mu6uvW/GBwoCtZFLQXdl9bgNTXiGGCGKJLiL8Fk=;
        b=XzRaXdtgytvOwhtln66/Mw+Qzo/l8IjUmtsgsWPaBj29x0VxYr4Rc3qNovHxgmZrNB
         5LQ0Xr8tKp6JpkCRGq3yGHQZ4Cj5sLaAuCqzzV9QNTcKe+blUM3nSsDjLeVdYAIL0nyH
         YU0q7e2EbKXn20kAAy4KfUeTB2jAEnv2CH2YTvndT7koGALns7YXsxO3Eqyz+Q+3LPRL
         DwpeyAbiu8riPmS+sxhapDOJ6cWbf5l1DFVBBqjc+LTONjyUK/XJNVBBRKvSRxUiLwbo
         5lLAf2XcJa8QdYEnP/BCCa1STkpRRBTRj9ww4BAYbjyFPts4TPxm9KIKdm+CIPkip2UG
         rLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786329480; x=1786934280;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTN2Mu6uvW/GBwoCtZFLQXdl9bgNTXiGGCGKJLiL8Fk=;
        b=HeetZovxgYtFUZ+K3O55PyHi2oAkr46fAZ3ne5ebQyBU5gv5n37SpiQQraI6RxgTQ1
         YBrMkzza+gJj5p90esTLG7lfackFo/F0X0WBVcWkbRKnVp6svSnQ5iukkkp6kxSY2ljH
         nfMhbI6817O5CoZZCtCFoNiYsM2PSBEp3KkU4p4ZJrjzM8j31i8o2FsiHiX8eMByKtwx
         C3RoEm7WNa6J9jXlaWVOcc1nYpsccTb/v9QjS6xCw2i9ME2XdrT9QfCHsPu1B5UD7KxR
         kU0xTruUoEpRwO9P7WjTQROS48s9sRYHk/JqSVKU1+O4RM5d5veJ5nxJ7OdGQTEEjPBM
         vDcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpqsu/rP59CrkVGh7LXKF9u9ipVeDsSMQYmmz6MEIXjVoKSMqrzx8srBlm3v13OZfQW/AEGxBetnWdWcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT9iBRylu8th3BeW9mqS945EkuwZCCeQa6iDlYyb4ghNpOohso
	YEMt9AZDeWS1O/f19cnbaCs1PFEU+YZ97cU4+9l1qnMNn0V8qGVCpIUftuGnvOjdsE9udksl3ha
	nIY4OYJFjHmkM5ZuKNY4uOW4XbL1L/8A=
X-Gm-Gg: AR+sD12gGQq/3xlSNnzr+XPyHik9PWLmGcp+N5RGuj+cYf1FKvYg4Jy7kTZ3FppN7wc
	DUuWmbYYHEep9f/zmVBMEk84uP8TzXv8DSrELIo5W0bfhPqiL+DoeoyNZ/eCqRjYjkFK4DvzW+w
	dEzuhQaZBqHNT/iw/00tq+m8EichnJab2J1GU83jgnuZftXyuTp5gjTu6S67acHYuHy8LQk6bnm
	MZdbTb8smEBGAUE7XbQNNEGcqTku6nLZWW4XaLYK8MkDoi52Fi9pWualK+w3Vq10vp+rVjlDf3I
	gk83ANvAuZ+tbEvMJPfmfD7RKp7zVWl4zrtn9Pb0wCVinMDe4qf92vU1TFcTukEjV7KwoyG7GT4
	2L4JPzf3No6YB
X-Received: by 2002:a05:6512:1255:b0:5b0:1108:c57d with SMTP id
 2adb3069b0e04-5b303b82515mr3832026e87.46.1786329479979; Sun, 09 Aug 2026
 19:37:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809085208.3262799-1-linmag7@gmail.com> <20260809085208.3262799-2-linmag7@gmail.com>
In-Reply-To: <20260809085208.3262799-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 9 Aug 2026 22:37:46 -0400
X-Gm-Features: AUfX_mx-OqoEH0TSqr5d3xlkEm2EF25iMzwyVvoNB-r60_vMXG-yhmUwwqHhacg
Message-ID: <CAEdQ38EHDfxJVsSOorF30TCsZAoCG1D==Bv6Z0Mz0uyNvRPftQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] alpha: run check_mmu_context() from finish_arch_post_lock_switch()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, glaubitz@physik.fu-berlin.de, mcree@orcon.net.nz, 
	ink@unseen.parts, macro@orcam.me.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 4:55=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com> =
wrote:
>
> check_mmu_context() clears asn_lock and acts on need_new_asn, but it runs
> only as the tail of switch_to(), after alpha_switch_to() returns. A newly
> forked task never gets there: its first context switch resumes at
> ret_from_fork, which goes to schedule_tail() and then to user space rathe=
r
> than returning to the code following alpha_switch_to(). A new kernel
> thread reaches schedule_tail() the same way, through
> ret_from_kernel_thread().
>
> asn_lock is left set on that CPU, so the forked task runs user space with
> it set and interrupts enabled. A TLB shootdown IPI arriving in that windo=
w
> takes the deferred path, and the need_new_asn handshake meant to cover th=
at
> never runs.
>
> finish_task_switch() calls finish_arch_post_lock_switch() with preemption
> disabled, on the CPU that ran switch_mm(), so hooking check_mmu_context()
> there completes the deferred-ASN bookkeeping for both. Running it when
> switch_to() has already done the work is harmless: check_mmu_context()
> clears need_new_asn as it goes.
>
> The same hook is also called from kthread_use_mm() and
> sched_force_init_mm(), outside the scheduler's preemption-disabled switch
> tail. check_mmu_context() acts on per-CPU state, so it can only complete
> this bookkeeping while still on the CPU that ran switch_mm(). Testing
> preemptible() expresses that condition directly rather than naming caller=
s:
> where those paths leave preemption enabled the CPU may already have chang=
ed
> and nothing is done, and where preemption is disabled across the switch, =
or
> not configured at all, no migration is possible and running it is correct=
.
>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> ---
>  arch/alpha/include/asm/mmu_context.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/as=
m/mmu_context.h
> index eee8fe836a59..f7afc64ca8dd 100644
> --- a/arch/alpha/include/asm/mmu_context.h
> +++ b/arch/alpha/include/asm/mmu_context.h
> @@ -181,6 +181,34 @@ do {                                                =
               \
>  #define check_mmu_context()  do { } while(0)
>  #endif
>
> +/*
> + * check_mmu_context() clears asn_lock and acts on need_new_asn, but it =
runs
> + * only as the tail of switch_to(), which a newly forked task never reac=
hes:
> + * it resumes at ret_from_fork instead.  asn_lock is left set and the ta=
sk
> + * goes on to run user space with it set and interrupts enabled, so a
> + * shootdown IPI arriving in that window takes the deferred path and the
> + * need_new_asn handshake meant to cover it never runs.
> + *
> + * finish_task_switch() calls this hook with preemption disabled on the =
CPU
> + * that ran switch_mm(), which covers that case.  Running it when switch=
_to()
> + * has already done the work is harmless: check_mmu_context() clears
> + * need_new_asn as it goes.
> + *
> + * kthread_use_mm() and sched_force_init_mm() also call this hook, outsi=
de
> + * the scheduler's preemption-disabled switch tail.  check_mmu_context()=
 acts
> + * on per-CPU state, so it can only complete this bookkeeping while stil=
l on
> + * the CPU that ran switch_mm(); preemptible() tests that directly.  Whe=
re
> + * those paths leave preemption enabled the CPU may already have changed=
 and
> + * nothing is done; where preemption is disabled across the switch, or n=
ot
> + * configured at all, no migration is possible and running it is correct=
.
> + */
> +#define finish_arch_post_lock_switch finish_arch_post_lock_switch
> +static inline void finish_arch_post_lock_switch(void)
> +{
> +       if (!preemptible())
> +               check_mmu_context();
> +}
> +
>  __EXTERN_INLINE void
>  ev5_activate_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm)
>  {
> --
> 2.53.0
>

This seems to make the check_mmu_context() in switch_to() redundant.

arch/alpha/include/asm/switch_to.h:12 calls it, then finish_task_switch() c=
alls
the new hook a few lines later. Between them the rq lock is held and IRQs a=
re
off (finish_lock_switch() =E2=86=92 raw_spin_rq_unlock_irq), so no shootdow=
n IPI can
land in that window.

I think we should drop it from switch_to.h?

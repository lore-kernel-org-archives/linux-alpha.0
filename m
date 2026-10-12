Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E564AB3A3
	for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 16:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822072; cv=pass; b=SrtiEZWfcSXmYWqeMBepmMAsd+b1Lxnchl1IrSfgYSgIMhPOeT5qvh7/uQcWd+CiVIGQ2QKyJr1TtUtPeRJ6WXFtr6lgBdvbiFNh2dh1fAtF/WeMvEQnp9CfFST4be3Ddw5MhAtaPikh7pdhUCfLxmpl8gJkWGUrTXH3DN2TUtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822072; c=relaxed/simple;
	bh=ZtJuy+UREce1sg1peUoIDUZxf72qfaMwDaVEPJG8eTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tZ1R6VMxdNNTEn2xMWWmIjxjwVZ3t+E7RRqSjZutDwERbKjYcQhX7VsrSno2D4SRj70U0YIC0kwPBDBdkyB39NzTORHgbPhCmODt2RDA5mTdFlAmCnkoBquAOcFpJAH1yssUjlcTFE/J3/tcgxJcmLfe/QPx4BO+Z1OMTO1F18o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mlQe5Rq1; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlQe5Rq1"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso343187366b.0
        for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 09:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791822068; cv=none;
        d=google.com; s=arc-20260327;
        b=W0ZFt8R3b/aklEQkvAR0MquGJlMh+2npmqGqEkwgZQLVEca0LgrUZA9raPcixkhZ2o
         XtkXxPnZUGqJsp8tzHOW/+z4avb36e50GgtsV6M6WBOT9/4BcwEJAWZpQgzOniyn7+Pm
         1H2a97I0Q3QMw6RH9kXy+IrqNKXUFD9Erk29IsBdjswWeXACifJmKKWJaz4V3lE2bWif
         T3WgzmllQB5pypGDCtZcOAB8cyqdFISg7LJJ+RrwrcCdC014lCHdzwjC7iSvVmSoyIuS
         jcaSHSxCCnNyBsTbYCgb6CvA0SY6b5RJFQvs31xawJmk+MRJzCWce5tvIsvLorooJGTL
         Tdyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rtrJmGwBJ7fFDAdke9R1Vl4DtHEPSg3jl6Ch4LlMUAA=;
        fh=jHxrF2O8LHE0NwpS6t3LXpJJBpQIXiM8N8DcgkhwJnU=;
        b=VnQtRcK0hu6/37wKIRvDjvqb1IuRk3nBOtIKB5s6sQ8k69Z/fi0Ga4yYm6QCJQPh5C
         fqKInML5Ker1gmyJ883abFKcq6WyVp1qcgbzc1QYmmj9WUeT9bXOhN+w7JQQc0o3GwFq
         67eI6cLPgZyCLBXsaNl8dMGyi3ATrXAStwxqEB6E3927XVpcAR34PvjlVcQviF+DpS0o
         2+yMpy9DsZRjszTpcyzPPWjKi1BuL/hBp1QqgTuyBYlI87JOKtOrBPMP9URARsPYYGSZ
         GYckQeTXIN43Tzd1r5MxYDrkx3dL4PZvxYHX+MK0tFjD6uPwXSgN+m7u5wEkJE37ZQnp
         jzNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791822068; x=1792426868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rtrJmGwBJ7fFDAdke9R1Vl4DtHEPSg3jl6Ch4LlMUAA=;
        b=mlQe5Rq1SzCNDLgbX91+TwnsTuHGb9Q1PNka/WwZ1b4omFf2cviF0DCRzMFQTxS/Cp
         4kvi7eFoR2FXsAiQmzTBclVr20+xw9pf8erRlMoTnC6EOa6Nb0URMMYvwUdnax46HppO
         MJattmjMAg9RomV8fBUTBVcfuqu2tohO/rFrE7PceK0NuWZP3XUib4YiXDwTNVOXJgNf
         XDOD9IhgTmgK0dh1bR8BhZs+rS3AgOjEkgC5LyPj+grjMYHwj5KSZMTg4ASrcWpvAT3f
         4UclTyagrWBXPz1Kz5qTpJwadd/mXeLakp6skbKaqbrPR6JSyJuSxmboPM5QmFYGbWUL
         nGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822068; x=1792426868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtrJmGwBJ7fFDAdke9R1Vl4DtHEPSg3jl6Ch4LlMUAA=;
        b=jlS4apPEgzrWfB5SQ0IJ6179W5dvNer3+96arneWqwhlApOOZaDGDpF1IyhSBljUD2
         xpy/0OnQD91XtHS7DtuiF90oOY/HyHb5T/Lfut+059iXiIhojcB82OUx04ddA0vINvNU
         pmbaGB2olAm0SkqilMpIxcHLbVRR0gy0alDMAd5Ah58xNU2+303NyNWUUe/ipc2BENxv
         EhoQcTZ75iYWCPEDwNjRRE1kE3dKZlfY4qCUtnTt8DWB7dx3+XHDhIi7LFBolMsbrQud
         47iCB/M+fI0+YeGFMgQcvLHsip5vGIJuOMvhWJ1Dln+3s4fr69SgVx0KBO9z6HOwd89r
         60Ag==
X-Forwarded-Encrypted: i=1; AKwUvBzsNrEj/HeVd9eUZSzk+G5bwgbp7Xes7d12h7PIu0EmmL9WOx2XzdStkYDT0nSYxl0Mjg9wqp0YU7LYog==@vger.kernel.org
X-Gm-Message-State: AFq9FYLUvZanwHEHGibmkS8sWuFhXa8kzGuDBO0Sz7RifJHC/8jGUY14
	zuGCBF7P1jC/sOOF0SgY2bwFlCcNqXKtM9npOrybDujMatjmzEQ2nu2WDBJUR5eDAnYFpgLZ4cx
	uufzaygjSL62+CbE7GiUCUfU4O1hubAg=
X-Gm-Gg: AYBFou0bJx7TOOzyTpwpPbUK4YCIUdDtupZYMeAAmi2q5wLCV48CknTZzq5/jzDnx05
	DtX8RJYIRV4PvfeODUCeJCp17PYZRWgCGR7+yvLBD4Zu9+4EAUfvaq1fTMX76/bFFfDdsRyB/+d
	xzjyDKz0ylSh6mbbecR/M1F3JgGJgQ+AtvlhtfMsPflX50OnzoxsIj5vZgzyhuS3WRiLuNfxehh
	qKt3dWn5JgadrSV+VXt1pOEPH87vqZxKrzet+KvdJQZE+nXxTiNiQWrt/aDz87qRSYKS2lPdGVz
	JrxYN3EiS8+/AVLVMJtfsbbkp00YRA16SWHyqbrM6zYq3geNyDPTflD6+FerOXV0aT/rAYrhp3H
	34SGLTLbn9b8o1iltP9hgj8PNvZwS1xsJK3eL/ZF4mgI=
X-Received: by 2002:a17:907:d92:b0:c2e:7daa:2399 with SMTP id
 a640c23a62f3a-c31aa0b59aamr1021227866b.42.1791822068206; Mon, 12 Oct 2026
 09:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com> <20261011-alpha-perf-regs-v3-v1-2-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-2-eaa625a39712@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 12 Oct 2026 18:20:56 +0200
X-Gm-Features: AclHuK8ctq3ag-qDSt__fyD9TouOLhL0ONKOVT2c6PAyBUOuhZ4oNrOZClMtffw
Message-ID: <CA+=Fv5R05SLcLkHRfVhqLbjWfp29gpR=R8JDktjOKkYw83Xwig@mail.gmail.com>
Subject: Re: [PATCH 2/4] alpha: stop storing the user stack pointer in pt_regs
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
> Nothing reads pt_regs->usp now that user_stack_pointer() uses the PCB.
> Drop the stores, which saves a PAL_rdusp call on every syscall, and
> give the field back its old name.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/uapi/asm/ptrace.h | 2 +-
>  arch/alpha/kernel/asm-offsets.c      | 1 -
>  arch/alpha/kernel/entry.S            | 5 -----
>  arch/alpha/kernel/traps.c            | 8 --------
>  4 files changed, 1 insertion(+), 15 deletions(-)
>
> diff --git a/arch/alpha/include/uapi/asm/ptrace.h b/arch/alpha/include/ua=
pi/asm/ptrace.h
> index 9d86b2a1526e..72ed913a910f 100644
> --- a/arch/alpha/include/uapi/asm/ptrace.h
> +++ b/arch/alpha/include/uapi/asm/ptrace.h
> @@ -43,7 +43,7 @@ struct pt_regs {
>         unsigned long trap_a1;
>         unsigned long trap_a2;
>  /* This makes the stack 16-byte aligned as GCC expects */
> -       unsigned long usp;
> +       unsigned long __pad0;
>  /* These are saved by PAL-code: */
>         unsigned long ps;
>         unsigned long pc;
> diff --git a/arch/alpha/kernel/asm-offsets.c b/arch/alpha/kernel/asm-offs=
ets.c
> index c89792c86044..22ed3c975b1c 100644
> --- a/arch/alpha/kernel/asm-offsets.c
> +++ b/arch/alpha/kernel/asm-offsets.c
> @@ -30,7 +30,6 @@ static void __used foo(void)
>
>         DEFINE(HAE_CACHE, offsetof(struct alpha_machine_vector, hae_cache=
));
>         DEFINE(HAE_REG, offsetof(struct alpha_machine_vector, hae_registe=
r));
> -       DEFINE(PT_REGS_USP, offsetof(struct pt_regs, usp));
>
>         DEFINE(TI_FLAGS,        offsetof(struct thread_info, flags));
>         DEFINE(TI_SYSCALL_WORK, offsetof(struct thread_info, syscall_work=
));
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index bfa116d455fb..790389a15c3c 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -476,11 +476,6 @@ entSys:
>         ldq     $1, 0($sp)      /* syscall nr from saved r0 */
>         stq     $1, 8($sp)      /* regs->r1 =3D shadow syscall nr */
>
> -       mov     $0, $8
> -       call_pal PAL_rdusp
> -       stq     $0, PT_REGS_USP($sp)
> -       mov     $8, $0
> -
>         lda     $8, 0x3fff
>         bic     $sp, $8, $8
>
> diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> index cfaef96c4ce8..5882c65b7ef1 100644
> --- a/arch/alpha/kernel/traps.c
> +++ b/arch/alpha/kernel/traps.c
> @@ -30,12 +30,6 @@
>
>  #include "proto.h"
>
> -static __always_inline void alpha_snapshot_usp(struct pt_regs *regs)
> -{
> -       if (user_mode(regs))
> -               regs->usp =3D rdusp();
> -}
> -
>  void
>  dik_show_regs(struct pt_regs *regs, unsigned long *r9_15)
>  {
> @@ -186,7 +180,6 @@ do_entArith(unsigned long summary, unsigned long writ=
e_mask,
>  {
>         long si_code =3D FPE_FLTINV;
>
> -       alpha_snapshot_usp(regs);
>         if (summary & 1) {
>                 /* Software-completion summary bit is set, so try to
>                    emulate the instruction.  If the processor supports
> @@ -208,7 +201,6 @@ do_entIF(unsigned long type, struct pt_regs *regs)
>  {
>         int signo, code;
>
> -       alpha_snapshot_usp(regs);
>         if (type =3D=3D 3) { /* FEN fault */
>                 /* Irritating users can call PAL_clrfen to disable the
>                    FPU for the process.  The kernel will then trap in
>
> --
> 2.55.0
>

Looks good to me, I see the __pad0 is back again in pt_regs
brings back memories from tracking down the stack alignment
issues a while back.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554634B44CA
	for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 17:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791825155; cv=pass; b=DkwZ4mu0YjXa9uNZEzAWbT3zhDG+q9PvBESJ90cJjC7pJIRtoFbjqxLqgMOP5eBJoN+5Cbg/ZmXiGAUCSLEbogrYkU7oFrFNO9Ax8wrgb+PoN4TYliMehglQFC4CVzMGm64p23TMeO5ZYTkMOQcjvkBaWp8V9V2UF6FqTWDSnaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791825155; c=relaxed/simple;
	bh=dpW2g/OHhp1bd+k/Wa9Z4WycLX07oh4uMIjONrgblWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JPpxWpw7WUUb4EjqEPDMrHWq45Zb19ix3NZIjngehXM2A25ad+UXeZ/j5aX53y7gLE3mn8oPTEvslmAgmw3qUCOsivXr5HLOYtrNqrLB8lXFVw3Up81Dzj+o+JQpETCws7tKUpegoDXvfgl29zF5FcqxKA5+WfZ87en2yQRAVvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNtkXBU+; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNtkXBU+"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2afa22e1dcso302156466b.1
        for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 10:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791825149; cv=none;
        d=google.com; s=arc-20260327;
        b=KLcy2g6GQ0TtrR5GKzoLzgsNzZFwEsfmOiSCk4EQZfGUEfkYoyCB5sNGGaM4bBll+p
         d62HxiqZ+jNnAGCzcESS4vvP7kgjiwUFl6TZQo9QjjlxmrEqp0Z8Z/zesFqtZyicExeb
         bn1ySTBlCRyL1kKGRVBV5nJUauUzK52sqh7A+/CrT/wYywQeur55yadZ57SsCqMih6UG
         dfHMJcrlYeyThlwlh6ruOlYCkCPZCsFjcXaUc1s78AH69YhSGzl1+gXz5NcXyfRDgFQk
         VC8eZHv+54dO4spqiY1Xcuz56KBXidb9hm4O/T/bDe8RX4UXazO6A99o0EGZBzkT7lKV
         kriA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UhieV+/eJrwJW2//RDtEPeUp5XItWunJ/DM2B+e/f0M=;
        fh=0Zhuj2PsoyBHBHG+q+MZN6xc1JDyshKxmKZkeVYThMU=;
        b=ZcS2X1t0Gu0nAZIyeGtwSbKjJ4ohqUcnvN0nJ8rKbZZpLEJChbbvxPpEp6grO/ympe
         TbPpEWylSN3gYfUM819OIwPjoMIq671jLMsw3ZE8tXgsuejdQZT9qdkcMe8F77Doh63S
         gbCr4NjwdKO/HbcG+LSIWcshC+0S01xdzYewj1P4b+d5mpqOPcfMTOCVz8Mway2UR69W
         L7Yz3awkoXP80o7ZT1lLgRHyJC52YPBwK/VjgURNb8UJTIzZEM41Thvc5WMnEsDMWjOu
         lPJaYa8Fbi5kXJUxIH+yzO9/Vbbdar6B8WBUh2+vUdoKEiRWofQdvAiwlOMQoCCoPZYc
         /QXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791825149; x=1792429949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UhieV+/eJrwJW2//RDtEPeUp5XItWunJ/DM2B+e/f0M=;
        b=LNtkXBU+ki5e5hfXUbOYJgoqmVPmvvlOv6aE8TeGaObQVrMEhK5SMDzl2vxRDv3w9a
         Y9wMRqWUrUzIgVfOB2QeS1wDoxLAVUOmRoz+jmQZ2FJr+w3MAOm2EhDw6RbyRXdE8+sd
         EFFSjzf7S6eyHBu/Eheio/8fEREfXEZSFvjEZ4TJCeXfBVO6s1iEXjBDMbRGtGf9lMhI
         uTRs9DRO+EAWbu993mr/8EBwNvBG2f3wYG4vQXxzFlixvQJSNrsYkgQNH/kDlVbbtugm
         v2p3/8lgQ1Lu1aQtanuQOuwjI6Zru14CSDwomS76o3l499/Be5ER+5B517veqwwcEpiM
         ZJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791825149; x=1792429949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhieV+/eJrwJW2//RDtEPeUp5XItWunJ/DM2B+e/f0M=;
        b=uxb443bSOZ5SdJy+9sglyq0cXadyPmZZRz1/RsNlLJL6XEO02RFV88hlqH2pYUiGxx
         1Loo7eqnLuf8ukO9X5+NBTxbgDrcRpij8Ub1Q7MSU4X6KIyunKBKNxEFWr9YNCjyPKgy
         kFp+4vpyyOwya68QVZ4drAYelODEFG3kDegV58W1N+4/OF3Q/jeieD9qgJnSqYXwZRmE
         1Hfx9ArICwuYsvhFq0ZHaf02xarlA9Eu91Vk/K6twzo4l1vaQJ9KRc8iq9lS+AxWaFzd
         laEuFgWXm2BJQlDlMkRvd+P53ClAnHM6/G5DtUesD0XLxHYoXQ+8bQyU2LKmcTGAYx3C
         uplg==
X-Forwarded-Encrypted: i=1; AKwUvBzy+TapXAh/i0ctbqCpSwzWOpdO+AwnqGMYx83R8pt9noNrqCsjGOIKdobCLZOATwFnhsldvfDZk3557g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1qwbE8UYI4jM7TJuWxJbUpyO742hKiHmVd+gC71HeCKvozBsS
	/iSAkc7qhEfAkUBtvHOJn1YDaxC5cKDDgyIiTSqjoUEcouLDmCzPsPSyJkrCNEmewY6Pl4hlGh+
	SSm5gj8s9OKISosG+0rLfk/mkQ9G1Boc=
X-Gm-Gg: AYBFou3qi2NMW3kGH4p7bKLkM3IHCbunvdQjkhYEC0tAVMqjHRNYznN2cAJ56s5Zvw5
	+libH7H041wrlloohT8o9I0qxOXwHG6YEhkkvCOxUndfSzaLnAcCHF13VpDgTGoq7taI3aEGXfK
	s42lXosk0TDPw5xkzmzT/HN9A9DBojfL+ENxvhV7FVSsRw7DzonBvt2QrLyOZk1G+vi9deUtZuT
	K/+C6Owo8Pjg3pv8HgivPGkPRBuXImmRTsekBelnUDPtrCIhoSm8LyruzM9vb+cTzLOrFT9menh
	sxTLIbKUz7RT6dussXMLsa1sIcbBjNzASNGHXfYy5gl+hpU+0wu8wU1VHU9NQ9YDJ1XeRtyDDPj
	yGpUSx5++3uSq8ZB9yLi3hegwWp46hAo9LdfZE5jX2A==
X-Received: by 2002:a17:907:2d24:b0:c2d:bcf7:37f9 with SMTP id
 a640c23a62f3a-c31aa07a9d9mr992370766b.26.1791825149332; Mon, 12 Oct 2026
 10:12:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com> <20261011-alpha-perf-regs-v3-v1-3-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-3-eaa625a39712@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 12 Oct 2026 19:12:17 +0200
X-Gm-Features: AclHuK_IfbO80biMKT5u2j2yFp2FuPhLw89IvxvMZVpINwN-IiFIyIRGdYMzWGo
Message-ID: <CA+=Fv5RW+ju5weuhDMLjEFcWvg0G0RnWXiqTr-0HmCnWhcaQUA@mail.gmail.com>
Subject: Re: [PATCH 3/4] alpha: use user_stack_pointer() in KSTK_ESP() and dump_elf_thread()
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
> Both open-code the same PCB lookup.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/processor.h | 3 +--
>  arch/alpha/kernel/process.c        | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/include/asm/processor.h b/arch/alpha/include/asm/=
processor.h
> index c461a26d47b3..73251cd671e0 100644
> --- a/arch/alpha/include/asm/processor.h
> +++ b/arch/alpha/include/asm/processor.h
> @@ -43,8 +43,7 @@ unsigned long __get_wchan(struct task_struct *p);
>
>  #define KSTK_EIP(tsk) (task_pt_regs(tsk)->pc)
>
> -#define KSTK_ESP(tsk) \
> -  ((tsk) =3D=3D current ? rdusp() : task_thread_info(tsk)->pcb.usp)
> +#define KSTK_ESP(tsk) user_stack_pointer(task_pt_regs(tsk))
>
>  #define cpu_relax()    barrier()
>
> diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
> index 06522451f018..7861c9e767b7 100644
> --- a/arch/alpha/kernel/process.c
> +++ b/arch/alpha/kernel/process.c
> @@ -318,7 +318,7 @@ dump_elf_thread(elf_greg_t *dest, struct pt_regs *pt,=
 struct thread_info *ti)
>         dest[27] =3D pt->r27;
>         dest[28] =3D pt->r28;
>         dest[29] =3D pt->gp;
> -       dest[30] =3D ti =3D=3D current_thread_info() ? rdusp() : ti->pcb.=
usp;
> +       dest[30] =3D user_stack_pointer(pt);
>         dest[31] =3D pt->pc;
>
>         /* Once upon a time this was the PS value.  Which is stupid
>
> --
> 2.55.0
>

Looks good to me.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

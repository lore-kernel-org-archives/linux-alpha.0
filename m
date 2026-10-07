Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1711237BE6F
	for <linux-alpha@vger.kernel.org>; Wed,  7 Oct 2026 17:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394967; cv=pass; b=ARxj8FPQYfLWvFnpakK0E2pWxq6R32QF5gpqmiQtsmvm4r3kUD5kmpZ0gRTP7jZvdyAP8RMkmdT/zn2i2LHwfxR+4edt/FFj/U690QDJv8qbBIlmt/snxdk/1ECddereGvBPksrKdkK9nQQFGwJQx+bqXSu2WChM517auacMKhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394967; c=relaxed/simple;
	bh=NcSrUtXzGMzQQa330luF3YMdUPxwQ4mybFGdhW/zOmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r6UdwFC+KtuMX6Fk3OfWW4oGwE1+rjqyib4VOMsZd/JB71LaiXvLb1lm3rS4xA2A4fk2VIjXodIaCcjRt9somodCk1UkTQ4Rx02YV8XpxZSWTMqg3dYcArBSnSvcwmWrphQh8mkwJxYCaWWXwGFMu+nycxojm20FdjPX/8t5G4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYqTy49v; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYqTy49v"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so1200686a12.0
        for <linux-alpha@vger.kernel.org>; Wed, 07 Oct 2026 10:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791394964; cv=none;
        d=google.com; s=arc-20260327;
        b=eZcgDIIJ8vCo0sPc7pzPxETkuju0A6+lTXDklQGJ4S/rEmGnonqe4H4RbZvLjr9hts
         HRvAGRKFcUkeAFzXn6ynoQK5AsXAZAdutu7tflxshBeLla7qmNnaYu+vf3a94ksijTqg
         1hX+bahb2ldBW8MFQBQzSe8UnctROt2HfhQgyx9viaKa2L0j5wKSHblcDjdZ+xqxU8kF
         4Tnzr59K51Xd0n5mGq84a6sz9Zcd+GBfY/IXogIeYRig8yBOpm8UbPy80KbncAPnKd8t
         QtqZ5u72PXj/wjgETw/TOot0aOTv6gZ7X7Zv03SUqQ3Xnb9RLgFxb+bBimv51E8LDru9
         j4QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cvQDty+K8atBKUnQl821IKJ8GM3koYeQlQ/6cuB1MJA=;
        fh=GFJVYKuc5GHXSnsig2t74X2I0U5YW3aTvMvXpWqpJ64=;
        b=bYUAUwXuEtq/5XevCnNXdBmmolgemcPi1OYkG81uWUIBch9Qo5yh3xrc/d6KeOwvF8
         HGaSTzwzvNSiumjLFBrzLgI/Ojyjw080015d4VDoxBB+nHm9AleVfd0cVGMKSfUlGcPb
         AWU964yBt0ZZ1cFFXJaKD8Ku8Cd8qkBSU6LNzvj3f4WWyxXQb+/2RJQ1e/wbiiPCB+82
         vLlLb2xqIQjtDFqlcxJ9ludwaNo+AAy3meJ2wbpoyDPm/oKR+Y8J4c57252nkPOUYlnj
         ySDv7eFNPXljMBQMSWEEtvUdsJC1hmMOJcNvsnXRPV0xW3wTN5+OT4F1vSyyqAzywsio
         KR0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791394964; x=1791999764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cvQDty+K8atBKUnQl821IKJ8GM3koYeQlQ/6cuB1MJA=;
        b=YYqTy49vfe347QmiB0XprdpiME1Qv8OxnCRxg2dUdAHLFlHBeIbPtyMIQxh3OMeLN9
         5HljQu3sDLkUHG93MLPpSi4IfxPjeL4CfwL9LBXudpTnlxUXyF1xfiwZuMkEHFpvEd9f
         S1+6lHn28NxW4/j9RQFZysfoAWG+XPYv+CqldLbJaW6hFZkxeXKh2gDXPU57OTOWkfE3
         taAdiu6bN/ywIgwAgFDxEmCVDxGYe2M0OuL91OHLABwvtfDGaPnPsBCRkKEfkRITByZ1
         uEjFqmx6eHyKk88zpqaiTU9g01D9u8WMSVclYnq1vQiQNomgrVKUo0tGmkCjqTQO414n
         5kqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394964; x=1791999764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cvQDty+K8atBKUnQl821IKJ8GM3koYeQlQ/6cuB1MJA=;
        b=ytsaH2ipLnf8vYgAGof67Iadfxs/piTNGf9RmEPKAUJXECSL63YI9AyxnKw+7Sc/H+
         eFytKleWQqQHgERWqZpZDqhCujNDuIi15d8qWQTpwzic5euFY+1WW+jAZ9EJD5r0FyOB
         xoHD/QCySQdwHDk3rV22Q/BMenoEz4TN0+7a+LmwSF/dCqcekRXpnTfCBRQY59nVBg1h
         G/awBBX/9VGeejmXF/hlsbOKsq9kKX8hGlR0vmnqOKMtAbwKpCvFCudbNDOU+z/+kLaL
         OycmpCX+Y6rPfGMMpdBqG8GHN9O1KRYz7iEScirYh3EghCikdtfz2l9/qocTeCbwRgtf
         ecZg==
X-Forwarded-Encrypted: i=1; AKwUvBzwPuBNn655HP23twTE30kBa9XrSCOFm0wM/qZY3kHy5lOBp7GCW+FO/hposneQFn7nloB1hujR9VZRAw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLncQUlWVpUsNwlFO+Hz7EyBsH2zc6KB2eu9HeqVC1GZVlGbIwm
	QEygUBEVVumsEvzog0/m2+LhrNQg5q271CCOBxqkQk2zt9CIG5BgZlSH14scd+pSQh3AMYMYTtU
	Cu7b+Wcf7zI2024z7jH0G0eyIsvw74xo=
X-Gm-Gg: AYBFou0uf2lmHS0bSjvbZUmbNpfBmK3nRdjXvAhjSB3TrFr/Z9NpIPexQca/7X0DOks
	vBWilw3b5JhznMjzUcgFnrpicfgd+ogo2QASOME8lTRtY80idNdj7NXlHajlsnGSzRZ20Mrl+oZ
	o2aFJ9w9RGJdfbkWx3HWUXe6YSc3EltdOUkMepHd+lpvL+lCGhxn+6NezrFOsd4S6sMq93hL4Ch
	BxitfN0XusW6PfGyrrsEyR0TQWXCGnnMhIlKoUbHEidtcnw2398utNfT8bNshyqigbh7lvQkd5x
	uKVQDWCfunMY/t4NrdnUtaT8ZR9lPUiJpB4d14QJXOInJX27e+qFTVmez1NvvvgoEn8qmYaoz4o
	UOH3nwlXzN4t8uAQ2HdzVypORN1qPzaBrzTbJMHB+ffplPKMzhq8y
X-Received: by 2002:a05:6402:3211:b0:6ac:af31:24f3 with SMTP id
 4fb4d7f45d1cf-6aff47d8578mr3039617a12.31.1791394964135; Wed, 07 Oct 2026
 10:42:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com> <20261006-alpha-hugepages-v1-2-a673a18aaa70@gmail.com>
In-Reply-To: <20261006-alpha-hugepages-v1-2-a673a18aaa70@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 7 Oct 2026 19:42:32 +0200
X-Gm-Features: AclHuK_SDzMruZliU90vYKZ_Z-ZPw6XW68BB2EOxFCyTUR_qs4vgJ28kLPpYjx8
Message-ID: <CA+=Fv5QQtBnqUjswZSjndFzMmhQ8YKsDdQgvKmL9y4nQHPnW2Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] alpha: handle VM_FAULT_HWPOISON in do_page_fault()
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Oct 6, 2026 at 4:04=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> do_page_fault() handles VM_FAULT_OOM, VM_FAULT_SIGSEGV and
> VM_FAULT_SIGBUS and then falls into BUG() for anything else in
> VM_FAULT_ERROR. VM_FAULT_HWPOISON and VM_FAULT_HWPOISON_LARGE are in
> that set, so a fault on a poisoned page takes down the kernel instead of
> delivering a signal.
>
> Alpha does not select ARCH_SUPPORTS_MEMORY_FAILURE, so the machine check
> paths cannot produce these. UFFDIO_POISON can: it installs a poison PTE
> marker without any memory failure support, and a subsequent access
> returns VM_FAULT_HWPOISON. Registering an anonymous range with
> userfaultfd, poisoning it and reading it back reliably hits the BUG():
>
>   Kernel bug at arch/alpha/mm/fault.c:188
>   poison(50809): Kernel Bug 1
>   pc is at do_page_fault+0x4e8/0x550
>   ra is at do_page_fault+0xfc/0x550
>
> The BUG() fires with mmap_read_lock() still held, so the faulting task is=
 left
> unkillable in D state holding the lock, and shutdown stalls behind it.
>
> Deliver SIGBUS with BUS_MCEERR_AR instead, reporting the size of the
> poisoned area, as the other architectures do. That is the huge page size
> for VM_FAULT_HWPOISON_LARGE, which becomes reachable once alpha
> implements huge pages.
>
> Tested on an UP1500 (EV68AL): the reproducer above now takes a SIGBUS
> and the kernel logs
>
>   poison[373]: hardware memory error at 0000020000030000 pc 0000020001000=
7ec
>
> with no oops, no wedged task and no taint.
>
> Fixes: fc71884a5f59 ("mm: userfaultfd: add new UFFDIO_POISON ioctl")
> Signed-off-by: Matt Turner <mattst88@gmail.com>

fc71884a5f59 is in v6.6, and a UFFD_USER_MODE_ONLY userfaultfd is
always allowed (userfaultfd_syscall_allowed() in mm/userfaultfd.c), so
any local user can reach the BUG(); Maybe this wants
"Cc: stable@vger.kernel.org # 6.6+"? However the backport will need the
show_signal_msg() call dropped, since that only exists since
9ca6af1aac40 ("alpha: select SYSCTL_EXCEPTION_TRACE").

On the UP2000+ the SIGBUS is right at every size: si_code BUS_MCEERR_AR,
si_addr the faulting address, and si_addr_lsb 13, 16, 19 and 22 for 8KB, 64=
KB,
512KB and 4MB.

> ---
>  arch/alpha/mm/fault.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
> index dfe427d93072..24408b53197c 100644
> --- a/arch/alpha/mm/fault.c
> +++ b/arch/alpha/mm/fault.c
> @@ -8,6 +8,7 @@
>  #include <linux/sched/signal.h>
>  #include <linux/kernel.h>
>  #include <linux/mm.h>
> +#include <linux/hugetlb.h>
>  #include <asm/io.h>
>
>  #define __EXTERN_INLINE inline
> @@ -113,6 +114,7 @@ do_page_fault(unsigned long address, unsigned long mm=
csr,
>         struct mm_struct *mm =3D current->mm;
>         const struct exception_table_entry *fixup;
>         int si_code =3D SEGV_MAPERR;
> +       unsigned int lsb;
>         vm_fault_t fault;
>         unsigned int flags =3D FAULT_FLAG_DEFAULT;
>
> @@ -185,6 +187,8 @@ do_page_fault(unsigned long address, unsigned long mm=
csr,
>                         goto bad_area;
>                 else if (fault & VM_FAULT_SIGBUS)
>                         goto do_sigbus;
> +               else if (fault & (VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_L=
ARGE))
> +                       goto do_sigbus_mceerr;
>                 BUG();
>         }
>
> @@ -248,6 +252,21 @@ do_page_fault(unsigned long address, unsigned long m=
mcsr,
>                 goto no_context;
>         return;
>
> + do_sigbus_mceerr:
> +       mmap_read_unlock(mm);
> +       if (!user_mode(regs))
> +               goto no_context;
> +       /*
> +        * Report the size of the poisoned area, which for a hugetlb faul=
t
> +        * is the size of the huge page that could not be mapped.
> +        */
> +       lsb =3D PAGE_SHIFT;
> +       if (fault & VM_FAULT_HWPOISON_LARGE)
> +               lsb =3D hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault))=
;
> +       show_signal_msg(regs, address, SIGBUS, "hardware memory error");
> +       force_sig_mceerr(BUS_MCEERR_AR, (void __user *) address, lsb);
> +       return;
> +
>   do_sigsegv:
>         show_signal_msg(regs, address, SIGSEGV,
>                         si_code =3D=3D SEGV_MAPERR ? "unmapped access"
>
> --
> 2.54.0
>

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

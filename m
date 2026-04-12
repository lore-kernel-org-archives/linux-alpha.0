Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BAD33E37C
	for <linux-alpha@vger.kernel.org>; Sun, 12 Apr 2026 12:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775996100; cv=pass; b=DOQAmnMunyyhucD//bQO/iwU+8ZokXqkSyf6l4kB69YHytq7YfuGbqj4lvNQThiMCh8MvLfLveoeJJEpj9aUFlUpputy4yUi6qgpk0TljSvHL+KI9xlDa0NQeQvCtETmqrckT5Mb7EuFSVojG0p6apgjegBl/uyc/IGDXmyByus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775996100; c=relaxed/simple;
	bh=s69nXrbwvVThczNXzcdY6QcO/CeWOPjkbeDyYMqRSlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YNfZIwQUk1C2iFajuIAk0vaQpwDkuVasOkyB9tozDUia5HMqRy6nvoIf2UYeP/WdB24nd2/6lHcXnMY107G0L0F1MQXzC4qrrfoBvE1rbiE0hI/2s3wSEUAePRhhNIKegrdINUQ29e5fo4uAzeM0X1WzQuH3JgU3KVCKZeAOFUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5Kw4Fj8; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5Kw4Fj8"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9c755b2cdeso546155066b.2
        for <linux-alpha@vger.kernel.org>; Sun, 12 Apr 2026 05:14:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775996098; cv=none;
        d=google.com; s=arc-20240605;
        b=F0iNnITvx8wXOUdUEtvhJwpbwNA3tTQXG6Vkdn0bGMVO2FePgiPiuj+Gy7JC+WiHfr
         SkScfjWmxVBHTY2Ba6rHOYOkXnZDmTeXvLbM0lm50RXwujIgE3+UaB6MkkaEgrv87lXn
         xS8jCZztuMeJe3XTJp+f5x2cnTHtM2xMWY4BHmXXbB2JYdZhYS3Ng2QqUfdOao0SYLl9
         dOmROATDRXBzTyv9997IoXPCxsIRnJEn+LGb2mo5OL1XdaJQXhqrHKqjLVUBlrNbyM9k
         NU2rslhTBv5VkgrnExC9Lpbh5nie47IwkR9sYKa5I2cBPyhs/fABChroy5un8lWq0Gnt
         fdcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n8iQpCJ/FfGE5FcvJpReMEpmvPRCcp/ylO54INw8XPk=;
        fh=ViAatGiZ05dh3a394EUid4cQpUnAI/U35CAucij+cuk=;
        b=CvISOAO/Q9FpGuaaLM5+adDSZbNh07JYz1kxaHPAa929fFEbGKqhwNUDtHygAK+/zG
         kwjgvyfFrj8tFTFfiTcmsJYLovBcWgXB/l3HyoEJ6ujI0i/Xp7vAWSN3yEpkwTSJyO0R
         BW/5wwvAXXJvf0PvySNKQLUjSwXM0RuvXFEcSm7GB1XIASpAFwV8jCZ6dSrwBbBRBQBi
         /uzt8muJbJBdth1Eo8CQwIUqa01b9X6qlEm69YOvOs9/vbU9U1lOBgb7wHJst0wJnF83
         ReuyF4PaUdXysp90Yg058Dw1d0S8LjuH9SG3KIl9AGE9Nlm0ilh3vS4JYCHmXdqMXcbE
         j98w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775996098; x=1776600898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8iQpCJ/FfGE5FcvJpReMEpmvPRCcp/ylO54INw8XPk=;
        b=f5Kw4Fj8HtZv5872s19ovJD5W3OWWSBdwzevMy06/FQcvenMWukSs3YohcqaDjGSTz
         KZxLiSwevUxIrDVt01MZiltCPPRkIBCjXZt5QzOFnd7BKNiR0aBsIZRzeJ1Stue4UB7S
         im+oylixYE8qrXVD/nYKmyukrDvx7/fZu3Xjvi4bZjNDRDkmOuJlDxWeKY9kQT+MleT4
         wzRmMVCwFSOtYcgefbHSPWQLTHhqiuEyILLQNnP5EVw0T999bqMZTRKT+5KswHKsdnBO
         JvN3Ry2kbg6e5/U7nFb1QypHK/p8GLlLIPyiwbCGMJQOp/1myEDXkUIE/EkQhhQDHjnm
         02/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775996098; x=1776600898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n8iQpCJ/FfGE5FcvJpReMEpmvPRCcp/ylO54INw8XPk=;
        b=OLpiXDxZ9SJHX5H2RHH9+wAQTg3V4Th2ax5qmxYg+vkzpFO3qEcDf+HynqhCVoMMYo
         A/ziRW03FMqCA5OZJJ/kWU9/B3V5xCnEsJcHXMPSjQT9Q5ZrHczacqWQsxzqCrQEAIwg
         PHIMYyntIA1zeAwS/H4uALNy21MqVstRGxkN0JSbCDoR5IGu4uOI2NUqUQ8xXt+4HLnE
         Dy/FQi5njxWoaHIOfSSWHZyQB6vHvLnCttus4cDIyMmv+HuAgYB1DoYUbmQg0Ijki4jg
         bRqqWaZr4lyUgkfTOIRZpmLrFBE8LeGcndzSKJQPkIv2XHpLnE2lh1QnO0kIyUvKEJH2
         CnuA==
X-Gm-Message-State: AOJu0YyFpvtj+zMGd+s8WoqORnwuypb5Qt4VQYRts1l8QO3mGuBYqgmb
	o8W074mZH1alOAUlvP3xBx3gLoJR1HE5sc/eqnK+Z2Mbjsmnk+fRI0OZckXhDKn63nFA1mKC6A0
	mL5k5DQzscn12BgJPO5Alc2y4TFHN6PvOyYE8
X-Gm-Gg: AeBDieuUxlWVCw59hPlHqi9MAQB3PmjrqKrGhf4UYUP+/VGn+xt3azfywHmJZNEp3kG
	i6xEudFxl0uSRWIOOSdiStIWDM5GCqsSdK1Z9wSYBSoc9HDrNu7uEKgDfayrmhIAxNxyXgZ7/Hb
	z1foTsK/+N52/9cUZC1cMJwMP9ZSpkylwFEAetys7UQ3bBBn5kJlnDvy5WnsJYOPpinEELw62on
	SLgFWB9Re6NDX+FMQ+e3ybmSPugTjyuKP+6cMhSTLzyKL7aw1cYlxHmUYM9ow+QlZrWwmNKtyM0
	P0r6VCG5lqxtIhZevqRN/lwp4HSfgmlJ+/lnrtxI
X-Received: by 2002:a17:907:6d08:b0:b9c:c855:d93e with SMTP id
 a640c23a62f3a-b9d72657330mr472292666b.29.1775996097349; Sun, 12 Apr 2026
 05:14:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403150730.490272-1-mattst88@gmail.com>
In-Reply-To: <20260403150730.490272-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 12 Apr 2026 14:14:45 +0200
X-Gm-Features: AQROBzA-x3tl_SXukoviaWV-WiWElTGZfNaxtqkp8Xz-QGNirtg4JF1p8dDs6so
Message-ID: <CA+=Fv5TYDKQRo8mBd0XhFE2PwHqMHFG1qD=RxSLYZ7qUEbs4Aw@mail.gmail.com>
Subject: Re: [PATCH] alpha: Add PTRACE_GETREGSET/PTRACE_SETREGSET support
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 5:07=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Enable HAVE_ARCH_TRACEHOOK and implement task_user_regset_view() to
> provide regset-based register access on Alpha. This adds support for
> PTRACE_GETREGSET and PTRACE_SETREGSET, which are handled by the
> generic ptrace_request() path.
>
> Two regsets are defined:
>   - REGSET_GENERAL (NT_PRSTATUS): 33 registers (32 GPRs + unique),
>     matching the existing elf_gregset_t layout used by dump_elf_thread()
>   - REGSET_FPU (NT_PRFPREG): 32 floating-point registers from
>     thread_info->fp[]
>
> Also implement the full set of syscall accessor functions in
> asm/syscall.h and user_stack_pointer() in asm/ptrace.h, which are
> required by the generic PTRACE_GET_SYSCALL_INFO code that
> HAVE_ARCH_TRACEHOOK enables.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> This is an implementation of PTRACE_{G,S}ETREGSET using the standard
> infrastructure.
>
>  arch/alpha/Kconfig               |   1 +
>  arch/alpha/include/asm/ptrace.h  |  12 +++
>  arch/alpha/include/asm/syscall.h |  67 ++++++++++++++-
>  arch/alpha/kernel/ptrace.c       | 137 +++++++++++++++++++++++++++++++
>  4 files changed, 215 insertions(+), 2 deletions(-)
>

Thanks for working on this, this is a really useful step
towards getting Alpha onto the generic ptrace/regset
infrastructure.

I=E2=80=99ve been comparing this with parallel patch series:

- alpha: enable regset-based ptrace and core dumps:
https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git/log/?h=
=3Dentry

- SECCOMPv3:
https://lore.kernel.org/linux-alpha/20260409171439.8759-2-linmag7@gmail.com=
/


Especially what I=E2=80=99ve been referring to as the SECCOMPv3
patch, and I think the cleanest way forward upstream
would be to stage this a bit differently.

In particular, I would suggest:

  1. First let the SECCOMPv3 patch land upstream.

     That patch establishes the new syscall register model
     (r1 =3D current nr, r2 =3D original nr, r0 =3D return value,
     r19 =3D error flag) and provides the syscall accessors
     expected by generic code.

  2. Then rework this patch on top of that new baseline.

     As it stands, this patch assumes the old Alpha syscall
     conventions (e.g. syscall nr in r0, no rollback state,
     etc.), which will conflict semantically once the
     SECCOMPv3 changes are merged.

     In particular, the asm/syscall.h additions here should
     be aligned with (or dropped in favour of) the
     SECCOMPv3 definitions, so that:

       - syscall_get_nr() uses r1
       - syscall_set_nr() updates r1
       - syscall_rollback() restores r1 from r2
       - return/error handling matches the r0/r19 contract

     My suggestion would be to avoid duplicating that logic
     here entirely and instead rely on the SECCOMPv3 version,
     only adding anything that is still missing for
     PTRACE_GET_SYSCALL_INFO.

  3. Keep this patch focused on ptrace/regset enablement.

     The regset pieces (task_user_regset_view(), GPR/FPR
     sets, etc.) look like a good fit for the generic
     ptrace_request() path once HAVE_ARCH_TRACEHOOK is
     enabled.

     For now, we would leave out the ELF core dump changes
     from the other series and handle those as a follow-up
     once the ptrace side is settled.

  4. One open point is how we want to handle the user stack
     pointer (USP).

     This patch derives USP from thread_info/PCB, while the
     other series snapshots it into pt_regs. It would be
     good to settle on one model before merging regset
     support, as it affects user_stack_pointer() and the
     GPR regset layout. Either approach is workable
     as long as it is consistent.

I think structuring it this way gives a clear
upstream story:

  - SECCOMPv3: establish new syscall state
  - this patch (reworked): enable regset-based ptrace
  - later: possibly switch ELF core dumps to regsets

Any thought on this approach?

Magnus Lindholm

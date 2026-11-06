Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793967171;
	b=JaKQ3GsdWQE5kn8k+pgopuAYEM6SkacdUL16BLxPIwYeZs2dvEFf2GGZLW1aW90yJwP7
	 dN2g63keffT3+u/Lz0pkg/TDX/Ab4cPhIqMMKadfvF+XLjovb/WRHFDVTMVUVxDp5LCOP
	 4e3+1xiu643V4Z5rxCYkmC9kCwQQDSbFVWfMYmMMZMYdmxpxjPunJoPHYw0zkvPUGZc+q
	 bdwIgSnHWLd2teslhQ3p98v5jFFI57i4xNPOmr0nzCM2CIgBZCNT2PSDV3R23UA5sJkXb
	 Xl8GrlKjdhxvIXhsN9KXVmq6tWdVEj+px73kH3ULcnWkpTCudTIG5P0o5ths89fmwjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x1/cuWPUTv0vs8CRRmZ6/x/mFtko9mxhwsi/tFyavW0=;
	b=iRv0+KgBOq/EFmGax2AIjcE/QQp9M1Og4QyelPve33jC3InBzhykjFa/FvUK6m21tR6s
	 X7Sst4cVBebAVPeCxaz7dUR+7UVvL+Vp46+Qw+xdKiIC7YHreg1Rl3Wsqz6E68vFLuwJB
	 Ot6Go5MDnLYDzJfX1843D6llUFfNTitXy0MQwdVU23ZVZEKIFlN+bv0gP5zN34JOBydA9
	 e8/smn1A8nceCGUoPVERxu5v0wGbKT0kJ3XWr5tHymTmauhP21Rp9RjKGOntF8+LiiAu8
	 Jmr+Ok5+lJOoFADBwYeEiLRpIDJ5epkcg4oCAWJ5lVx5YCkA+gLIaZrcUPlLO/tTsJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xDYrVneH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D88606A32E
	for <linux-alpha@vger.kernel.org>; Fri,  6 Nov 2026 12:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69D88606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xDYrVneH
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so671956a12.2
        for <linux-alpha@vger.kernel.org>; Fri, 06 Nov 2026 04:12:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793967169; cv=none;
        d=google.com; s=arc-20260327;
        b=Jmp3GIk4E3Pw25DlYh5A70Lx6Z5oTnPuushKjOgWM+o7Ib5v+34S0YlEZRVHCqMGOL
         JeVCLpKgAw72KXfHbg/G4JEgFaV99ij+J57JyXlrl8M8ZB6O+90WA4ly9EMOgyjSDsBP
         CrcFbh7ahWoem21X6XEO6JAtvotMcfW1+yvteaFUupgO1Vi/Rj/KIlq4M7YH/X5AN2sF
         hi7HiuQeWpAQ24ZQddxSySHfUncpaDZpKU76Rnft7ivpXSN1yE47Grb30x8GkKa2Ocjl
         /McUmDVE0sV0HtvIGiT4/tXD4UI6db/EzuQ81zfqCN6bkucBHxzmoBUa4XsrIpkKxi+Z
         rYQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x1/cuWPUTv0vs8CRRmZ6/x/mFtko9mxhwsi/tFyavW0=;
        fh=HWreJuamP8SwZRMAS8oxZVVfBCRI31ifCjedr8vfVNU=;
        b=cq31Kl5L+JpkAm0+l/WLahB9dwiWv5GFu/NC5bJGjM/BowGYK3fdry6A/RwFx6fbSg
         vhbDOSo07NjGoP5zQtP0S0Hi1hT8e8NELCNXwShdGh3OxctL/e8XNtEKZXfEFnZS52M0
         aSvUEyyYUCCl01reTD3K3nFvdiAt0Xl8fSK+9+YJpdeWf1hErdDzWKav6SZA7TQuXNZx
         ianHpAxRaUjapIh7VJVzoosxyyG/Mtd2WoGNBdqZI/hbZ/GtrSKeGxSKsdxVcHZQ1BW5
         LLC8vs2iDcGGbWYm3ZoDLl+gQOlYsQCxI535nYN2vrl9C6FHqfntdlG0apeERQlI0LVB
         /cRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793967169; x=1794571969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x1/cuWPUTv0vs8CRRmZ6/x/mFtko9mxhwsi/tFyavW0=;
        b=xDYrVneHd9NtSZJg0aPJWE2CrXqH1XhMoEBmuZu1Aq20xV6zyQmbDXClWwhR5sMHH1
         RifzHNcrt9zUYGkUN0udrQlRIcs28wCcQZt8AY3ZsXmNAG0m1KfOViGsnbgKseghiwis
         OEoziMx0kBGsIQWK/5GDVyMw6GnwIKEBEQhZ0m4L5moDCZUpWRoHJNOg+xxtJEDD2VB3
         UK1PBd+qffmb0RXq92LwXbuXDPw8lios74hyBidrpWWaeOsqVwEIpaCKo2sLUtO5OQxo
         1zL0DGnTQcMTY6sYyHvCqLGEe0kev4324IiqG1ZzM7ttp2pJK1cr86cPsszoMSCf4Z75
         cG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793967169; x=1794571969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1/cuWPUTv0vs8CRRmZ6/x/mFtko9mxhwsi/tFyavW0=;
        b=N3ASGonmplQ42exZlvADLMZ8Z4Zs03Q4bc1jXcDOZQNGYZks9TVFPjDQ7GHmUmHrGi
         aTdG2MftI2TRnHwPdKIdTjcTGWRXcRon4LQIwrpiL3bZW9LtMkBKJWKT4ySmoZfUvN7H
         oI2OhuRdSEgon1CaA4H5lCEIozn7nvXCjDN//AlrcOTJ27PyP4ilhnT/2WVUEcMxkyhp
         p1Bk8XNi0cIluAnwAgdxdlQgwlEmRAd7Cf6szu0KVMSaUChCRnDwG3r7bqbIWnQvStik
         UfXiIXGecDvTj8hdeaPaH6iY3+2MpsOFA2r+So17rMysVDiEt1PW84mzM8L3H00HM6hY
         5QAw==
X-Forwarded-Encrypted: i=1; AKwUvByIluHupjJ0/Svta7bBQHJLptCQM5NKGYeLDw8bfcPFlJoJAczCrg0UYyfeBCKHFcMR6VQOC5Huw3lMBQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z94TjRXKZen79fd7MlhgekTza9JhqSDT3DtDBft1iWqwuXHhsXC
	MVnErOkRf9SS6Xsvx1nT7Qs4T4tHI9D+51R+l0Js7Hzlu5sa2MpeTxSdr43xUj2KZkMX6zCOvxG
	7GYK8yeo0xXj8wn9k/HtfjAbHN39Ap6s=
X-Gm-Gg: AYBFou1XqExk5ceN2JfYxBKeC9zXMr4vtlJs/Rupn5JIfsdaqea39+j/vLSBjyrKQzS
	ZR3yTEysJm05QAjsRB4CIjJkuVJSqu/kYSuHT3P9RJ45AhJwSpQuGHbiPpgJk5Rya5Ywum3mWo8
	9k8TSbNMkjwt6g38ZR3YKSMomA4kDvOdvWcCQv5zkW0oeLDebqP+N9vTrdbfqe6BMlIZf3DEc+0
	Et9svjwnjbBP/QrdR8TwrjNqdkY9mey4xC+Hvf0BQGVYsKs5rPvWsSXc9ZpnkTb7dml5Nax205N
	V7oh5kOR7UJIqc29r20B4spd4fCm4bUAaScmOedlDQfLDnIRbvdn0kuXt0rWD8IQz7zuFW+95t1
	K6o/u1wb2jLip/e89j2m7pujXzYjUYTKv4Rstnj4c5a34awbq2m4yi0l7DdGBduJyUAHhrfXNrf
	EbHREI/imzXaUvGEDMUfQxdA==
X-Received: by 2002:a05:6402:2708:b0:6b5:96e9:ae95 with SMTP id
 4fb4d7f45d1cf-6b5977c05b4mr1611439a12.10.1793967168580; Fri, 06 Nov 2026
 04:12:48 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-alpha-force-success-fix-v1-1-8c26d60c5fff@gmail.com>
In-Reply-To: <20261105-alpha-force-success-fix-v1-1-8c26d60c5fff@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 6 Nov 2026 13:12:36 +0100
X-Gm-Features: AclHuK-imma2RB3IIgOI8b1RYP__FJLRZ_l9IgLeNTSprdfcIZVW6dvD-NI_UWw
Message-ID: <CA+=Fv5RXzRvCwmzJ8FY8=fxmHCF1X6XAj=LtfbVD5gVJJxi1mQ@mail.gmail.com>
Subject: Re: [PATCH 7.1.y 7.2.y 7.3.y] alpha: honor force_successful_syscall_return()
 again
To: Matt Turner <mattst88@gmail.com>
Cc: stable@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Fri, Nov 6, 2026 at 12:39=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> This fix is for 7.1.y, 7.2.y and 7.3.y only.  Mainline is not affected
> since commit 83bd31c2840b ("alpha: enable GENERIC_ENTRY") in v7.4-rc1,
> which replaced the saved-r0 check with a flag in thread_info.  That
> conversion is far too large for stable, so this patch fixes the old
> entry code instead.
>
> Syscalls that return data rather than a status, such as PTRACE_PEEKUSR,
> PTRACE_PEEKTEXT/PEEKDATA, osf_sigprocmask and shmat, call
> force_successful_syscall_return() so that a result with the top bit set
> is not mistaken for an error.  On alpha that clears the saved r0, and
> $syscall_error and $strace_error used to check for this and take the
> success path.
>
> Commit 55b22075f784 ("alpha: add support for SECCOMP and
> SECCOMP_FILTER") moved the restart syscall number to r2 and dropped both
> checks, so any negative result now comes back to userspace as an
> error with a3 set.  PTRACE_PEEKUSR of a register holding -1 fails with
> EPERM, which makes sandbox abort when it traces static binaries during
> Gentoo package builds, and PTRACE_PEEKUSR of a register holding
> 0xffffffffffffe000 fails with errno 8192, which breaks unwinding of a
> ptrace-stopped thread in elfutils (run-backtrace-native.sh).
>
> Restore the checks on both exit paths.  On the traced path the success
> path also has to stop falling through into
> SYSCALL_SKIP_RETURN_RESTART_GATE, which is meant for skipped syscalls
> and would turn a forced-success result of -1 into ENOSYS.
>
> Link: https://bugs.gentoo.org/985765
> Fixes: 55b22075f784 ("alpha: add support for SECCOMP and SECCOMP_FILTER")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
> This is a stable-only fix for 7.1.y, 7.2.y and 7.3.y; it applies to all
> three (with a 16-line offset on 7.1.y and 7.2.y).  Mainline fixed the
> same problem differently by switching alpha to GENERIC_ENTRY in v7.4-rc1,
> which is too large to backport.
> ---
>  arch/alpha/kernel/entry.S | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index 9f2608de2544..fe88cd598492 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -603,6 +603,14 @@ ret_to_kernel:
>
>         .align 3
>  $syscall_error:
> +       /*
> +        * force_successful_syscall_return() zeroes the saved r0 (the
> +        * syscall number): the negative return value is data, not an
> +        * error number.
> +        */
> +       ldq     $18, 0($sp)
> +       beq     $18, $ret_success
> +
>          /* Restart syscall nr comes from saved r2 (preserved even if r0 =
overwritten). */
>         ldq     $18, 16($sp)    /* old syscall nr for restart */
>
> @@ -700,9 +708,11 @@ ret_from_straced:
>  $strace_success:
>         stq     $31, 72($sp)            /* a3=3D0 =3D> no error */
>         stq     $0, 0($sp)              /* save return value */
> +       br      $strace_leave
>
>  $strace_skip_call:
>         SYSCALL_SKIP_RETURN_RESTART_GATE
> +$strace_leave:
>         DO_SWITCH_STACK
>         jsr     $26, syscall_trace_leave
>         UNDO_SWITCH_STACK
> @@ -710,6 +720,10 @@ $strace_skip_call:
>
>         .align  3
>  $strace_error:
> +       /* See $syscall_error. */
> +       ldq     $18, 0($sp)
> +       beq     $18, $strace_success
> +
>         ldq     $18, 16($sp)    /* restart syscall nr */
>         ldq     $19, 72($sp)    /* .. and this a3 */
>
>
> ---
> base-commit: f2c53ea949c5048f96b3dbb5a5ee7131ce4ff2de
> change-id: 20261105-alpha-force-success-fix-6df76c50033a
>
> Best regards,
> --
> Matt Turner <mattst88@gmail.com>
>

Built and boot-tested on v7.1, v7.2 and v7.3 using Alpha QEMU
with stock Clipper PALcode, with one and four CPUs.

All 56 raw r0/a3 checks passed with the patch, covering traced
and untraced ptrace PEEK returns, including -1 and -8192,
other forced-success returns, and normal success/error cases.
Unpatched controls reproduced 32 failures on each release.

Tested-by: Magnus Lindholm <linmag7@gmail.com>

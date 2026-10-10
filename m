Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B979B391E54
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 16:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791649472; cv=pass; b=cULusW0MwBtGSpTOjiAYi4ghdLvkgjJ6l9A/3uKuUK8mP8qTb6Ub0MO9eH1mCTLEJJkS3F1e+e1uVv32/RZgQ4GHCw332Mn9NhHkkQlZJhdcM4cxPu9Z9wTD54kj9VTaamuKeE6bJlYh4m52oQ3WX67xV8q8rkPgvIPkE9ieyOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791649472; c=relaxed/simple;
	bh=twLfEwV6ObJQ/5FqVixRMsFK7uHd6mkaxdtnB+fAdKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YO43X0e9x/Hf6lnBczmzYuMgaNCzz+yWogsjxBALTLiK0wgC95Xx4Nb9y4RfJy9G2LRGLZdty2LruzJUvXfw2NLRVd7hJr/kX13zFAc6+EDgsUoWv2laTdRWZ/amrMNHjNg7fy0QWpdNlild5eBVb299yWH5VbNiG9R9J8XcNF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/EdPuDp; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/EdPuDp"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2dc8cb0decso79980166b.2
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 09:24:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791649469; cv=none;
        d=google.com; s=arc-20260327;
        b=gcZ45ef61VxTDAK3Ci0S1NS0wOByi4Ytl4Peeyvsf6tQuPe3D21/ksiGAH9zpsqj8g
         MtI5+Q1wzQZxigPL9pBKh9Awozng7xBSHTBWov5SOE58MjsBitxqNqiE7KqOS+ujzAGG
         lCz/6LY2IN8CspvfXepTxlpMIhHiK4tODedgv2GgQJ9BishS9N68P2c9+uUy+eKVXyTd
         kxPg/EGrbhFj5SvY7bK8dE+WGHN5mgPNqNmKHqADned0jo7BI1ZHqjHXXlwJ+vQJpplN
         AycFElenTVPMxw4vN62qX8N248QjvPgBF511m6BFSCfyGiQJE34clZWIo3/yPGIRdk6G
         OPww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OaXanGBebs9+G2VzyCDD+GE40p6rSCcLN7l/Dz8kZY8=;
        fh=TD+QtpNqVlROO/jWVSkVtS9s8Samh3SJHn7BBvM9sMI=;
        b=YxyYZZrv66rIObyATzb3Yfm7QYjdeN4FmOeBG1Xk2PFIY+ffKdKPLRxoDv7rSX1Sju
         zF4y67EUTWsXtTRDsyzw3BVUXfQhFItFbtfKfeGDaPRT5HfXGbJyymPLHU60Mx+wjlMz
         DDKDcj6rKgPJ7f1fRYBL2jd+37vHpKPSgDM4DEFokBbmMV8lyM95+1J9KuwI4hH1qAWU
         I+yl3XEPgmiZ82Hk+B0nTWupQby5J2tCs0SJyLXMb0Ho/9YN5HnX4bu0VYr51SKFN7/z
         S5B2avtF1pMh95PAHei/zEHkC/6kRTMyk5jxhSxHDas+tnaDGt+GgPCGLnTugnEOi+Yl
         5sKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791649469; x=1792254269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OaXanGBebs9+G2VzyCDD+GE40p6rSCcLN7l/Dz8kZY8=;
        b=Q/EdPuDpsppIZsS08ciipGnVpR2ZcZK8ayh+kEPs5guBp8vGh7jdTZN240hhShAQvc
         jFEEt7sL/ZbqqSt+w2HKzYXyFVtm2Y9DrZsqXXLSWcFtNT0vBkdXRPzw0XVzhNrYECAJ
         z3Ua0KIwYEClYNnF01ejR++0ldf8x2EvzLW4lYa1IfgY6W2tlNHhe44M4xJqLV3Z2bVC
         PDerhAW/YMgZIwRrh62cBTxyjIivFBfU9iraiWifDXa85ty3YAst9GeFkxOzGGAgz1Nn
         mID0fQKo2SL1EH6XaRzpjVuMYgT2neB2V+j83voB8fFtDVOKx2GWG+I3Oz/PenEkA2L6
         DFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791649469; x=1792254269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OaXanGBebs9+G2VzyCDD+GE40p6rSCcLN7l/Dz8kZY8=;
        b=DyZw1cRgS3fumLI6yisKs2B9E8dpDOF8M+K1zlRz6EjDlWgViCE9ok/um6MlBu0MOJ
         cN6YGb04JMwMchBA9PnOI4s/GMdNykI076epZhXWBcTvHNiTt/U+a8aASRKChJ+n8+cG
         r2hZTd63eL1gV0TdhQtqs+jAsGvnbPyMCSNUfYYa0a9IVp2NDPIW+Bp3RYn7tyctJA53
         OgvgE+Pp7txbr8ELwj1B/snT4DI8jqJJ4WPgjjeyJ4MATJYkxyXbAIBtCHSXZw2tXSAP
         QSAmLNw5nCWewkwCrwQ80Xn5tFxIAuOlV+iGAE0u8sJHeAV3FxvJ1+IbDM+7PDtvgjYW
         EnKA==
X-Forwarded-Encrypted: i=1; AKwUvBxRlPcGqYnpMxNLO7vCo0heP3SLehl9l4LqJxBYzE5JWqhlTdgVnggOhLaUWKpvn5UxuYMTvERHJVCUoQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKz5tc5b0A1s2NR3G7LlW/Gx2QyeEEaH5pqeVxjOmADq7bqViZy
	CKzjM7cdsg/0tJ2g1jVP7Py8pR0P3Ycg8ld9w6OJNqNI3Go0mCWcPUsEy3h+m4EZVZjBdg8ee7C
	xAGU9QPYd0PMoWSV7xLCfxBjRB/cGoTK4g4s+hyQ=
X-Gm-Gg: AYBFou3mlrvQrliHzD0eCJnT+3g8C6BQ3KdK4v6mYsbM/hANWA7y+tL/08g3yk2XsjO
	6VDkrPUHDdvuuMdIt2PRdwUeVm4om1Xe79Rfq05V64626pitzH5TWVwyIUwdwxKU4SHInyd2wby
	oX5VvjmJ7top+QacZFVf9xUybaSI+uHFSnhOSoPfD1IZ1Hdf5Z1h4HP4dwFeNx1/AyaHyS3pudF
	dzUO0TE9tJ2tue0cXiveARKEY1muVZywjSvZM41T817hvTvlkFU7+kFru7Oni6JvUFM7pDAe1sI
	QtIRdOQbJ0oV02OxrVVQo2SWG5jQm74ZjcxvgOZG8cHsrdjxh+ubO7V4Cruh3N0BmW4Ekp4zdF+
	0CKBixsZep49X5zPZlWQL2Np5WlRXCRGPEEbiTwFIugI=
X-Received: by 2002:a17:907:97c2:b0:c27:420b:7c79 with SMTP id
 a640c23a62f3a-c31aa0e3cd3mr536202066b.48.1791649468591; Sat, 10 Oct 2026
 09:24:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010134214.974565-1-linmag7@gmail.com>
In-Reply-To: <20261010134214.974565-1-linmag7@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 10 Oct 2026 18:24:16 +0200
X-Gm-Features: AclHuK8E16LmFWC8Rwocxl7k5fzsA-InTEpONC_qPKrw8IjRgNUYjmtwqIv4ayQ
Message-ID: <CA+=Fv5R0fiZuzDLPOZcZt6p1CtSnATELgvns_nKA1qwemKHvWA@mail.gmail.com>
Subject: Re: [PATCH v3] selftests/seccomp: add Alpha support to seccomp_bpf
To: richard.henderson@linaro.org, mattst88@gmail.com, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	Kees Cook <kees@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, wad@chromium.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sat, Oct 10, 2026 at 3:42=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
>
> Enable the seccomp BPF selftests on Alpha with a fallback seccomp syscall
> number and architecture-specific syscall register accessors.
>
> Use the NT_PRSTATUS register layout rather than struct pt_regs. The
> register set contains r0-r30 followed by pc and unique. Read and update
> the syscall number in r1, and set both r0 and the r19/a3 error flag when
> synthesizing syscall results.
>
> At syscall entry, r19 still contains the fourth syscall argument, so
> callers setting a synthetic return value must also set the syscall
> number to -1 to skip execution.
>
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> Reviewed-by: Matt Turner <mattst88@gmail.com>
> ---
> Changes in v3:
> - Drop the /proc/self/syscall availability check and its commit-message
>   paragraph. Alpha selects HAVE_ARCH_TRACEHOOK.
> - Document that setting r19/a3 at syscall entry requires callers to also
>   set the syscall number to -1.
> - Add Matt Turner's Reviewed-by after addressing his review comments.
>
> Changes in v2:
> - Use the NT_PRSTATUS layout for PTRACE_GETREGSET/PTRACE_SETREGSET.
> - Set the Alpha return value and error flag together.
> - Check for /proc/self/syscall at runtime (removed in v3).
>
> Validation on AlphaServer ES40, GCC 15.2.1, running
> 7.3.0-rc1-es40-tsunami-v5a+:
> - Standard v3 and the original baseline binary both report 98 pass,
>   1 fail, 12 skip. The common failure is the 30-second timeout in
>   user_notification_wait_killable_after_reply.
> - A separate diagnostic build extending only that test's timeout to
>   180 seconds completes it in 34.938 seconds. The full diagnostic run
>   reports 99 pass, 0 fail, 12 skip. No timeout change is in this patch.
>
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testin=
g/selftests/seccomp/seccomp_bpf.c
> index 0622bc2..79e8eb3 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -136,6 +136,8 @@ struct seccomp_data {
>  #  define __NR_seccomp 354
>  # elif defined(__x86_64__)
>  #  define __NR_seccomp 317
> +# elif defined(__alpha__)
> +#  define __NR_seccomp 514
>  # elif defined(__arm__)
>  #  define __NR_seccomp 383
>  # elif defined(__aarch64__)
> @@ -1754,6 +1756,30 @@ TEST_F(TRACE_poke, getpid_runs_normally)
>  # define ARCH_REGS             struct user_regs_struct
>  # define SYSCALL_NUM(_regs)    (_regs).orig_eax
>  # define SYSCALL_RET(_regs)    (_regs).eax
> +#elif defined(__alpha__)
> +/* NT_PRSTATUS contains r0-r30, pc and unique, not struct pt_regs. */
> +struct alpha_regs {
> +       unsigned long regs[33];
> +};
> +
> +# define ARCH_REGS             struct alpha_regs
> +/* The kernel keeps the mutable syscall number in r1. */
> +# define SYSCALL_NUM(_regs)    ((_regs).regs[1])
> +# define SYSCALL_RET(_regs)    ((_regs).regs[0])
> +/*
> + * Alpha returns positive errno in r0 with the r19/a3 error flag set.
> + * At a syscall-entry stop, r19 is still the fourth syscall argument.
> + * Callers must also set the syscall number to -1 to skip the syscall
> + * before replacing r19 with the error flag.
> + */
> +# define SYSCALL_RET_SET(_regs, _val)                          \
> +       do {                                                    \
> +               struct alpha_regs *__regs =3D &(_regs);           \
> +               long __ret =3D (_val);                            \
> +                                                               \
> +               __regs->regs[0] =3D __ret < 0 ? -__ret : __ret;   \
> +               __regs->regs[19] =3D __ret < 0;                   \
> +       } while (0)
>  #elif defined(__arm__)
>  # define ARCH_REGS             struct pt_regs
>  # define SYSCALL_NUM(_regs)    (_regs).ARM_r7
> --
> 2.43.0
>

Kees,
Would you be OK with me taking this patch through my Alpha tree?
The Alpha kernel support is already upstream.

v3 carries Matt's Reviewed-by. On my ES40, it matches the baseline:
98 passes, 12 skips and one timeout. Extending that timeout gives
99 passes and 12 skips; that adjustment is not part of the patch.

Link:
https://lore.kernel.org/linux-alpha/20261010134214.974565-1-linmag7@gmail.c=
om/

Thanks,
Magnus

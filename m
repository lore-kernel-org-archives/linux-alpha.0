Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AE24E431C
	for <linux-alpha@vger.kernel.org>; Fri, 18 Sep 2026 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731394; cv=pass; b=kNZxeBv00gklu3xdyWOZpkOPOJtCtbJvzMj/sVTi3fjFZpxDQ8s9/jMmzZbAHaDgX/EkeUlC5V75YdZTWTzP/VXlaPvkjoNC8hHcW8OPQhR0Mm1feOH9Gl3ftSeFsCRaBIVZENPhXDx4i0fDAUk31A8tpJ+/SGXebfd+c1fl4kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731394; c=relaxed/simple;
	bh=SM+WZSPeuzqNNHXbABDFo7m2xf8ZGs0pqFt1fmpcd8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FmHy6YvV4G7J06ZvZosi3XeQxpCgQTI7GRBqfwHTIpSO6uyl23n9Z+g4TcbqyK5o1HtufQFbGzBIw4hi/mjRealRVlh9cI1h6THQ88G+TfSPY6MpUwe1G8NB2D8n1DgBJoA1jIrHzgHSOZVnGDW/JJDHzwlVv+0HFZYajDccufI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bB0WVjKQ; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bB0WVjKQ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d33431c8so78097766b.2
        for <linux-alpha@vger.kernel.org>; Fri, 18 Sep 2026 04:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789731389; cv=none;
        d=google.com; s=arc-20260327;
        b=o9Mb4Tj2k4bjjcGasyDusp3M1bjKpq/3BFs/GlF/vLqaNA8KAR3g2Dhyj30FtgGBtQ
         2q3/bF5yibfC9rOv6VBPxTtg6oRO1arHR7CFEuEmfzKsSJB4Uygeoi1ecEt2ZL5BH2ab
         va3Mb5hugJ8oDGe7De9WsaJxKPW+gWfO17WEUHpteC5PC8xQ6b2/z9Xz978n4leFXTXD
         1XZAdFyXnMJIudwOhEeStaXaTfrJffBjg/7uBtqc4qdG60r8XuZbLsqbbayE6kQMx2e8
         m42KAZJ+ei+6W4fTaWoMIudq6JljSOTyOsr1W+32Do26VqauZpkZ1GnmhsFoxZA/8jyS
         HXFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=;
        fh=1G/GpCuWAUekCJmMOUo5AGffYVTX8AASdp7LpyPhD3Q=;
        b=cVaI9zQ/CoyKGmYu+OMHiPKxAQds7BAglKoFh79JxuXIS3QNdlIGvC9ytdeimZyzjp
         6ThF1OuiHDkwWgrL3K+/KwZ5a/wiHYVWXvYJu1YlBfRRPiSItL6lfu7r+lcqmRHox9hv
         WE5BAzbG1pVx+I3279g7CMiaK7gR8NaQLb/jciUvT76BJxYkmRkDTH7ldcMzeIVjl2Wn
         07H2rj5J1ySXofV5sGyxoD6T/35gyIjXEAQ6/hDC23UVKntt6WRS9kD6MyScvFzDD4yP
         I4YeCv81LUIMoJsl2CUisCzn1itwvJHFRKnirorHUoFQL6hCAJOCX4dpF05ojyVPZOfK
         pavQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731389; x=1790336189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=;
        b=bB0WVjKQFWGFLevQSZ6+wAuVr10y9ueGPJi48P/WjBtC8HiA56X/7cJR6K9vGM0O1b
         LOn9zSnVnB030apqwbpqkCcB8mZ9LvTeNyV8wzjrAVeJPSwPqR0YbfMFFX7oInCp+PO6
         AUrKAP72yTipK6iFJN6rwwDKibX21Hd5VtDQi6St4RCUM1ANGs5FdA15ckkqr0pWqS1M
         dmYrup7gqfRT9F5Zzs0SSzWEO/OrwvnvxLERcm1vKAiyBn3OnaeDPBAat3WD9kx440C8
         44rBdCLqBzQhueA3Sxz9dP/Ix0BSHZ78Qw6u1mlZL+iOzeg6cyHhJb2ZDhy8cpR45RAX
         2B/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731389; x=1790336189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=;
        b=Nt3P/bDRTq937p+MqkQqp5clmUf0Vhmo2EJxtLahBkKkmBc4HaiOCT9KnekmUpKPyN
         Lq3uBgF4j/ZADCcKyIYp0lD0lyRQhCZ9MGcZc1c++22vhTEIUdIfK+JDW41CULQeKDGG
         Se0joIab96DzyTu0FWj1Nt/8U4Jkk/Z3e2+dDKJhRq6S1l+IrUFBdaLm/o19VDKHdm3n
         F04w+dFI7zvTwZUifczyukVlZvo5iScLXg3lOouSuB8YzHR4KZTg8MRav6OQY/aU6fPR
         TfLY7jrdVy/3t3ASlVeAszPPV6d/Im+h3J0X0O693+vVMM9zdzIG0JuHDfyrkUBpQ6xc
         AhiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaj/OOUi3Qw0hVKOQ2xloa9PJgr4oLxR+XiA0bcNco1q444ODnS37X3IyQzyOkJk74Ba4XADkS5efAAg==@vger.kernel.org
X-Gm-Message-State: AFuF++lpdVDtHzule+De4GOLqeanlwvSJ3CaPnPTLOlBvlFad5p85k+D
	mbUtqeylvpTjte3mI15BHqY/L1QF4rW7hMD1Ytx4LhIn1//zIBddC8pixOb/QlZCa5RDR2wK9xU
	7Otn/OUvwsC8aAhw34K8jUuz80nbz3LU=
X-Gm-Gg: AYBFou1lM3ber//7PQmA4y2dHtGYwr2kNyLfcE5gqCobZJFxrDPBigzKPKb/+vrFqV/
	Ynyc+9qHrG+UAguVXunxIXid4wjLMkbU6L9ZrpzVXh4Wg0JPJDz99Ig+jJ6tKmJggknrDoXXYy3
	ruXYTbrI6SAxPbl+H2GGh+7pHeAFRGzIAkfmMDuA3r97YGGl3as+DzoYFxJnK/Bpy0s6hOikYcQ
	1LOIMzOIObaa1cpTsTj+gowem8CT58kmeP2FsIEDhTC11Z7Fzci/F8RW20AbEig20ZM7MERE7Dx
	xUmvuExt7B6cVPBeIhxDg4xvg+6hNk0TOdV2Rg6BoKze5bo3FMzdCTeV2FkR4Iej7JLQ6Vuq7/q
	WWLm8N3RMpHcS2dOle7lapPdZL9hpLo7ExXR7TctWxA==
X-Received: by 2002:a17:907:948f:b0:c29:5d41:dfe8 with SMTP id
 a640c23a62f3a-c2a1582698fmr217595066b.43.1789731389390; Fri, 18 Sep 2026
 04:36:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com> <20260917-tonyk-syscall_table-v7-11-f4cd8f8e3265@igalia.com>
In-Reply-To: <20260917-tonyk-syscall_table-v7-11-f4cd8f8e3265@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 18 Sep 2026 13:36:17 +0200
X-Gm-Features: AcwNN1W0uIsrBudlRZeSpl5_CSJhjtWRK4S-OK-90sOk1QFHdqx3jezfZnvgjR0
Message-ID: <CA+=Fv5To=fUfD+9OtAcNJcaquBy+xv6oNUFES6sVwpOKzH8qgw@mail.gmail.com>
Subject: Re: [PATCH v7 11/13] alpha: Define entry point for
 set_mempolicy_home_node syscall
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Fri, Sep 18, 2026 at 1:47=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:
>
> Instead of explicitly defining set_mempolicy_home_node as sys_ni_sycall i=
n
> the syscall table, define it as the real syscall entry point,
> sys_set_mempolicy_home_node. As per commit fdb7d9b7acd0 ("alpha: remove
> DISCONTIGMEM and NUMA"), alpha doesn't have NUMA support, so none of the
> mempolicy sycalls will ever be compiled for alpha, resulting in the
> COND_SYSCALL() fallback being used to result in the sys_ni_syscall.
>
> There's no function change here, but this step helps to unify the syscall
> tables and create a common table to rule them all.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 52e3538cc7df..8fc4701a6328 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -489,7 +489,7 @@
>  # 557 reserved for memfd_secret
>  558    common  process_mrelease                sys_process_mrelease
>  559    common  futex_waitv                     sys_futex_waitv
> -560    common  set_mempolicy_home_node         sys_ni_syscall
> +560    common  set_mempolicy_home_node         sys_set_mempolicy_home_no=
de
>  561    common  cachestat                       sys_cachestat
>  562    common  fchmodat2                       sys_fchmodat2
>  563    common  map_shadow_stack                sys_map_shadow_stack
>
> --
> 2.55.0
>
>

Looks good to me.

Acked-by: Magnus Lindholm <linmag7@gmail.com>

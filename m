Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793693375;
	b=s4bi4T8eZr1OCkx8dnX5/2nVf9f7DQkxj9h139+oN6xpCrY202BJj/JFWNA3Rr1IXUL+
	 aF2PHHFqooC4AdP2TMeGqzYEvmWXHlWBGy9SguoHDIANh5XtRXcOYXREw/EV/MOKsQyJN
	 qKBTSA6WHusvIkoJTQx8Fl3iAeShyhcGi64i9F+UtkzncVd3TJOzdfyPFGQw2l/cQcspb
	 yWbznuDyKViixRtN5qdaKZOJEO2AdSu0mmJA+FdPiaVs9REuFXH6ozuZ/3/G1HvJcvq0f
	 Imp8X9WrRf6JDAmOpXeUzQZz4GzIgAAfaDvQypjYk6vTkGkQtD0/oiLrfjTCsnRkNLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uco2Ur8UEZmqW/9CJQ0xjIkmj7Rk/+V8qinnt88vYRo=;
	b=vh/lH5rzF075gt0UGR2ZXyHqUVL/8JI5PZmgjw5rBKxx3YfLAWGot9rW/dYutp4Zvmtu
	 IHvvHhifvfxs4NWmOqAD14cTj1mgIis3NpxK9qGKu0Kd4z/9sYa78s/6ImZxgr+GacZVS
	 SeeMSP/Ed50ckO9dcvoCPOYBtMVkkAIygmln/nEH51BRMgeNtHoYN5H1/EStLA/dlUPPu
	 C0wqutagejIhPuDT5ejPyFndFVYYzqj74X/XYiicxCdl4yHE69KzfeR9YhihBUa8oUnRx
	 re2yr4jsggn7VjpW/ijBCA4q3zGnsILNO0tWxkcq9ZdUeOrHY9ohegxEx+k+FtMdLmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zu1BS2I0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8579606A330
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 08:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8579606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zu1BS2I0
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-677d35fd1d2so3635350d50.1
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 00:09:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793693374; cv=none;
        d=google.com; s=arc-20260327;
        b=NaULNs7tqIyr1I9zq50H2b8qDeEM8/rLCtKA+fYyYDNJq5idSon0Pbeo9p3FzQXmhP
         o+i6GJT4zaqjD5FIK0bk5hKuL1KtjpOQPRK6zpnzTrqFV1/k4laAsbPc7g2DFJsySiUg
         76FH76GrVPQb3PK2jEI0e+eHDwfCc/z2r5CVs/F+FCq5HqQPcrYCq/IiLJbeuSl/zkhc
         0168/jOvPdPnGWo/n/wwZhgcT0nH64WzGwGkAwGaYOabYK06IZRyJ962kRjY82OyXI4G
         eB8lqwZUquTN4IvxwHkwYARqr16isjRdzNh4d6cx7U7xAdYWfs/1qZjtfnN3bNWp0Z8r
         XXsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uco2Ur8UEZmqW/9CJQ0xjIkmj7Rk/+V8qinnt88vYRo=;
        fh=ZRWVucDuyxWYFKwsOSdQpszVRd2KaKV9lNcRT7eO4Rc=;
        b=o+J8u4agRgdsDKqk9ow+pjAhoCOB94SKz0WiOttGNEULUe67hgOo5z1OuSnbFuGUYx
         XJ8Sg4BSnq3YIbxT/h4dA9bOILt52I8n9RMyTR4OSHF9likdh4oOO6dgGUI2xxMX9SSQ
         jKvnArdkzErIoW8XVJjT4xCBJgMha7wx1uWVNDJzVCFzcAWMZbmY4lEuJIKN0cS8n3aT
         n45NyYGK8a6i8uRXwnJuaSIQrxyz2D6V+la37A/vyHkgrv4rELfYwRNaQ7X8Klw5lHin
         Sl7E57qxr+GRSzvKMXAItxPfMEDdOPU9rgNYnuk61zijDzH6N0rb+cOf2dTb2hjxeomI
         Iqbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693374; x=1794298174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uco2Ur8UEZmqW/9CJQ0xjIkmj7Rk/+V8qinnt88vYRo=;
        b=Zu1BS2I0O/mUVyGvLylpEzEwz28R1CQXBRIdrANS8QvtA6Rn7J7nEHNPvnC2J2RY0R
         I02SgfZ4WrQb3X49+emq+cduy0AdAGJVkwkLVb4f9oN7frUz2LSIUnAcJubETdnuSjZZ
         Olw7Ia2XESWh0gSfQsFoK1wUGzDmK/7GJDTqABfaPJ8101I4iZzmT0RRXbq4weAWA6yV
         hST4SPeJIE1qzEOW/dUFm60DLffiBjS+UMIj8dp6vTsXhYr4IWCVOuobHx53ZS2stb8V
         H18FS6awNF0PmDtFaj7DyHHX4ZQPMMIFzQqBs7vdgDrmUHJPWquvH78GwlvKWBOAxklJ
         C8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693374; x=1794298174;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uco2Ur8UEZmqW/9CJQ0xjIkmj7Rk/+V8qinnt88vYRo=;
        b=GbyhSbC5m2TudJ75wnzctZ/cINs7jSyJrf7cx5BrPMljsUXX+LaZlYYsNQ5jDNltWn
         fZKcrO85AvJ6CiC9FdUf1ZNUsfMllwwuCb9sLJa4dLf7sysRn8FSCGnHfP9qIQi6uYIZ
         YcuaMRTLJ/mZkIvS68ul1X5oR9zrkgGDXPWZs46NetVCHMna5AFnagLd/Z0bqPBwTh/S
         rvkPX1j05YSGbQNRnuqtQzN666EjkV1vcUVQ5x7CclD2VP+eKgnQ20SvwVRMLPOWXWFU
         qWy91DtlmBVKFKtrBGA8YUq1p7ucssaOuSL6d5axqY+Senhd0oboYc1dAzWOFZSwxkrP
         GW9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwcC4ttb+8Hj6CnIqWXZBhnrIychUGWrTNKGlBaWfxOYCyuBmHl53nzcvjjUIuO26g64bZpqPfbGXqKoQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9HXQJvFelpNNbMeoAgUOb3d/E/MdX3aadrVPEv8c9cou4xyELh
	nsH4pqjmZFKjWGPTZbnA7nB5Ab+p6r/3P7gaqmrbCKvFc/bIagLcTW/nteO5vm7N7f1tPJtczVs
	HHPikzNh8nbTdBLUdmddz4BpnbAAmzHs=
X-Gm-Gg: AYBFou3v4PcgHda7HilLbgp5PcRKpruhEgA+MUVG7iqVw9yDd+XwLVWcFPgiICycnj2
	zbAxsc4hZpjYgOiksJF8ziSklwTMKscnMJdXe4GfVji1Xot9qigwyFgc02dZt7K4qOoQnSVIut1
	zmebRDJLG4uWZv1ybfTfjq7bxRyQEBlS8LhUyKy6QlZKdU9NMZHO9cDgOWV1Kp0h+KunhgN9yVt
	0i0+QLnQquvdO1s/vwyrdHimahoLoj/AWKBoD2ERjuEs6pG9s2YVofT4oZ6GhryFhMsEbpf6onA
	an8oq8ng0yU6Cynxg/hKkU3x3kckEx5fEiv0j6bAzgFxtn68XNYunHFtgr1/WocOsWSBPPntiWj
	xkuCijMLQRrKP5McmZFaeomrIpQClGa6hMrFzeFMMqPRaOz/spNcTqCOR6obkeV2asRQNEw==
X-Received: by 2002:a05:690e:488d:20b0:679:a42b:f0cb with SMTP id
 956f58d0204a3-67ba4fa410bmr4995779d50.17.1793693373507; Tue, 03 Nov 2026
 00:09:33 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com> <20261102-alpha-profileme-v4-4-61e00f5e1da8@gmail.com>
In-Reply-To: <20261102-alpha-profileme-v4-4-61e00f5e1da8@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 3 Nov 2026 09:09:20 +0100
X-Gm-Features: AclHuK8ply3pJX1L9_Bu09MY9iz-O5YDE5hMEC7B4ENAaYi_sdcMs5-aNdaWce8
Message-ID: <CA+=Fv5RErSDNsb-qc_P+jBxBJYSPv5qkJhN-dLj7EankCsYOSw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] alpha/perf: do not report user registers from the
 entry code
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Nov 3, 2026 at 4:02=E2=80=AFAM Matt Turner <mattst88@gmail.com> wro=
te:
>
> perf_get_regs_user() returns task_pt_regs() whenever a sample of a user
> task lands in the kernel. But exception entry runs with interrupts
> enabled, so the sample can land before the entry code has saved the user
> registers. Only the part PALcode pushed is valid then. An interrupt
> taken on the first instruction of entUna, say, pushes its own frame on
> top of PALcode's, which overlaps the rest of the user frame, so r7 and r8
> read as the interrupt's r23 and r24.
>
> Report no user registers while the interrupted PC is in the entry code.
> Such a sample also gets no user stack dump. The range is all of the entry
> code from entInt to the end of the save in entSys, so it also drops the
> registers of samples that land after they were saved there.
>
> An interrupt that nests on one taken in the entry code still reads the
> incomplete frame, as its own PC has left the entry code.
>
> Fixes: 9280e99d87dd ("alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_=
DUMP support")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/ptrace.h | 12 ++++++++++++
>  arch/alpha/kernel/entry.S       |  9 +++++++++
>  arch/alpha/kernel/perf_regs.c   | 13 +++++++++++++
>  3 files changed, 34 insertions(+)
>
> diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptr=
ace.h
> index 45d1229344b6..1400ba3e7d43 100644
> --- a/arch/alpha/include/asm/ptrace.h
> +++ b/arch/alpha/include/asm/ptrace.h
> @@ -14,6 +14,18 @@
>  #define task_pt_regs(task) \
>    ((struct pt_regs *) (task_stack_page(task) + 2*PAGE_SIZE) - 1)
>
> +/*
> + * Whether pc is in entry code that may not have completed the frame at
> + * task_pt_regs(). See entry.S.
> + */
> +static inline bool in_entry_save_code(unsigned long pc)
> +{
> +       extern char __entry_save_start[], __entry_save_end[];
> +
> +       return pc >=3D (unsigned long)__entry_save_start &&
> +              pc < (unsigned long)__entry_save_end;
> +}
> +
>  #define current_pt_regs() \
>    ((struct pt_regs *) ((char *)current_thread_info() + 2*PAGE_SIZE) - 1)
>
> diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
> index 790389a15c3c..b8d7804e5aa3 100644
> --- a/arch/alpha/kernel/entry.S
> +++ b/arch/alpha/kernel/entry.S
> @@ -186,8 +186,14 @@
>
>  /*
>   * Non-syscall kernel entry points.
> + *
> + * Between __entry_save_start and __entry_save_end the frame at task_pt_=
regs()
> + * may not be complete. perf uses these to avoid reading it.
>   */
>
> +       .globl  __entry_save_start
> +__entry_save_start:
> +
>  CFI_START_OSF_FRAME entInt
>         SAVE_ALL
>         lda     $8, 0x3fff
> @@ -479,9 +485,12 @@ entSys:
>         lda     $8, 0x3fff
>         bic     $sp, $8, $8
>
> +       /* PAL_callsys does not save these, unlike the other entries. */
>         stq     $16, SP_OFF+24($sp)
>         stq     $17, SP_OFF+32($sp)
>         stq     $18, SP_OFF+40($sp)
> +       .globl  __entry_save_end
> +__entry_save_end:
>
>         mov     $0, $1
>         lda     $16, 7
> diff --git a/arch/alpha/kernel/perf_regs.c b/arch/alpha/kernel/perf_regs.=
c
> index 33ea2e831ba0..894683851b30 100644
> --- a/arch/alpha/kernel/perf_regs.c
> +++ b/arch/alpha/kernel/perf_regs.c
> @@ -59,6 +59,19 @@ u64 perf_reg_abi(struct task_struct *task)
>  void perf_get_regs_user(struct perf_regs *regs_user,
>                         struct pt_regs *regs)
>  {
> +       /*
> +        * Exception entry runs with interrupts enabled, so a sample can =
land
> +        * before the entry code has saved the user registers. PALcode ha=
s
> +        * pushed only its part of the frame, and the rest may hold an
> +        * interrupt's frame. An interrupt that nests on top of one taken=
 here
> +        * is not caught, as its PC has left the entry code.
> +        */
> +       if (in_entry_save_code(regs->pc)) {
> +               regs_user->regs =3D NULL;
> +               regs_user->abi =3D PERF_SAMPLE_REGS_ABI_NONE;
> +               return;
> +       }
> +
>         regs_user->regs =3D task_pt_regs(current);
>         regs_user->abi =3D perf_reg_abi(current);
>  }
>
> --
> 2.55.0
>

Tested on my AlphaServer ES40. Across all three CPUs, the syscall
probe sampled the newly protected part of entSys 180 times. Every
sample correctly omitted the user registers and stack. I also saw
this in all 173 hits from separate perf recordings.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

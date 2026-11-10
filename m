Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794276349;
	b=haASysTGz2XHrsrvSa7Mh8UEb75ke9FyPaW0HTV3HXKab7co26O1XM/xfzfU8o840oMk
	 S5QBKt8x2/ksve+MnhY5XnYWYGyXB1Tf6verNC9XHAJAJaDN82J0cA8RyQ0XTEXn6dN09
	 jDpfAcka8vPWG1hqx0IKb3XrSl7dEoHElkYC0rMbNpV3WAeGc+g5IuMGTYpIeFOHecCp5
	 DDoOFiTq6cDu+DxomfGPk86N+5ay9RLMQUFB4y+nzc1GEc7xoyfmIHVoLffgHZo9KvY4u
	 sblKKSJn80behPvnJXsQ2MvPtrU7hqdgL3XlERvVHiYJcM0pvyx3XR3UHQxl8n6Ivdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rvBtJIxhWUVb0UP6eLGnrGtj2/MrbT/J0MltdyjUmf4=;
	b=ju9XhibG8OHeYCt44JzuSTHRuLC8at6EKYNc6Ns9+h2YJyr89UJ4xoI5mpGYgD+le8fj
	 YzPEs8PfZNJfXZ8E2f4isoFfRieAugA9fQEJX7IcBrWmOgvFXpGJCOQVIe1IZSH2KWzMz
	 YgCRQtOfMgruMGKjpfvztTk2mP04nv1rNimJLK7dc6t/hwbgqY+nng2qxokXNnJbjBRoK
	 /+i/r1JxM349PpVutA6Fy72oWpiOLklRX9AGQ23bal31+fn4ts8phD4AIjYqmlwlWyIWV
	 gueB6tiFhdaLFW9BaLeJIzW4utE/TRkLQUYH3GV8CrPO4A2y/69MsKlRql0ps+gzP8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tdDn4sPz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357C2606A31C
	for <linux-alpha@vger.kernel.org>; Tue, 10 Nov 2026 02:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 357C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tdDn4sPz
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae0a5c1715so2018381fa.1
        for <linux-alpha@vger.kernel.org>; Mon, 09 Nov 2026 18:05:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794276347; cv=none;
        d=google.com; s=arc-20260327;
        b=Azuxtx9w0SPFpaQCSHM65syE7KPP8TejOOZOm7ZDI7M9bCz4KyGg4XTcP+RJN2//K5
         PMo9gwI9x5EMbWruk7/yLXZLHo8qcPn/Z4zwUOJWYCihR0iL39sSTvr5Nn2b3lyU3oOb
         D9+HtBqbufp0R3rREFpgAb1dyuKMR59kwbmiBQkQ0yLOZQXTSPulMn1QxphfcIUxJodD
         anXYiGgOb53SadBemxhy7hBkeGC4EXEo+Z7K+OybSASLVL1rMsAvAuMZWalX7YxN7VBQ
         oM4AvV5PtQBknQaLk00W/ES5/z6Z9a1hnxFEHmDwLl2bU7yjWiEc9IeTu9alu1EXHrBe
         nBGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rvBtJIxhWUVb0UP6eLGnrGtj2/MrbT/J0MltdyjUmf4=;
        fh=jVxzExnx8Q8hVAdlb26R1MEHK5rPFehiNLa6u4TyyFU=;
        b=aP/rCvirB21Va96eFoNm4BUN6f4FES/bNPCgUeDLYi2EBb86Z6pj2GCL2rULQWXOlg
         bHRmcTNTUgx9xTJBT7mpQzGp6cgCctAHlJbSvFE0SqCNHtsjUP8OdLgSTHvWM1WInp8p
         SF4yv3ULwq1M4kGCj18vW+dkZUX7w/7VdD2XPe0p1XfvLGz8s7TrwOAEzblDkTYP3sV/
         o2NycXBby206PKkmd1x6bzKEiOM4cRjZePlWhKocPyZl9W3t9CYofjEs2RQI7Q5Fek1K
         +nO/v/IpAElAlPA5t0CylyDWCibsTAVj9wlUpdpeVRnCa+xmV3IsdO0C0FpvBDYOw+J9
         wICA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276347; x=1794881147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rvBtJIxhWUVb0UP6eLGnrGtj2/MrbT/J0MltdyjUmf4=;
        b=tdDn4sPz+qE4U3fnx0xZx3mtokkTI2dZkE5ZSClQ+Gl4tiacu/wnJJrvejDCXPlGHs
         oQ2BfLCA0G7CK0YrVZAsXZ9nxYNUUuRrqD1nypJBMB/JFyQaT1BCoqJnY2+e5KZ+bJ9p
         q6/EypUVz42tB6F7U4UftfDvco3E1M029FTpNzFiXYOJo9x3zD/cZF/Y9CLH/7KWUyYz
         XaqKvW8PTUcXLWeQ3yttCYuwD6L/pMdgiUdvS7Mttfr97m+jRhvDgxD62gQAIXBQO5fu
         Spnae0MCiTw9NMhIouThLRFY1G3jHATu63+Q3dAYD36+tckN1yzyk8GOf4rVVWMq5Sd2
         QNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276347; x=1794881147;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvBtJIxhWUVb0UP6eLGnrGtj2/MrbT/J0MltdyjUmf4=;
        b=ADHriLpQU+W9HJWqSvZ1DqSYRoszuzJ+sGOx59UKJbBQvrF/uhKmOD/b+TNNKxLMHA
         nwsJV6VljW9XrEeVdPW9GPBfPOzwY0b+j7rsQ+Xh3taNaRkW1widB0ju5SAVC14zFQub
         07G3dpyXyxErUIJgxoXJxPk4X5a0bRtxTjcRlVy/5fudyRGQlN0SwSbrWcA7cV3Yghhj
         Toim+AR/z4Cbk/eF9PdwyEVm9mI77SmWQBm31sd4R1qdnobh5/F1v1WMolOHel/O6nlJ
         ysGqPqK3yt/ze7jum2p4IMTk5bNpoyKAd5ij2pbFw3DWFN2i88FlH0aaFzL3jfxcIkFu
         zybA==
X-Forwarded-Encrypted: i=1; AL+hErFe1E57nDi+toH4g0uxWsKwotGTzmX+y38XqmMiWkgVoKHZ3pUHAIk7Ws3/lVDEuiA4xbag5QG6SHoy3Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9YBYeGUmLViQPLL7t+XwRmuk5qruOgMsS5ljCSTQnsaPtm6hnu
	81sfY+UfXYhg4RdVit0JlK4j/WaO16VJkDjDJyd3Obosn5P1PeDjE34ZVVDSGFDhSDFdZ+c12su
	1/BrYGbThlvxhzu5j6PiZiJCipSMHFOM=
X-Gm-Gg: AYBFou2McKT9eQpysMz4ZDB3UuwUAXARn1Mot4H46ZKwz3buF6Nrrx7uZK/KCJNZOvf
	QMd3J4L8n8rIKM6bCXMvwOdqPPikqosWWowNqJxSMn6ANHPEjFJFtkPkxZ+KM+TxS1DD5AaXS7c
	ZCa2AvXvRKrSuY55dSi1RJn2en4mz9vZ8xwwLI0BiXsJBC3mhnhoDFkWgHt12UPL0sLMMaCr0Lt
	jtUf0z3ohuvWLIyMZBio7pX/elLfuzOuKlmu867acdT3jf8bbz4hBLEf6Ia8nGELu2HRc7XO9p8
	1Byp79mxFo1A+tgfb3ha1v6Cv0jw2XG4WRWDNoIDWgDOX/PVCeSgWzSvNDA6uSCH+mWbZkToFDZ
	+vNs8grTuLufKZro6TG3cYS94jUklFLWAftVODJirZqQQJMjVIZEDg1aOzgFVuk8ueLzwzGvZj4
	KvqD+ivwAc9PxSXGPebEtgHm9b6ziUrruKVBEYugUiBsQNOT1Y/Ns6
X-Received: by 2002:a2e:a98e:0:b0:3a9:7c85:a16d with SMTP id
 38308e7fff4ca-3ae090e40b9mr2048221fa.5.1794276347097; Mon, 09 Nov 2026
 18:05:47 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794040317.git.linmag7@gmail.com> <547ee20a68b3f2d848d451c69ad023c0361f41ee.1794040317.git.linmag7@gmail.com>
In-Reply-To: <547ee20a68b3f2d848d451c69ad023c0361f41ee.1794040317.git.linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 9 Nov 2026 21:05:34 -0500
X-Gm-Features: AclHuK_rqFRFpVgh6MA1aE6J-sPjlpj-Y4wuItG9aVYgITuJ8lbM2pcP42HV0Y0
Message-ID: <CAEdQ38FkLVgK2rhvqL9WDxvGkSu455ETYWvd0zVw+PML_5Cqgg@mail.gmail.com>
Subject: Re: [PATCH 1/1] alpha/perf: Account for time spent handling PMU interrupts
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 4:19=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com> =
wrote:
> Alpha does not report PMU interrupt duration to perf, preventing its
> adaptive throttling from reducing an excessively costly sampling rate.

Nice find, and thanks for the thorough testing write-up. The logic looks
right to me: time_init() runs before early initcalls, and since it zeroes
est_cycle_freq when the HWRPB value is within tolerance, the
"est_cycle_freq ? : hwrpb->cycle_freq" idiom picks the same frequency it
did. A few small things below.

It would be worth adding a sentence on the symptom from the cover letter
(short sampling periods leave the machine unresponsive with RCU
grace-period kthread starvation reports) so the commit stands on its own.

> +#include <linux/math64.h>

On 64-bit, div64_u64() is just a plain division, so this include only
serves that one call. See below for an alternative that drops it.

> +extern unsigned long est_cycle_freq;

This is already declared in arch/alpha/kernel/proto.h. Please
#include "proto.h" instead, like the rest of arch/alpha/kernel does.

> +static unsigned long pmu_cycle_freq __read_mostly;

Since this is only written from an early_initcall, __ro_after_init seems
a better fit.

> +     u32 start =3D get_cycles();
> +     u32 cycles;
> +
> +     alpha_perf_event_irq_inner(la_ptr, regs);
> +     /* Unsigned subtraction handles a wrap of the low 32-bit counter. *=
/
> +     cycles =3D (u32)get_cycles() - start;

cycles_t is already a 32-bit unsigned int on Alpha, so the cast isn't
needed. Declaring these as cycles_t would read a bit more naturally.

> +     if (likely(pmu_cycle_freq))
> +             perf_sample_event_took(div64_u64((u64)cycles * NSEC_PER_SEC=
,
> +                                              pmu_cycle_freq));

Alpha has no integer divide instruction, so this compiles to a __divqu
millicode call on every PMU interrupt. It's small next to the handler
cost you measured, but it's easy to avoid: compute a mult/shift pair
once at init with clocks_calc_mult_shift() and convert with
mul_u64_u32_shr(cycles, mult, shift) here.

> +     /* Match the calibrated frequency selected by time_init(). */
> +     pmu_cycle_freq =3D est_cycle_freq ? est_cycle_freq : hwrpb->cycle_f=
req;

Not for this patch, but this is now the second copy of that selection
(show_cpuinfo() has the other). Having time_init() store the frequency
it chose in a global would let both just read it. Fine as a follow-up.

With the proto.h and cast nits fixed (the rest at your discretion),

Reviewed-by <mattst88@gmail.com>

Thanks,
Matt

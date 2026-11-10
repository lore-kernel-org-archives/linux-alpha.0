Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794335874;
	b=P7HlcuGmqCqE+quB72ocb4HqMs5+j3OhWCThHo9KTnCV7/2txE+j8Hrv91ubTXBDtOkb
	 8XNLRTltgWwJRig/SEsdH+eGN3Wr2DKtm9QADUrlSnvgqApU2U1jPrcDRnOoyN8B7yDy1
	 c802KRrD5OnKLHNgQlbv3rKv08F7lJGtEtzHCFPNqRXrAtx571e/nxi93bOu1xYJ0m9wd
	 wJsL/PdbQIDaGGRu9WW6V14krsmJdKKM5vTsnRG3KiQar82F9EnP9exFKnRW9HSWTwwLk
	 9bvYutO3i3nnPj9yo1i9lYMt6bLYaDZqi3nV8+cKRxLRKubhrWarsSwd6PGmB9DO2/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aXbSmfqp0QsWZwY1ePq7n+E1/WjLTTdEEmX75883FJE=;
	b=uwxHnWaaVy6Gx+UqPbgXhdRnOxlPA/mkHLKYkUjK8nBsRQA4yqXefsoN3RzGPypjZmgW
	 /2Tde4c4x7iMzRrDFS6QnEbDNLg8IqubGYiXZVOwEw1detxqhAUI2LcqXKzn99OvHrUzo
	 OyPsU4NFNIY80Vnjd60ESfWwkN/yoMo8Ha/8n9uAZAh68kFqSjmXnHwOlpt28G7Pj+oaK
	 yQ303YtmZIbxeu6iCLx31pfBPN5ASIeBupbq3+OTkhF5tcXfKeGCXTJGQZug+ieABtPpT
	 1Rk1XWe4gxzz0POAO5tNb7DH9dwQcPYU6rToZpYY+an1DR+PlzlreQoJESu0sBw7R/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnteZnK5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1420B606A320
	for <linux-alpha@vger.kernel.org>; Tue, 10 Nov 2026 18:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1420B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnteZnK5
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so3254486a12.2
        for <linux-alpha@vger.kernel.org>; Tue, 10 Nov 2026 10:37:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794335872; cv=none;
        d=google.com; s=arc-20260327;
        b=laNLoD1/QKRjRzEhIWKpmuaARS+X/QwQ9/jOPRMFrVDp283Da+cd/NavN+gFl/IcIg
         sxMhnHZQKlgOOu80v+EwUkmPBM/jHg4TCMJ3wC8lC7wfBddluVKu7Cjvk/TxtxKNRKeP
         25EQTk7X96TFLaSfCdutfp0lIiK5xgkMmzGfPpo6i1O9V8f3lrAXY3LRLor+xs4e5Q/3
         4krmGq5KK6o2/KCdeJoeBzZVMyyIz925Ri60GnPU/Dcd0vrzOXnwLMsKRI/kMDKxjvsw
         6f9mWZ/Nnfgz6xdIegIsPs0hQdwK0BUeZuKgtJCUmiK3fBA2XLGnhLwq5ePmEhOoro5u
         PJGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aXbSmfqp0QsWZwY1ePq7n+E1/WjLTTdEEmX75883FJE=;
        fh=dNoK5/LoR+1TZQPeD1xDOf7lHHSAlayslGz1a3xWjaA=;
        b=s3tkgYQ1Erlz03azcfwjt731criLNPx5FZKiAhqB9mSryLBXaz7U6xfJwFda/akQq7
         SoeVW0ajEjhqR5pstGjX2ZM5/q+P58SOaH9qJ5xi6ZaQ4SAVxTac7YAww8BBcj7iffN8
         xyxl0jaKDFEQCXQmRcwwxxE9wNkY0NSAYVW5EVvTjW9bYjigpWbiuEsGM+nTnkuGN/rA
         lwRlK6VkWRbdDRF0T78ajs6XJmEYtTirI4RGKFHYdIqp0cOeCFlVGDT2Pw+bFSE13uQr
         4XCvI+OLIpQywkxoj6lPvbpKanTqDXCBIUNADxSrREsJM6oTJxO/27UNvfrxi2pYtVTE
         JPnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794335872; x=1794940672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aXbSmfqp0QsWZwY1ePq7n+E1/WjLTTdEEmX75883FJE=;
        b=fnteZnK5Y62ib4kOKlV0wWxe+tAvWLrVHmjMtvRMjfdMPhc7LLAeH0pYLzva8xIQ2W
         vEnlda49dWZNCFpCoPCq4zDWPJOf07K8KBy8n/lko0GnD2eG9EDFwnPbFy5h4v5qAvEy
         LlcelBG6T02PsqgUvHV7JyB07IRTFt0CozB1Wv0zdnwjG/nfrcY0MCor/FLtQfwomXuG
         1w5JZiAHb5i2R+NvNtLJ4UpfuWgfn5CbErB0W6GCh76Ts33P1X8q1FFZWmqAoMvnVZfN
         2HD5VZ7h5gZAJOtwekSN7eUmXhk2YzVIsBYNcc2tvio1EYl5bl9PSWGUrkUDVd4HRRNk
         m09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794335872; x=1794940672;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aXbSmfqp0QsWZwY1ePq7n+E1/WjLTTdEEmX75883FJE=;
        b=p4t16gt9SdGX9JXbHDdSVClNUvDuGmT5lZNF2ojMd0TXxtuKFjDivi5G/BMuierbln
         NjWq1kkGNhoYrEUx+5fW+ngscI6DuuK6gxWWlRj2qtSnDn9B40cU8bfe/YHcNslguTkm
         kKskY84l7OvPWyyVJ2MGF0iVQcjh+OLsuFwxzjVIgVHrUCJw9pB+AdZf4qbiMgWkT8FA
         LWUL5NrqEsJ44pp4G4t7mL5cTCGRhlKDf5IOkcvH4A5lfiV8DwjI1VBh3Ff3wcIh6k6a
         D/0C/sXWZuD2e3xVayok1CbyXBj+JSDuowbvQGCyzCyBr9SBFhOLRQi2DkvTiY0ctBQl
         nKQA==
X-Forwarded-Encrypted: i=1; AL+hErEsZrSJLMas6vxWXnpV0i0otBlO2+HLNI8mnvBI+7JzYC4uBpgnLVDSJRZz7R1oiYN8TcqSI9Vb2Z209g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+7tKk3IfUrElOMIWrHmvJIdMzUDj//W97nxRNS7LEvgyjd+CDU
	TEPe8BWrZuKHs9RUaOk0lIUV4fKgsmLWmp6R/esIXOPUXjukHqJlfQYPt1cPhIzhvgLjSVxRmlo
	Yn1ZvYHHRd/M0rMLnarGO9narG8JoM/D25VBM
X-Gm-Gg: AYBFou2839iEyM26dURTJhf0WVYE9in7PAx+wvSQsounw71ftOoQNF3Yat1nHvgdPts
	k+6U3+yrovWNJvBuSwZLxwotsao/e+5v3apm0rOn+Fy6Ari/FdwALfQlW5zVD8YZaGMDVXA7VcM
	eS5c/ZNs8KqZeyHnPHHW6Fq6GPqDirS0wq06QJ8STqZEB7lh1Vij7rhJ7F6t6TPlP9AopTgM/ua
	QdT6D9biI6aIp0Ywp7755a3DaRk71Ik/UHo6ID4sXxV2iI0WRajqDLJmsmZa2RtXdccdkZ8VaXS
	bjj30qWSgkn2ZQqQz+wWZDIwHdolyng6XJLMqKsOyDDMpSgbRL053LkQrwiRlFoHmBqj74tj7hf
	ebTO7VHbyByT3DCV8ZUdGN7y4qWylDrm+SSbRnUYyJZHvAorLcujMCvx+7i4fRqw+u+FCrOUHTP
	4ryHVZvQv9IvxtRM7mfCdbRJI=
X-Received: by 2002:a05:6402:2756:b0:6b7:1d62:3916 with SMTP id
 4fb4d7f45d1cf-6b777083013mr174379a12.0.1794335872243; Tue, 10 Nov 2026
 10:37:52 -0800 (PST)
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
 <CAEdQ38FkLVgK2rhvqL9WDxvGkSu455ETYWvd0zVw+PML_5Cqgg@mail.gmail.com>
In-Reply-To: <CAEdQ38FkLVgK2rhvqL9WDxvGkSu455ETYWvd0zVw+PML_5Cqgg@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 10 Nov 2026 19:37:40 +0100
X-Gm-Features: AclHuK8ye6DC0vP0CIqj2Kxi1_mqxAUWe4I4SZTYnzI5onSho51f034roAGQ28c
Message-ID: <CA+=Fv5Q2bVUT490ED06yUNxp126Bk+c9_hFBTE8n4vQLuTrktw@mail.gmail.com>
Subject: Re: [PATCH 1/1] alpha/perf: Account for time spent handling PMU interrupts
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Nov 10, 2026 at 3:05=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Sat, Nov 7, 2026 at 4:19=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com=
> wrote:
> > Alpha does not report PMU interrupt duration to perf, preventing its
> > adaptive throttling from reducing an excessively costly sampling rate.
>
> Nice find, and thanks for the thorough testing write-up. The logic looks
> right to me: time_init() runs before early initcalls, and since it zeroes
> est_cycle_freq when the HWRPB value is within tolerance, the
> "est_cycle_freq ? : hwrpb->cycle_freq" idiom picks the same frequency it
> did. A few small things below.
>
> It would be worth adding a sentence on the symptom from the cover letter
> (short sampling periods leave the machine unresponsive with RCU
> grace-period kthread starvation reports) so the commit stands on its own.
>

Agree, I'll update the commit message in next version.

> > +#include <linux/math64.h>
>
> On 64-bit, div64_u64() is just a plain division, so this include only
> serves that one call. See below for an alternative that drops it.
>
> > +extern unsigned long est_cycle_freq;
>
> This is already declared in arch/alpha/kernel/proto.h. Please
> #include "proto.h" instead, like the rest of arch/alpha/kernel does.
>

yes, will do.

> > +static unsigned long pmu_cycle_freq __read_mostly;
>
> Since this is only written from an early_initcall, __ro_after_init seems
> a better fit.
>
> > +     u32 start =3D get_cycles();
> > +     u32 cycles;
> > +
> > +     alpha_perf_event_irq_inner(la_ptr, regs);
> > +     /* Unsigned subtraction handles a wrap of the low 32-bit counter.=
 */
> > +     cycles =3D (u32)get_cycles() - start;
>
> cycles_t is already a 32-bit unsigned int on Alpha, so the cast isn't
> needed. Declaring these as cycles_t would read a bit more naturally.
>

you' re right.

> > +     if (likely(pmu_cycle_freq))
> > +             perf_sample_event_took(div64_u64((u64)cycles * NSEC_PER_S=
EC,
> > +                                              pmu_cycle_freq));
>
> Alpha has no integer divide instruction, so this compiles to a __divqu
> millicode call on every PMU interrupt. It's small next to the handler
> cost you measured, but it's easy to avoid: compute a mult/shift pair
> once at init with clocks_calc_mult_shift() and convert with
> mul_u64_u32_shr(cycles, mult, shift) here.
>

True, that makes sense. I'll fix this in next version.

> > +     /* Match the calibrated frequency selected by time_init(). */
> > +     pmu_cycle_freq =3D est_cycle_freq ? est_cycle_freq : hwrpb->cycle=
_freq;
>
> Not for this patch, but this is now the second copy of that selection
> (show_cpuinfo() has the other). Having time_init() store the frequency
> it chose in a global would let both just read it. Fine as a follow-up.
>
> With the proto.h and cast nits fixed (the rest at your discretion),
>
> Reviewed-by <mattst88@gmail.com>
>
> Thanks,
> Matt


Thanks for taking the time to look at this, I'll post a v2

Regards

Magnus

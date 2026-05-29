Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC92133A00C
	for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 08:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044283; cv=pass; b=pAe6q0aqLTlkVQohNFB0hSHm1y6pJeqKUbMnta1zNVlFG/Rb4U+ZqsMzWjrBeziSmEM/Rs09cFKrvfEcS+RP7uv4b04gr7cwztSKnMJV2fV+fEyNP9nY5mUpgBOQSadtLu11UatM2e0Iy0BM/JZ2MoE/HMlofQC5grc4D4PQqmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044283; c=relaxed/simple;
	bh=Wk3aiWc+QEzhu0NwKMl0y8CWK9ZNpPshVCe8NLafBPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UI1I7nvdf0KT5tM0krjlwkDgjVwq9lc0b88KP7ZGJvHvKO7iiciCQffLo3BeNOASc8tyyWWMInQ15NBsrrZWS549CvIEVqFsujyG/2KyN1ZvJUe/H9jhLociHWrH6FmVzUsUIxaQv0CWh+nqJ8AoLezFuRw69dFYKImMMs9H8vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SciqvKkA; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SciqvKkA"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bd01481e592so1962676866b.2
        for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 01:44:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780044280; cv=none;
        d=google.com; s=arc-20240605;
        b=hjjL+jQaB6c2EZnjTNyxHkjQBZikkO5lZUAjdEZx0o+LQfn6p4aAm53d3I/Zx+sKst
         tAsDOywM+xKVXsHaNG6Ia2VeHlXlSOHRIyzBmxWjQCDHZg4G5oRU0KislBtlDNe1dyJ0
         AaRlXD1ishSknGBSXfq1VHNHNUi85lRgSdwgZ8J/fGv5typThXoFJztUwN5NQiUpwecv
         2iSojyxlgCg+EvNWdpzjLeBw6I0ovLIqaDtNmax3w+Ed+BzEsTrk078FSwu4Q+9RgqS5
         uaaHXJCmEsUEtHyaFpa09N813Q7DaEmfyw2/T5CIxtlN9Us2cUGYs4SjtcaECforMHFh
         YRZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gFsUMUtsy1cL7mLXns7mSBxO/z8pwoHJ3QJWfcSo/8g=;
        fh=pCoSR2ZoVBqSTYnojIaN1wvhTeTI5Yg3whK6mOo6pU8=;
        b=Qz5UpZR/WeSLFA4Ay3JDATg0x6/hOuptRDhj/5tbv02/e1H/+RsAreKswDhwO79tGv
         sLa/MwebeextruwhIPIEN9ZG+7G0qhxjHAkcG3CCnYNFDfDgPHADgBP7+Wa2irQM00yu
         dv+9tXG0KkIblfQZdH18OXqXkw0GcBQDCmRYBcnY/v9TjZfpvtiH7Ua9k8KLpvxxkDJy
         tfx/wzPQyIAYiOz4r7HVvV7rq1555dj/ikXjGe/6n+F6cto8ZXXmYb5R2ml+IY7CSJIX
         rh/eJbV2hCHyizySEJdSUxdwaTa8xdqN4Dczl4TTh2IfwfWeO0ai/iErenxp6J3Mp115
         9qrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780044280; x=1780649080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFsUMUtsy1cL7mLXns7mSBxO/z8pwoHJ3QJWfcSo/8g=;
        b=SciqvKkAyRMf36H7BsH3vIHo9sXA0GXmR4mnFnNqCRA0mmw3zAKvymFTkdCSYgrQFh
         AE0/IkCHqKlLORttuwZo7uKU9Mmzy5yDSvlQrZxlJXPynfnOC/+Qqgq5uh4RMJDbgJvX
         KUAMuG9jIDDt36eRJ4urDJAeHrISh+2B+WiuH+aPgBjxzm117q69ih2YXeVIiilpjF9q
         mKZqxqBJD3PCNswdUqvUfJTbfftCDZraLIhGGuco0yTZcGSXuGNO5CbzPAqb1A87LBEm
         WGGscebJZkrkgL9r647MaRUzNIYezRFOcHaQQyLKmA2PH8+O1qXHWflrVp6Whk499yDe
         iReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780044280; x=1780649080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gFsUMUtsy1cL7mLXns7mSBxO/z8pwoHJ3QJWfcSo/8g=;
        b=KzzAPyTkcrLt98GJ7APo+AxuWsyGwC0HCdadAK8TlNA1bzHcx3m4J66mgxDxNvM+NC
         O+xQ969qjwLFVf4DPJcC1muNAJkEVL4xtc0bwP3Trqn582Ap80Gr58WTmKkq0EaB3jUz
         MwjBnysNfmtp7Ui8fUTVgIzkT1/bQ9WJV6oumW3z6qNcBc6MhzUj0LaqgSnld6Rlm5VK
         QudY5aOfdrA40bAOq8V0WBkPTCA1Thya15BmBza0CiIyDrV1OBAvWmm9UQCodzxHTkvB
         iZHSuyi0KbsbyKLlaCM/3F5kr41l8fG4znJLoszLNyBcfs+kl4uePCxf+lohBhdWHITO
         QcwQ==
X-Gm-Message-State: AOJu0YzZJLZv2OyxFG5HhWh46GdgfZMZuN7OJi/GLX1G2UPknxZOWluR
	J6JxyJoY88x0RWarK+4IT6ORuWxhTddPr1CwBXIeBpppAl62Dsfn49HmMlYCJijMhK16grns1aT
	K38vBGS5Aec6otiytYBtULSLK55XZJm0=
X-Gm-Gg: Acq92OFe5i256MxgqTbDxiycuIZwGnFnVN/1KwFjm7GUWljd5kN1MSssXZOsxUczKRV
	RzAXtGfnnzQLH1aDGL+PgB1STvXuqRAXPCE4BC72rSl3o5WA/qPvKdxYfxdJkFK++PWi7wNPa4p
	gm/dScgny4B2ORPwx6nS5k2n5bga9vKGmr8L+A/f7984RnjfzqPK17Ypr1HNzpaiByzO5t/mUgj
	NY/VJUK+HgHmjrORwMHBP2yDRnxkuArMvLOKOEhqBQcGfJz01nLjd3jfe0adD2zyBpK8/48xzZv
	VF0ID1+eClRXXHtp4WJ18ZkgGr3k9/ccC0pr0RZAzsAR+klDKvU=
X-Received: by 2002:a17:907:1dd8:b0:ba8:2ebd:dfb6 with SMTP id
 a640c23a62f3a-be9cac112aamr56012366b.23.1780044280110; Fri, 29 May 2026
 01:44:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528230750.1840681-1-mattst88@gmail.com>
In-Reply-To: <20260528230750.1840681-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 29 May 2026 10:44:26 +0200
X-Gm-Features: AVHnY4LDUrhsTBVWcFxp4dD1EYQwUU5Jla-zgjfsJTfyvkkfprcEx8s5z28dN-4
Message-ID: <CA+=Fv5Q3BROR5Gr226Wo9KXRokZhsCeT4CY39rmJNQAqApKDbA@mail.gmail.com>
Subject: Re: [PATCH] alpha: Use work_on_cpu() for cross-CPU RTC access
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 1:07=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> smp_call_function_single() runs its callback in IPI (hardirq)
> context. mc146818_set_time() and mc146818_get_time() take rtc_lock
> (spinlock_t), which is a sleeping lock on PREEMPT_RT, triggering
> a lockdep "Invalid wait context" splat on Marvel SMP.
>
> work_on_cpu() runs the callback in a kthread (process) context,
> which can acquire sleeping locks.
>
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/rtc.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git ./arch/alpha/kernel/rtc.c ./arch/alpha/kernel/rtc.c
> index cfdf90bc8b3f..4ad5846a1d71 100644
> --- ./arch/alpha/kernel/rtc.c
> +++ ./arch/alpha/kernel/rtc.c
> @@ -15,6 +15,7 @@
>  #include <linux/bcd.h>
>  #include <linux/rtc.h>
>  #include <linux/platform_device.h>
> +#include <linux/workqueue.h>
>
>  #include "proto.h"
>
> @@ -155,11 +156,12 @@ union remote_data {
>         long retval;
>  };
>
> -static void
> +static long
>  do_remote_read(void *data)
>  {
>         union remote_data *x =3D data;
>         x->retval =3D alpha_rtc_read_time(NULL, x->tm);
> +       return 0;
>  }
>
>  static int
> @@ -168,17 +170,18 @@ remote_read_time(struct device *dev, struct rtc_tim=
e *tm)
>         union remote_data x;
>         if (smp_processor_id() !=3D boot_cpuid) {
>                 x.tm =3D tm;
> -               smp_call_function_single(boot_cpuid, do_remote_read, &x, =
1);
> +               work_on_cpu(boot_cpuid, do_remote_read, &x);
>                 return x.retval;
>         }
>         return alpha_rtc_read_time(NULL, tm);
>  }
>
> -static void
> +static long
>  do_remote_set(void *data)
>  {
>         union remote_data *x =3D data;
>         x->retval =3D alpha_rtc_set_time(NULL, x->tm);
> +       return 0;
>  }
>
>  static int
> @@ -187,7 +190,7 @@ remote_set_time(struct device *dev, struct rtc_time *=
tm)
>         union remote_data x;
>         if (smp_processor_id() !=3D boot_cpuid) {
>                 x.tm =3D tm;
> -               smp_call_function_single(boot_cpuid, do_remote_set, &x, 1=
);
> +               work_on_cpu(boot_cpuid, do_remote_set, &x);
>                 return x.retval;
>         }
>         return alpha_rtc_set_time(NULL, tm);
> --
> 2.53.0
>


Hi Matt,

Very impressive works, thanks alot for taking the time to do this!

The overall approach makes sense for RT: smp_call_function_single()
runs the callback from the IPI path, so calling into mc146818 code that
takes rtc_lock is not valid once spinlock_t can sleep.

However, I don't think this should ignore the return value from
work_on_cpu(). work_on_cpu() returns fn(arg), so the callbacks can return
alpha_rtc_{read,set}_time() directly and remote_{read,set}_time() should
return work_on_cpu(...). That also avoids depending on x.retval if
work_on_cpu() itself fails.

Also, now that this path is intentionally process-context/sleepable, the
existing smp_processor_id() direct-call fast path deserves another look.
A task could test that it is on boot_cpuid and then migrate before the
direct alpha_rtc_*() call. If the access must be on boot_cpuid, either
always use work_on_cpu(boot_cpuid, ...) or protect the direct path
appropriately.

So I agree with the overall approach here. I wonder if we could simplify
the conversion by returning the alpha_rtc_{read,set}_time() result directly
from the work_on_cpu() callback and then returning work_on_cpu()
from remote_{read,set}_time(). Also, now that this path is intentionally
process-context/sleepable, do you think the existing smp_processor_id()
fast path is still safe against migration, or should we route the access
through work_on_cpu() unconditionally?

Regards

Magnus

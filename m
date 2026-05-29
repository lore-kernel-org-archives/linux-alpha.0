Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D482D739B
	for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780062646; cv=pass; b=F1qNRkix+K682U8sokZ1aJII4Gsim6IYBvfXAJBukKnW8yzEXyxMWE8vefgtYW0wesyRwX4h6TSvACVCIezA4kxMHh3TraBRZo/djaezwlTTpVa1cCzREYip6I8yzhKrKuuJ5HagFiTAdpNY377Okr4jeln7e/L0lW4tNmqQsMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780062646; c=relaxed/simple;
	bh=jWUj0aatBU0fsZjP17Dllv62v9an2vCmWyI3uxipquY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CEZC/xz4ILocADU6vkO7MeSzD5YslT8Y+AC6I76tVF3EVt9gy77ArXxfU+BzWIr3P41lvQ/vNUGbMiJdlWg3vk7fRb/EGX0AwPtzUtXgE+szHU/dlD7T+gv7SARz9cdff1pvrB7joPPviSrT06ALe0mkUEdsQoggC1qC7w1Mt3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xav+U28E; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xav+U28E"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-68c19f1f3ceso1068224a12.2
        for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 06:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780062643; cv=none;
        d=google.com; s=arc-20240605;
        b=bBdjpuN/EYLG2bVGma3xzmRgk2BYTNMCa+dnR4hcE/hRdSpKPgXYPOMEOREcfTO6ng
         jWxK0foaJ2RrAtjkUAeDWxQFmBIsH3h0zPHnjrz+9feuJYNmRoTqFYASC8wQ4KM+mmAL
         wYdRvekbiIo5+n+QHPlxLKtfV71xJ++LLKA6Y4vksznAYwGHib8lhXi0kIr8Y+0QAbNj
         ZX/owl3aPyzyCY8YaR4vCNNLIR6HPt2UWJg5R9oFk/9v+CuwZbUFi+yo9CWijkITcSaN
         8jIvJVxge8thNufTcS5WfSwf8XrGUxB26wK6zEzt8cG7yai4v5aizHJFz+RrESfcPbrC
         Rk7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v9ExrbOOz9TGL3qaD+kl0RBR9EgjXHDEBMi3jSYDcPY=;
        fh=pCoSR2ZoVBqSTYnojIaN1wvhTeTI5Yg3whK6mOo6pU8=;
        b=XpLLtB6cxQO0P8Xg94/rYGSuX6V6bJVcSJfFdLVDCT4z/+nkyE4KAJiHbjQanIk8ou
         bZrAri6cRrPkzx7cnQYw8Ed1bjc2eQ2m21xqBxFYoHfO5Yf8ctZ7HLNu8jGgdV3irZYC
         JzDc6sOO6PkdMGICYoLC/X9CKPtgIBbiU2CcenjEtfIjRzDYUKl6HgJQaYGe1uAw6og+
         k756E5oqdqbyGSXlHrDw+E6DH1U4S5Om7ukTfKNtvcPTf4tZjnq9Oz4c96IexpI37lWw
         1HD+LTHJNh5ApmWvz92dI9NL200VkQ37kSQrC+y0dV2XTqyWYFxOGa0pgVf6xpgbe5Fo
         CXPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780062643; x=1780667443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9ExrbOOz9TGL3qaD+kl0RBR9EgjXHDEBMi3jSYDcPY=;
        b=Xav+U28EI8c0McUQbsiMxKg7MXyqQLXDJnbtPiGfO+OJHX5h5GmxplOOIv4ENRTwQN
         zPJZxVDnzWVQ4xEcvxkpUe8Zv7j2ufstmvO9mIgNzWQxutRxXG6iIUTH/0h4tIdvr3qJ
         Dt55D4ekE43AZespAwwmHma4G/R5DMzIZI24WiORT4R6uAe5YuYhTiPa3/ynNKnHBPYg
         vNOn/168XXBkIMU67vjI+WLYk8qtzdxems3Kz6nYTDuFsCYc9ToZeFSPkLJRm1bdzNI0
         sK2/NOzM+J1mdHVevmAN+t2DSPIrpgOoTutHd1eTA/36EPUlqvw9FgUeReBfzFJCK0e/
         dTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780062643; x=1780667443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v9ExrbOOz9TGL3qaD+kl0RBR9EgjXHDEBMi3jSYDcPY=;
        b=i3V41nf996zQg9jOVImXu8YeWV4m7qggFGEswvyvkXrSah9HWy6gvMKNqnEQgdvCQe
         LQj1/MTi1LHVuOjeEp6W4SznRSTq0KXTVZw/AC927mVqZbhs2Ze6UgXkchQKlwW7t0s4
         BXsu8x8XLVLOpQvhzQrt5nxZnEuTU57v1L+jLx+hiszOTWICN5hvr9gA2CjHBiNLB/Eb
         zpSIIxtp+TRM7WvbDyrywy+8cL6iRSgAxW+axTQRdh9uysUddTfIWmj8IN7lAE9irsWL
         tVY2KXkSHpzj1kZSKrK+P4kwKk3eVb4JZoYz6LzfjhdDYXj/4fcfbYzMfnQnz78l0zV1
         FpAQ==
X-Gm-Message-State: AOJu0YzjIUev7mkld4F/mE+C2wofknS8poyzDrtODsQwtUAnarNse8tt
	u/4LsIun9DiKYaYOMGGEPm+g4XT4MPQMWHXgZRy+RLePRkOqaFtdzrfZdMW75szE7iZNrv+4B5M
	vcwLusP42ei47bY4eBUE+HKqeVUF/rcc=
X-Gm-Gg: Acq92OFnH8gsYgk60dAo6Y5kyRFLee1Sb/+xZopcQc++RsEpDyMSZtQWocvPSdF+dcE
	p3GbwB/c0QP7q1G9STyMEcbs7TqUAjk2++QRaaeU95m/q0aY9PGOdMr1gLP2Viod9o0brN1C6vT
	952J3xmSdG+m/Cftt5oDoLZKMxGdIqkgd5lFPltanBrTtc+OBBuVo4j1WDTKkuTrCQ/s7u+yCFe
	PM1jipFta1xo69U5sQCJTuUR4292Z6TWJaELl7uhCIUpSJCgvXDg6rOBa0Q6WI2hGgDcczN0YMO
	9aLh7BMtUDNz1mSj+Y6TspTSSPjPK8/YPUhHZDCWVLwQ3ebrJ7pQKeHmekmQuA==
X-Received: by 2002:a05:6402:5187:b0:684:70a:4506 with SMTP id
 4fb4d7f45d1cf-68c10e73094mr1615465a12.15.1780062642718; Fri, 29 May 2026
 06:50:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528231043.1842326-1-mattst88@gmail.com>
In-Reply-To: <20260528231043.1842326-1-mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 29 May 2026 15:50:30 +0200
X-Gm-Features: AVHnY4K4Vj2v7dvrwLYOm4pk_cTOpBSBbPY3xX0a53Q4dCeIi62Pru4gfqDLqr8
Message-ID: <CA+=Fv5R1ZRrp-Xvgopw+u4oaC=cTPx1XRuRJiu=nxBkQgTnOiw@mail.gmail.com>
Subject: Re: [PATCH] alpha: Fix SMP shutdown hang due to missing memory barriers
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 1:10=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Alpha has a very weak memory model. halt() makes no guarantee that
> pending stores have drained from the store buffer. If set_cpu_present()
> stores are still buffered when a secondary CPU halts, they are lost,
> and the boot CPU spins forever in the cpu_present_mask wait loop.
>
> Add mb() before halt() on secondary CPUs to flush the store buffer,
> and use smp_mb() in the boot CPU's poll loop instead of the
> compiler-only barrier() to ensure it observes secondary CPUs' stores.
>
> This avoids a deadlock on shutdown on EV7/Marvel platforms.
>
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-sonnet-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/process.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git ./arch/alpha/kernel/process.c ./arch/alpha/kernel/process.c
> index 06522451f018..d50f9cfd8333 100644
> --- ./arch/alpha/kernel/process.c
> +++ ./arch/alpha/kernel/process.c
> @@ -99,6 +99,7 @@ common_shutdown_1(void *generic_ptr)
>                 *pflags =3D flags;
>                 set_cpu_present(cpuid, false);
>                 set_cpu_possible(cpuid, false);
> +               mb();
>                 halt();
>         }
>  #endif
> @@ -127,7 +128,7 @@ common_shutdown_1(void *generic_ptr)
>         set_cpu_present(boot_cpuid, false);
>         set_cpu_possible(boot_cpuid, false);
>         while (!cpumask_empty(cpu_present_mask))
> -               barrier();
> +               smp_mb();
>  #endif
>
>         /* If booted from SRM, reset some of the original environment. */
> --
> 2.53.0
>

This looks correct to me. halt() is not a memory-ordering primitive, so on
Alpha the secondary CPU needs a real mb() before stopping. Replacing the
boot CPU's compiler-only barrier() with smp_mb() also looks appropriate for
the polling loop. Looks like you have nailed down a long-standing memory
ordering bug, nice work!

I've applied this patch and, for what it's worth, tested it on my
AlphaServer ES40 to make sure there are no obvious regressions on a
non-EV7 platform. The system shuts down/reboots as expected with this
change applied.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

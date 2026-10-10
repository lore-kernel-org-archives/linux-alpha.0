Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C264B42050
	for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 23:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791675231; cv=pass; b=W53MHFfMJXlHL7yy7oA4/u9rjnTmOhyFCoXaJA0JO94EuNUWB2jjE+Vo90cPqjLGmkI9/atM+ejnCkpnAxTFZCc5eCp6QHns2x4/t8Ca0fgOa5vwJU2OdUcXT/TZN50ayurnTnsxfEI9vXBvNHgjS429OK74D45aMYz+lTUiHRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791675231; c=relaxed/simple;
	bh=8FrkyLXgZ5G0GaTgVylroaVCXzg1tp/UUKvMV38p9V8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jEGiJ3qtZccRfTwxmDfYr5YEjdFGzsnguLrEZxw/INxtmRTtFiXLyzsO6DK+B2OuCer1TpHofZgy4zavKVqfLF9ZVNTLFC01xe1xWiUvHUaIoQsIheT7LS9/QqS0GRQgyMe+4ubMjt+zLtVqpomDzPHjrXOI3+raqY0FGrJHX1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s7ryLHYz; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s7ryLHYz"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso904633e87.0
        for <linux-alpha@vger.kernel.org>; Sat, 10 Oct 2026 16:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791675228; cv=none;
        d=google.com; s=arc-20260327;
        b=m0REfUyE4PNJaZQNRa9Yu3YRaAbCQGo8Yn+9gco/cT/mVvOz61MgLLTlPSYfdBQOYK
         erlzeS0QfQ1Xk7cNEshUioXuT+TOnJ5fmqEoSn3p3i9tzBnGLRmrFacqHqKCXqLY7TX3
         dx0RjSecd+heNatge5WNbxtJtLa/vbNx50mTRWWEsZMy20w8bXBHDwtLYF5DMFT18c8i
         8iasKWi/RKGtZPkKvuwaagbNRGS65oV8IXwQ3B4z3Y/vBaIQiijCB05tXkQxVCwA3jEA
         VyKRtZZcvlLwEB988hyB5ih36az/0/BVKpPIfKp+l3FppSiSleLDqnnseyJmG6B8A4rn
         BWmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8FrkyLXgZ5G0GaTgVylroaVCXzg1tp/UUKvMV38p9V8=;
        fh=b9uTMCmM2x65kX1YEiH2p+xo5pDGCp7sowYQhTn/k3g=;
        b=sH+uOjbyLkby4DhQzDk6MSejo6LCSkS5jY1q5X18UUv2/knTP+bQoBfTFbpa1e3uG9
         b3FL2UQrG0BmYlp7rHEqKaQdnX3fiG8oqDhfwsN+AKsQpSu8caWrqVsAjsVic2gEofwi
         P8rjT4DzJUdc4dIndW+9UUwOXx6tKhBbH56KqFsd550SE8Y9/MfpYgkJoGSjhB1YJLjj
         FE6XxTS/2WChBxKmPremtl5Z8XqgwtDGdY4AlRjqM87E6oZXaJGyeecP27dTQrUQDQy3
         j7uXaZuxgp+cxgQUjEou0g0GFknvPFmKZxM+o5bPmTK/ikX0FRJQ0dYULb459M7cRFqz
         gazA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791675228; x=1792280028; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8FrkyLXgZ5G0GaTgVylroaVCXzg1tp/UUKvMV38p9V8=;
        b=s7ryLHYzJDdUyioofoZmnKcvWkpEQw6om8V2CilIkHDWfXHS7ggq6Vklq1hwhWfyIo
         M93PSo0K0W1GZhsPtNYdjOiopCOfO3nSOluOUdaUmhqevye9nUPbJbYaUDKvz806L7Kc
         WAYe5xnnKun65EsqRmHoi0Bz3hfDNcQf0YwH8+OzIWbOiekYlyTYepYnyx2QSLZ95dg4
         e1gaM+VIOx0T/TDAyLMMaTH4tzldt39+GrTFFUfdBg2QCmGc7PuV9JDz+CZGrtefFrIs
         kpAauDPej3qwcdIj7OZeQMTw+D1oftGf/q69FLQfaWSLODVm2WD3PIyHzunUa77tP3sD
         KfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791675228; x=1792280028;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8FrkyLXgZ5G0GaTgVylroaVCXzg1tp/UUKvMV38p9V8=;
        b=oyP06aj4RoYr3m4tM8AN9kwkflJ1N87Azmf9uu61GSNxRitQZbDI1GYUvF2Zj+kIb6
         y5p6AxBquFXV6NzneIt+D3ZNKAqSpIqE6BSIbUTvjGWlLVgR0pfa/m9SaO/BI+uT2eGs
         nCUCPrCQ6Y4Juq7lTo71Ed9GrQ0cUuPXmabnQI2Ia9ElKghY+JRgTK8F/zBzFYnCfq84
         GJn5yjkINHNkylEERegteOQL5CGU5V8MRk93//Xqdf1Sk5n3X7ZuPum8Z4YjySYX1MSs
         wsN9Jwr9HGoCqnW3JSLIds/p7L4dG03C7iE/T/BpEckECZpdiYcesfkDv6uAbPK0lC70
         G3nw==
X-Forwarded-Encrypted: i=1; AKwUvBwU30kmTp4P65TlJI916uhSZEkPp8DdOsOUqo+ftqn+2uYeGmSDZL25Fkji7luE5Dph+u7h6zimGc91Kg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLy2K84/GuQHTqutIXYrGUNvrVPVOB9RvAvyKr/XISNH372bsNj
	7tSG0QjnNDuHFGSdA0tA9plOl/cZ+13NFV5WDYM4NzeZAn7aci8veETXzWSDSIGhkDjRyEZvCMU
	63D5/w6jeXnocT0R4mgbBh8mlyX0WK1nf3FANrEc=
X-Gm-Gg: AYBFou0IwX/j0redmw0hzi6lca8mwSodnFi1Xf0I4pHk9b42kO6SVD40OoP5I6fEttw
	1alBR/BDq9kXnAVYwGcwmgXSz1ZdTT9yntSmQPUMAlojy9LqTYUIrfbGVZVbHk7oXrYjBNJQQWQ
	gsBgVLuN6LURvKK1m5qKUTQdm/9UbQYE0wClmDTcAO73bnyYMDa6HcAKp+thQf3QEM9P3l4kM4B
	J6+k8R3WdKcblN11xHprZ+ogKgOjapskJ6HPISz2M7ZPM6gNz7jX8tFt0uE0fm8vdgDk1350EDX
	CNUZ4i9eVXDe15M5Q3K5H/e/khXsauvMuh+79hSeE6gw41WZPd8eZaZoNkTQxQikSgX/0HnyXs7
	W1/IPwCznPw1vhC1NGzowCjvsWznYbrT+YxV+6RrecmnMkVnJgB30bbmKTJtmV1o+p6Rt00w=
X-Received: by 2002:a05:6512:2305:b0:5ba:418e:9913 with SMTP id
 2adb3069b0e04-5bcde8d8363mr1735148e87.62.1791675227528; Sat, 10 Oct 2026
 16:33:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010144621.974850-1-linmag7@gmail.com>
In-Reply-To: <20261010144621.974850-1-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 10 Oct 2026 19:33:35 -0400
X-Gm-Features: AclHuK_hLuowc_DKwILHBXlzx8Yc5uOUD_EuiTSAw_i_NewrbdFnoYRkbLyriZg
Message-ID: <CAEdQ38H2vCGo6EHqSJwQdNNdKuMHvTKyDWrey9vxvg-K6BnGbA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] alpha: complete the direct-mm shootdown fixes
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 10, 2026 at 16:33 +0200, Magnus Lindholm wrote:
> This is the second of two series. Apply all eight patches of "alpha: fix
> stale TLB translations breaking copy-on-write and writeback" v4 first,
> then these two patches. The base-commit and prerequisite-patch-id lines
> below describe that ordering from for-next at 33465f6ab697.

The first two prerequisite-patch-id lines (d194ee1170a4, 17df30a2da26) do
not match what is in for-next. for-next carries the v5 versions of "load
the MMU context when switch_mm() switches the current task" and "run
check_mmu_context() from finish_arch_post_lock_switch()". The other six
match, and both patches here apply unchanged on top, so this only matters
to someone following the cover letter literally.

> Fresh fork-throughput measurements and an SMP run under compaction are
> still pending for this revision. Targeted Alpha SMP, UP and SMP with
> compaction builds passed, as did a full ES40 CONFIG_COMPACTION=y build.

Thanks for being explicit about this. The current->mm test in
ipi_flush_mm_and_page() is the one change in v4 that no run has
exercised, and the series is in for-next already. I would like to see an
SMP soak with CONFIG_COMPACTION=y and compaction actually triggered
before this goes further.

I went through v4 again and both tags stand. In particular I checked
that the only caller reaching the ev5_switch_mm() store is
context_switch(); kthread_use_mm(), sched_force_init_mm() and
idle_task_exit() all pass current and take the __load_new_mm_context()
branch, so the arch_spin_unlock() argument covers every publication from
that store. Two small comments on patch 2.

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794346072;
	b=FdjgVhdSrDpfAiLEKEL8a8rqtcqFe1ZIA9ahtk/uyfNZL9qVpL2STK/9U8VYIB5Bb6xm
	 p0ZlPp28stZxXmLsUE3EeKi7WfG3wom8p4IO44ibLbx85Ykb5Nx+7M2EI35Ylca+NruFf
	 BSTAYOidXD7+2wI++UYumiot7+bTGr4mXPSLtNTOXWPQp0n4kQx7Ua2wnFQVWtsshWHke
	 KdYfr5fGCCKXBzeW0EkUVy9CYNbJ0zKffeMKFbHlPqrDwrAa1/hC4Rl8Ya5qVlJrbRmoC
	 odPHR2a/Zg5CA2UkuN+NJARY/1p/9lYmff1izca9tNg2Lx06PAxUalq8WKS/wyGYrtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LJYWTqt4MlGVhbCBzEZislQob+FWC2LtGnGQgjX3QTs=;
	b=jA4aqrkTU2Q/NOUdjf/7zUktkA7BdGaRDw7YLrFt4Eg1HdWtaq0x1BZvxGZLX1Egnlwp
	 y/NKlUFUfbEJ3wKZGIlzVAmLDz1mX5ZqoLrV1Wc2+x9eWSRD7MCP+hEpI5v6X3OaMu7X6
	 ErC14aOYkCyvh5NhM0I1NBeR1rj/Mu46lgfajoBNuzS5PTljzP3RIQNjIDOXyVvzaWOzs
	 u1MVhzXJPvMujzfuavC5dp3SqN+qSWWKeENBfbpvQ4e7S9WBGQuEG8dPopFlxl9j5BdmT
	 vjv3w+1OzlSm0cCTuNoLsTe+xhWlgac/xka33pMMVow/g2+0TZYWVzZNzrzWk/Sjrig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=njZRWC3M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632EE606A31C
	for <linux-alpha@vger.kernel.org>; Tue, 10 Nov 2026 21:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 632EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=njZRWC3M
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ac97e45a79so20406171fa.3
        for <linux-alpha@vger.kernel.org>; Tue, 10 Nov 2026 13:27:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794346071; cv=none;
        d=google.com; s=arc-20260327;
        b=DmjfGpOkbN4wKyinnGBhyF9c2i6lzwqrrci48BQrISWuN7XgNngc1QNSqqa4yiLDpf
         3c0jHaMVdTvEDgtl6rsVAi/fuR0FXsPuj7wXj4la3jwgl44vk0+WM9Olo9gpHbuEUBrQ
         KXsrCuBEYX8igXTTtF8TOS+ppzEZxh8VG1Nk9r5+4YC6g37sQcMLY+17dhZgSvd0YEn5
         C6NL4fH6JiqLQDIaN7GMqeHFY/mCdRPhN7FeT1iaMrYh4e47TxqkH3+VI9X4WE8y5Klr
         6HKcqh/4iW2gKkbLycMvinh9RhAJW69F2DbuChgc0SC9BFixJbusxqcSHuPT35p/P6oX
         pMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LJYWTqt4MlGVhbCBzEZislQob+FWC2LtGnGQgjX3QTs=;
        fh=aKUDEyg4NOs3IcPqiuv6MJq/IDvFKkX4x4hGrWuHG74=;
        b=gz7WrpPq19JNBHhagq1nMIthDEm1NQ7uImt1vG7q1Or7JR9ZHOa6DCUniMFLUoaLs5
         Gz25NQjctdJ2O8TRt8hQRaaXrU79Rd8oQqVia4phfthulE7tX/ltU1hmXHWKFbZTj8Ni
         PhFgJxPLGgAUktz/0l3KsDkXf7wjcynM0gFi9Dja5bzeXugX+zNMpIvGWMlVyX/mNAZd
         Kb+FgU31oklvOVz5+8FDRVTF+WLZ7qQVKKVOvNcGmtx9y1B8DB36BqrbangpRrlpUU+W
         l4SOJRQzI7hPfCvARszN5xIlVypF418B3JxsdrGu+4eb+dA7bU1W2SqYv3SSebeYPZR9
         E36Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794346071; x=1794950871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LJYWTqt4MlGVhbCBzEZislQob+FWC2LtGnGQgjX3QTs=;
        b=njZRWC3Mnr/LepxZRqp5QrOLDAtEW5XnfFDEhpEnHalQVLjSVvDmxLWv7Tc9MHNrDP
         lB5NEivjGrbuIRRFvuyOYrFEhvUJNmjfNyYXwHQ5VfYITNryvv6k7TH1Xm7qNkKUlAEx
         kfCN6Y1u1RO1eAHeCJudb2DZ1g6oJxS/ju6smcNQfXze5KYxzNZ4VvVXVvb+a5F6uyXw
         Uur1w4+OqTkCJxwkZkIYD96elyD8pv3VnpztAecXIYH0RvjDb/EaIWtuwhf2QrFxaTXp
         xQvavK8p377TSyvddHCzwh6hWljVOjXAubNchoa030tYKhhbqf8HX7ASvty2ANhMI8K6
         dQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794346071; x=1794950871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LJYWTqt4MlGVhbCBzEZislQob+FWC2LtGnGQgjX3QTs=;
        b=Chx/wofLvSYOZ+ZcZPdx4xmljs1Qh6z1lbk7tgeqhmbkf0eUheBkMNxK+6zvui3e32
         lWMeYqmoXHRNzL8WMrOaExTwqpwbvIv3rdp34yIwtLEaoTwI0c/MaiOp2HsgXvapSp5F
         OieOls7n/9P2rey8aTi41zsdnemEUNB3UJTX8KQRvaJuUloTmbL8mC6NgXDYm4QIBVuc
         4ljArSgPrtggsNpWqQJYJC6phV3FmfWNHiaTR+BBSqF/ISr6I+lrAhcMLQATQKKhQMSy
         /Rc9PFxgO9dYN507xseKHAGcb903pldOPRokyEgN7mlaxdTTBACHub9YyJvsLbTc02IT
         8nQA==
X-Forwarded-Encrypted: i=1; AL+hErG/zhWiWgNPv4TDRR/wQxiIiyUX8oxwjwNqUEh9F+Kq/5B4WTiTDXnkwrM1gn48uJ96fN/8Va6hchvIOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z89ce5iMawCLC52FsW7sBg0R2znS+ZEmQCYsZyhFL2LqiYW+Z6k
	tSc5E2JT7bEwQxLkWdviUebZuNbnihJ/VLDQpoWbJmxzNtO7BUQMyrrbN2f89mxBCIQO4M7YfUJ
	KbE/Y8FQWctU86ZO65X6DnRsg6APjIQKScM7Vbes=
X-Gm-Gg: AYBFou3bHh2YqvWrc1oZk/2HqC0yrkSYjXugPVZri+qMXAW7cQXMDmJEfyF5T406qFM
	c1dbfgLLgrx9rsdGhn+sGfMonTbYRndMX8AgeocEiBkBLGeyJajuZrAyEs6wWNbfDendtmwFx5d
	141de33sel3Ec+3QkXifZDM8gxXZVaXAgYTDMKkW9JwEW1x0HN5nrZz+F7kuzaDPx5owqhBSZH0
	gpqJsUQrLc9C3cTnM8qnKE7CPnfIPpflfsXPQXUGzv7SAhGfnIzU/pZdp8QIQvfo9P9qGgPub3L
	7bHC8KVYLmu+1GRVN8G23CEnFd3WPgHa7EiHwO2cZTIWvZyT9Lukizl8zOXH50Uu6etW9N47uHo
	f5R/fPyhKcBsLfZ6QvklHjCQ53xRvZ6MNWlGyd4LKghFz2GlafJrBpQN6VmuAPkeXduARrARgAU
	ribIIyTCCzC/rE4ONnZ8+MwIwLNxDk1l/RwRr5iIeD9Lml7zpBwamE
X-Received: by 2002:a05:651c:a345:b0:3a9:79d6:c792 with SMTP id
 38308e7fff4ca-3ae126698e9mr229911fa.5.1794346070392; Tue, 10 Nov 2026
 13:27:50 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110193134.1151112-1-linmag7@gmail.com> <20261110193134.1151112-2-linmag7@gmail.com>
In-Reply-To: <20261110193134.1151112-2-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 10 Nov 2026 16:27:37 -0500
X-Gm-Features: AclHuK_ZQSrlW-ipLLlYAsRhNuirxmBHoyF3qeb3-GIgttVflKhFwsA5XrvXqdg
Message-ID: <CAEdQ38GVjPFJAea1oM_SX4hH2ER2zDiyojE6VdXRFFNWkvvwXw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] alpha/perf: Account for time spent handling PMU interrupts
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:31=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
> Alpha does not report PMU interrupt duration to perf, preventing its
> adaptive throttling from reducing an excessively costly sampling rate.
> Short sampling periods can leave the machine unresponsive with RCU
> grace-period kthread starvation reports.

[snip]

>  #include <asm/hwrpb.h>
> +#include <asm/timex.h>

<linux/timex.h> is the usual include for get_cycles(), though it makes
no practical difference here.

[snip]

> @@ -862,11 +869,28 @@ static void alpha_perf_event_irq_handler(unsigned l=
ong la_ptr,
>
>
>
> +/* sched_clock() is tick-based on Alpha; measure a short same-CPU interv=
al. */
> +static void alpha_perf_event_irq_handler(unsigned long la_ptr,
> +                                      struct pt_regs *regs)

Since you're touching this spot anyway, you could drop two of the three
blank lines above the new function.

Neither of these needs a respin. If you end up sending a v3 for some
other reason, feel free to fold them in.

The mult/shift version looks good. cycles_t is 32 bits, so the
subtraction is fine across a wrap, and init_hw_perf_events() runs well
after time_init() has settled est_cycle_freq. I built it here with W=3D1
and got no warnings, and the handler has no divide in it.

Thanks!

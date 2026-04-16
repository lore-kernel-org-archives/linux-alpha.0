Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0B53A3814
	for <linux-alpha@vger.kernel.org>; Thu, 16 Apr 2026 10:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776335412; cv=none; b=A+sHV1y8SYgK3IiqB0ByjV/3yqD+hTcJ5ll1yk60CZ0jAytZ/NHkxPoyk6PHdokCljWWbo8PQ2srEL5pW5kx/IlkFnH5I/ygAwVb+DaCXPxGXMSWMo5d+V+VDgP4ryrpvGZMgUPcUZ3nhdAfkMPUy3rMAtchyuYdc2NSWO+Sxtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776335412; c=relaxed/simple;
	bh=Il5EilNKbQmVM1qv4XgxLAe02Z9+zxydkwUqJc2BPRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=susDmDzLZdlSUKG5MSdeoQXjwfLIp/c4ZDP/buACB1nryoJt/ytOpkrzAtKFfS0fFqo54eDx6KTb96W5r1y306XRZdirc4wFMiaYhM7PhF0fPnaU+NAC0O32OY8Xhb8Qc6DByn/DCqXVtQO9Bqksy7yCyVmZAEq258KRUYv1XQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-470145d7df5so4648931b6e.0
        for <linux-alpha@vger.kernel.org>; Thu, 16 Apr 2026 03:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776335408; x=1776940208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9HEDsaws+1AaPEcUyrGjtCss1Kv3jZQFAB8Oib7mmY=;
        b=bAO9GDl3JpDUp2YVG/r3ShZRK0z+rK1juud1c5wY78Z+ZUcVzriff6vY6Iy0VRDI38
         2pzqAKJjKsNITH4wYcyXcqKS8EQq0nCP5HdFhyv8k6vGuJCCqdOIgzDAwgETSCDDj5vH
         /pjSgzC3xg1daVUIJhclB2MRu3JXByGuvgIEvGf3yZ/Btd8LDCQpSxTBRUGCnQ0WNpSi
         X7N9ryiwte5Smeqz2OMs9ADFcEf3MhIeQ3t5rzN5SaU0Ly3UFWtAXr6MTUOQXHZNBiry
         E7O8XUnMcMkx3njHNxlnPMr9R0wEQOpJztx3ZFrLTJeI9KodnvRA8hYY66zbc6UI+Ji+
         01xw==
X-Forwarded-Encrypted: i=1; AFNElJ+i/uJsxFItY5nC7MKtfc76b9J9lqQnn/HQrpuE6ENrO3Dli1ZZfxYIr20SBl7OyBWMwtT3umSaq0NysQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWXtL2C0KWws/ar+yXnbSe6Pv6XrW1XMTcbgddMPVWEkVrhqVW
	8hq5zKf8G6E6ZXV2roWfGZ6W2eBkqLabsxMrtm+ft4nnQvP6UPlc04H7Gt3mYScV
X-Gm-Gg: AeBDievfP+DZF9UjUKADYryX9VPlsgzuUtaY6g6x+qvVErdpKcKvT/KpzGigylrqHLT
	nrwqMdEUps6FbyCayfkgLszTg8Wa/r5FzG6JJIWVrdrYwRktYfFOb7BtsGepwmgMu9Y6rUy+hkA
	ZoD+5QjllHGSke7a7hsBenVd6KrNtnC01NtmSUVUQ8189oR1o9QBQlpUGN1hfDqr0KHg3LrhQRg
	wOgP53MLcqZ/LIpE2NBuTiWqFat3QajuKOmD9x2vTJm8Wf6hvTyhr8I5kaomSX4gDQUKhEOGcsb
	8ximN1GFJ9bmv84SwFsvjBHp6Re2SNxmGq9ZLyXocxSnCLhiXCMlHtd4Ll1zyitaVfcWepQtX3X
	XK60howugqX+8xkHiKjELrlC3KeK1YvtCAAj3QRyYyoLBJY3LVry+sD3qPvll2nX2kq7IkKBy6D
	wyh93aDKjAZPaZstwsXM8uL/5vwwVTJ6MV/EYuio4AJ82FnsDfWVcsCSAmouqXJ4oVWwNP9VA=
X-Received: by 2002:a05:6808:c1f7:b0:45c:75ec:b9b3 with SMTP id 5614622812f47-4789ca3b128mr13160824b6e.9.1776335408435;
        Thu, 16 Apr 2026 03:30:08 -0700 (PDT)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com. [209.85.161.53])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4797a07cfe0sm2370425b6e.0.2026.04.16.03.30.07
        for <linux-alpha@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 03:30:08 -0700 (PDT)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-679b072ed3aso3572658eaf.1
        for <linux-alpha@vger.kernel.org>; Thu, 16 Apr 2026 03:30:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9LOMNCiDnGfWza7zBsWz9mc4Eg0qDbeHihlHw8foGBewNlrc4kOMgCCtdkaVIXGyRi+YGjeNrC/dmxjw==@vger.kernel.org
X-Received: by 2002:a05:6102:c48:b0:608:cd24:354c with SMTP id
 ada2fe7eead31-609fe9b0d22mr11966750137.3.1776335071251; Thu, 16 Apr 2026
 03:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120318.794680738@kernel.org>
In-Reply-To: <20260410120318.794680738@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 12:24:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVerN6Pz07CQH+hcvT=-ZD-r9VNrSrGzTQZBEsuecK_ig@mail.gmail.com>
X-Gm-Features: AQROBzDRGGELVSySTko37h6zEj8YoV3p6pwZDCVQUlUW6sZbw_W5mbJzFIh35nQ
Message-ID: <CAMuHMdVerN6Pz07CQH+hcvT=-ZD-r9VNrSrGzTQZBEsuecK_ig@mail.gmail.com>
Subject: Re: [patch 18/38] lib/tests: Replace get_cycles() with ktime_get()
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

On Fri, 10 Apr 2026 at 14:20, Thomas Gleixner <tglx@kernel.org> wrote:
> get_cycles() is the historical access to a fine grained time source, but it
> is a suboptimal choice for two reasons:
>
>    - get_cycles() is not guaranteed to be supported and functional on all
>      systems/platforms. If not supported or not functional it returns 0,
>      which makes benchmarking moot.
>
>    - get_cycles() returns the raw counter value of whatever the
>      architecture platform provides. The original x86 Time Stamp Counter
>      (TSC) was despite its name tied to the actual CPU core frequency.
>      That's not longer the case. So the counter value is only meaningful
>      when the CPU operates at the same frequency as the TSC or the value is
>      adjusted to the actual CPU frequency. Other architectures and
>      platforms provide similar disjunct counters via get_cycles(), so the
>      result is operations per BOGO-cycles, which is not really meaningful.
>
> Use ktime_get() instead which provides nanosecond timestamps with the
> granularity of the underlying hardware counter, which is not different to
> the variety of get_cycles() implementations.
>
> This provides at least understandable metrics, i.e. operations/nanoseconds,
> and is available on all platforms. As with get_cycles() the result might
> have to be put into relation with the CPU operating frequency, but that's
> not any different.
>
> This is part of a larger effort to remove get_cycles() usage from
> non-architecture code.
>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

Thanks for your patch!

> --- a/lib/interval_tree_test.c
> +++ b/lib/interval_tree_test.c
> @@ -65,13 +65,13 @@ static void init(void)
>  static int basic_check(void)
>  {
>         int i, j;
> -       cycles_t time1, time2, time;
> +       ktime_t time1, time2, time;
>
>         printk(KERN_ALERT "interval tree insert/remove");
>
>         init();
>
> -       time1 = get_cycles();
> +       time1 = ktime_get();
>
>         for (i = 0; i < perf_loops; i++) {
>                 for (j = 0; j < nnodes; j++)
> @@ -80,11 +80,11 @@ static int basic_check(void)
>                         interval_tree_remove(nodes + j, &root);
>         }
>
> -       time2 = get_cycles();
> +       time2 = ktime_get();
>         time = time2 - time1;
>
>         time = div_u64(time, perf_loops);
> -       printk(" -> %llu cycles\n", (unsigned long long)time);
> +       printk(" -> %llu nsecs\n", (unsigned long long)time);

While cycles_t was unsigned long or long long, ktime_t is always s64,
so "%lld", and the cast can be dropped (everywhere).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

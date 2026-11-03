Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793692012;
	b=2ljnZy2zQ3rmCiv3Tyg+vvbpAJeBjveq9Kaujmq5aNfEGTYO4gWWECOADEqSJLYfR5Uq
	 0knn03PP0nx4DQG2o795SWZ4nD9Y5B22S2da5+XEyD/p3rWB6Wxgdtu82jPFX3CDqi3L0
	 0XqeDQgYD5Yjml2xZ6dGjMdzLLCErj7O/+qFhVKyAP4mMse/1au8fkOGgXpKXttulyQi1
	 5Je6FlGjdGtG2+5Q71sXoEncjzovI6lqZAjOAdNsVn5BNt1mgop2DRwI3qJt/NFY3GE2V
	 Ir6YDOrXcV49/13vklyryqtHCh24tjGpR0ws0K71rV1nrJ3x5VelK6zmn/WCqqfRdIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8QBB6SDvL82bQ+9NTShsWyttaad3ZVjOHNfU0QwklhE=;
	b=KcjDzucjoedsm796cXCkHqiSnXKYJhld2EfHHl9Oeaj9qezvv/Bokg+Iguy4xaNrv/J2
	 nAXoT+U4QDGy4cJMgKb94UPrqHkM8jUUMML/94Jm692Gz+3TYfWazWOusHQYYvhopXFTd
	 1FmHzZlYsA8rgww57LJ31eQAaUHmBIyE0Hc+97g7Ln6IfSe6a2+i0szvDg95q2OQkGjvQ
	 G18wsbX6JhDygW4MtgnxAgaXP6maog51LjseMQ+pZ0usQUnCCgfWCDhnLPFuLhY45lCT8
	 PufCHf3pFSNLL42mFX3mwjaagi4vjuK/uXP6zHoOa6rtEdLlTNyf6xJYk1j4jQ5MJSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoObrpEZ;
	arc=fail smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDA9606A32D
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 07:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DDA9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoObrpEZ
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-675617e81f9so3444448d50.3
        for <linux-alpha@vger.kernel.org>; Mon, 02 Nov 2026 23:46:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793692011; cv=none;
        d=google.com; s=arc-20260327;
        b=e5tzy/z9LVrqCkvSiS9UJqan24Oxym0wY58aJvunMCh2ZnRXEewjD8Lre0N15ZBds8
         fJaGLp0pjGxZrvR3nlphJ0C1PgNmuFcJUy4dn4eP2EPWmtPOgJJtoHlFxQ4VWJ9g0v1W
         06heggseGv3aTVuVWMK98EwpnUUn1N4UuWMV9qNX6CkY95/fGd7UNMXNnetVcUevIb1B
         p3t+tpECQv1QFtWY4xJg8ifa6/qZrhIyzYfl8j5uGnoBsYyfm6mRhAAXXQNS073tuZI+
         571AepoKCvwHpeap0sQFkqfYAefEFjfr9sX1kUni/NzeXBRhIWT4dQEOsv5rdqxLyb6a
         qu8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8QBB6SDvL82bQ+9NTShsWyttaad3ZVjOHNfU0QwklhE=;
        fh=ExSt1Xre/zv4WMkjK3nlO5o99X4tGdp+R8Q4eCP+laE=;
        b=nWwFW/uPdR4B29GQ0j6x2Uid65Z8woBBaAwiOqN5lLOkgqpJoGdmWAIckgO8GTJKtJ
         tUtyHlFMY+apf9KKKz+j+BR8qxdO8Y6SlRZ4m4cqkpC5uPOXwH8eT93F0lew+BAPuzBO
         fLS7CyteBRYuiH2BKCQUKQwddsEGF+KLDN7dQ7mXYrTyKBRFrO3scGfscNvdeZUXhg0w
         C/pZW1oWHy2OSoHpyw5t5LRyuhp6QdzWNhm9BK3XUi45BqTQG/2CqkpkU8xITYW+pumW
         aV3xz0dxx1kSHWoPaCJ+nI80+4T60wD1n89moCd4U9+51fLw0g+7FgoGbqQdRVxpxXrN
         FE1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793692011; x=1794296811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8QBB6SDvL82bQ+9NTShsWyttaad3ZVjOHNfU0QwklhE=;
        b=JoObrpEZLzoADc7vD7Bvwr5FOjMe2z2qyfiWuB5TZ6HoTdsGXNds3QjmcunW/2LkYQ
         c9QnBcpfgW1ZFWmGdDTS0FWrwYInfCzBz2GQ/yp9732zJ8bnK7ys6/xmyB2dmoQALcj6
         PHJV369w0CnTtYPw2hr2lPgCkkAsCH6lzDw04OnYoGNW83SRgkc6qOcsYRXlGyAoAdbY
         Fz5IObINtZLQx3qA7bfhpadKcdNK8gk/SbtT3tfXHN6czae/KIHA8uR6VxXt4nRl3nA6
         FC7GntIuHqRVB9vEv8vnRjLYM9M3Zh+aRigSTYEiCG3nWTcy6NfwcWYYYiqhCr5uQry8
         ZbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793692011; x=1794296811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8QBB6SDvL82bQ+9NTShsWyttaad3ZVjOHNfU0QwklhE=;
        b=YrkijS+MveA2ILXsMh62szyrpjQjZRqKzl6/ydBflPZs245IhH9NhpoMocYsXWDmfl
         ljgzSpVoyHQYTUpsRqAzafpSSdJDT6hRIS9YJZ3zTfqlluyMSQd7VXNlE+B92Mp9x0yk
         AeEGn/z/hXVFubRQqNJt5Zq6xiIAs435117by4JdZLbTSGtkgeMAihXHg0K4L71k3tLh
         q5q4HlbV9iDk5gsaMVCGWD0vvYqKsBArD+LBCCYDosPlKZSNP6v5s2i5H6pn6TroQrUZ
         pCsKVuM/ODSmT/HgjPCiAqQSW2sZi+3giZIOrV4CkLyr4nVXmwOQ11ik4IyFgVYiBj2X
         Qi3g==
X-Forwarded-Encrypted: i=1; AKwUvBzOxRtBPcIBXey+IFVH7vuz0CUIg6QIJ3xeRPNdxZ9Px/9o/Yxvac7aoCMiv8jdeoIlWGFMSXfg+heffQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9WTbilAb1XFnowdleQTdtsHvsFmcEQumT4layBueWZmcyuu0vZ
	LzKsMntPeZG70TBPJEaq3W5Zh0hEovx2SRcj+8UzWCXvKhHEH2YxK6eVwwn7CaEyDyNyC1XFVdU
	YqqwXxWPEHoz4DkEQOdmhllyI55mDvOw=
X-Gm-Gg: AYBFou3WqbXp+UEqYYvjrcG115B2ZMRDIYPFrR34FA9hbhCqgJBC4G9trqpLj4Xye54
	GQ+nKycEkqvUYxjg3dcyLtKJgTla6BV5GWyGw35bPpCimdIt2ImuOmmGMVeR3uNyj+fKxJCoUY0
	ps87L67ic4A/wuaiX8K3NM0wMkF553iIxcWtKU2yyH91qDNvOg90aOX2IfItEsseBeEG/yKdsXZ
	mSKv7eIMZPzPSf1DeJZwIkvUCLlT0R467oL/Gw4nOcGZ/ciuGwIUonqJ8KkUCS2EvTFemP9nTFT
	hKS4P5gfWBI4qTo4nC8vT8jaqPoTDCKsbG96yBby19/I1PNznFq11OJ+UWDrskTgtdrhl+f7PdN
	ksIS7Cn98/WobGqvpay5veuop/IoAdPw4JFq+2AEhBUhIFE+PUcheWwSF+v/aWVPvus09bmQTJ8
	XX4TjKmvA/GUU52LA=
X-Received: by 2002:a53:ac84:0:b0:67a:86a1:699f with SMTP id
 956f58d0204a3-67ba4c87fa1mr7869443d50.6.1793692011225; Mon, 02 Nov 2026
 23:46:51 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com> <20261102-alpha-profileme-v4-3-61e00f5e1da8@gmail.com>
In-Reply-To: <20261102-alpha-profileme-v4-3-61e00f5e1da8@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 3 Nov 2026 08:46:38 +0100
X-Gm-Features: AclHuK8W3aUGX7Fqw-nFhXB97QbZ2QNQORFdHiiKISHMfzT0-PRxCJAhJHGQpLY
Message-ID: <CA+=Fv5TQHTUBoP71y4HZ94Vg1k-mj9OZA_cBWs0bW1e+tnoTnA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] alpha/perf: clear PERF_HES_UPTODATE when an event
 starts counting
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
> alpha_pmu_add() sets PERF_HES_UPTODATE and maybe_change_configuration()
> then programs and enables the counter, but nothing clears the flag until
> the first alpha_pmu_start(). In that window alpha_pmu_stop() with
> PERF_EF_UPDATE skips the count update, because the flag claims the count
> is current. Since the next reload rewrites the counter, everything
> counted since the event was added is lost.
>
> perf_adjust_freq_unthr_events() does this on the first tick
> after an event in frequency mode is scheduled in, which is the default
> for perf record, and it then sees no count to adjust the period with.
>
> Clear the flag where the event starts counting. alpha_pmu_add() cannot
> do it, since the event is not programmed until the PMU is enabled, and
> stopping it before then must not read the counter.
>
> Fixes: a4eaf7f14675 ("perf: Rework the PMU methods")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/perf_event.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_even=
t.c
> index 70840c05d39b..ecec78c355cd 100644
> --- a/arch/alpha/kernel/perf_event.c
> +++ b/arch/alpha/kernel/perf_event.c
> @@ -456,8 +456,11 @@ static void maybe_change_configuration(struct cpu_hw=
_events *cpuc)
>                         cpuc->current_idx[j] =3D idx;
>                 }
>
> -               if (!(hwc->state & PERF_HES_STOPPED))
> +               if (!(hwc->state & PERF_HES_STOPPED)) {
> +                       /* The counter is live, so hwc->prev_count will g=
o stale. */
> +                       hwc->state &=3D ~PERF_HES_UPTODATE;
>                         cpuc->idx_mask |=3D (1<<cpuc->current_idx[j]);
> +               }
>         }
>         cpuc->config =3D cpuc->event[0]->hw.config_base;
>  }
>
> --
> 2.55.0
>

Tested on my AlphaServer ES40. On all three CPUs, the cycle count
included the work done before the first stop and reload. Frequency-mode
sampling also passed.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>

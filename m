Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793737981;
	b=lAjlIxyoK7ngCNSH7JdFe7WHksQm/Aik8/l0xJ1EH97bh4D4+R4p/iYxEo/Z1AhsRZBZ
	 e/a+LS5BrIj8nOcy0wPLH4AiVpgWEadI4lsynn/pR00EUANnLO7DWVBg+Bj3yWT0fCIzI
	 HlmHn/6EfZSzIGk3JJQt6kZPcZaHLbeyGkVsZlgLVsfU2y25TcSr/f5u9yMz19H/LIwke
	 1R/T5cXo30bUtgZVF60RaP/McpNDabHb3l8JxUhFBfWIQ11uQS0Lb01jlpd+7M5G54GxR
	 HsCgxgH30Pu185raDp1ePT8/KTuopahAK7lH/Qxj5SpvOvZZ+Iga0uFkhmX6LYeyCPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gg+W2EgP56N1Sf6e0W1B3Tc564yhByMeGofGsIPeu+U=;
	b=dXegZtIZ3nGTO9ycBfI//F1fHvR94CoMdd7aRuB1vAzl/UsSPQVASVO65CK5+lHD2qVc
	 YY18mP+ieh0L5ff9lo5w39Zxwt1kM6d9UsostXqZi9g/5HpHRELjnSSBnaWbfck4429Lw
	 kkTWONmKLShc2QkR5tSpp0C23RYE54Kqk6rw9fryMWR5GhP5IFHoEl26WGMRwU6J6jHS9
	 W7RCpOCZyk/1YWT2JSYsxWS3Ou4b/HKjmzDrgoZhVlZb0wqE+m0fBm+Q97BofYeo5e7jN
	 w9/FCjUj4gC11B31nxe5u4DvWpATm7tcx3bjLnAJK0zkTH0EVbkZBCyKm0W3ttwDjNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jm9h17sU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29851606A31B
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 20:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29851606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jm9h17sU
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so271111fa.2
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 12:33:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793737979; cv=none;
        d=google.com; s=arc-20260327;
        b=OMz2a3KjIbCU/lFxnHHOaPsrzXPi1F1+ZI49F+ux/BrNN/hqiogMpe0kCX/U+NFlkn
         BBMDpaQ2n9lP5CjjiDiUxur+qd0bsPlf7tNoqeBsGzyx7SXouO1n6M3Wvm27jhB/6I85
         FkszbE8XQ1WB7qGyRTh7k26eQwidlRg9Llg7xFqxZReQtowa2NrRrv0Yqqaok2JRHzpl
         jA46EzwxhOrS7ICcG8/rRFGfErZUibgArP3/yIRlr2bV6ICu7muhTpS3N+44FGBSs0Yn
         WVfu10lc+x09N9/vzSkhkTqrn5MddQgyzZjA5JwHH4j/VrRWtQSzkRid/oi8qjhBDfWy
         lIAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gg+W2EgP56N1Sf6e0W1B3Tc564yhByMeGofGsIPeu+U=;
        fh=HYmIV3qT9YdpWrCgGRO/knowVcaOS9hRH4Nr4Ki3zbo=;
        b=ZWdOuT3aKiY7ja+hhJR1ClZlVoGLY2OAfT/UzY8GYJ+5D0B3lb1O5wWsZDBh87yr9R
         HwrmUQ2mKJowFqUquC7FeHZYw6fnmucH2Sxm3pVhdZNBqB+4ACXQmikj5MydU3rUkovJ
         bEJ6DsB46Ul0gpvnevBZSX7JzuH3Y0UrIFBFXHdHXU7GPMmj4jLyquSARtZtBUlloD1L
         h3QH12o6SxOIOqo35pQauc9fuLYlTguYgHzAtU4nsPJGWyxE/JMCMg1+jkTcR3U8e0Ny
         pnSUSF+Qiz4NMNWy3vID3I19SFRpelIdXQ0PIluCvoSMwreSJJKbBJkKRH2iCcouYnsf
         uLcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737979; x=1794342779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gg+W2EgP56N1Sf6e0W1B3Tc564yhByMeGofGsIPeu+U=;
        b=Jm9h17sUzBa0J1wZjuoUGLG8nXwDfKaiZdnwQV8i0Z5rIyLWtnFizG54Mb8VhuEFNX
         rW7Y4rc1FmE2eQGibXhlfFcLCv/cANTCjYmEA3X0qB/wSffc+Jue8m0ZrTj91g/ysaH3
         II453nGlC1agps4Kl22gBYgtJAmrJewCpfylTLwG8ckuEdaqaCxeknDvLnvo8KkYqMMr
         oN1Hk4uuEJ4jQ2j8NVNpkyQEC2uRRabXtMqJv3w2Gpxh7olpRi4CGgDHr79l4gcpAzUT
         M7UJMSMiGL6ExHwGMnOskz1O2ZQopyzLk9ZiQ+5rpbFdRZFhlLgNMm/Pm5gCb6nLX0Gh
         Mdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737979; x=1794342779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gg+W2EgP56N1Sf6e0W1B3Tc564yhByMeGofGsIPeu+U=;
        b=X2WwchVF+00ztmsXbx4zjsRzY02yIpdlru0uYsMArldWHKyqoyE3iW43wdhhEsQe9V
         IOHrhJdamsslWi2wuJlallnJzV+/2oTOBJF8KtLd6yoNE6ZM0q1owYbp2j2eS6hg21M1
         yxkeVLIf9YuSqRzmeDXdxj5ByGwnTNB4+/pgN5lndE5IsZC6AFwXO+VZ7VoWczUWb7A7
         NTvLF8Z8iOFxV698tx0Gaozx+LAzegzODQCc8Zmw1cs1VWOG7UwdHI6I1YU2Qt6SHTuz
         4fpG5JfLk/YHcXLikPrxc+7fPad06HbdBmFacKKagR2rHxjUBz8tmM/dQbCqQJrD8Wxg
         Et8w==
X-Forwarded-Encrypted: i=1; AKwUvByK8SgDjbwfHf09ef/+MUD176z687g+FnShM1qaUmYW6Gyeg+XNMWL8opwCKYg2UBChWFdTKJS9co1rfw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9gSx/pN3x/Em053llISrlgyaSzxvlCJISiRMtPrp63EjZMHZqG
	LT1gSjT8oE112BOn+4EJWBwwSkJvnimiFOOaa7otiqDtvWBp+wE6mLezrK5B08ETmeixHKvklyF
	GVmptddAMc6BRnUcIcIJIPtXWxaQUg9E=
X-Gm-Gg: AYBFou29M96RkQAOyw8cDZwWnNRw5Zo61gg+/E7ix0xzalwsaVwZdtCehEfNYVDbgcb
	P+jE65dUk4wl8C4fI1mYl/+mCMLr1iTOab3z23cRi1XTFiga/DtdZqE1KugMXbjvmyLcFi4yfBe
	ZDPf5UGXhFuWqeHOV4N6B1XBBrH4GmT/9WWwqiw5hGzwGUOU2cBnpXlFxeUx8xUH8uoQxv9Gv82
	N+AGazCHjOa0cEdq71tyVL5lWx2B1plud4+B0aX56umX5z1Ozxpd9aHcSd6cU5EMaXDZqbhiWkw
	a6ay8gIH4ERxyom7ujxyck5egPYUy0r8TvJg8ngy1E1yZ9E8GgKmKBUzYmpHf3xi+B/PF8uHsZR
	eS0LzB5MlReJJTVIEZw50aJtI1Czt7JMMIctG/t0Gc+oC/0Ig6jwbM0S8OLP5Wu4f2nzbMjpeHi
	c8J3HZ0tcfU+m+Fxqyp48G8NTq2nfLwlOeduQTBBphO+WFT/elLiprk+ZPVqm4UpcSdcSuupe06
	Q==
X-Received: by 2002:a05:651c:a0cf:10b0:3a6:58fb:8540 with SMTP id
 38308e7fff4ca-3acb7b2ae3fmr23751711fa.19.1793737979205; Tue, 03 Nov 2026
 12:32:59 -0800 (PST)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com> <CAP-5=fWC7AM9aAsHaZvQVXznYzVp5FRQtH=vu2xxQys7QWvCQg@mail.gmail.com>
In-Reply-To: <CAP-5=fWC7AM9aAsHaZvQVXznYzVp5FRQtH=vu2xxQys7QWvCQg@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 3 Nov 2026 15:32:47 -0500
X-Gm-Features: AclHuK_DMhE10jbZfTykItRyJaRbazl8IY4r3kkMT9nMEXLGWMUP-9x3lCLMK38
Message-ID: <CAEdQ38GGq6Dsq+daBNKsPOWtR8h6+KcdvaVqrxd24Dd3QJhZwA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] alpha/perf: add ProfileMe sampling
To: Ian Rogers <irogers@google.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 10:29=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
> [...] I have a suggestion about the rest of the data, which is
> currently only reachable through PERF_SAMPLE_RAW. Raising it now since
> it's easier to shape before the uapi lands.

Thanks, Ian. This is incredibly valuable feedback. I really appreciate
you taking the time to write this!

I've done all of these in v5, as patches 8 to 11.

> The PCTR1 window count looks like a natural fit for
> PERF_SAMPLE_WEIGHT_STRUCT.

Patch 8 does it as you suggested, and only when the sample's IP is the
profiled instruction. On the ES47 the weight matched PCTR1 in the raw
record in every exact sample, and was 0 in the PALmode ones.

> Similarly, if any I_STAT trap types identify a memory event, a DTB
> miss on a load or store say, setting PERF_SAMPLE_DATA_SRC (mem_op,
> mem_dtlb) for those samples would make them visible to the memory
> sort keys.

Patch 9. The DTB miss trap types map to an L1 mem_dtlb miss. I_STAT
does not say whether it was a load or a store, so mem_op comes from the
opcode. A test touching one word per page got LOAD and STORE as
expected.

One thing turned up while testing: an instruction killed before it was
mapped can have TRP and MIS set, even when it is not a branch. So
those bits are ignored when PM_KILLED_BM is set.

> The remaining status bits (retired/killed, mispredict, trap) don't
> have a generic home, but they'd make useful filters

Patch 10 adds retired, mispredict and trapped in config1. As with SPE's
event_filter, a sample must match every bit that is set. Dropped
samples still go through perf_event_account_interrupt().

> Since PEBS and IBS op only sample retired instructions, it may even
> make sense for precise_ip to imply retired-only, leaving the profileme
> bit for the unfiltered view.

Patch 11, kept separate since it changes the default. On a loop with a
randomly mispredicted branch, 19% of the unfiltered samples were killed
before map and another 48% later; with cycles:p both are 0%. The cost
is that DTB miss samples are of aborted instructions, so seeing their
data source needs cpu/cycles,trapped/p.

Thanks,
Matt

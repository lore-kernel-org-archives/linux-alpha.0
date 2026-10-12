Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4A949B45E
	for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 21:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841558; cv=pass; b=TarsPLbHtuIPDZQ9n4m80XEnF9OmoY/Lt4jOYNxIb4gclzdVHhdoV0ZVsSAgGhOBr8dv6TIKjireIsERmT2tsmTlcL+wg6cJiKXkYD3BTP2ZM33BgHpJgc2i2cYu0A0feVVL9BhE5fmSwbe/SetdbSAsirvzSUTdZfadKFBZJhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841558; c=relaxed/simple;
	bh=w0qc2CZd4Oa/lsOFggfocUkyp5cgiPaQh1jfXgSkSQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dAqPWjRUVGMcW6sZxx4gPTxDPPXlO0QMhNUv9a0kDIgoSvcfE+MKrkxzB6lL/HzdiL/uTw+T+2/MjH+JC/rByRCUMHwB49vOiw/bNbdrk8a5B/LY7C4YWQmKyhSby08SxnQ+k9HSHLsDbfgeaLbj6/2o4C+OlQVICg/mA8QKBlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cb9Msbdq; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cb9Msbdq"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5337c7b9937so541541cf.0
        for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 14:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791841554; cv=none;
        d=google.com; s=arc-20260327;
        b=N8H2pU+vjNdEOGsuhGDequDXHv5Z1Yuj/WoYL6QLhHCfVxLhOuRdP+jXrirKdZnd9/
         lvURlfFvf7EJQfT7veNW31ofeqUam3XA30FS3s4mar0VvixhNEB2/MYC7BovA0AMkUM7
         qS0v4d4DSoXccDsImq35BMOX3jsRnjW6P2ZXpskGmTHNIz2BnYuarjwNz2VvUptPe+tA
         57/I0hbuA7sdRYJCx0NJzE9nmIwWPYPb52gwWY7eMAWqh1pnmhHDbsAU1GMy6fUQEmjo
         SwJucWX0v7M+v+w/Ysv8UiqRkUUss7jn7UVOZPy4EJDacExbgEXlQ6VpxkUX5Ye39mLg
         OotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w0qc2CZd4Oa/lsOFggfocUkyp5cgiPaQh1jfXgSkSQA=;
        fh=eqdOzFJ/t8WEHmvR3+0AallauyDawmHc8/X0iT8yJsw=;
        b=RbXYAJIu0Jve7IIqUo7pWfDHezp1aJMtK7k27uoxGSYbHcNrhYYTeit44UDL8wMxN7
         5yOJlhkwq40P7g0yE0qCXyCvgD2HXIFz/jQOiWlQTqDgfKqvWCFEpLypgNi8kKx685iU
         248S3eK8yiFXgiLgdCdsANPYRaTttqIxzQD+djpSL/Kxu9320AYcRnD0tI80OzhaqNkg
         aalW4SIBf6RUW6txgGDdoa0fG5SAZ7I9QSn9U0HHhhC6tYdnlzCa0UMo2grg79p9+wgh
         2/ksA41kgKaKAMfQsksdWVDGsppQj9OoDsPueR6EByt/EKYeSav39hgFOgJWRIxxqqfr
         tLjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791841554; x=1792446354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w0qc2CZd4Oa/lsOFggfocUkyp5cgiPaQh1jfXgSkSQA=;
        b=Cb9MsbdqZseVKss4qKjrRHqmyH/0yT0HG/9h0rVLI249Thyclm7QQeYchd1NPIhs/k
         DPRrvsokjYPw4lZWztWA8O8n/NI5NHrsLEsRLi+CYIG+niX+JLP1VeTYr+88dyx44YvW
         NLj5jhJWdKBh+doOsW0qDtSIrlFa8zFfmwaerjmzU4xq+6JeVVEqhNLX1466yEvFNs99
         r8AJp/3mvH/63o9GGe9NqLcdpkGfeJJmDV6Lr8w+GCwksHaxlVWJBH/HKILnTQdZqC5P
         ov099KLBxFTvmL2R4I10m4vNP/78XkNVNO/65N7i8uJR2J4sxfStkJFPyaq0KeyGQFSa
         VutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841554; x=1792446354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w0qc2CZd4Oa/lsOFggfocUkyp5cgiPaQh1jfXgSkSQA=;
        b=nf+QQccKK5NVv7FIxiexpEhX6+lfHYdoV4tDc7yWLb8VpAODdOMq8LnGdYN4Bc0/U3
         QfZb7hdUBF+zdDRHNPuNwLI/STF0w0qv8QIq/+uQsjw25JEIdQFdMVJ9T9sN2X9ATQCE
         mGqS3sZrpwgh8uw1C7fuyi5igHrjALmnQHl6m2QW0gAvgUx+3YThW7gAd5KRppRrXfam
         +BoB61RWJIeD3tBKYg9B4LeLDCuInduZxZuDXLgtdzXljP09sshAr6CpdQ/vUtgD7IFb
         892Wu3iEQFmEEp06XTFDw1tMliad4tsoVh6vi3NKfWYZ7hMZDHMLOAxDTI1g8JLoFyPG
         mAYg==
X-Forwarded-Encrypted: i=1; AKwUvBxQ+UYfqzGVZf1D7DZMBRD4flWLw2E+wvI/eP1lils4hXr6eyVIqePdHSinN1F5VacSO3dw9thi/AgZ9A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJh/MtQ6DdGeXKdOn4/QW8mzd98g2obH039tJPTCWtX7X9+BhZx
	XBjAsPScuQeIvbrRpEu0fI53DP5b9KveqUntYcchtVzLrBYlBmqSHuElbdqQvCDgbtiXljOEmvF
	rsXTJcWWNc8R7ls89ipTFnM/eTQK8Kv+NkXRgviT0
X-Gm-Gg: AYBFou3EsoIpCM1xk5ivH1B+5nTj+cljRPs3qR4xUd2e7RopHc2qW8FNQS1P62t3fKG
	YUs8N2sT0ZMlIowITuLlZaTKSr/Oi+vYWukPIOLxroj7ax/3zsCeIU7X/r0gxPViOC/q5aHPMeS
	szx5clFi1Si2w43JrDkBVSopbB1niMsbzcwLMt8xxP+NrKGlRQf/u+us0cS2vGOd/VMaPUvgRmp
	l5+n7YD/FzpfmOnClzzWfw+wM01Rsym3B0dQnFYHaJau+BDO+B0h/VbzwmJdffPo8VtGY3waEwN
	EonuD0wSbOhJAS4vlsG55L5O4qDcmtZH4t21NBkEaUD3mVMqQYeKOAJo+U1uybCw5D17EZcKDHD
	DP1xcma+1uD7pAOTyZcSj
X-Received: by 2002:ac8:5a95:0:b0:535:9aa3:5ebb with SMTP id
 d75a77b69052e-535b4ecdaa4mr34353401cf.8.1791841553813; Mon, 12 Oct 2026
 14:45:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-tools-regs-v1-1-2a5940e22548@gmail.com>
 <CA+=Fv5SDnzQQDzyhaQ37kWJMjTOHP0NHuAS6kJHwT8_Zqyjd-w@mail.gmail.com> <CA+=Fv5RGr2NQs=gnErAWXfSZgMcWB1q-_-BNQ5X5DyzqkV-bmQ@mail.gmail.com>
In-Reply-To: <CA+=Fv5RGr2NQs=gnErAWXfSZgMcWB1q-_-BNQ5X5DyzqkV-bmQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 12 Oct 2026 14:45:41 -0700
X-Gm-Features: AclHuK-KhF7SQQ_cSO4Vi6bo7ImPeruAfj2YPIigck0H0gWHJJaIzIY69ZpCKsw
Message-ID: <CAP-5=fXFYbuV9MtJsVX5hUPKDOxcjtNTHM4-qR7Q+ncsPq59UQ@mail.gmail.com>
Subject: Re: [PATCH] perf regs: Add alpha support
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Matt Turner <mattst88@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:41=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
>
> Hi again,
>
> On Mon, Oct 12, 2026 at 7:37=E2=80=AFPM Magnus Lindholm <linmag7@gmail.co=
m> wrote:
> > > base-commit: bc01105ed65d15787b2eb93ac26e8624a2139e35
> > > change-id: 20261001-alpha-perf-tools-regs-c206a84dec7f
> > >
> > > Best regards,
> > > --
> > > Matt Turner <mattst88@gmail.com>
> > >
> >
> > Thanks for doing this!
> >
> > Register selection, recording, decoding and user stack dumps tested
> > on my ES40. End-to-end DWARF unwinding remains unverified because the
> > installed elfutils 0.195 lacks Alpha unwinding support.
> >
> > Tested-by: Magnus Lindholm <linmag7@gmail.com>
>
> I just pulled your elfutils patches and ran some more tests.
> With your elfutils patches, DWARF unwinding now works on my ES40.
> Both existing and fresh perf recordings recovered the expected
> leaf -> middle -> outer -> main call chain.
>
> As documented, samples whose CFA depends on r15 stopped at the
> sampled frame, since r15 is unavailable. Tested-by tag already given
> to this series.

I'm finding this fantastic and exciting to follow! Being greedy, does
the cross-platform DWARF unwinding work? perf record on an alpha and
perf report on, say, an x86. It would in no way block this work, but
I'm keen to check Matt/I wired this up properly :-)

Thanks,
Ian

> Thanks,
> Magnus

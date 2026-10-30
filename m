Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793332860;
	b=yiH/8YP6v5k8nEqFbjweZs1y7Ez1REaqC7MeCCmij3F1Sgwe0v8K7UidSmC1jRbRZ5sh
	 dH+OpRmPgSAkNJY+F5PlB6nhUTmsIvB/1pOJ3PY62mxu3/gYkcTj2bBBOikCxrXQVgaSV
	 usUXA6sXcdrDQ+52DZXf5xPNKbrUa2W6NTQcRPyuhc5GBpMx3RlZ9YUUUBwkYVfDvHPrn
	 LA0bT8zdVzm6WKXf7Vy+yburw+PTjVJGHNku1o4vdoilTR3N5Y+YnA1zbcYYSwmw2lYkm
	 STjVsl4+LnWCoJKfQWWtmp/ssYCH22Lq+lkHvvMz/cdkwJPICQPJ4k5SYYujKwxBBSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793332860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8m6uTadjpBwBsLxAqFfYb4n2COxFt9O2P0MYlt7cnpU=;
	b=fZAXkUwr1/Kiy8dlN47LefI+4JpQ4hhKtp0VvbGy+B5yRhmRIvyt/koddSUvYXkUQAoE
	 VHAuBlH3jyMWlFNqAErRrU2QMk4R6L2EQHog986b737NP66VZqh88H0V/XaWx2P+xqfdz
	 y0+0wc5MMNUklwRvvm8s8lwazOAAEPFtuVzhFgEE3gouqXFZ3i2wX4mKzgWgWf/Ylr4g6
	 6NXrmTF5Cr//wg6eh6lO1Xc1SyFQmO1tXacVvxFnPCYnQf9oLDTo/WzPPut4ypnTLU/cD
	 ndyzua+ftjGD3swytrbrsO20qmFhrot8o7BioBEWGDjDAS2H1JXC4UlYnieXbNIsN6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MLQ8fT2b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F6F606A323
	for <linux-alpha@vger.kernel.org>; Fri, 30 Oct 2026 04:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F6F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MLQ8fT2b
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a75f960be4so2534791fa.2
        for <linux-alpha@vger.kernel.org>; Thu, 29 Oct 2026 21:00:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793332854; cv=none;
        d=google.com; s=arc-20260327;
        b=nqPAAZ6h5MaSDHCZ/lcMmi2xHM6hOIw21MTzQM+Uc2el5+R4ryw90j+wRztMpGpG+D
         x6wqjjbdQQz8/FmGdP3PSMpoOF/+4pU6hzFF4FeuP5/XuK4isx/GL0zjbMdDogFRZNgN
         +qrOn0FYdZoEget9KeXhTdNIYb0q29pSAWvVBoWbZXZl4lXT+vQsFn5sQB4XF/AVJz+3
         AzjrKQJcWIE9QsbBSIPlDiyIi/9/MFIH2gwekT68Uza20oDJGg58p9rC5Es47dZHGK2t
         rwZsBi6X30gEDoM6eQWz8bzX58E7GgpWawc2XoYGcVsXlnPwdGKYe3+JbVQOEUlRDWsU
         49UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8m6uTadjpBwBsLxAqFfYb4n2COxFt9O2P0MYlt7cnpU=;
        fh=CFlRdT7qLHYquKURv0gqkCSS4G8eaJ4HQpcMXL4jpMY=;
        b=Cxd7oj8aWhyLGhDBkjozmcA2foEySwHKvYBjAcLi40CzTF0f6pvGph+iXIKk7DGJhV
         nJzIneVchhY2Aqi+/1xhc05AYd/d7uHFxhRN9WhjT4OzXzS4vT/BvFkvPo8o98q2weP9
         skxnY8VnWkK50y6vofolD/xGkevuCIsOxfLobNWSa96Jtj8RBytScpEpIXGbwMZsvWj7
         suViEEAUF63mGgvbdcnvdVOYYKhsIlgCuuI+Xr+M8DlL9UUYfvZfwvRm2THvCprhDmY8
         YTNkPofFvYT/iUZrR+unQxL/w7YAiq9jj5T6cFtYE1k/Np25nNSJ498rlI9eKz/OQpGw
         Kjnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793332854; x=1793937654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8m6uTadjpBwBsLxAqFfYb4n2COxFt9O2P0MYlt7cnpU=;
        b=MLQ8fT2bA0IrB2pWxDyIfLSZwP+jWNfK8KitmWsaH5PvWcsxpG40uPvwBHXRfLS+F8
         89jJ4mCB9yzWEMFfYAZOifPZFwdESXCh0QaBKJIXS0HkyTQI6U2cynrF0eh8XR3vpzmR
         /0FCy+cThpruJWT2/pk0Fz0CWlL5Z0TvB7Ju9uOCeA7NO3Sv18Xx0FGBhUuU4kFx9Kra
         c3PwWxHE3Ne9clhAT9BJiemvOeYSJv/igs4A06foLgG0jV/1o/AeeQf+uO58xje9NkxK
         zO63q/P7lgO7se5dOw7JrM+th6b4GKT2ODiy2BIKtp0850iRKgmJ1UOyixEeGRCzV2WM
         UlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793332854; x=1793937654;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8m6uTadjpBwBsLxAqFfYb4n2COxFt9O2P0MYlt7cnpU=;
        b=cRELLoogCRe6eX5kezeEL4c8yaLLD2vVn537qsn+6GR2/s0OaHNJJzHIwZlhrib1Hg
         bUW2640BAl9scMzgRvjybCFLbV7hwx9/DF1bYmEnW6dMm62dJp7srzRmy7OxHCROWmYV
         kC+QTYAQVe8vEdnVERrtCouL4qqi5PnNkD5e0DHzREShNlm/5QNuUHQVF4UmfBWenHN2
         WPNqOvvuTyN0SPdayVRMkEp2e9MeZvjnTpAp6AOZrWRKIZYIN/cpskgiocPqe+27yk+p
         zDHCOrT5NV9hlZ+cpcS2IMS1y/07iLmuNyflPgiII07bCbMmCqx8O2Q9MDmh/AsWT2r7
         UdoQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0mCCj2AF70e7IX0yjWh6yJ0UCUhpzEhqW1rL8bhw/HhY6NA5eai2hj7frBgA9Wc5tkjHyjQUb/j/L3A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIp6Op9ZaorfAXLsY2VjUd0XbNvbTKJVJAd7+R0BL5A/JGnGXSX
	rvzuHs5+IyYJqRHqu4UsdTeCvm807FOwWeesZvtfEjAd3p8OGBTjAj8csJs8yW986PNF/o/72Dg
	n5EXsK2ym+2EPMVhIiqT4TTum7Wirgx8=
X-Gm-Gg: AYBFou1qoWL42l15t6bYexP0aE3Ksf12bTDrgSTBFnB2gbEPH+Nra5zv8whJug9z73c
	neNv9zMwJuaDpg4griBG1q635lfYPkwxNKSmEmV84g7nL4bImEFNUqkfp/DTVTO3iyHx/UFouLt
	Jswsj9HcHZnvrZ3O2GfWIDYMUz/Qak+bIDWeKpiD5VxryFsPHYHHe4bzQFcvxlPGsDJL7hrTrDh
	y/PNMSeUwFqxQti63nl7cBLsrw0xl8bVFiPi8DvTCK2QUn84KwJkCD7xnUFd83xD3VG37loyOxv
	+DFQVSQi1n4a0+fpjvfF8iW9R8nQ4hTrVvB7zC9BgsdomxwtD5VpdqZCEkt8lAOo7UiBSPzAHQZ
	Seix6BOmv7O9ZatMuE/e2o1EQSlbrkbXE5HjWDL1/12ImxYJ4leylu7GI6afco0qfBFeWORXa/o
	DAJO0OXkqzS9jqUPtGcA953gdTE/Ld/9N7nEapUNOfHSNbONWrPkW1
X-Received: by 2002:a05:651c:31da:b0:3a6:55fa:a63 with SMTP id
 38308e7fff4ca-3acb7ac4432mr1662031fa.16.1793332853588; Thu, 29 Oct 2026
 21:00:53 -0700 (PDT)
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-alpha-profileme-v1-0-d44b52bf2500@gmail.com>
 <20261029091141.GG1779021@noisy.programming.kicks-ass.net> <CAEdQ38GiZLmnjYxzN6C92uz4-MOX7KoYvTuRrZ5Zike8ssDCqQ@mail.gmail.com>
In-Reply-To: <CAEdQ38GiZLmnjYxzN6C92uz4-MOX7KoYvTuRrZ5Zike8ssDCqQ@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 30 Oct 2026 00:00:41 -0400
X-Gm-Features: AclHuK_z8jslhuN5ZuHXp-j3J2LHCtXaMNwtybHEsthjNqU9OxnrlVuVJiof-vs
Message-ID: <CAEdQ38F1+iCoxseW_M_16m9wXW0xe-4eKtr2OnehP=3XppF4MQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] alpha/perf: add ProfileMe sampling
To: Peter Zijlstra <peterz@infradead.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 11:34=E2=80=AFAM Matt Turner <mattst88@gmail.com> w=
rote:
>
> On Thu, Oct 29, 2026 at 5:11=E2=80=AFAM Peter Zijlstra <peterz@infradead.=
org> wrote:
> >
> > On Wed, Oct 28, 2026 at 02:09:29PM -0400, Matt Turner wrote:
> > > The 21264 from EV67 on, and the 21364, have a second performance coun=
ter
> > > mode, ProfileMe, alongside the Aggregate mode that the driver uses to=
day.
> > > An Aggregate mode sample reports the PC where the overflow interrupt =
was
> > > taken. On an EV7 that is anywhere from 15 instructions before to 12
> > > after the one that overflowed the counter, which makes perf annotate
> > > output close to useless. In ProfileMe mode the CPU picks one fetched
> > > instruction, follows it down the pipeline, and reports its PC along w=
ith
> > > what happened to it: whether it retired, whether it trapped and why,
> > > whether it was a mispredicted branch, stalled before map, or was kill=
ed
> > > on a wrong path, and what PCTR1 counted while it was in flight.
> >
> > Isn't this the thing that ended up as AMD's IBS?
>
> I have no idea, but it wouldn't surprise me too much :)

Looking a bit further, it does seem so. ProfileMe was published by Dean
et al. at MICRO-30 in 1997, and IBS works the same way: tag one
instruction, follow it down the pipeline, and report what happened to
it.

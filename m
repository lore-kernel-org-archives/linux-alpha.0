Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDFF44AB60
	for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 21:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841282; cv=pass; b=EUO4Anom6Blkxti63LvPxdE4D13UIKzg1/8CLNIQJttx0tVc8Jk65azd5dFRAyTALD3nS8FfubcUh2idDCsVf1nty4oHe5OkIJDEkztgQ0eRwL7SbjqwGyOwlFKHsJzI/+R1pjq/dHDf4xqFCUxPu16N55Vyd3hJBHeSkt8nmvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841282; c=relaxed/simple;
	bh=MvL2NksiIGW4AGmjA3H0Npu7mPSzD9lxMrBE1kC8jt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dDmMxD2bNH1YaIQcXQZRLUPI4ftwrLUY01iLgewl9tM4DXYXThGfTaz3CuEHH/PzIkqHfdxRmodqQbn+s3cNVMjTB9M1e2l6DJMcWf3oJNCSHS8RncV0ZXb5y5HKPrBkqAnqcys0vlhOlwFIwiCebre3UYw0ZikkfOwjc2CjL+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7kcIlYP; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7kcIlYP"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c263415982eso270790866b.0
        for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 14:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791841279; cv=none;
        d=google.com; s=arc-20260327;
        b=k0fb1GfOjHyxjIV/V0hI3ST8twazrUL/0G2e7bM2jV93CywSMax+B5Dq+81nlH0JYi
         bU87RrkyLdOP+GzeDP7lo3h1Rvcy/zWlULS+vrWQ2aSdaCWEjdCS0FHJ1xol4vNhnDaL
         JqZI9YCYIAwQ+Bqjm16PAr2F2LzGOeM0Ck8CycyWPVUKzR8N5xn9D/XQeG/4vnF8OAoM
         F1/i0Xyp0/hhi/Xs7SL4QAlVQl1HoB5eFu1J+uOz75WMtxu/Y2KYjShgCHQOl5X/CPaL
         Xgetm0BOdjpZW/0lO1KdAm2/U52ZWpmbPAbYbCgqw+6tusbogNUuycOvMwctbkox6iW/
         d2zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MvL2NksiIGW4AGmjA3H0Npu7mPSzD9lxMrBE1kC8jt0=;
        fh=K8gud6UIKkz9EEnhprDKz1+gY8prkrjq8981ppkPaCg=;
        b=Zg4OR9thGPEu36Od5Vq4h388gHJWBE0y1K0CkTClsvee2H9LvZeUak571JcZhiga3J
         HkdI+nJfsrh7WXfpdliwtnFwWocc5/Cb7YzGuHDUf7KXCPASgMHGW5RkDWDXgvs/LVYk
         xjlt1MXQXkiSrWKYHfbJZEcopHGEuE0slJY7lSqy5MdOc5ggBb22XNU8N/l2Cyj+pDYi
         1XqZI0/wZNVvWrK1rU/JzqPBhtoWXrnq7tO6BgTFX3U+fa3l6GAsgZLviq7iDyy3Frp4
         s49kPfmo+IsrDFp3lqes8kVsmoOZPe8gySTt7j7bqHYGB3XRZkSfBrmQKSQq+x2QM4Fu
         TfGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791841279; x=1792446079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MvL2NksiIGW4AGmjA3H0Npu7mPSzD9lxMrBE1kC8jt0=;
        b=e7kcIlYPpC5PastaV1VA9rFjb7oH2EHlfU40Dsu0wcgeYMvKEervMi3okRv0GQKGV6
         eoPWdEZ0w2ng1d2G/zZ5p089vHOIj5vw6Gk4I6S9j8aPH685HgCQy/M73gfAtbwYXrYZ
         +OsqZCXW58CRlEP09bo85N9kWoPI0CwH+e4jYthZIw8apZw6wYyJerEYghZRJTRHPBDi
         XY36OMwPeZ+I3zp2LJyvWJvDZZcnrFXXTulaiiVTjNmioH5YTcY/RhzVWe2cd5Uv/HJF
         IBZmG+a9AZlLReiMaWgX/z0iuheVyLI0kkz3zutipOGX8NKr6PqHPqGAU6SR7L+1EkVI
         hsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841279; x=1792446079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MvL2NksiIGW4AGmjA3H0Npu7mPSzD9lxMrBE1kC8jt0=;
        b=TS+FfrII95+5MsIT/qPxfZrwmfWu8zWzIwJKH0lXugcZ19vB27dOB2ZTfxsFVqXDCg
         ElKqWMYNpUbKYARcaTDPpN8+nb7F3sgVkvx92TYfcv3kcsZNbF2OwS3XnNk2qvtjG45p
         sG+oTy5CnpE2GOUJ05Gix9n73qMtpW3yW960sBfhOIkeMH1I/m7uohyuTnyP9p5MVB2F
         SdEBzgEb11VG58lrmIt0vGq9QXakvzD7AyiFDvSn+bj3vaWu8NJpPIFwup8NM7/vNmBE
         5PGO5TXwxStlpykTrK4wZhfMG+XpURSASyZAT3DQVUvGaZOikJnJA1L0OY3J1XtPERc7
         8LJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfhcuxUfa7SmgqO0kMT6UsetbPZFTjIGUD/Eqdv7kL4apGE3HD8h5nxeh0myLXz2hNMsvODi0YfgI6Qg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLfPm/xjdLgOL8Jmgt1Rb+/CdSHVnGpeQVbrLbVjIcapmPr7ur0
	4+qCq04AB/d8wqkNHqXUfpS8l935xryrU5J/ff9bJQasmx93T+M3He2K/WMmzyVXG9kM1HEYpS7
	dyoO8yDw2KZUgFsk2PchmRQI0iQmBkc4=
X-Gm-Gg: AYBFou1uaTI9IZc9i3bBKN912v+qZRiGTBx/+sHURmyDa7Y9XSs+WG/bTFmHksgJXGK
	ChDU8pwTpO2PUbaWSAdhzoA3dhjck52jimqhAkwyqsO2CRo0GUDYAT1aMX/zrWWjhxO2QCMUytX
	ZXxVIF5CAeqBFkEMWP6wr3BNUbFbE28g/1eascyecfBw2Sa0mnChk2NigMSIFyQtUVSCN2AAuoX
	syft9fkAWTxZUA0yDEMtHx63CGlgYwEARL6HeqQjgElE3hCMVVPjTxm4dA6brIj2LlzxJYd3AxL
	XbZxgb1Pv4Hz4HvfOnH/hs11YwhExJT3CDTfzncF8InUGb0611YVMbhza4gmLUnLNQpmIelypyQ
	c/1qfHVXxWJxDxw5Y8GSRrG8dzpZaNB4R/DcGSO+KZQ==
X-Received: by 2002:a17:907:2d94:b0:c2e:8eb7:53e8 with SMTP id
 a640c23a62f3a-c31aa03cd11mr1071057366b.30.1791841279326; Mon, 12 Oct 2026
 14:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-tools-regs-v1-1-2a5940e22548@gmail.com> <CA+=Fv5SDnzQQDzyhaQ37kWJMjTOHP0NHuAS6kJHwT8_Zqyjd-w@mail.gmail.com>
In-Reply-To: <CA+=Fv5SDnzQQDzyhaQ37kWJMjTOHP0NHuAS6kJHwT8_Zqyjd-w@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 12 Oct 2026 23:41:07 +0200
X-Gm-Features: AclHuK_Gule_sWbyfyKRqdrOVxlX8Cnrce1CxMxjqq_Jy90LticJHn-in30fJ0w
Message-ID: <CA+=Fv5RGr2NQs=gnErAWXfSZgMcWB1q-_-BNQ5X5DyzqkV-bmQ@mail.gmail.com>
Subject: Re: [PATCH] perf regs: Add alpha support
To: Matt Turner <mattst88@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi again,

On Mon, Oct 12, 2026 at 7:37=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
> > base-commit: bc01105ed65d15787b2eb93ac26e8624a2139e35
> > change-id: 20261001-alpha-perf-tools-regs-c206a84dec7f
> >
> > Best regards,
> > --
> > Matt Turner <mattst88@gmail.com>
> >
>
> Thanks for doing this!
>
> Register selection, recording, decoding and user stack dumps tested
> on my ES40. End-to-end DWARF unwinding remains unverified because the
> installed elfutils 0.195 lacks Alpha unwinding support.
>
> Tested-by: Magnus Lindholm <linmag7@gmail.com>

I just pulled your elfutils patches and ran some more tests.
With your elfutils patches, DWARF unwinding now works on my ES40.
Both existing and fresh perf recordings recovered the expected
leaf -> middle -> outer -> main call chain.

As documented, samples whose CFA depends on r15 stopped at the
sampled frame, since r15 is unavailable. Tested-by tag already given
to this series.

Thanks,
Magnus

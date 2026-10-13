Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA99399CF5
	for <linux-alpha@vger.kernel.org>; Tue, 13 Oct 2026 05:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791869864; cv=pass; b=G5qWb0YWURaWZoqvROxVHujal+QDbivZgODfzyB6t/aMOun6F6HodR/Uy4W5CKfTQZSP+ntHb5VmBbexpWrtWI6TkIjaCJOLptpOm0F7SeeqSuFWhfBsuQcZylN+mn+Mx0QRuv9MmVFy9xcTdCBcpIRE9JbKwt6kP6IlN/wxoz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791869864; c=relaxed/simple;
	bh=/zPpkCpGpUzh14I3YBtDsGa/MwxiYOQTelF5FVqDA5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vj6Ott6W1HDkJlE6THHdxuQpmflwd794IjGNfGISJj4XIUZxVqy1HCB1hdF1hboYTcHyEtxefNbh64Sb1HK7ni7OYKVIGBwBEQ47MlUtqvpru1h8CaSvIUZ1voS5bEXWUjDbZUSX8PINV4+vdnud6jC6aZpq9+bmR+4301IFPYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkzzHC5I; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkzzHC5I"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so3885603a12.1
        for <linux-alpha@vger.kernel.org>; Mon, 12 Oct 2026 22:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791869862; cv=none;
        d=google.com; s=arc-20260327;
        b=NPeDbykKHfrQvPEXzUiHwu/Gmgywc1OABlgapNZULH/ouMAaiNeCg0wHr9McoVjv5x
         eI3XEylENv6t53bg3/4U+csME71l/zi7SAfS6zxurTqmLuCNHE/LEc3cIGFfSE/GR3wQ
         c6svq1GbKa3CZ7GqXYDNqqa9sogOVVoPT2NPOEyvE/Le3MhODPsw2EG8XTGQTmMp5kv3
         xqeUIdp/NSNH5OIrg/ur8V6if1IH+PvkBJZHmaOtDSmoGaHAeYlcugW0UrQrdXxN16o4
         dZbEBvqEE4eVAnAyuGE99paeQmVo97Cs04msJgVfAbR/e5g+xkB0c9AAzindNNXEnIFC
         K0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Emtdx2R9x4ZRsBc5vXH6nvBta4+jFC7pIdT0qhibpOk=;
        fh=4i+Qm/hmcPiqJGY15o3YH2LDTtehnPjulyv+f55pfR8=;
        b=mGqBxg6vC4TlmkpzJC7SW1cc5Opcke9t34+VW9+qbu6j0RCjAo4XJKiSClvAaf7PBU
         EiplSIoXoeqSGuupABgx4BA9NWuvk7UuJDog/OGYGTS4mHUCwBNfvwWb2AlwVWbGIdJH
         RbcWhfs7UazHVUbKgvAo5Y/wZVNPOte9C+HSkke3PKSc4JDYS4rFFVsp87K7N17FxJFI
         rm3c/WBzywRx2Ng+aQS+EHkF2TvuwvhWYKBQsdjNy6JQewxHbrME/eXw10tnmZqQl9cM
         u3k7MHEDRu7wFStNOYKgbUOsxppYqmCr6HagMzhx0FhTTq46R/KSTsJOH3XHwZwVRxVY
         04Ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791869862; x=1792474662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Emtdx2R9x4ZRsBc5vXH6nvBta4+jFC7pIdT0qhibpOk=;
        b=GkzzHC5InTs1tqSjidKObNm9WcOOzoN+GZLlzNjA0NLYFlxFQJYN82AZNrlfFErxSP
         u0urpKrjahsLtAcV/TRWafmmZWHLUuzvCFf2ROEutpnNGowrdZYH15QuJL+NxDScyFQw
         ieSVly4yu1Zpb4LUD6HJ/3lonOJA/eDS2Xxo7KrdLxRDlbTnfs10GTip0Kq29PCeIAbM
         mU0LppOnUi22+a8UIRjZGf0bW+UYFBphetfDZZHYzhvoFU0BgBe8Q3BFvXDmKucqe9kj
         lmmPTQa22/ZRzyujiVlua+X1KUAo4eJzLziqQyAPm1fQ5DNbZCG1PNFE9Gj7CuczWu8X
         uWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869862; x=1792474662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Emtdx2R9x4ZRsBc5vXH6nvBta4+jFC7pIdT0qhibpOk=;
        b=hSJGdvYWE2uhqeNJ9piBQWNvC9UTxh1YoKWsDdmx4PBNiaM9qvC0MVyeUE2jnzTleZ
         NnFs/+dKO5CYGu2qAufDRGtDHSGThbfaaR53HwLxBD5vF+5QZcMh2MkG+LMFDvr3pOVQ
         DR6+GEcpXdUSoBR2FsVToyX/VrJQUFZhE6ac8hoFcuP8c2cfLGatbF28on+pr77pr5TU
         5wbHv8y6X8zM0pA5buIvRt6Jau/elCjJeDMN6qbxqt2IvRNNyKrobdNROawqebkSLOO1
         JufKr83OfRUNdHMI14IR1axEthTnVWJkudJvtV8J+1aPVZgtl7Dh8JIeHGaD55iflehf
         uVDw==
X-Forwarded-Encrypted: i=1; AKwUvBx6aVfLAY7khkVPGNWZwJ9+UdYrPj7hRgHGL+s8LjxGS8w6lmm+qIOX8l78dve3WwEdi9EmEVTyA0SaBQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIXf1ltNKz3FvfIx8guOSyFPNRw5hPwA9EwMJaTR5swYJB4V9Ci
	z4+ROMQDN1GrYbGENb9DPpmvdH0pxV3Zww/S/qS8eLkY+liPC1e77far6lw5hPok0g7s3jTv2x3
	s8iWvypEknmw/HxlFvrz2CshWVZLC8MY=
X-Gm-Gg: AYBFou1cFYYU/MR+G5SfMDGHmDI7Td3xm9LQy7jtm0ytOlnsTla0dmnCjKAIeTyKAW6
	6tPx4ArBMuhDEvHlAY/sgwmcIfiJ9FVh8chDzOGcfxQ99jbDqT7zq/v5sSccP2AG6+Bq6hb0Y6S
	BZYvGKjW5NvVL0tbxlEqDRgRzG8fFIl+s5xjnTLewJDNmqP5wt+oklrdbpUpJSbQlrY8ejN5JG6
	dZ55KAd5V/Or1MKaHnUZv4G5MQY9zVJ4BUE0vTm9nV/0LaWbM8yBJn/5fl3Q5TQyhsrdBV/OPQ0
	HDgtZsUbNl3KVxLj1PofdAKu8BPP/De3vxfmukfmW0rbzS6o3mWNRSgt3f58Fqik2kTTuQtTs2b
	ruBVfYZZ1RYvRYAs5AhxcFNmXL9lJBxtbbnL3shp0+dSw6+IbtVAt
X-Received: by 2002:a05:6402:5193:b0:6ab:e30:c9ac with SMTP id
 4fb4d7f45d1cf-6b17c2002d1mr8952418a12.6.1791869861425; Mon, 12 Oct 2026
 22:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011191344.981000-1-linmag7@gmail.com> <20261011191344.981000-7-linmag7@gmail.com>
 <CAEdQ38GoGhoaoymQER16qF2NHwhOGjGsTh68B8oqSzeR-LL-uA@mail.gmail.com>
 <CA+=Fv5TC4OTgVKXdnqDWawXBm4M1m8ZHPJoX6wL8K8fdyPo5xw@mail.gmail.com> <CAEdQ38Gcfco9N62rXueiwFBF+r=7A+SptYUsecOdq_ipihKmKA@mail.gmail.com>
In-Reply-To: <CAEdQ38Gcfco9N62rXueiwFBF+r=7A+SptYUsecOdq_ipihKmKA@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 13 Oct 2026 07:37:30 +0200
X-Gm-Features: AclHuK_636Ez25TyDTMPAHDw8LMknG62w8SHUbBj7c5o_llp9_f4GKNC3D5_8zo
Message-ID: <CA+=Fv5R6AjLuNhQ+1BLjjkUh+LLmzbte4HM=S=1+8ReBvoj4CQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] alpha: stop on fatal Tsunami system ECC and write
 parity errors
To: Matt Turner <mattst88@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Oct 13, 2026 at 5:20=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> On Mon, Oct 12, 2026 at 12:58=E2=80=AFAM Magnus Lindholm <linmag7@gmail.c=
om> wrote:
> >
> > Hi Matt,
> >
> > On Sun, Oct 11, 2026 at 10:01=E2=80=AFPM Matt Turner <mattst88@gmail.co=
m> wrote:
> > >
> > > > +#define TSUNAMI_PERROR_FATAL (perror_m_uecc | perror_m_perr)
> > >
> > > Why PERR and not RDPE? Bad parity on data read from PCI seems just as
> > > bad for the consumer. If the HRM says the Pchip poisons that data and
> > > the CPU takes a 670 for it, please say so in the changelog.
> > >
> > > > +             perror =3D live.perror[0] | live.perror[1];
> > >
> > > The changelog says incidental PERROR state on a CPU or environmental
> > > vector cannot trigger the panic. It still can on a system vector: UEC=
C
> > > or PERR latched before an unrelated NXM will panic here. That may be
> > > what you want, since the error is real either way, but the changelog
> > > should cover it. It also depends on the PERRMASK question I asked on
> > > patch 4.
> > >
> > > Two things that I think belong in the changelog:
> > >
> > > A CPU-detected uncorrectable ECC error (670 through
> > > ev6_machine_check()) still does not panic, so after this patch the
> > > policy differs by who detected the error.
> > >
> > > A PCI card with a marginal connection that asserts PERR# now takes th=
e
> > > machine down, where before it logged and carried on.
> >
> > Thanks, these are good points. Would it make sense to drop patch 6
> > for now and address the panic policy in a follow-up? That would let
> > us consider RDPE, CPU-detected ECC and previously latched errors
> > alongside UECC/PERR, including the impact of a device asserting PERR#.
> >
> > V7 could then focus on the reporting and acknowledgment improvements.
> > That would preserve the existing continuation behavior for now,
> > without implying that continuing after an uncorrectable error is safe.
> >
> > Magnus
>
> Yeah, that seems reasonable to me.

I'll put out a v7, focusing on reporting and acknowledgment
improvements, preserving the existing continuation behavior.


Regards,
Magnus

Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8B533F8A2
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 20:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748896; cv=pass; b=hyM4pf08JkRksJkwtkGMwiyLjIEgzogh/OE2+dNmuRzwElL2GnTMmIPzOHHRn7L9aFARW42t5NbrZblRjc7BaCDwA2Zil5EhQg5RPj3GuXDxe8tyvwnhXjnmMr6mBd3yzBu9FbLl4A85lBh3ZYAvBo/xkMwAj7giIJJN71bEx+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748896; c=relaxed/simple;
	bh=1tzJN88GwpvDiyz/lrjVdtV8dFKQy4NpjoeYN/PYPdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tdLyuPi4Z1nalBUT0ekEp/17H5pAJBf8TzCZEMoLV/+UANxBH6+Qob8jqOXmJT/wya7Gfs+hA4f9aOEiDNIPh7E5vPkR5rdKYMk4Mzx8/sTNE6hbQeEfKoFCcKgAgaMmIBA7TPgkrJo4o3Ozs3+swkXUsYuBa5RskdqvBfn2dp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hj2ewtMT; arc=pass smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hj2ewtMT"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92ed3993c1eso75202085a.1
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 13:01:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791748894; cv=none;
        d=google.com; s=arc-20260327;
        b=iXsJy8hwi7jqEK0TyX5LCEB4aDj2mYY5MtgdFIoAiDyMtoGVGwix1ftMGwBlwz39N2
         cuerbPWuVXs4icq/jPCHrZTxp1dNLDfN9b+F4RMF1NZayZuowBjTWcbKkShihA96L+5x
         7qNYI198fIpPV1+dfITav9n6ogW1lEv39xtTcA8OAh/yZrtAzAHATXLyW07RbM0GhD4L
         llcK57XPw/zgGVWk5S/lQPKbVkHtkGvJ3iBg//DWbLfbzNDhNyIgcejkc/VtL6F9WJk1
         irVXAStFyDrcVrL9tk1SP034uRPxEF6KiGsDdrw5kTKN4R89sokfaYI3dHzqATApRceV
         CZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6S4lTE+OpEhZb6bjQs47nv2nou0BGYnNK81t93sALC0=;
        fh=CSD9Hvsr2QJkcJbofyuPmiLSc3IMtNQB0bAYHeuTz8w=;
        b=PN7D4Cxlx8LsoTGe45+qooIGN+4KIUsEgpoQlFYTR4HMpvBBt03HOyR40HF27V4Ba1
         cOypr/UnuU2k69aS2uIRxDMjmXIm1XNXwQqK4SBUBFB3LmbTAp/l3Sfny3+XO4YWlCyJ
         t5gTX+qbn/r7Hp5EPgOG1KBO2hJ0HxUPtbCiQ8n4Y/DzCe8xNojLis7ISbxG17a9pi+N
         z+09ODYvGW2m6h9fjqpAsdhLSdRChbKQBC1PzCwGpDwbcbnB8cep5Itcgg9wxVj0HRG+
         yIEY/s0Of28ZTkL0qtIY3VJIv5eRApqtr8jYzoXjicpxWRBeGXtaORz5+zpgTGrJYpk4
         fkmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748894; x=1792353694; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6S4lTE+OpEhZb6bjQs47nv2nou0BGYnNK81t93sALC0=;
        b=hj2ewtMTYwaSPbrexTCOwRAPkXV3L3WMdGnMxNnKEXWjM1lgUP7/hoB9MO3WjNFY5A
         yyGnWLWUBJeMvP/e15LuMzRTlpitsx7fdIqU4BqyXqWpy0Cwt60Xy+XQYf5OBo30y+4Q
         eDzxtBu5LRYWr2j99RNZRo0Kheqa3GwPMtnav1Hsqb9jdvoc+ULrPS8/vBYHAVtfJIEj
         4mpJiG0qL3XROaPoZog563FR4gcFSPyN+L2ud8QHWI3z+SsDBD5uCNlFazHExKSaLlI+
         ONyrDnkZrrJDXSNTO7tPieH4Eo06NF7nhCkbe2DP/9/6Vsu/1yH8DEAtQBsaC2k+MsLp
         WSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748894; x=1792353694;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6S4lTE+OpEhZb6bjQs47nv2nou0BGYnNK81t93sALC0=;
        b=qY/WmPFyzGQ97M6DyPZMsCRegXF5uyWygCNHwwN3YB8+h6e3+JTOKR74MaDE7hLB08
         9lFBzYVTT+rYcpk+Hykrl8GJk9bk8Z3Eppy/GSuNg/Aa1uNf8CEuLON8d0AyLQheCnbN
         GQIxKTLut1unbgKgCWjk/TRXVo0NBvTEDPovfVskdtTDvjt8KQiaZ9Rd5MdHwdqs7NYO
         mrU6H/BLxsIlaLrbtahKmxpNYD5h90ivvaTy2ZZCoOYHOdqKxueQJA7IPrLaZMW/3rtr
         Vaj2O8TdVf/221/+jztrKctHXfEqvfuHH6v5Bg7wycoDin1B7hlm7ZhIyGwigSkeFuVo
         f48w==
X-Forwarded-Encrypted: i=1; AKwUvBzBXDQm31BDR/QsoKi6Ph11sPFNo1cL/Q09PJ9beh8L57euhuVnzF21/kTqjGvn1EVhe7AEmSCha5bj8w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJlzWZZvJfUsTU3SInelQfHdaDcTBaPB8grEZFRppXN1H5JhCy1
	TlKktdY68iBFF+oR3TrnVPWUCWuAPwHQn96nsPpNcmtRCOUtPNzlXwgWOMaQXlKaIV3HsoaU7uE
	CdJVicGdPBJiJMM7xcX/9zKs1AvknjdELwakU2M4=
X-Gm-Gg: AYBFou256hb4Oc3kqKj2Iyy9CNPCMqHTb4Hj4yXnac+o/ITO9oBaP+I4trdGZFYsogU
	SJ80XB8qhoRcgmbQ2U/bcnghJe3cD5ZxuYuwmiLB1EHtAZO2wcf5lOfo40NREozJ90lKLP/lK07
	2Kc4vD76wwVxERdlSFPrTK6Ihyp2nVUPGMCstZ2nX2+ishtZtFNivPgZEw+znQlRUzd8bhB9WDe
	UWrcp7ei8jcOsSkY7wnXmaEi5K083DWBuYy5PWgUT3lGtkqKIwVv2YU6mSpBKXJV/U4LS3PoICY
	SxpTwJfPaKjpEYapEUOHADa3NB2KiYqbutMzYPzgnEqEVIzBTlf4uQKnsWsrQzbLaZ4+uKIzvUJ
	3Wgn4vKyfM/VhdwwaooHNvpCIlOAoQ2X3FbsDRoqx+6ijsBqNXZacMNI66BKCbpknCvAGlRE=
X-Received: by 2002:a05:620a:a41b:20b0:93e:c12c:fbd1 with SMTP id
 af79cd13be357-93ec12d08e0mr831249985a.77.1791748894091; Sun, 11 Oct 2026
 13:01:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011191344.981000-1-linmag7@gmail.com> <20261011191344.981000-7-linmag7@gmail.com>
In-Reply-To: <20261011191344.981000-7-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 11 Oct 2026 16:01:14 -0400
X-Gm-Features: AclHuK9hH6WUDnezreEOOPO2jeyuAE8H0CKQdbkUt_jrQI3BponjxKRx6Hgy5is
Message-ID: <CAEdQ38GoGhoaoymQER16qF2NHwhOGjGsTh68B8oqSzeR-LL-uA@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] alpha: stop on fatal Tsunami system ECC and write
 parity errors
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +#define TSUNAMI_PERROR_FATAL (perror_m_uecc | perror_m_perr)

Why PERR and not RDPE? Bad parity on data read from PCI seems just as
bad for the consumer. If the HRM says the Pchip poisons that data and
the CPU takes a 670 for it, please say so in the changelog.

> +             perror = live.perror[0] | live.perror[1];

The changelog says incidental PERROR state on a CPU or environmental
vector cannot trigger the panic. It still can on a system vector: UECC
or PERR latched before an unrelated NXM will panic here. That may be
what you want, since the error is real either way, but the changelog
should cover it. It also depends on the PERRMASK question I asked on
patch 4.

Two things that I think belong in the changelog:

A CPU-detected uncorrectable ECC error (670 through
ev6_machine_check()) still does not panic, so after this patch the
policy differs by who detected the error.

A PCI card with a marginal connection that asserts PERR# now takes the
machine down, where before it logged and carried on.

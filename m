Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2250313E02
	for <linux-alpha@vger.kernel.org>; Mon,  5 Jan 2026 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767609527; cv=none; b=NylcPXf6mH5ce8xgbWCQpo7GRFH6/3EqlcK/641k2Ls8T0cOfoEqr+7SOLrpkwglPUxiMUUqB8ZI4chWqy4dw2Hof6j57UGgmkV47ILRWrZHbIdo9+762wf8eqx6ZKtNOmQ0b9wx4ezh66Z7F3F2/abhY9Z+64sceUK5UD7aqbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767609527; c=relaxed/simple;
	bh=KXLosAKj9WTZoqxb3cLCJTfmO0KCMCIscavgasNNB2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ad5k9Dv2CzplUSJTpb6Dz1EyfB/4bykZaPPOVH5XitUNgc2rfGn7h17vsRyP26XfGjEwoZP1c1j/tYp/Yagbb7MGqXmIKGd3XCR2rWuUBpIgvuXYFPr18rT150zNFe2GN5XO/N5eN/C0tTWwy7C3RIPF/Ok7W1E8tjgiayGzJJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4o7QKkF; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4o7QKkF"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6505cbe47d8so433132a12.1
        for <linux-alpha@vger.kernel.org>; Mon, 05 Jan 2026 02:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767609524; x=1768214324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpr1WOrht6j6ORsQatZtyLhRtfXLJi3Q8MSwGacBmmE=;
        b=K4o7QKkF2n+IltFxHs/Igei/OZdyzJd+RxjP1/ZcwxRRc7ajKfBpIdpSngsqCXnUjG
         eAhyMnAC83I7fITmmjSdaefI8Q2M6EAY25O+uw4r+ARAAasrxoOKjk/r9gHkSwCG0Tes
         GyrW4z5Y53O8y7N3DEmazmaBdft7rrvbyASnnTNUXEDtaF3T50gLTveajIgcyqRjO9Y8
         GcRzkxpf/ZvQ6+s4TXU898V8hUBcv/JDSNCa7dYESRfBvVOCEeiC5K0GoN9VaELnr8Kt
         8jcx9xTboygibhXs3riIbma4aGpLVUjfz6otTcxRNRigGsaszeOb7pt8zUzjeUJr4BHd
         xGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767609524; x=1768214324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rpr1WOrht6j6ORsQatZtyLhRtfXLJi3Q8MSwGacBmmE=;
        b=ZIVkIyQA2OGzJXcrZZH6FA2fUbkXDrwilUhf65QG9luuxQnnsYYE/fgCzqsxgPmgCZ
         gb5EWY3KP8XkFWy0QbVviNpbnUqhxWVvoVLdV4k8840eoQ/V2uRmtQFQ7jOxytnsSi72
         +7C/5W6aVe8WGM6cxmKuO8QYRHtAvKtAAZ+o4CS6N8we2oQYmsmHNEzXCr83D2ksKfn1
         HJ3kVIUuSVWvmZ3jLZYf1us1gLn01FipdZg1q551IX3IuzWZYm32bhPGUp4Q4/cabQ+s
         lNos8y6k8kvV5LqZMdO+ZRVKphofpg+hBU82grnptbuNE07kTZx1SXeBWymqRc/bcFGN
         5zCw==
X-Forwarded-Encrypted: i=1; AJvYcCXcNJqNOnpLokHQBy1gijJRUFquWyGKzGBSFScJRSd3fSinbCymheJC7gLmSpGAA15f/Ake0luzgV2h2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrFdX8enZr6svJ2fdI0QCVPvRPdO2h6wSNqFullot0pQACVrWY
	1JeLu2cauPU4DM8XL1/tvfbsMgf5UCEZEdv8eP/uR9S4d4M+WKJ7lR5tEAff2Op7ioQ2T4q+rAU
	+9mDiESj5Ur7Ut6+vieYf6sA1NOxamj4=
X-Gm-Gg: AY/fxX7hnolvBpaqmHAR10l7cYdA2G310koGWKJrE81y/o9KAJCm7ViUnxm/WJf5j0P
	Lod/lApJfTdDOnUYKNW5YCPh577G0un3CpErNOKFFGu4yA8XsyWA0Ae6TTz1qwUm4m79afdmjEG
	gZwMQ3oyPKA/GJZpwbjMQUO323CBDp5k7ocMPsuS2oFpDa+A/RnYp3oajB/8HirdRCkvOVYtIGH
	b/ty0tAkdzZCpbvIsxt6tI1fgTudPW5apc8IqjiAHquBs38OhWfXa/3PhSgcIEDcRmVpV66
X-Google-Smtp-Source: AGHT+IHve9mtUuYnBvwRtwl+XG1rrtZF7lTbS5cmb10zuaOisWC6Q5wRw7gN87SXZ2xj5LiVrwPD92wuBLz5gGcL/fA=
X-Received: by 2002:a05:6402:51c9:b0:649:b200:afe9 with SMTP id
 4fb4d7f45d1cf-64b8edd8b54mr44168355a12.27.1767609524051; Mon, 05 Jan 2026
 02:38:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251228063440.2623595-1-safinaskar@gmail.com> <20251228063440.2623595-2-safinaskar@gmail.com>
In-Reply-To: <20251228063440.2623595-2-safinaskar@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 5 Jan 2026 11:38:32 +0100
X-Gm-Features: AQt7F2oW0pJ6x8V2KE_T8rhdE4-ywJ_uvZca_rX5x6NdgmoMtVTx5Rb8XUCp2AM
Message-ID: <CA+=Fv5Ra7fFTd2wA77iM_6X7NooApfoMJX5z1j60cXex_uxm7w@mail.gmail.com>
Subject: Re: [PATCH 1/1] alpha: trivial: remove ^L chars
To: Askar Safin <safinaskar@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-alpha@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 28, 2025 at 7:35=E2=80=AFAM Askar Safin <safinaskar@gmail.com> =
wrote:
>
> Remove ^L (a. k. a. \f a. k. a. form feed a. k. a. \x0c) from arch/alpha.
> I'm attempting to write my own tool for parsing kernel code.
> And these characters complicate this without giving any benefits.
>
> Signed-off-by: Askar Safin <safinaskar@gmail.com>
> ---
>  arch/alpha/kernel/core_cia.c      |  6 ++---
>  arch/alpha/kernel/core_irongate.c |  2 +-
>  arch/alpha/kernel/core_marvel.c   | 18 +++++++--------
>  arch/alpha/kernel/core_mcpcia.c   |  4 ++--
>  arch/alpha/kernel/core_polaris.c  |  2 +-
>  arch/alpha/kernel/core_t2.c       |  2 +-
>  arch/alpha/kernel/core_titan.c    | 10 ++++----
>  arch/alpha/kernel/core_tsunami.c  |  4 ++--
>  arch/alpha/kernel/err_common.c    |  4 ++--
>  arch/alpha/kernel/err_titan.c     |  2 +-
>  arch/alpha/kernel/pci_iommu.c     |  4 ++--
>  arch/alpha/kernel/smc37c669.c     | 38 +++++++++++++++----------------
>  arch/alpha/kernel/sys_marvel.c    |  4 ++--
>  arch/alpha/kernel/sys_titan.c     |  8 +++----
>  arch/alpha/kernel/time.c          | 10 ++++----
>  15 files changed, 59 insertions(+), 59 deletions(-)
>

Nice cleanup work.

For a v2, please consider adjusting the commit message rationale away from
personal tooling and towards general readability and editor/tool compatibil=
ity.
Otherwise this looks fine to me.

Magnus

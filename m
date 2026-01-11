Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D8B23B615
	for <linux-alpha@vger.kernel.org>; Sun, 11 Jan 2026 11:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768131623; cv=none; b=SyPSb1XHlrYO2oYs5oAwH9qDoyaF9U0Y8CGk+B5s9W9+iBXvv3ouecRBtlFe16pPlvKZQbl864Zqdr3cim86VyuyBm5fsGPOtTbbNmSWNBMekn70e9DOKWIMoOacqY9KQrq6+fH8d3ODuUstWxfKAu6UWp3DbAhAUJeGIWV4Vao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768131623; c=relaxed/simple;
	bh=Kriie/6edt/7mMffISeRAPE2MA8cV+NLr39NlAigjHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JhzBSYPyafd1Znf6OS1Ciw69owKM2ipcUMYBwlecnVilmfBQsJITyENk1jB190HDwn3UUDEtM0uEkIPc+1defAVSJ4bgAGSiGB1YkmTd6fYsYtGMhW4adbGlYE5LDIW9ltuYosJJdP+cxdGKGVjd1ZHEsFa91UhKFUzyP0K5iDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wj8WzTR0; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wj8WzTR0"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-431048c4068so2592126f8f.1
        for <linux-alpha@vger.kernel.org>; Sun, 11 Jan 2026 03:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768131621; x=1768736421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sRWWv+edKn1RAkq0Hog4MX2cR+uiFgVxQ3Wo8SvjN3w=;
        b=Wj8WzTR0TBb1DrIxH8Coy6eI6co2gr02ueMS0XbjwQUrP3lampp3EQV3kEoXczy1Lp
         sIYkldGriPHGqwC7R8UkRz2zyueI1PcKJg+aYvSyhyssDBTFe6EufzdC/Q3lBveKsAbd
         O8H7u/3cNvF2vgNewY0NC2Q46/JXolTvX/wcjmNKJhUxtNfrM8FVdwVKeWa9/zwD4RnL
         ODyDKfEMKb7qFZtxPPlv4v6M08t4aTi6v8bMBv9cX2wJ2OTQzcmNSO5T4IuclAsLuq5S
         T+RDlcUgBFTF84midLzPTLaMrP85wDckh0SRPW4LcGZkKhwQYtBPeFH8V6eZyGJXOpHY
         jetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768131621; x=1768736421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRWWv+edKn1RAkq0Hog4MX2cR+uiFgVxQ3Wo8SvjN3w=;
        b=Q2dm/0tXqMeM4QXuCqTE1EiaWhJ91JNLyig7LMdiYXOIMBAkM5wrcoJ+4gOOCUQlZU
         nJk+YWdL1LGHIt+7G9UFbDhdQ5iD+tgpZ1O7E3JOsDC6zX36trlPGcoAg3yFePuMqb/L
         qWTsEZjHNH/dBPthLulqjuVLWRssGXoLj1kRahnhdqBAiOkDXhQlPapAmguW9SHfKlhH
         Jw8Sx+UuRnxLutzwCXPwX9hICCm/JZsP3a2GDfQWQRgJfFC9PzVVoR8gcw2pEwA4lvEc
         1FY98Y+xOH9OD0SLRhBbdUvB3e6vcRbASY4tymt96fILhSkVWomg+1ZBsTkKPRTL5NBY
         zWeA==
X-Forwarded-Encrypted: i=1; AJvYcCUTJRHpa1TvOtdeNOg2q8DJGWK7zrjv+9te7AlxaWUfuuhRfLSvbV90eAOmjncgZaPCj9iRNJeNT5wqWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIEiX8/vih1cctoIUgMUsYZsrwdEpvAGUXrHDTlxh2URb9u7wO
	6SrJaFDFfyv4gev4SBkln4Fw24KUYYOdLo+eMUjPi9Z0mygSsWVXL2d3
X-Gm-Gg: AY/fxX4X6xc8yL/fYWpTBpPNj5+Du9OM2SygX9EKwnNfV/tAiwESYrpHq3LB32sQMUZ
	pnV4CJWznBPUZR+fRVD9qQ5LhIiwjcncfRDkEObwRHJn0BRbi/dbC6mjy6VlG7SkX2kxRsf77D/
	wAzcBzCtP1uook/us/2w32QbPOWUwlPVcoASpcl+uRuEzSSkSp4Wqz6fOwv8EN+VJScD47UHw+E
	E3OvNKAGMsenU/JSZGEYJ4m3VTnWUy8EwlsoU4YpS09tiNq0lEsw1p1yrjylTnPL/aFUZwuYEJi
	RYAimaF6GvoTHaYvwaNqdkypDkuOx6rkWPg8eih/YpWiYkKcHmLEcHh/kKAZgvO3zUlI2uce4t7
	RxQDMNvdpPA1L+hlzHh0GVM2IDnFLlkQZFFITUXzepOFBHLEH4+KXT3Da62dUd7+cNp5xY8WcR1
	P+HV/9bq8=
X-Google-Smtp-Source: AGHT+IFIQWniWCR0b7UwIF2liKWWRST+AkRUHhrE04ivSpJiR1aQuBYGg13Oid8yI/q/HQk1uOYN9A==
X-Received: by 2002:a05:6000:2c11:b0:42f:b6ea:5e4 with SMTP id ffacd0b85a97d-432bcfe4a7dmr24434176f8f.28.1768131620552;
        Sun, 11 Jan 2026 03:40:20 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432bd0860f5sm32471694f8f.0.2026.01.11.03.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 03:40:20 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	linux-alpha@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	patches@lists.linux.dev
Subject: [PATCH v2 0/1] alpha: trivial: remove ^L chars
Date: Sun, 11 Jan 2026 11:22:16 +0000
Message-ID: <20260111112217.2126872-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove ^L (a. k. a. \f a. k. a. form feed a. k. a. \x0c) from arch/alpha.
These characters hurt general readability and editor compatibility
without giving any benefits.

v1: https://lore.kernel.org/linux-alpha/20251228063440.2623595-1-safinaskar@gmail.com/

v1 -> v2: changed commit message

Askar Safin (1):
  alpha: trivial: remove ^L chars

 arch/alpha/kernel/core_cia.c      |  6 ++---
 arch/alpha/kernel/core_irongate.c |  2 +-
 arch/alpha/kernel/core_marvel.c   | 18 +++++++--------
 arch/alpha/kernel/core_mcpcia.c   |  4 ++--
 arch/alpha/kernel/core_polaris.c  |  2 +-
 arch/alpha/kernel/core_t2.c       |  2 +-
 arch/alpha/kernel/core_titan.c    | 10 ++++----
 arch/alpha/kernel/core_tsunami.c  |  4 ++--
 arch/alpha/kernel/err_common.c    |  4 ++--
 arch/alpha/kernel/err_titan.c     |  2 +-
 arch/alpha/kernel/pci_iommu.c     |  4 ++--
 arch/alpha/kernel/smc37c669.c     | 38 +++++++++++++++----------------
 arch/alpha/kernel/sys_marvel.c    |  4 ++--
 arch/alpha/kernel/sys_titan.c     |  8 +++----
 arch/alpha/kernel/time.c          | 10 ++++----
 15 files changed, 59 insertions(+), 59 deletions(-)


base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578 (6.19-rc2)
-- 
2.47.3


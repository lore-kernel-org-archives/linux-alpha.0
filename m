Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BEC27144B
	for <linux-alpha@vger.kernel.org>; Sun, 28 Dec 2025 06:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766903691; cv=none; b=lIQzSgFyVmvg69R1FQKfAegMiu13BfNnJIXQ7CtEOb6NhSexeYraQDYrchF85YD9wph53bYVknP1hvtNTvnZV9kuKIAHIdeiJnSqPmWEXHjbxNk87aBJ4sVEb/lSgLOIiVAtn9uQFtz8723+NkqqD+5x+fo5DFjBN+8Alx1GtZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766903691; c=relaxed/simple;
	bh=+dBgwafK1WHE+TP5vVX3Fb6vaal8og5lmnIAu5wHwks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mU7ig9RWNaXPZsGbcdLVJJs2Jq3H1mBihPf1Hx6Fi4xK9IYyZFeWAP8gUII48yNogUqbD9FZUl3oY3utVCSEbF5IkuL/gLVKOdoS4njzoaJY+o2YgO4q6hktLIIKe57DXBN+QUbmbaWhIB5fm2FU6+fj68XHMV3Fdf818ndoheg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2euG1Gr; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2euG1Gr"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-594270ec7f9so9162375e87.3
        for <linux-alpha@vger.kernel.org>; Sat, 27 Dec 2025 22:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766903687; x=1767508487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ze4JDOO+w/8r4IHqJTt1vUQMM6G2qXdySjviR/vKtk=;
        b=K2euG1GrWIb87qXR/NYqDvJvxGFTu3UPgKgF0huDV5PJYXARvAKPkGfBYf6B8WH9oC
         JWk/fDXB7jxr0mPyiuC1mvLWfGhdw6lRYO1FT79BriWg8o4O/Y+kcGkH+uz3tKUV96lW
         TRUSsngWMmn2f6Qf6FN/cbWKTceJREyp3zTFCtGkv6KagUcwyMFLc2fFKQgrikSPJNEd
         1YitzQg1WQgjA3nWMDAZ+aVJ4Ey3/N+9fpQZPH6hr4E2p77CA3Q8PhkjrS7Dy2SFdexF
         482zQgy3EYfJ7Mt13ZM97TP2ZQXwwnnxcTnIaCWTtUEDgCT3Lr6gxcN+n0Tp5Vm+sGEN
         9Xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766903687; x=1767508487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ze4JDOO+w/8r4IHqJTt1vUQMM6G2qXdySjviR/vKtk=;
        b=UPvZuyzVoR3oXGQWuy/tTcx/cfbjB6B0a18hbz82xVNV7qfSZBQr52dz40P67r4H7A
         8mxSuVmW5S2kWvZOlAnXnkvdCzMTsTZY5XKeQrjvmPijsgVYM1N8IL7pkj5YWPtyDsim
         h7e5qNxQac6OO0q8CNh4LTM2kqNKDXOaOo7QA1KcEtYos11taNswa+DUSzb6cTLycCUA
         mb9N7COMelXDHhsZu/DX/iyxkMmoEu2apXhnbr7cRmx8+ZZuVhNdmc9bs3W33AvIsnyx
         E8EjNf1B56vdZC8nP2TjhSlkZaUjPzEMeI/HrQzYKUaLyFbC1BfILx4x7HvTlu4aRGAs
         9G/w==
X-Forwarded-Encrypted: i=1; AJvYcCUbAIgGjdTNUiWp6lN0BHeueb96pFnAO5kpsmogneRnkgCqVvcmf2QJnIlp2lVTX9980S4+ClJUTRvDJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBQkDDwehngeY8Cy8hQMGn4Z8A38fb+RH10oZZtjJEESDM/53j
	pShx6K+Cc4WuYIMmqjiv5PHGtS19p97LbpQEbwtstcjgf2Q7UIiblYG+
X-Gm-Gg: AY/fxX6uYq0tqGJayZ8g8Qgxia2EIo/qawQRBRQjlxqvK9as/4dusETvOOODCcAg32f
	UGXjVb8ynuuhiHI3RQvKIVlHB8EwnzHnRlFN3JQ3Sc4pL/oy+UDGhl6Sfus0S2QHrRc+Y3Jk2VI
	Ijw6alSDKXKpQ9tZhY5iPty0NC1sTwV6AFESTfkstZ8ONkZP/WjkwumH1zMz6gLVJjfUkJawfNL
	Gu5CEBB7JDRECRyPE9N9ipyAm2kRnwVe6/9tABRUV+uNnuFdnhmrJUagPbozxVL4xr2lM9gXWCn
	XNVAwMY87Kv8MHWDdlCYPbXkPGbItXkskNj7UhzCQT5WZNFMg8UU3NYFKZdl9lH1TkLq99w7hWw
	4+k1jlpAJDdB3hKIsA7gyLQl3VbP33ie6QJSt2OWdsxhHe+h3rVgr7KPBScehuAw2Ksj5qj0IcM
	Mom6n1cOO4
X-Google-Smtp-Source: AGHT+IEScK39qWney1DbtmJfqqJaGXJZQS1q/KrTQSNAdJiqhkIYncms5uKKRBKKHWTE3Ts9fsYWUQ==
X-Received: by 2002:a05:6512:3f26:b0:599:fe3:785 with SMTP id 2adb3069b0e04-59a17d65082mr9941339e87.52.1766903687301;
        Sat, 27 Dec 2025 22:34:47 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-3812268ec5csm66332301fa.48.2025.12.27.22.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 22:34:46 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	linux-alpha@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH 0/1] alpha: trivial: remove ^L chars
Date: Sun, 28 Dec 2025 06:34:39 +0000
Message-ID: <20251228063440.2623595-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove ^L (a. k. a. \f a. k. a. form feed a. k. a. \x0c) from arch/alpha.
I'm attempting to write my own tool for parsing kernel code.
And these characters complicate this without giving any benefits.

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


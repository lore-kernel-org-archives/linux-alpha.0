Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1D4305046
	for <linux-alpha@vger.kernel.org>; Thu, 19 Feb 2026 20:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771534554; cv=none; b=SX8m7rpDTy1cZ9sp8GHr+X9rpR3Y8PX50005nHhftqj+nVW7Um8qsbNBsRRnmx9aZXeyq/1w+85PIQTLmpb1eBJzikdMwecWwjl9VAIb4Hv4Q4iRkwIB2D3xvxMfJB/vU6lqapkNwZ+DbKps/RGXw1h56sg7ikWWYTVWA+Lkl6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771534554; c=relaxed/simple;
	bh=uXP1ohjFjM40tecGuIo8ml1RERwnAdFm4HtFsOJ4i1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IQfzS6U0lPvWHy86fl76VceOYUJRWgW4YbX32L3EmajcUZD7to/TiH0Cj4ykObg+QovkpTr5GmgwErio0V1om8Nut5gdOsV2qTxZmOJIF+CA8QDS/b9lMFdkm9nrEXB3xmhm2U5f70Q/8SdfaXP6x1bFkZeuX42sShdPGcgGHRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BR68BVrO; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BR68BVrO"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so1294473e87.2
        for <linux-alpha@vger.kernel.org>; Thu, 19 Feb 2026 12:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771534551; x=1772139351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oi4HU36xhM0rM4Q26SQ6PvvbnGglLWOBTSAiQhdXIK0=;
        b=BR68BVrOCmQmtna07PM2tglLLcIe3jP85n4aj350Lb2MChLGKGYoQfzsEqj7ndAgtp
         lEgZ/xFBvv1rbzB/rkOBwLhIaQU8iFIRxGh2SGI8gREPw0TdLQQiL5HnjvF8CvqoBDBm
         69sYMMKrT5TaHjpSP5cjDOpjKZG8QD2rmAgEi+rs2gp4aRtSOCwIqzB9CR5B5bB4lge/
         aeBYH3zw1tEwS2TlVFYEEzXAc6wn7lNK5U1HXXA44bcRxCBTzvt5kvonK/OiL+VS6nNo
         WEH49ZnH1vvVAs5KpVOFTAN7TDKn8WMlEgBFxoj4zCVQfRjRBgTHQ16tu+JRVwRRDhBa
         uXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771534551; x=1772139351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oi4HU36xhM0rM4Q26SQ6PvvbnGglLWOBTSAiQhdXIK0=;
        b=tl7d2fLKCf4NBTRPFnm6c8CX70aQal2wrlfjjVbXihV9nZ5JMrltVL54BRaEfEFwcm
         b9ad/oVMh9Q2krwHihdrRq8nyOmh8L1VeCQ48kPNX85bc/5nLzCYKcoyJ+PwIBJ1qZwj
         +FGU9kUB8G5m0t7VNbGXf6fLQdAgcmOQeh1nUX+BMeJafsl/RLbeSVeHfFXxDq/341XV
         UqztR8GASEKEErUN0uKdOrA1dDXvGtYs9/B4MSzkXvl97V9fdHfiGTFFHS9iLaflACOo
         qQJhM4tFx2I/GvqFiOWY13MtjzesXdQMoYFfGJalYEF761Ym3LmFUX3L8Du8HDJlLGmJ
         froQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8puVW/RwmwGvTyJsQytybZ7LyrZVDagQoEshJXhU4E23zangmtyGDgLdTUf5JOm25z3Uz6yLQUKCnbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbJmlV4QhNKl32EM0DSA3paXOAeppI5uX6BvueECp8eS6VC3J4
	HCLjYbTfzLGhC4KEV9XVI5COe1zkNIYxsJwGcR4bvTdcTwCko/OT5vTw
X-Gm-Gg: AZuq6aLu+vOpT9yaUCuXBEGME2XcZTb/AtPKzUFQWWjXOZbakkcnBOwbl752ttDm69N
	yGYcZt66APkpq68uLbQxhBMwFLBbaDkRcDzkziVZe0LH7T4H7diZgb0A9kPnQiyLJ2mGCLamZN5
	HurUEXEz+25csl4IicvCSamIEmBOkGaFOK5FkAbJAHCkVF/buXH0puzEZYYJtnf1t50aOAA0Eqy
	5cNSq8DimtDVyeLRi4qnaRwa4egaMSOit2sLehMGFWRiK58oRpq8zfABmzSc9BYnNUmKJlaOVbC
	v+6AsTZq79UbH8hurMPCiBf6Xk2AhmNCfTNwGUO0plq86NMocXyp397MhepdtZ0FZ5R3+ZsNuEu
	WHaI5ti8cdPnmLQu2rgsZBw/ZhkVo9cew2iNYRocvQkOWJK/pc12A15eD+m0OJeXG0cKCoh3jsn
	bs+OWjcaPO3un1++omHbTn3pRScR8D0pqr/ddCp9N7Yinf+4BnNkXQtVHU47D45rJo2rHetXa+z
	JVtz9ergSAuvsCtNNSnsOGWSwCdDmLJ/o8mAaNaTEaKKA==
X-Received: by 2002:a05:6512:3a90:b0:59e:38ba:1821 with SMTP id 2adb3069b0e04-59f69c789f9mr7564403e87.48.1771534551239;
        Thu, 19 Feb 2026 12:55:51 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f89a356sm5443917e87.92.2026.02.19.12.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 12:55:50 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	macro@orcam.me.uk,
	macro@redhat.com,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 0/1] alpha: enable DMA CMA support (HAVE_DMA_CONTIGUOUS)
Date: Thu, 19 Feb 2026 21:53:48 +0100
Message-ID: <20260219205514.4434-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables CONFIG_DMA_CMA support on Alpha by selecting
HAVE_DMA_CONTIGUOUS and wiring up the required architecture hooks.

Alpha previously relied solely on high-order page allocator
allocations for coherent DMA buffers. With memory compaction now
functional, CMA can be safely enabled to provide reliable
physically contiguous allocations under fragmentation.

Testing was performed on an Alpha UP2000+ (SMP) and a DS10 (UP)
using a custom kernel module that verified the following:

  - Correct CMA reservation via "cma=64M"
  - CmaTotal/CmaFree reporting in /proc/meminfo
  - Successful 32 MiB dma_alloc_coherent() allocations
  - CmaFree reduction and recovery after free
  - Successful allocations under heavy memory load

No allocation failures were observed.

Magnus Lindholm (1):
  alpha: enable DMA CMA support (HAVE_DMA_CONTIGUOUS)

 .../io/dma-contiguous/arch-support.txt        |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/kernel/pci_iommu.c                 | 46 +++++++++++++++++++
 arch/alpha/kernel/setup.c                     | 16 +++++++
 4 files changed, 64 insertions(+), 1 deletion(-)

-- 
2.52.0


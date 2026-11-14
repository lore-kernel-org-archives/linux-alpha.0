Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650030;
	b=kaEmJM5mbaoeTEQMBFXSBYKyElG5M1aYPIkCyF8fOYFkIWLueYeaabnt6znixJNaQxGT
	 3NLapAZyD6ApfbBBaTBmLpIZnUC9bRs3LA9MXX3wZaIzN8BHzIXecnJpOjoXgtx+RcN64
	 JrbVxkGgzt7+ZajcSqNvUZradkqqa9EN2C+kgl+MJd5CCpW/qJh6X+y73ZAXcArhsnA+L
	 D+IH/GUHnXFDXrlThfnyYBwEExe3dlMapRDTGxRq4NVubqPe6wyeEsggesRr3c1dvCiKN
	 7EHxmpzNzuEJzC3SJIvNd4bZoiXkgkrxK64H2XlXnytSxf0Am38zVJmamSt/zF6Cy4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f7twjAGqTefNetbUPu09hDc/iSPsogMXjZV3p18saLo=;
	b=o7sUOnWLSix5sdR9KWJBWzF/Utb/WMLBLm46PbL0/P8nnGxi12Eu2pmWUKmvDt560waf
	 bnEh/rqLLAytpI6bBFYNEsLnGyA1VlZOadag4oMnN3hwKQNzpM2mvr9XlhQAdkvR2OBx6
	 dR505Kg8sYq+LoKhzd25krEUDUEvoCZ4GnksGISzo2J0861mj0GyOPBqY1CUr96kKfQH5
	 w44ov19q8M8uqwL39Y7LCacVEqDYBxnZzRWBeQoQSnnotpr06tRiF/lzeN7/08Hl3WpQr
	 zs4RK9mJBF39bkiJG6QOIVZ0izV69he9KrAdiS0Dg8SBe8fAkj6bZ53/9tGy5Dux/dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L3fEDOUK;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A986E606A330
	for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 09:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A986E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L3fEDOUK
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c5067a2411bso314060966b.2
        for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 01:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794650028; x=1795254828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f7twjAGqTefNetbUPu09hDc/iSPsogMXjZV3p18saLo=;
        b=L3fEDOUKUrMGN+T6AX+4RQ3VUn1y+jH6+iefZneP3H1ilEigPd0NTSzCv/ELLZ0Vpp
         VhlPfN+sVbGWgNzewj2RPd9WO/sHZMTkdY4rxGHqVngCkNOM3PlGxnr8mglE7RQnLNaV
         hbOQgCV+/mghOd1j1KvGLEjNico4uf7QCu6nCSZApBFdLh0lxTVJIuN4v7nV/eQunOdE
         ouiy10wlvDA9vfn9tXFqbwyTC7hLIgCpi/JZLYskMyjmrh/f79682k3OPD3vUk3aHYIv
         6MXOUK0ioIHmwJpF2qW8UBojR4zEfM/+xqZWIjwxdBx+Y4mcORDRzY1DlUMYcwyO0d4R
         x5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650028; x=1795254828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7twjAGqTefNetbUPu09hDc/iSPsogMXjZV3p18saLo=;
        b=rq1skgJprMAUssqLnzCulx36ctULaQ0AXB9U8NN9XiZsHlMkaVwjVEApLKG01Pp3hT
         rEh2ohkD4i6jMZSdpqhe5aDeIF7U0oQVK5xiS++Pt0m11+pa+p0wKOulJ47X9sH4twRN
         uUgEB+fiIr717eFCUxZmx2cFT3t8GFmJYdNtWK1jvTxoFHmLdOBHGL3MWL0OLrFl+vFu
         s724lJZ1Or1sn/2aLHhBdOVGnHqUuLdRUx9Uq7vsj5IuWW3gfrZGxt4LhtJMN3nNsxWI
         Ltd+xiB4XSdH7hnO5SR3T2Gvj9gerqMJ2n5IRbnQVk0z8eC+tzLyQeWzAlTE3gxXTcyn
         blVQ==
X-Forwarded-Encrypted: i=1; AL+hErEO/ZcldD7aw/AvibMAlXMuONhbZbfkIfvVkVbgV2Rb1nalGp6DCt3ONccX9Ce4doukfeDMkQg1UVZNDg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/qr9WGI6HtfYe2S5g8VNQZn322HQ0sWBgJ2yHh64C409+qgmvE
	x0b4DOwW/aqCOYj6sfKrMAzJRRy4ga3saDiy6qcVELOTRws2ySBbkUFo
X-Gm-Gg: AYBFou2JTJtAEIqpEPdzFMunG2rBlbLN8dz4X7XropFU/0/JPjpWSNCeVjeRAxoUHVD
	6LlxFiYCpdNjc3A9ATEe+hd3mqPKfNEiE3WoZi5cgT7UM9bj4SmObJeuEya1RgiC6V+3RSaF5Ye
	yPV4ptc0sBe9EBHDX/XvoTqF9V1Al3lfkF2I2pEUZbR3nWQADQ/vdlRI9JyDUKAgkqWoPhtfpW7
	xZCfXdEEnIGuBh/1rQ3azpwX30ZSzr1/G+h6ObrTtgHcJxzB5S+6jUyMALKe66FMYwmimMdow4l
	oueUAqNAqXY1F9Dujq+ew7BuBj3TmSYGHhx5rTNQ26hfGkZh221kKznx+lAO/MGbBomK55DooDe
	FwzdU/iWeXAzgJJYYtZFwmqK5AMf6sxLdUl4lrgqAYQiCJTLVA7ytsTR2bDBk4EQ7aJ8ZMuu5LX
	eRgNGDRNGQF7M7kyyIqqYn+81SSuqDWBC/v8cSFN+7qo2LWyNrRigMmE7Yuur/sY6Sg615qRWkn
	XLOjLqHrQJPffb7Ey1uhPuiHq4GyA5pu8YUKU4l4E8716c6CuYQMJ7KFu2geMgmq21+APlxHOoh
	ZSu10Sl4NbC9M+/3FWvtfncxX67XVT4SPW7j1deRmApcBJ4irj9lyQjcnDmjp6uldEln7Ac=
X-Received: by 2002:a17:907:1c9e:b0:c50:93b6:52ed with SMTP id a640c23a62f3a-c509654e2f8mr451033166b.40.1794650027938;
        Sat, 14 Nov 2026 01:53:47 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b236d4sm197311266b.18.2026.11.14.01.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:53:47 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v2 0/2] alpha: enable DMA CMA support
Date: Sat, 14 Nov 2026 10:53:15 +0100
Message-ID: <20261114095335.1283016-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This revision addresses Matt Turner's review of the original CMA patch.

Split early parameter parsing into a prerequisite patch. Use the generic
DMA contiguous allocation/free helpers, skip CMA on the GFP_DMA retry,
and use exact-size buddy allocations to match current helper semantics.
Remove the redundant highmem check and preserve existing zeroing.

Reserve top-down below the direct-map window and usable RAM limits.
This avoids preferentially taking low memory with bottom-up allocation;
it is not a strict exclusion of the first 16 MiB. Explicit cma= address
ranges retain the generic override semantics. If there is no direct-map
window, skip the default reservation.

The configured default is 16 MiB; cma=0 disables the default reservation.

These two patches apply independently on for-next at 0b4cadbe7c39.
The ES40 test kernel additionally contains jump-label v3. The combined
kernel, boot image and modules cross-build with W=1. Both CMA patches
pass checkpatch with no warnings or errors.

CMA testing on a three-CPU AlphaServer ES40 with cma=64M:

  - Reserved 64 MiB at 0x7c000000, above the first 16 MiB and below
    the 2 GiB direct-map limit.
  - Ran four allocation cases on each CPU (12 cases total).
  - 32 MiB and 24 KiB (three-page) GFP_KERNEL allocations used CMA.
  - 8 KiB (one-page) GFP_KERNEL and 24 KiB GFP_ATOMIC allocations
    bypassed CMA.
  - All buffers passed zeroing and CPU write/read checks.
  - CMA allocation/release counters balanced, and available_pages
    returned to its pre-test value after each allocation was freed.

The initial harness compared CmaFree immediately after freeing a small
allocation. That was not a reliable per-allocation check; verification
using the CMA sysfs counters confirmed that all test pages were released.

No new kernel warnings or faults appeared during testing. These tests
exercise coherent allocation and freeing, not device-initiated DMA.
GFP_ATOMIC was tested from process context. Boots with cma=0, cma=4M
and the default size, fragmentation stress, and no-IOMMU platform
validation remain outstanding.

Link to v1:
https://lore.kernel.org/linux-alpha/20260219205514.4434-1-linmag7@gmail.com/

Magnus Lindholm (2):
  alpha: parse early parameters before reserving contiguous memory
  alpha: enable contiguous memory allocation for coherent DMA

 .../io/dma-contiguous/arch-support.txt         |  2 +-
 arch/alpha/Kconfig                             |  1 +
 arch/alpha/kernel/pci_iommu.c                  | 13 +++++++++----
 arch/alpha/kernel/setup.c                      | 18 ++++++++++++++++++
 4 files changed, 29 insertions(+), 5 deletions(-)


base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
-- 
2.43.0


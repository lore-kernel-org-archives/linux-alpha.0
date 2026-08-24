Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C591377EA7
	for <linux-alpha@vger.kernel.org>; Mon, 24 Aug 2026 18:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787595111; cv=none; b=XCWaW4zfb1t4IP8Oa+AWzXoFHtYC5b25l0Mw8/By4dvi+XFahU9S/WtEKT0UTShoyiIFm9ygkzJYurTZubM2i7ew29kLmhgqFAO7l8bNw4BtDj8GnaeROA4g3s58C8QV/kHMo3NPsQQcIB3+FBBlvUZBtDBK4Q3oroExHP/iIm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787595111; c=relaxed/simple;
	bh=MDZe9E4t93ZKZ9CWIn3OeWSjkVfP/QNe+b5AN8xnqb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p5eBtF3gTVW2b6Pv+PRT2H0jFygwqeXNAUxsHrbjnwXBE8lDoXfvQuNe0E8PgkH6I20AWjHiqGKnZONH4fQJSabW8NhcOQ4yavf8LeQKz3U+HBMok/baPqPdcR0RbUzRXwsExIKf7/RPS6IoZoIHjPeJQmz+AMT940+0t5coCNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5StIGEa; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5StIGEa"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so6806589a12.1
        for <linux-alpha@vger.kernel.org>; Mon, 24 Aug 2026 11:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787595108; x=1788199908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SBNJ14VCdpFgw4LDjCoQmNNZfTNO5gFu+ceu/TNn3/w=;
        b=M5StIGEaCBb611lwUFIjuq5EivPyA1PGjC1RQs0bSJYDGk5JPellOt2VVT8jEHCgX/
         VRWkQfztIegIRMQqGaBd7cr6c2cQlhGg8rwZpGnZDfgoglJS3NmheHOzdnKQ0T6oubgt
         wDUK2P53gqxUV9EKfKsUMF3BWBoG4DnDivB/xCbBzJlGlWrNsFpdgYjvoJz8VTncwKmV
         H+hRcZoUUCTsJnIFnkRoyFYSHJfeMskPEQuGKBIf/7Hj+M3wQNAUsWWMV7gEygbxpuPI
         F2kZflxIsNorM5VfRmhD/sa+MCQbnCOs/jAJ/XZzh1kLupBXMvCLu2stGr2nM1381YbP
         MFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787595108; x=1788199908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBNJ14VCdpFgw4LDjCoQmNNZfTNO5gFu+ceu/TNn3/w=;
        b=A+ZEfB5WOjWm/tZxYCzjXv2Lws1osxZjc/2bGrAF+XcYR2hnPdGN+G7wfPpD5E0vTj
         6iz/Mk3cnuHUGnUVQgleYYd/j1ZVoSINcWBy+LnlOyMBLmScqZw3lYkyLCxuwQSCQ0oL
         u7SqHqFPYrTUB2h6FrnJbu2MUIjLnW/iGB7JypDrED6qW/qos6zdDKHlMvoAuHclyhE+
         +7OK62Ay5kCWgMudD1lgJE9ndEvYVHfD5UUG415xzfgYQkxhxzRuD8wSn1546hnYFewU
         K10u2NUx3ur+5xfA/CGM37Bk+kzNfB2Ln/oWxq/abSJLasE8ukp8+ayzD9SX2dT6iOJ+
         kMfA==
X-Forwarded-Encrypted: i=1; AHgh+Rptrbvarv9Zta1PkByaMv+02fWa4Q7KPQYQNogkUloIjIGPEMKeMto7MOM6+j3VIK9Z/5hntuM95CwC/A==@vger.kernel.org
X-Gm-Message-State: AFuF++llCTWwV4v7E55ozo4/iOdvCaQ/V91CY6Ba65410+4qkxrCUWT2
	0pcQTTvTSkFUVFGO4n9YhMKUpNTfpG+EtUVpNhWJTm6dcNTveRQjFxOEO61LpA==
X-Gm-Gg: AR+sD12fFI1ibK0Mgh0e69f6ZX6KAk07mWBU7ZA1wXB9yuri15wdLYMJJ6U+SV3NPnx
	M3gUuT1yAqi90rhDVgv9hDdGtmXC0q1P2ACssYAQps7e0YiEZaEAk0ZKe2KD4IBk3slt1jEPn6X
	9cd/dzAtt3Vegby4n9poYVTSjzVP7NsgG+A3gIAHS6DQrb77T71O9kMj2Vw0g1QmuKyiGP/FKms
	oz9N/7RICbOeiG+SV9cCbqgL8R8iUn5240XO/Gpdl8uk/lWidUSFzK6VwZ3IA/kwZPrmjky50gm
	0tzfDf89bFCxYGJxy6ngupDutZCvMIeptA8y1nGl6YEOaodLYBDxaXVpOHkCJKYOsPhFGr6pWju
	Xpd4WM8OBbsd7RyyvP1HXrFdSF9KxWZl6plcJYplyjhMBuJqF9k2FbCJhoelF0O/1LFTFKMyxBU
	ywxL/eU4GJAxknu8OW7HhwIJkVwqA76+vZ/Acm0kmkQdsi9jv9KMKC102SD4Q/S8l1LBP0JD21g
	3RUxw26txTalatwCUjtEpIL+YgWVE4=
X-Received: by 2002:a05:6402:510d:b0:69f:d4b7:9476 with SMTP id 4fb4d7f45d1cf-6a5c40f286amr448135a12.4.1787595107634;
        Mon, 24 Aug 2026 11:11:47 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59dd550bcsm10586910a12.0.2026.08.24.11.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:11:47 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v2 0/2] alpha: disable DAC for 32-bit PCI cards on Tsunami/Typhoon
Date: Mon, 24 Aug 2026 19:36:52 +0200
Message-ID: <20260824181126.3559638-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a follow-up to a patch I posted last year (Sep 2025, "[PATCH
0/1] alpha: disable DAC for 32-bit PCI on tsunami"), which was not
merged.

Changes since v1:
 - Split into two patches: generic bus_dma_limit plumbing (1/2) and
   the Tsunami policy itself (2/2).
 - Rebased onto current mainline (pci_iommu.c's DMA-mapping API moved
   from map_page()/virtual addresses to map_phys()/phys_addr_t 
 - bus_dma_limit is now treated as a numeric address ceiling rather
   than a bitmask: the DAC path in pci_map_single_1()/sg_fill() is
   bound-checked against it directly, instead of folding it into the
   DAC capability test in pci_dac_dma_supported() (which is otherwise
   unchanged). Fixed a NULL-pointer dereference this exposed on
   no-IOMMU machines once that bound check could fail. 
 - Use ST_DEC_TSUNAMI instead of the raw sys_type value 34.

Boot tested on an AlphaServer ES40 (Tsunami) with a QLogic ISP1040B
controller.

Original background, still accurate:

I've spent quite some time trying to make the qla1280 driver work
with 64-bit DMA on Alpha/Tsunami systems with more than 2GB RAM. Many
thanks to Martin, James, Maciej, Thomas and Christoph who took the
time to provide feedback and testing during my attempts.

This is what I've concluded:

* The ISP1040B (32-bit card) works with a 64-bit DMA mask on a 21164
  Rawhide machine - the card itself supports DAC, even though the
  data sheet doesn't officially claim support until rev C (as Thomas
  Bogendoerfer pointed out earlier).

* The ISP1080 (64-bit PCI slot/card) works with a 64-bit DMA mask on
  a 21264 Tsunami machine - so the monster window itself works fine
  on Tsunami.

* Data gets corrupted on Alpha/Tsunami specifically when DAC/monster
  window is used by a 32-bit PCI card. The amount corrupted varies a
  lot between runs, from none at all to several kilobytes out of 20MB
  transferred. When it happens, it's always in 64-byte chunks, which
  coincides with the 21264's cache block size. Manual inspection of
  the corrupted data shows it's memory content from other active
  processes doing DMA on other drives/controllers at the time.

The fix is unchanged from the original posting: limit 32-bit PCI
cards from using DAC/monster window DMA on Tsunami based Alphas, by
setting bus_dma_limit to DMA_BIT_MASK(32) for devices that have no
64-bit memory BAR. There are 64-bit PCI cards that only have 32-bit
memory BARs, like the QLogic ISP1080 and ISP10160 SCSI controllers;
these will be needlessly constrained even though they work correctly
on Tsunami. I believe this is an acceptable trade-off, since those
controllers are not known to be supported by SRM firmware and are
therefore uncommon on Alpha systems.

In practice there are very few 32-bit PCI cards likely to be used on
Alpha with drivers that request 64-bit DMA addressing. The only
example I've found is the qla1280 driver with an ISP1040 controller,
which is supported by most SRM firmware versions and hence fairly
common on Alpha systems.

Magnus Lindholm (2):
  alpha: respect dev->bus_dma_limit as the effective DMA address ceiling
  alpha: disable DAC for 32-bit PCI cards on Tsunami/Typhoon

 arch/alpha/kernel/pci.c       | 22 ++++++++++++++++++++++
 arch/alpha/kernel/pci_iommu.c | 22 ++++++++++++++++------
 2 files changed, 38 insertions(+), 6 deletions(-)

-- 
2.53.0


Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D06381EB6
	for <linux-alpha@vger.kernel.org>; Mon, 24 Aug 2026 18:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787595118; cv=none; b=FgBoLHLQAda2CvN2kwxS6eJ52WuKnU9/6uAwVyCA37ij89dhkvT0rwGcEKKkvo9EVsfnk6xmOAMG7qksXi2derrYU67YE32I5h+SAY7HXiyGGEw2WZfCENBOisKKVzWvJgm9KpgXTMrOrL0sZ0EAlMh7+Ym5k/I47ueJX7J1jUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787595118; c=relaxed/simple;
	bh=DoyynfnFNtu8deR4YMJFA+pR5wIO3iFw49c+1eis2pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SNH83IylJfiEettTn7ItmJtAhHYh0Be5hRVNVyrsbsZ2u77Evs1ZlQioZ44qvuH2kej+Mu2Lgo2VhueKcv3+arUjU8FhoECI5nFh222PmepM88nfdNghAI/VUvJlg/9CFUbzpfCOiRmolcRpE4WTiuwodoq9pSNxZ7Ef/4GhQyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaZNEkji; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaZNEkji"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a378f90555so6042344a12.3
        for <linux-alpha@vger.kernel.org>; Mon, 24 Aug 2026 11:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787595115; x=1788199915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zj2q3arXj3Q/m3Lr27G5YOHVKwirt8ukHHM6JzuqaPg=;
        b=PaZNEkjiXneWo/tlnW3Tx/fpAWpG8Qn1MlbYgQ+ReiP36lNqNJlaw5+YGHc90Acuuh
         I0EKaxUXyMlil0eglyAJxtle3n9TMzeBK46YXPCERce+RBmttIEriyX1/0bWBYS5V/yH
         jT17W0Xay+gYkwhO+jRfs0Pe21XPv6/kHreDefSKZy6B48jTXwaRYAdyH9A6+lrjp4Dq
         XX789uZQ26SVOgmnGtPAmWTtcXJKj58UyLneQr45M3qrIzwB4pReS34YZ0MUtALiMfoi
         XDAjW1Jl+RU+ExL4gwSroPo7xnnnW5VEF2w0Z+JjvCrl7haa6F98+VGPOuJTfSmvcY+i
         fIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787595115; x=1788199915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zj2q3arXj3Q/m3Lr27G5YOHVKwirt8ukHHM6JzuqaPg=;
        b=dl3ln2ofofag3Sws1VsNoDkwJN6+PA2W8y6IEYvAk8sWIKpVK55VFFsoaJTdL0MWRv
         qeSIRZeHILw0rEpGXoPYNjR7bK7JGr0ATeXC34FXtM+hw89XTF9MqKBbTotkBYV8pmVH
         W7zdtF6zaaR4BNiklR0X7iuWXLSsxIhWA/+wQ53CSkWWDgQhIEIcJG9fS0NVmHoQqMKE
         hc/AopS+pOEvDnMtnNqHGebU/CzWKnyS55DlBfAa3WS35yIzi3PUygkNu+tk0S4nG9As
         NO646shM6YZy/OMX6hQZxeRtWe/TeTUHJqWVgvhzBznkC4RY/vBzdjbJiB3AHs9vGhrI
         t5Kw==
X-Forwarded-Encrypted: i=1; AHgh+RpVcDwJXN5rGlLFj8YxzW9fCh7LRGBfdt2dCmVItSbGqqqbw/CKVZ0xDJx/+ibXTZ1iqTXLYNscmwI51Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mIKM4VD6hflHDHqudyMYXJPAlAsxTAJHSgGlU7U6mxWDN36J0N
	FZkOX1w3isjulyAt63xNsKemcXsxtxEE4KHJlUQgDLuvWOmqKaqsdSj6
X-Gm-Gg: AR+sD10J5pqeAu+4YQtl7uZFvtZuAdqrVQ2Rx1qekhCk6y2D6pWPRIvdZIt1cvu4/Uf
	6ck6J+ODCtcuwNqoEamVN94Ym0ctAWWMFSa3ekSFoBmjbtkYp29eGa3MB/ZPAfOnKfAb8tgIdnL
	k6uDF3rFqTZOuGMyIsGrFgU2NiRrPnCWeYH9yEAJMBNyDYwLJfVP6TqZ6r4i1LhaNZZlSuAsGmI
	166LcCpNOacvQR73N9GTpmCilO9HM4fAYFZ6TZhKRBpxTvYrE26bBFjLywI9rbCzL/qB+3PG9+y
	kdr5iQja9ruU2JHl6GVoycqetAFkseZ+OHHPRJatTNgDfkM+MjZNqEe/C/j+XKwzTc/03vzZay5
	vMqvNHXOl4V1LG1suQK0zbhNO5eMdQbvcJZ2YEv8ouuIzC57ru5ewJM+vsE/lUyBUN3KteUq0ku
	ZGwxRW0YWPRyTT1NFkHfndAsBVPYL6cz2/molywlxSb0C2+BxUlFoK2cfpL71vd9kCn8R0BCVhc
	wPsmvLIHVFX8zOUZl7ausOUFW32h5I=
X-Received: by 2002:a05:6402:2187:b0:6a3:905b:3c40 with SMTP id 4fb4d7f45d1cf-6a42f1d0649mr31076425a12.8.1787595114678;
        Mon, 24 Aug 2026 11:11:54 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59dd550bcsm10586910a12.0.2026.08.24.11.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:11:54 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: Magnus Lindholm <linmag7@gmail.com>,
	Maciej Rozycki <macro@orcam.me.uk>
Subject: [PATCH v2 2/2] alpha: disable DAC for 32-bit PCI cards on Tsunami/Typhoon
Date: Mon, 24 Aug 2026 19:36:54 +0200
Message-ID: <20260824181126.3559638-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824181126.3559638-1-linmag7@gmail.com>
References: <20260824181126.3559638-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tsunami/Typhoon Pchip's DAC ("monster window") path corrupts data
when used by 32-bit PCI cards using DAC addresses above 4 GiB, even on
cards whose DAC support is otherwise solid: the same cards work
correctly with DAC on Rawhide (MCPCIA) systems, and native 64-bit PCI
cards are unaffected on Tsunami/Typhoon itself. Corruption shows up as
64-byte chunks (one 21264 cache block) of unrelated data - typically
identifiable content belonging to other processes' concurrent DMA -
substituted into the transfer; the rate varies from none to several
kilobytes per run and has not been tied to any particular alignment.

Work around this by capping affected devices to 32-bit DMA, which
routes them through the existing scatter-gather window instead of DAC.
Conventional PCI provides no status bit to distinguish a 32-bit from a
64-bit option card, so use the presence of a 64-bit memory BAR as a
practical proxy. This covers every affected card seen so far, but is
a proxy rather than a direct test: it will also needlessly restrict a
handful of 64-bit cards that only expose 32-bit BARs (e.g. QLogic
ISP1080, ISP10160). These controllers are not known to be supported by
SRM firmware and are therefore uncommon on Alpha systems, so the
trade-off is accepted.

The only driver currently known to hit this is qla1280 with an
ISP1040 card and a 64-bit DMA mask, which is a common and
SRM-supported configuration on Alpha.

Suggested-by: Maciej Rozycki <macro@orcam.me.uk>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/pci.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/alpha/kernel/pci.c b/arch/alpha/kernel/pci.c
index 11df411b1d18..7dbf380acd93 100644
--- a/arch/alpha/kernel/pci.c
+++ b/arch/alpha/kernel/pci.c
@@ -23,6 +23,8 @@
 #include <linux/cache.h>
 #include <linux/slab.h>
 #include <linux/syscalls.h>
+#include <linux/dma-mapping.h>
+#include <asm/hwrpb.h>
 #include <asm/machvec.h>
 
 #include "proto.h"
@@ -117,6 +119,26 @@ static void pcibios_fixup_final(struct pci_dev *dev)
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_ANY_ID, PCI_ANY_ID, pcibios_fixup_final);
 
+/*
+ * Tsunami/Typhoon's DAC "monster window" corrupts data on 32-bit PCI
+ * cards; cap them to 32-bit DMA by proxy of having no 64-bit BAR.
+ */
+static void tsunami_dac_quirk(struct pci_dev *pdev)
+{
+	int i;
+
+	if (hwrpb->sys_type != ST_DEC_TSUNAMI)
+		return;
+
+	for (i = 0; i <= PCI_STD_RESOURCE_END; i++)
+		if (pci_resource_flags(pdev, i) & IORESOURCE_MEM_64)
+			return;
+
+	pdev->dev.bus_dma_limit = DMA_BIT_MASK(32);
+	dev_dbg(&pdev->dev, "disabling DAC for device\n");
+}
+DECLARE_PCI_FIXUP_FINAL(PCI_ANY_ID, PCI_ANY_ID, tsunami_dac_quirk);
+
 /* Just declaring that the power-of-ten prefixes are actually the
    power-of-two ones doesn't make it true :) */
 #define KB			1024
-- 
2.53.0


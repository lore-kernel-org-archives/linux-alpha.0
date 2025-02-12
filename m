Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7184A20B7E7
	for <linux-alpha@vger.kernel.org>; Wed, 12 Feb 2025 11:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739358960; cv=none; b=kRU8aHPte1Nei1o+3fJNShzB+B6SoTXNlfLkEq663X5QlSnzsoiGCjoKroUniqYQ5ubQEUspoS42LyeAhScCE0TRgKbUkL1Y/7jpl5MjixbiXdvrnw0674OMBbyeKTLVBT7QYxVxzVN8vPOeJ1khff9zQjruAsVRXqKpDNhGkPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739358960; c=relaxed/simple;
	bh=WYtHUND9hBAbnQwP77+rUM/btGdN4jw7BzumAFm3fH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cUdvn6M6efezbxZXvXmZkdjq5FT8ohSArFeQLWJKXocs2dkgnapjeQUQgTrb6/hWITjg1wS5ixxODtkBrkoel4gA6ywuJcVGI2chsZhEegSyYbJM5Io4NF9TAhvltM0KAbK59mhNdznGXJYnG/FLY81wNZJFALLu9DG4gN3SyDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WazfGzcz; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WazfGzcz"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739358956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Kr/yp+z2yzlhwItC3YopAzacvObrzqFyIuCIGJbNTsA=;
	b=WazfGzczwVB7vraan4TB295PIh5r+q8uwKgMAwmlHTdxZYvHPJF+CPAS8WY3UbxQaySpHq
	x0m+wpuljobzunU0hdgCf1MhQBT3We38G5I8IeOzirO1GAVbrRvAz9eVBXIb9v1dKV+m49
	Mid//t3hC/ak43XDZqIvp3TqSTa5fJE=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] alpha: Use str_yes_no() helper in pci_dac_dma_supported()
Date: Wed, 12 Feb 2025 12:14:47 +0100
Message-ID: <20250212111449.3675-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_yes_no() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/alpha/kernel/pci_iommu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 681f56089d9c..dc91de50f906 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -13,6 +13,7 @@
 #include <linux/log2.h>
 #include <linux/dma-map-ops.h>
 #include <linux/iommu-helper.h>
+#include <linux/string_choices.h>
 
 #include <asm/io.h>
 #include <asm/hwrpb.h>
@@ -212,7 +213,7 @@ static int pci_dac_dma_supported(struct pci_dev *dev, u64 mask)
 
 	/* If both conditions above are met, we are fine. */
 	DBGA("pci_dac_dma_supported %s from %ps\n",
-	     ok ? "yes" : "no", __builtin_return_address(0));
+	     str_yes_no(ok), __builtin_return_address(0));
 
 	return ok;
 }
-- 
2.48.1


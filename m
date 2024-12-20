Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A6E221462
	for <linux-alpha@vger.kernel.org>; Fri, 20 Dec 2024 19:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722466; cv=none; b=OoB0TbhXYEHDG/e6+79QHAFg/Txgfsy1yJar8IchLd7lzF2lvQuPG91FcOltbyL7sPicFQGBzrPK61fpzS0ZCVbUXP243I0Lwycm6BWoIZGVnRjkQ/77byjmgNQkbIeLBqH0kWTtbOHoWb9IhOSPw9yFmdNrdVCGznWdXnnUS08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722466; c=relaxed/simple;
	bh=nBYB5Xg+BKjQqhoyzRiKH6a173lAGOtUAU2g7YLzwr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QtyB2E37BvmIuMdUDiab7OiA7DWmQ4DOooI/zENSbJAj0z1XGcIoyt54T4wUO+Nk16VDa89sD7/e1oy3OsGa9/pGF/uMxwuBEEluisaZpauM8Py4G60MdqdaAHUvz/lhi0xkGqCZqY2E0gduTfsy2XkIBarJv30e0gUKCyxCANc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NNo5vJYw; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NNo5vJYw"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734722462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b0TCN20N6Jt0mRB8VQbmu+9cK5ofHCns5KRUsuZgT+A=;
	b=NNo5vJYwQHfQXJ0EVIABa2a9+2Trm5ECcMQiYrtTvMK+coptIkcy5sKKT5+FYyjJKV8UWU
	SyOa98u7UWl3xsst0btNdApPPeI+U3m8UqP/LRhXighikip2KafxqZ7QbCv9514kScuugl
	WVhOVWmYMjYsuVk6jAwEmZes4hNOR2k=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-hardening@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] alpha: Replace one-element array with flexible array member
Date: Fri, 20 Dec 2024 20:20:20 +0100
Message-ID: <20241220192020.1667-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace the deprecated one-element array with a modern flexible array
member in the struct crb_struct.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/alpha/include/asm/hwrpb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/hwrpb.h b/arch/alpha/include/asm/hwrpb.h
index fc76f36265ad..db831cf8de10 100644
--- a/arch/alpha/include/asm/hwrpb.h
+++ b/arch/alpha/include/asm/hwrpb.h
@@ -135,7 +135,7 @@ struct crb_struct {
 	/* virtual->physical map */
 	unsigned long map_entries;
 	unsigned long map_pages;
-	struct vf_map_struct map[1];
+	struct vf_map_struct map[];
 };
 
 struct memclust_struct {
-- 
2.47.1


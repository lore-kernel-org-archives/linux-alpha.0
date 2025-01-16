Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60A41DBB3A
	for <linux-alpha@vger.kernel.org>; Thu, 16 Jan 2025 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737032482; cv=none; b=TjvvGy0jOX4au6ZcHYLCa/iGf1w3wrNrfR3Re7bdGPUS2Lk+kdQJplijfHFA12O/Vh70ODgpBA/Kc04NEUxpCBMs9CYLHKFPkqPsJgDFjJsVB2+RRH0JVJ+CutyrjKFfdDWMaVfeWHrJzar9Ak2Dsg7zPGr6hiFXpS1aecBEDqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737032482; c=relaxed/simple;
	bh=N1oHQnHJ3f+5dDBkWdR4qPIpHbUElgbdGFSpDPpVeIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ujvaIchTSYi5vowt0ucm89jhMBUdSlVo4eJ6f7jjbIhANhxs/0oygGdJzqevY2zeIE82m5YopIf/nXDkwJq5bzgTeP2GNJZX7dr6wTN+pLAgGGLggtVXxWy5IcNyxrF3hnPyYKdVqH2Bw9faE6zuucddPjshdX81GWq5Uku0hAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qFzrLqZD; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qFzrLqZD"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737032472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2EWcWDwVr0uBRcUj0DpQw/Dcwq2s/V5mUKlMitAgwxU=;
	b=qFzrLqZDaPAEbcqDOEAYNS+Va7AMs2Dv3KgSJq8x7ybToTHQzYDJ+oQC8qBzep5wXWD8bh
	UnXABUupL7vG/V5+STU+6X9dHWMiOcEXhs0/adqOo9ms+UpE/3nAXkwoPagkcGW/PjP0/Z
	HaWINRGzciSVot/rfXbl6JWXIiTPi1U=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] alpha: Replace one-element array with flexible array member
Date: Thu, 16 Jan 2025 14:00:58 +0100
Message-ID: <20250116130100.86093-2-thorsten.blum@linux.dev>
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

Link: https://github.com/KSPP/linux/issues/79
Reviewed-by: Kees Cook <kees@kernel.org>
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
2.48.0


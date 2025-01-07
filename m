Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684761E570E
	for <linux-alpha@vger.kernel.org>; Tue,  7 Jan 2025 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246688; cv=none; b=PVmwyXCzT9XV6HPwkMBVHM2ZeCOlAIVgvyHyVJf+K5A3+QU8xmuIzK+AFeE7ZCcQV48zHGv03fmoadlHRpur7Dl6xuhDvum6j+L5YhSXT6kJMwncAL2iY5GDTo2vsr/fhuEZ6MXPZRjnNJVS5gLnMg9mkrrngfQkiP9F4pZv1zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246688; c=relaxed/simple;
	bh=A/QpOa73HF4f13TkMPGsCYIBhBTcWXkiGMRCxmV8I00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LzLbdYdNnHcXIMq/6NBUDEDlwI1RXdadMoxPLEXeS6w+S8LGneR73HIrIa28I3IYi253/6DyGJgiRakDnU3vUWs74Y4AiRyPDGwJZD2HZTPL9mkedNx2MjMIbwzACzjj8n3PWWN+LxskJE6bFkGqkbI0Ip/05aohnD79AT/nLfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DCm5jEOW; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DCm5jEOW"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736246673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dx3v2uKUn/tMTdAhH31ewpGGAPZtwiJFHdUGpvipIho=;
	b=DCm5jEOWIBjzSU/u0lBGx3WOuMuAW7fSZEwqhXSHJYwpQOLdYh8plxz/hXge2RiSIBzLTL
	vweNscu3q5Gd7ZQxhssUncKtdMu0YNFI/fvRyoO2ZXBdoTaOn/PMn3L8OIb4lqSObsYC6T
	UR0JMemDxI1g7u0ZB8VsiDkz0KdKCc4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] alpha: Replace one-element array with flexible array member
Date: Tue,  7 Jan 2025 11:43:42 +0100
Message-ID: <20250107104343.2694-2-thorsten.blum@linux.dev>
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
2.47.1


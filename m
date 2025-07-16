Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0219919755B
	for <linux-alpha@vger.kernel.org>; Wed, 16 Jul 2025 21:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752700362; cv=none; b=fMc7lCrOOvJTALwRssc5OOJ/XimM8AJECs5hLgaCXUZB7qaar43K+3+0WTOjnSermPOrCE9482mlnZRANyWKJca5LqXVd6gSYFeYbck0uP8I42tHygmH4+41/zP1Vi3TkJeaqRwzWPRdQ8jRMd69snJTx6g8+Y8/vBJDWg51bLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752700362; c=relaxed/simple;
	bh=/GxEl0QPjOg6ALkrg7qmzgWQ1rEayIF61MPgBUBRnkw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uY+fF38xvmmWbvIXkclWiZ6aKhnRJqQlyX3jlh2BmRLNeGUBH2WaD9BUZpzzQoP1Ey5yTHezcs4VHL2YFMoTeTOx72udiT1BDoyyI4lPavml94WtbX6FTb+TgXhZQtdwVZAipRTyA0R8oDF1VA/4YiT/YIrOriVCXq5zNON/pkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tSF+mquh; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tSF+mquh"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752700356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=APR/43NyS5T31TxBUdjop0LMI0MLna0XIyK/upjGzA0=;
	b=tSF+mquhSBzKeEnIvngkOGFoenZy9rCqUQzu2PZFeVtxcCIzonPvWRDN6PVa5PnP5BBuHB
	fjnWSCGj6PBO9hQj23b5P9YvDNa6xEq2WTVHaajI8mMWxIxR7N/cJsrYG1qtlKDrNa+xJn
	Q/GXvmiCqnt/UUTwecfLVvXx9oQDeN4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>
Cc: linux-hardening@vger.kernel.org,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] alpha: Replace strcpy() with strscpy() in setup_arch()
Date: Wed, 16 Jul 2025 23:11:28 +0200
Message-ID: <20250716211131.276774-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() is deprecated; use strscpy() instead.

Since the destination buffer 'command_line' has a fixed length,
strscpy() automatically determines its size using sizeof() when the size
argument is omitted. This makes the explicit size argument for the
existing strscpy() call unnecessary - remove it.

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/alpha/kernel/setup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index bebdffafaee8..8b51e6ca83d6 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -468,8 +468,8 @@ setup_arch(char **cmdline_p)
 	/* 
 	 * Locate the command line.
 	 */
-	strscpy(command_line, COMMAND_LINE, sizeof(command_line));
-	strcpy(boot_command_line, command_line);
+	strscpy(command_line, COMMAND_LINE);
+	strscpy(boot_command_line, command_line, COMMAND_LINE_SIZE);
 	*cmdline_p = command_line;
 
 	/* 
@@ -511,7 +511,7 @@ setup_arch(char **cmdline_p)
 	}
 
 	/* Replace the command line, now that we've killed it with strsep.  */
-	strcpy(command_line, boot_command_line);
+	strscpy(command_line, boot_command_line);
 
 	/* If we want SRM console printk echoing early, do it now. */
 	if (alpha_using_srm && srmcons_output) {
-- 
2.50.1


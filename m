Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0B72773C1
	for <linux-alpha@vger.kernel.org>; Tue, 23 Sep 2025 17:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758647342; cv=none; b=Dyd+Q/2s2QW+3XUCMPI0kUJuG+unXb+Tw5Ys1D9Vf0Y+61EyVvBbW0oNXIT1kuDwy2jlhf61Wt2CdAwZdjTHuluCpemoxuIPqdaQDfj1O9V0sheKCH7QHflgk8wLJ0JOiRQTJUO+IimVE2uGoz2wp9Lq/Ht/Bq08IkfyQbceoDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758647342; c=relaxed/simple;
	bh=qHdjBPukcKBf/nO0/XHSuRFIz0++JyR1IknsglQF7Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dp2PFipH3EIVdt5UVHDDRFP553D2O+7/f1kRnVdtImeY2khaYfjOWvXQRKZrO2NI26hXXQNVJFl0lKXJcTQX1zHPq/UGdxggvc0/0ebWDPbOkw+yfZJhF8WWwReRWkabw9pCmh6EAfLt96zMDmoiFgFERIH/CZV8W6gXyaxWXak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=J7swDqH6; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="J7swDqH6"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758647328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XGuMY/GbD4gYyloiK9YujD+XEG3K0ofKYdm5wva+Ww0=;
	b=J7swDqH6sZYcIlCwdfCRvhLKwjvzkrZV52cbzbxEpzTjXnhc4ZiN19ThNOZgYlEExmi0xp
	U6pXnsTJ2UVbSTYbBr/62NowseAA0WjnDY8FEebcRq2Rzbew49gfvLJ5v5M35NwLi/jWkQ
	q8hocsNQuyzVYer7hc/9GAmGWVxM7Pg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] alpha/boot: Add .gitignore ignoring vmlinux kernel image
Date: Tue, 23 Sep 2025 19:08:34 +0200
Message-ID: <20250923170837.1846683-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Building the kernel creates the untracked kernel image file 'vmlinux' in
'arch/alpha/boot/' - ignore it by adding a new local .gitignore file.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/alpha/boot/.gitignore | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 arch/alpha/boot/.gitignore

diff --git a/arch/alpha/boot/.gitignore b/arch/alpha/boot/.gitignore
new file mode 100644
index 000000000000..4abc9c8ab7d3
--- /dev/null
+++ b/arch/alpha/boot/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+vmlinux
-- 
2.51.0


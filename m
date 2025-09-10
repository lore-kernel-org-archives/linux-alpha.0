Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEA6315766
	for <linux-alpha@vger.kernel.org>; Wed, 10 Sep 2025 12:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757506846; cv=none; b=mkUL+0fGItTxn2AL23Dn7dfPSGSp/TX7IpD9nIseJJkcOnmR3OcZYjwRO2ciM4VpvmSO/1yho1G51BVLBEKZrenmDxlQ/6GZbp3msBL/ilQzqePHN/iX236M/TssAD7db58JEF5XOcgchVimOwXr27gXecC5OJ23VtwfcnuMUYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757506846; c=relaxed/simple;
	bh=qHdjBPukcKBf/nO0/XHSuRFIz0++JyR1IknsglQF7Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uRlAoG6SUNKXqSsct8tLJg7l8w2moPs1iv3FKGdYlapErQsN8U3tn/a8TwaW8zKQsxB/mW3TfIV+KJ4BqQwBp9bm8sYCz55XDSld1sFVQVc1euvjECXCOBQxEL0zK9VHFBNPwkQi63+ZspNMwxGnghIuoFx+3A/iu+fk3cuZIws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=l9f8V2Gn; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="l9f8V2Gn"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757506841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XGuMY/GbD4gYyloiK9YujD+XEG3K0ofKYdm5wva+Ww0=;
	b=l9f8V2GntwGZaLXUOJG+i0YILxreQ9cDHpP/V2kOnxJCR++4pr53ZLeWy+frOcDfQouqGo
	8dYfFtADjYd070u07S8EEXBjALAo9Ya1U0FOUDQpso/Omg2ebXJiRX4MF67Ohpb7sDvQLa
	gkt7BI1keci1ijiClJ1w8/qNkn6WR9I=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] alpha/boot: Add .gitignore ignoring vmlinux kernel image
Date: Wed, 10 Sep 2025 14:20:02 +0200
Message-ID: <20250910122005.912613-2-thorsten.blum@linux.dev>
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


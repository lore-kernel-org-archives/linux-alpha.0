Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66561C4A2D
	for <linux-alpha@vger.kernel.org>; Tue, 26 Nov 2024 11:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732621686; cv=none; b=Jy6GWLWSJ3FtqPtFPfyA6C7G0Q4F3OsUUYriEkMpXN3Tv9t19UajQFju/cRXYibhW3V4920qoJuV7yTaszZjz1bOZwLcGWR7SS1KYNWHn4nIDf1L1LRYXylwL+b1K0Zc3WaLAZ8sW0obx8Kmu13WpRDo8A83dh/orgekJg3yIhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732621686; c=relaxed/simple;
	bh=O+FqV8OMdN3xg7Cx37OO0/uu3rSjG/h/PvU+JD7eVho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TLmEEau+upAliksSteKh0vAKW9l0JnD2+l0yIsUhcEa9N/Sr4EemiztVRQ162FZlcKpQQp1EpUMYW9YzmKM8okrb0/CozFhbarp/nVW2ge2BYhsAMdoyUzZJxg3Muzpk/v9B2I/k3tlXj+FY3bV7rVrGzL7wZipZzyIhamXorc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KnKLmENw; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KnKLmENw"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732621676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OhFXNuDGqV03IdrcsTzT21y3pX95cMRd+6dXrJ+TEew=;
	b=KnKLmENwKXidKogPNwgZ9BeJCNb0REJTZ+zMQv0eKG2WyYD3qdODHOp0BfkONwOXQeGXuE
	MEc5uh48dzeLzKwkOS46sn5ruxaUhnYG5qrUuDlg/0ewLLlXpMmLUjJJyjdybG/hQjhnJG
	dH4W93fufdjVVGs1qtZdl6cVWk4hx/o=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Kent Overstreet <kent.overstreet@linux.dev>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] alpha: Remove duplicate included header file
Date: Tue, 26 Nov 2024 12:47:26 +0100
Message-ID: <20241126114728.139029-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove duplicate included header file asm/fpu.h

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/alpha/lib/fpreg.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/alpha/lib/fpreg.c b/arch/alpha/lib/fpreg.c
index 9a238e7536ae..3d32165043f8 100644
--- a/arch/alpha/lib/fpreg.c
+++ b/arch/alpha/lib/fpreg.c
@@ -10,7 +10,6 @@
 #include <linux/preempt.h>
 #include <asm/fpu.h>
 #include <asm/thread_info.h>
-#include <asm/fpu.h>
 
 #if defined(CONFIG_ALPHA_EV6) || defined(CONFIG_ALPHA_EV67)
 #define STT(reg,val)  asm volatile ("ftoit $f"#reg",%0" : "=r"(val));
-- 
2.47.0


Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DE344103A;
	Thu, 20 Aug 2026 13:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231545; cv=none; b=kX3zhe6M9XyzQo1gExmW1ESt5qKe/NE/Y9uaH/SmF1ftPY/OA1ZwOOv4WfYK8mgqVEpFh9bVMrqn7ylmQM8R0D1XRqR+5c0Atr6R8MMs9opdIKUdoVpODJ7y9PAcVjpQ73XLFdXotSWOYtSxmPO6joC49kAJ2VFvXZlZdeTVI+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231545; c=relaxed/simple;
	bh=S532UwxnBTwP/KRyeb4YE0EjjxbB+De6O1nrVxHMDbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I/VET+YfM0SSgNlq6CVXJ7mtCmNagL9HMBB3k8LE1CwR1Meu0kqLEoyOeWMhsr5CG96Hez1or42j7KT/AidwnCHceaTxo4sV8CGAtXwf3Jr2U3d/r6CqOqg1Qk9PlGQY0fyJPhHzPypPY+25MzPZF1rjo9g4L5bzhUndELwY1tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=KUMG8oHe; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=YpOuNOmd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="KUMG8oHe";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="YpOuNOmd"
Received: from kunlun.suse.cz (unknown [IPv6:2a07:de40:b306:2000::2])
	by smtp-out2.suse.de (Postfix) with ESMTP id 56DF43EFA;
	Thu, 20 Aug 2026 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1787231529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qAEA+8J6VlIeSJv1Wf1fB3umTKoyh69pgxsb+rVmL+U=;
	b=KUMG8oHeopdT/ty18A/10/W4Dz1Q/HtdwL38Y9iVq7Wp6Yrm706/BaP2mTUVqTrIEttI4+
	0Lw3hSq+k4FlInIGbREiqTO/HUsfb1fF46K2CpNk3nK3gLQ509B2wr72zinJojKSPmxr5z
	OrSzxAwGyAyj/IVGWbl4dR4w8yusIkY=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=YpOuNOmd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1787231525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qAEA+8J6VlIeSJv1Wf1fB3umTKoyh69pgxsb+rVmL+U=;
	b=YpOuNOmd/ONuhOZ0GZjMdjvEdd+vO/IRDUaYOeOwnHP8HNWibuFp6UoikZ6bybgcga6dHj
	f3wZRNtnYRMIBBHbz8ui+AKTV3+YnYV2WK3b0yqU4f2RIGG6N5Ohv1OQU51vobqcc/uy7D
	pexMGDH1cnP3dR0v/VPg+4PRaLTLVBI=
From: Anthony Iliopoulos <ailiop@suse.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] alpha: remove unused profile.h includes
Date: Thu, 20 Aug 2026 15:11:50 +0200
Message-ID: <20260820131152.13707-1-ailiop@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [16.67 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[1.000];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_SPAM_SHORT(2.98)[0.992];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[kunlun.suse.cz];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[kunlun.suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DIRECT_TO_MX(0.00)[git-send-email 2.55.0];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b306:2000::2:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kunlun.suse.cz:helo,suse.com:mid,suse.com:email,suse.com:dkim];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_ZERO(0.00)[0];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: 16.67
X-Spam-Level: ****************
X-Spamd-Bar: ++++++++++++++++
X-Rspamd-Queue-Id: 56DF43EFA
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: YES
X-Rspamd-Action: add header
X-Spam: Yes

None of the code in these files uses declarations provided by profile.h.
Remove the unnecessary header includes across the various files to clean
up dependencies and reduce include bloat.

Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>
---
 arch/alpha/kernel/irq.c      | 1 -
 arch/alpha/kernel/irq_impl.h | 2 --
 arch/alpha/kernel/smp.c      | 1 -
 arch/alpha/kernel/time.c     | 1 -
 4 files changed, 5 deletions(-)

diff --git a/arch/alpha/kernel/irq.c b/arch/alpha/kernel/irq.c
index 4a6a8b1d5a8b..2f6430edf1f2 100644
--- a/arch/alpha/kernel/irq.c
+++ b/arch/alpha/kernel/irq.c
@@ -23,7 +23,6 @@
 #include <linux/irq.h>
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
-#include <linux/profile.h>
 #include <linux/bitops.h>
 
 #include <asm/io.h>
diff --git a/arch/alpha/kernel/irq_impl.h b/arch/alpha/kernel/irq_impl.h
index fbf21892e66d..fcff28ef9e6c 100644
--- a/arch/alpha/kernel/irq_impl.h
+++ b/arch/alpha/kernel/irq_impl.h
@@ -11,8 +11,6 @@
 
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/profile.h>
-
 
 #define RTC_IRQ    8
 
diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index ed06367ece57..707b5a37e054 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -26,7 +26,6 @@
 #include <linux/spinlock.h>
 #include <linux/irq.h>
 #include <linux/cache.h>
-#include <linux/profile.h>
 #include <linux/bitops.h>
 #include <linux/cpu.h>
 
diff --git a/arch/alpha/kernel/time.c b/arch/alpha/kernel/time.c
index 4d01c392ab14..0fb28e625814 100644
--- a/arch/alpha/kernel/time.c
+++ b/arch/alpha/kernel/time.c
@@ -32,7 +32,6 @@
 #include <linux/interrupt.h>
 #include <linux/init.h>
 #include <linux/bcd.h>
-#include <linux/profile.h>
 #include <linux/irq_work.h>
 
 #include <linux/uaccess.h>
-- 
2.55.0


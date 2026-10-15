Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478EB4908C3
	for <linux-alpha@vger.kernel.org>; Thu, 15 Oct 2026 10:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059852; cv=none; b=WPwu0SsEphTT7niKCnqOrS9ojjwR4XOezOaBc2wWNnmxWO1kAidma/8SyTf0Cv1jtveoLDMb2v/W6tCDv6qKITl8XBYOTGnZQOc2Vr86M/ZdEjTr5S2t92+sYVsg0sfsEreEP5K8w5g0P0ij9myVPGF0uv6aXbPw6BZ4JvgG/U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059852; c=relaxed/simple;
	bh=0Dams8yhDKRdt2LapkcleFLfxS6mpwRM4s1oYHTD54s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rryf8240T5R3101sPIcjSI47d6+ALDma4n22FKdY90EpZLifTvWOv1mEHmZIBirSQBhEy5q6NxWgE4b2E4RDAuOlyVcGDUfc2tRfNAgRqOI/KLoNXsKVXMtzcHNtChZAmMXa7nkH+NAWzcZbylTdsCAMyArFrnkb6DB5BlVAN7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekV7gGL5; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekV7gGL5"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2e36c3478aso270688466b.0
        for <linux-alpha@vger.kernel.org>; Thu, 15 Oct 2026 03:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792059847; x=1792664647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjcAwhXe9YAn5uo+Rr2PV+mZ56EMyAKAQzi8CgIvfOg=;
        b=ekV7gGL508Iu6wNHLNY1kbfjkYz75LVA3HrzUgzJSxt7bbcRevCvKcbEIl67+6fgpd
         dxbh68HrDjpV41CnzU0D5dGhI6u93UlHpUuUdgLB8WnWAG9hKGjv2M8XwKg7lF8aEubS
         p8jYP8NZt+VlLM2FER5nPJ1nUzYoCYOBT05DeXtZEnXBt5VjYhRe+MhsYSjL+8SJGF2W
         yUuFs6N5Strw+3Lgiz7Z/ZaMSmdce1okmmOfUx/fH50OCDFp2mgcsn6Z4DssjyoUk9OC
         dQWIpSerh5nQLHb9fspMpI2w8DLYnMLqdhcbHyb/6+RQIeoPTJqFKRs0IIOUPiOEv+n/
         FdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059847; x=1792664647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZjcAwhXe9YAn5uo+Rr2PV+mZ56EMyAKAQzi8CgIvfOg=;
        b=I3c9d5DRPXgd/rGN/bSd+Mz24VAuAk1DajfQk0TCOPjdQucBz2v4q7es5zH5Sq4Lwn
         ShY87rbDeN8EHCK2+6IvomojZnzv2+YsSKoPl1v4hn5N8Iw8VsGM/u2pvVvVibFM5iAs
         ooR6GswOMSQmlfz+P35bQI/SPXBeJt/zLgcU70PEsX8d7vVCXh/xEkTN4s0RRnx3adPy
         /lyu55qOKJjWbAcls/EaOOExeJ2xzJrv/YUMVy5qt3FgsCLbtJoAAMLAVip6xU+IudGC
         nFRy25ssLT9mMWn2tlMypS2OPwJ67CFpFDUOvQ8OFqukfxlfok+Ws3G3FQZmItH3oz51
         AMbQ==
X-Forwarded-Encrypted: i=1; AKwUvByGKWu1DrJTX3+Bd5+5i499kNgVVwChO81WDVudEaYhOFbVHKvkBQcf0EvtM8d4Hh02kBD/xYKylVED6w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJt4cENumoS6c/G0IuYGTM0ddXaFiixflWrGtpjX/EmC599fIdN
	excxfVFzaSMgU/sDEto+KDj4zsdjM7uba8fWc5IEBBb0GPhHUPg8wjSx
X-Gm-Gg: AYBFou2Rlywsy7ipxoGnVJzTOZTGiv7/uJ7/t9ZM88CYT0FUTNeYEqYiFJnyWlitPXm
	Ouk1lIkTRzEbKPFRJJ2pEzoIhyBSKxzTXe+JYdFRP2vP7KtQsNSv6K2dSYktsc3JW9Gd7y9pzcf
	k5aT7XSdsnsWKWNFHbxNAv6ve3yhAMp+sEH1slKhUN1NA8aEDb10wcIAESGRpfa2BVtLTMGNOaz
	bMT10XGeXuOYbSfafkuUwtu8kKPdAVRwWYD3+1kvS0l/Vt/5wxYDeHn/ECnsdJsE14s5EmNyCEF
	uldFsm8LotvObbLL9ZyD4LsT1JJwPPmlrNzlcJY7E8Wywj0yrqiIYXYQaNcUgFuQ6nongyOBcIj
	uzrhl+owdgg0+cZj7HtgAl+p6Wy5DVdNX8vOoDOaaO0p/f2gJSfDXKXD4NAuY7sgG5JAgMhh+sN
	QsMQDbpxWjCpLMntBtx1FRArA/0FhCE4De5BzxI+X+JBLrjZ/R7v8PCTIqOP2UpUDAtVb60lCby
	W/+e+cEF7RX+hbZmckR+kCz5TN/0YWN2b3T/eV5
X-Received: by 2002:a17:906:4796:b0:c34:d75b:dde0 with SMTP id a640c23a62f3a-c34d75be9famr1139276466b.20.1792059847402;
        Thu, 15 Oct 2026 03:24:07 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab13f4esm108371766b.87.2026.10.15.03.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:24:06 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v8 1/6] alpha: move Tsunami machine check handling to err_tsunami.c
Date: Thu, 15 Oct 2026 12:22:50 +0200
Message-ID: <20261015102353.999695-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015102353.999695-1-linmag7@gmail.com>
References: <20261015102353.999695-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the existing handler and PCI error clearing helpers without changing
their behavior. Build the error objects for ALPHA_TSUNAMI so that all
Tsunami configurations, including non-generic Shark, can use them.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/Makefile       |  4 ++-
 arch/alpha/kernel/core_tsunami.c | 34 -----------------------
 arch/alpha/kernel/err_tsunami.c  | 47 ++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 35 deletions(-)
 create mode 100644 arch/alpha/kernel/err_tsunami.c

diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index 4ea5c189e60e..a453e487b9d0 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -39,7 +39,7 @@ obj-y    += err_ev7.o err_titan.o err_marvel.o
 endif
 
 obj-y	 += irq_pyxis.o irq_i8259.o irq_srm.o
-obj-y	 += err_ev6.o
+obj-y	 += err_ev6.o err_tsunami.o
 obj-y	 += es1888.o smc37c669.o smc37c93x.o pc873xx.o gct.o
 obj-y    += srmcons.o
 
@@ -89,4 +89,6 @@ obj-$(CONFIG_ALPHA_MARVEL)	+= err_ev7.o err_marvel.o
 obj-$(CONFIG_ALPHA_NAUTILUS)	+= err_ev6.o
 obj-$(CONFIG_ALPHA_TITAN)	+= err_ev6.o err_titan.o
 
+obj-$(CONFIG_ALPHA_TSUNAMI)	+= err_tsunami.o
+
 endif # GENERIC
diff --git a/arch/alpha/kernel/core_tsunami.c b/arch/alpha/kernel/core_tsunami.c
index fc1ab73f23de..d435ec9fb828 100644
--- a/arch/alpha/kernel/core_tsunami.c
+++ b/arch/alpha/kernel/core_tsunami.c
@@ -448,37 +448,3 @@ tsunami_kill_arch(int mode)
 	if (TSUNAMI_cchip->csc.csr & 1L<<14)
 		tsunami_kill_one_pchip(TSUNAMI_pchip1, 1);
 }
-
-static inline void
-tsunami_pci_clr_err_1(tsunami_pchip *pchip)
-{
-	pchip->perror.csr;
-	pchip->perror.csr = 0x040;
-	mb();
-	pchip->perror.csr;
-}
-
-static inline void
-tsunami_pci_clr_err(void)
-{
-	tsunami_pci_clr_err_1(TSUNAMI_pchip0);
-
-	/* TSUNAMI and TYPHOON can have 2, but might only have 1 (DS10) */
-	if (TSUNAMI_cchip->csc.csr & 1L<<14)
-		tsunami_pci_clr_err_1(TSUNAMI_pchip1);
-}
-
-void
-tsunami_machine_check(unsigned long vector, unsigned long la_ptr)
-{
-	/* Clear error before any reporting.  */
-	mb();
-	mb();  /* magic */
-	draina();
-	tsunami_pci_clr_err();
-	wrmces(0x7);
-	mb();
-
-	process_mcheck_info(vector, la_ptr, "TSUNAMI",
-			    mcheck_expected(smp_processor_id()));
-}
diff --git a/arch/alpha/kernel/err_tsunami.c b/arch/alpha/kernel/err_tsunami.c
new file mode 100644
index 000000000000..1045b920fa6b
--- /dev/null
+++ b/arch/alpha/kernel/err_tsunami.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Machine check handling for Tsunami/Typhoon systems. */
+#include <linux/init.h>
+#include <linux/pci.h>
+#include <linux/sched.h>
+#include <asm/io.h>
+#include <asm/core_tsunami.h>
+#include <asm/smp.h>
+#include <asm/err_common.h>
+#include <asm/irq_regs.h>
+#include "err_impl.h"
+#include "proto.h"
+#include "pci_impl.h"
+
+static inline void
+tsunami_pci_clr_err_1(tsunami_pchip *pchip)
+{
+	pchip->perror.csr;
+	pchip->perror.csr = 0x040;
+	mb();
+	pchip->perror.csr;
+}
+
+static inline void
+tsunami_pci_clr_err(void)
+{
+	tsunami_pci_clr_err_1(TSUNAMI_pchip0);
+
+	/* TSUNAMI and TYPHOON can have 2, but might only have 1 (DS10) */
+	if (TSUNAMI_cchip->csc.csr & 1L<<14)
+		tsunami_pci_clr_err_1(TSUNAMI_pchip1);
+}
+
+void
+tsunami_machine_check(unsigned long vector, unsigned long la_ptr)
+{
+	/* Clear error before any reporting.  */
+	mb();
+	mb();  /* magic */
+	draina();
+	tsunami_pci_clr_err();
+	wrmces(0x7);
+	mb();
+
+	process_mcheck_info(vector, la_ptr, "TSUNAMI",
+			    mcheck_expected(smp_processor_id()));
+}
-- 
2.43.0


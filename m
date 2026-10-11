Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403643CD8D3
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 19:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746042; cv=none; b=I91z0xtvTeoBSJmY/TfjUdOh3BItSWIo+/W3JKNBjCS8w7LGnrZhum00R9twoso6PCs7EK20Tf8NQJOa+2jyyibyHTjbSYL+KtBZKng8aK7TFwo90fhP0hYHbERWmhZkaUjwqI5OBXpnMPmHdloo4zJKqCF+3GQElsu11N4/gTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746042; c=relaxed/simple;
	bh=0Dams8yhDKRdt2LapkcleFLfxS6mpwRM4s1oYHTD54s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n42wl0OJcXXwowaiOlBO627s+zT5DOSHaa5nqWo2oqRrwbqpE0ds0BGjmwS5ByoLlO2VV+mfuxyZFrVrYauUBQ7LnZaPpmSxSzcSIIya3Y2OLHsOWwsLNmYSC0spBEHGdgo4fySPcwsoY0jIlexoi7BQgqxDHCDypAuiPJ98z64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKjwck8j; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKjwck8j"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so1832766a12.2
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 12:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791746039; x=1792350839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjcAwhXe9YAn5uo+Rr2PV+mZ56EMyAKAQzi8CgIvfOg=;
        b=bKjwck8j/9USHXqH5hm86jnUDKoW1jZmI3DdmSJtFR7csA6/yNyJb5/E69cQYft5RD
         WBY8zW6GMLtPP0WNFqZhoE6J8bt3HY8VHlD+It+5irtzW4WoqGZAbg0yNkW7BzYvQA+i
         bzGqseMbtDwxj0kt4b0NUqSzoiKtqFO9c2IRZ/RZ+eiqz7b0wp5Y57X/Bcwzyj3FEA/y
         R1h0AOSkPAmhzWeoMkeByIT9WC8Y0LxnEf+EgKuMgANqMxRBw0h+sXxXnmzVZ7OELI2X
         who85TxkscnK+PAtIJJMFOufj4vQrena1opNUfT3n8t7eJJ+JtlIIHnGCSGq3ViU91YK
         FCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791746039; x=1792350839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZjcAwhXe9YAn5uo+Rr2PV+mZ56EMyAKAQzi8CgIvfOg=;
        b=Ge0DPUJGQJi7YppFru+LiTRm4qxmSdwYCdC0jD4qK+0dZBDYcx8hINTzuoCUs+OLVQ
         SJG9Uvr8Qypyi+1OsbeL0hkuvYcvIoTMD8hnWpSosDxPrHQFw3ISy6ACuxraFLhsLSFu
         O47NMAeoNCqSxvu6BJZOYA7RSjyuKPMZ5ptMk6xfYALXjkxdk+FgfwWwii8LZGjDgfBP
         iFFeJnnf0VocPpSAxmSSb1tvJ7famWpVu1oyNo1UDUQVYaC9EvREptekzSkUi0o6o9HK
         nD2CRhG+/rR86BgS6tLb6/snxJO5gjByjXe5FCcU0//Rg8fhuMttSOA6qOZIGRLjrQ2P
         WSRw==
X-Forwarded-Encrypted: i=1; AKwUvByDTsXNDAKWUeD0IOm3bkRGU0ez970wWeWGy087lF2cRQbKRzf0qKq3HRHNnX6wIaV2ZwnPEPou6g5xHQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJqa0UELCukVTSOx1UOd2DHu4pxijmwRPCKSI0Y/WKr35hcuxuZ
	eMQc81Y1q9t3iIF2fwsUptZktmbr5/VoynLA+ZiNJVZuXNOWyqldMEsf
X-Gm-Gg: AYBFou19YkJd4RM3e7cB7RgHjhYH0ABw8dqk9M3AeI2Qyq3e6LMlWAdwXoAqOcv1XlA
	LTfLbefhBR3etZcMLG7AB6DlkOTtS2HGJzpMuILn6gq+GG4yc1IinLWxFbthWlV8PPVEOrmvCaR
	2Ch4HrjR0nOrG9pllWA6No8dtDixzRDx/aW9Qnv+xRS6PDmioigyhyuMZdO1IQ7ErZNP62E9U9/
	vO2BsAfSJ7puuBNrbhN9kyjB7hmaX1voTQqJBiSM9Bvyf76vWpPlrdu1Ms6mN21u3Hp5r3J5sb/
	6x51M2y52mTKi08OMFZBv/rgJ7nOIIv+qEi03G1QAnSXPBiJgaPvlJt/7snGXYcdgM4EsSC709t
	THIf9pc65kCML6gHp2WYIfr3ILxx9tnpBIHE0rST+98fggGxvX6cx9ur/cfGyEVE2jOC+f059TR
	EO5DmDwr2yATczrUhA5ULekNOnomDed06TYb8ckKuPoSU5eco0nrkJV5tIhzcB3+3teYOwyca/r
	e5XU1p3Q29nqCh6/x5p5xVbhuruh4hXWZbdU2ye
X-Received: by 2002:a05:6402:5113:b0:6ae:313f:ddfd with SMTP id 4fb4d7f45d1cf-6b17c29f797mr7279611a12.27.1791746038682;
        Sun, 11 Oct 2026 12:13:58 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3736sm4084832a12.18.2026.10.11.12.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:13:57 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v6 1/6] alpha: move Tsunami machine check handling to err_tsunami.c
Date: Sun, 11 Oct 2026 21:12:48 +0200
Message-ID: <20261011191344.981000-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011191344.981000-1-linmag7@gmail.com>
References: <20261011191344.981000-1-linmag7@gmail.com>
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


Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B834D9F96
	for <linux-alpha@vger.kernel.org>; Fri,  9 Oct 2026 11:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547094; cv=none; b=rRHbCbDANmd9MpyauGlqlRBheURJkhTpn/QO6M568YyAmCwMlIO/C4Q7EGx9zn52SuA7fQqpe6AQvoduju/YuEHOhtIuB7wGZ2hLdrBVfHcU2jcFmoiwwI84DDELwv0qF2X4KD/MHLGdHkd3BA6VePG7PTsL+pNt7xeH6Qcjpqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547094; c=relaxed/simple;
	bh=XDySDTNwX6H1MTJbq+EAvdLRMNrsL7YM7XtuGU4OEnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ipePerHkVvRkcbxiPNyae/821Uyt/6askTQEpc/kzk0oFDA2DeOLfUFDbrR/qcG6N7gghz1ASKdkYyk3ot9ng7CmO6C0Frs0+SNdyKMlTdIdDlscCFgVNE3PxuL7LuUyOuVQXIJf831E7+4btqKhnVxpw/47HiJusvbzo5m76aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2yPSuTN; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2yPSuTN"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso643666266b.0
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 04:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791547085; x=1792151885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sckN3jMhSrmNfzGlD10SNVVC7d6wpU51+YncLQdIbpc=;
        b=b2yPSuTN+6NSmjlBmBTjwUtt+AERHP+jhgAqq3n3C2sjlsq+ijos9R2UlsatQgIy9Q
         P1tHWXXC/kkyQThOj46FpwZtg4UsM4UNuIyHS3BWqKkT3MYKykmaWOVP9vsv1q1sOfSd
         KR3E3yAqwhC4/RBYX2EVNsSGPcOlppAmZesY6RRFqtr4mxQLzYAODpAip/2CzWBw7Izs
         3i9TXsyMQmWosx+mRHVn1c3WbXyI/NthQ41fR4Ltzbhw8ADhMh1IMn7nIBmFuSapiV+Q
         cZHYaMtcXsiDLM6ObEE+QyI9A5R5zarBRaUr6ai71n4+jhtpriDRXRMl0uz0BA/seSWM
         0X4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791547085; x=1792151885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sckN3jMhSrmNfzGlD10SNVVC7d6wpU51+YncLQdIbpc=;
        b=xcfrX+eVwVSzp4dH83dbu1Cg+14bTVW3c1/xS1zwLAQBXZdzyPROBYuzx8sDkdvNM0
         UkJ5EgWlXMloMOyywPTTlEb+Cort32EX0JOtKxWASQy9jt/92y75FOLBj+TN/qTE5uVR
         XJU6NlaKyvBg5EV1XBZV95luzv/WWJS6gPKKdApmr8odNZbWywVI+xQ9bUi+NTfNUW65
         XbfXSCHmY+F4rSS4AsGei742IxDZRFnsNnWCrjgcJ0UWSxpKomy6Z1C4pTZWatazdHNY
         IaYOXcOOyswuJ5ra21eWfqkFYm6i1pf/6uWslnjjuNnOxoP1luKaUJxCm6XJrDv6Bpg6
         pEog==
X-Forwarded-Encrypted: i=1; AKwUvBy6aArvQePUxTSq08npX2LleBC6PjSQLjgccFTfZzc8ltcksdweTvM1rSmS1QdhtCzXW0pTYKEFjMMCDA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/+n0FBoQEpmTTSz2vmbkjCvnk5sQDwiVd3RBAZT3YgOovSFO0
	6baYavLm88NyChjyK6Re+7VcicNaspyW0yNpwJ48+j036IkeMq4np7uC
X-Gm-Gg: AYBFou0ZsqUq0NBDWX74AczJIDvI8RQCoJQO7R+HTfJOmYQmjZjvMuxFwKmqpwq1Vrr
	k60EbVIX/XugUrTbYSPJs+beVtAvcvGAFOVtCTn0ygmdTESXCkxjNsEzq8vfrNG0RKiRGciEkPd
	P/ygjVg3xebawn0aOMMH8AVpMWjJpbMnAiZPshgCxzqBtaOrjTmo4Cl+/u5PqpnPRzxbhg3Q3qo
	iXaVR8tUlnhzrCTIqV8E8OThIq7xnZ2xdfb/2vctxOFrJvSKbTBlPFDN/ZXyv6xn20P/bmTy+78
	1tLI5bfaFCFkuqMWCVJyTrN3papgoOe+tbCwH6jFVPY6q1wKjfS6TwVTdrahZfIKJNcW7YI2jCF
	9DUiWjy+RBwzg82pdInGG8O6iGFBq3JsBMFA2K+2I4EWBynbGDYm9dst3goK3HTmmjKIk/RYi5O
	OvmLV9BqGBCHxUdNMJhniSeCfJH0q1CMpPlK6hUJ6RuctACzsibmLzmlJTg85TdAeVhvuLjXsjC
	SAiErAiy4NhtvsgyXMm4NXu4m//UFImGMLdFqK+
X-Received: by 2002:a17:907:948f:b0:c31:9a1c:de76 with SMTP id a640c23a62f3a-c31a9fd424emr175988566b.14.1791547084622;
        Fri, 09 Oct 2026 04:58:04 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31aa825e4bsm78525966b.9.2026.10.09.04.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:58:03 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v5 1/5] alpha: move Tsunami machine check handling to err_tsunami.c
Date: Fri,  9 Oct 2026 13:54:37 +0200
Message-ID: <20261009115627.969047-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009115627.969047-1-linmag7@gmail.com>
References: <20261009115627.969047-1-linmag7@gmail.com>
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
---
 arch/alpha/kernel/Makefile       |  4 ++-
 arch/alpha/kernel/core_tsunami.c | 34 -----------------------
 arch/alpha/kernel/err_tsunami.c  | 47 ++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 35 deletions(-)
 create mode 100644 arch/alpha/kernel/err_tsunami.c

diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index 4ea5c189e60e..0178f6a5bdb8 100644
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
 
+obj-$(CONFIG_ALPHA_TSUNAMI)	+= err_ev6.o err_tsunami.o
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


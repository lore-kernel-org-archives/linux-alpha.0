Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742205;
	b=jkP9YNw9Q0IrKztVCpZLgBgnSTXjYMV8XIrAd9p/uxs/q5v6H6il6KfnCCXsfdTXMgTb
	 /BMUzNaSssqqPhJlCibCyDHZGk7HaprwuJ/OD07bHg/wNlLwVEP81hEJagHFVz+mwrE77
	 hbEQJ9i5gx4WYJRRn+LQyl/Cobr05kZndDOfWMZNVvMVMqVKnfw2BPjHx9B1sPshAYfVv
	 aiiAXdoY/RhIc/PxllS6SlmPUwLfae4xo9m+CbSsYpfBy6lUCgUbS9WfQcdqVsbvuNkUQ
	 uY4bVyt+rzKA1cl55ui1mBAKuHaBFEz9BTRxhOjmeff+yKd1ewA6DJmWMKKgxfuktqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=phZqWrY72D5zfdvKPezSUNuebg1PLzdXZPva3nxMKAE=;
	b=jAggUIwV1Lnol+XoS65ULoWbf8FwjRu9l9Y4NXJXu9Sr+Xs3w92cQRurArYE7Lp4e6Bl
	 oFzf97CMh/xI8JXIzWYlR0N5k4LOjF+cfFDsP/uUL2A9UKCPgXjpvVwgtPasvGx7/lpyD
	 txd698fVtHZ882XWxyECAIzXQ8kbMQHUuGi5uAx9y05YipjeTzwWNBMT2hbpo6hO2j6kb
	 WhAhRzwwlzk4Y7ANsTFUSJS6yAz/Hg6f6FGNhzAJcMuUMFV70tdvKvVRo6HRFsQ5DdDKs
	 xkOn7L6A08bQTkZDwAP90TY+fuQJSzVWjCFRuOLgOmtMo+F1fjUlzsYKnUIDBcaMPkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZDmG54c+;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F2C606EEBE
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 21:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04F2C606EEBE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZDmG54c+
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so7400a12.0
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 13:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742203; x=1794347003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phZqWrY72D5zfdvKPezSUNuebg1PLzdXZPva3nxMKAE=;
        b=ZDmG54c+LQ5k6OfboDVA+TjFiX2IZjaQmH64+coIPokR/vOiTTkf2dJDJAV75ND+O8
         CQg1afduzVGSXbwmB818Xgqqyyii6/yG8vEdYEiIjAIsIW3xt7MS4J8rJjXamT3Id+B7
         nNPvV9rLL/tpW909sfl5ao+u3Vb7XX5q4nCx/9BOtDsdQNfX2/2xQd/rZkhuJ2Ox3jo6
         9UFPc6vvFC6+yS4FHGDBXa88dB6KMPKPOwa4fumCX2jxFifIkpUZPEVdK4riuVzdyzts
         C5FqNH/ilhiBwyqMiGUDP343KtGvB9t4bLP0Ms3/3NLUHvftToAu14DF0DdLTJcaONLA
         HhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742203; x=1794347003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=phZqWrY72D5zfdvKPezSUNuebg1PLzdXZPva3nxMKAE=;
        b=Wam/EDR2kbA8a1ZTPEBKdr+7C0V/iUrd9gkgo+N4uDISFcB62gSrBh2ry/UOZrhw6j
         1Nx+xmLchSL2fWVmsROs7daNoF0lyxypVzhpSNOzfb8UZPOOP9CJnaxlD04lyLWWzIO0
         7O4Qk+H6M/xBGtr+GRCDo64W/SAOhQgSHAc/UEiuFlmUshs4c4a6tyqGeWODwJQYttE7
         6gRxFVTFseA3AtNNznxd3Wo3CMw8Z0virdC+DoglBgCwusno9r3T297mEGUvcfTi9QeG
         fdt6rkM7/oJFdflo3C0fl48TPyWMPFgPZWEhsWk5LLApKR/ZWugLv0vwZn/dGDATvTv+
         AFOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlcq8G0QL5I6QAfeZB48w6VUlVJW7Ruc/FqZPIUT9/X75dxuxLJ2uEJYUf4rpxcVe6Fd9YgPLYIc62tg==@vger.kernel.org
X-Gm-Message-State: APuU4Z93CO6wsLhsGl2zEELoORThM09frpSClLNok3Yhttx2U0gWokR9
	RXrNB4UhOoSwJ574k25LM8tjcuAlwd4k2ceX3hr2qzzO5J+gp6motcyA
X-Gm-Gg: AYBFou03G/HGRl9Km0gGRynGcMsAKqxHcIwiXBG5Ma7yhIw+2GAqb1+PrWkoMqyOu9E
	H+lCSY0CK+yFGWPa4G0K1J3Z6ZYwCu0fX69OCtbTKavWfxNUNksEc4FwizuOu6bP5woyQfq8sUS
	r0v/QLK4jz5i0W1mmeSk2plkfZn6uw9T890rEWvXPPMO79ApN5PyayFCZ3Gu/lkN9Oef9r9z74J
	2tnFB1oGvHQ3hXV4dulOXaN9Pnij6jsd2oXDSZG7ko0ui6j+s4ovbYHfEwdno7MdWAKcXAN5TsU
	BEsvzS18i7vNKRHLNiNA1FU/5YQq3viXqZ1e9H847mtlHC15boOG0ZpVaJgFRk8+/i97GWaV7Te
	hL+K3aAB6MU10jLY7wJ0jWROyVN03fo/9Y6UcIljPTlOUtzvKEyFDzf6kLy8phyv5unYzYOpwTa
	gwDcFkcZC2GKTs/XCQm6XkKeCsQxSvgBMLdFM53rwJLejOW/93k2Sf64aGfR2KOTAkE9y/56/sN
	l/zaKfaiYM694lyJ6+y5+E5dfqt/tg2AT8Dss2Zj1WVVQxZtCeWz56paXVNjoYP8nsWXdET886+
	oRdk8nry4IKqGhxscc/QemGRzhlgK6lNW14wDnErmTIwfqdVDQ4+zq1Rs2M1au7gTEfbMyk=
X-Received: by 2002:a05:6402:2348:b0:6b4:d80a:3043 with SMTP id 4fb4d7f45d1cf-6b4d80a3491mr10123937a12.3.1793742203396;
        Tue, 03 Nov 2026 13:43:23 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:22 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 10/14] alpha: use generic syscall audit classification
Date: Tue,  3 Nov 2026 22:35:16 +0100
Message-ID: <20261103214120.1099893-11-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103214120.1099893-1-linmag7@gmail.com>
References: <20261103214120.1099893-1-linmag7@gmail.com>
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace Alpha's duplicate audit classes and classifier with
AUDIT_GENERIC. Alpha has no compat syscall ABI requiring a private
implementation.

The generic classifier also makes execveat match execute-permission
rules, as execve already does.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig         |  4 ---
 arch/alpha/kernel/Makefile |  1 -
 arch/alpha/kernel/audit.c  | 62 ----------------------------------------------
 3 files changed, 67 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 19ed083d4f0617218e37a3bac516ec82c5423d7e..014a52e63dec88d72c51c93b3d1c254839ecf33c 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -53,7 +53,6 @@ config ALPHA
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
-	select AUDIT_ARCH
 	select EDAC_SUPPORT
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_SMP_IDLE_THREAD
@@ -110,9 +109,6 @@ config PGTABLE_LEVELS
 	int
 	default 3
 
-config AUDIT_ARCH
-	bool
-
 config STACKTRACE_SUPPORT
 	def_bool y
 
diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index 668556d8496c0c3ee03996cf5a4a0ee56b980891..850f1265cc55db5e0472c37b693dc952bdc75421 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -20,7 +20,6 @@ obj-$(CONFIG_MODULES)	+= module.o
 obj-$(CONFIG_PERF_EVENTS) += perf_event.o
 obj-$(CONFIG_HAVE_PERF_REGS) += perf_regs.o
 obj-$(CONFIG_RTC_DRV_ALPHA) += rtc.o
-obj-$(CONFIG_AUDIT)	+= audit.o
 
 ifdef CONFIG_ALPHA_GENERIC
 
diff --git a/arch/alpha/kernel/audit.c b/arch/alpha/kernel/audit.c
deleted file mode 100644
index 3ab04709784a225e1a325cd68f8a1fa3865bd170..0000000000000000000000000000000000000000
--- a/arch/alpha/kernel/audit.c
+++ /dev/null
@@ -1,62 +0,0 @@
-#include <linux/init.h>
-#include <linux/types.h>
-#include <linux/audit.h>
-#include <asm/unistd.h>
-
-static unsigned dir_class[] = {
-#include <asm-generic/audit_dir_write.h>
-~0U
-};
-
-static unsigned read_class[] = {
-#include <asm-generic/audit_read.h>
-~0U
-};
-
-static unsigned write_class[] = {
-#include <asm-generic/audit_write.h>
-~0U
-};
-
-static unsigned chattr_class[] = {
-#include <asm-generic/audit_change_attr.h>
-~0U
-};
-
-static unsigned signal_class[] = {
-#include <asm-generic/audit_signal.h>
-~0U
-};
-
-int audit_classify_arch(int arch)
-{
-	return 0;
-}
-
-int audit_classify_syscall(int abi, unsigned syscall)
-{
-	switch(syscall) {
-	case __NR_open:
-		return AUDITSC_OPEN;
-	case __NR_openat:
-		return AUDITSC_OPENAT;
-	case __NR_execve:
-		return AUDITSC_EXECVE;
-	case __NR_openat2:
-		return AUDITSC_OPENAT2;
-	default:
-		return AUDITSC_NATIVE;
-	}
-}
-
-static int __init audit_classes_init(void)
-{
-	audit_register_class(AUDIT_CLASS_WRITE, write_class);
-	audit_register_class(AUDIT_CLASS_READ, read_class);
-	audit_register_class(AUDIT_CLASS_DIR_WRITE, dir_class);
-	audit_register_class(AUDIT_CLASS_CHATTR, chattr_class);
-	audit_register_class(AUDIT_CLASS_SIGNAL, signal_class);
-	return 0;
-}
-
-__initcall(audit_classes_init);
-- 
2.43.0


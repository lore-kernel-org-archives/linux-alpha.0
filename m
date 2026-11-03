Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742211;
	b=1Mdt1al//1KQmEEvah4M2fJHndANkoSl8svW8ezQqSkIsqerYS+udATiHTm/sSLi1k2J
	 WOaefOhDfyp/24HPfg1+BNj4YeXbHzcqq8pWBYbKwiZ7YSadLo9OfTTaCGSBMLtCcrfYc
	 HoT8JZ25nghqtega2pIUV8mqYGT4h80MJXvQzRfDCtUQN7WBNtLARMxsnps7LThVhJrow
	 IuUJKAGtcdlfAE8c0CBow2fxegwWNnq/OGnxdykbRjJne/KiIttbQnKrqD/VQX9XWdXqX
	 a44C9Uzoe4Wz74q0QQJQod+VfpmM8Uc3/35veyA9uxpdoOxZU1lGD17wT1glPVfec2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RVEIkunp3Gi1nqEQUIPgeCblUDOOIdLKHsKWiyUlKSo=;
	b=Big3uoSGjLw0sTwhk1IkweMmmsDVCOYmwMO7ukm56WZW3ZCw71b/E0/G0eEHBDH0PKqj
	 QwX99+wgNh9e+6Ypbp6svvWHZY7x/JbNRxQdeLEz+y8KxIx9Hv3PM4di7azW3j3jzJyU6
	 xgaAHNDO2p/11tBXzYa5fBuMxi/IRt6QsbwYP4EJg7XIiEftI5FLb4GKAVLVOyLToF8po
	 NnZCzar80AicR/CFV+VGddAq2B/kTJMCKvMlWyk8ZNWm2mtEgs5J4RsO76d73CdEz62oK
	 8PqvQfXdViaI7yC4gAtqxLNdRzFlx0rwVW86Odigx03ZY08ByGMyiDlZvP5BysZTtUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HTHfZyUk;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DE56083626
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 21:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6DE56083626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HTHfZyUk
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso6439038a12.3
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 13:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742209; x=1794347009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVEIkunp3Gi1nqEQUIPgeCblUDOOIdLKHsKWiyUlKSo=;
        b=HTHfZyUkR+CGaEi6RFltw/Q79BosoRmkYOaEoxG4BOnw3t6SV8KOKChgJ6EvNnShT5
         C1eemaxBQENs4tJWO8q538GklljGQdb3jXJs6SrQpJdGDPAQdbt70f4FHVUaqzI7zNdy
         6/FtUS/ts53qLilpvz/Akv8860ymHJGucqduMgjYcvJPz7PNx7EWvtrKtgcCrtARWEf5
         8VTNKhhV2pPMNwQRsnZlfvFYMmy9lLPCfZzZoEZ6ab2uWbMKVH9jOsAdNBUf+QdYuUla
         ESp1VuQNM1D1eVt2poGmTPndkc3jpvuXq/5Dx+6agQkeC7VZVtyFVcLlUAx/rZnxT5t2
         gFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742209; x=1794347009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVEIkunp3Gi1nqEQUIPgeCblUDOOIdLKHsKWiyUlKSo=;
        b=SR4Zi8V5R96OFJyTpFNNG2WrCwZwTsrFsem56YErpnSmraRE51fiQ0+TOJrOrnl7JU
         4pXIOtJvvAZmzZ9AgMUOLLidG0seqrhLJwakpee/2RjRMdn4EWOLQQUgkUPn5GCNjlLW
         dMwu84NC7QzRkhVWCvvragc/uCALrZOlZO730g7EzE05naAteEXa19JK4uFHrNrq7U3R
         NOGW8iF5jbF6DCvePA6Jfd3TObChEUAGcudDsBOlU9d2D3gNaFU9yHRveq0SeXLZmhDQ
         KJNvgcFEWzZCwjJdcTDaXkG/PTL7ZiN5g9mOtS+9AOl266T0lsdlKo/TtQeQFPeOImSB
         uDfw==
X-Forwarded-Encrypted: i=1; AKwUvBxxH+IvEjX32kIb6WWUn25IsMHy2OtpPAd57p/5B7NXjpFUPjgnfH12bYuOOywewzoE/SB2uNXzJXM3pA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+MnyunKtmeL9B1Tpqlye9rQ10bnQzQfLYlXpU4ZASPnlqR8aze
	ftyRLh+c3z1E6R2Iw5Vm8zP2ni0W/LfuXttZyDQVDMQE4RajPLdeWXN5
X-Gm-Gg: AYBFou2zooDbx/EE2mrkePpq/SLMEORGp1Eu6TPjMW7pX469s0/nYKZDFH6AjRLaqjt
	v83holBuhXBVBfVHcmgOiF6XGmhdFeVxBQ3XIs9hjIbmGaxpq/cdlof3HaKdU9hz8jzfIU5G2HC
	qjGR9Hk8Y0b/Sim2USY9XcrKw8Qp2TPE07fy73iqf3CeWOSw/IvCQ6sETJVO0/oKQMHsXOOgRVs
	01Ef+JtITeoEfmzRlhp/wuF6Z2A1JvE9ANnx8T9ujiKu/wU8O/AGmmeiODcbrzET68D5CWCKZjR
	T0ZpQaJT94fsdgFoQOYCR64WkdI1JmvPz/yftRijnh2yzz3TglxQadAoPNxtPqL4s87NO3Pmdnc
	Ng7vEH7FLNYx+7kTY/xxiXhmHP52WQVZnGRw2HQY1WUm6slLYxPhmAcDHj1hN8FG5f1l86sTmc+
	yXvPw0uZsNLnv6B5GPpIJ7aiLLCYFFon0MQTEUuvCfvOXCC9bSOXHHW2VW1VKwU3y4oK2hk0O6C
	UKu0WS2vRqaz5pMGaEaV71zNnrU5hXpH10+5Te4cH3vAPoh/l+uo5qHFRc58cYdFIrfPWXy3tYX
	Zv2n8r0zwJgDeAUSBBBMggmrevCrNmPOzT/wSDS5ykDFptVWVxcvTGELcUmN4bcWmYFcVOs=
X-Received: by 2002:a05:6402:22d0:b0:6b4:35af:328d with SMTP id 4fb4d7f45d1cf-6b4d438bdacmr8620654a12.14.1793742209093;
        Tue, 03 Nov 2026 13:43:29 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:28 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 14/14] alpha: use generic CPU device registration
Date: Tue,  3 Nov 2026 22:35:20 +0100
Message-ID: <20261103214120.1099893-15-linmag7@gmail.com>
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

Select GENERIC_CPU_DEVICES and remove the private registration initcall.
Alpha keeps its possible and present CPU masks in sync, and the generic
path registers CPU devices after SMP setup using the same register_cpu()
helper.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig        |  1 +
 arch/alpha/kernel/setup.c | 17 -----------------
 2 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 014a52e63dec88d72c51c93b3d1c254839ecf33c..6ccb2d2303269661eb36ba4892e3026bf595f8a7 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -54,6 +54,7 @@ config ALPHA
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select EDAC_SUPPORT
+	select GENERIC_CPU_DEVICES
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_SMP_IDLE_THREAD
 	select HAS_IOPORT
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 28387786cb9f9ad4b587a22a3b0267b825b424c7..9fda01b73b18414c8d9c12903660024bfc0af94c 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -17,7 +17,6 @@
 #include <linux/stddef.h>
 #include <linux/unistd.h>
 #include <linux/ptrace.h>
-#include <linux/slab.h>
 #include <linux/user.h>
 #include <linux/screen_info.h>
 #include <linux/delay.h>
@@ -366,22 +365,6 @@ int page_is_ram(unsigned long pfn)
 	return 0;
 }
 
-static int __init
-register_cpus(void)
-{
-	int i;
-
-	for_each_possible_cpu(i) {
-		struct cpu *p = kzalloc_obj(*p);
-		if (!p)
-			return -ENOMEM;
-		register_cpu(p, i);
-	}
-	return 0;
-}
-
-arch_initcall(register_cpus);
-
 #ifdef CONFIG_MAGIC_SYSRQ
 static void sysrq_reboot_handler(u8 unused)
 {
-- 
2.43.0


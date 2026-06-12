Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1697E352018
	for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 20:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781296410; cv=none; b=itCd8rzmmS4XyVdrIAoY+3J+GKSVA2Blr1+ZCD4Ue2U1owLYh+uuq79COY11I+dkazagjbFw2s+e2MeAkLLo3cdNANdpL5qvxhb9piQcpCS1Cog6AALOFSNZNkuIO6ZroUEWHjZKRKzT4yhbYGEuEzqU7pSKVlW/KgPioRxrhgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781296410; c=relaxed/simple;
	bh=ZziSC1n6N4F1brdtCP75PwL3mwkBGaV/H9I0p/XM020=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EKkYVl1pUpAoU3EiExJOB3kSQUsf//qz6yTg8kRPIah/cRljz8PPEhLJNqvOtsshUz5I9wIjWSeEU8vHNyZCa7AzpTKXkDMDaV8GkjeLuLpD9Yowu0uJdGVTdT1XuwRfsr3t4D7+U/0WD8jLqv5YR0N/Ui6PYjzQ/oK9DlK1vwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JE2MZ7l2; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JE2MZ7l2"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa88b4f792so1876089e87.1
        for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 13:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781296407; x=1781901207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTcVz9luL8bir/ZzptwlcjQQqCfAppeo2d04/ZWzcNg=;
        b=JE2MZ7l2u7dcbm2GUtkaJvrYXKr26cTCpGIQOaLIjtQ00QVB30e4g0bE5CZC+JZIdG
         Hiig0JxO9KbK+6nhZ7cjjW7bxnyt3suo89Hp0AlJhyabanuAAt0j7/erXTFlliFGpw0x
         zGbDT0ll6yOpw2TQY/3meMPiEfvm2Hl3dxrTGiq1TrVXNk2XhTPohvXXXz37/WjPjsn+
         CnqJ7apD6kUtKVdqdTbZ7DGyHp9+eeXIa80qiSFOg1hFTy8C9gEy4HzPG9jChZI9F/z9
         YuJCBIQ9PCaIGchITgeehinnX3dnRGiXwd65iy2qORggNCib7vhXsnhulRiU5IIq315+
         c4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781296407; x=1781901207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XTcVz9luL8bir/ZzptwlcjQQqCfAppeo2d04/ZWzcNg=;
        b=T4+cQnsnZjm5no5S40OfuopstyiaN4JRrJJ1QvqmZPZS0ZNaXyMEuH32LzB3/obNYF
         TdEGZkhaDB8kBTWeYFIX3tEREzkinTmjpbtOF8fTEq56WidlZkAaTOMFfW1G1jmNrZEu
         Bo+FffTlmhxUPwJU38gc95Dr55rlAheuImWRnBsdSiu50leYfgDm7xxO+0zlmIEJrqAK
         GMRbeWtN0JH5sgsb9pGg5Yv/Ra53vLa0zww78UXV1NtsfN+AfQaF4wxrAIzQ39lSLMes
         72ycKuJGxVdl4YYauFjsMHfWVtaUdSHv5zzSnHK70wS2RNbTfUY5WKg1Bs9eMQqhdd9Y
         ALOw==
X-Forwarded-Encrypted: i=1; AFNElJ8Ty64kXSN00xEb8E8YRxXilpb9u4Hdw7pguF9ED4tqJuhhi2OQmOREmRCv6vJ/HdXtvod/PenzLXDnRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqG74GpQMByGVvHkrCyiSOO2rdRBNV9xGWOgvefvz3YylAePjU
	8pySo6nCmI2M0bbXxBWEThGpiT0WAMWSVmyVhFZGHr517uFJEqefGA8A
X-Gm-Gg: Acq92OEeCRlHv+hDtNt2g3fJsd+yQRSBnCGTcRAX9CtH4DLYjM85nk4vc4ZmmrWSG+A
	UyFQasq5VJ9hdc/6lmdUI+96yz8Zpz8o/JCrcEKYDERcoF11UvTF6+BHiU4qZNH5gnW+TaBkIRF
	duPrfKRG3LOYcr4hCGj6SCvYWxssUMRR35VUz471uEOP2ZRZlXlT2InEBrCEo+htlmWxzegFiQe
	iuFQjQWWEk8h7zEGTuNUzk71DnJHBl8WsZR6mlvClUqT5JgRpmaolO6717qii+R+kY0JuClseRh
	dx8YwGyLdIeqdWvenTWyXfM7p90L8LVGU9pTg2gUVLxXcITMkXIOBxR4guapsvNIjzzOq90U78z
	Lj7FCRqcnOXWU24telPr8/idKo/ORAcwT7kQE/OsmlP9iR+E3f6snl9c9vs/tkcanO6WvbKC2SD
	CeAlNtmtq7ZTwpJgdK3TjBfuMuNrlVOl00cd4CEGvyyNmOZ94lb1rEzJfL6bHqbuT/085tnDfvg
	gVWly/WyB6qQyolcurtLqZUZhkpZRBX
X-Received: by 2002:ac2:568d:0:b0:5a3:ff48:f7d6 with SMTP id 2adb3069b0e04-5ad2e1302cfmr949739e87.13.1781296407105;
        Fri, 12 Jun 2026 13:33:27 -0700 (PDT)
Received: from buildhost.darklands.se (h-37-123-143-144.NA.cust.bahnhof.se. [37.123.143.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161e70sm788949e87.5.2026.06.12.13.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:33:26 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	macro@orcam.me.uk,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v3 3/8] alpha: make irqflags helpers operate on IPL state
Date: Fri, 12 Jun 2026 22:26:51 +0200
Message-ID: <20260612203006.2265557-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612203006.2265557-1-linmag7@gmail.com>
References: <20260612203006.2265557-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alpha interrupt masking is controlled by the PAL IPL value, not by the
full processor status word.  Make arch_local_save_flags() return the
current IPL directly, and make arch_local_irq_restore() and
arch_irqs_disabled_flags() treat their argument as IPL state.

Mask the low IPL bits in the restore and test helpers so callers which
still pass a saved PS value continue to behave as expected.

This prepares the irqflags helpers for lockdep IRQ-state tracking, where
the saved flags value is used to determine whether hard IRQs are enabled
or disabled.

Reviewed-by: Matt Turner <mattst88@gmail.com>
Tested-by: Matt Turner <mattst88@gmail.com>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/irqflags.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/irqflags.h b/arch/alpha/include/asm/irqflags.h
index 9f25d4e0d37e..f207544f52de 100644
--- a/arch/alpha/include/asm/irqflags.h
+++ b/arch/alpha/include/asm/irqflags.h
@@ -26,7 +26,7 @@ extern int __min_ipl;
 
 static inline unsigned long arch_local_save_flags(void)
 {
-	return rdps();
+	return getipl();
 }
 
 static inline void arch_local_irq_disable(void)
@@ -51,13 +51,13 @@ static inline void arch_local_irq_enable(void)
 static inline void arch_local_irq_restore(unsigned long flags)
 {
 	barrier();
-	setipl(flags);
+	setipl(flags & 7);
 	barrier();
 }
 
 static inline bool arch_irqs_disabled_flags(unsigned long flags)
 {
-	return flags == IPL_MAX;
+	return (flags & 7) == IPL_MAX;
 }
 
 static inline bool arch_irqs_disabled(void)
-- 
2.53.0


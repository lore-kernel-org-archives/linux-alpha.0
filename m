Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD96A322A1C
	for <linux-alpha@vger.kernel.org>; Sun, 17 May 2026 21:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779054006; cv=none; b=kH6qsisK0F1r3UlZSHZyzLfDMiPpkGwOjedogEDWkVeuyMDDSKon8tBLDt0/n7kFhZ4KW/RuKWRylcZJGSkE/bcXHyWIaYeMYYWUafpFi9efUNWFkv+xVnwqKfs25Q4623JmBAhp4fiEgRHx+aiSimmdtBqPFCmnrqj9UxvlYTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779054006; c=relaxed/simple;
	bh=9Gis33Sp7AVsisa6JN4s5EdMk7i/H0Ra9vdSrPS89l0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=drUVRK/0PJx+Y5cz4H4xneUbUWgso/d3yOaQzU+GdseV1I64n3rMB7iMhczoe9HGUqqUNjcEubHyjjci8N217SKacExdsrvkgDSLJs8q64zZzUjvDc1+UmOfUJPec4hOGtLWKbWWbLVfhaSZq/aSoQVn1TB7jXX/YoDmOOHQ6s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CK/7skxu; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CK/7skxu"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a8891febd2so2315845e87.1
        for <linux-alpha@vger.kernel.org>; Sun, 17 May 2026 14:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779054003; x=1779658803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Zeom7iA0plPmE0dSLPeGIAyQiaLvJZwK3BO3d2pnzY=;
        b=CK/7skxuwkVfoMi0oED6dWzXo9FJicD2tuh/0Zd1QviLngub8Lv+u/XcpDbBrWPJkH
         bvi3pyA0lqYBT38jLhmZX0IIuE507rcHk5QSpzikffsLQq13RTyInDVUA/Wi/d2IlPCy
         HHHPrNNPLGpFS34P92lfrHIU4t/WEcsL8inLWdH9aSXkfa5G1ioL18p4Kgy6FyCmaC5A
         x1Nq56x+czkThqGydQGlkXP9F0w5UOvglg1PeAfjGq26F79rUEmFNmkAloQxtCEbrQdg
         ZnAOJw2DMEeA6WLOJ3zgGr6RZt+Wo+MpiHWHh/yHe8aevveWjC0AR+UpvgkaREkRJzZI
         YKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779054003; x=1779658803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Zeom7iA0plPmE0dSLPeGIAyQiaLvJZwK3BO3d2pnzY=;
        b=qjGtEcs4eQBSW5dLI6EtR05qGpkVmq0Vz7+QPzIQ1l4d7w4Fw9wywG4tSHmOC7HrDl
         zUogw/3PLk7Fo6wyV2ZqiDxEvtk+qRQL2gYi5O94oN79yv3nPGeBNfh2kc2HHj26PP4/
         AcWYy+bO4nYeF9RweYt5DmJs3XRaZ5+LyrepSUOdNxuWxAtXUSgBK0vOC/ueEqVcJgPW
         gi3ttkY8gvMnWM/d5tbr8cZQC2VvMwA9O+l7jJxpRLXokg9IheW2XHCr+8Mgo9tpgHFc
         xrEEfBTJbl2QbUMjxx8cSs4eXrD6pzF7RDlF0Szc/AON2+56+3fuD3Ko9QQzMvnDcKB/
         7ZlA==
X-Forwarded-Encrypted: i=1; AFNElJ8QjTR3YrWSNVQb1XDYuYUwMB8UVyIn3GdGhBwXrwMODvh5nUOKu7Bl0J9+pWOAei9ytayJTKET20O3Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtm77UXvakazYActeQMSlWbYYKftMTYKauWCXCBmpgaf+gtXHL
	ofXMr56tbHXCGvpveCpNL5fGHl0QRN6Hq2yUIzuyh1l9mV7WbQ8LW7T2
X-Gm-Gg: Acq92OGJ816aYqTL421zQXDJ1TS+7aKQotAMGm5MC5fWH6hCeNq+kSeWMn7pN5xbpEx
	YIuJMyY8dOy+K7Uc7X59UVCdZF6gCUMvQE+MGjFja6UhGlJP8rjxduzkAta5lwlFykPu6bDpQYp
	+z+SWL19ofbUOI2NfduWVkjB1L32YTjEeKD50yIJh4sSQSfU5SJK9+xa0KUffQI5b0HyD3Mk6jQ
	HB+2rLpMc3CsknIoRrxkC7qH4cOVG5c0H6naTDfJbPHFRQ92S4q7yV3PFppk4Nh7TqCytsJWstt
	VHhNoILRdvb0/wtzcTpmca8FsZUWhuU/8KjAFAsqssQafYFlOx0fhZg0ntIuFfLmagTx7H6Wbdd
	TXvsuiEXGwgVscqIljBXSL+nf0PbmWP4AC0vMMeXH/jRomiAzNK/UuQLocgZiybqyfSpjdGZR5T
	R+EUfsnKzJFlKrEmzBSKJT2azp/whnmEYn4kjB2qlKFzV/JRNCBVwHtNu7+Qvve3at922rtS3GN
	jBaoGpbW4ATXoXq3dEPYGqqNQD+jDZjgTw=
X-Received: by 2002:a05:6512:3d88:b0:5a8:7f52:62d1 with SMTP id 2adb3069b0e04-5aa0e733f44mr4523580e87.1.1779054002895;
        Sun, 17 May 2026 14:40:02 -0700 (PDT)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91c1558f3sm2890076e87.77.2026.05.17.14.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 14:40:02 -0700 (PDT)
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
Subject: [PATCH 3/8] alpha: make irqflags helpers operate on IPL state
Date: Sun, 17 May 2026 23:36:12 +0200
Message-ID: <20260517213919.347523-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260517213919.347523-1-linmag7@gmail.com>
References: <20260517213919.347523-1-linmag7@gmail.com>
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


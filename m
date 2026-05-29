Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AD43E95A4
	for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 14:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064629; cv=none; b=PRE5ymwsQ7QBTCQ9uiqZAv6ykBT8KTZ9zmn+NEdlso1z02bWyJxvYWJN8Qd3LJn4MxzndCEXCyGkAVSmLZtbHOTL/wyHbUbTxOF1kljVHyicIJqpN03cixVu7OASvAQjbn+El/WdSnkKtkJCvgPAFNPskFFDmC/uNudCABMc+60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064629; c=relaxed/simple;
	bh=9Gis33Sp7AVsisa6JN4s5EdMk7i/H0Ra9vdSrPS89l0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uHpQnwwCapd60j1VLXfbx6T0iVZXSVB4lxXA4IVeVD43girw8Rrk+jwZgiEu5mAzT7TZAtDmEc5ct+erQ+XHfH02qbtQE9wWk3Bohw21A3NJRwcRDVMUun4iTd/5TS4lvk1kVfLBvTRrlvIyHcPrNauMYc6KuBna0c/oVu69oxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LreKMlOa; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LreKMlOa"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a8721851e2so15824486e87.0
        for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 07:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780064626; x=1780669426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Zeom7iA0plPmE0dSLPeGIAyQiaLvJZwK3BO3d2pnzY=;
        b=LreKMlOaxfjsCNDmFAvT812VmLx57lDHzpOoXXLv3zIxq29AfRC1C2l31fiYdh6+E3
         UMqiLKoOo6HdCPzQMjra/gnyzlJKen/lFbX/mgBnfqpUM5dr8MlNzBzAicxrXPD/r8U3
         wU5qmk2Xeh2GyJPVpV0NyCB5A4lEYZXcWKP38Vt4Q/1+qO7FifCfaoPsb3XgensApF9U
         jn89sbDfPCW8ZBMEQZiO6e0oMCbPatWh7YyNKKuChBp3tab+jeS977HmTurKLWAUxL5Y
         mukN0Hnl6I3lBB0xWFMtxsFQqDz1NLrJQkY8qOgUGJcjC4VNUbi+FgwwcPnPX4gOyFx+
         +FKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780064626; x=1780669426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Zeom7iA0plPmE0dSLPeGIAyQiaLvJZwK3BO3d2pnzY=;
        b=Xyr6WowLCMpaj7djiKzZK+S1SSvce8xPTj0Ci/8+Gib5hW6FB1qM6Ke+WlX6CmELF0
         uQ4Pfwbchv766KPyHZGEs2gPaA3fSqVM4avi2+nAK7L0oT2ffdZJO4nN2BFiP/a6KZQB
         TbSLXVNdcwZTL3gSvRjXDXqZtx9atOEKsOWsFvIzNPyzs4VDohjHrk2wQUTJmuOoIZ2T
         VhZFPAU4vNbRsTcgFaPmZksXWKl6/O3pMpysYgJQtRiJ+pfjngEDAp3FzMcqTWNEMMlK
         KEdP9Amyab2cKwJYkG+/XiJs6j4fM3Rps4FuDO3wzafK9nuuwssECKapuWouZBaQ2vLB
         VA1w==
X-Forwarded-Encrypted: i=1; AFNElJ/JV680HhFFYfZkVej3HF6SRmAd5vArUbwYet22gv8/Fhjb/MU69lBGTI2SEmk2aR6WZmiVQIYtNXE2ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOpPqr0ZUbeWOexbnnxcHkTd5F68EsX2RW/ZqpD6HZK3U2S9bl
	TkrWGKIo7bxGr+CQQmZmgl/Bujz5u3W3nUUWdj7yZd8RF/KFVLSFwORy
X-Gm-Gg: Acq92OFZDIk1LualbKGZU2dmna/FV6aZqqYMbYilYiPtqxoR2m26AXZMQ6lqmL3c8i1
	YncYO/anoxCj+q+F9eplumcXmUfZHK/denxWLx+E8CNZsv9zzjBMHINLgZlqDmIInLx/mB55pST
	o15Yiz2RHw4Kzbpgz8hHA4Vq1Z9CJf+nVmhkRWKHHdDMcFUp+W1+VM2y2ktBejYXF274pJlDher
	BaGOCCxqKzQ6f/XC67TEjQXPTDK1XHWVqwNTs/z3Gdn5nMVELPbw1v2FI9dfs9P64VyxIE3bZJl
	7aET/MFAWONcJSTJoxPYay2yKapDwNasZNQK+VVGAsg4VOLWaHtS+A+hoXFvazYYlVWTsQ5t4JQ
	i67QL67vkI76T1zfV9FQFlNaKGG9QSoaqIA4cC5wyLOToZgQXStoeIjgm3DelTV9+n578n4RFhj
	gH763WCNedGTA/wQMYYTvJxjK6D04gbGJs6FhKXIU9JkuL1YAw94MpMyxp6QhpWJ1l+Q5ui3/uz
	aV6MU+v/kt8xpBsoYD+eE/WtDaZ6liofcmYpmtxLRMzOg==
X-Received: by 2002:a05:6512:3993:b0:5a8:89d6:93e0 with SMTP id 2adb3069b0e04-5aa607ce094mr13521e87.13.1780064625585;
        Fri, 29 May 2026 07:23:45 -0700 (PDT)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b0687e2sm310433e87.6.2026.05.29.07.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:23:45 -0700 (PDT)
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
Subject: [PATCH v2 3/8] alpha: make irqflags helpers operate on IPL state
Date: Fri, 29 May 2026 16:21:59 +0200
Message-ID: <20260529142322.1362438-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142322.1362438-1-linmag7@gmail.com>
References: <20260529142322.1362438-1-linmag7@gmail.com>
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


Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A795F2EA47C
	for <linux-alpha@vger.kernel.org>; Thu, 28 May 2026 23:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780009529; cv=none; b=q+3n+bmG9q2NJeeb4LVgoOgzDPY5uQdm+7eZyJn2cFha/FQN0y6OGvtuNBxS+a7puIAuDwDLptYncLh4geZADXZoYjogtcoGi4XTwB0Skmsr/FTgiovB/Nj0fTUJK6s7IIGCzXAoRdP4djr3OjW3QvT6tPsq4Mk1IMi416pkXOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780009529; c=relaxed/simple;
	bh=FThXBuMZQp8l6oss+V4cuLh46PxufVFHFzAn6yH6F2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bAbuIxrf7kwAkLZ4PZP9322UdUnVMq2tNSuY40kKXEVrJbixrOgfhKWMlwVAae2TaZcMFNUeqDaYHcp/Y9buyDUzCXG2C1agegb3xzn0KiUGo4LcwOhya8dj5csrWxKUOYnSyoVyAvqIpjRL6fGs51zGOeGywMoFqdSyDjx4CN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pbeXmoEK; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pbeXmoEK"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6587cee8b57so14755115d50.2
        for <linux-alpha@vger.kernel.org>; Thu, 28 May 2026 16:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780009526; x=1780614326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xOlQJ1NgwFkmwieEj91ogwoRE1brqm+EKk5o69Mvzzo=;
        b=pbeXmoEKv79Q50ybJrNgAORsI4Xhraer+zpdBxTmsAK2U66CfkBP4NNaRpbWa+lUt6
         LafpqQw2sM9ub46cPoROykBaXvhyoNBDsmlNBw49wjanZks64Umjo4ZqdsOx4uIwmTYL
         JCEEAAHhmGUBSo63/McfrUjJML6FdpAh0kEmL+Yx7BcYz85OpC+7TYJdwp0mA9rCLmAb
         2Dqb/nZktSYfqC7dx51/gEikxX8jnp8L7mgOiJZTj0dRQUR8TfO3ElYm3c8m0EdgRx/+
         f2OeT41g5NCy3jf3vIzAdMR4Q1E7OaAuxJVzt1pSGHw5oOrhZK8xbZ4I711FSX/4lhSO
         67Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780009526; x=1780614326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOlQJ1NgwFkmwieEj91ogwoRE1brqm+EKk5o69Mvzzo=;
        b=eitCZN9QGsmIEog1iKLO9etB37Z3oJbd+LZnKVoZ5u0L2I3BOGXeDfnT/YAUjzSwU3
         EtkWSCUwj6ULCEgWdaHkhQ/kJiYte1IVuMIOG/J0rywxaL5djc+ZW4ERfXmmwevuesHO
         F0fqLpaTwsUrzj0oEALOQs4oYa7aFhUmpSTYOCqnh3UXO9CxAnuw4QpJM78tAmjujBql
         nD5OD2hPTvpfQw8Hdogzjxm7Y49dikebz1gFh1yR3HkgPjeWiVs0g5zVPD47MArHq+9m
         H9HbZY8dG2+JBHWPgiuhfGBLgDw6LsWRN//LYR/imGUv9HndJfpyoDCvOwTs8gevnZ3c
         TXNA==
X-Gm-Message-State: AOJu0Yw84KkylDkqSPNQ396DTQ2a/Lw7kAEUhcYS8qU9C1H2OqYAGu8Y
	f6MtoeOh2G6RlJ5ftwoN96Yo6dYLbV9yDuKmI6AkbUNP5Jd7t5Yq760N0Jf1Mt7/
X-Gm-Gg: Acq92OH/uGYl9hF4gIt0M7ahss73f4Bouna+caA7SgjbTGOFGRuOzzcDKE2eLHaWpif
	iKDsCpHVxf6pTGOUD7WwnKGkGQReU8IlptMfkHEe4NcH9LIpQf7CZvDQFQQQw9tm+hYp71uYGcn
	LyYjiZoLefLDb5tt6NZg8wmLt/zpes2wq0hfC/5JQE99k78E7JZktRj1GhKyKvmv+ftdV75rMnn
	G0V05PuPgXwWBAhlAmpvsPrTgGvSvSIaH7CIFFGgi2o/iv3XRn2bYIweOMMzWFU7wgeJynmbLEi
	pxDGnIoSMfe9uT/Orm3UVSUGKBavzEzpg8HleZUxrgeyGQblfhOsuQXi8UVSmu0Napct9H9bEN/
	DWbqkzAac8O3DQ14hy7FmMgvyO3qE2S/UN55UfdJV+zDnfaOGU6BWiH7c1VBqcyY7jkiGJBJfXd
	xwda+I6KCRJSeVrqOnx6Lwtb78cTSUEFT5Nh0bZNMUMfkDhzgNnXmtr1O4Z+GABOMxcvU+N4Olg
	I4gBMBAlA2FtA==
X-Received: by 2002:a05:690e:1908:b0:65d:f5e7:72bc with SMTP id 956f58d0204a3-66052e33bc1mr114761d50.22.1780009525620;
        Thu, 28 May 2026 16:05:25 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6605362df73sm1535d50.3.2026.05.28.16.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 16:05:24 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Matt Turner <mattst88@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] alpha: marvel: Fix irq_set_status_flags to use correct IRQ number
Date: Thu, 28 May 2026 19:05:15 -0400
Message-ID: <20260528230516.1839694-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass base + i to irq_set_status_flags() to match the IRQ number
used in irq_set_chip_and_handler(). Previously, IRQ_LEVEL was set
on the wrong (low-numbered) IRQ descriptors rather than the IO7
IRQs at base + i.

Cc: stable@vger.kernel.org
Fixes: 08876fe8519c ("alpha: marvel: Convert irq_chip functions")
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/sys_marvel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git ./arch/alpha/kernel/sys_marvel.c ./arch/alpha/kernel/sys_marvel.c
index 1f99b03effc2..bebeea3c286d 100644
--- ./arch/alpha/kernel/sys_marvel.c
+++ ./arch/alpha/kernel/sys_marvel.c
@@ -275,7 +275,7 @@ init_io7_irqs(struct io7 *io7,
 	/* Set up the lsi irqs.  */
 	for (i = 0; i < 128; ++i) {
 		irq_set_chip_and_handler(base + i, lsi_ops, handle_level_irq);
-		irq_set_status_flags(i, IRQ_LEVEL);
+		irq_set_status_flags(base + i, IRQ_LEVEL);
 	}
 
 	/* Disable the implemented irqs in hardware.  */
@@ -289,7 +289,7 @@ init_io7_irqs(struct io7 *io7,
 	/* Set up the msi irqs.  */
 	for (i = 128; i < (128 + 512); ++i) {
 		irq_set_chip_and_handler(base + i, msi_ops, handle_level_irq);
-		irq_set_status_flags(i, IRQ_LEVEL);
+		irq_set_status_flags(base + i, IRQ_LEVEL);
 	}
 
 	for (i = 0; i < 16; ++i)
-- 
2.53.0


Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D29019DFA2
	for <linux-alpha@vger.kernel.org>; Sat, 22 Nov 2025 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763814558; cv=none; b=tfdqt7Kca/YS2FjYRpBxpaoNmtZqqangFN1NLEUmeZumtd9QRhzdmyd7dBvn3S+lAORj1H2ukRABciDcLpjKUgUS0CCEBRfsaTKALelKoMce4tdF4V+AZuLbqnraAXXwrf94ZDtyO28IRiApAxRdQ8nDKGaQ8/BSkFYipCsFeQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763814558; c=relaxed/simple;
	bh=Kv34Qhw1M2zx0fQhMPas0HbCW/VUH/y8+M15EkSCoKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R+RMeThuGwIndeDISXxEjFPR82BEUUKBNzqQGCjYOUFy+lrcZqwDiu4nuHPq36/HXppt31P1Zt4roXlgESo+/5wmUJxyf3NPcBkiiCAtY/Tq7P6ofM9jc1sxinJ6nLqISV48kl6peA7KwZtELbDzzUTnFgPul0Grpe+fZtk4rV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TH3A0TtS; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TH3A0TtS"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37a2dcc52aeso26994621fa.0
        for <linux-alpha@vger.kernel.org>; Sat, 22 Nov 2025 04:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763814555; x=1764419355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KE5zzu6+WyidL/pFkBhQCA/eTQnpCwLRhErWx45XT9o=;
        b=TH3A0TtSslbwUcIqlrkFAmpE9zMsMq1SMiFtMr6ZnnxfCXd1yIe18+o3zfg4qLOmUG
         gN6IAemsA8dL+hClc3uaN3nzjCPW+1wtRaPpisaZIogbIODg8TWRmdMs75dz03aViVtl
         qClNInYv2xH9HS8wjXIa+N5ZSBjK+JK8/HDRCopqLwz5+UNeeMT670Qyjoo/Ok3PKY2r
         PsdPmhaUJoo7/NLIlum3v/uV1WesRzAt/kuJ0OuO6PTsjnHFES0bJ0W/Q9MoQ/Kc28A+
         Y+Z4agYjyGmerBJVo/g3PEm0knmozL+LcQGtnyTBfXOTGL/indbUC6Kk32GLRlY2QLIJ
         nRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763814555; x=1764419355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KE5zzu6+WyidL/pFkBhQCA/eTQnpCwLRhErWx45XT9o=;
        b=vC2mb2ia5LwO2w6malzZC6b1qiozJ2rR7hX4APpTemajlfClI+0txmZQvf8YdHEB30
         Jfq8V34Pa1MCqbo7n1TLDUFw2SkThHatGCVe7cTYRlMlwkxewys98yBux4PFPrKNOBxw
         hJ24uFWfLXaYFEGd+gFV4NFQfkSWa7I/cp3kLjRkLu5HhxpepnK5CW0iaXzV3LWmQuYR
         KIy1H2Qzoh57iZRwtb4JcsoHyDGU5mzJ6uhJh+e54fvvkHyCEwRlrSqWq5mnJ+PUJtz8
         b6qy/ES//0S4OiYy4Nt8J/p9yF+5cvF0cUkYIux+p3ApSrYJxj0Hx4uynxihWQldfTnz
         mA/w==
X-Forwarded-Encrypted: i=1; AJvYcCUDwVzOO/Rw+Iyk3XlyAEvF48DiLYFbmC2vjzcq/IKn0vsO1pUBb/bcU2aiOMmh/j3dY0RouW3Hsc+oog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt3y5OglBgF2E5I08L/SvK2/S+FOwFYMysvDmHVK+QZ12HehZO
	4McaS8Wg0M7wM6uwnqj1Dti5wr6oYDRyOHEHViv9IkaboNwc92fluBOtbCBxFSx9
X-Gm-Gg: ASbGnctbURduYzCnUPrs7iYLejUv3rO6WvpVwhmQC7QjFLF9J9tpnd181H0XXb5a6uw
	VztJDoLBz1NIve69HQ8lvXqIq9XR6V2wv5SiegziHVHLMyQGj3Gu0ZXv5sN+z1PqOvoVKyS0T2e
	5qMnN/bcvPke7Gjkw0z3r58RWesT/n1eKSDtbFDRwiYAkC7cHsqi8ejoLqfKNnlOI0suA6uoX67
	cw0mXxHtRF6OJr7NTWU7ylJz/lYLaDnGrXxHtAJNzM9vDGcaTbNulVoEtuI/iQ/sYHuN1MeudDZ
	jdfutR0jeaoONYWuqGdYvjapn7URzHzlVSvdmFUJ9w91BNV5zXdCM9xNfqEZMqwugGUZvHc7dxo
	3LR/zD5A4U5X+YR1JVkUknrdEYXXaIG7/IJl9spAoHwss0TPouuRrTy84FXn1tBLBObivxu5GY1
	ZXLPOUVLF1adAWuzw0OlsxoelMzOhINSkuvlW5Ab5+xLhvhWNmNbO6J/0xIEgT/eE=
X-Google-Smtp-Source: AGHT+IEfHEd1eKtbkmPVx2iC265Mj7H07T7tOJ7ekf7uuPq4wGrYxeF9XEHvwGQeCxYdDEVuH6afQA==
X-Received: by 2002:a05:651c:4184:b0:37b:8f05:13bb with SMTP id 38308e7fff4ca-37cd9252e34mr13332011fa.27.1763814554382;
        Sat, 22 Nov 2025 04:29:14 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db89886sm2437043e87.38.2025.11.22.04.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 04:29:13 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH] i2c: i2c-elektor: Allow building on SMP kernels
Date: Sat, 22 Nov 2025 13:26:13 +0100
Message-ID: <20251122122846.28493-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It the past the i2c-elektor driver has been broken on SMP, as it seems
there has since been some fixes/cleanup work to get rid of cli/sti and
rely on spinlocks instead (as pointed out by Wolfram Sang). Tested this
driver on SMP kernel on Alpha/UP2000+ for a few days without any problems.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fd81e49638aa..9b1473d720a0 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1474,7 +1474,7 @@ config I2C_ACORN
 
 config I2C_ELEKTOR
 	tristate "Elektor ISA card"
-	depends on ISA && HAS_IOPORT_MAP && BROKEN_ON_SMP
+	depends on ISA && HAS_IOPORT_MAP
 	select I2C_ALGOPCF
 	help
 	  This supports the PCF8584 ISA bus I2C adapter.  Say Y if you own
-- 
2.51.0


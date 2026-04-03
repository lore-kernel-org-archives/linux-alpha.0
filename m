Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0923C6A3F
	for <linux-alpha@vger.kernel.org>; Fri,  3 Apr 2026 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228606; cv=none; b=rEabNQ3vrECxVYNG8lFkUmjz45kxCIk0Lw/Z+FANCEOggCVe/K6hWkjMs9sATwrTs/fOv8e11htWoPMdzENYkwFcy6CtNdl8oIMLuGef01nGzixwC0uk4P607S8mNiIyXPyW6I8zTVBBiFqbGHiJ9Du9aNA0DgdsC1UQ8oX2lAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228606; c=relaxed/simple;
	bh=T7dL65gALkU5pzwt1bV9J0DaxSsO9gIC8dHnV3nfT5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s9YFopMiHgDf1T/FcNnlhAjhxlAVJHCHBNospQG2+SuccU9/YtDaU/WWcsi+nsYfQK7iwsWImrqZhZCwKdpb1Z32E0iI4aEdvr8BdXbXjx+0cu/4XGX2Ly0ObYr4EXCon0Fz9PQEKhTYlAMjsr1XxRIi5QUSRgGeuV11Di/tg8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBuaXLsh; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBuaXLsh"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64ef161129bso1682357d50.1
        for <linux-alpha@vger.kernel.org>; Fri, 03 Apr 2026 08:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228604; x=1775833404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zOocLo0OmwdfZF9+m0ClHQNnF440ikMYUzsMheK0wso=;
        b=QBuaXLshDEm7Cmn6h46+PQo0XuGsrfq7e/2wlVpWvrmU/f4au4BT+Yi0VDo0a0ilJK
         xVc15NRW+RC1ienRnUxlI4reqD9gun/d1Tb96WmrlTypBKSbdg/8Ac54PTmgWPOV7TyQ
         RhbgChdHqKz/LBpeCpxsiAfyu1TsodDqtbuLwawdKNP+A2hChi9FW3QZX5gPKkLmP0lH
         VRuUelajGBtUiS5FcHF/N4iBbwxpb0K/0+PIyulyqMeXXkT2lkIYsC7dCIEEApQvqrXZ
         8RbuCHHUu2iXcWRSsrg9ew6SdGeqdu0IqlEftuno4S1dUMMNljjQehn+ciCDPV5A48rM
         4v0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228604; x=1775833404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOocLo0OmwdfZF9+m0ClHQNnF440ikMYUzsMheK0wso=;
        b=sCON4qZzQUw/L+MmVKZ2aAuBwp4R+khERa+y7jA2G7ScdeKFcQCag9p5uLMDdtp1SG
         Rf0hG85XzV0jTWlx3ZscIuQiT/bin4za3nrQ0ccNovARQQxzmYGpWMapmO1nHE6AOo8y
         tQ0bkzegKKOKI6795cYv1DD81+UZN4+bWagMYRTwbkQ531mK8LE5oq1kt1oGbeVm+5kE
         LSB8Zy5ZMORybkshnCJiDZvjsDoCZUMMdS6g6YIl+kKWHw4rWCvAe3HrE6l2d4jNKy/6
         Bkb4yJyrvV9Wc6Juf8a3v87kPtl9K/jEpIzECMkWDQ4rdEgSWDiEo0Y6WG8H4Kwf1rUt
         Mq9w==
X-Gm-Message-State: AOJu0YwLe7++DfGkVffCg+DNprJRL92ouoxi93bX46CHkk3NWkOnzyns
	RFHGQJ7S3MkGrefrlI25//Mj6446dztEaYyOhfR3Srtfs4Ivde9YJULuj5gS+Q==
X-Gm-Gg: AeBDietqBVtcaH6yZUfiF6UJOu0kTfpmi5II9zmmpMtr1JbegQIDZUbTB01aSzuPbdm
	ugbK4G+2Ki/bQ4H0QXb0RytPFO3zUvK8gYntkvUAvEVWsSqbDxlad1dIyxWZvlCKjZA6shAchK+
	4YltX2NgvogQ8gsvczpv4MeBzmco3drcbKKWy5taDQbwQt7LUcmZPPtKFYGWFEavTB3gFk2HGJW
	f1yWrLdgVR6RUraqb+pzoAQhRFv2DoyZuLRE+yjapsm4BuOcyushLMZUDMEW7ZeG9dL9tXwPwpq
	h47Py2FgyTQlEWvizcscp2lNZyKV1DItZE55LRDEHGQCR3PUa3LHhZrXnm/Cag4HlHbpeB+PvS2
	BGIL1Bl2h9xPSb6T1xzlDQQO0YLjvMwAUOQTAlMm/L+ksnjQl98et/cFwXovJ35pTlyq0GkLlHy
	fhM+NMmMIpBdYa2Ik1EYc=
X-Received: by 2002:a05:690c:e3cd:b0:794:cef6:64ee with SMTP id 00721157ae682-7a4d5b6371cmr35648847b3.41.1775228603919;
        Fri, 03 Apr 2026 08:03:23 -0700 (PDT)
Received: from localhost ([76.195.202.134])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-7a36ea2c42dsm22718927b3.17.2026.04.03.08.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:03:23 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: Select HAVE_ARCH_COMPILER_H
Date: Fri,  3 Apr 2026 11:03:20 -0400
Message-ID: <20260403150322.489246-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alpha already provides asm/compiler.h (wrapping uapi/asm/compiler.h)
which defines architecture-specific compiler intrinsics like
__kernel_cmpbge, __kernel_cttz, __kernel_ctlz, and __kernel_ctpop.

Selecting HAVE_ARCH_COMPILER_H causes linux/compiler_types.h to include
asm/compiler.h, making these definitions available consistently.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 57c91ed67b71..d870529fa251 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -17,6 +17,7 @@ config ALPHA
 	select PCI_DOMAINS if PCI
 	select PCI_SYSCALL if PCI
 	select HAVE_ARCH_TRACEHOOK
+	select HAVE_ARCH_COMPILER_H
 	select HAVE_ASM_MODVERSIONS
 	select TRACE_IRQFLAGS_SUPPORT
 	select HAVE_PAGE_SIZE_8KB
-- 
2.52.0


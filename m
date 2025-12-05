Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991CF1E5207
	for <linux-alpha@vger.kernel.org>; Fri,  5 Dec 2025 18:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764957997; cv=none; b=sj4Fn7ha+LaPIYOiWrX9djSG1pJh6f79IVincHRFRDvFRAr8N3w2MPGFRLDyz3arbD8R3mnCqJLHRpy5ERm7FVA09Gx67QUt+Bh8oJL0CoYU6wJ/dhEfF/dy4vJz8QBm/jtbF4j3qLQNJpqrweSL/+Bi2/NDk4JGO9Ca25XJnEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764957997; c=relaxed/simple;
	bh=UpW/YoVO9updSKy5RzDiQQX3RzpeXJfu+qsLqjygsVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p2uZ/D10fbWcOKMJyTiOdKmZ7lhFm2sDngGK77+PvMMM6GrttTvaebsJm1wJT5dnegGo5hWZKLVYXjgtML5qqjaXw1r7CbrfsxLtytbiL5aZM2M+BmaKraQRCZnxqRiAt7UuLpoJlrRNvW7Hl0S3QPUe1iW9jwmVSGTwPAMpwmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cw+jCiNG; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cw+jCiNG"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so2908781b3a.0
        for <linux-alpha@vger.kernel.org>; Fri, 05 Dec 2025 10:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764957995; x=1765562795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xM1PN11tJJgSVU1zkmq2gj9Pyh3FbL8kSgvErEzh43c=;
        b=Cw+jCiNGxtYBrnQxDSVwjSvQ6nwnLjlYMKMl6wRNQwXA2/yAH3KZm9E2M3Z8Rc9l6u
         xDTWhPkzSyZI3LhJJmKlLHxFu2yPiOC3rLxoXaGl1NrHtyT9k+b+9gu12Z0mgELxVisJ
         oQv2CN6UKHoCwfQTmid9y+ajUpNp4DHyV6gNBtd7k+H/Tt+mQ9EQE1mOQ7SHAYUtOF0K
         U054kE3z9J0er8oAxMhCnNpuaBp4jb3IQ1JZIit762ZnWp1S9z1f6NhW//1iJ0aHacc5
         xkuzgWMPBE1g49lfuESoDArU2QXtFRmqw16vj1M27UQIDUe0sYHtWNxXfV4Qlrh/LTBP
         dWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764957995; x=1765562795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xM1PN11tJJgSVU1zkmq2gj9Pyh3FbL8kSgvErEzh43c=;
        b=Ml5ugwPDQ1QFilHcpfd04hYYsww66eu4G/yBLzGqjcylyNuwuF4WhNZUjK+FyY8Z80
         JEVm8mRnLtcuRxORQDY+Rr+J7vWsun1KY/l6IYyBVAMktwEVRFr389ewsAbIXAY7A7Xr
         GbEs1ntug2wRTwc3FjGCw9xHn9i+p+UP/34k69yzRBcgNrrC6T70h/fvv5keNeM9OIhc
         I1Is/yNru4zfw9C0EqOGaIWM2+XtkbXhpG3k558gc75staqBddJMtqhkYgfC+xVff6nF
         KZRmnC2pCjBhNuLJY3eVYJbaXdNHpsfxfbqE4lonU1HtRfAZcqds7ZGO2vwUQMzbtMmL
         J6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWBtWj4Co6POo3mPfdXawjWMXenDUI3NGTYo/DzeBusM1WFLDtYoyvsPVSa622RNMUEJraXHyr8XSvpYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybISXg3vB0uoJHhSoOp1n5Cj/iRkEGsGpGrKH2rrwS5YBg1mDS
	dBL/alsooJK6HWov+dDnfIovRyObJKVZSkjza/15nJfPRt8kMgkeAr6j
X-Gm-Gg: ASbGnctGnBxO9JRNIIehMqvFMdZvoWQjELfXrFSD8lulp2G2szcbIDPCsk0ORBXp0eY
	FgK93JWz0wERVJwCT+VcRj0qcHq1nD4NDets/A8zUM4V7YDUa5VJf20P9S5YhlVCOZL3R6mCGHk
	ZsWaIKn/zwi/b4JhzwnseAF7H4Q5RvVMiS6l/gk6dTUQ2Zp5+6RCg4SIJrlbprkE5ImsTJLjq3L
	dNb7wbdEMLekInNaCEc2zKJ+VzTFNmdW2A/BJd4IiQnpEcedDvJk3qHJMpLBF2psGitrczomeP/
	/+VcOPuYeuvRsFnwNmrvcAxGs5RXOQjIICSoZW8u6YHD3RmXKeRFNw82jOIBfA3QOGTUxhCTjgc
	4ef9Re6g9Bx2djuoqj/DTifvQTJyNB0ujM0Y0JWruUQc4XQxNycn2uZauQbFcjxH/LJizS8y+an
	D822F3CMU5IzLztjOVdFEQYFRspzaf8ushGXHFRVWSVg==
X-Google-Smtp-Source: AGHT+IFO4POWyIMHrtWt/yaZ/VOML0pk2EhAc9K5zGtpforZogCJXHsD3WwjzlQpgXO22vRltcJ4bA==
X-Received: by 2002:a05:6a00:4fc1:b0:7e8:43f5:bd0e with SMTP id d2e1a72fcca58-7e8c3de6bf1mr49530b3a.35.1764957994910;
        Fri, 05 Dec 2025 10:06:34 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8839:f626:f539:b6d1:1913:1426])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29f2ed326sm5944166b3a.5.2025.12.05.10.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:06:34 -0800 (PST)
Received: (nullmailer pid 621940 invoked by uid 1000);
	Fri, 05 Dec 2025 18:03:56 -0000
From: Kathara Sasikumar <katharasasikumar007@gmail.com>
To: richard.henderson@linaro.org
Cc: mattst88@gmail.com, linmag7@gmail.com, david.hunter.linux@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, shuah@kernel.org, skhan@linuxfoundation.org, katharasasikumar007@gmail.com
Subject: [PATCH] alpha/boot: replace strcpy() with strscpy() when copying envval
Date: Fri,  5 Dec 2025 18:03:54 +0000
Message-ID: <20251205180354.621925-1-katharasasikumar007@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strcpy() does not check the size of the destination buffer and is
deprecated in the kernel as documented in
Documentation/process/deprecated.rst. ZERO_PGE is PAGE_SIZE bytes, so
using strscpy() with PAGE_SIZE makes the copy safe and avoids any risk
of overflow.

No functional change intended.

Signed-off-by: Kathara Sasikumar <katharasasikumar007@gmail.com>
---
 arch/alpha/boot/bootp.c | 2 +-
 arch/alpha/boot/main.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/boot/bootp.c b/arch/alpha/boot/bootp.c
index 842e85776cc0..e0b411ded992 100644
--- a/arch/alpha/boot/bootp.c
+++ b/arch/alpha/boot/bootp.c
@@ -204,7 +204,7 @@ start_kernel(void)
         load(START_ADDR, START_ADDR+(4*KERNEL_SIZE), KERNEL_SIZE);
 
 	memset((char*)ZERO_PGE, 0, PAGE_SIZE);
-	strcpy((char*)ZERO_PGE, envval);
+	strscpy((char *)ZERO_PGE, envval, PAGE_SIZE);
 #ifdef INITRD_IMAGE_SIZE
 	((long *)(ZERO_PGE+256))[0] = initrd_start;
 	((long *)(ZERO_PGE+256))[1] = INITRD_IMAGE_SIZE;
diff --git a/arch/alpha/boot/main.c b/arch/alpha/boot/main.c
index 22a1cb0264af..7ec728c037d8 100644
--- a/arch/alpha/boot/main.c
+++ b/arch/alpha/boot/main.c
@@ -180,7 +180,7 @@ void start_kernel(void)
 		nbytes = 0;
 	}
 	envval[nbytes] = '\0';
-	strcpy((char*)ZERO_PGE, envval);
+	strscpy((char *)ZERO_PGE, envval, PAGE_SIZE);
 
 	srm_printk(" Ok\nNow booting the kernel\n");
 	runkernel();
-- 
2.51.0


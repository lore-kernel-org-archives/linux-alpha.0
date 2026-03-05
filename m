Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B8726B77D
	for <linux-alpha@vger.kernel.org>; Thu,  5 Mar 2026 16:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772728802; cv=none; b=jLvIJOgnj76t6rpr/1laQ9eg8hi+XaAAZoq4N/ZHkBVglRSExKLy3SPoaEbEL0/sGFVncCQx628hPJLdqlXmbrimyaQ2WtWEiVQxd/kE2hI3T64ktkDDI+nOMVEHED0/4uwWNnc541jAW09SI7iojd8djYJ+aAVguxW8P1XPayQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772728802; c=relaxed/simple;
	bh=etwZ4c/zm504SMVX6n/RnDlMSgHUMPj/DoZ5/OMf+PA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lQI6OVN+kIPGozGlLEeVNPNqJnfrkem9/y28o7bBvzpYaBoQdDqRh6EmjQzpdy1ROeMmy+vp7vJTt6iMpeWO4o4f6SjzXWuryZ85x5FyA7i8MW49hd2ypLDQg82gXq33wOKCloatjKQALM1sYXGslG9W8hKxharmyEeou6MMPgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adNJ/Gcx; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adNJ/Gcx"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-827546f228aso6120502b3a.0
        for <linux-alpha@vger.kernel.org>; Thu, 05 Mar 2026 08:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772728801; x=1773333601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=swCRXdxYMVxCv1pH6y2vhuOZ0LBWAP7/qp6XNEsBc8Y=;
        b=adNJ/GcxPFVKUrvbQpnxaYsTg2iijV1tGqxXK0OCUKz4skVJoA9Mz2ydkuTwYN+yzp
         8RNO32WMw/zhxtRsW42QsP1i1mNcFLr7z79baeIWPsBXZN8lNj8Zh/n6sz7wnqPIe0Px
         dDOf79Sw/npQ4gRpSdGSMlz0EWiMrC4zwXY5wzXtmt2Nk4Osw68Aadko7XpSs2N+fxXt
         jrvA+E91cNxuYnH2rEajeggZ5nkG8UhxV987egz/QMS9lh5HlMcyE7hRN4Ydks62V+0h
         rXayrZZiXBrlAofj4S0vBKXD0hinx4EyQzSX+Tn9LwLJsXBWanLMFI+oIE40fxwY98Tb
         3mYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772728801; x=1773333601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swCRXdxYMVxCv1pH6y2vhuOZ0LBWAP7/qp6XNEsBc8Y=;
        b=kbRcQV+SQcVEZAWAZ87LLFuOH4Q87NEHjPsCQFIZPElgjSiIDrEhxQ7cXMz+fmHmjU
         Gj1IBlmmyAvFE9svF6K5MXNGhooP7fN5ykg7RrhiZUXxxtoUf7eAFKDBNmmZ/CuWOWWK
         Ds830HqEhUjKw4t6K1TPSnoOUy3T5b0AJe/IhPkdeCoBduemFDg9vz+7C4dz0coWs3CH
         7bOVhorcF4DhoU/Yb0UCl+q2EVvWX49trmNq+ffGxL+9oF3wb5rD2iySrCwdWUTeNcki
         YRDJHZ7cfBUih2GTodtTKfdeD7cPl2s5wLwuxp99STsZo9ZPVO5Zg9+x6ikfmPeDNmJs
         Vj7A==
X-Forwarded-Encrypted: i=1; AJvYcCVW8azdqwpb5VukRAYim3Nhpmy2YcKgtwurxQKGd3SoNQSbZ7DqoZ0jxqf2NTwTMlJBqS0o9brFbvMasg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvg87hYYtwixve1WIb3ZnMVlMH+0qB+VA7AD3Up0P7ToG9nt+J
	8khImvDVhWr6GUx1yxBgUMqtgAPbf7gHOFQ4ALYO2EytF3o2OcRGlRJj
X-Gm-Gg: ATEYQzx04HbmZuPdb9LwMc1BaksS/GPyo8OO+/R+GyRHZ8fIK2eIP+aneuXB4dpl/Q4
	XZvVJEfdyT6cLXkBqTF/YNsevomCI/W3jX4TWLurOtkEn6hXoeNb48kw8r1VAlQkr2Y/Cug5v5F
	kH9S8W9wsXAuQcm5UtDqIhW8p3FZexretz8dbb7ao1RhgXrDKh4ZHE/AM0K+MSVgmHkXngDZ2cz
	Kp9r5s8CvtwlhUnjVWovBgrkcXQWg7Y2rV7R6whceaes5sAS96WVuzhpNvvo65YszN8yMqg7/nU
	BYsnghPNsSKdR9a4GkcADAwqG4plNzZ1BHyZ1cLgrHbpXExjGv9zdHOdilyAKiV5nw//MpPhAkl
	pZD465gWFafc7xCfJG9TBcp954Q+0L57OlHUt8HH0U/JCR0aDoBzVzL0QNIhRP0U1+t8HUostTa
	vu8pL3BE2e3208CHHPzIAQgW13b5mObuCFzMFx0oCMZCw8KgYsdTisSL46LLKMQn5W0W9KkRd/O
	FOrnWaQQMC56laNtQ==
X-Received: by 2002:a05:6a21:7a4a:b0:366:2447:6778 with SMTP id adf61e73a8af0-39854aba334mr156714637.53.1772728800502;
        Thu, 05 Mar 2026 08:40:00 -0800 (PST)
Received: from arjav-inspiron153520.bbrouter ([103.46.201.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73818d9502sm3952017a12.21.2026.03.05.08.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 08:39:59 -0800 (PST)
From: Arjav Jain <arjavjain.jain1942@gmail.com>
To: richard.henderson@linaro.org
Cc: mattst88@gmail.com,
	linmag7@gmail.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arjav Jain <arjavjain.jain1942@gmail.com>
Subject: [PATCH] alpha/boot: clean up formatting in bootp.c
Date: Thu,  5 Mar 2026 22:09:53 +0530
Message-ID: <20260305163953.76962-1-arjavjain.jain1942@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apply small formatting improvements to bootp.c:

- group and reorder include headers
- convert multi-line function signatures to single-line
- improve arithmetic operator spacing
- normalize pointer and cast spacing
- fix indentation inconsistencies

No functional changes intended.

Signed-off-by: Arjav Jain <arjavjain.jain1942@gmail.com>
---
 arch/alpha/boot/bootp.c | 46 +++++++++++++++++------------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/arch/alpha/boot/bootp.c b/arch/alpha/boot/bootp.c
index a6209b4fe18c..cdf979a02bcd 100644
--- a/arch/alpha/boot/bootp.c
+++ b/arch/alpha/boot/bootp.c
@@ -9,23 +9,21 @@
  * based significantly on the arch/alpha/boot/main.c of Linus Torvalds
  */
 #include <linux/kernel.h>
+#include <linux/mm.h>
 #include <linux/slab.h>
+#include <linux/stdarg.h>
 #include <linux/string.h>
 #include <generated/utsrelease.h>
-#include <linux/mm.h>
 
 #include <asm/console.h>
 #include <asm/hwrpb.h>
 #include <asm/io.h>
 
-#include <linux/stdarg.h>
-
 #include "ksize.h"
 
 extern unsigned long switch_to_osf_pal(unsigned long nr,
 	struct pcb_struct *pcb_va, struct pcb_struct *pcb_pa,
 	unsigned long *vptb);
-
 extern void move_stack(unsigned long new_stack);
 
 struct hwrpb_struct *hwrpb = INIT_HWRPB;
@@ -37,17 +35,16 @@ static struct pcb_struct pcb_va[1];
  * This is easy using the virtual page table address.
  */
 
-static inline void *
-find_pa(unsigned long *vptb, void *ptr)
+static inline void *find_pa(unsigned long *vptb, void *ptr)
 {
-	unsigned long address = (unsigned long) ptr;
+	unsigned long address = (unsigned long)ptr;
 	unsigned long result;
 
 	result = vptb[address >> 13];
 	result >>= 32;
 	result <<= 13;
-	result |= address & 0x1fff;
-	return (void *) result;
+	result |= (address & 0x1fff);
+	return (void *)result;
 }	
 
 /*
@@ -64,8 +61,7 @@ find_pa(unsigned long *vptb, void *ptr)
 #define VPTB	((unsigned long *) 0x200000000)
 #define L1	((unsigned long *) 0x200802000)
 
-void
-pal_init(void)
+void pal_init(void)
 {
 	unsigned long i, rev;
 	struct percpu_struct *percpu;
@@ -107,17 +103,15 @@ pal_init(void)
 	tbia(); /* do it directly in case we are SMP */
 }
 
-static inline void
-load(unsigned long dst, unsigned long src, unsigned long count)
+static inline void load(unsigned long dst, unsigned long src, unsigned long count)
 {
-	memcpy((void *)dst, (void *)src, count);
+	memcpy((void *)dst, (const void *)src, count);
 }
 
 /*
  * Start the kernel.
  */
-static inline void
-runkernel(void)
+static inline void runkernel(void)
 {
 	__asm__ __volatile__(
 		"bis %0,%0,$27\n\t"
@@ -127,11 +121,9 @@ runkernel(void)
 }
 
 extern char _end;
-#define KERNEL_ORIGIN \
-	((((unsigned long)&_end) + 511) & ~511)
+#define KERNEL_ORIGIN ((((unsigned long)&_end) + 511) & ~511)
 
-void
-start_kernel(void)
+void start_kernel(void)
 {
 	/*
 	 * Note that this crufty stuff with static and envval
@@ -198,16 +190,16 @@ start_kernel(void)
 	 * Sigh...  */
 
 #ifdef INITRD_IMAGE_SIZE
-	load(initrd_start, KERNEL_ORIGIN+KERNEL_SIZE, INITRD_IMAGE_SIZE);
+	load(initrd_start, KERNEL_ORIGIN + KERNEL_SIZE, INITRD_IMAGE_SIZE);
 #endif
-        load(START_ADDR+(4*KERNEL_SIZE), KERNEL_ORIGIN, KERNEL_SIZE);
-        load(START_ADDR, START_ADDR+(4*KERNEL_SIZE), KERNEL_SIZE);
+	load(START_ADDR + (4 * KERNEL_SIZE), KERNEL_ORIGIN, KERNEL_SIZE);
+	load(START_ADDR, START_ADDR + (4 * KERNEL_SIZE), KERNEL_SIZE);
 
-	memset((char*)ZERO_PGE, 0, PAGE_SIZE);
-	strcpy((char*)ZERO_PGE, envval);
+	memset((char *)ZERO_PGE, 0, PAGE_SIZE);
+	strcpy((char *)ZERO_PGE, envval);
 #ifdef INITRD_IMAGE_SIZE
-	((long *)(ZERO_PGE+256))[0] = initrd_start;
-	((long *)(ZERO_PGE+256))[1] = INITRD_IMAGE_SIZE;
+	((long *)(ZERO_PGE + 256))[0] = initrd_start;
+	((long *)(ZERO_PGE + 256))[1] = INITRD_IMAGE_SIZE;
 #endif
 
 	runkernel();
-- 
2.53.0


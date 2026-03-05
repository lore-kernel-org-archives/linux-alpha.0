Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7623BED57
	for <linux-alpha@vger.kernel.org>; Thu,  5 Mar 2026 16:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772727938; cv=none; b=O+PVVaUa1swC+/Z1dAaIEzJSlo1pFLg/lXlqoR928fKFu5n/3oYMGTDwxZ1zMmHwY65KPNe4MhCqvi3Gd/VQj5q084mzp6ItTBb5gLnUd84Bx0xb1TvoIhl29UftOocF/FY6Rh6PvC6rShdAazki40YOS4+GWMeOT+cVd8fJytk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772727938; c=relaxed/simple;
	bh=TeNn2R7UyF+w7y8niYRyWhzvo7dlXiwmzyPZEUJn1Y4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t95VHNXW3ssPfNLSG8CT0trtTFRxvfOpXJVqZTPQo8ZoBEdS5VsdJ8lSv1DArk6yfkpP2TF8hrgUkBZXZXHjcnxjCD5/htWU6DNUpvRltzgSZWFycPY3friHeMAd7wQqxAB969XETlOtvgAxtOeekrz1343w9BMNGR2f9A/S+2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mh5TKMIt; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mh5TKMIt"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-824a829f9bbso3968087b3a.0
        for <linux-alpha@vger.kernel.org>; Thu, 05 Mar 2026 08:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772727937; x=1773332737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ED83NkOXKNsgC5V5u/WdaRC+40/NQE/eVFt6QL5GBUA=;
        b=mh5TKMItmkSkLGwFbisw3UdRHb37cjhxKgbzIJ0QSIiLcMIr/spPdoyXi2YtD6C236
         m4oDaOFjCz+tF5F0FMdkOidkohKWJllvOzO8fK0t3985qWbM20FKj1pdNfJK0Nu2I5Ra
         SWqTTXUlIHXpQh7bPidaKSsrnhp6D9s3SlKI67RMSO2Tj8XHV+QEtV4XWBYrvOlCZV25
         1MWdsS0rWGTGBv5I8aXphQBw9SrkQF4IDzaGHsW/157b2sKnZ5CLr6YfLqX3CIsHmmBz
         MgRvhiniB+NK/ClpsMZADXupTOd35C0u9Lj6RiGVHMsL0yv1n/AyKO+o3SKgI4S9C7fY
         fW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772727937; x=1773332737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ED83NkOXKNsgC5V5u/WdaRC+40/NQE/eVFt6QL5GBUA=;
        b=WSL6r21OAxT/p7IY+OYHk8W7fhHtxCacVNBl/jLHGpdhllVzgs6plA2xxQciq9/3iJ
         4lnP4AzFL7Ahkn9XvNvCq0qPyF1xrWbCaCADFD0+/ciGXbCPezNdAIs46B/+COQ4jP+4
         pKz4s7hziU+KuyTkv3Oh5Ab6ztZzR9tWR/YAugOPXOd8w2c2EOH+mAwz6weYmFV/D9ig
         cLyBbfNVz4IVA7TGrFVrLgwCi6l//t0dnKLeYqK6Xhc3ynYbMGnL1T7zOdmuSYWMXJuy
         iaV2OzuCE3FtM8N1kdruEh/v/TRsOQtemZSGrvukg84f9s+3/hy4VGPQ7JRbaajc9qbD
         SHhg==
X-Forwarded-Encrypted: i=1; AJvYcCUZMEXqig+9SU0dBRewGtAxs5+lrzmFPLyOoNj1nWbaR5C4InYMP1GYau521n1eXEN94jeVV2Rxl7AriQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuRof7Y/yY0wKddbaw8BVqr30UB3aykIt5IUxFSSMwpK8EiJx+
	xAfobhEPEKFMrru9Heys1arhz68M8Cp3QMjk2uyJhjlQbXmFQzl+AauS
X-Gm-Gg: ATEYQzzsDDOYl4vUnrv8GhPMRWId8TQWDsnvSccsIowqSwT8DCcacTusgDfe6cCYZ1q
	tHIfhEdU7Jeuh620bLQlVCUN47SNSDnlyklJG4pstv3OrSS7xom7tRdRpLQxDIL7JiYyAz1G9qy
	3mV6YmlWHt0TvOsWqu8d06MHiva3ciEybT28GHacS02+1QelNjYie7nQgSV4p5m6nCjKV4Qm8l+
	Bprs4I2T6uh6yB7cr3qSxvaEBFrHyTjdQmHnwPISzymIWipe1wr2WYGRFvKXVxDXh0y3mcKWYaI
	Qy+qELDdNy/dRzzDjISkpk9f1Iw5K/uF8CFxg0I4H+IUG9HcXWuYAmyPzwoxNJ8xZHupf6qzsXt
	Jv5lIQR2gGEH5Gl1aSUQ8tP8bXPGAKTJYW0MfinqvqcDXJHu7BspVaYjQ5dhTO0fLS7BXiwOWMh
	xI/Z2aIum78sfUTXGWZexmcMQ/geEATSy17fWMENkkX9ocWfKrP0M+pQ48lXgug3io3v4WVJjWF
	c9mldlx6goVzePWYNOhAq0hoE2e
X-Received: by 2002:a05:6a21:6e95:b0:38b:e944:3e98 with SMTP id adf61e73a8af0-3982dd66799mr5909569637.5.1772727936889;
        Thu, 05 Mar 2026 08:25:36 -0800 (PST)
Received: from arjav-inspiron153520.bbrouter ([103.46.201.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa61fcdesm18151110a12.11.2026.03.05.08.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 08:25:36 -0800 (PST)
From: Arjav Jain <arjavjain.jain1942@gmail.com>
To: richard.henderson@linaro.org
Cc: mattst88@gmail.com,
	linmag7@gmail.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arjav Jain <arjavjain.jain1942@gmail.com>
Subject: [PATCH] alpha/boot: fix pointer declaration spacing in bootp.c and bootpz.c
Date: Thu,  5 Mar 2026 21:55:28 +0530
Message-ID: <20260305162528.75926-1-arjavjain.jain1942@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust pointer declaration spacing to follow the Linux kernel
coding style by placing '*' next to the variable name instead
of the type.

No functional changes intended.

Signed-off-by: Arjav Jain <arjavjain.jain1942@gmail.com>
---
 arch/alpha/boot/bootp.c  | 4 ++--
 arch/alpha/boot/bootpz.c | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/boot/bootp.c b/arch/alpha/boot/bootp.c
index 842e85776cc0..a6209b4fe18c 100644
--- a/arch/alpha/boot/bootp.c
+++ b/arch/alpha/boot/bootp.c
@@ -68,8 +68,8 @@ void
 pal_init(void)
 {
 	unsigned long i, rev;
-	struct percpu_struct * percpu;
-	struct pcb_struct * pcb_pa;
+	struct percpu_struct *percpu;
+	struct pcb_struct *pcb_pa;
 
 	/* Create the dummy PCB.  */
 	pcb_va->ksp = 0;
diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index c6079308eab3..f6cd4c45ed20 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -42,10 +42,10 @@
 #undef DEBUG_LAST_STEPS
 
 extern unsigned long switch_to_osf_pal(unsigned long nr,
-	struct pcb_struct * pcb_va, struct pcb_struct * pcb_pa,
+	struct pcb_struct *pcb_va, struct pcb_struct *pcb_pa,
 	unsigned long *vptb);
 
-extern int decompress_kernel(void* destination, void *source,
+extern int decompress_kernel(void *destination, void *source,
 			     size_t ksize, size_t kzsize);
 
 extern void move_stack(unsigned long new_stack);
@@ -116,8 +116,8 @@ void
 pal_init(void)
 {
 	unsigned long i, rev;
-	struct percpu_struct * percpu;
-	struct pcb_struct * pcb_pa;
+	struct percpu_struct *percpu;
+	struct pcb_struct *pcb_pa;
 
 	/* Create the dummy PCB.  */
 	pcb_va->ksp = 0;
-- 
2.53.0


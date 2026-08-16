Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47778222590
	for <linux-alpha@vger.kernel.org>; Sun, 16 Aug 2026 14:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786891129; cv=none; b=fpuEKhB9eD9mag8eMyzEGwxwrbfVBnE0UT61ow91QuXQ4MtV/2UAk88ccZdqjJP7mZ9KGQIIRChV3dh7YagFxKiNSnu/NbNjyHaOOf0eYNvOooViJE4CEZ64DDOAFcVnPcO3abLGoHrMyjr1lmd3JRKvUuXZgroTd419AzN6a4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786891129; c=relaxed/simple;
	bh=OSGF5aF4lCng+3oyBXwszL6XCTX6OlO5azK2Q+r7+rc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aTexTZI4HdkFz7bOcoCwxGZeNYWpaFTB7RWXkP4j47Av4vfWRBTZZMnWKnX7STT3ZQsFIELFVyzte1uBwhSX+t9qemwwDrPPrXLvgX1yI1UrC2yMGPsMC6QwVneOLdS3DL6q/MhVmhAPy1UhY6ILRetuh7UQFlcpdM0c1m0WjK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzHNBH+A; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzHNBH+A"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso32614105e9.1
        for <linux-alpha@vger.kernel.org>; Sun, 16 Aug 2026 07:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786891126; x=1787495926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=slKPyCDrN2MNA+O23XO0ScfIg+YQ5ZR+PoLwJeEJvyE=;
        b=nzHNBH+Aua6mL48yxg1hBsv34JEJXS7C87HO/GNe3bGlU7SUg8FjwEOBITq6eMRT3J
         Ss+B6kq/1iqIwWlU+KUqBwuawpzoMQC82nS6laf+8LHescmimHIr2mXiZGUVlGCNOjig
         0fHv6oGyvRvfIJHMeyZYGW55t25Az+LectpI+lKGHqhsPATarnXP6Ws/OQrMgiGfmNTP
         0eXNI2lN+R4bAY7DY9RtGEZMQjm/9ydnOmQ1Ybkz6GW/SLv2s6Qz5zNhN0DCKlO7WwEe
         ogbtpU/lVXgKEroARzzSrdg73SjusqbC6QG+wEkNVxtiQ0YZI+uJip3KISSO2VJuXIS2
         NyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786891126; x=1787495926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=slKPyCDrN2MNA+O23XO0ScfIg+YQ5ZR+PoLwJeEJvyE=;
        b=chtyQx9t/aXEKtz17S+C4KBLC2R7gHJW9TevhEP2Szr+DPHZa6SYZmSxiJZv0JYLMS
         PbLo9YZMtklyGuwzJKqTnIO/fDp9Nm+QjWgqihSufvFq7y+2OAbH0+lAruQb5BfJGH3z
         EtvA+BkjxO6BiwsIuKY3bFgYjQNUWYgO9oJaN++qNaXTrV3U6ezRxtwHYrx735sq9T6t
         ofd6Dj/JV48VSBRaols7bdX3Tw1AB0K+Uynmwd6PLfcnOZyNKJaHpRiFPj0ceVMWw76u
         LZBPdf/R/W6PHJUFkg8z9yBRlTtZLby4M4z+MPbg2KEMXZsSl/cXcVBFAtLTABlzTxvn
         ZAvw==
X-Forwarded-Encrypted: i=1; AHgh+Rql6kgt0lid8ukjmnfSQA06qvgFf95x9m7+yOk6gvwicyiILP8gLJEzURSsVRS6a4q2pV1tCsIz3wvsQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgClJgxcfcvOEvFQOXFO8J0XRj3hi6WYKmkThdgmB70cvm8uqL
	sgfkVteBPgiyDqQM1SalhuscsjXutNNZ8nhuulp058nvKdk8UYOrd/y6
X-Gm-Gg: AR+sD10BXhVO/Wh8y2hJkjgg0en37BE8zpdEogtZ6rp7H+vHR7CqPEJBtMGqrqa/z5m
	vyWAdeNVMiJ9yxhGzQ2T/SWNb3BVRF2CZbDSTRwxD1W4+640XIjRllSBlyZoIAKQJsPfl5+CZR0
	Pu3AJmcEtbi1Dg5vYR+PBvyGcfxYei6UM++GcZFBaeIe1Tfganhp2Erla8qZfXAwqpZIvSED43E
	8yAPejUUZVGziPKM6TNaXuwlflDauvJoKcVW6xOU7GodGdbWBxidegCKWTMKiZn+F45dR7pX5Qi
	JGcSbHx9M0JalIbvm3eNeHG0mqU5weBLmpd+UYSuMUmNmN/ODwmX/cmkcltOMUZu0uAj+IJ68A+
	lmCL8SC6hfL9/15I2VwKw/B3/F/E00cLnXYCQDNe041BYY/ugiLkPgtJfBjgq/Gpvj5R0eGhlPA
	CBFmi1kYSjvV2TE1W1bqoK4M+B7ysO7hT9SSit1ZQP0Z646h5CEiaM5WpEsHPaBPIAAvx6iXHAe
	jZyw9WLbMyGGBvDPTKfXk+U8SJE4Ehm4XKhOI7cq1N2fs+EDuJa
X-Received: by 2002:a05:600c:6290:b0:495:4689:1e98 with SMTP id 5b1f17b1804b1-4998e074297mr203471005e9.10.1786891126238;
        Sun, 16 Aug 2026 07:38:46 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999611b043sm72992295e9.12.2026.08.16.07.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 07:38:45 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: richard.henderson@linaro.org,
	linmag7@gmail.com
Cc: qi.zheng@linux.dev,
	akpm@linux-foundation.org,
	viro@zeniv.linux.org.uk,
	geert@linux-m68k.org,
	catalin.marinas@arm.com,
	rppt@kernel.org,
	joao@joaoff.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] alpha: cleanup dead ALPHA_LARGE_VMALLOC
Date: Sun, 16 Aug 2026 15:38:35 +0100
Message-ID: <20260816143835.1068971-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the ALPHA_LARGE_VMALLOC config option can never be enabled,
meaning that all references to it are dead code.

Let's remove this dead option and its associated code.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 arch/alpha/Kconfig               | 15 ---------------
 arch/alpha/include/asm/pgtable.h |  4 ----
 arch/alpha/mm/fault.c            | 24 ------------------------
 arch/alpha/mm/init.c             | 10 ++--------
 4 files changed, 2 insertions(+), 51 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 7b7dafe7d9df..fdffcea749ac 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -413,21 +413,6 @@ config ALPHA_WTINT
 
 	  If unsure, say N.
 
-# LARGE_VMALLOC is racy, if you *really* need it then fix it first
-config ALPHA_LARGE_VMALLOC
-	bool
-	help
-	  Process creation and other aspects of virtual memory management can
-	  be streamlined if we restrict the kernel to one PGD for all vmalloc
-	  allocations.  This equates to about 8GB.
-
-	  Under normal circumstances, this is so far and above what is needed
-	  as to be laughable.  However, there are certain applications (such
-	  as benchmark-grade in-kernel web serving) that can make use of as
-	  much vmalloc space as is available.
-
-	  Say N unless you know you need gobs and gobs of vmalloc space.
-
 config VERBOSE_MCHECK
 	bool "Verbose Machine Checks"
 
diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 8e00cf9dc39d..3d7c1bab4154 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -50,11 +50,7 @@ struct vm_area_struct;
 /* Number of pointers that fit on a page:  this will go away. */
 #define PTRS_PER_PAGE	(1UL << (PAGE_SHIFT-3))
 
-#ifdef CONFIG_ALPHA_LARGE_VMALLOC
-#define VMALLOC_START		0xfffffe0000000000
-#else
 #define VMALLOC_START		(-2*PGDIR_SIZE)
-#endif
 #define VMALLOC_END		(-PGDIR_SIZE)
 
 /*
diff --git a/arch/alpha/mm/fault.c b/arch/alpha/mm/fault.c
index a9816bbc9f34..0bc5fc4d510e 100644
--- a/arch/alpha/mm/fault.c
+++ b/arch/alpha/mm/fault.c
@@ -111,10 +111,6 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 	if (!mm || faulthandler_disabled())
 		goto no_context;
 
-#ifdef CONFIG_ALPHA_LARGE_VMALLOC
-	if (address >= TASK_SIZE)
-		goto vmalloc_fault;
-#endif
 	if (user_mode(regs))
 		flags |= FAULT_FLAG_USER;
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
@@ -225,24 +221,4 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
  do_sigsegv:
 	force_sig_fault(SIGSEGV, si_code, (void __user *) address);
 	return;
-
-#ifdef CONFIG_ALPHA_LARGE_VMALLOC
- vmalloc_fault:
-	if (user_mode(regs))
-		goto do_sigsegv;
-	else {
-		/* Synchronize this task's top level page-table
-		   with the "reference" page table from init.  */
-		long index = pgd_index(address);
-		pgd_t *pgd, *pgd_k;
-
-		pgd = current->active_mm->pgd + index;
-		pgd_k = swapper_pg_dir + index;
-		if (!pgd_present(*pgd) && pgd_present(*pgd_k)) {
-			pgd_val(*pgd) = pgd_val(*pgd_k);
-			return;
-		}
-		goto no_context;
-	}
-#endif
 }
diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index 9531cbc761c0..a2b4d001cbf2 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -45,12 +45,7 @@ pgd_alloc(struct mm_struct *mm)
 	ret = __pgd_alloc(mm, 0);
 	init = pgd_offset(&init_mm, 0UL);
 	if (ret) {
-#ifdef CONFIG_ALPHA_LARGE_VMALLOC
-		memcpy (ret + USER_PTRS_PER_PGD, init + USER_PTRS_PER_PGD,
-			(PTRS_PER_PGD - USER_PTRS_PER_PGD - 1)*sizeof(pgd_t));
-#else
 		pgd_val(ret[PTRS_PER_PGD-2]) = pgd_val(init[PTRS_PER_PGD-2]);
-#endif
 
 		/* The last PGD entry is the VPTB self-map.  */
 		pgd_val(ret[PTRS_PER_PGD-1])
@@ -148,9 +143,8 @@ callback_init(void * kernel_end)
 	   On systems with larger consoles, additional pages will be
 	   allocated as needed during the mapping process.
 
-	   In the case of not SRM, but not CONFIG_ALPHA_LARGE_VMALLOC,
-	   we need to allocate the PGD we use for vmalloc before we start
-	   forking other tasks.  */
+	   In the case of not SRM, we need to allocate the PGD we use for vmalloc
+	   before we start forking other tasks.  */
 
 	two_pages = (void *)
 	  (((unsigned long)kernel_end + ~PAGE_MASK) & PAGE_MASK);
-- 
2.55.0


Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206741FBEB5
	for <linux-alpha@vger.kernel.org>; Wed, 11 Dec 2024 23:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733959700; cv=none; b=e1P0xnR5zm2hDV3mdjpYSk6Fzkajt2ikctR4Dknl7Nlnot20aUJAxFvE/5LQjy4k+N2XZo9RW17nCSVDJRxIVuOQ2/ICPuveJsIi89XrLq2OoyPrIUCsh7sS6zeEH7voETJwmMGbYq8MYPItwZ7TFHy/CRCaxFC2eSsNFFd7m9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733959700; c=relaxed/simple;
	bh=ZUqH/sj5oGsfJqdsLTZvI82joWf3NzCeB51cGD07HYk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u1Pzk0lVnKdnuayDXw5BcRBPzQ2hT/o4Qj0Y1fqj/7U7JINcQht/EKVu0Tnb6n+6APX0DCZhmkcoh0W0aRYW9Z08b4Flh/42LZpqG3wMcfdiUzzMgSceN7UyhpDujQEO5jfsgsTnxtBWLu25hNqaRsZwRUnTz5cSdREALvcP4Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Km7buvLq; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kaleshsingh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Km7buvLq"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-725eaaf8914so36244b3a.1
        for <linux-alpha@vger.kernel.org>; Wed, 11 Dec 2024 15:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959697; x=1734564497; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6OFip67XXDkH1HTauBcRO/RiBVwg85LoldBpce5+fvY=;
        b=Km7buvLqNdikfD9RZfNvSMilBn91PqQQCrPg7k3a8g+hCViZIIYK8seVUwFLEY33Ke
         4ly/7MbKpvELPEtrGVXzmcK3KXdbAtbzJmSGVMg2PTstC53gJnVV0MyHTiNSuLzWx2VH
         9BuPckYI4NZ3eG/iRlmXw6ntiQUAIfgmiaumUEQqBu+lHyxY8hR+uTPHCM2ORVv+n1eq
         da6p4lAsjpsAX7ZXhCP8w3o2jhl7t84ZE75h9TR9z8sHl/rGUlLnz2q6FXzqVSLbtaRh
         DSsiHWjs/hqDz9c3RI39i4xwwGaov6TI4j8vYfTOr9D6ATuYbTe0D1TWCt6BIjB7mLBq
         MsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959697; x=1734564497;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OFip67XXDkH1HTauBcRO/RiBVwg85LoldBpce5+fvY=;
        b=h3xSRS54OisqxaiisTSW2pShWA0gCXTP8NE9spE/W8dm+winX29WuZ5vEZsLCXH3UA
         L+9Gc3NRmbQPafwXroCrmMSoWKllfzU1vwKtP+F25NICLZ8YagxwhleD4XwEHhwdpDuU
         dThp+O8lz8DUfPjcCe4wuh+vRHf2L4kqCcrbeeMKsFj8DdXQdj/6Rk6dW2AZ0rslScZO
         u+YMUb3xqDPIxhqEfcav7uzjRCFZ/tSC9fiW9XI6Sk5FblLM1w1WLttAuReb0JY43wSy
         PS8F7hm42tSdzlGKu+RZwX8va/cALdufB6rvGCp9FFHfbEO/eLY1FL9ZXtV2IokJk+/e
         9X4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvCXmQTgU3R1Q5mv8lHqFrt3/7lPtu8CbcUNPl6QKIr4bEylRq743CfvIBe45XAy532oMIkoQcCusvbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrbQgK/LWwgu00phaIzdWSeamt+bjq+T0SN4tDFqj92ZPJFvv8
	xcR6OiD/qVVLGOtY1NR3sPLApl3Xvno0HwJb6UJzCTjLVoEMddn+k3tAasR7+ZJJo5wk6rYKnzT
	bpMRWMUzEksKrG0upSyVqmg==
X-Google-Smtp-Source: AGHT+IHidwQ3DrDPNLywyhRXMiEnGjaKCiBaEc5hXwYPZZjpJE9GCWopm3osDWhhLjTFzQGtE2yr4rptNlkPUN/bOw==
X-Received: from pfbch7.prod.google.com ([2002:a05:6a00:2887:b0:725:e05b:5150])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:99f:b0:725:e015:909d with SMTP id d2e1a72fcca58-728faadfd6cmr1845767b3a.21.1733959697352;
 Wed, 11 Dec 2024 15:28:17 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:48 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-11-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 10/16] mm: s390: Use generic_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"

Introduce s390 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/s390/include/asm/pgtable.h |  1 +
 arch/s390/mm/mmap.c             | 51 +++++++++++++++------------------
 2 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 48268095b0a3..eaecb558ab9b 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1997,6 +1997,7 @@ extern void s390_reset_cmma(struct mm_struct *mm);
 /* s390 has a private copy of get unmapped area to deal with cache synonyms */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #define pmd_pgtable(pmd) \
 	((pgtable_t)__va(pmd_val(pmd) & -sizeof(pte_t)*PTRS_PER_PTE))
diff --git a/arch/s390/mm/mmap.c b/arch/s390/mm/mmap.c
index 33f3504be90b..8afb046605c9 100644
--- a/arch/s390/mm/mmap.c
+++ b/arch/s390/mm/mmap.c
@@ -83,28 +83,33 @@ static int get_align_mask(struct file *filp, unsigned long flags)
 	return 0;
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	/* requested length too big for entire address space */
+	if (len > TASK_SIZE - mmap_min_addr)
+		return -ENOMEM;
+
+	if (flags & MAP_FIXED)
+		return addr;
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 				     unsigned long len, unsigned long pgoff,
 				     unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 
-	if (len > TASK_SIZE - mmap_min_addr)
-		return -ENOMEM;
-
-	if (flags & MAP_FIXED)
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (IS_ERR_VALUE(addr))
+		return addr;
+	if (addr)
 		goto check_asce_limit;
 
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr && addr >= mmap_min_addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			goto check_asce_limit;
-	}
-
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = TASK_SIZE;
@@ -123,25 +128,15 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long ad
 					     unsigned long len, unsigned long pgoff,
 					     unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
 	struct vm_unmapped_area_info info = {};
 
-	/* requested length too big for entire address space */
-	if (len > TASK_SIZE - mmap_min_addr)
-		return -ENOMEM;
-
-	if (flags & MAP_FIXED)
-		goto check_asce_limit;
-
 	/* requesting a specific address */
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr && addr >= mmap_min_addr &&
-				(!vma || addr + len <= vm_start_gap(vma)))
-			goto check_asce_limit;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (IS_ERR_VALUE(addr))
+		return addr;
+	if (addr)
+		goto check_asce_limit;
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog


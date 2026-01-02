Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5301D75809
	for <linux-alpha@vger.kernel.org>; Fri,  2 Jan 2026 17:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767375431; cv=none; b=gYjuMy3zLqyzmLKjaN2k6q6rNZvePp9Crla8eewNRr61+JyCKfWNsOMSJBiIp2cTp1ll45WQS7QkvDrO4sbLLdSWlgxetOG3kEJXDvW19aL8uOspEdiQys/8Kg1rf/Jsvj4gsRhZt1XZPdlnCfhZJ0u7LgngUwyhjZXYLDQ4MGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767375431; c=relaxed/simple;
	bh=r48sIXgKa/YSTfzJ0imB1JR2XQg5ceFaWstwk1okBas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JJgp5l0m/qiVHTcMSXMmhcYAY38TJTXpMIH8B9dwOlWCoM6aRht1qrOOrxbte1GRgHJVu75eYMWDYUKB1cSY153Lo5CndratCDZKN+qBUDNYuN1K8ph07+bXfk1NRUzn4j+tUr+zBakzDQzVsK8tl2cc/MukET1TUM5AlwgRXF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5WMMHq4; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5WMMHq4"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-595825c8eb3so12416538e87.0
        for <linux-alpha@vger.kernel.org>; Fri, 02 Jan 2026 09:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767375425; x=1767980225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odMMr3OOp6px/v6cNPdWdhob7w+ZOi6ELLzwhAhJaAo=;
        b=F5WMMHq4CXo88r745LIKJJ4fH8Vny3M7s3nEv0E0qBe8dq5QAMH1zah5sShfkwNBnm
         u8GSc1bsG6nAVd9dZrVX7AuJYp/NYy6/xqf1UxGDctafGIHfsN/p6nH7MWlD2kxfhSrF
         Q3cY4+sddWja0w6i2YFKP6WhxdWV8vCl5WQGd4GSItzjPGC7hM7ywjyerXFdDiQ+TQrg
         TH1dEOFN6ADDQbqba0L7bodMSTxFgVGvMDX090+x/visnWr5Ffyph5IKkyt00aw86LS/
         4+rI9W58kiYJtbHW/ON1cuD5ivRvvpzrOD/t57IaRC3uD+KxLmVQuCdSHNIS76dta86n
         FuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767375425; x=1767980225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=odMMr3OOp6px/v6cNPdWdhob7w+ZOi6ELLzwhAhJaAo=;
        b=gBUHaqX3J/HdeuswVzp1JTz2nheyLfgp3dwn5ALmZADsyFbWZekankVv+d4rtCG1Fx
         CNwBTi7BTinuPF/ue65oDcDarZ5GuFk8uiN7E1nxFhKCQ7nKntneTcsEE2+0QuOwQBHE
         IfVCPOctJnq7gxL/sW7+cQX8MZJ4T2MsMM0/JVIM3zhAAsJAFDWCaj7VkkysL9l8L7cg
         o/oVFXOPYV4491Ku5tHTrJz9qvBc1JeWcLu0p21J4yaBdBk1ESz9MF6KRcVjcNdhLjXG
         U5nqGpNqqnbdyH1WKQd4qxd/QEBpJiKTPVz+joeMlfiTXcGbeZl47do3VLAX7EMqTBeN
         1Wcg==
X-Forwarded-Encrypted: i=1; AJvYcCVeogiphvPxWCGm+iD2iWeE+X7KEWGuINbn20/MNuy8rpvczZdqkh8YJDteLxOPpQlQ/1I2t/T4g8cJqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDEoMp6Qu+SNG6W4z1XEiVf09uQMzGQhrtS7X+7px8yUh8GlLj
	2Kly6IGQohWOl510E+XDkvNaIHQEqJHuBAmZzwfKHh9PjbcilVt9lsDKFKt8Mg==
X-Gm-Gg: AY/fxX4X5ALa6+Lt/XVCKY5FYUJcrmm94dzb/TxY77TSIaytLLiekOHU0WrlvN6IauP
	8YMZcBgEsO55stUuYG044FWv9Q/c0cOIv2JI7pGygkDhWzdfX423WW2Dr+vpru1ol/9pTDIf4TJ
	VagvYgpHDzzWYfvWiZczVvfElftz9ABOaQsqir4tVaRD35cu2HYGxcy1EpPP9swmO4pBRaauHY/
	rxbq2aARDsPZqDRU3a4iEXAXLdW+dF2VhYTtFH7kMx0fT1YfKtZpficfAQEQQuhJVYYEZ5H4mf1
	1JRPopjsJLSUyUnlFZjYdcuFJZwZU/2kMJyoDMfTmVmG1t0HIvuKi1TrsqCYj3lRmAnNeBFEO/H
	jR9u/Ie+Y/5m3MXBc54zgYIZiNZ2Bha7ivabMezhYNjFq9PJCjLyQRhV9TV0qgSdXTNktoifQOz
	46MDUjhQlj9iYP+PKOx39U9FSIBk6oSd5nxFfR5jyiSkK4wh4oK4lSRJwq1bKdFao=
X-Google-Smtp-Source: AGHT+IEMuhKvakSkYTnjV88BFBw/N+/PH7x0WYxsbgntZuxfqJwFTs9+XVcLQ/1kPd/JVLrxUlSNkA==
X-Received: by 2002:a05:6512:ad3:b0:596:9bfa:91a4 with SMTP id 2adb3069b0e04-59a17d05979mr11953126e87.2.1767375424955;
        Fri, 02 Jan 2026 09:37:04 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186203eesm12379442e87.77.2026.01.02.09.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 09:37:04 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	hch@infradead.org,
	macro@orcam.me.uk,
	glaubitz@physik.fu-berlin.de,
	mattst88@gmail.com,
	richard.henderson@linaro.org,
	ink@unseen.parts
Cc: Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 1/1] alpha: fix user-space corruption during memory compaction
Date: Fri,  2 Jan 2026 18:30:43 +0100
Message-ID: <20260102173603.18247-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102173603.18247-1-linmag7@gmail.com>
References: <20260102173603.18247-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alpha systems can suffer sporadic user-space crashes and heap
corruption when memory compaction is enabled.

Symptoms include SIGSEGV, glibc allocator failures (e.g. "unaligned
tcache chunk"), and compiler internal errors. The failures disappear
when compaction is disabled or when using global TLB invalidation.

The root cause is insufficient TLB shootdown during page migration.
Alpha relies on ASN-based MM context rollover for instruction cache
coherency, but this alone is not sufficient to prevent stale data or
instruction translations from surviving migration.

Fix this by introducing a migration-specific helper that combines:
  - MM context invalidation (ASN rollover),
  - immediate per-CPU TLB invalidation (TBI),
  - synchronous cross-CPU shootdown when required.

The helper is used only by migration/compaction paths to avoid changing
global TLB semantics.

Additionally, update flush_tlb_other(), pte_clear(), to use
READ_ONCE()/WRITE_ONCE() for correct SMP memory ordering.

This fixes observed crashes on both UP and SMP Alpha systems.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/pgtable.h  |  33 ++++++++-
 arch/alpha/include/asm/tlbflush.h |   4 +-
 arch/alpha/mm/Makefile            |   2 +-
 arch/alpha/mm/tlbflush.c          | 112 ++++++++++++++++++++++++++++++
 4 files changed, 148 insertions(+), 3 deletions(-)
 create mode 100644 arch/alpha/mm/tlbflush.c

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 90e7a9539102..c9508ec37efc 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -17,6 +17,7 @@
 #include <asm/processor.h>	/* For TASK_SIZE */
 #include <asm/machvec.h>
 #include <asm/setup.h>
+#include <linux/page_table_check.h>
 
 struct mm_struct;
 struct vm_area_struct;
@@ -183,6 +184,9 @@ extern inline void pud_set(pud_t * pudp, pmd_t * pmdp)
 { pud_val(*pudp) = _PAGE_TABLE | ((((unsigned long) pmdp) - PAGE_OFFSET) << (32-PAGE_SHIFT)); }
 
 
+extern void migrate_flush_tlb_page(struct vm_area_struct *vma,
+					unsigned long addr);
+
 extern inline unsigned long
 pmd_page_vaddr(pmd_t pmd)
 {
@@ -202,7 +206,7 @@ extern inline int pte_none(pte_t pte)		{ return !pte_val(pte); }
 extern inline int pte_present(pte_t pte)	{ return pte_val(pte) & _PAGE_VALID; }
 extern inline void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
-	pte_val(*ptep) = 0;
+	WRITE_ONCE(pte_val(*ptep), 0);
 }
 
 extern inline int pmd_none(pmd_t pmd)		{ return !pmd_val(pmd); }
@@ -264,6 +268,33 @@ extern inline pte_t * pte_offset_kernel(pmd_t * dir, unsigned long address)
 
 extern pgd_t swapper_pg_dir[1024];
 
+#ifdef CONFIG_COMPACTION
+#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
+
+static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
+					unsigned long address,
+					pte_t *ptep)
+{
+	pte_t pte = READ_ONCE(*ptep);
+
+	pte_clear(mm, address, ptep);
+	return pte;
+}
+
+#define __HAVE_ARCH_PTEP_CLEAR_FLUSH
+
+static inline pte_t ptep_clear_flush(struct vm_area_struct *vma,
+				unsigned long addr, pte_t *ptep)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	pte_t pte = ptep_get_and_clear(mm, addr, ptep);
+
+	page_table_check_pte_clear(mm, pte);
+	migrate_flush_tlb_page(vma, addr);
+	return pte;
+}
+
+#endif
 /*
  * The Alpha doesn't have any external MMU info:  the kernel page
  * tables contain all the necessary information.
diff --git a/arch/alpha/include/asm/tlbflush.h b/arch/alpha/include/asm/tlbflush.h
index ba4b359d6c39..0c8529997f54 100644
--- a/arch/alpha/include/asm/tlbflush.h
+++ b/arch/alpha/include/asm/tlbflush.h
@@ -58,7 +58,9 @@ flush_tlb_other(struct mm_struct *mm)
 	unsigned long *mmc = &mm->context[smp_processor_id()];
 	/* Check it's not zero first to avoid cacheline ping pong
 	   when possible.  */
-	if (*mmc) *mmc = 0;
+
+	if (READ_ONCE(*mmc))
+		WRITE_ONCE(*mmc, 0);
 }
 
 #ifndef CONFIG_SMP
diff --git a/arch/alpha/mm/Makefile b/arch/alpha/mm/Makefile
index 101dbd06b4ce..2d05664058f6 100644
--- a/arch/alpha/mm/Makefile
+++ b/arch/alpha/mm/Makefile
@@ -3,4 +3,4 @@
 # Makefile for the linux alpha-specific parts of the memory manager.
 #
 
-obj-y	:= init.o fault.o
+obj-y	:= init.o fault.o tlbflush.o
diff --git a/arch/alpha/mm/tlbflush.c b/arch/alpha/mm/tlbflush.c
new file mode 100644
index 000000000000..ccbc317b9a34
--- /dev/null
+++ b/arch/alpha/mm/tlbflush.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Alpha TLB shootdown helpers
+ *
+ * Copyright (C) 2025 Magnus Lindholm <linmag7@gmail.com>
+ *
+ * Alpha-specific TLB flush helpers that cannot be expressed purely
+ * as inline functions.
+ *
+ * These helpers provide combined MM context handling (ASN rollover)
+ * and immediate TLB invalidation for page migration and memory
+ * compaction paths, where lazy shootdowns are insufficient.
+ */
+
+#include <linux/mm.h>
+#include <linux/smp.h>
+#include <linux/sched.h>
+#include <asm/tlbflush.h>
+#include <asm/pal.h>
+#include <asm/mmu_context.h>
+
+#define asn_locked() (cpu_data[smp_processor_id()].asn_lock)
+
+/*
+ * Migration/compaction helper: combine mm context (ASN) handling with an
+ * immediate per-page TLB invalidate and (for exec) an instruction barrier.
+ *
+ * This mirrors the SMP combined IPI handler semantics, but runs locally on UP.
+ */
+#ifndef CONFIG_SMP
+void migrate_flush_tlb_page(struct vm_area_struct *vma,
+					   unsigned long addr)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	int tbi_type = (vma->vm_flags & VM_EXEC) ? 3 : 2;
+
+	/*
+	 * First do the mm-context side:
+	 * If we're currently running this mm, reload a fresh context ASN.
+	 * Otherwise, mark context invalid.
+	 *
+	 * On UP, this is mostly about matching the SMP semantics and ensuring
+	 * exec/i-cache tagging assumptions hold when compaction migrates pages.
+	 */
+	if (mm == current->active_mm)
+		flush_tlb_current(mm);
+	else
+		flush_tlb_other(mm);
+
+	/*
+	 * Then do the immediate translation kill for this VA.
+	 * For exec mappings, order instruction fetch after invalidation.
+	 */
+	tbi(tbi_type, addr);
+}
+
+#else
+struct tlb_mm_and_addr {
+	struct mm_struct *mm;
+	unsigned long addr;
+	int tbi_type;	/* 2 = DTB, 3 = ITB+DTB */
+};
+
+static void ipi_flush_mm_and_page(void *x)
+{
+	struct tlb_mm_and_addr *d = x;
+
+	/* Part 1: mm context side (Alpha uses ASN/context as a key mechanism). */
+	if (d->mm == current->active_mm && !asn_locked())
+		__load_new_mm_context(d->mm);
+	else
+		flush_tlb_other(d->mm);
+
+	/* Part 2: immediate per-VA invalidation on this CPU. */
+	tbi(d->tbi_type, d->addr);
+}
+
+void migrate_flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	struct tlb_mm_and_addr d = {
+		.mm = mm,
+		.addr = addr,
+		.tbi_type = (vma->vm_flags & VM_EXEC) ? 3 : 2,
+	};
+
+	/*
+	 * One synchronous rendezvous: every CPU runs ipi_flush_mm_and_page().
+	 * This is the "combined" version of flush_tlb_mm + per-page invalidate.
+	 */
+	preempt_disable();
+	on_each_cpu(ipi_flush_mm_and_page, &d, 1);
+
+	/*
+	 * mimic flush_tlb_mm()'s mm_users<=1 optimization.
+	 */
+	if (atomic_read(&mm->mm_users) <= 1) {
+
+		int cpu, this_cpu;
+		this_cpu = smp_processor_id();
+
+		for (cpu = 0; cpu < NR_CPUS; cpu++) {
+			if (!cpu_online(cpu) || cpu == this_cpu)
+				continue;
+			if (READ_ONCE(mm->context[cpu]))
+				WRITE_ONCE(mm->context[cpu], 0);
+		}
+	}
+	preempt_enable();
+}
+
+#endif
-- 
2.51.0


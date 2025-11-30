Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D760F36D515;
	Sun, 30 Nov 2025 03:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764471704; cv=none; b=IP1CxA3feNkgS2NJsZVa18wxXlqCdm2bAmxBVoRraG4ZEzzjf5maQNyH6qNt74bI+tR5NLtC+mTjAvKN9YPDXxL4awLE4amb/6JMl311C7IYKON9Sq+mPy+1uCXJySU1l7yiAC+RvfX7fEx2yULCS6uxGB0hLhGMtw6xkpqU8KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764471704; c=relaxed/simple;
	bh=JEsOzALJdOEUU6cQtF5ZNMFchhRAIuvKCxQUoZFHbKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YW7T69v5BJq0WAYPrJlFOT4z0kwAM9IRAZNjAMYE0+fRcwoUQ2N4TnyF847UOJOo6xaO3r+mtJ8PLQZzjiyizYdzz5rkdAnh5UhNCuORdIrq0I6tSwzvmC0RoYhkTFbLLuraHdliwMm9QgmGBEyZQcdeWVhcOHjQ24BNWQkl9K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=HKqaHAdw; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="HKqaHAdw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0TtaLooEQ/SHSgMC/pUOWGMxpepCm5694nPuPzDHEdg=; b=HKqaHAdwMjnBw9TsbmQh894nUI
	OipQpKHC+/RWe8GpcnFEksC1ndo7hx5Kwu0zRniDNEr5mxnUkJmtHsVY6Z1OAMJ+cMimytbD2yFRk
	dE5ZBdlVW0FKteHYMIdcUe4xgtM0UJ6WXqwYbgHVh8y4iqTsbDrcO8H4Om7XirN+4wiS1VKJK/QlM
	rH6BfZb03uT0IQz7pQdM8RZUPTy4SRDRX88s2L3IpOWJTCKwD1YD7SuRZk9PIo2kEkM7i6Mqi5U/E
	miuzXyWieNj1K2TB0ekO+fAaIxN8Bs1nJ1g4MCj2T0FzDJrVNM5M7G788VbL6RVBL9ceTeQoDftcQ
	sh81GIiA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vPXh4-0000000CPzD-2Cjx;
	Sun, 30 Nov 2025 03:01:46 +0000
Date: Sun, 30 Nov 2025 03:01:46 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-alpha@vger.kernel.org
Subject: [RFC][alpha] saner vmalloc handling (was Re: [Bug report]
 hash_name() may cross page boundary and trigger sleep in RCU context)
Message-ID: <20251130030146.GN3538@ZenIV>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <20251126185545.GC3538@ZenIV>
 <c375dd22-8b46-404b-b0c2-815dbd4c5ec8@huaweicloud.com>
 <20251129033728.GH3538@ZenIV>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129033728.GH3538@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sat, Nov 29, 2025 at 03:37:28AM +0000, Al Viro wrote:

> AFAICS, 32bit arm is similar to 32bit x86 in that respect; propagation
> is lazier, though - there arch_sync_kernel_mappings() bumps a counter
> in init_mm and context switches use that to check if propagation needs
> to be done.  No idea how well does that work on vfree() side of things -
> hadn't looked into that rabbit hole...

BTW, speaking of vmalloc space - does anybody object against sorting
CONFIG_ALPHA_LARGE_VMALLOC out, so that we wouldn't need to mess
with that in alpha page fault handler?

Basically, do what amd64 does - something along the lines of (untested)
patch below.  Comments?

[PATCH] alpha: take the LARGE_VMALLOC kludge out

Support of vmalloc space that won't fit into the single L1 slot had
been a headache for quite a while.

The only things we use seg1 for are virtual mapping of page tables
(at the last 8G) and vmalloc space (below that).  Normal setup has
vmalloc space from -16G to -8G, occupying the penultimate L1 slot.
It is set up (with table sitting just after the kernel image) very
early, by callback_init().  pgd_alloc() copies that entry when
setting a new L1 table up, and it's never changed afterwards.
All page table changes done by vmalloc() are done to tables that
are shared between all threads, avoiding the need to synchronize
them.

It would be trivial to extend that - preallocate L2 tables to
cover the entire vmalloc space (8Kb for each 8Gb of that) and
set all the L1 slots involved before anything gets forked,
then copy these slots on pgd_alloc().  Unfortunately, that
had been done in a different way - only one L2 table is
preallocated, the rest gets created on demand, which means
that we need to propagate changes to threads' L1 tables.
It's kinda-sorta handled in do_page_fault(), but it's racy and
fixing that up would be a major headache.

Bugger that for the game of soldiers - do what e.g. amd64 does
and preallocate these in mem_init().  And replace the bool
ALPHA_LARGE_VMALLOC with int ALPHA_VMALLOC_SIZE (in gigabytes),
dependent upon EXPERT and defaulting to 8.

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 80367f2cf821..36cbba4e21d9 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -410,20 +410,21 @@ config ALPHA_WTINT
 
 	  If unsure, say N.
 
-# LARGE_VMALLOC is racy, if you *really* need it then fix it first
-config ALPHA_LARGE_VMALLOC
-	bool
+config ALPHA_VMALLOC_SIZE
+	int "vmalloc space (in gigabytes)" if EXPERT
+	default "8"
+	range 8 2040
 	help
-	  Process creation and other aspects of virtual memory management can
-	  be streamlined if we restrict the kernel to one PGD for all vmalloc
-	  allocations.  This equates to about 8GB.
+	  We preallocate the second-level page tables to cover the entire
+	  vmalloc area; one 8Kb page for each 8Gb.
 
-	  Under normal circumstances, this is so far and above what is needed
-	  as to be laughable.  However, there are certain applications (such
-	  as benchmark-grade in-kernel web serving) that can make use of as
-	  much vmalloc space as is available.
+	  Default is 8Gb total and under normal circumstances, this is so
+	  far and above what is needed as to be laughable.  However, there are
+	  certain applications (such as benchmark-grade in-kernel web serving)
+	  that can make use of as much vmalloc space as is available.
 
-	  Say N unless you know you need gobs and gobs of vmalloc space.
+	  Leave it at 8 unless you know you need gobs and gobs of
+	  vmalloc space.
 
 config VERBOSE_MCHECK
 	bool "Verbose Machine Checks"
diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 90e7a9539102..0f554d01fe54 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -49,11 +49,8 @@ struct vm_area_struct;
 /* Number of pointers that fit on a page:  this will go away. */
 #define PTRS_PER_PAGE	(1UL << (PAGE_SHIFT-3))
 
-#ifdef CONFIG_ALPHA_LARGE_VMALLOC
-#define VMALLOC_START		0xfffffe0000000000
-#else
-#define VMALLOC_START		(-2*PGDIR_SIZE)
-#endif
+#define VMALLOC_SLOTS		DIV_ROUND_UP(CONFIG_ALPHA_VMALLOC_SIZE, 8)
+#define VMALLOC_START		(-(VMALLOC_SLOTS + 1)*PGDIR_SIZE)
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
index 4c5ab9cd8a0a..e5eea8b05c7f 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -45,13 +45,10 @@ pgd_alloc(struct mm_struct *mm)
 	ret = __pgd_alloc(mm, 0);
 	init = pgd_offset(&init_mm, 0UL);
 	if (ret) {
-#ifdef CONFIG_ALPHA_LARGE_VMALLOC
-		memcpy (ret + USER_PTRS_PER_PGD, init + USER_PTRS_PER_PGD,
-			(PTRS_PER_PGD - USER_PTRS_PER_PGD - 1)*sizeof(pgd_t));
-#else
-		pgd_val(ret[PTRS_PER_PGD-2]) = pgd_val(init[PTRS_PER_PGD-2]);
-#endif
-
+		for (int i = 0; i < VMALLOC_SLOTS; i++) {
+			pgd_val(ret[PTRS_PER_PGD - VMALLOC_SLOTS - 1 + i]) =
+			pgd_val(init[PTRS_PER_PGD - VMALLOC_SLOTS - 1 + i]);
+		}
 		/* The last PGD entry is the VPTB self-map.  */
 		pgd_val(ret[PTRS_PER_PGD-1])
 		  = pte_val(mk_pte(virt_to_page(ret), PAGE_KERNEL));
@@ -148,9 +145,10 @@ callback_init(void * kernel_end)
 	   On systems with larger consoles, additional pages will be
 	   allocated as needed during the mapping process.
 
-	   In the case of not SRM, but not CONFIG_ALPHA_LARGE_VMALLOC,
-	   we need to allocate the PGD we use for vmalloc before we start
-	   forking other tasks.  */
+	   In any case we need to allocate a PGD we use for vmalloc
+	   before we start forking other tasks.  If vmalloc wants more
+	   than one PGD slot, allocate the rest later (at mem_init() -
+	   it's still early enough).  */
 
 	two_pages = (void *)
 	  (((unsigned long)kernel_end + ~PAGE_MASK) & PAGE_MASK);
@@ -246,6 +244,22 @@ srm_paging_stop (void)
 }
 #endif
 
+void __init mem_init(void)
+{
+	// first slot already filled by callback_init()
+	unsigned long addr = VMALLOC_START + PGDIR_SIZE;
+
+	while (addr < VMALLOC_END) {
+		pgd_t *pgd = pgd_offset_k(addr);
+		p4d_t *p4d = p4d_offset(pgd, addr);
+		pud_t *pud = pud_offset(p4d, addr);
+		pmd_t *pmd = pmd_alloc(&init_mm, pud, addr);
+		if (!pmd)
+			panic("can't preallocate tables for vmalloc");
+		addr += PGDIR_SIZE;
+	}
+}
+
 static const pgprot_t protection_map[16] = {
 	[VM_NONE]					= _PAGE_P(_PAGE_FOE | _PAGE_FOW |
 								  _PAGE_FOR),

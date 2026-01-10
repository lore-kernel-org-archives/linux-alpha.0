Received: from matoro.tk (matoro.tk [104.188.251.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858F44A32;
	Sun, 11 Jan 2026 00:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.188.251.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768089997; cv=none; b=ppZECM7Ejf4r4OSs4AStW3818gcmpJ5dVxp2EkhkWg5DdsfdnaEcFFDKLn+o1mlKyp7DTI9iFm3zWr68PVGEcwR/WvU3wC2MNaBuC7MjUhu97mbyF+sSSOoDdX8hIx204Xr5pDJP8vR5jNhVXK4iDAilePMzEXaii9vEMNi3GiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768089997; c=relaxed/simple;
	bh=Ick2ncAtujaIMNRz7Kw3PwXsWqqUSA/Yg9DXQQGAIQo=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=uAAahvezZ8c84pJ0Iye5KuQZluG1YpqJhm/K8JpC72GzVcWZwELA7wD6R0zW3RyEtd6tIeHf+RX8Moj8u6wKZ+b9BenlMMLmmBuj/WZ1TgkZxbBHYn5UmerJJMyAah5iXWbGCGl4db9ObQms/JZVvWcUW/4ZFuhrH9cIg8DEnkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matoro.tk; spf=pass smtp.mailfrom=matoro.tk; dkim=pass (4096-bit key) header.d=matoro.tk header.i=@matoro.tk header.b=ea3mi0UD; arc=none smtp.client-ip=104.188.251.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matoro.tk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matoro.tk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=matoro.tk header.i=@matoro.tk header.b="ea3mi0UD"
DKIM-Signature: a=rsa-sha256; bh=DewHl7M8K9DNmyLWEveKnM3mziISu5bhTWcGnCFUFBw=;
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20251215; t=1768089055; v=1; x=1768521055;
 b=ea3mi0UDrmh0nTOD9CIJYiRzx2cEBkAsx00d8XivhYcLHm5a2oj4Lj1yqYNEq7SIu24WjLKN
 2EwZAipORD++WpdPp4/CqE0THQYmfYvMdcmYY56+MiDNRQbDWEn13CY4Pq/THX7wp0QEDBmFby/
 oSBYKqd2qPjBcNACZXTCdx+Wp+CRpR9vTnY1uzKpeFJnXSjnQDQ6fba56QRFs5TqgCTOQpIeqnm
 /AAFHNkX2WtF3KFG1v0epC+RIPNgvfv/1Z1fvcZPDOVuczTSHJlyqqZSG0iVImTnyJTCfNl3gi+
 8cAb/GSi5XZvF3H15vQUSwaIRRqQ1jadA7PVI60jTPfzkqJ9MN+bRiPskF9d3kG08hRjcZegIjm
 yqLU+3A6FfEV0B8wKOab/T3HWGnIIR4Ydz2hzmeAH9H8a8UPswv6rsDgQry8/bmi9AdrpSGn/2z
 NfpdTgA+v10E9O6F9LYBofkmf0BbyMIAietBLJVY9lAw0wu9IsgfYM0EUq+k6rO33Ftva7pfKdl
 f1zhlmcH/odzcznaFv8XGdwhuXZ5PfufvmbMWYYXHFfKKdLSLOYkusyU6BEQokjUR4U4W7JsQa4
 eYaEup+qLFLEzDMpOJ9H1s/5w06GRG67h1HLyQmJJcpp2Xgi3mWTRjGsWB0jtSrFrlZ/5BknQLV
 DRmY3UzF9/I=
Received: by matoro.tk (envelope-sender
 <matoro_mailinglist_kernel@matoro.tk>) with ESMTPS id 261d46dc; Sat, 10 Jan
 2026 18:50:55 -0500
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 10 Jan 2026 18:50:55 -0500
From: matoro <matoro_mailinglist_kernel@matoro.tk>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 hch@infradead.org, macro@orcam.me.uk, glaubitz@physik.fu-berlin.de,
 mattst88@gmail.com, richard.henderson@linaro.org, ink@unseen.parts
Subject: Re: [PATCH 1/1] alpha: fix user-space corruption during memory
 compaction
In-Reply-To: <20260102173603.18247-2-linmag7@gmail.com>
References: <20260102173603.18247-1-linmag7@gmail.com>
 <20260102173603.18247-2-linmag7@gmail.com>
Message-ID: <f44dfc2337c4c63208c2ca570046ad21@matoro.tk>
X-Sender: matoro_mailinglist_kernel@matoro.tk
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-01-02 12:30, Magnus Lindholm wrote:
> Alpha systems can suffer sporadic user-space crashes and heap
> corruption when memory compaction is enabled.
> 
> Symptoms include SIGSEGV, glibc allocator failures (e.g. "unaligned
> tcache chunk"), and compiler internal errors. The failures disappear
> when compaction is disabled or when using global TLB invalidation.
> 
> The root cause is insufficient TLB shootdown during page migration.
> Alpha relies on ASN-based MM context rollover for instruction cache
> coherency, but this alone is not sufficient to prevent stale data or
> instruction translations from surviving migration.
> 
> Fix this by introducing a migration-specific helper that combines:
>   - MM context invalidation (ASN rollover),
>   - immediate per-CPU TLB invalidation (TBI),
>   - synchronous cross-CPU shootdown when required.
> 
> The helper is used only by migration/compaction paths to avoid changing
> global TLB semantics.
> 
> Additionally, update flush_tlb_other(), pte_clear(), to use
> READ_ONCE()/WRITE_ONCE() for correct SMP memory ordering.
> 
> This fixes observed crashes on both UP and SMP Alpha systems.
> 
> Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
> ---
>  arch/alpha/include/asm/pgtable.h  |  33 ++++++++-
>  arch/alpha/include/asm/tlbflush.h |   4 +-
>  arch/alpha/mm/Makefile            |   2 +-
>  arch/alpha/mm/tlbflush.c          | 112 ++++++++++++++++++++++++++++++
>  4 files changed, 148 insertions(+), 3 deletions(-)
>  create mode 100644 arch/alpha/mm/tlbflush.c
> 
> diff --git a/arch/alpha/include/asm/pgtable.h 
> b/arch/alpha/include/asm/pgtable.h
> index 90e7a9539102..c9508ec37efc 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -17,6 +17,7 @@
>  #include <asm/processor.h>	/* For TASK_SIZE */
>  #include <asm/machvec.h>
>  #include <asm/setup.h>
> +#include <linux/page_table_check.h>
> 
>  struct mm_struct;
>  struct vm_area_struct;
> @@ -183,6 +184,9 @@ extern inline void pud_set(pud_t * pudp, pmd_t * pmdp)
>  { pud_val(*pudp) = _PAGE_TABLE | ((((unsigned long) pmdp) - PAGE_OFFSET) << 
> (32-PAGE_SHIFT)); }
> 
> 
> +extern void migrate_flush_tlb_page(struct vm_area_struct *vma,
> +					unsigned long addr);
> +
>  extern inline unsigned long
>  pmd_page_vaddr(pmd_t pmd)
>  {
> @@ -202,7 +206,7 @@ extern inline int pte_none(pte_t pte)		{ return 
> !pte_val(pte); }
>  extern inline int pte_present(pte_t pte)	{ return pte_val(pte) & 
> _PAGE_VALID; }
>  extern inline void pte_clear(struct mm_struct *mm, unsigned long addr, 
> pte_t *ptep)
>  {
> -	pte_val(*ptep) = 0;
> +	WRITE_ONCE(pte_val(*ptep), 0);
>  }
> 
>  extern inline int pmd_none(pmd_t pmd)		{ return !pmd_val(pmd); }
> @@ -264,6 +268,33 @@ extern inline pte_t * pte_offset_kernel(pmd_t * dir, 
> unsigned long address)
> 
>  extern pgd_t swapper_pg_dir[1024];
> 
> +#ifdef CONFIG_COMPACTION
> +#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
> +
> +static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
> +					unsigned long address,
> +					pte_t *ptep)
> +{
> +	pte_t pte = READ_ONCE(*ptep);
> +
> +	pte_clear(mm, address, ptep);
> +	return pte;
> +}
> +
> +#define __HAVE_ARCH_PTEP_CLEAR_FLUSH
> +
> +static inline pte_t ptep_clear_flush(struct vm_area_struct *vma,
> +				unsigned long addr, pte_t *ptep)
> +{
> +	struct mm_struct *mm = vma->vm_mm;
> +	pte_t pte = ptep_get_and_clear(mm, addr, ptep);
> +
> +	page_table_check_pte_clear(mm, pte);
> +	migrate_flush_tlb_page(vma, addr);
> +	return pte;
> +}
> +
> +#endif
>  /*
>   * The Alpha doesn't have any external MMU info:  the kernel page
>   * tables contain all the necessary information.
> diff --git a/arch/alpha/include/asm/tlbflush.h 
> b/arch/alpha/include/asm/tlbflush.h
> index ba4b359d6c39..0c8529997f54 100644
> --- a/arch/alpha/include/asm/tlbflush.h
> +++ b/arch/alpha/include/asm/tlbflush.h
> @@ -58,7 +58,9 @@ flush_tlb_other(struct mm_struct *mm)
>  	unsigned long *mmc = &mm->context[smp_processor_id()];
>  	/* Check it's not zero first to avoid cacheline ping pong
>  	   when possible.  */
> -	if (*mmc) *mmc = 0;
> +
> +	if (READ_ONCE(*mmc))
> +		WRITE_ONCE(*mmc, 0);
>  }
> 
>  #ifndef CONFIG_SMP
> diff --git a/arch/alpha/mm/Makefile b/arch/alpha/mm/Makefile
> index 101dbd06b4ce..2d05664058f6 100644
> --- a/arch/alpha/mm/Makefile
> +++ b/arch/alpha/mm/Makefile
> @@ -3,4 +3,4 @@
>  # Makefile for the linux alpha-specific parts of the memory manager.
>  #
> 
> -obj-y	:= init.o fault.o
> +obj-y	:= init.o fault.o tlbflush.o
> diff --git a/arch/alpha/mm/tlbflush.c b/arch/alpha/mm/tlbflush.c
> new file mode 100644
> index 000000000000..ccbc317b9a34
> --- /dev/null
> +++ b/arch/alpha/mm/tlbflush.c
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Alpha TLB shootdown helpers
> + *
> + * Copyright (C) 2025 Magnus Lindholm <linmag7@gmail.com>
> + *
> + * Alpha-specific TLB flush helpers that cannot be expressed purely
> + * as inline functions.
> + *
> + * These helpers provide combined MM context handling (ASN rollover)
> + * and immediate TLB invalidation for page migration and memory
> + * compaction paths, where lazy shootdowns are insufficient.
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/smp.h>
> +#include <linux/sched.h>
> +#include <asm/tlbflush.h>
> +#include <asm/pal.h>
> +#include <asm/mmu_context.h>
> +
> +#define asn_locked() (cpu_data[smp_processor_id()].asn_lock)
> +
> +/*
> + * Migration/compaction helper: combine mm context (ASN) handling with an
> + * immediate per-page TLB invalidate and (for exec) an instruction barrier.
> + *
> + * This mirrors the SMP combined IPI handler semantics, but runs locally on 
> UP.
> + */
> +#ifndef CONFIG_SMP
> +void migrate_flush_tlb_page(struct vm_area_struct *vma,
> +					   unsigned long addr)
> +{
> +	struct mm_struct *mm = vma->vm_mm;
> +	int tbi_type = (vma->vm_flags & VM_EXEC) ? 3 : 2;
> +
> +	/*
> +	 * First do the mm-context side:
> +	 * If we're currently running this mm, reload a fresh context ASN.
> +	 * Otherwise, mark context invalid.
> +	 *
> +	 * On UP, this is mostly about matching the SMP semantics and ensuring
> +	 * exec/i-cache tagging assumptions hold when compaction migrates pages.
> +	 */
> +	if (mm == current->active_mm)
> +		flush_tlb_current(mm);
> +	else
> +		flush_tlb_other(mm);
> +
> +	/*
> +	 * Then do the immediate translation kill for this VA.
> +	 * For exec mappings, order instruction fetch after invalidation.
> +	 */
> +	tbi(tbi_type, addr);
> +}
> +
> +#else
> +struct tlb_mm_and_addr {
> +	struct mm_struct *mm;
> +	unsigned long addr;
> +	int tbi_type;	/* 2 = DTB, 3 = ITB+DTB */
> +};
> +
> +static void ipi_flush_mm_and_page(void *x)
> +{
> +	struct tlb_mm_and_addr *d = x;
> +
> +	/* Part 1: mm context side (Alpha uses ASN/context as a key mechanism). */
> +	if (d->mm == current->active_mm && !asn_locked())
> +		__load_new_mm_context(d->mm);
> +	else
> +		flush_tlb_other(d->mm);
> +
> +	/* Part 2: immediate per-VA invalidation on this CPU. */
> +	tbi(d->tbi_type, d->addr);
> +}
> +
> +void migrate_flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
> +{
> +	struct mm_struct *mm = vma->vm_mm;
> +	struct tlb_mm_and_addr d = {
> +		.mm = mm,
> +		.addr = addr,
> +		.tbi_type = (vma->vm_flags & VM_EXEC) ? 3 : 2,
> +	};
> +
> +	/*
> +	 * One synchronous rendezvous: every CPU runs ipi_flush_mm_and_page().
> +	 * This is the "combined" version of flush_tlb_mm + per-page invalidate.
> +	 */
> +	preempt_disable();
> +	on_each_cpu(ipi_flush_mm_and_page, &d, 1);
> +
> +	/*
> +	 * mimic flush_tlb_mm()'s mm_users<=1 optimization.
> +	 */
> +	if (atomic_read(&mm->mm_users) <= 1) {
> +
> +		int cpu, this_cpu;
> +		this_cpu = smp_processor_id();
> +
> +		for (cpu = 0; cpu < NR_CPUS; cpu++) {
> +			if (!cpu_online(cpu) || cpu == this_cpu)
> +				continue;
> +			if (READ_ONCE(mm->context[cpu]))
> +				WRITE_ONCE(mm->context[cpu], 0);
> +		}
> +	}
> +	preempt_enable();
> +}
> +
> +#endif

Tested-by: Matoro Mahri <matoro_mailinglist_kernel@matoro.tk>

I tested this on a DS15 non-SMP kernel and confirmed it resolved the problem.

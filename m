Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF0232BF4B
	for <linux-alpha@vger.kernel.org>; Sat, 30 May 2026 20:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780172762; cv=none; b=Ik9oHBq7xkJmndbFEZeGBlAYAUWLOWqsRIo2k2YardIAiQpCQYK2W7nnXiMvHMog1dfPF5hD9BqkZzYOJMnIUNgLh3h733zQX/+xQ53NV5J27VwTPOdT1whzxlZS01jaMmS6QSZWO6El/H9fapqg4SETuDNt9RuHCu4dYDmqlX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780172762; c=relaxed/simple;
	bh=NJMctWkCkvaKSvd5Uce3HvzWFWfIWYwWyFq+kwfh0kA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IKT19RoE9UUM38UhTk4LR1gSAPcYjNSjFCEp8pRNZV/RjvRJFNSpdfFQSOQyUPmMjLJBWBI0TGWftbf55gTVDhUVmuWWiXTfCOda+/4fCTOdZJgwEHc+7p7YoWtJm2QNHiztTtCmTMJu+rotiazsBTA5Eqa8YRZE2SasBMaBc8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAoQpJRO; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAoQpJRO"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7dbe0943b21so47469537b3.1
        for <linux-alpha@vger.kernel.org>; Sat, 30 May 2026 13:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780172760; x=1780777560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzxLFbOxRCDOeLozJMvg6yHAwBzCK2kggsGVQYYIzAk=;
        b=AAoQpJRO/VrIddgTVa1eD/U7wI7XtiWI+JGMEjpwWHb82hMoZ8qE7oraHuLAT21XLU
         7iwosoB29SQRKy8EZ6YnQXXd3F7bz2fKn15ZZokDItMiPTmaQgDW7EPKnI3nMHHCxan9
         e6otxA8qbtZOmiKuLbPWDZO8aPYGfQ8pMo1aLFzQBzvKMmeuWDdXiBqLiOxOVIruxGGR
         jVYE+j2q1Qm7ujjQo1YrJ5qzbLULYmh0u58tLv+MzXakcnkqSw4lZr+kzgZlR1dFovV8
         7362LEiQS1VmTLElypvsGE3hdVMjA5xUrQK1WbVB/6gddMIbudIftcDKhAmjYAA+Y4WQ
         6w4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780172760; x=1780777560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xzxLFbOxRCDOeLozJMvg6yHAwBzCK2kggsGVQYYIzAk=;
        b=DYT9U9ZHNc5OPY8zm25SGgZrn1GknhaS7bPz4D2ZkItsUi//d5lfpbtXmN//9tv1q2
         IZ0WFrRj/SeHMoy2gvbU3RrmUWwQvXsIBikk6XeHro23ugB34oSZnEevayc7mr7VC3Ij
         ovAGHSli9BXjpt5oKACY4el2ezwxKRKPLFjYilQzCZUKqRxeUCqA5N2Et0FqlYStbvHA
         Chb6u5+NZ/B6C8+4wcMY6N1nAfa36poOuhZl5qJ9bPWREK8oFMBRWyHnlchZu3A/deCu
         GsR/te/ofRxjUveyYo7AZ63ZeC9V7IlXfYyyZ8Q2K9BEfS5QXR2/P906qLaq11xJ931p
         bzzA==
X-Gm-Message-State: AOJu0YwDbD4d7U1xSfsmGdEoOgY8qWcF+ejcYUHpRhFiQH5ToWpVabYe
	6gq0K+qvLMTP8sbZn2M9VKOpQ0Te8sPtrTrq7PrBm3RLdWQGsdH1O3iboiypGt5V
X-Gm-Gg: Acq92OHl1cvy99KUnMCfGqyCW2ZYTrWEbiNjL5NEwb/XxfBgOLKKp8f/ISM2nwoF6GH
	/QxWjMT6kmr5MUzIGQOZooIa5Om0Q1asAKTMfpiM2d/qXsBvIevwPcFWuqZssnDn15dYn+FMb+E
	SqORkvUPbY8zVu0OHrZ/yqTw0a8YOzRCg6hcSN2Pco+mC6J7JQMX8w+K4EP8O7Y+CeYndp/yx67
	1C0n0gXbUjQTpjQMrgpSWeghornsZkpe9LwvbWlHN7AFpBXJIRleh34ZF0PMWjsvVU91zUdSAAe
	D2fFt0IB0g/KwmeMZ8IfuT6BR/1YT7eRVQQgncou8923yeYWk56k0794kdqiBV6vWCzdJaePYVw
	rHwh4bbUQko1Qomi7G1/56egGHq1p0rDs/TLNCEhFnGxdmxrXAI6Znhj5SAO3uiHqXrdOYgKisU
	lmzTY+gEH5A69IScPYPrCDFZyarn9lsZ6nXQ==
X-Received: by 2002:a05:690c:4711:b0:7dc:7dfa:7266 with SMTP id 00721157ae682-7de2759ce27mr46275927b3.34.1780172759901;
        Sat, 30 May 2026 13:25:59 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7e17ae7e240sm12675387b3.32.2026.05.30.13.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 13:25:59 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Ivan Kokshaysky <ink@unseen.parts>,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH 1/3] alpha: smp: Serialize all synchronous IPI operations to fix SMP deadlock
Date: Sat, 30 May 2026 16:25:42 -0400
Message-ID: <20260530202544.59231-2-mattst88@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260530202544.59231-1-mattst88@gmail.com>
References: <20260530202544.59231-1-mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Two or more CPUs simultaneously calling any function that uses
on_each_cpu(wait=1) or smp_call_function(wait=1) deadlock: each blocks
in csd_lock_wait spinning while waiting for the remote CPU to signal CSD
completion. While spinning, neither CPU can receive the other's IPI, so
neither completion signal arrives — permanent hang.

Affected callers: smp_imb, flush_tlb_all, flush_tlb_mm, flush_tlb_page,
flush_icache_user_page (smp.c) and migrate_flush_tlb_page (tlbflush.c).

Introduce alpha_smp_ipi_lock (plain spinlock, defined in smp.c, declared
in asm/smp.h) and apply it to all six callers. Rather than spin_lock(),
use a trylock loop with alpha_drain_ipi(): if the lock is held, the loser
actively drains any pending IPI bits on the local CPU before retrying.
This is necessary because some callers hold IRQs disabled (e.g. paths
that take spin_lock_irqsave), so no RTC interrupt will fire to rescue a
lost wripir edge via alpha_poll_ipi_inirq(). alpha_drain_ipi() calls
handle_ipi() under local_irq_save/restore, satisfying handle_ipi()'s
requirement that IRQs be disabled, without touching lockdep
hardirq-context state.

This fix is necessary but not sufficient. A separate, independent
deadlock path exists: if the target CPU is inside do_entInt at IPL=7
when wripir fires, the hardware IPI edge is lost and the sending CPU
spins forever even when only one CPU is issuing a wait=1 call. That
race is fixed independently by alpha_poll_ipi_inirq() (see follow-on
commit). Both fixes are required for a complete solution.

The deadlock has been observed on EV7/Marvel under workloads generating
a high rate of synchronous TLB flush IPIs (e.g. the git test suite).

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/smp.h |  9 ++++++
 arch/alpha/kernel/smp.c      | 62 ++++++++++++++++++++++++++++++++++++
 arch/alpha/mm/tlbflush.c     |  3 ++
 3 files changed, 74 insertions(+)

diff --git ./arch/alpha/include/asm/smp.h ./arch/alpha/include/asm/smp.h
index 2264ae72673b..8bd529376cf6 100644
--- ./arch/alpha/include/asm/smp.h
+++ ./arch/alpha/include/asm/smp.h
@@ -48,6 +48,15 @@ extern int smp_num_cpus;
 extern void arch_send_call_function_single_ipi(int cpu);
 extern void arch_send_call_function_ipi_mask(const struct cpumask *mask);
 
+/*
+ * Global spinlock serializing all synchronous (wait=1) IPI callers.
+ * Callers must use the trylock+alpha_drain_ipi() pattern, not spin_lock(),
+ * because some call sites hold IRQs disabled and cannot rely on the RTC
+ * interrupt to rescue a lost wripir edge.
+ */
+extern spinlock_t alpha_smp_ipi_lock;
+extern void alpha_drain_ipi(void);
+
 #else /* CONFIG_SMP */
 
 #define hard_smp_processor_id()		0
diff --git ./arch/alpha/kernel/smp.c ./arch/alpha/kernel/smp.c
index ed06367ece57..d900da49b0d8 100644
--- ./arch/alpha/kernel/smp.c
+++ ./arch/alpha/kernel/smp.c
@@ -597,11 +597,61 @@ ipi_imb(void *ignored)
 	imb();
 }
 
+/*
+ * Serialize all synchronous (wait=1) IPI operations to prevent cross-CPU
+ * deadlock on EV7/Marvel.  If two CPUs simultaneously call any function that
+ * uses on_each_cpu(wait=1) or smp_call_function(wait=1), each blocks in
+ * csd_lock_wait spinning for the remote CPU to signal completion.  While
+ * spinning, neither CPU can receive the other's IPI, so neither completion
+ * signal arrives — permanent hang.
+ *
+ * A plain spinlock (not irqsave) is intentional: the CPU that loses the lock
+ * race spins with IRQs enabled and can service the winner's IPI before
+ * taking the lock itself.
+ *
+ * All callers of synchronous IPIs — including migrate_flush_tlb_page in
+ * tlbflush.c — must hold this lock.
+ */
+DEFINE_SPINLOCK(alpha_smp_ipi_lock);
+
+/*
+ * Drain any pending IPIs for this CPU while spinning on alpha_smp_ipi_lock.
+ *
+ * The lock holder has already sent a wripir but is blocked in csd_lock_wait
+ * waiting for our IPI ACK.  We cannot simply spin on the lock: if IRQs are
+ * disabled (e.g. caller holds a spin_lock_irqsave), no RTC interrupt will
+ * fire and the lost wripir edge is never rescued by alpha_poll_ipi_inirq.
+ *
+ * Call this from the trylock loop so the IPI is processed even with IRQs
+ * disabled, breaking the circular wait.
+ *
+ * handle_ipi() requires IRQs disabled: generic_smp_call_function_interrupt
+ * asserts lockdep_assert_irqs_disabled().  Use local_irq_save/restore so
+ * this is safe whether the caller has IRQs enabled (e.g. page fault path)
+ * or disabled (e.g. spin_lock_irqsave holder).  Avoid __irq_enter_raw/
+ * __irq_exit_raw: those manipulate lockdep hardirq-context state and trigger
+ * a lockdep WARNING when called while lockdep already tracks hardirq context.
+ */
+void alpha_drain_ipi(void)
+{
+	unsigned long flags;
+
+	if (!READ_ONCE(ipi_data[smp_processor_id()].bits))
+		return;
+
+	local_irq_save(flags);
+	handle_ipi(NULL); /* regs unused in handle_ipi() */
+	local_irq_restore(flags);
+}
+
 void
 smp_imb(void)
 {
 	/* Must wait other processors to flush their icache before continue. */
+	while (!spin_trylock(&alpha_smp_ipi_lock))
+		alpha_drain_ipi();
 	on_each_cpu(ipi_imb, NULL, 1);
+	spin_unlock(&alpha_smp_ipi_lock);
 }
 EXPORT_SYMBOL(smp_imb);
 
@@ -616,7 +666,10 @@ flush_tlb_all(void)
 {
 	/* Although we don't have any data to pass, we do want to
 	   synchronize with the other processors.  */
+	while (!spin_trylock(&alpha_smp_ipi_lock))
+		alpha_drain_ipi();
 	on_each_cpu(ipi_flush_tlb_all, NULL, 1);
+	spin_unlock(&alpha_smp_ipi_lock);
 }
 
 #define asn_locked() (cpu_data[smp_processor_id()].asn_lock)
@@ -651,7 +704,10 @@ flush_tlb_mm(struct mm_struct *mm)
 		}
 	}
 
+	while (!spin_trylock(&alpha_smp_ipi_lock))
+		alpha_drain_ipi();
 	smp_call_function(ipi_flush_tlb_mm, mm, 1);
+	spin_unlock(&alpha_smp_ipi_lock);
 
 	preempt_enable();
 }
@@ -702,7 +758,10 @@ flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 	data.mm = mm;
 	data.addr = addr;
 
+	while (!spin_trylock(&alpha_smp_ipi_lock))
+		alpha_drain_ipi();
 	smp_call_function(ipi_flush_tlb_page, &data, 1);
+	spin_unlock(&alpha_smp_ipi_lock);
 
 	preempt_enable();
 }
@@ -752,7 +811,10 @@ flush_icache_user_page(struct vm_area_struct *vma, struct page *page,
 		}
 	}
 
+	while (!spin_trylock(&alpha_smp_ipi_lock))
+		alpha_drain_ipi();
 	smp_call_function(ipi_flush_icache_page, mm, 1);
+	spin_unlock(&alpha_smp_ipi_lock);
 
 	preempt_enable();
 }
diff --git ./arch/alpha/mm/tlbflush.c ./arch/alpha/mm/tlbflush.c
index ccbc317b9a34..37607d08796b 100644
--- ./arch/alpha/mm/tlbflush.c
+++ ./arch/alpha/mm/tlbflush.c
@@ -89,7 +89,10 @@ void migrate_flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 	 * This is the "combined" version of flush_tlb_mm + per-page invalidate.
 	 */
 	preempt_disable();
+	while (!spin_trylock(&alpha_smp_ipi_lock))
+		alpha_drain_ipi();
 	on_each_cpu(ipi_flush_mm_and_page, &d, 1);
+	spin_unlock(&alpha_smp_ipi_lock);
 
 	/*
 	 * mimic flush_tlb_mm()'s mm_users<=1 optimization.
-- 
2.53.0


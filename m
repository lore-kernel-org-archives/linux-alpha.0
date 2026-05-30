Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFA533AD99
	for <linux-alpha@vger.kernel.org>; Sat, 30 May 2026 20:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780172763; cv=none; b=VZSJd4r0iyHCWrXedZ6WMoykBY1RBSX6Dwo2tvjL0zaUA1p5vp6oqamMCRYmoGXT9dYBrvA7T8toZCSpYs+LZff5Q3rBs5TvXTEAR1OTfptch1wg/ZBPLRXF3Lkw8al1IIY4PYeX9ScDOyf13nMmFMeLG/qkLF7zegiEL4Yz0Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780172763; c=relaxed/simple;
	bh=lSq1XiVdFbegW3dLAoeQ8xE+ZRtn2eqXPy7IPZ9+odk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kDrqsaj4+8KGyEj1axI9omMDo2KCsA1u19afIjUNu/YZwmNP2mZ3t4KMEerc4JdHLpw5KEzOFdr1jjTQmA3rm3m9DQHxkMvTGtdad+IxMSLU5I23lt5nJK5AM0EFVkD05duubF7CDeG2X3ZSxuALJSFwUiLQSxK/qS4V1DHcWzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtMT3GpX; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtMT3GpX"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66058b880e9so1391559d50.2
        for <linux-alpha@vger.kernel.org>; Sat, 30 May 2026 13:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780172761; x=1780777561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lljDjPO0XM3n9bEJfoxc211+yO6B5dMSriEAJih/sic=;
        b=BtMT3GpXpJvN0avXcy3oxCM7sXooitTOfw0++EuBYLPQc4bsNiI+4LGyCaRSt8XGJd
         WPNqZcnuXy/VN/jKA+N8Llzl1rhqbpUR6fJjMVQ120QgUcva95oY3Xl/eL5EbCN/okTD
         NmQ4m4/72rF44nttQ0ujSnnbIIEdFS59PKOU6kuFd+eEfKBssotY1x192xrFu+muESHY
         zDLuF7uiqtY1cnHRMjr3onQWsw1LIzv0U0ULW1FvCQPxdONFMe3yuCHVvaGEy4hUniu3
         YcyHq0ZN/R24QUqkXU0/95OEkE9eyk4oUa1qpuYxtqrNLszIXlL6qSlbROvqXLiYmo1G
         3Tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780172761; x=1780777561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lljDjPO0XM3n9bEJfoxc211+yO6B5dMSriEAJih/sic=;
        b=sA12X2yIDS2po5e/jMCxJGDxv5cWiuqSt491MrYT5PWITbstzCXfdiYKsKoIf9xNP+
         0rHSUKYfLf3xIvgTTnRZwG/Z5eg7D/N+LnM+iaFetaeZExUQY7zCpjDu6C46hzqW1UB0
         J7nAqFbntyAw0VaUdZW4/m6WESnrzH+3dyKF/XoY1p3OxcGfg6S1NKgWRkLTGq0cGJda
         /1/CvM4yWwb9H81w+D5DVWKaPYQrSkM5pR78QLp5vroN4KBGkRlVdza4pJp7N4rpKQ45
         BHC3RBpHSMFzF+TKbcwczw2fWFxoUZYI9aXYjLfetQ2H2HRXnY3YW1S8E5UFDw1lqvhi
         A9EA==
X-Gm-Message-State: AOJu0YzB03tkqZXpYzGYmKAW5mwEZzEw2mJdofVq0tWxgDPf76hcwRMr
	L3c1+md7/lx6Jpyq0MMpIp4Ncd2jhQMJRpqs8lxkaj7JjSoLF39gkp7XfmUe/iHu
X-Gm-Gg: Acq92OEBlMiE8v+h6uuVhBcPvJ1ka86AA3GD8vKH/i7MPgZ93BBD/9WwfxatnMQoQrg
	lsd171UnkC9BpS25VUOPxMC3j8sjuEGXP5DFThhEJuhU+jUGTm6LBH2AelPIG45xiCbpDg+hSlG
	cGAmHzIkNLhWF3PqyzHsTX5MXU14jb1slWKKVbGl7Ka+6G2zMr0SRast0fgpYI4L30rT+magfic
	x2qAXor2j9374TCuCPe/M/jwF6y5Xi2Tusdj4PstdFvYa4EIdSBOXWAEVmdxL4asg7pP0RwEvUr
	ikDlR3bY6WPgmcsbG2gqIUw7NoYY7I2Cl7fLagVjbuHiAfcWKZ6yI+wMEhQywjgGF2Lse8vwoVg
	j3n0Hfp+2TO4+yijiFcGeqPiZPEsU8dCeL/xL1Th94z6TXpNQaUsPPGPlVNEgKk3VumQAU19SMz
	Q8Q36WXpdmDK28nx3pUN3BT7vV1by+8C4xgg==
X-Received: by 2002:a05:690e:4812:b0:64c:c616:c349 with SMTP id 956f58d0204a3-6605ef9948bmr2773016d50.31.1780172761303;
        Sat, 30 May 2026 13:26:01 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6606977ab05sm1178609d50.9.2026.05.30.13.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 13:26:00 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Ivan Kokshaysky <ink@unseen.parts>,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH 2/3] alpha: Fix SMP IPI loss when target CPU is in interrupt handler
Date: Sat, 30 May 2026 16:25:43 -0400
Message-ID: <20260530202544.59231-3-mattst88@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260530202544.59231-1-mattst88@gmail.com>
References: <20260530202544.59231-1-mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On EV7/IO7, the wripir PALcall delivers IPIs as edge-triggered hardware
signals through the IO7 I/O controller. If the target CPU is already
executing at IPL=7 inside do_entInt handling another interrupt, the IPI
edge is lost: the hardware never re-delivers it when the CPU drops back
to IPL=0.

The software IPI bit in ipi_data[cpu].bits is set before wripir is
called, so it remains set after the interrupt handler returns. But
because no hardware edge fires, handle_ipi() is never invoked again,
and the sending CPU spins forever in csd_lock_wait.

This race is the root cause of a 15-year SMP deadlock on EV7/Marvel
systems. It is reliably triggered by workloads that generate many
synchronous IPIs (TLB flushes via on_each_cpu(wait=1)) while the
target CPU receives concurrent I/O or RTC interrupts.

Fix: add alpha_poll_ipi_inirq(), called from do_entInt within each
interrupt handler's irq_enter/irq_exit bracket. It checks
ipi_data[smp_processor_id()].bits and drains any pending IPIs that
arrived while we were at IPL=7, before irq_exit() opens the softirq
window where a TLB-flush softirq could itself deadlock on
alpha_smp_ipi_lock. The check is a single READ_ONCE so there is no
overhead when no IPI was missed.

For the RTC interrupt (case 1 in do_entInt), handle_irq() already calls
its own irq_enter()/irq_exit() internally. The outer irq_enter/irq_exit
pair added here is intentional: it keeps irq_count > 0 while handle_irq()
runs, so handle_irq()'s inner irq_exit() sees a non-zero count and skips
the softirq window. The softirq window is deferred until the outer
irq_exit(), which runs after alpha_poll_ipi_inirq() has already drained
any pending IPIs. Without this outer bracket, irq_exit() inside
handle_irq() could open the softirq window before any missed IPIs are
rescued, risking a deadlock on alpha_smp_ipi_lock.

Approximately 98% of rescued IPIs are IPI_CALL_FUNC (the TLB-flush
type), confirming that IO7 genuinely drops the hardware edge rather than
holding it pending until IPL falls.

A lost IPI_CALL_FUNC only deadlocks when the sender is blocking (wait=1).
wait=0 callers do not hang, but silently skip the function on the remote
CPU, which may be a correctness issue in its own right.

This fix is complementary to the alpha_smp_ipi_lock serialization
(previous commit). Both are required:
  - Serialization prevents two CPUs simultaneously issuing wait=1 IPIs
    from deadlocking each other in csd_lock_wait.
  - This fix prevents a single wait=1 caller from deadlocking due to an
    IPI edge lost to an IPL=7 window on the remote CPU.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/irq_alpha.c | 29 ++++++++++++++++++++++++++++-
 arch/alpha/kernel/proto.h     |  1 +
 arch/alpha/kernel/smp.c       | 35 +++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+), 1 deletion(-)

diff --git ./arch/alpha/kernel/irq_alpha.c ./arch/alpha/kernel/irq_alpha.c
index ac941172ae66..0e4234ef7ea0 100644
--- ./arch/alpha/kernel/irq_alpha.c
+++ ./arch/alpha/kernel/irq_alpha.c
@@ -69,22 +69,49 @@ do_entInt(unsigned long type, unsigned long vector,
 		break;
 #endif
 	case 1:
-		/* handle_irq() already does irq_enter()/irq_exit() */
+		/*
+		 * Wrap handle_irq() in our own irq_enter/irq_exit so that the
+		 * inner irq_exit() inside handle_irq() does not run softirqs
+		 * (irq_count remains > 0). We poll for lost IPIs before the
+		 * outer irq_exit(), which is where softirqs may run. This
+		 * prevents a TLB flush softirq from deadlocking on
+		 * alpha_smp_ipi_lock while the sending CPU waits for our ACK.
+		 */
+		irq_enter();
 		handle_irq(RTC_IRQ);
+#ifdef CONFIG_SMP
+		alpha_poll_ipi_inirq(regs);
+#endif
+		irq_exit();
 		break;
 	case 2:
 		irq_enter();
 		alpha_mv.machine_check(vector, la_ptr);
+#ifdef CONFIG_SMP
+		alpha_poll_ipi_inirq(regs);
+#endif
 		irq_exit();
 		break;
 	case 3:
 		irq_enter();
 		alpha_mv.device_interrupt(vector);
+#ifdef CONFIG_SMP
+		/*
+		 * Drain any IPIs whose edge was lost while we were at IPL=7.
+		 * Must be called before irq_exit() to prevent softirqs (e.g.
+		 * a TLB flush) from deadlocking on alpha_smp_ipi_lock while
+		 * the sending CPU spins in csd_lock_wait.
+		 */
+		alpha_poll_ipi_inirq(regs);
+#endif
 		irq_exit();
 		break;
 	case 4:
 		irq_enter();
 		perf_irq(la_ptr, regs);
+#ifdef CONFIG_SMP
+		alpha_poll_ipi_inirq(regs);
+#endif
 		irq_exit();
 		break;
 	default:
diff --git ./arch/alpha/kernel/proto.h ./arch/alpha/kernel/proto.h
index f138bd494628..04879e0b2932 100644
--- ./arch/alpha/kernel/proto.h
+++ ./arch/alpha/kernel/proto.h
@@ -120,6 +120,7 @@ extern void unregister_srm_console(void);
 /* smp.c */
 extern void setup_smp(void);
 extern void handle_ipi(struct pt_regs *);
+extern void alpha_poll_ipi_inirq(struct pt_regs *);
 extern void __init smp_callin(void);
 
 /* bios32.c */
diff --git ./arch/alpha/kernel/smp.c ./arch/alpha/kernel/smp.c
index d900da49b0d8..099e1ac6a0d6 100644
--- ./arch/alpha/kernel/smp.c
+++ ./arch/alpha/kernel/smp.c
@@ -557,6 +557,41 @@ handle_ipi(struct pt_regs *regs)
 		recv_secondary_console_msg();
 }
 
+/*
+ * On EV7/IO7, IPI signals are edge-triggered. If an IPI arrives while this
+ * CPU is executing at IPL=7 (inside another interrupt handler), the hardware
+ * edge is lost. The software bit in ipi_data[] remains set but handle_ipi()
+ * is never re-invoked, causing the sending CPU to spin forever in csd_lock_wait.
+ *
+ * Call this from within hardirq context (between irq_enter and irq_exit) to
+ * drain any IPIs that arrived while we were running at IPL=7, before irq_exit()
+ * opens the softirq window where a TLB flush could deadlock on alpha_smp_ipi_lock.
+ */
+void alpha_poll_ipi_inirq(struct pt_regs *regs)
+{
+	int cpu = smp_processor_id();
+	unsigned long bits = READ_ONCE(ipi_data[cpu].bits);
+
+	if (!bits)
+		return;
+
+	/*
+	 * Peek at type bits before handle_ipi() clears them via xchg().
+	 * Bits arriving after this READ_ONCE are drained but not counted;
+	 * the counters are approximate but sufficient for diagnosis.
+	 * Note: handle_ipi() also increments ipi_count, so the "IPI:" row
+	 * in /proc/interrupts includes both normal and rescued deliveries.
+	 */
+	if (bits & (1UL << IPI_RESCHEDULE))
+		cpu_data[cpu].rescued_reschedule_count++;
+	if (bits & (1UL << IPI_CALL_FUNC))
+		cpu_data[cpu].rescued_call_func_count++;
+	if (bits & (1UL << IPI_CPU_STOP))
+		cpu_data[cpu].rescued_cpu_stop_count++;
+
+	handle_ipi(regs);
+}
+
 void
 arch_smp_send_reschedule(int cpu)
 {
-- 
2.53.0


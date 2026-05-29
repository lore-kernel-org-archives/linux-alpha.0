Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC6D35F60F
	for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064629; cv=none; b=npmVEF0/grWaHie3pXl0t+2QV9BZG3NRo8HF/cmfxZLXnUziJL+hd0Jk+hnulQTPDZL2fCznWYoFRkpIdt3V5No9rUG4ZmUpINtARBIdrJlwXv9APAc+I75TioZfp/bmck9uidC0R7hRtKqWyvIivEG4LPS48OjwMezVKjaoVoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064629; c=relaxed/simple;
	bh=8ZCTjRwEU90aOFjdM2BqJWPcGFCLfSq9sbu77JodwCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PjMiVVtR9GchYuoVDy/gx2I1grkCXydhyLlnfZIMAW+1dBmqli6JYsQXVCIyg0Dv1nxXmtP4q17nnntN6y20qD7QDlLR0eiP9goNh3zF5icVefnSMs4Xe4QXpaEUbPDjI31sEXOmKrLnx1gxYbN2yUuAyynAIKKLb9yMm+MlTok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PoSOpOBS; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PoSOpOBS"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a887ebb416so17486350e87.2
        for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780064625; x=1780669425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vo/kqexim4ywDwuffxHgaw4wfPoKPS0jDc9dhEX2Cmk=;
        b=PoSOpOBSCH4iOVFZnFFIQup5huu+ekka3kpK2RFocUsxN1gP4xtGxNXdWsE7JZyMDG
         TTEsWN9QK1yYTAYyjnh8IwIEofQjwFX7JJovjc2Or85C+gAmHD5MG74G6zzdFqFzOaCN
         bVqC9ft2QHLF9uz2KfQt9TEYwyX2mB7dGrcrGI3cDROIsxnA+SnUqoeUZcchZKBfV4+Y
         EMQ2lz+iCbETru/CK94qehlNhNIb50Qrk6K/v5Q0rql76kp9PriOSlOr2TQXc4cY9bRI
         siORTkzEMQXmvXv6UofYnbQ/X255+D6a+1cRRl2yoBJpD1RtvGIozlpJdOyYk8nYWVPe
         vonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780064625; x=1780669425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vo/kqexim4ywDwuffxHgaw4wfPoKPS0jDc9dhEX2Cmk=;
        b=V4ru7tpe5sSDjzkZFVNM1h+/TMADjGouSPA6oLEd7PD6knyIZjlXg8+6WMjJRg3NX0
         TBKviN0pl4Ej8LO1MoahDG9LXdLm9W1sqj48E3BDbyA6mNQatPNvEM8PE8TNDmHaNAw0
         2m59C+6Dna9ppgE9qnn/GLvULRNoOZHwJD6zvblekr5OTzDg6CzgQSClUdYnOsvREB8Q
         1iCQvK4vI3fN2sajB22TjfNpXyDYi7CHpFGPisA0dIpuSoeuGh4u0efXDV3RINnI2sEP
         tAbGQAe2TI+1Of7UwkU7g1XtbyzMj76QPwuy3NoUFt9JIKxwFR/iFSbYVgN+S8giXCUC
         YJpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gLXDeHwHU8kaLX1LGqamczqv1g6B4VIln2WczDHods+mbaLdh96gaMCFHa+U3NNAve1WMIVLsoZ/6yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyObG2dfKlyPGkt7uEtKXiZ+N3veooc4q4ucEA9I6AkIA8cqHW4
	5QCRZMXiA4OTxY6mh7uf3vYSGosqaDYIrW2MQulBZbjVGZiItcpPjRVJ
X-Gm-Gg: Acq92OEJRRQc2Jx9wKDBNyy8r2a1klPHqYreoUQu3P2Lyh9Gs8nie+mmSNinMtpbtqe
	Vw211k/KCiZRrdfX7so1q+2ychf0DiefwoY0UO4pHLP5fHgh5ZGGQZ23jAax+O/oMsn8ixuwBC9
	6dH4obg74pbBcrqnUp5Nn+/frEW7nv5ipir09kHvtIloLqgJQ/l6tkx/B5DC4J2hUHQy2SIWyht
	ZQ7hk1WW8v0d4VRGyRaq/krXFKMLxmRoOFDU3z0Ebm1+VhrpB33w1pbtaJxQXEMu2bCFleKOdZx
	t5tABd5Fhj+pKGjWehMQRjlyfIUnfKwOGgEL7++WJpMDcnaIGenyqGk02kVMLrIJ5KouB6GAhV/
	czfgp743QVQzWNnmA3cOARy1Gevcg4RH6S6BEDlydJdcYapdjpX9y1B52Cd58qadU28SGxRlD3u
	kg7nhq8LENflrKTnKz5A9P8WSGrP9OiRJBPdP5sr4tnYVlbw5RYiYtsLPpHRTkrl893D5tc1s7m
	Dt9JDdYmrXucxg7Twx7EQv150EECfvDEG0rZKGYIbXeIQ==
X-Received: by 2002:a05:6512:3f09:b0:5a8:88a4:46a5 with SMTP id 2adb3069b0e04-5aa594b868fmr936899e87.40.1780064624780;
        Fri, 29 May 2026 07:23:44 -0700 (PDT)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b0687e2sm310433e87.6.2026.05.29.07.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:23:44 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	macro@orcam.me.uk,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v2 2/8] alpha: add ARCH_STACKWALK-based stacktrace support
Date: Fri, 29 May 2026 16:21:58 +0200
Message-ID: <20260529142322.1362438-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142322.1362438-1-linmag7@gmail.com>
References: <20260529142322.1362438-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement arch_stack_walk() for Alpha using a simple kernel
stack scanning walker. Start from regs+1 for current tasks
to skip pt_regs and use pcb.ksp for blocked tasks. Filter
candidates with __kernel_text_address() and stop at stack
bounds via kstack_end().

Enable CONFIG_STACKTRACE_SUPPORT and CONFIG_ARCH_STACKWALK
so generic stacktrace users (dump_stack(), /proc/*/stack,
SysRq backtraces, etc.) work on Alpha.

This provides functional in-kernel stack traces without
requiring frame pointer unwinding.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig              |  4 +++
 arch/alpha/kernel/Makefile      |  3 +-
 arch/alpha/kernel/stacktrace.c  | 61 +++++++++++++++++++++++++++++++++
 arch/alpha/kernel/vmlinux.lds.S |  2 ++
 4 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 arch/alpha/kernel/stacktrace.c

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index f3b882835617..7ac435c56845 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -39,6 +39,7 @@ config ALPHA
 	select MODULES_USE_ELF_RELA
 	select ODD_RT_SIGACTION
 	select OLD_SIGSUSPEND
+	select ARCH_STACKWALK
 	select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
 	select MMU_GATHER_NO_RANGE
 	select MMU_GATHER_RCU_TABLE_FREE
@@ -80,6 +81,9 @@ config PGTABLE_LEVELS
 config AUDIT_ARCH
 	bool
 
+config STACKTRACE_SUPPORT
+	def_bool y
+
 menu "System setup"
 
 choice
diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index 187cd8df2faf..4ea5c189e60e 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -9,7 +9,8 @@ ccflags-y	:= -Wno-sign-compare
 
 obj-y    := head.o entry.o traps.o process.o osf_sys.o irq.o \
 	    irq_alpha.o signal.o setup.o ptrace.o time.o \
-	    systbls.o err_common.o io.o bugs.o termios.o
+	    systbls.o err_common.o io.o bugs.o termios.o \
+	    stacktrace.o
 
 obj-$(CONFIG_VGA_HOSE)	+= console.o
 obj-$(CONFIG_SMP)	+= smp.o
diff --git a/arch/alpha/kernel/stacktrace.c b/arch/alpha/kernel/stacktrace.c
new file mode 100644
index 000000000000..74d95f591039
--- /dev/null
+++ b/arch/alpha/kernel/stacktrace.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/sched.h>
+#include <linux/sched/task_stack.h>
+#include <linux/stacktrace.h>
+#include <linux/kallsyms.h>
+
+#include <asm/thread_info.h>
+#include <asm/ptrace.h>
+
+static __always_inline unsigned long alpha_get_current_ksp(void)
+{
+	unsigned long sp;
+
+	asm volatile("mov $30, %0" : "=r"(sp));
+	return sp;
+}
+
+static void alpha_scan_kernel_stack(unsigned long ksp,
+				    stack_trace_consume_fn consume_entry,
+				    void *cookie)
+{
+	unsigned long *p = (unsigned long *)ksp;
+
+	if (unlikely(ksp & (sizeof(unsigned long) - 1)))
+		return;
+
+	while (!kstack_end(p)) {
+		unsigned long addr = READ_ONCE_NOCHECK(*p++);
+
+		if (!__kernel_text_address(addr))
+			continue;
+
+		if (!consume_entry(cookie, addr))
+			break;
+	}
+}
+
+noinline void arch_stack_walk(stack_trace_consume_fn consume_entry,
+				      void *cookie,
+				      struct task_struct *task,
+				      struct pt_regs *regs)
+{
+	unsigned long ksp;
+
+	if (!task)
+		task = current;
+
+	if (regs && task == current) {
+		/*
+		 * pt_regs is stored on the kernel stack; regs+1 matches
+		 * what arch/alpha/kernel/traps.c uses as the trace start.
+		 */
+		ksp = (unsigned long)(regs + 1);
+	} else if (task == current) {
+		ksp = alpha_get_current_ksp();
+	} else {
+		ksp = task_thread_info(task)->pcb.ksp;
+	}
+
+	alpha_scan_kernel_stack(ksp, consume_entry, cookie);
+}
diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index 2d136c63db16..95704e64b6a6 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -28,6 +28,8 @@ SECTIONS
 		TEXT_TEXT
 		SCHED_TEXT
 		LOCK_TEXT
+		IRQENTRY_TEXT
+		SOFTIRQENTRY_TEXT
 		*(.fixup)
 		*(.gnu.warning)
 	} :text
-- 
2.53.0


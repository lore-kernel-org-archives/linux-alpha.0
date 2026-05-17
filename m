Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB6831F9A8
	for <linux-alpha@vger.kernel.org>; Sun, 17 May 2026 21:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779054005; cv=none; b=j0+mZ9QJif1T3ed6c+hUYKWUXGSkLwVb2IVf+Th53g3o/Hn5pvBKA6kJTbgT5Zfz2nwrYaCD/rOX2LZHArV4xiOuHZAdi4DUzjs1YEFhg1ODMftW1BPv/RoxOCxgN4GpVjEf8LCO7riqrHsW5RwZMRVQp3WyeOuoK4ZbqOvjklQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779054005; c=relaxed/simple;
	bh=8ZCTjRwEU90aOFjdM2BqJWPcGFCLfSq9sbu77JodwCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVd80SqS/0UcResygt3fITxjEhy23+7flYOtZlWAyr/NZIX4aBk2BH6uTbW9XdL3/mG8LnenwKd512j9+8KwyOd84h4fuPJAeWuZwzWcZWeTs8AE+Eh+L9crVVHUZu7Fa3AJ4NgjqxfZ9v52joV4+xNEZixuia+q3PVC2o9RYNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ib7p+O3n; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ib7p+O3n"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a8704dc3a8so1884159e87.3
        for <linux-alpha@vger.kernel.org>; Sun, 17 May 2026 14:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779054002; x=1779658802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vo/kqexim4ywDwuffxHgaw4wfPoKPS0jDc9dhEX2Cmk=;
        b=ib7p+O3nKiHlkLJeU0CZdzUMbTfqijH0cxC1ytP69aDG6vDu5OWH6WOKW3uMBmH/kH
         rfb2KTNbAg61w8EqObGhOIWAKhdJ6RJTf4ItxWQ2UFTTUUOzKcdlWoio5s6AuFjGDn3b
         AMr2IFgEOO0Z/ZdjCep+5K6WdLWaiXJjqwxwaJNqOrqPOmGMjjxM0AK1Ml9aHGi0irC1
         VIw4X8O3wEAi4m4YYYzr5QntGOfb9f99UY3AWHv/pRpDnreKLYiW3UUpAgImxKyGDvhi
         jSZB5+gndiZ5FxMSAT5jBHj2XTz7j5IZEgBuBAxg3Z7EwLVI7htXrFtWvTan7gPOZbxF
         SniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779054002; x=1779658802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vo/kqexim4ywDwuffxHgaw4wfPoKPS0jDc9dhEX2Cmk=;
        b=rLiLJgKdLVhVBhAWCWIeUtkgazDbpaSAGyHXz3241zF1LHpiKl4wvTfIuVY/mIh8f2
         Ou+sQstqs+aIej9WrLcEbg7HPHQzTniU7FcCTn9sbQ8w/sdlSW/s1lL+T+j/4+dB0a7m
         NPWuYGM2rwJl7moE1E/Upj3Dw559OW2FynLbV2fT7b1dn6xHFKR84BIDUuFTUPk+dWYH
         3tBULFf2GisejG+CfzocahEeZ9SHq2NWUycJ3nNK2s9wrCwUTf4/RI6tF9lLfOrl6E8j
         oXETqewkBCdC4y4UG1gf7d7YPFp6WTzJI2BdKk9AG5N/YZLz7G+5fyIUPnuCBDeVNINl
         JkYg==
X-Forwarded-Encrypted: i=1; AFNElJ8aStm2WHkrRqyq8KiQS3mlUrj2QouCsr8TNGlADeLfcKSBlI8cPdyD+IFOY6f1HvFp3nDuH4pVXAzt+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhRy75WqHPBNQwkDP4SbVvJcZm/SDttZFje8skfqxUjKZXoftW
	T1/c12AZsSVyaYIbdMKltSmuwzn3bkmXwWwBOFGZ4lGRJ/rVekzA0pSs
X-Gm-Gg: Acq92OEsSfq8Nb8WSE/GF7r8xN+YZ2ARi0ruK0WWzYaL/X/w6mcqJ9ClHPUvIH7KRZJ
	+etktRn5mu599+ajRYRrymZ7sK3Vqr8pPg9rCs/zhz4Oh9+waRNlkWgzm2hIndloCWpkVhbtheR
	rZuK06Mj28y+AMiUew6ZP9Q2fqS0MnTplDvpluKbY684FjDSfS5/+AVnB6Wp4K6lHap0d76zTiW
	RGbU/Q1mrua93GPCee+EvsKLKNVxmPIe2nCvl2hDQaEuANYYGJVnx1nSIBZ1giRTt2yCzSpwI1R
	kWuECk73IYVH08ybey7UuPUrvoB5w+MhkFk48Y8HFo64v9G+O22OW8uLThYghlZQ7BRr3YSDMaf
	SkgdYIsfYdolg69CRFCUy3yQYxtgI3kL/fi4VSM5QNAszwzWe9ipw8Ue9Jl967F1NPsZ7SAVEl7
	Budad03oeXYLkGTHQ9F+P43jZHvPoJwlJCp8QYrDdIe70BiARnog4QMdenGNTFCLWoIvTYgK4q/
	iN7nt+BU2rjFY3yrMzkCTy9VUpxwkn0luM=
X-Received: by 2002:a05:6512:15a6:b0:5a8:b963:cef6 with SMTP id 2adb3069b0e04-5aa0e769c37mr3063617e87.38.1779054001648;
        Sun, 17 May 2026 14:40:01 -0700 (PDT)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91c1558f3sm2890076e87.77.2026.05.17.14.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 14:40:00 -0700 (PDT)
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
Subject: [PATCH 2/8] alpha: add ARCH_STACKWALK-based stacktrace support
Date: Sun, 17 May 2026 23:36:11 +0200
Message-ID: <20260517213919.347523-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260517213919.347523-1-linmag7@gmail.com>
References: <20260517213919.347523-1-linmag7@gmail.com>
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


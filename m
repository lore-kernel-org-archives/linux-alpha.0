Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED84132D0F5
	for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 20:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781296409; cv=none; b=CqPQ9Ls66BGQDs3D4ww3vSTRKsS/eP6URsWNNNzAhRSZYcpXNfiaO1Yx+kXpSIZtjWXjxROJgyCZUp7r9C793G+Hb9gmq+1Qcp2CN2neE+nzeNyvzvZuMMCgXi0btdSgWJ3qiXz48MK1frYwXQPkmBKcI5eEFoS7RzqTxAbwxis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781296409; c=relaxed/simple;
	bh=sxmyOWeTHHxi3XZ7/n/lZPH/SI1SxJQvJMP+vMzWDwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RofY5uanFbp6jus6mju6p4LIh1q6HLW5IqZXQI40OUgBpGre8TPsf6v5wWVL9dVU2Z3OXsQlvMrfKFr8tdmwuzhMfDnBxFOmKWQIq1t/h7gFnZCBasRQs5OwztdCu2wyZF/wUe+Wcc/0DO1Ciaqdh6SdaEy9il82NVyPRIdLASM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqtpGKEU; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqtpGKEU"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3965bc493caso12084321fa.2
        for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 13:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781296406; x=1781901206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyvz3ufjy6ivfzF2sNltt0RdDD9Xm6yL7j4zOBoOGug=;
        b=DqtpGKEUR87VegX358PhWsR9tL9oBrQqOp1nyDecpw0xpXixxcmrcec0Y9P0gYRW3q
         Oy3GSSYwAXzczYEpXoOKmF3v2/FGA7dgSsuL7VEBL+Z/P7IU61rudQe9mbUYEG+HsQx1
         UbQfrkfdVFh0kl8pQqe6g8ukK9SPM6KfBq+RkpydNWbgEIUAJglO1yIvvsVFInRXb0uu
         NIaA3LgMWPaT0sMDzTnN/wVmQui+P6fD2Vzx6ND2hQ9doSFEUbfETQh783QqUpvk1voM
         Vq90ULaSWzxEOMqeOelUW59EQU+7jR76675jxFoWRdCP8Iouo9w1kKkZJTWTpLc9Rh1v
         enAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781296406; x=1781901206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zyvz3ufjy6ivfzF2sNltt0RdDD9Xm6yL7j4zOBoOGug=;
        b=K7jbJugJFr0dxk+wtHdbpoo1ISDYMauddOPV919SjS5iJLyTho1E9wMCAHSwzTz2UU
         KUr3uIEh71SK6ojsla70B5tfibw7vE30EuG5ZDln1g2QWYtB8SJ1vtIpUvQhnAW8EpP1
         y693H4Y6ldPMYkInYCM447HrojqqkDJu1+WaYutmCCVVUsYleWnRiRZDcBgyF8W8cAgt
         Qxt5atrxTRNUDKaG9jB8W4yEfa9jHvvOjP4WAOa80XSWW2GNk9rVp6mEG6wt1jTgsyvx
         wTtEfI9pU/m3mZ703LGAX9EohUNlPnN+Ym4s6qNvPONZsf3y0KgBJ6ZaYwKWPb3EefRW
         mv+g==
X-Forwarded-Encrypted: i=1; AFNElJ+xpRpINCbkpefopg3mz/J51H903AhTIBWOCy62CfIsHgojRVzqVnwpQCG8DJPHccTaBXp3J1WT2gx15A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuYnmkg+KMUWq5ZEOlVAtI/iBzxOxA5AI8/lCtm9igGb51VeIl
	JlSEuF2eVss6Snxz+dy0y8lwFdTuqGcRYqt0o8Dwta6FUKAT7F4llEbm
X-Gm-Gg: Acq92OHm9SNkD99KmCfBtHTnP8dysLTX/gVNjt0XnOojnblHTH8ID1w/sUvdq3iCVnu
	gkwRuyTdysAiP3EeGAepOYoVFPGuD5DdSqquD+fNmKf4NdUEX0yFml6aHifN4boFsQSWYJXvDLo
	ch/GcRFTse/PP4OQW2r04YFYZlqfAHs787l3dtKidQjhHwRbuaq+8tcBJiLnEyQAElnSd1pV25E
	6Q2jku5fojEHbFGBO+9TXhfGxtEVl8I4pIMRgnt9Szie9swWKWLszdW7QJ4Avt7ucYEy5CV61ZG
	pajt3LzqX7SdXfPnpOa1YfWfbmK2BIfBERgzoM9X++BoYzlrC1g8BfWb4fjnEKlhRNkGuMpAY6D
	sLscheieEcIaJlDNAgStZMFecBueAPkAWNQWr/b94JzTi4DpkxofwcL8YJ2XWPOFPeCW4llbRUf
	kthpZUOb2IXsk3qTIofS3wMLu/BJi2x1tYssEsSWzFIX+WHgoONV4XYydKjEOUgrJe+y3M7jijt
	58iZ6tP6SDtLf0664ZN98vut8GQd05A
X-Received: by 2002:a05:6512:acc:b0:5aa:6d0f:d765 with SMTP id 2adb3069b0e04-5ad2db2b0b1mr1339855e87.20.1781296406022;
        Fri, 12 Jun 2026 13:33:26 -0700 (PDT)
Received: from buildhost.darklands.se (h-37-123-143-144.NA.cust.bahnhof.se. [37.123.143.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161e70sm788949e87.5.2026.06.12.13.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:33:25 -0700 (PDT)
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
Subject: [PATCH v3 2/8] alpha: add ARCH_STACKWALK-based stacktrace support
Date: Fri, 12 Jun 2026 22:26:50 +0200
Message-ID: <20260612203006.2265557-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612203006.2265557-1-linmag7@gmail.com>
References: <20260612203006.2265557-1-linmag7@gmail.com>
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

Reviewed-by: Matt Turner <mattst88@gmail.com>
Tested-by: Matt Turner <mattst88@gmail.com>
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


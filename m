Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE75E2C0F8C
	for <linux-alpha@vger.kernel.org>; Fri,  3 Apr 2026 15:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228857; cv=none; b=nb2ZgLjGuZdIOAv6c64s6adwsx/AR2D4yiUGYNfX1HFZ77irZan30HyG+JldCucgmsgAkcm88O4c1OJfkBw8urPfDbUetNPu5E4HB82uMhIUEs8xnUUnEB2YkUzsxbnTYCCdjR3TrefH11pc4iBSUxpz8zDMySaDDHNZd+XuOEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228857; c=relaxed/simple;
	bh=JqzjxrASCrbeWA8VfiletB36YH/9qyaQjLjjEHhVSwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BR6yC3RhH59R41c3M2YL446ZJ6KsDb3HdqwMtYjBgewsImsDIb8+iccK26hjDR3/MbYTnb0G7lm2xsSjsFEhC2J+FUmrhBWEfqCCtzeOJ9Nc0sVTfBxebwQEiH4iiF2sEc2uQGZC8Q3jdDh66SprvugDU5bJPIHXj+gTLg3/S54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfgckIif; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfgckIif"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64e87a81639so1922720d50.0
        for <linux-alpha@vger.kernel.org>; Fri, 03 Apr 2026 08:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228855; x=1775833655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JsQjO3PERcPZEm6Bz+nItD8XASPby72+cIh66p2HJv8=;
        b=YfgckIif0oJWs9ZnYandhXjt7qXGe5BPaQZ/GcN6J+b27S+649oEO9LHJH2nCwj3Cb
         xpNoPobB4ASCz14xND2kLo95kU6CDHQJz5D9Z1LByxNbhEcOocWpd7UCIqzsoS9xWrSB
         zyyDry9MDx196IXeiubcVCrCT7WX9vIvw8g0roU43LhLc3SGRNnr/7VDxHWo7iolgLfp
         xd0/g/1AyzjcwQbmpZyTGdiC5S6Z4jqTZzCbuCnkRbVQA7IFYG3aa2oTJ2XREXFOVlLg
         HwS/yGgEI5FtK4dSP69KpOC9pDgWYuWYqD5Z0PhD98mdfofw54SvtafqqjpVUdXjCv4D
         uTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228855; x=1775833655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsQjO3PERcPZEm6Bz+nItD8XASPby72+cIh66p2HJv8=;
        b=CPL5XERw0wrZ0XvZwBVKWanvoDGo+4Z/hudrINx4JyxKgUK9X0g4nV0NVdcMaMsdqH
         RxtLrhY711pxByjAzzienNq/ubZJiYKzPDZutEC4HzSO7P6JW6olJWU7/Lmgwh9qAzUs
         VvTFFuomt3aDQp3PrrVS8INHtpKtagQGUJGWK842QW+x+UZjxDCxR2+wDc6n3Be926hV
         EfGx2i8sKq6k6+O50h2T9SfOJ79A/3DkU97utUro2xBvFzgi1R+CY6Hyx4pabC+xrDiU
         82rnaODzC40xu0KiqHV5ZbxY+pGz3vHGX+Yp65/8LgjbXwEsCx9STGxbbrPs1yn/cZYw
         l6mQ==
X-Gm-Message-State: AOJu0YwrrIDxFXlqOy+R80bC77j+qKCjRtCmiA5U+Zo+PYMh4QGsTcCj
	Akzhk0n21T8S5x+U/3oKmtguNX1rcuSIVesae3OPP/RHuuf5nghdt2acIVuo7w==
X-Gm-Gg: AeBDieugcQE6mKCtDDfwTf3xQXDetD1Z8MM7X9tlnnEi25xnnBEKK4yhe9oHUaqyx4o
	LsT5Racd0Cn41V4BOdZXVAzluNQ9OKF/JnEGK8JZLnwLQf/NlKQndz/OYbTKR+nqeDgmnobG3Jo
	jm3hctwapua5ejd+/RXcGYgq++rZLwLVrIhigSv3gwaPaxpKX5xMRVbelD1Jm5QmMNfLEKmtYt2
	YCUhzXaW+vJvFnjU/fjDiIqYxZE08e2YzjKlmrmwqMLr8KDUz8cn84ZlHHSfNaPtyEtJgyIr9Zd
	ZgFY8epAOF1VzW6rhYBDMQNXGIWjEOLmU84jdfLq2K7PNlUQmoQz7z+/viQBZZX2Kp4UPj1G1cs
	OY3Wm3YsmUl5Zz4ypuo8p2Z4xb/mcJctKjvJbVpD15O62YlNK3I1FZcNuyXQsR+Yvt2ikUbnOzC
	rh+j3ab18pzqW7wxNn21Q=
X-Received: by 2002:a05:690e:1481:b0:650:3459:5d48 with SMTP id 956f58d0204a3-6504868e0f8mr2852008d50.12.1775228854902;
        Fri, 03 Apr 2026 08:07:34 -0700 (PDT)
Received: from localhost ([76.195.202.134])
        by smtp.gmail.com with UTF8SMTPSA id 956f58d0204a3-6503a828f3csm2554853d50.3.2026.04.03.08.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:07:34 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: Add PTRACE_GETREGSET/PTRACE_SETREGSET support
Date: Fri,  3 Apr 2026 11:06:58 -0400
Message-ID: <20260403150730.490272-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable HAVE_ARCH_TRACEHOOK and implement task_user_regset_view() to
provide regset-based register access on Alpha. This adds support for
PTRACE_GETREGSET and PTRACE_SETREGSET, which are handled by the
generic ptrace_request() path.

Two regsets are defined:
  - REGSET_GENERAL (NT_PRSTATUS): 33 registers (32 GPRs + unique),
    matching the existing elf_gregset_t layout used by dump_elf_thread()
  - REGSET_FPU (NT_PRFPREG): 32 floating-point registers from
    thread_info->fp[]

Also implement the full set of syscall accessor functions in
asm/syscall.h and user_stack_pointer() in asm/ptrace.h, which are
required by the generic PTRACE_GET_SYSCALL_INFO code that
HAVE_ARCH_TRACEHOOK enables.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
This is an implementation of PTRACE_{G,S}ETREGSET using the standard
infrastructure.

 arch/alpha/Kconfig               |   1 +
 arch/alpha/include/asm/ptrace.h  |  12 +++
 arch/alpha/include/asm/syscall.h |  67 ++++++++++++++-
 arch/alpha/kernel/ptrace.c       | 137 +++++++++++++++++++++++++++++++
 4 files changed, 215 insertions(+), 2 deletions(-)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 6c7dbf0adad6..3e61dfaa2ba9 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -14,6 +14,7 @@ config ALPHA
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI
 	select PCI_SYSCALL if PCI
+	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_PAGE_SIZE_8KB
 	select HAVE_PCSPKR_PLATFORM
diff --git ./arch/alpha/include/asm/ptrace.h ./arch/alpha/include/asm/ptrace.h
index 3557ce64ed21..af97a8d3ed5b 100644
--- ./arch/alpha/include/asm/ptrace.h
+++ ./arch/alpha/include/asm/ptrace.h
@@ -4,6 +4,7 @@
 
 #include <uapi/asm/ptrace.h>
 
+#include <asm/thread_info.h>
 
 #define arch_has_single_step()		(1)
 #define user_mode(regs) (((regs)->ps & 8) != 0)
@@ -24,4 +25,15 @@ static inline unsigned long regs_return_value(struct pt_regs *regs)
 	return regs->r0;
 }
 
+/*
+ * The user stack pointer is not stored in pt_regs.  It lives in the
+ * PCB, which sits at the base of the kernel stack (i.e. in thread_info).
+ */
+static inline unsigned long user_stack_pointer(struct pt_regs *regs)
+{
+	struct thread_info *ti =
+		(struct thread_info *)((char *)(regs + 1) - 2 * PAGE_SIZE);
+	return ti->pcb.usp;
+}
+
 #endif
diff --git ./arch/alpha/include/asm/syscall.h ./arch/alpha/include/asm/syscall.h
index f21babaeed85..dab35748ef74 100644
--- ./arch/alpha/include/asm/syscall.h
+++ ./arch/alpha/include/asm/syscall.h
@@ -3,10 +3,31 @@
 #define _ASM_ALPHA_SYSCALL_H
 
 #include <uapi/linux/audit.h>
+#include <linux/sched.h>
+#include <asm/ptrace.h>
 
-static inline int syscall_get_arch(struct task_struct *task)
+static inline int syscall_get_nr(struct task_struct *task,
+				 struct pt_regs *regs)
 {
-	return AUDIT_ARCH_ALPHA;
+	return regs->r0;
+}
+
+static inline void syscall_set_nr(struct task_struct *task,
+				  struct pt_regs *regs, int nr)
+{
+	regs->r0 = nr;
+}
+
+static inline void syscall_rollback(struct task_struct *task,
+				    struct pt_regs *regs)
+{
+	/* Alpha does not save the original syscall number separately. */
+}
+
+static inline long syscall_get_error(struct task_struct *task,
+				     struct pt_regs *regs)
+{
+	return regs->r19 ? regs->r0 : 0;
 }
 
 static inline long syscall_get_return_value(struct task_struct *task,
@@ -15,4 +36,46 @@ static inline long syscall_get_return_value(struct task_struct *task,
 	return regs->r0;
 }
 
+static inline void syscall_set_return_value(struct task_struct *task,
+					    struct pt_regs *regs,
+					    int error, long val)
+{
+	if (error) {
+		regs->r0 = error;
+		regs->r19 = 1;		/* a3: signal error */
+	} else {
+		regs->r0 = val;
+		regs->r19 = 0;		/* a3: no error */
+	}
+}
+
+static inline void syscall_get_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 unsigned long *args)
+{
+	args[0] = regs->r16;		/* a0 */
+	args[1] = regs->r17;		/* a1 */
+	args[2] = regs->r18;		/* a2 */
+	args[3] = regs->r19;		/* a3 */
+	args[4] = regs->r20;		/* a4 */
+	args[5] = regs->r21;		/* a5 */
+}
+
+static inline void syscall_set_arguments(struct task_struct *task,
+					 struct pt_regs *regs,
+					 const unsigned long *args)
+{
+	regs->r16 = args[0];		/* a0 */
+	regs->r17 = args[1];		/* a1 */
+	regs->r18 = args[2];		/* a2 */
+	regs->r19 = args[3];		/* a3 */
+	regs->r20 = args[4];		/* a4 */
+	regs->r21 = args[5];		/* a5 */
+}
+
+static inline int syscall_get_arch(struct task_struct *task)
+{
+	return AUDIT_ARCH_ALPHA;
+}
+
 #endif	/* _ASM_ALPHA_SYSCALL_H */
diff --git ./arch/alpha/kernel/ptrace.c ./arch/alpha/kernel/ptrace.c
index fde4c68e7a0b..f1a10c4112e7 100644
--- ./arch/alpha/kernel/ptrace.c
+++ ./arch/alpha/kernel/ptrace.c
@@ -12,10 +12,12 @@
 #include <linux/smp.h>
 #include <linux/errno.h>
 #include <linux/ptrace.h>
+#include <linux/regset.h>
 #include <linux/user.h>
 #include <linux/security.h>
 #include <linux/signal.h>
 #include <linux/audit.h>
+#include <linux/elf.h>
 
 #include <linux/uaccess.h>
 #include <asm/fpu.h>
@@ -274,6 +276,141 @@ void ptrace_disable(struct task_struct *child)
 	user_disable_single_step(child);
 }
 
+/*
+ * Get the general registers from a task.
+ * Follows the elf_gregset_t layout: 32 GPRs + unique (replacing PS).
+ */
+static int genregs_get(struct task_struct *target,
+		       const struct user_regset *regset,
+		       struct membuf to)
+{
+	elf_gregset_t gregs;
+
+	dump_elf_thread(gregs, task_pt_regs(target),
+			task_thread_info(target));
+	return membuf_write(&to, &gregs, sizeof(gregs));
+}
+
+/*
+ * Set the general registers for a task.
+ */
+static int genregs_set(struct task_struct *target,
+		       const struct user_regset *regset,
+		       unsigned int pos, unsigned int count,
+		       const void *kbuf, const void __user *ubuf)
+{
+	elf_gregset_t gregs;
+	struct pt_regs *regs = task_pt_regs(target);
+	struct switch_stack *sw = ((struct switch_stack *)regs) - 1;
+	struct thread_info *ti = task_thread_info(target);
+	int ret;
+
+	/* Start with the current register values. */
+	dump_elf_thread(gregs, regs, ti);
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				 &gregs, 0, sizeof(gregs));
+	if (ret)
+		return ret;
+
+	/* Apply the register values back. */
+	regs->r0  = gregs[0];
+	regs->r1  = gregs[1];
+	regs->r2  = gregs[2];
+	regs->r3  = gregs[3];
+	regs->r4  = gregs[4];
+	regs->r5  = gregs[5];
+	regs->r6  = gregs[6];
+	regs->r7  = gregs[7];
+	regs->r8  = gregs[8];
+	sw->r9    = gregs[9];
+	sw->r10   = gregs[10];
+	sw->r11   = gregs[11];
+	sw->r12   = gregs[12];
+	sw->r13   = gregs[13];
+	sw->r14   = gregs[14];
+	sw->r15   = gregs[15];
+	regs->r16 = gregs[16];
+	regs->r17 = gregs[17];
+	regs->r18 = gregs[18];
+	regs->r19 = gregs[19];
+	regs->r20 = gregs[20];
+	regs->r21 = gregs[21];
+	regs->r22 = gregs[22];
+	regs->r23 = gregs[23];
+	regs->r24 = gregs[24];
+	regs->r25 = gregs[25];
+	regs->r26 = gregs[26];
+	regs->r27 = gregs[27];
+	regs->r28 = gregs[28];
+	regs->gp  = gregs[29];
+	ti->pcb.usp = gregs[30];
+	regs->pc  = gregs[31];
+	ti->pcb.unique = gregs[32];
+
+	return 0;
+}
+
+/*
+ * Get the floating-point registers from a task.
+ */
+static int fpregs_get(struct task_struct *target,
+		      const struct user_regset *regset,
+		      struct membuf to)
+{
+	return membuf_write(&to, task_thread_info(target)->fp,
+			    ELF_NFPREG * sizeof(elf_fpreg_t));
+}
+
+/*
+ * Set the floating-point registers for a task.
+ */
+static int fpregs_set(struct task_struct *target,
+		      const struct user_regset *regset,
+		      unsigned int pos, unsigned int count,
+		      const void *kbuf, const void __user *ubuf)
+{
+	return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				  task_thread_info(target)->fp,
+				  0, ELF_NFPREG * sizeof(elf_fpreg_t));
+}
+
+enum alpha_regset {
+	REGSET_GENERAL,
+	REGSET_FPU,
+};
+
+static const struct user_regset alpha_regsets[] = {
+	[REGSET_GENERAL] = {
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
+		.n = ELF_NGREG,
+		.size = sizeof(elf_greg_t),
+		.align = sizeof(elf_greg_t),
+		.regset_get = genregs_get,
+		.set = genregs_set,
+	},
+	[REGSET_FPU] = {
+		USER_REGSET_NOTE_TYPE(PRFPREG),
+		.n = ELF_NFPREG,
+		.size = sizeof(elf_fpreg_t),
+		.align = sizeof(elf_fpreg_t),
+		.regset_get = fpregs_get,
+		.set = fpregs_set,
+	},
+};
+
+static const struct user_regset_view user_alpha_view = {
+	.name = "alpha",
+	.e_machine = ELF_ARCH,
+	.regsets = alpha_regsets,
+	.n = ARRAY_SIZE(alpha_regsets),
+};
+
+const struct user_regset_view *task_user_regset_view(struct task_struct *task)
+{
+	return &user_alpha_view;
+}
+
 long arch_ptrace(struct task_struct *child, long request,
 		 unsigned long addr, unsigned long data)
 {
-- 
2.52.0


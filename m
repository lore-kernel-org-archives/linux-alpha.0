Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC8F4CB8C6
	for <linux-alpha@vger.kernel.org>; Fri,  4 Sep 2026 16:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539086; cv=none; b=pymEosshv/3I0ZH/hYEEzHtHXAFlXXld9SF4GIoXyAPfAcbOtqhILbSDon+8SXCQPezREIuYyATJ5QGtob7ium1M3y5QvMZR75w2cc1ls7xoqPti8U21Mly3AV+Drw2XRHFCJLVFUJCdZAmXFwvHVh/fPn9LDjyCjhzxKXKq6cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539086; c=relaxed/simple;
	bh=xMVXOI/eqKNjl5OgqifxKtu/J24qZjnmemKOPlmR2s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4pKOChAx5BthcqedDsEQFbkeQ8ewsWbaQZZyjlgHjIRdk7KdehTfehc8Pnm3/NC5claUGrYxyIjdW8ZBQbQIcW8jkSi+RNGTFIS4a6KELlbmfMyUqB3Oe7vEZN5i5WkYDOvSt+06lYTPWPlUlM+DhRZbDUanBordbuIOhq7Rsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuI0O6Ju; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuI0O6Ju"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1712a04ddaso205973366b.2
        for <linux-alpha@vger.kernel.org>; Fri, 04 Sep 2026 09:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539083; x=1789143883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xhz5lG8Gdx41rhto7ZSmcPEqEZiPjxJkts6gS3A8P8=;
        b=RuI0O6Ju3ylG5/lnGZ7ud7YiqP0tGb8bHTZmsmnYWL9Z1xLG2FXqu0nkA8GwaELkIU
         j/oHg2d2wBzaOQl2fw9kTESeqk0qKrIhSVCkqPOQHC8+W9j9pN+NqeQYh/JnV3YtxTpL
         OF+JCtGp4UXJBb+ehb7YBDYFPW3lIuzkoHCLBwmzWObxlp5Tw+dbhABJ/sekbMzrFyod
         7T8+S2w4odE12zxYMra9oXzlRMiNX0cczn5SXWIU3yOzxhhmDv0o2mhsY7YLdvyr58v5
         Ld+BTVJvBfvlsnr08ne11QNg0E3Q9ia2o8X67D4/VIAgVwvagBUBgUE1DTA4vEQ5GTLn
         aIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539083; x=1789143883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2xhz5lG8Gdx41rhto7ZSmcPEqEZiPjxJkts6gS3A8P8=;
        b=VEHRH58u9hYYEwiBAJppeZhnA/NR12SijhtQZNDOoRteR518ziNMO2PnYuUryVAYtR
         aZ159FfCLp+ypH62wtZrzFwlGho2aaNlx9l3J4hLS93P1jOdi/Bu+PT8gKxBrT9rTX4M
         4iJk2DF7Wu9x96BQzaKCj9G+3CBes+grpjxmtlUAYipYncoYzjmtL4OX8i2KBqb4tiT2
         rspa1g9yLPB2MpTZs3zMctL5Yegb4uny72qP0rNrwKTRVzLYnEfn6ZnAm6zgAUDbxasl
         7f8S4paz1UzuiZh1L5d1HXw0sK6g7IHX1X/tXGf5HHBw++E6irDnz7QU/5OXooS9Twuk
         R60Q==
X-Forwarded-Encrypted: i=1; AKwUvBzco+9dhOVkpUI4otUbWrlJ5ge55flbFd/9X2CjUGYVHskW+R0uaSiymYUOlB4ghff4E/5apbLh1R/vvg==@vger.kernel.org
X-Gm-Message-State: AFuF++npwA95T2GxK9/OixB9hnUTHXu6R/50GzjnzygwYjPHJZMDkDCC
	9oS0YhOK+mfsQ2tm8rdhjqGg6/zeG4GAK3bwoU2oXY3zutNTqEeIGaZrJdmLPqY6
X-Gm-Gg: AYBFou3/0EkiLXpThU5utdaLPS1mRzxw7+WPiWYkXOM2/f1zhDdB4GvQ1ncJL2dNtZY
	iHIPqm8iD9uCen9p1Sg6jIbumoHOfOHIweF/rTZ3YwuUmQJlzC6WSpREHlwMvPg3G7xvyhKDuqC
	u0l5E+aoKsus1FPjxvogzJKpJF3hcNT2Y79KpynJ7OlA/vE5NSUsjxObUPxdZLoL5SEEgaQtxoC
	JIUaMSfnCjDDlN+meQil6ItZ49BDENTKzlRUMk/L/oDBEKzsnNmJMDkdtrdSM3jUvqBj8tkIH6G
	iMICUffy9IdcMYbPMIqRhW1C8e0qAbVlPIbV8Xe5mwbqJ3y/72cdO1giD+3NpNDVVaFgDCvkAZO
	axZ516HK+HUpssKrr3mixGdke7NkBExLsafhba2tRpRXYP364B2B61NN/KA94f8/PPjCx5l2NZ3
	sHFB8pzw8TsAK3jtJYNdqro87jFMo0sAlzgO4QkN2V9wN56pxj13bncaEC8C1j0+lis9il4wc7a
	FEdBQw0Vn0WvOzCFnlxihDR3vnqlzU=
X-Received: by 2002:a17:907:948f:b0:c25:895c:62dc with SMTP id a640c23a62f3a-c260c9e2465mr289293266b.14.1788539082694;
        Fri, 04 Sep 2026 09:24:42 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8bacsm132556766b.17.2026.09.04.09.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:24:42 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 3/3] alpha: load the MMU context when switch_mm() switches the current task
Date: Fri,  4 Sep 2026 18:23:31 +0200
Message-ID: <20260904162424.376504-4-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904162424.376504-1-linmag7@gmail.com>
References: <20260904162424.376504-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ev5_switch_mm() only prepares the incoming PCB. The context is installed
by PAL_swpctx, which alpha_switch_to() issues against that PCB on the way
out of the scheduler.

Two callers reach switch_mm_irqs_off() without going through
alpha_switch_to(): kthread_use_mm(), which borrows an mm for the current
kernel thread, and sched_force_init_mm() on the CPU-hotplug teardown path.
Neither explicitly loads the context, so the task can carry on running
under whatever was loaded before while current->mm says otherwise. Its
user accesses can therefore resolve in the wrong address space, and
because do_page_fault() resolves faults against current->mm without
reloading, a fault taken that way repeats indefinitely.

sched_force_init_mm() needs CONFIG_HOTPLUG_CPU, which alpha does not
support, so kthread_use_mm() is the only one of the two reachable in
practice; the fix below tests the caller's identity rather than
special-casing either one.

The scheduler passes the incoming task, which is not current until
alpha_switch_to() runs; both direct callers pass current. Test for that
and load the context the way activate_mm() does. Both hold interrupts
disabled across switch_mm_irqs_off(), so this completes before any
shootdown can be taken and needs no asn_lock handshake.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/mmu_context.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/asm/mmu_context.h
index a829f557396d..caa6a9c4e3ca 100644
--- a/arch/alpha/include/asm/mmu_context.h
+++ b/arch/alpha/include/asm/mmu_context.h
@@ -130,6 +130,8 @@ __get_new_mm_context(struct mm_struct *mm, long cpu)
 	return next;
 }
 
+extern void __load_new_mm_context(struct mm_struct *);
+
 __EXTERN_INLINE void
 ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	      struct task_struct *next)
@@ -139,6 +141,12 @@ ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	unsigned long mmc;
 	long cpu = smp_processor_id();
 
+	/* A direct switch never reaches alpha_switch_to(); load it here.  */
+	if (next == current) {
+		__load_new_mm_context(next_mm);
+		return;
+	}
+
 #ifdef CONFIG_SMP
 	cpu_data[cpu].asn_lock = 1;
 	barrier();
@@ -160,7 +168,6 @@ ev5_switch_mm(struct mm_struct *prev_mm, struct mm_struct *next_mm,
 	task_thread_info(next)->pcb.asn = mmc & HARDWARE_ASN_MASK;
 }
 
-extern void __load_new_mm_context(struct mm_struct *);
 asmlinkage void do_page_fault(unsigned long address, unsigned long mmcsr,
 			      long cause, struct pt_regs *regs);
 
-- 
2.43.0


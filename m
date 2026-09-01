Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD4347ACDA
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277905; cv=none; b=gTicNZVqegg3A49eHlBJL0QuBzqS4iMN93M4gyW/1jbDGzm5olGK65DY6WRI65UnmwOjqZSRqAKyrATqXv/2HY72kZ+Rx1I98dKLiY4q+6Z2PqpapfIJI2UJEzuLhZRm2d8NRBNYeIcNYqEq70AfkYdH22Qm0HYFvdA2LHuxe+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277905; c=relaxed/simple;
	bh=0l/w5tN2A38HPGlHiLwd7qatVD3lZl65FFQ5OYFdE2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ozK2Rn3BhsIlhycQhmy4rH8E7MMLm82nz8lbEAqzHEo64BOErvHD+0MubNNASWLB5SYRXfhOxzmn5YhCmnWndidYgpd0E/ovkM7lYbjq6R3Zl3KjJwxj2STGiVf3hkScJMd5FeXzeRip/L0TIDV8j/kmQxMs7NjL2VkFZlNFxak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tj15evlm; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tj15evlm"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-857ff9fef54so850667b3.1
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277903; x=1788882703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVlIvJYsDfLaLhbF9XSItAArvjEznVn+8uAWoRZuxY8=;
        b=Tj15evlmhCHCpTR8ULoabpzFqh14W/JKgIP/ESKyAYtD7olyENjzcqKQkO0WTUXpIY
         1Cx4KtMLzZWUJFgmNvnb8pZjEFQoq3nwxJLgwgrExjWeYAfmb/2KvRszfoB0Qfw2plYX
         dFmN1jg80kyuHwtJBPo+5ZaGWpRghAmSR35JcS4vPBUYFfMzPZuQK6gdeseI2DVG1dYX
         rdTejx5oFlARoJsVq46GmVB0cHtptS877moss43FK/y6qjwcCUdN+6u9mUD47r6Gleh8
         eXs2LXQzDaJY9o/gV4PEUYXIQL7AGlKpq6EzVx0mDgI4M7yKt2/2fZcsV9V9R/hTepv/
         17lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277903; x=1788882703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XVlIvJYsDfLaLhbF9XSItAArvjEznVn+8uAWoRZuxY8=;
        b=oMuqGT1qaCcGNunv1UW3nvDi4UMXl53B1EseSB3STgJAu9kxH5nPJslzNEwWKg/VdJ
         ZzNDp91g5pgA2/ZEEZ3/YrEtfhFDQK72cMCcrCAApr1AfoQpIYa504MKZYY5q9W2uL2v
         /SdGSYc0u7A4vdQEeWZqvbR6yX9r4vz4QJLXdLX7Xc2Kp4TknRejnSRGNcH6JVMJEB+w
         pq4l1onzjwzXw0Ku41KSwkszhdkOMcVahD1Nz+Scv1Yr6Uc26PHozrv/Zgmmm639XvFg
         nITdJEFhxBrUM/xbpoD+YZ6ge0Ok1krJ3kIlo+FY+7dWHI6/0tfXbrr7ilJjNHWHTsaz
         Rd1w==
X-Gm-Message-State: AFuF++ktd67I76vpFJz1fjtbuba1yfQzsQ9RN/NKTbW/iQdVLRWCdKB6
	fMPN8jJxh35Vzid8wdr0Vn1vWfv5mEU9NcWdrLaH3bHf/cZbRXK3iOlbgImHhA==
X-Gm-Gg: AYBFou2giJpobuZ4AfEZtKETpLepbiJ99StV3b57HSjyWaN7TNgEwegP0x3OFxAjRTq
	iuIsWSOM/RMdYH/HWA6Zzr76BBCgDOhHBtTGT49j4NAlFRCaLvV4qek26LdA4LACPZvkQtseSTM
	yWxztc1v+MxyRB8rHaiedOT9ZdSN89NvVIZfIgrFq7HAwLzsVsRKA0KX6quSgEyf8bzQbi2OQ/x
	CpI0OhZNOJewcdblISourQgtWsv4MVp42luX5XOS/6RkHqfikmpzI2rt7DI3ouhZopdtdSFA1gP
	ZHs2cc/Pu8kGomR+fzjNUng7Tu5BgGiKFPw1ieT41bct8n6TGxsBKj+B/3J3QMwrmYcfwnaX3cI
	4pAF1R5DJY41abeF9QTtV1zIfbWJxMgsGo1LPS8+NuOmoDTl+lZYcmW/3IqjPZ+A5eOZp8Qo6ng
	4khZlfsn7wa0AJ8ADxBFkPOnuOTtPP3t03eCIZ6bNAfJRU/GJdG8BKcDXXGOkoXZWrua+sZMBUk
	oZ6n/4O62jZxTPL8G39UiKBRFs0wsjbY17ju/7CpM2zAEUIZv0=
X-Received: by 2002:a05:690c:93:b0:862:65f4:c8bb with SMTP id 00721157ae682-86265f4cb64mr81586877b3.3.1788277903439;
        Tue, 01 Sep 2026 08:51:43 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e58666e15sm77368977b3.0.2026.09.01.08.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:41 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/24] alpha: select SYSCTL_EXCEPTION_TRACE
Date: Tue,  1 Sep 2026 11:50:31 -0400
Message-ID: <ea0081603ea4f745e7c10895e83a1cfb4e80baaa.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Report unhandled user faults the way other architectures do, and hook up
the debug.exception-trace sysctl that controls the reporting.

The message gives the faulting address, the PC and the user stack
pointer, and is rate limited.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig    |  1 +
 arch/alpha/mm/fault.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index c4b4a9b8d770..4c60c442207c 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -59,6 +59,7 @@ config ALPHA
 	select MMU_GATHER_NO_RANGE
 	select MMU_GATHER_RCU_TABLE_FREE
 	select SPARSEMEM_EXTREME if SPARSEMEM
+	select SYSCTL_EXCEPTION_TRACE
 	select ZONE_DMA
 	select TRACE_IRQFLAGS_SUPPORT
 	select ARCH_WANT_FRAME_POINTERS
diff --git ./arch/alpha/mm/fault.c ./arch/alpha/mm/fault.c
index a9816bbc9f34..dfe427d93072 100644
--- ./arch/alpha/mm/fault.c
+++ ./arch/alpha/mm/fault.c
@@ -27,8 +27,32 @@
 #include <linux/uaccess.h>
 #include <linux/perf_event.h>
 
+#include <asm/pal.h>
+
 extern void die_if_kernel(char *,struct pt_regs *,long, unsigned long *);
 
+int show_unhandled_signals = 1;
+
+static void
+show_signal_msg(struct pt_regs *regs, unsigned long address, int signo,
+		const char *desc)
+{
+	const char *level;
+
+	if (!show_unhandled_signals || !unhandled_signal(current, signo))
+		return;
+	if (!printk_ratelimit())
+		return;
+
+	/* Losing init is fatal, so shout about it.  */
+	level = task_pid_nr(current) > 1 ? KERN_INFO : KERN_EMERG;
+
+	printk("%s%s[%d]: %s at %016lx pc %016lx sp %016lx\n",
+	       level, current->comm, task_pid_nr(current), desc,
+	       address, regs->pc, rdusp());
+	print_vma_addr(KERN_CONT "  in ", regs->pc);
+	printk(KERN_CONT "\n");
+}
 
 /*
  * Force a new ASN for a task.
@@ -217,12 +241,17 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 	mmap_read_unlock(mm);
 	/* Send a sigbus, regardless of whether we were in kernel
 	   or user mode.  */
+	if (user_mode(regs))
+		show_signal_msg(regs, address, SIGBUS, "bus error");
 	force_sig_fault(SIGBUS, BUS_ADRERR, (void __user *) address);
 	if (!user_mode(regs))
 		goto no_context;
 	return;
 
  do_sigsegv:
+	show_signal_msg(regs, address, SIGSEGV,
+			si_code == SEGV_MAPERR ? "unmapped access"
+					       : "access violation");
 	force_sig_fault(SIGSEGV, si_code, (void __user *) address);
 	return;
 
-- 
2.54.0


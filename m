Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1103876BE
	for <linux-alpha@vger.kernel.org>; Sat, 17 Oct 2026 01:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792202165; cv=none; b=LxiBEKWuZkaQHnVn8/M0CbyT0oDqsDGNnxLePH4kTsZpO5P68XFzy+aQxdIr5JxzkO/fVIdNwx2kLbKYNYo1QohrKcqRJpDYaQ+TaLc4HIOG+phUSWsG7QJHC+oKXv3TD168CIf14yDWW8Z75kpTRlE3Gpp3PKUOZ0NqqQz2Wqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792202165; c=relaxed/simple;
	bh=3hBEoYmujIN/lIM+LWmpcdreauHJLGhIJOlga1pFDNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F4G8ooum+vk8ZrysLlqOexxMOdj4hZLX1rEqJSRV+Idokb6G4AAjZH+AUAlFraJ71IE3iPuplhz6AFBis8Tho/R+KUQ1jeMe/NSjLtDDdbJ1fR9PTnN6nKx0R5iDmY9weEacT8snXdpnHl2qQ0aCuPfxIvmeOOQuDM5Cy/7iAwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnZxd6lu; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnZxd6lu"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-679aeeddc6bso529907d50.2
        for <linux-alpha@vger.kernel.org>; Fri, 16 Oct 2026 18:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792202162; x=1792806962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8OpYwKY4k0JzilSveCfUGKhXNAVuzUj6LeYu6BiAQs=;
        b=MnZxd6lu/Fga/o9/N50ER54dQZKvDC1oQr+qaafebeN/JCYaalHT+UFFycxYn9LM2X
         bpkNJw6sAeYCEWpHooBPoQFlT5+01jdXZP1s5AUBCa87Tw7IbalHyvzA3ekDQ3K+QWvf
         aa3pZ9OpI50KUJsL+8/lPO0Huw62q2hsEGwh1whclpLz1bdhJIxyEbvff3YoeWqw6QjV
         l3cYZdgMfDwLp/4a2VsQRg0fC3z7amY0GbfGwOeKLldJif5H83Za+tBhX7i4UqS8pSKE
         D/WRQNmhSDQQD2LGX542DugeFPQhPBmtHGYVlHq91yOM3wKuWHtHaY7vnyGYicBxJTA3
         C8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792202162; x=1792806962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8OpYwKY4k0JzilSveCfUGKhXNAVuzUj6LeYu6BiAQs=;
        b=QznyfJBw+ZUh0W4skjgVdV1fRKYO+PHY2whIr3kgHgMEPxeNQBdjo1XTNxutgoJdOG
         d0uE7zNWUNrz43jeMeNGbjh175/QR7STwpp6/fcJLSFclpfQ2mNhXdspXW2hrtjjXNMH
         wP0AQHZ4pkufx6FogoaqgFaZSOVtBgOqkSbfFREwdREet6+4UVUKQBFeTyU2w0t2G0Fj
         YMNKXBVOS1PQcYG27XydG87OiNlXKwF8rK9eSpBFV7VevqmS0sERcjBTheOKQTICYKDL
         slFbcrxaAkh/ebd+PLPoWqiUTikDpxXkGy2uiZNfdOHkBe2RezeaSdgIkXIQy+nAqT+I
         uvMg==
X-Gm-Message-State: AFq9FYLuIgUAKfeiLoLuuFPOgT6K+wwA4Wssqs6pT1tohxDda87vAv/y
	8HfZKjYAbyy+2ZswGjIkNElRgtUA9yHQ+9CDbRECmJJU4jNew81f7WqL
X-Gm-Gg: AYBFou2iVmS9MinpEPeZeVBImJTGOsbc+pQKbouTVEF0LOO17jtvKLK5LZYCJw9b4OS
	vo1+u7g8Zal0SlS5/HTFuY0PbBMQ6+VyMWOw1fhaAgwCAqItj1/hDNGvGuGx3VbDfuqCvkHUs89
	ATwH3thoIiM9HUEHpJmmHkrTriEnGGvVaX6b+2///cdNPaOwz/XJ/Ui/QjAtQRKqJbmNYgocpsW
	XuDIVLTq9Xe5nMDilV1lb6qDyvU1kJ/M25HfnBrsq1262LEGMZ1X5PBUnPhsYF/cll6mmh3kLGt
	WcpvpURjPtYQU0FGaNfEO7RgWsNhM/ofTmoSsu3IZV02bXUSN/6d5vJtB+xMlXRoStpDWvUkvrE
	Gj9PpFUXtYlkW0dkXiQjxDlEgnB85ph+F0h/JD/udkHcBNu80xsyz/nspEVBcRgMJjmALjEU6gZ
	E70toW/TUop1ORVQTw4B6kfQrL4PhstJUOyYkauxOuu6ugk3bNW+3Uz631AA9INrqOtgFQw4Yc8
	ktcET8N8CT3wRkExtGZsNv90DumlPU92QCeqkEC2eYP0c+TOo7BM2pu8DKwTxZznoHK4MFU9k3I
	43SmRx6UUbgCnrt3vV43z/2y/3P1
X-Received: by 2002:a05:690c:c386:b0:8b0:a352:f978 with SMTP id 00721157ae682-8b0f2072ca1mr5509447b3.4.1792202162390;
        Fri, 16 Oct 2026 18:56:02 -0700 (PDT)
Received: from localhost (108-93-236-139.lightspeed.chtnsc.sbcglobal.net. [108.93.236.139])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e5885546sm16379857b3.16.2026.10.16.18.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:56:00 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 16 Oct 2026 21:55:47 -0400
Subject: [PATCH v2 1/5] alpha: fix stale user_stack_pointer()
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-alpha-perf-regs-v3-v2-1-17654742226a@gmail.com>
References: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com>
In-Reply-To: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Ian Rogers <irogers@google.com>, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2375; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=3hBEoYmujIN/lIM+LWmpcdreauHJLGhIJOlga1pFDNU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIuXV18W33zl227d0zLODlNyiLth9GZ36qJfc9uvru67
 dGWLZ+2POn4yMIgxsUwU0yRJW69Isusth1LfU5L/4KZw8oEMkRapIEBCFgY+HIT80qNdIz0TLUN
 9QyBDB2jeIicHoNGZnFxaWqRblpBkUNefkliSWZ+XrFefkFqXkF6gV5aZlpJRkZ+UXEq0Ai9vNQ
 SU1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dLcwYuTgGYazo+MzK0yKU0pR
 2aXPAhoNPn9MdCvuvP02b2qk8r+i/+5tIW9SnODH94uyZ9Wnv3S9jbNy1xAVav9y/vSs488rxTu
 2m62rr1LcXsAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

PALcode keeps the user stack pointer in the PCB, not the trap frame, so
pt_regs->usp is only valid where entry code stores it: entSys,
do_entArith() and do_entIF(). Interrupts, page faults and unaligned
traps leave it stale, and ptrace and /proc/<pid>/syscall read it
through user_stack_pointer().

A user-mode pt_regs is at the top of its task's stack, so find the
thread_info from it and use rdusp() for current or pcb.usp otherwise,
as KSTK_ESP() and the regset code already do.

Fixes: 8a2857bc2b30 ("alpha: enable regset-based ptrace and core dumps")
Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Acked-by: Ian Rogers <irogers@google.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/ptrace.h |  7 +------
 arch/alpha/kernel/ptrace.c      | 12 ++++++++++++
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptrace.h
index 430e8dc27ff7..45d1229344b6 100644
--- a/arch/alpha/include/asm/ptrace.h
+++ b/arch/alpha/include/asm/ptrace.h
@@ -26,12 +26,7 @@ static inline unsigned long regs_return_value(struct pt_regs *regs)
 	return regs->r0;
 }
 
-/* Helpers for working with the user stack pointer */
-static inline unsigned long user_stack_pointer(struct pt_regs *regs)
-{
-	/* Valid for user-mode regs */
-	return regs->usp;
-}
+unsigned long user_stack_pointer(struct pt_regs *regs);
 
 static __always_inline bool regs_irqs_disabled(struct pt_regs *regs)
 {
diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
index e1d8c2f69688..dba7e9905cfa 100644
--- a/arch/alpha/kernel/ptrace.c
+++ b/arch/alpha/kernel/ptrace.c
@@ -440,6 +440,18 @@ ptrace_cancel_bpt(struct task_struct * child)
 	return (nsaved != 0);
 }
 
+/*
+ * PALcode keeps the user stack pointer in the PCB, not the trap frame.
+ * A user-mode pt_regs sits at the top of its task's stack, so the
+ * thread_info is at the base.
+ */
+unsigned long user_stack_pointer(struct pt_regs *regs)
+{
+	struct thread_info *ti = (void *)((unsigned long)regs & -THREAD_SIZE);
+
+	return ti == current_thread_info() ? rdusp() : ti->pcb.usp;
+}
+
 void user_enable_single_step(struct task_struct *child)
 {
 	/* Mark single stepping.  */

-- 
2.55.0


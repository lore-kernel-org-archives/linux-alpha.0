Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98282FE56F
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 20:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791749816; cv=none; b=tOlJNgZMVxt0tu3thVXZJkoNwyXi98HMoXhYIdwVIPv7LdcAL52TgfdDKkVjVnRq7Pk+1LtpcUF6WwC2rSGrfObg5C9vughMEo5383VHVdJmqfg9euFbwZKcxrjJlxQtMXa9fN4xepdYl/T0LhX06AaCkEr6jzFUeeTQKJJqPi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791749816; c=relaxed/simple;
	bh=1Lydj388n5XJbUniv4M5YY8iR7+Rzly+NPlrwZecqFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RnLUrlcJ/pxXc+5DHV8s8qFqfLnu8u2IHDuAkNIlZ/1fboCI/qnvdNR5GcfYRfZ8tjALcPT+xiXwHOxQmdv9feI2cJ8ea765WqD2vKvKzuK7qVMxN1vVwac7yKDYBUTtIjgY2P4t+CeAWDEiIC98tgiDml/xJspME9HJjpS3Dhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXkxy83I; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXkxy83I"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6790844c9b0so778165d50.2
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 13:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791749810; x=1792354610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DuWRZ9OkHcwAnsa3x0jt7TLuHUCTDQyxo4PE4uuz/V4=;
        b=iXkxy83IEtVeQzvVu8gj98gIB1Rr9MlyRGotjhXR96QgnrKVfhLiSBtQmEJIwKN1OW
         qrd/5CBTgYGctiZxWWfRIuzJYZ74GHLl04EORtdGVNG47rPOMU6VxWwzec5OOOjkANjN
         AD2ibGTKCuSrl19uSj0gmoeoJhVXySIVM+6waFGhlnilMDqf9qPMoZQPJEfiB9ha8ULF
         c36e6LzERD97tFsCUPFC6yWRmaN3X/Zp4jY0MMgN/f2U3rBVF2zQdmHmTX2cehqjfdcK
         m59fPTTD70qOlJg4M7y2NQCsLbYisPMQc6fmgrwKBgHMo7Jc9VMOnDkfR2kfbJDh6jYV
         V2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791749810; x=1792354610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DuWRZ9OkHcwAnsa3x0jt7TLuHUCTDQyxo4PE4uuz/V4=;
        b=UvzaM5hpGz2GQXHnsMThy1Hl4K2+v0WPu4T+ghFY+Y92RQF6QDinJ4KZQ+FubSPzNR
         bk/tO4K+BK5mXzshkNgpYLF5+jsgkW1nOZBWsZULVpXTffIh2f36dyIgT865Fiy2IwTT
         +g8jNyLB8Fer2m3ENzWhKrw2Om+Gcnsk2cK+IXs1B4JLWhl1uniVdfyN6K60sZy7I9vF
         C+kYcD7V4rJn2Z0hoJfUPNAgs18Xb3R6fxq/XZNUfbsuRac/IxcxoOWlVfkefQN5JvLf
         KsZr7jQKR9HkpCerWquuVQswvkrKwSfL9sXwQ6micaNTZGXnsvrxiXAmVEVG5Y8zLTnt
         7AZw==
X-Gm-Message-State: AFq9FYJbZzMaszJZUWsbxIgunbDd+yh7wg4IgG7ggzN0YE7KWOgRwbOU
	NRg/f9OpY+IEikHM/Ln0n30d3l+xzT+RCZYYpqlQ6HRONV0yYFRo1+pHl9PZmQDl
X-Gm-Gg: AYBFou0Jbpi39PR6l1nVi9lvnSf0VX2buE4cQ4H71Xx5jqxBcQArH5rkRlgI6g9vA5l
	4uayJ3PI8+K4LXJ3xZ1WQX3xRm97FjMmL5P1b3/JKIchEe8GN+B2SJ2oxOxUt31BR98TfSvcmi2
	HMhbMY2oTsvJ+ZdEI3WLygYhV+1eWoKro6tvIAbn210YKn66u5W/tRb+JEZfMeVK5NZ4ctHSrSD
	vkL+l/JCPxZPacTJcQ/fIf0c9fSil8RCx1Aj3NydU9cH4+LkHva4eqVS1c2Rjz2hRkXcr04MuD9
	+N9dI/iDC6jlfD0xtRGWaxTcZMWgR+WtOjC33eol4PnM7+u48vhJfy3R7QRPRFYPe4bmoA8Pxga
	UkW7gKMaLnOeJKglhtU0aQjcXvpGCMKuR0y/TLUoViz2YyNfWdBMYRwwjDzl6KbAF7DbHihYuXF
	v70aLeg3DfHs9aCpcUqpcDH9y6FyMp0+fLp6htuHoErHK+krW60szvQeDeCQ59tOn+eaA1eLzEG
	J+743tHfvzchyNxp1O/k2SFp0jS4mCU3DOW4NdqKxXJEr9LLzXPQghd
X-Received: by 2002:a05:690e:4802:b0:676:858d:35c5 with SMTP id 956f58d0204a3-679369f24b8mr1607590d50.55.1791749810536;
        Sun, 11 Oct 2026 13:16:50 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679356d5a8esm2948947d50.18.2026.10.11.13.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:16:49 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 11 Oct 2026 16:16:42 -0400
Subject: [PATCH 2/4] alpha: stop storing the user stack pointer in pt_regs
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-alpha-perf-regs-v3-v1-2-eaa625a39712@gmail.com>
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3034; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=1Lydj388n5XJbUniv4M5YY8iR7+Rzly+NPlrwZecqFg=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJOv1tlc755ccz9+oJW1ebH3/5eZmy6XHVgw/JjFdYqF
 96GBnYs6/jIwiDGxTBTTJElbr0iy6y2HUt9Tkv/gpnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DIEMHaN4iJweg0ZmcXFpapFuWkGRQ15+SWJJZn5esV5+QWpeQXqBXlpmWklGRn5RcSrQCL281BJ
 TV0c3I0MDE0tHCzMnC0dTE2dnJ0MnN0dHZ1cnI0tzEwNnS0cTV0tzBi5OAZhrzm9iZJi6dMdci8
 U6RRYygc/1K73uPN3mbbKXaeoRge73qz/ZmpQzMjzJlDJgnvXasKQj5HHGlkftd5bdPdK3Ob75v
 sPm5zsTtVkA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Nothing reads pt_regs->usp now that user_stack_pointer() uses the PCB.
Drop the stores, which saves a PAL_rdusp call on every syscall, and
give the field back its old name.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/uapi/asm/ptrace.h | 2 +-
 arch/alpha/kernel/asm-offsets.c      | 1 -
 arch/alpha/kernel/entry.S            | 5 -----
 arch/alpha/kernel/traps.c            | 8 --------
 4 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/alpha/include/uapi/asm/ptrace.h b/arch/alpha/include/uapi/asm/ptrace.h
index 9d86b2a1526e..72ed913a910f 100644
--- a/arch/alpha/include/uapi/asm/ptrace.h
+++ b/arch/alpha/include/uapi/asm/ptrace.h
@@ -43,7 +43,7 @@ struct pt_regs {
 	unsigned long trap_a1;
 	unsigned long trap_a2;
 /* This makes the stack 16-byte aligned as GCC expects */
-	unsigned long usp;
+	unsigned long __pad0;
 /* These are saved by PAL-code: */
 	unsigned long ps;
 	unsigned long pc;
diff --git a/arch/alpha/kernel/asm-offsets.c b/arch/alpha/kernel/asm-offsets.c
index c89792c86044..22ed3c975b1c 100644
--- a/arch/alpha/kernel/asm-offsets.c
+++ b/arch/alpha/kernel/asm-offsets.c
@@ -30,7 +30,6 @@ static void __used foo(void)
 
 	DEFINE(HAE_CACHE, offsetof(struct alpha_machine_vector, hae_cache));
 	DEFINE(HAE_REG, offsetof(struct alpha_machine_vector, hae_register));
-	DEFINE(PT_REGS_USP, offsetof(struct pt_regs, usp));
 
 	DEFINE(TI_FLAGS,        offsetof(struct thread_info, flags));
 	DEFINE(TI_SYSCALL_WORK, offsetof(struct thread_info, syscall_work));
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index bfa116d455fb..790389a15c3c 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -476,11 +476,6 @@ entSys:
 	ldq	$1, 0($sp)	/* syscall nr from saved r0 */
 	stq	$1, 8($sp)	/* regs->r1 = shadow syscall nr */
 
-	mov	$0, $8
-	call_pal PAL_rdusp
-	stq	$0, PT_REGS_USP($sp)
-	mov	$8, $0
-
 	lda	$8, 0x3fff
 	bic	$sp, $8, $8
 
diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
index cfaef96c4ce8..5882c65b7ef1 100644
--- a/arch/alpha/kernel/traps.c
+++ b/arch/alpha/kernel/traps.c
@@ -30,12 +30,6 @@
 
 #include "proto.h"
 
-static __always_inline void alpha_snapshot_usp(struct pt_regs *regs)
-{
-	if (user_mode(regs))
-		regs->usp = rdusp();
-}
-
 void
 dik_show_regs(struct pt_regs *regs, unsigned long *r9_15)
 {
@@ -186,7 +180,6 @@ do_entArith(unsigned long summary, unsigned long write_mask,
 {
 	long si_code = FPE_FLTINV;
 
-	alpha_snapshot_usp(regs);
 	if (summary & 1) {
 		/* Software-completion summary bit is set, so try to
 		   emulate the instruction.  If the processor supports
@@ -208,7 +201,6 @@ do_entIF(unsigned long type, struct pt_regs *regs)
 {
 	int signo, code;
 
-	alpha_snapshot_usp(regs);
 	if (type == 3) { /* FEN fault */
 		/* Irritating users can call PAL_clrfen to disable the
 		   FPU for the process.  The kernel will then trap in

-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793674927;
	b=mo3gnrf+uwV0G5V7fdchnXNoiXi5sB7S9FV/2hU5BTMbPsWmvd4AygvjARbgFN6Cr6+C
	 gRsw3DGMOjSGHHeFIexl9U6Q+f0H4AZj0B+6Gwk5AFfF5KlrPM7XAO0ta+94jQtS87T2n
	 wHpl9RotGdOZ8Q9MnW1cDajEP8wNDCL211qN7f/5bqkz/S9wUCrAC/xZPyXE/mqAuCJgi
	 flKi7c63Ds5aOj+Ylo4sCxU2kbAUQL0OTe5eE/JQOewqrjqeKFgx0HWRkTe6zbH7EoB0m
	 EFGpYLQkH2iEyW268UmfxYb+MlKdUbRk6UzP3SuV0uyMOaAPs1QsugpdM5q2gi51opw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=OGPOS8a/gMzDgkVkZsvuazR6ZsFinnPxcukENTgqxQA=;
	b=aN3n9I9LUSgr/L44iO1zqhBsXKIfKRFmWZ04H/h/CCVBv7V2w8g1uxEk8ZbvaGfDd/9N
	 gMBawcSvlKPZ6MXI661u3je7xoDWw+bckohMgGTXDdLRQdEBG/6soPfJIeimeAyt3BRz1
	 QjrSgZjYsZkKrFklrkhP4i1AKkEmkbMKkytVAP0fqe5FeTKRxfHiMGrULHjLjrqWOYPGW
	 R7eqLq8E5IKGgJqUN4EHZip7cGrPuySHQZGydUmF1IGJWbCYLVECjs/glo5T9ynB5YpHw
	 sa7GXsJ4nbkzqgTbpQvYrDAoHOXHhD3xo2QpUMIYMuUFJqrOjOz7BMC0NVHbR6O6Kcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxOEOGKq;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E37606A33D
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 03:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43E37606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxOEOGKq
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8871ada1a26so28086257b3.1
        for <linux-alpha@vger.kernel.org>; Mon, 02 Nov 2026 19:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793674926; x=1794279726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGPOS8a/gMzDgkVkZsvuazR6ZsFinnPxcukENTgqxQA=;
        b=yxOEOGKq28VdK0l2tjpfm7Hd7ddXHnV6YxClbgjmwT5KIp1bVgeqbPwcMsKOtKB20R
         lUJIjBcj9cblkJ696K+V8nWdrE9Kxx+lljVVofqappvyII8OE3UGg/WeBAr5ouwho0+B
         cxYM65Vt6ewORuqmt2nn8X7Iuw4nBCQTpbhS9I6esTlWFi4Iq74xD1YaZtwXP4LIOEVa
         Y7o61M/8WnkIaKulVc+q49IkHda3sK9u1fVV3ybBq3kX1fyepWl7bCnYPBKy/QtghUPj
         vwmvh7RdOwEjX1D0YxLq+CZ+CRwhqDG82thVruxaJlKVXf+aN8dW+gUanprly0aggbBy
         JbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674926; x=1794279726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OGPOS8a/gMzDgkVkZsvuazR6ZsFinnPxcukENTgqxQA=;
        b=BAVJ9vATJxv/H2okpXomltWTRp8Czg4oj9Q6P+az21SabCv8kbzBfmCaf/maZKTtkK
         ESJ8921vEc/22F+yhB2uV5cmxYzry/tnVNKGqbL/orWj2gHTNlJxdeZNaLEluQ+F6zuh
         kGvuJHib2LSZyZHkfPf0El1Zc6OxjFBA8dvl7NSZLrkm44d9jNVUlaX28T28i+I/Hn8d
         q3JyvMZRt8OhYLzUtLYBrY1PHnvp5kANCDGBOcY5QJjZN3wIlnA7KmrW3AUwi8u7Rb/8
         T4+HEyybdnFsv6INFi5mSoyfIFogpa325P5ug6Voj+FGQDHcKXrfJtRJ/t/sc/6RmzKC
         +hJQ==
X-Gm-Message-State: APuU4Z+ALjLAl+nhzMGcTsnLLtCYVY9JfZbKfQg51edrDMkEJIB5vlJ6
	sWr2ccyBaJubU7nKIRM5x/eF6X86j0xR56vOX+Lzz+4LuY/til+q5rWU
X-Gm-Gg: AYBFou3xPWkJbz47vZnTge+M3NvVkAZmazwfJaspG5HP9DOgMccrqIYb9RT/KFxlo9r
	TWJZqr9N/kgVetnvMXEzyBW4S3qVNr3kaSITSb8U1/WHcYFs8tVWQT90OSEN9NCqGReQ7f6RqfJ
	1oZ4t2xh908RUA7+HXFPrT1DZjkIaYvY5Tr7Z0acuy3WUVB/X/xR6/Ipai6pS2zUjdKfmTbPiCr
	2Zt1d2ImACMoUss8X7B91SiM+56N6ia8NDW5gOaFjJ63NPURWUgkLyArTn4EmqoGNdDHu9FaWWc
	kG5Doxp8SdR9r+wKRBuzkzeMpbbuBASGpVZcZYUJ8h9J0uuc0rkXZbFh6/Vysje/XPn+IhsP7kF
	vlkMAartanZQMViw00WZIXe5k+lVnSsnxEauwXBF8TTUnV9vE0CL245F7KYxOMFxyyWe9sDSWkl
	aj1LEL01C0h8LAAo7qWG/sSMOInC9FQtFqP2418V+/ZqUdK0MGduXb5CGynM78AUyz+U84i/ZDW
	jUHpX6/2wHHzx8Hq6fqSyDrLEiAz4IDtbbsfm53BcA9skWey4DqF/rwvqa8OEUxMWE37K0R/N7m
	Q0hWlRuW+Qv4KvruVbladxfkF6sVhfBwEO7gXT6//Jkf+9Zsfn8gmRokacxVtIVUpqAPDH5W63R
	cQTtf+n3Uag==
X-Received: by 2002:a05:690c:c105:b0:8b2:91eb:c0e7 with SMTP id 00721157ae682-8b2b6728887mr62857767b3.42.1793674926384;
        Mon, 02 Nov 2026 19:02:06 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf26e646sm6225067d50.7.2026.11.02.19.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:02:05 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 02 Nov 2026 22:01:59 -0500
Subject: [PATCH v4 4/7] alpha/perf: do not report user registers from the
 entry code
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-alpha-profileme-v4-4-61e00f5e1da8@gmail.com>
References: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com>
In-Reply-To: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3780; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=jNR7O2OOmkFHrngjpChvruYJ31B4frktZDdtlTtO574=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe+i3e/Svy+ouGljXCs+rez9/JKtqYLjwlWc1IULqo+
 t48D83Yjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmKQvD//Drx8QKvt
 x1L/j95UlAT3aRWxdfQ4bQ9spz6U324esjFzMy3JetqZvZu7NkvdvxxlR39YQ9jPJ/Mgpsq1l4y
 5/nH2dkBgA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

perf_get_regs_user() returns task_pt_regs() whenever a sample of a user
task lands in the kernel. But exception entry runs with interrupts
enabled, so the sample can land before the entry code has saved the user
registers. Only the part PALcode pushed is valid then. An interrupt
taken on the first instruction of entUna, say, pushes its own frame on
top of PALcode's, which overlaps the rest of the user frame, so r7 and r8
read as the interrupt's r23 and r24.

Report no user registers while the interrupted PC is in the entry code.
Such a sample also gets no user stack dump. The range is all of the entry
code from entInt to the end of the save in entSys, so it also drops the
registers of samples that land after they were saved there.

An interrupt that nests on one taken in the entry code still reads the
incomplete frame, as its own PC has left the entry code.

Fixes: 9280e99d87dd ("alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/ptrace.h | 12 ++++++++++++
 arch/alpha/kernel/entry.S       |  9 +++++++++
 arch/alpha/kernel/perf_regs.c   | 13 +++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptrace.h
index 45d1229344b6..1400ba3e7d43 100644
--- a/arch/alpha/include/asm/ptrace.h
+++ b/arch/alpha/include/asm/ptrace.h
@@ -14,6 +14,18 @@
 #define task_pt_regs(task) \
   ((struct pt_regs *) (task_stack_page(task) + 2*PAGE_SIZE) - 1)
 
+/*
+ * Whether pc is in entry code that may not have completed the frame at
+ * task_pt_regs(). See entry.S.
+ */
+static inline bool in_entry_save_code(unsigned long pc)
+{
+	extern char __entry_save_start[], __entry_save_end[];
+
+	return pc >= (unsigned long)__entry_save_start &&
+	       pc < (unsigned long)__entry_save_end;
+}
+
 #define current_pt_regs() \
   ((struct pt_regs *) ((char *)current_thread_info() + 2*PAGE_SIZE) - 1)
 
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 790389a15c3c..b8d7804e5aa3 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -186,8 +186,14 @@
 
 /*
  * Non-syscall kernel entry points.
+ *
+ * Between __entry_save_start and __entry_save_end the frame at task_pt_regs()
+ * may not be complete. perf uses these to avoid reading it.
  */
 
+	.globl	__entry_save_start
+__entry_save_start:
+
 CFI_START_OSF_FRAME entInt
 	SAVE_ALL
 	lda	$8, 0x3fff
@@ -479,9 +485,12 @@ entSys:
 	lda	$8, 0x3fff
 	bic	$sp, $8, $8
 
+	/* PAL_callsys does not save these, unlike the other entries. */
 	stq	$16, SP_OFF+24($sp)
 	stq	$17, SP_OFF+32($sp)
 	stq	$18, SP_OFF+40($sp)
+	.globl	__entry_save_end
+__entry_save_end:
 
 	mov	$0, $1
 	lda	$16, 7
diff --git a/arch/alpha/kernel/perf_regs.c b/arch/alpha/kernel/perf_regs.c
index 33ea2e831ba0..894683851b30 100644
--- a/arch/alpha/kernel/perf_regs.c
+++ b/arch/alpha/kernel/perf_regs.c
@@ -59,6 +59,19 @@ u64 perf_reg_abi(struct task_struct *task)
 void perf_get_regs_user(struct perf_regs *regs_user,
 			struct pt_regs *regs)
 {
+	/*
+	 * Exception entry runs with interrupts enabled, so a sample can land
+	 * before the entry code has saved the user registers. PALcode has
+	 * pushed only its part of the frame, and the rest may hold an
+	 * interrupt's frame. An interrupt that nests on top of one taken here
+	 * is not caught, as its PC has left the entry code.
+	 */
+	if (in_entry_save_code(regs->pc)) {
+		regs_user->regs = NULL;
+		regs_user->abi = PERF_SAMPLE_REGS_ABI_NONE;
+		return;
+	}
+
 	regs_user->regs = task_pt_regs(current);
 	regs_user->abi = perf_reg_abi(current);
 }

-- 
2.55.0


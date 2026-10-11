Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357D844F56C
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 20:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791749814; cv=none; b=T4OKvb2caqMaMWZLIZr4ks68VTJVZOfj7OubI0FpU9gfSWIcRVbHDs7K4SfgPUDmQdCWt3sewl2Md5ONh+KplpQ8ygb4sQ9OZXNnTsAjKWTjVPSR0xMkg5NDuwubEuqSLBA9geICqrrbJusmeRFFKLOhH3WCjVyVrZpkFh6/fkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791749814; c=relaxed/simple;
	bh=yxtUD1Wg31N+ed74uTZEXH2iw92qBPZ4dDNqgAridNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QAbLD0RaXKsIM5zanAjzuxPg4/7U769hFF0UTYNsVNH4j0fZ505fSg3o3yKivfptTZGiPCI+dTN2g2UbU9wWVlWuspUiM/DVEVqVR+kSznMRN/auUMqoYmgbIfAivmsJr4vdeLurUr68Da+uTowP/jM/KBXgjM4p3qXNcNykdqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLxkMC4R; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLxkMC4R"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-677d35fd1d2so1029956d50.1
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 13:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791749808; x=1792354608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQSe5TCvpH8+aQEt4OIlXdTgrBKi97z9/hyl1ktg7cM=;
        b=KLxkMC4RzObxQZTVj9psELzTRWvxLqKN8FqVT5dAMHRUMuDVY1Aj/Ano37HziG/wSm
         wJw4Rjun1Jq0eYIXKp3cHW1wWmTl8GcfpqZu3mzGgbj6zCW/wBOypCQNnThi1QKgN8rM
         WrDwLe+AFXWtXdkaT+9RQ3OTdWKpYmFh6csoLlxfQVGBJ+iapUIry9RkOhDa1uYVRZt+
         oN/Rq3jakyEv6cmdPySfFKilPlbnYECA7wxn8imnnPyCuz77UPCEMQ7+zsTj18vpC/wC
         hbLaT/iJoTXALBezazNT/s9hFD2LZtg3AFqqi33HbhMNaLRZX8aNOoVA0OSlFFbxQ3+/
         /flQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791749808; x=1792354608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bQSe5TCvpH8+aQEt4OIlXdTgrBKi97z9/hyl1ktg7cM=;
        b=wXqzEc1B2ZJR86rnu2Uipy43s7WWx+spbMZ2v+9yPbbR4Boimk3mV///kimOqPUyM+
         S70FUsTeS1Zpju1G2PF1mwwxUcqq7BlLL+MEF3MPXC/qC7rsPXT6RM9aSkbH81vjetn5
         XVpu3W6G+uRHu8Ju45h/FupSapDmzQ8okdZAUj58Ewhaz8ctSDA0Q03dbpKTRJ6/6CO3
         NV2A1qTuM5XVMFhCdyptZUfNMPi9vfrUPTp/5JOxTWQ5FJAcQE7/Kg9bRLV/WpUY8wrb
         OJ8vLgy18A8hw9KDFq8YWodx0uvIyhaqWOOeRqVESmSo5dx/vOeN/LHgsSRbzToDxCeF
         vJIQ==
X-Gm-Message-State: AFq9FYKcwPnViN35Y0FnmYvZEgaNEZ++IKpc6kUoA/U5F6eVE9D65NJg
	0N36RX9WSiQaaY1bRSL5wa6Bi9vTNt1T0STnVtafHWhbEqoWJbtl/7UW
X-Gm-Gg: AYBFou1laF59HuXcNlRAORLdXQVMYRh7ywKhu3Un1Y6M1pHmBl+pi8Z71uePUVYrQfO
	z7Gf09K1GlrNohMxuet6epgTBAKgKj1RojIASzqbRnUmrZx7+PuIKSg5yqWHlqO3Ya/dkjzM2Fw
	gFCjnlLrHxropEebf6aizgAFP1+2XIg6zob2HEQdnXUvILD+bKp5mYYGg5JdWpAfeXSdDkz09kO
	all+6CTJe6Eokqszdqmdu5rvw26HlBiGBGGcz8lYTU1FZlWNrJx7I2yFnRaZMdzm6N15jw+Ou6J
	Cd5eRrup3gfou3XdIOzkfEgpcvhQ23CNrVEe90B5yTV7puB+tPzoBtekAqrrgg67mofP6370uqh
	2zB/VsmoPnc0NfGWLkH6JaDdlQUOVZ8Gob9SNwCoAzhd3y+TU3kkDwQsw6D761diylXei8o/7SQ
	0BUVSGLyOwzZ32VZ4/0uZOsXw4aDkxeBgXoz0aZkfsXl5j5Y29dXedgX1EHgACBoZ9yl6OKDwd1
	gWpRlZg8ycsnrapTx5iJZT/nZnH9YFiC8PCIzQAxCIQkR6NmlrmUCOD
X-Received: by 2002:a05:690c:998e:b0:8a3:81cd:d44b with SMTP id 00721157ae682-8b07eead57emr21614467b3.101.1791749808177;
        Sun, 11 Oct 2026 13:16:48 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f2215cfsm27630017b3.32.2026.10.11.13.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:16:46 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 11 Oct 2026 16:16:41 -0400
Subject: [PATCH 1/4] alpha: fix stale user_stack_pointer()
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-alpha-perf-regs-v3-v1-1-eaa625a39712@gmail.com>
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2234; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=yxtUD1Wg31N+ed74uTZEXH2iw92qBPZ4dDNqgAridNs=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJOv1sVuKtp8QYjqRt37D9ZF30RPfuHOfm5752Jhg4yj
 fZ7XrHIdnxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1pwsYGa7t2r2NLf
 xxwY1n3h9OGLz3+fuGgyF08f+VZ/98u+/Ec+kTI0OHsd7njsxU4drKZ5NSt/iuOWulIfzjnAH7L
 yXlr/KnehgA
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


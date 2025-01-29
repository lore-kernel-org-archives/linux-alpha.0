Received: from minute.unseen.parts (minute.unseen.parts [139.162.151.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2C41AB6D4;
	Wed, 29 Jan 2025 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.151.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738143812; cv=none; b=EF78ZkYsBvj19Lt9J7t0DUTFLi/evzXq+w24llPl7aFkDt789dolLSRvuvKmRcIn5QY5IrsMP1nNtqYr3niwTdiAIpVQPkdZEM9iBmStsLhtxPnMItmsxlCCHTj60JcR6avlKyVEt9vZZANH6Hl1g3jS7c9MRJPEIXIkqPvTs/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738143812; c=relaxed/simple;
	bh=L0C4ZV8erupKdak6m1ncdX9RzFtc4QtjaG4cm1SE69o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HpYkQDaJ/oOTXiOmuf7myzghU5gNb7tCUN+XRlyffxJ8g0SK5NsTEhMgdPiGUQZc6CEydN/R8sTqoGSkY6QF0ArnBtmuUvjVBzrNFhfVGO+UuvDwecPA3ps9jaPP2TqTFtWaPze9VPRrb5ZTdwaeiNAzkn+1T/sBOPo5OmswSB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts; spf=pass smtp.mailfrom=unseen.parts; dkim=pass (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b=P5tFhuou; arc=none smtp.client-ip=139.162.151.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unseen.parts
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b="P5tFhuou"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=unseen.parts; s=sig; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OD+jn7jZjJoeIh4iCN5mIYrMiK0GdxmD2l7QkmZlHaY=; b=P5tFhuouTZjhAPHDtRYtHYy8Um
	rMgKdUdMTTckZ/NzQYcpube3o5ByIJtZIlhlJPj0aIqCB/o5KPUQPUoXltNnxyKm8zcbWp2zaT/z/
	lCy86a7s+UmE7xy3OhyZ//c40eXp8Fjue2Yhr2iYV63wD4YhSAqywMTXGKiWq7Z0ymTm1CWPuanZM
	IKWSoTRCg++5v7QVw7xvVy/o5rezTKjYJAqZVBpgWgXOeRrVNnGjy78UZTTvmw3OBM9N13trIjIKp
	LZDJpM8ysSOkjeADhA0pbUjc75fn12Cd+Yj+Qeiw6ii6eabvDxrUvt8V+59IUxK03ISRgqOWYRAj2
	NGxjS+Aw==;
Received: from ink by minute.unseen.parts with local (Exim 4.96)
	(envelope-from <ink@unseen.parts>)
	id 1td4bI-000787-1Q;
	Wed, 29 Jan 2025 10:43:12 +0100
From: Ivan Kokshaysky <ink@unseen.parts>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	"Paul E. McKenney" <paulmck@kernel.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Magnus Lindholm <linmag7@gmail.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] alpha/uapi: do not expose kernel-only stack frame structures
Date: Wed, 29 Jan 2025 10:43:09 +0100
Message-Id: <20250129094312.27399-2-ink@unseen.parts>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250129094312.27399-1-ink@unseen.parts>
References: <20250129094312.27399-1-ink@unseen.parts>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parts of asm/ptrace.h went into UAPI with commit 96433f6ee490
("UAPI: (Scripted) Disintegrate arch/alpha/include/asm") back in 2012.
At first glance it looked correct, as many other architectures expose
'struct pt_regs' for ptrace(2) PTRACE_GETREGS/PTRACE_SETREGS requests.
On Alpha, however, these requests have never been implemented;
'struct pt_regs' describes internal kernel stack frame which has
nothing to do with userspace. Same applies to 'struct switch_stack',
as PTRACE_GETFPREG/PTRACE_SETFPREG are not implemented either.

Move this stuff back into internal asm, where we can ajust it
without causing a lot of confusion about possible UAPI breakage.

Fixes: 96433f6ee490 ("UAPI: (Scripted) Disintegrate arch/alpha/include/asm")
Signed-off-by: Ivan Kokshaysky <ink@unseen.parts>
---
 arch/alpha/include/asm/ptrace.h      | 62 +++++++++++++++++++++++++-
 arch/alpha/include/uapi/asm/ptrace.h | 66 +---------------------------
 2 files changed, 62 insertions(+), 66 deletions(-)

diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptrace.h
index 3557ce64ed21..693d4c5b4dc7 100644
--- a/arch/alpha/include/asm/ptrace.h
+++ b/arch/alpha/include/asm/ptrace.h
@@ -2,8 +2,68 @@
 #ifndef _ASMAXP_PTRACE_H
 #define _ASMAXP_PTRACE_H
 
-#include <uapi/asm/ptrace.h>
+/*
+ * This struct defines the way the registers are stored on the
+ * kernel stack during a system call or other kernel entry
+ *
+ * NOTE! I want to minimize the overhead of system calls, so this
+ * struct has as little information as possible. It does not have
+ *
+ *  - floating point regs: the kernel doesn't change those
+ *  - r9-15: saved by the C compiler
+ *
+ * This makes "fork()" and "exec()" a bit more complex, but should
+ * give us low system call latency.
+ */
 
+struct pt_regs {
+	unsigned long r0;
+	unsigned long r1;
+	unsigned long r2;
+	unsigned long r3;
+	unsigned long r4;
+	unsigned long r5;
+	unsigned long r6;
+	unsigned long r7;
+	unsigned long r8;
+	unsigned long r19;
+	unsigned long r20;
+	unsigned long r21;
+	unsigned long r22;
+	unsigned long r23;
+	unsigned long r24;
+	unsigned long r25;
+	unsigned long r26;
+	unsigned long r27;
+	unsigned long r28;
+	unsigned long hae;
+/* JRP - These are the values provided to a0-a2 by PALcode */
+	unsigned long trap_a0;
+	unsigned long trap_a1;
+	unsigned long trap_a2;
+/* These are saved by PAL-code: */
+	unsigned long ps;
+	unsigned long pc;
+	unsigned long gp;
+	unsigned long r16;
+	unsigned long r17;
+	unsigned long r18;
+};
+
+/*
+ * This is the extended stack used by signal handlers and the context
+ * switcher: it's pushed after the normal "struct pt_regs".
+ */
+struct switch_stack {
+	unsigned long r9;
+	unsigned long r10;
+	unsigned long r11;
+	unsigned long r12;
+	unsigned long r13;
+	unsigned long r14;
+	unsigned long r15;
+	unsigned long r26;
+};
 
 #define arch_has_single_step()		(1)
 #define user_mode(regs) (((regs)->ps & 8) != 0)
diff --git a/arch/alpha/include/uapi/asm/ptrace.h b/arch/alpha/include/uapi/asm/ptrace.h
index 5ca45934fcbb..2c08d74deac5 100644
--- a/arch/alpha/include/uapi/asm/ptrace.h
+++ b/arch/alpha/include/uapi/asm/ptrace.h
@@ -2,72 +2,8 @@
 #ifndef _UAPI_ASMAXP_PTRACE_H
 #define _UAPI_ASMAXP_PTRACE_H
 
-
-/*
- * This struct defines the way the registers are stored on the
- * kernel stack during a system call or other kernel entry
- *
- * NOTE! I want to minimize the overhead of system calls, so this
- * struct has as little information as possible. It does not have
- *
- *  - floating point regs: the kernel doesn't change those
- *  - r9-15: saved by the C compiler
- *
- * This makes "fork()" and "exec()" a bit more complex, but should
- * give us low system call latency.
- */
-
-struct pt_regs {
-	unsigned long r0;
-	unsigned long r1;
-	unsigned long r2;
-	unsigned long r3;
-	unsigned long r4;
-	unsigned long r5;
-	unsigned long r6;
-	unsigned long r7;
-	unsigned long r8;
-	unsigned long r19;
-	unsigned long r20;
-	unsigned long r21;
-	unsigned long r22;
-	unsigned long r23;
-	unsigned long r24;
-	unsigned long r25;
-	unsigned long r26;
-	unsigned long r27;
-	unsigned long r28;
-	unsigned long hae;
-/* JRP - These are the values provided to a0-a2 by PALcode */
-	unsigned long trap_a0;
-	unsigned long trap_a1;
-	unsigned long trap_a2;
-/* These are saved by PAL-code: */
-	unsigned long ps;
-	unsigned long pc;
-	unsigned long gp;
-	unsigned long r16;
-	unsigned long r17;
-	unsigned long r18;
-};
-
 /*
- * This is the extended stack used by signal handlers and the context
- * switcher: it's pushed after the normal "struct pt_regs".
+ * We have nothing to say to userspace.
  */
-struct switch_stack {
-	unsigned long r9;
-	unsigned long r10;
-	unsigned long r11;
-	unsigned long r12;
-	unsigned long r13;
-	unsigned long r14;
-	unsigned long r15;
-	unsigned long r26;
-#ifndef __KERNEL__
-	unsigned long fp[32];	/* fp[31] is fpcr */
-#endif
-};
-
 
 #endif /* _UAPI_ASMAXP_PTRACE_H */
-- 
2.39.5


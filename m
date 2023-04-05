From: Uros Bizjak <ubizjak@gmail.com>
Subject: [PATCH v2 3/5] locking/arch: Wire up local_try_cmpxchg
Date: Wed,  5 Apr 2023 16:17:08 +0200
Message-ID: <20230405141710.3551-4-ubizjak@gmail.com>
References: <20230405141710.3551-1-ubizjak@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680704272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jH8CK6/Zc/t5YGDy3q47KHMB123gE9O3L+8qZD7dC+A=;
        b=XZjaJuc9oq0eEJuqYQaQCSxyJEBrGWscwxPcLCz1SGmMY8nwBoCrKPTVkKuDR6NHM0
         nd8qEhQmNfk/r4MHTfpwl3GDx8xszhuQDekAlI7AuV5wPPTHtKtudXEJvnYoUIEF8a5w
         BCncuKCXN80M4D+9c/uTSAQxM1AULldg3sOFYIYNysgVeYWsg+Xf3uXNSO3204XksTVt
         VY7rOKvL0GsKooMWqYkHs8pZAlDl7U2kRNPRjRx+Zj41LQ7/h5JXvJnY1puZvDO1QMoW
         76SsXCfs7PmO+YxBWiArT3kI1VrIE5rfXzPTV1J+iRMhJsk2mSVTfV9ok5E9WbeCZyIn
         ETvg==
In-Reply-To: <20230405141710.3551-1-ubizjak@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Jun Yi <yijun@loongson.cn>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>

Implement target specific support for local_try_cmpxchg
and local_cmpxchg using typed C wrappers that call their
_local counterpart and provide additional checking of
their input arguments.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Jun Yi <yijun@loongson.cn>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/alpha/include/asm/local.h     | 12 ++++++++++--
 arch/loongarch/include/asm/local.h | 13 +++++++++++--
 arch/mips/include/asm/local.h      | 13 +++++++++++--
 arch/powerpc/include/asm/local.h   | 11 +++++++++++
 arch/x86/include/asm/local.h       | 13 +++++++++++--
 5 files changed, 54 insertions(+), 8 deletions(-)

diff --git a/arch/alpha/include/asm/local.h b/arch/alpha/include/asm/local.h
index fab26a1c93d5..0fcaad642cc3 100644
--- a/arch/alpha/include/asm/local.h
+++ b/arch/alpha/include/asm/local.h
@@ -52,8 +52,16 @@ static __inline__ long local_sub_return(long i, local_t * l)
 	return result;
 }
 
-#define local_cmpxchg(l, o, n) \
-	(cmpxchg_local(&((l)->a.counter), (o), (n)))
+static __inline__ long local_cmpxchg(local_t *l, long old, long new)
+{
+	return cmpxchg_local(&l->a.counter, old, new);
+}
+
+static __inline__ bool local_try_cmpxchg(local_t *l, long *old, long new)
+{
+	return try_cmpxchg_local(&l->a.counter, (s64 *)old, new);
+}
+
 #define local_xchg(l, n) (xchg_local(&((l)->a.counter), (n)))
 
 /**
diff --git a/arch/loongarch/include/asm/local.h b/arch/loongarch/include/asm/local.h
index 65fbbae9fc4d..83e995b30e47 100644
--- a/arch/loongarch/include/asm/local.h
+++ b/arch/loongarch/include/asm/local.h
@@ -56,8 +56,17 @@ static inline long local_sub_return(long i, local_t *l)
 	return result;
 }
 
-#define local_cmpxchg(l, o, n) \
-	((long)cmpxchg_local(&((l)->a.counter), (o), (n)))
+static inline long local_cmpxchg(local_t *l, long old, long new)
+{
+	return cmpxchg_local(&l->a.counter, old, new);
+}
+
+static inline bool local_try_cmpxchg(local_t *l, long *old, long new)
+{
+	typeof(l->a.counter) *__old = (typeof(l->a.counter) *) old;
+	return try_cmpxchg_local(&l->a.counter, __old, new);
+}
+
 #define local_xchg(l, n) (atomic_long_xchg((&(l)->a), (n)))
 
 /**
diff --git a/arch/mips/include/asm/local.h b/arch/mips/include/asm/local.h
index 08366b1fd273..5daf6fe8e3e9 100644
--- a/arch/mips/include/asm/local.h
+++ b/arch/mips/include/asm/local.h
@@ -94,8 +94,17 @@ static __inline__ long local_sub_return(long i, local_t * l)
 	return result;
 }
 
-#define local_cmpxchg(l, o, n) \
-	((long)cmpxchg_local(&((l)->a.counter), (o), (n)))
+static __inline__ long local_cmpxchg(local_t *l, long old, long new)
+{
+	return cmpxchg_local(&l->a.counter, old, new);
+}
+
+static __inline__ bool local_try_cmpxchg(local_t *l, long *old, long new)
+{
+	typeof(l->a.counter) *__old = (typeof(l->a.counter) *) old;
+	return try_cmpxchg_local(&l->a.counter, __old, new);
+}
+
 #define local_xchg(l, n) (atomic_long_xchg((&(l)->a), (n)))
 
 /**
diff --git a/arch/powerpc/include/asm/local.h b/arch/powerpc/include/asm/local.h
index bc4bd19b7fc2..45492fb5bf22 100644
--- a/arch/powerpc/include/asm/local.h
+++ b/arch/powerpc/include/asm/local.h
@@ -90,6 +90,17 @@ static __inline__ long local_cmpxchg(local_t *l, long o, long n)
 	return t;
 }
 
+static __inline__ bool local_try_cmpxchg(local_t *l, long *po, long n)
+{
+	long o = *po, r;
+
+	r = local_cmpxchg(l, o, n);
+	if (unlikely(r != o))
+		*po = r;
+
+	return likely(r == o);
+}
+
 static __inline__ long local_xchg(local_t *l, long n)
 {
 	long t;
diff --git a/arch/x86/include/asm/local.h b/arch/x86/include/asm/local.h
index 349a47acaa4a..56d4ef604b91 100644
--- a/arch/x86/include/asm/local.h
+++ b/arch/x86/include/asm/local.h
@@ -120,8 +120,17 @@ static inline long local_sub_return(long i, local_t *l)
 #define local_inc_return(l)  (local_add_return(1, l))
 #define local_dec_return(l)  (local_sub_return(1, l))
 
-#define local_cmpxchg(l, o, n) \
-	(cmpxchg_local(&((l)->a.counter), (o), (n)))
+static inline long local_cmpxchg(local_t *l, long old, long new)
+{
+	return cmpxchg_local(&l->a.counter, old, new);
+}
+
+static inline bool local_try_cmpxchg(local_t *l, long *old, long new)
+{
+	typeof(l->a.counter) *__old = (typeof(l->a.counter) *) old;
+	return try_cmpxchg_local(&l->a.counter, __old, new);
+}
+
 /* Always has a lock prefix */
 #define local_xchg(l, n) (xchg(&((l)->a.counter), (n)))
 
-- 
2.39.2


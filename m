Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A52C1854
	for <linux-alpha@vger.kernel.org>; Sat, 17 Aug 2024 18:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723918475; cv=none; b=DN8Dxm6TqfYRfO5k4E+CR3A/+wbwo9H/ZDhIP2M6dB8FClp5BcxTC2JUsLcbTiYl2L2hPWZBEi44tz9sBevpNcc6ymLFUEmGc/vQjswtwXDlR07CbMZD1vzq7lCowely/MaQm3dIMB56IDctYXhTPM0RQEUcYFOdkoqm2WmMStg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723918475; c=relaxed/simple;
	bh=q8W1pXTnXxrYZbaJ3+1q0b+6WodizEOqToB35JrXWh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dV2q1Gmoo18KWCLekPdpeDZS1m+xNZ9gsc1B0790q5hEQ6CxWSw/g3Wixh4B5xem2gQEcfGl8BL/GLzTRBtk1ACfPlE/KvyIsgUih56E7cHEdvVnMnSPrnsA8n9TYUXK1/gHYGtCG33xiEOF2Z3GKIAqDv4+AcllN7cQUIfI+fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=v1aFvDxl; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="v1aFvDxl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=QWulh+sZ2KYxQ1yvEKAnA8aiQJO/OXwX4pQYFDdznCE=; b=v1aFvDxlYTN91KChntiUcyLmAC
	C9xc6Waqz8VuwMK5OiysszmGtpnSiw9nagHmz1VSJIwp9W0ILRGdk6sFlJ5pNL3HqWT+jnWAcCvVe
	UDikDRmg7nQpqGa1RpaNupN3I72jXYE//HeqEIGdRl4Qgzqy9r8/9RM1SeAEqBaNUMQynYV6Xgwf9
	7J/Ds/gYhAJC1U7xe3KWWG2L42m6y28gbTCoO/ok5lbii2ab4zrxQgZLgEVlpoyAHJmFq5qxrqQMb
	JJwPSfwxgorrXZ10FPoskZBHGA7lfjem7DaOQcJfjEmgIn9jy18y+c9utBBHRaMzaLRr6MzROc9O7
	p37KF0XQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98 #2 (Red Hat Linux))
	id 1sfNwb-00000002bS9-21tM;
	Sat, 17 Aug 2024 18:14:29 +0000
Date: Sat, 17 Aug 2024 19:14:29 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-alpha@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: no need to include asm/xchg.h twice
Message-ID: <20240817181429.GH504335@ZenIV>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Al Viro <viro@ftp.linux.org.uk>

[rebased to 6.11-rc1, sits in
git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git #work.alpha

I don't really care which tree it goes through; preferences?
]

commit 06ed6b34448dd7090a9782f7c160312dd5230d73
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Mon Apr 8 17:43:37 2024 -0400

    alpha: no need to include asm/xchg.h twice
    
    We used to generate different helpers for local and full
    {cmp,}xchg(); these days the barriers are in arch_{cmp,}xchg()
    instead and generated helpers are identical for local and
    full cases.  No need for those parametrized includes of
    asm/xchg.h - we might as well insert its contents directly
    in asm/cmpxchg.h and do it only once.
    
    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

diff --git a/arch/alpha/include/asm/cmpxchg.h b/arch/alpha/include/asm/cmpxchg.h
index 91d4a4d9258c..ae1b96479d0c 100644
--- a/arch/alpha/include/asm/cmpxchg.h
+++ b/arch/alpha/include/asm/cmpxchg.h
@@ -3,17 +3,232 @@
 #define _ALPHA_CMPXCHG_H
 
 /*
- * Atomic exchange routines.
+ * Atomic exchange.
+ * Since it can be used to implement critical sections
+ * it must clobber "memory" (also for interrupts in UP).
  */
 
-#define ____xchg(type, args...)		__arch_xchg ## type ## _local(args)
-#define ____cmpxchg(type, args...)	__cmpxchg ## type ## _local(args)
-#include <asm/xchg.h>
+static inline unsigned long
+____xchg_u8(volatile char *m, unsigned long val)
+{
+	unsigned long ret, tmp, addr64;
+
+	__asm__ __volatile__(
+	"	andnot	%4,7,%3\n"
+	"	insbl	%1,%4,%1\n"
+	"1:	ldq_l	%2,0(%3)\n"
+	"	extbl	%2,%4,%0\n"
+	"	mskbl	%2,%4,%2\n"
+	"	or	%1,%2,%2\n"
+	"	stq_c	%2,0(%3)\n"
+	"	beq	%2,2f\n"
+	".subsection 2\n"
+	"2:	br	1b\n"
+	".previous"
+	: "=&r" (ret), "=&r" (val), "=&r" (tmp), "=&r" (addr64)
+	: "r" ((long)m), "1" (val) : "memory");
+
+	return ret;
+}
+
+static inline unsigned long
+____xchg_u16(volatile short *m, unsigned long val)
+{
+	unsigned long ret, tmp, addr64;
+
+	__asm__ __volatile__(
+	"	andnot	%4,7,%3\n"
+	"	inswl	%1,%4,%1\n"
+	"1:	ldq_l	%2,0(%3)\n"
+	"	extwl	%2,%4,%0\n"
+	"	mskwl	%2,%4,%2\n"
+	"	or	%1,%2,%2\n"
+	"	stq_c	%2,0(%3)\n"
+	"	beq	%2,2f\n"
+	".subsection 2\n"
+	"2:	br	1b\n"
+	".previous"
+	: "=&r" (ret), "=&r" (val), "=&r" (tmp), "=&r" (addr64)
+	: "r" ((long)m), "1" (val) : "memory");
+
+	return ret;
+}
+
+static inline unsigned long
+____xchg_u32(volatile int *m, unsigned long val)
+{
+	unsigned long dummy;
+
+	__asm__ __volatile__(
+	"1:	ldl_l %0,%4\n"
+	"	bis $31,%3,%1\n"
+	"	stl_c %1,%2\n"
+	"	beq %1,2f\n"
+	".subsection 2\n"
+	"2:	br 1b\n"
+	".previous"
+	: "=&r" (val), "=&r" (dummy), "=m" (*m)
+	: "rI" (val), "m" (*m) : "memory");
+
+	return val;
+}
+
+static inline unsigned long
+____xchg_u64(volatile long *m, unsigned long val)
+{
+	unsigned long dummy;
+
+	__asm__ __volatile__(
+	"1:	ldq_l %0,%4\n"
+	"	bis $31,%3,%1\n"
+	"	stq_c %1,%2\n"
+	"	beq %1,2f\n"
+	".subsection 2\n"
+	"2:	br 1b\n"
+	".previous"
+	: "=&r" (val), "=&r" (dummy), "=m" (*m)
+	: "rI" (val), "m" (*m) : "memory");
+
+	return val;
+}
+
+/* This function doesn't exist, so you'll get a linker error
+   if something tries to do an invalid xchg().  */
+extern void __xchg_called_with_bad_pointer(void);
+
+static __always_inline unsigned long
+____xchg(volatile void *ptr, unsigned long x, int size)
+{
+	return
+		size == 1 ? ____xchg_u8(ptr, x) :
+		size == 2 ? ____xchg_u16(ptr, x) :
+		size == 4 ? ____xchg_u32(ptr, x) :
+		size == 8 ? ____xchg_u64(ptr, x) :
+			(__xchg_called_with_bad_pointer(), x);
+}
+
+/*
+ * Atomic compare and exchange.  Compare OLD with MEM, if identical,
+ * store NEW in MEM.  Return the initial value in MEM.  Success is
+ * indicated by comparing RETURN with OLD.
+ */
+
+static inline unsigned long
+____cmpxchg_u8(volatile char *m, unsigned char old, unsigned char new)
+{
+	unsigned long prev, tmp, cmp, addr64;
+
+	__asm__ __volatile__(
+	"	andnot	%5,7,%4\n"
+	"	insbl	%1,%5,%1\n"
+	"1:	ldq_l	%2,0(%4)\n"
+	"	extbl	%2,%5,%0\n"
+	"	cmpeq	%0,%6,%3\n"
+	"	beq	%3,2f\n"
+	"	mskbl	%2,%5,%2\n"
+	"	or	%1,%2,%2\n"
+	"	stq_c	%2,0(%4)\n"
+	"	beq	%2,3f\n"
+	"2:\n"
+	".subsection 2\n"
+	"3:	br	1b\n"
+	".previous"
+	: "=&r" (prev), "=&r" (new), "=&r" (tmp), "=&r" (cmp), "=&r" (addr64)
+	: "r" ((long)m), "Ir" (old), "1" (new) : "memory");
+
+	return prev;
+}
+
+static inline unsigned long
+____cmpxchg_u16(volatile short *m, unsigned short old, unsigned short new)
+{
+	unsigned long prev, tmp, cmp, addr64;
+
+	__asm__ __volatile__(
+	"	andnot	%5,7,%4\n"
+	"	inswl	%1,%5,%1\n"
+	"1:	ldq_l	%2,0(%4)\n"
+	"	extwl	%2,%5,%0\n"
+	"	cmpeq	%0,%6,%3\n"
+	"	beq	%3,2f\n"
+	"	mskwl	%2,%5,%2\n"
+	"	or	%1,%2,%2\n"
+	"	stq_c	%2,0(%4)\n"
+	"	beq	%2,3f\n"
+	"2:\n"
+	".subsection 2\n"
+	"3:	br	1b\n"
+	".previous"
+	: "=&r" (prev), "=&r" (new), "=&r" (tmp), "=&r" (cmp), "=&r" (addr64)
+	: "r" ((long)m), "Ir" (old), "1" (new) : "memory");
+
+	return prev;
+}
+
+static inline unsigned long
+____cmpxchg_u32(volatile int *m, int old, int new)
+{
+	unsigned long prev, cmp;
+
+	__asm__ __volatile__(
+	"1:	ldl_l %0,%5\n"
+	"	cmpeq %0,%3,%1\n"
+	"	beq %1,2f\n"
+	"	mov %4,%1\n"
+	"	stl_c %1,%2\n"
+	"	beq %1,3f\n"
+	"2:\n"
+	".subsection 2\n"
+	"3:	br 1b\n"
+	".previous"
+	: "=&r"(prev), "=&r"(cmp), "=m"(*m)
+	: "r"((long) old), "r"(new), "m"(*m) : "memory");
+
+	return prev;
+}
+
+static inline unsigned long
+____cmpxchg_u64(volatile long *m, unsigned long old, unsigned long new)
+{
+	unsigned long prev, cmp;
+
+	__asm__ __volatile__(
+	"1:	ldq_l %0,%5\n"
+	"	cmpeq %0,%3,%1\n"
+	"	beq %1,2f\n"
+	"	mov %4,%1\n"
+	"	stq_c %1,%2\n"
+	"	beq %1,3f\n"
+	"2:\n"
+	".subsection 2\n"
+	"3:	br 1b\n"
+	".previous"
+	: "=&r"(prev), "=&r"(cmp), "=m"(*m)
+	: "r"((long) old), "r"(new), "m"(*m) : "memory");
+
+	return prev;
+}
+
+/* This function doesn't exist, so you'll get a linker error
+   if something tries to do an invalid cmpxchg().  */
+extern void __cmpxchg_called_with_bad_pointer(void);
+
+static __always_inline unsigned long
+____cmpxchg(volatile void *ptr, unsigned long old, unsigned long new,
+	      int size)
+{
+	return
+		size == 1 ? ____cmpxchg_u8(ptr, old, new) :
+		size == 2 ? ____cmpxchg_u16(ptr, old, new) :
+		size == 4 ? ____cmpxchg_u32(ptr, old, new) :
+		size == 8 ? ____cmpxchg_u64(ptr, old, new) :
+			(__cmpxchg_called_with_bad_pointer(), old);
+}
 
 #define xchg_local(ptr, x)						\
 ({									\
 	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __arch_xchg_local((ptr), (unsigned long)_x_,\
+	(__typeof__(*(ptr))) ____xchg((ptr), (unsigned long)_x_,	\
 					       sizeof(*(ptr)));		\
 })
 
@@ -21,7 +236,7 @@
 ({									\
 	__typeof__(*(ptr)) _o_ = (o);					\
 	__typeof__(*(ptr)) _n_ = (n);					\
-	(__typeof__(*(ptr))) __cmpxchg_local((ptr), (unsigned long)_o_,	\
+	(__typeof__(*(ptr))) ____cmpxchg((ptr), (unsigned long)_o_,	\
 					  (unsigned long)_n_,		\
 					  sizeof(*(ptr)));		\
 })
@@ -32,12 +247,6 @@
 	cmpxchg_local((ptr), (o), (n));					\
 })
 
-#undef ____xchg
-#undef ____cmpxchg
-#define ____xchg(type, args...)		__arch_xchg ##type(args)
-#define ____cmpxchg(type, args...)	__cmpxchg ##type(args)
-#include <asm/xchg.h>
-
 /*
  * The leading and the trailing memory barriers guarantee that these
  * operations are fully ordered.
@@ -48,7 +257,7 @@
 	__typeof__(*(ptr)) _x_ = (x);					\
 	smp_mb();							\
 	__ret = (__typeof__(*(ptr)))					\
-		__arch_xchg((ptr), (unsigned long)_x_, sizeof(*(ptr)));	\
+		____xchg((ptr), (unsigned long)_x_, sizeof(*(ptr)));	\
 	smp_mb();							\
 	__ret;								\
 })
@@ -59,7 +268,7 @@
 	__typeof__(*(ptr)) _o_ = (o);					\
 	__typeof__(*(ptr)) _n_ = (n);					\
 	smp_mb();							\
-	__ret = (__typeof__(*(ptr))) __cmpxchg((ptr),			\
+	__ret = (__typeof__(*(ptr))) ____cmpxchg((ptr),			\
 		(unsigned long)_o_, (unsigned long)_n_, sizeof(*(ptr)));\
 	smp_mb();							\
 	__ret;								\
@@ -71,6 +280,4 @@
 	arch_cmpxchg((ptr), (o), (n));					\
 })
 
-#undef ____cmpxchg
-
 #endif /* _ALPHA_CMPXCHG_H */
diff --git a/arch/alpha/include/asm/xchg.h b/arch/alpha/include/asm/xchg.h
deleted file mode 100644
index 7adb80c6746a..000000000000
--- a/arch/alpha/include/asm/xchg.h
+++ /dev/null
@@ -1,246 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ALPHA_CMPXCHG_H
-#error Do not include xchg.h directly!
-#else
-/*
- * xchg/xchg_local and cmpxchg/cmpxchg_local share the same code
- * except that local version do not have the expensive memory barrier.
- * So this file is included twice from asm/cmpxchg.h.
- */
-
-/*
- * Atomic exchange.
- * Since it can be used to implement critical sections
- * it must clobber "memory" (also for interrupts in UP).
- */
-
-static inline unsigned long
-____xchg(_u8, volatile char *m, unsigned long val)
-{
-	unsigned long ret, tmp, addr64;
-
-	__asm__ __volatile__(
-	"	andnot	%4,7,%3\n"
-	"	insbl	%1,%4,%1\n"
-	"1:	ldq_l	%2,0(%3)\n"
-	"	extbl	%2,%4,%0\n"
-	"	mskbl	%2,%4,%2\n"
-	"	or	%1,%2,%2\n"
-	"	stq_c	%2,0(%3)\n"
-	"	beq	%2,2f\n"
-	".subsection 2\n"
-	"2:	br	1b\n"
-	".previous"
-	: "=&r" (ret), "=&r" (val), "=&r" (tmp), "=&r" (addr64)
-	: "r" ((long)m), "1" (val) : "memory");
-
-	return ret;
-}
-
-static inline unsigned long
-____xchg(_u16, volatile short *m, unsigned long val)
-{
-	unsigned long ret, tmp, addr64;
-
-	__asm__ __volatile__(
-	"	andnot	%4,7,%3\n"
-	"	inswl	%1,%4,%1\n"
-	"1:	ldq_l	%2,0(%3)\n"
-	"	extwl	%2,%4,%0\n"
-	"	mskwl	%2,%4,%2\n"
-	"	or	%1,%2,%2\n"
-	"	stq_c	%2,0(%3)\n"
-	"	beq	%2,2f\n"
-	".subsection 2\n"
-	"2:	br	1b\n"
-	".previous"
-	: "=&r" (ret), "=&r" (val), "=&r" (tmp), "=&r" (addr64)
-	: "r" ((long)m), "1" (val) : "memory");
-
-	return ret;
-}
-
-static inline unsigned long
-____xchg(_u32, volatile int *m, unsigned long val)
-{
-	unsigned long dummy;
-
-	__asm__ __volatile__(
-	"1:	ldl_l %0,%4\n"
-	"	bis $31,%3,%1\n"
-	"	stl_c %1,%2\n"
-	"	beq %1,2f\n"
-	".subsection 2\n"
-	"2:	br 1b\n"
-	".previous"
-	: "=&r" (val), "=&r" (dummy), "=m" (*m)
-	: "rI" (val), "m" (*m) : "memory");
-
-	return val;
-}
-
-static inline unsigned long
-____xchg(_u64, volatile long *m, unsigned long val)
-{
-	unsigned long dummy;
-
-	__asm__ __volatile__(
-	"1:	ldq_l %0,%4\n"
-	"	bis $31,%3,%1\n"
-	"	stq_c %1,%2\n"
-	"	beq %1,2f\n"
-	".subsection 2\n"
-	"2:	br 1b\n"
-	".previous"
-	: "=&r" (val), "=&r" (dummy), "=m" (*m)
-	: "rI" (val), "m" (*m) : "memory");
-
-	return val;
-}
-
-/* This function doesn't exist, so you'll get a linker error
-   if something tries to do an invalid xchg().  */
-extern void __xchg_called_with_bad_pointer(void);
-
-static __always_inline unsigned long
-____xchg(, volatile void *ptr, unsigned long x, int size)
-{
-	switch (size) {
-		case 1:
-			return ____xchg(_u8, ptr, x);
-		case 2:
-			return ____xchg(_u16, ptr, x);
-		case 4:
-			return ____xchg(_u32, ptr, x);
-		case 8:
-			return ____xchg(_u64, ptr, x);
-	}
-	__xchg_called_with_bad_pointer();
-	return x;
-}
-
-/*
- * Atomic compare and exchange.  Compare OLD with MEM, if identical,
- * store NEW in MEM.  Return the initial value in MEM.  Success is
- * indicated by comparing RETURN with OLD.
- */
-
-static inline unsigned long
-____cmpxchg(_u8, volatile char *m, unsigned char old, unsigned char new)
-{
-	unsigned long prev, tmp, cmp, addr64;
-
-	__asm__ __volatile__(
-	"	andnot	%5,7,%4\n"
-	"	insbl	%1,%5,%1\n"
-	"1:	ldq_l	%2,0(%4)\n"
-	"	extbl	%2,%5,%0\n"
-	"	cmpeq	%0,%6,%3\n"
-	"	beq	%3,2f\n"
-	"	mskbl	%2,%5,%2\n"
-	"	or	%1,%2,%2\n"
-	"	stq_c	%2,0(%4)\n"
-	"	beq	%2,3f\n"
-	"2:\n"
-	".subsection 2\n"
-	"3:	br	1b\n"
-	".previous"
-	: "=&r" (prev), "=&r" (new), "=&r" (tmp), "=&r" (cmp), "=&r" (addr64)
-	: "r" ((long)m), "Ir" (old), "1" (new) : "memory");
-
-	return prev;
-}
-
-static inline unsigned long
-____cmpxchg(_u16, volatile short *m, unsigned short old, unsigned short new)
-{
-	unsigned long prev, tmp, cmp, addr64;
-
-	__asm__ __volatile__(
-	"	andnot	%5,7,%4\n"
-	"	inswl	%1,%5,%1\n"
-	"1:	ldq_l	%2,0(%4)\n"
-	"	extwl	%2,%5,%0\n"
-	"	cmpeq	%0,%6,%3\n"
-	"	beq	%3,2f\n"
-	"	mskwl	%2,%5,%2\n"
-	"	or	%1,%2,%2\n"
-	"	stq_c	%2,0(%4)\n"
-	"	beq	%2,3f\n"
-	"2:\n"
-	".subsection 2\n"
-	"3:	br	1b\n"
-	".previous"
-	: "=&r" (prev), "=&r" (new), "=&r" (tmp), "=&r" (cmp), "=&r" (addr64)
-	: "r" ((long)m), "Ir" (old), "1" (new) : "memory");
-
-	return prev;
-}
-
-static inline unsigned long
-____cmpxchg(_u32, volatile int *m, int old, int new)
-{
-	unsigned long prev, cmp;
-
-	__asm__ __volatile__(
-	"1:	ldl_l %0,%5\n"
-	"	cmpeq %0,%3,%1\n"
-	"	beq %1,2f\n"
-	"	mov %4,%1\n"
-	"	stl_c %1,%2\n"
-	"	beq %1,3f\n"
-	"2:\n"
-	".subsection 2\n"
-	"3:	br 1b\n"
-	".previous"
-	: "=&r"(prev), "=&r"(cmp), "=m"(*m)
-	: "r"((long) old), "r"(new), "m"(*m) : "memory");
-
-	return prev;
-}
-
-static inline unsigned long
-____cmpxchg(_u64, volatile long *m, unsigned long old, unsigned long new)
-{
-	unsigned long prev, cmp;
-
-	__asm__ __volatile__(
-	"1:	ldq_l %0,%5\n"
-	"	cmpeq %0,%3,%1\n"
-	"	beq %1,2f\n"
-	"	mov %4,%1\n"
-	"	stq_c %1,%2\n"
-	"	beq %1,3f\n"
-	"2:\n"
-	".subsection 2\n"
-	"3:	br 1b\n"
-	".previous"
-	: "=&r"(prev), "=&r"(cmp), "=m"(*m)
-	: "r"((long) old), "r"(new), "m"(*m) : "memory");
-
-	return prev;
-}
-
-/* This function doesn't exist, so you'll get a linker error
-   if something tries to do an invalid cmpxchg().  */
-extern void __cmpxchg_called_with_bad_pointer(void);
-
-static __always_inline unsigned long
-____cmpxchg(, volatile void *ptr, unsigned long old, unsigned long new,
-	      int size)
-{
-	switch (size) {
-		case 1:
-			return ____cmpxchg(_u8, ptr, old, new);
-		case 2:
-			return ____cmpxchg(_u16, ptr, old, new);
-		case 4:
-			return ____cmpxchg(_u32, ptr, old, new);
-		case 8:
-			return ____cmpxchg(_u64, ptr, old, new);
-	}
-	__cmpxchg_called_with_bad_pointer();
-	return old;
-}
-
-#endif

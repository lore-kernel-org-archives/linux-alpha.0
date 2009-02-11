From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: Need help fixing DRM locking on Alpha
Date: Wed, 11 Feb 2009 18:48:29 +0300
Message-ID: <20090211154829.GA27268@jurassic.park.msu.ru>
References: <b4198de60902091343p2aa76a27vf3bc077b6d55c78e@mail.gmail.com> <20090210154355.GA27697@jurassic.park.msu.ru> <b4198de60902101518m6402171bx9142ca8c8f1f785@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b4198de60902101518m6402171bx9142ca8c8f1f785@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org

On Tue, Feb 10, 2009 at 06:18:43PM -0500, Matt Turner wrote:
> Your code fixes the problem. Thanks!

Great news!

> I had to make one minor change though: moved 'old' from an output to
> an input. That is,
> 
> >                 "=m"(__drm_dummy_lock(lock)), \
> >                 "=&r"(old)                    \
> >               : "r"(new)                      \
> 
> becomes
> 
> >		  "=m"(__drm_dummy_lock(lock))	\
> >		: "r"(old), "r"(new)		\

Yes, you are right. But strictly speaking, "old" should be both input
and output operand.
 
> Please let me know if this change is acceptable. If so, please submit
> a patch to the bug report so that proper credit is given to you.

Well, I've got slightly improved version, which saves one instruction
for register-register move. Another instruction can be saved if we
define DRM_CAS_RESULT(_result) as "long" (no need for sign extending then).

Can you test this please?

Ivan.

--- libdrm-2.4.4/libdrm/xf86drm.h.orig	Wed Dec 17 21:28:24 2008
+++ libdrm-2.4.4/libdrm/xf86drm.h	Wed Feb 11 03:07:05 2009
@@ -325,28 +325,28 @@ typedef struct _drmSetVersion {
 
 #elif defined(__alpha__)
 
-#define	DRM_CAS(lock, old, new, ret) 		\
- 	do {					\
- 		int old32;                      \
- 		int cur32;			\
- 		__asm__ __volatile__(		\
- 		"       mb\n"			\
- 		"       zap   %4, 0xF0, %0\n"   \
- 		"       ldl_l %1, %2\n"		\
- 		"       zap   %1, 0xF0, %1\n"   \
-                "       cmpeq %0, %1, %1\n"	\
-                "       beq   %1, 1f\n"		\
- 		"       bis   %5, %5, %1\n"	\
-                "       stl_c %1, %2\n"		\
-                "1:     xor   %1, 1, %1\n"	\
-                "       stl   %1, %3"		\
-                : "=r" (old32),                 \
-		  "=&r" (cur32),		\
-                   "=m" (__drm_dummy_lock(lock)),\
-                   "=m" (ret)			\
- 		: "r" (old),			\
- 		  "r" (new));			\
- 	} while(0)
+#define	DRM_CAS(lock, old, new, ret)		\
+	do {					\
+		int tmp, old32;			\
+		__asm__ __volatile__(		\
+		"	addl	$31, %5, %3\n"	\
+		"1:	ldl_l	%0, %2\n"	\
+		"	cmpeq	%0, %3, %1\n"	\
+		"	beq	%1, 2f\n"	\
+		"	mov	%4, %0\n"	\
+		"	stl_c	%0, %2\n"	\
+		"	beq	%0, 3f\n"	\
+		"	mb\n"			\
+		"2:	cmpeq	%1, 0, %1\n"	\
+		".subsection 2\n"		\
+		"3:	br	1b\n"		\
+		".previous"			\
+		: "=&r"(tmp), "=&r"(ret),	\
+		  "=m"(__drm_dummy_lock(lock)),	\
+		  "=&r"(old32)			\
+		: "r"(new), "r"(old)		\
+		: "memory");			\
+	} while (0)
 
 #elif defined(__sparc__)
 
@@ -429,7 +429,9 @@ do {	register unsigned int __old __asm("
 #define DRM_CAS(lock,old,new,ret) do { ret=1; } while (0) /* FAST LOCK FAILS */
 #endif
 
-#if defined(__alpha__) || defined(__powerpc__)
+#if defined(__alpha__)
+#define DRM_CAS_RESULT(_result)		long _result
+#elif defined(__powerpc__)
 #define DRM_CAS_RESULT(_result)		int _result
 #else
 #define DRM_CAS_RESULT(_result)		char _result

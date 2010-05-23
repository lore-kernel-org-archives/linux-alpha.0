From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 122/199] arch/alpha/lib/memcpy.c: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:16 +0200
Message-ID: <1274644466-24577-14-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=loTGjBAnCJWstM2+yA6B86BTgWA+r1CgzP03YsM4GYs=;
        b=klvgytxPmF/L3vYhNsyK2WsGC1xWh3Jp+ILUFPWeNoCkbTIDE6bOQO1y1vaH7Jw8NJ
         3bOsC6PuBwDeqUxUGoJ7M2uAg6P94PyCa4tSLJxYhh3C+geV8pvnCD76Z618fNOE3yac
         WOEBBjf7UBQpSGKb3cX+CHcL+lL4aXcLm+FJA=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/lib/memcpy.c:24: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:24: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:31: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:31: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:43: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:43: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:49: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:49: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:60: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:60: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:60: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:60: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:61: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:61: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:61: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:61: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:73: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:73: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:77: ERROR: spaces required around that ':' (ctx:VxV)
arch/alpha/lib/memcpy.c:77: ERROR: spaces required around that ':' (ctx:VxV)
arch/alpha/lib/memcpy.c:80: ERROR: spaces required around that ':' (ctx:VxV)
arch/alpha/lib/memcpy.c:80: ERROR: spaces required around that ':' (ctx:VxV)
arch/alpha/lib/memcpy.c:83: ERROR: spaces required around that ':' (ctx:ExV)
arch/alpha/lib/memcpy.c:84: ERROR: spaces required around that ':' (ctx:ExV)
arch/alpha/lib/memcpy.c:86: ERROR: spaces required around that ':' (ctx:ExV)
arch/alpha/lib/memcpy.c:87: ERROR: spaces required around that ':' (ctx:ExV)
arch/alpha/lib/memcpy.c:95: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:95: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:105: ERROR: space prohibited after that '*' (ctx:ExW)
arch/alpha/lib/memcpy.c:105: ERROR: space prohibited after that '*' (ctx:WxW)
arch/alpha/lib/memcpy.c:119: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:119: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:123: ERROR: spaces required around that ':' (ctx:VxV)
arch/alpha/lib/memcpy.c:123: ERROR: spaces required around that ':' (ctx:VxV)
arch/alpha/lib/memcpy.c:130: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:130: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:137: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:137: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:142: ERROR: spaces required around that ':' (ctx:VxV)
arch/alpha/lib/memcpy.c:142: ERROR: spaces required around that ':' (ctx:VxV)
arch/alpha/lib/memcpy.c:148: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:148: ERROR: space required after that ',' (ctx:VxV)
arch/alpha/lib/memcpy.c:151: ERROR: "foo * bar" should be "foo *bar"
arch/alpha/lib/memcpy.c:154: WARNING: space prohibited between function name and open parenthesis '('
arch/alpha/lib/memcpy.c:158: WARNING: space prohibited between function name and open parenthesis '('

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/lib/memcpy.c |   38 +++++++++++++++++++-------------------
 1 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/alpha/lib/memcpy.c b/arch/alpha/lib/memcpy.c
index 64083fc..16c32dc 100644
--- a/arch/alpha/lib/memcpy.c
+++ b/arch/alpha/lib/memcpy.c
@@ -21,14 +21,14 @@
  * This should be done in one go with ldq_u*2/mask/stq_u. Do it
  * with a macro so that we can fix it up later..
  */
-#define ALIGN_DEST_TO8_UP(d,s,n) \
+#define ALIGN_DEST_TO8_UP(d, s, n) \
 	while (d & 7) { \
 		if (n <= 0) return; \
 		n--; \
 		*(char *) d = *(char *) s; \
 		d++; s++; \
 	}
-#define ALIGN_DEST_TO8_DN(d,s,n) \
+#define ALIGN_DEST_TO8_DN(d, s, n) \
 	while (d & 7) { \
 		if (n <= 0) return; \
 		n--; \
@@ -40,13 +40,13 @@
  * This should similarly be done with ldq_u*2/mask/stq. The destination
  * is aligned, but we don't fill in a full quad-word
  */
-#define DO_REST_UP(d,s,n) \
+#define DO_REST_UP(d, s, n) \
 	while (n > 0) { \
 		n--; \
 		*(char *) d = *(char *) s; \
 		d++; s++; \
 	}
-#define DO_REST_DN(d,s,n) \
+#define DO_REST_DN(d, s, n) \
 	while (n > 0) { \
 		n--; \
 		d--; s--; \
@@ -57,8 +57,8 @@
  * This should be done with ldq/mask/stq. The source and destination are
  * aligned, but we don't fill in a full quad-word
  */
-#define DO_REST_ALIGNED_UP(d,s,n) DO_REST_UP(d,s,n)
-#define DO_REST_ALIGNED_DN(d,s,n) DO_REST_DN(d,s,n)
+#define DO_REST_ALIGNED_UP(d, s, n) DO_REST_UP(d, s, n)
+#define DO_REST_ALIGNED_DN(d, s, n) DO_REST_DN(d, s, n)
 
 /*
  * This does unaligned memory copies. We want to avoid storing to
@@ -70,7 +70,7 @@
 static inline void __memcpy_unaligned_up (unsigned long d, unsigned long s,
 					  long n)
 {
-	ALIGN_DEST_TO8_UP(d,s,n);
+	ALIGN_DEST_TO8_UP(d, s, n);
 	n -= 8;			/* to avoid compare against 8 in the loop */
 	if (n >= 0) {
 		unsigned long low_word, high_word;
@@ -92,17 +92,17 @@ static inline void __memcpy_unaligned_up (unsigned long d, unsigned long s,
 		} while (n >= 0);
 	}
 	n += 8;
-	DO_REST_UP(d,s,n);
+	DO_REST_UP(d, s, n);
 }
 
-static inline void __memcpy_unaligned_dn (unsigned long d, unsigned long s,
+static inline void __memcpy_unaligned_dn(unsigned long d, unsigned long s,
 					  long n)
 {
 	/* I don't understand AXP assembler well enough for this. -Tim */
 	s += n;
 	d += n;
 	while (n--)
-		* (char *) --d = * (char *) --s;
+		*(char *) --d = *(char *) --s;
 }
 
 /*
@@ -113,10 +113,10 @@ static inline void __memcpy_unaligned_dn (unsigned long d, unsigned long s,
  *
  * Note the ordering to try to avoid load (and address generation) latencies.
  */
-static inline void __memcpy_aligned_up (unsigned long d, unsigned long s,
+static inline void __memcpy_aligned_up(unsigned long d, unsigned long s,
 					long n)
 {
-	ALIGN_DEST_TO8_UP(d,s,n);
+	ALIGN_DEST_TO8_UP(d, s, n);
 	n -= 8;
 	while (n >= 0) {
 		unsigned long tmp;
@@ -127,14 +127,14 @@ static inline void __memcpy_aligned_up (unsigned long d, unsigned long s,
 		d += 8;
 	}
 	n += 8;
-	DO_REST_ALIGNED_UP(d,s,n);
+	DO_REST_ALIGNED_UP(d, s, n);
 }
-static inline void __memcpy_aligned_dn (unsigned long d, unsigned long s,
+static inline void __memcpy_aligned_dn(unsigned long d, unsigned long s,
 					long n)
 {
 	s += n;
 	d += n;
-	ALIGN_DEST_TO8_DN(d,s,n);
+	ALIGN_DEST_TO8_DN(d, s, n);
 	n -= 8;
 	while (n >= 0) {
 		unsigned long tmp;
@@ -145,17 +145,17 @@ static inline void __memcpy_aligned_dn (unsigned long d, unsigned long s,
 		*(unsigned long *) d = tmp;
 	}
 	n += 8;
-	DO_REST_ALIGNED_DN(d,s,n);
+	DO_REST_ALIGNED_DN(d, s, n);
 }
 
-void * memcpy(void * dest, const void *src, size_t n)
+void *memcpy(void *dest, const void *src, size_t n)
 {
 	if (!(((unsigned long) dest ^ (unsigned long) src) & 7)) {
-		__memcpy_aligned_up ((unsigned long) dest, (unsigned long) src,
+		__memcpy_aligned_up((unsigned long) dest, (unsigned long) src,
 				     n);
 		return dest;
 	}
-	__memcpy_unaligned_up ((unsigned long) dest, (unsigned long) src, n);
+	__memcpy_unaligned_up((unsigned long) dest, (unsigned long) src, n);
 	return dest;
 }
 
-- 
1.7.1.251.gf80a2


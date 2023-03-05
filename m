From: Uros Bizjak <ubizjak@gmail.com>
Subject: [PATCH 01/10] locking/atomic: Add missing cast to try_cmpxchg() fallbacks
Date: Sun,  5 Mar 2023 21:56:19 +0100
Message-ID: <20230305205628.27385-2-ubizjak@gmail.com>
References: <20230305205628.27385-1-ubizjak@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVG2kgy9F760CmPn8vSVrkbNIw0KpbygTeYMJL/3wHc=;
        b=asi5utLdWW1N1er0bksuBA8v5b1amWbTv0KOBvgiy8Iq2U+koWsRhR6IqIsB96ZzFo
         RMdO6VENOxHuzI8q6i57ivzsrmds+Qydp0zIcueL5R8/WPuPDj9jwqzGDYz4blWiwMSf
         /W0Z5E6D9C9cNRhuSPhtp98V3I7py6Lt7d3OmAEFtC0xVTDC5m4jYRUFC88j+LQU2U/b
         /rY2VlSnb0DKov6ld71YIylJ++dgLrjqmYWE382OJOZPVSfs/nR5zWbNwRgfUBiF/lnX
         uTxnaw9+jBV/4QcQgK2Dgh2w2pTgCVdFrY9WfPDrzRcXWeoA8lOM2hU2keXlcv7RSB4Q
         ijnw==
In-Reply-To: <20230305205628.27385-1-ubizjak@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>

Cast _oldp to the type of _ptr to avoid incompatible-pointer-types warning.

Fixes: 29f006fdefe6 ("asm-generic/atomic: Add try_cmpxchg() fallbacks")
Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 include/linux/atomic/atomic-arch-fallback.h | 18 +++++++++---------
 scripts/atomic/gen-atomic-fallback.sh       |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/linux/atomic/atomic-arch-fallback.h b/include/linux/atomic/atomic-arch-fallback.h
index 77bc5522e61c..19debd501ee7 100644
--- a/include/linux/atomic/atomic-arch-fallback.h
+++ b/include/linux/atomic/atomic-arch-fallback.h
@@ -87,7 +87,7 @@
 #ifndef arch_try_cmpxchg
 #define arch_try_cmpxchg(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -98,7 +98,7 @@
 #ifndef arch_try_cmpxchg_acquire
 #define arch_try_cmpxchg_acquire(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg_acquire((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -109,7 +109,7 @@
 #ifndef arch_try_cmpxchg_release
 #define arch_try_cmpxchg_release(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg_release((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -120,7 +120,7 @@
 #ifndef arch_try_cmpxchg_relaxed
 #define arch_try_cmpxchg_relaxed(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg_relaxed((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -157,7 +157,7 @@
 #ifndef arch_try_cmpxchg64
 #define arch_try_cmpxchg64(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg64((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -168,7 +168,7 @@
 #ifndef arch_try_cmpxchg64_acquire
 #define arch_try_cmpxchg64_acquire(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg64_acquire((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -179,7 +179,7 @@
 #ifndef arch_try_cmpxchg64_release
 #define arch_try_cmpxchg64_release(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg64_release((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -190,7 +190,7 @@
 #ifndef arch_try_cmpxchg64_relaxed
 #define arch_try_cmpxchg64_relaxed(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg64_relaxed((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -2456,4 +2456,4 @@ arch_atomic64_dec_if_positive(atomic64_t *v)
 #endif
 
 #endif /* _LINUX_ATOMIC_FALLBACK_H */
-// b5e87bdd5ede61470c29f7a7e4de781af3770f09
+// 1b4d4c82ae653389cd1538d5b07170267d9b3837
diff --git a/scripts/atomic/gen-atomic-fallback.sh b/scripts/atomic/gen-atomic-fallback.sh
index 3a07695e3c89..39f447161108 100755
--- a/scripts/atomic/gen-atomic-fallback.sh
+++ b/scripts/atomic/gen-atomic-fallback.sh
@@ -171,7 +171,7 @@ cat <<EOF
 #ifndef arch_try_${cmpxchg}${order}
 #define arch_try_${cmpxchg}${order}(_ptr, _oldp, _new) \\
 ({ \\
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \\
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \\
 	___r = arch_${cmpxchg}${order}((_ptr), ___o, (_new)); \\
 	if (unlikely(___r != ___o)) \\
 		*___op = ___r; \\
-- 
2.39.2


From: Chris Metcalf <cmetcalf@ezchip.com>
Subject: [PATCH v2 2/3] word-at-a-time.h: support zero_bytemask() on alpha and tile
Date: Tue, 6 Oct 2015 15:23:48 -0400
Message-ID: <1444159429-4788-3-git-send-email-cmetcalf@ezchip.com>
References: <1444159429-4788-1-git-send-email-cmetcalf@ezchip.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444159429-4788-1-git-send-email-cmetcalf@ezchip.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>, Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, Alexey Dobriyan <adobriyan@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Ingo Molnar <mingo@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, linux-alpha@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Chris Metcalf <cmetcalf@ezchip.com>

Both alpha and tile needed implementations of zero_bytemask.

The alpha version is untested.

Signed-off-by: Chris Metcalf <cmetcalf@ezchip.com>
---
 arch/alpha/include/asm/word-at-a-time.h | 2 ++
 arch/tile/include/asm/word-at-a-time.h  | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/word-at-a-time.h b/arch/alpha/include/asm/word-at-a-time.h
index 6b340d0f1521..902e6ab00a06 100644
--- a/arch/alpha/include/asm/word-at-a-time.h
+++ b/arch/alpha/include/asm/word-at-a-time.h
@@ -52,4 +52,6 @@ static inline unsigned long find_zero(unsigned long bits)
 #endif
 }
 
+#define zero_bytemask(mask) ((2ul << (find_zero(mask) * 8)) - 1)
+
 #endif /* _ASM_WORD_AT_A_TIME_H */
diff --git a/arch/tile/include/asm/word-at-a-time.h b/arch/tile/include/asm/word-at-a-time.h
index 9e5ce0d7b292..b66a693c2c34 100644
--- a/arch/tile/include/asm/word-at-a-time.h
+++ b/arch/tile/include/asm/word-at-a-time.h
@@ -6,7 +6,7 @@
 struct word_at_a_time { /* unused */ };
 #define WORD_AT_A_TIME_CONSTANTS {}
 
-/* Generate 0x01 byte values for non-zero bytes using a SIMD instruction. */
+/* Generate 0x01 byte values for zero bytes using a SIMD instruction. */
 static inline unsigned long has_zero(unsigned long val, unsigned long *data,
 				     const struct word_at_a_time *c)
 {
@@ -33,4 +33,10 @@ static inline long find_zero(unsigned long mask)
 #endif
 }
 
+#ifdef __BIG_ENDIAN
+#define zero_bytemask(mask) (~1ul << (63 - __builtin_clzl(mask)))
+#else
+#define zero_bytemask(mask) ((2ul << __builtin_ctzl(mask)) - 1)
+#endif
+
 #endif /* _ASM_WORD_AT_A_TIME_H */
-- 
2.1.2

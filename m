From: mattst88@gmail.com
Subject: [PATCH] alpha: simplify and optimize sched_find_first_bit
Date: Thu,  8 Apr 2010 14:34:16 -0400
Message-ID: <1270751656-5614-1-git-send-email-mattst88@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:from:to:cc:subject
         :date:message-id:x-mailer;
        bh=KAaoep8rLyvnR4ur71bw/0AHMlwqSi68Z6yRu6rUVpE=;
        b=EaZb3lYet1ZQHOg9WoO9vazjKYpErjXjXG5YUCWt++m4+1jA97MH1cNVaVdr6Ju9LZ
         whxfKbnsudJEhWDRN6stDMIkfJPdUj1o53Pv3tNXDVLCBv2rRWHR/kpYhQJRa0NI163G
         D1IMMjlgQW5fwKyEWitt2dxoYjay6RSATPTJg=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Matt Turner <mattst88@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@elte.hu>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

From: Matt Turner <mattst88@gmail.com>

Search only the first 100 bits instead of 140, saving a couple
instructions. Also use inline assembly to use cmov instructions instead
of letting gcc emit multiple branches. The resulting code is about 6x
faster.

Thanks to Zack Weinberg and Uros Bizjak (GCC Bug 43691) for helping me
identify problems with the inline assembly.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: linux-alpha@vger.kernel.org
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/bitops.h |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/alpha/include/asm/bitops.h b/arch/alpha/include/asm/bitops.h
index 15f3ae2..cfa7526 100644
--- a/arch/alpha/include/asm/bitops.h
+++ b/arch/alpha/include/asm/bitops.h
@@ -436,22 +436,22 @@ static inline unsigned int hweight8(unsigned int w)
 
 /*
  * Every architecture must define this function. It's the fastest
- * way of searching a 140-bit bitmap where the first 100 bits are
- * unlikely to be set. It's guaranteed that at least one of the 140
- * bits is set.
+ * way of searching a 100-bit bitmap.  It's guaranteed that at least
+ * one of the 100 bits is cleared.
  */
 static inline unsigned long
-sched_find_first_bit(unsigned long b[3])
+sched_find_first_bit(const unsigned long b[2])
 {
-	unsigned long b0 = b[0], b1 = b[1], b2 = b[2];
 	unsigned long ofs;
-
-	ofs = (b1 ? 64 : 128);
-	b1 = (b1 ? b1 : b2);
-	ofs = (b0 ? 0 : ofs);
-	b0 = (b0 ? b0 : b1);
-
-	return __ffs(b0) + ofs;
+	unsigned long output;
+	asm(
+		"cmoveq %0,64,%1        # ofs = (b[0] ? ofs : 64);\n"
+		"cmoveq %0,%2,%0        # temp = (b[0] ? b[0] : b[1]);\n"
+		"cttz   %0,%0           # output = cttz(temp);\n "
+		: "=r" (output), "=r" (ofs)
+		: "r" (b[1]), "0" (b[0]), "1" (0)
+	);
+	return output + ofs;
 }
 
 #include <asm-generic/bitops/ext2-non-atomic.h>
-- 
1.6.4.4


From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: simplify and optimize sched_find_first_bit
Date: Wed, 28 Apr 2010 23:37:56 -0400
Message-ID: <1272512276-25975-1-git-send-email-mattst88@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:from:to:cc:subject
         :date:message-id:x-mailer;
        bh=K71bzdcSg6LumOGxfezbpPEf7+ZZLYnd6z5lEGJJpLI=;
        b=MelpjchdNYJUG1AwtL16o/Pi7nEOqNbhxVYKPNOkDg691X6VKX9jHO0yXI5I8rwATz
         B5oCjQJClOEyvRu5moq95UQfiCPReplNzl3MziTtg36kDUTrdeU0hIGDAugbW5I0hJCw
         q02rRVW+1M3FT5HNTv8ZMeAhGGqzoIUhvdnqc=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Matt Turner <mattst88@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@elte.hu>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

Search only the first 100 bits instead of 140, saving a couple
instructions. The resulting code is about 1/3 faster (40K ticks/1000
iterations down to 30K ticks/1000 iterations).

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: linux-alpha@vger.kernel.org
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/bitops.h |   20 +++++++++-----------
 1 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/alpha/include/asm/bitops.h b/arch/alpha/include/asm/bitops.h
index 15f3ae2..2e49c1f 100644
--- a/arch/alpha/include/asm/bitops.h
+++ b/arch/alpha/include/asm/bitops.h
@@ -436,22 +436,20 @@ static inline unsigned int hweight8(unsigned int w)
 
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
-	unsigned long ofs;
+	unsigned long b0, b1, ofs, tmp;
 
-	ofs = (b1 ? 64 : 128);
-	b1 = (b1 ? b1 : b2);
-	ofs = (b0 ? 0 : ofs);
-	b0 = (b0 ? b0 : b1);
+	b0 = b[0];
+	b1 = b[1];
+	ofs = (b0 ? 0 : 64);
+	tmp = (b0 ? b0 : b1);
 
-	return __ffs(b0) + ofs;
+	return __ffs(tmp) + ofs;
 }
 
 #include <asm-generic/bitops/ext2-non-atomic.h>
-- 
1.6.5.3


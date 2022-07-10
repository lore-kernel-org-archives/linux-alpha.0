From: Eddie Lin <eddielin0926@gmail.com>
Subject: [PATCH] sched: fix comment for sched_find_first_bit()
Date: Sun, 10 Jul 2022 23:21:19 +0800
Message-ID: <20220710152119.3803-1-eddielin0926@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WVaXUpEXnFSePOO8ybge03AZi2rbsxwDM73MjsfciaA=;
        b=fjOx5BDu2Ebd4rD5ClRZmZKdSiH64xI+ffYK12U2eZ3Ho9NVhY5cUI4WGrMYopF/zE
         n7yOlrbwBD206k/nLmjhpEW7/Fb3HNYM15hJbhz2nCpIApJ34FAkvtrADJFRvKLjEMOX
         s6NI9pdvd+sE3/zXzwOwGq/OmmjVDW/IS1zOgru3Pq8ekvBoxzPFhDermDMWx2cshfN3
         NavwUBAm1axI9ZpKpNPE/GKO8LjxRVm6qPlRv/GOIN1YPiTozObjUQZay8rTh3n1XuiW
         4t2F0INqf0PZ4+5f5Ct1249duxQjPyFlxq0NP28w9sBBVOow+aozUJjbcL5huklbiJ9B
         A88w==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: arnd@arndb.de
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, eddielin0926@gmail.com

The result of __ffs is undefined if the word is zero. Therefore, it
should be guaranteed that at least one of the 100 bits is set.

Signed-off-by: Eddie Lin <eddielin0926@gmail.com>
---
 arch/alpha/include/asm/bitops.h    | 4 ++--
 include/asm-generic/bitops/sched.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/include/asm/bitops.h b/arch/alpha/include/asm/bitops.h
index e1d8483a4..9af3528f5 100644
--- a/arch/alpha/include/asm/bitops.h
+++ b/arch/alpha/include/asm/bitops.h
@@ -434,8 +434,8 @@ static inline unsigned int __arch_hweight8(unsigned int w)
 
 /*
  * Every architecture must define this function. It's the fastest
- * way of searching a 100-bit bitmap.  It's guaranteed that at least
- * one of the 100 bits is cleared.
+ * way of searching a 100-bit bitmap. It's guaranteed that at least
+ * one of the 100 bits is set.
  */
 static inline unsigned long
 sched_find_first_bit(const unsigned long b[2])
diff --git a/include/asm-generic/bitops/sched.h b/include/asm-generic/bitops/sched.h
index 86470cfce..2b614eb40 100644
--- a/include/asm-generic/bitops/sched.h
+++ b/include/asm-generic/bitops/sched.h
@@ -7,8 +7,8 @@
 
 /*
  * Every architecture must define this function. It's the fastest
- * way of searching a 100-bit bitmap.  It's guaranteed that at least
- * one of the 100 bits is cleared.
+ * way of searching a 100-bit bitmap. It's guaranteed that at least
+ * one of the 100 bits is set.
  */
 static inline int sched_find_first_bit(const unsigned long *b)
 {
-- 
2.25.1


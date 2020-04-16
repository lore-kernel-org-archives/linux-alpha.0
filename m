From: Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 01/11] alpha: Add clear_bit_unlock_is_negative_byte implementation
Date: Thu, 16 Apr 2020 15:01:20 -0700
Message-ID: <20200416220130.13343-2-willy@infradead.org>
References: <20200416220130.13343-1-willy@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=aO1fN0fbVh2ayP7yJD7ISd8Eo2lcaZKKQzdebmXo4PQ=; b=tNL7iD41PJak5MbgEcMKlUs8sM
        HkQ4N6Xn7iLsZU9wAUE9FCT3x8Odr3rQIFtinuDh3Xfjy2rGZ3T+6N+ZrT8hthLKgq0+DcPvx8dVf
        Jlcpqse1/0M9oOMB5M0C85RIy//qrSW2uzNCVdXJ7p9bJGcFzVyyT5WAj9oVzuIpy+OQLD8eLx0yR
        3YnWsUnT7lfQmYe7+X6nRWQ+ueUygPi8RAJhiFYZE9pssSwBBj++J/N2/1KX4EY2TqbVmT4CCha1b
        LmG7YrdMNVCyCQIg9c8OYvX0fLdnAzFGz1XuWf3iu3hlqQCPjCMWgEFpqKyV+Vqt5NqHIEfFM0H2T
        FIK8R5Ig==;
In-Reply-To: <20200416220130.13343-1-willy@infradead.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Copy and paste the clear_bit_unlock() implementation, and test the temp
variable to see if it has bit 7 set.  Saves two instructions: a load
and a compare:

      860:      01 31 20 44     andnot  t0,0x1,t0
      864:      00 00 30 b8     stl_c   t0,0(a0)
      868:      67 1b 20 e4     beq     t0,7608 <generic_file_write_iter+0x218>
-     86c:      00 00 30 a0     ldl     t0,0(a0)
-     870:      01 10 30 44     and     t0,0x80,t0
-     874:      a1 03 e1 43     cmpult  zero,t0,t0
-     878:      01 00 20 f4     bne     t0,880 <unlock_page+0x40>
-     87c:      01 80 fa 6b     ret
+     86c:      01 10 30 44     and     t0,0x80,t0
+     870:      03 00 20 f4     bne     t0,880 <unlock_page+0x40>
+     874:      01 80 fa 6b     ret

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
---
 arch/alpha/include/asm/bitops.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/alpha/include/asm/bitops.h b/arch/alpha/include/asm/bitops.h
index 5adca78830b5..f9af2401bd23 100644
--- a/arch/alpha/include/asm/bitops.h
+++ b/arch/alpha/include/asm/bitops.h
@@ -79,6 +79,29 @@ clear_bit_unlock(unsigned long nr, volatile void * addr)
 	clear_bit(nr, addr);
 }
 
+static inline bool clear_bit_unlock_is_negative_byte(unsigned int nr,
+						     volatile unsigned long *p)
+{
+	unsigned long temp;
+	int *m = ((int *)p) + (nr >> 5);
+
+	smp_mb();
+	__asm__ __volatile__(
+	"1:	ldl_l %0,%3\n"
+	"	bic %0,%2,%0\n"
+	"	stl_c %0,%1\n"
+	"	beq %0,2f\n"
+	".subsection 2\n"
+	"2:	br 1b\n"
+	".previous"
+	:"=&r" (temp), "=m" (*m)
+	:"Ir" (1UL << (nr & 31)), "m" (*m));
+
+	return temp & 128;
+}
+#define clear_bit_unlock_is_negative_byte \
+	clear_bit_unlock_is_negative_byte
+
 /*
  * WARNING: non atomic version.
  */
-- 
2.25.1


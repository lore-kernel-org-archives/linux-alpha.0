From: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 2/9] lib/bitmap: implement bitmap_{empty,full} with bitmap_weight_eq()
Date: Sat, 27 Nov 2021 19:56:57 -0800
Message-ID: <20211128035704.270739-3-yury.norov__26497.3107188538$1638071974$gmane$org@gmail.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YFV+i9qtOAvvG/eHCEjEWYh2+rKTUYToGFh2vpYai2U=;
        b=chiNDciN+mw9g7Ak1NHLuh8JPanlDYqkr1Pqo9eXdqgWZ0s7k4fLNVOVPgZUy6fkjm
         kaMyVzCokAqk119GQ8bzMKTD05UnC2FTd2NOgUZAuBVJtU7OP6dPqa5dQADPwgyWsto1
         Qv1eYll6UW8OHMmGkZcKU7HQROuuQpM5PrHzE0PCqYInI5DE0pZxTqf6wqpbepCFwaYA
         7371+oA9ttpW8PTeiT4qmfRXFL7wexA7P+pfduuTdwQnWhGwAzwYwRUFFxeLfik+qWvy
         kjSjMD+0Dx+qa8H1ARTwTRP8Y3AdRV2VBfJsjVegnLilYyAezvNXn/8F0Y7/ZQsYb6VK
         yFGw==
In-Reply-To: <20211128035704.270739-1-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>

Now as we have bitmap_weight_eq(), switch bitmap_full() and
bitmap_empty() to using it.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/bitmap.h | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 996041f771c8..2d951e4dc814 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -386,22 +386,6 @@ static inline int bitmap_subset(const unsigned long *src1,
 		return __bitmap_subset(src1, src2, nbits);
 }
 
-static inline bool bitmap_empty(const unsigned long *src, unsigned nbits)
-{
-	if (small_const_nbits(nbits))
-		return ! (*src & BITMAP_LAST_WORD_MASK(nbits));
-
-	return find_first_bit(src, nbits) == nbits;
-}
-
-static inline bool bitmap_full(const unsigned long *src, unsigned int nbits)
-{
-	if (small_const_nbits(nbits))
-		return ! (~(*src) & BITMAP_LAST_WORD_MASK(nbits));
-
-	return find_first_zero_bit(src, nbits) == nbits;
-}
-
 static __always_inline int bitmap_weight(const unsigned long *src, unsigned int nbits)
 {
 	if (small_const_nbits(nbits))
@@ -436,6 +420,16 @@ static __always_inline bool bitmap_weight_le(const unsigned long *src,
 	return __bitmap_weight_le(src, nbits, num);
 }
 
+static __always_inline bool bitmap_empty(const unsigned long *src, unsigned int nbits)
+{
+	return bitmap_weight_eq(src, nbits, 0);
+}
+
+static __always_inline bool bitmap_full(const unsigned long *src, unsigned int nbits)
+{
+	return bitmap_weight_eq(src, nbits, nbits);
+}
+
 static __always_inline void bitmap_set(unsigned long *map, unsigned int start,
 		unsigned int nbits)
 {
-- 
2.25.1


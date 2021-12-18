From: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 16/17] tools/bitmap: sync bitmap_weight
Date: Sat, 18 Dec 2021 13:20:12 -0800
Message-ID: <20211218212014.1315894-17-yury.norov__36159.6635704458$1639862572$gmane$org@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cEbjV/8Ctr1QdXazsGfe+PbDs+iZrrBmmo9YNkbLBy0=;
        b=RKeJvy+TVkzSfE1DWFH8SBdk923FOhJaAQ0Dv9PrOLQIHftv5DaeBCB4tNKlvmYIPN
         nbkzjP+1Trtphdpdl224Vn1sYOGVLTg43YwIfJM5nH7KPfFHi7vCRPN0TaIMV0CuMzT2
         orCQwO8bJ9qk1nVA1GCOdVDNRIyHknNBzcXqS9rgvqtOTbjhHhWXGI5No2Z0UTz3TByx
         0Ag3UOeLtIQjs7s0rKEZ/24IhDlJLiBtoBDajcozUIGSHrQXSkW6AtgOu9kPk/Lq3qoc
         U8VDenhPvveU8b2bWmVJzG2Nt6HLvQlM90dIQDx+rucC4nLouHJTrpPqTNt21VK+DFl2
         nNhg==
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>

Pull bitmap_weight_{cmp,eq,gt,ge,lt,le} from mother kernel and
use where applicable.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 tools/include/linux/bitmap.h | 44 ++++++++++++++++++++++++++++++++++++
 tools/lib/bitmap.c           | 20 ++++++++++++++++
 tools/perf/util/pmu.c        |  2 +-
 3 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/tools/include/linux/bitmap.h b/tools/include/linux/bitmap.h
index ea97804d04d4..e8ae9a85d555 100644
--- a/tools/include/linux/bitmap.h
+++ b/tools/include/linux/bitmap.h
@@ -12,6 +12,8 @@
 	unsigned long name[BITS_TO_LONGS(bits)]
 
 int __bitmap_weight(const unsigned long *bitmap, int bits);
+int __bitmap_weight_cmp(const unsigned long *bitmap, unsigned int bits,
+			 unsigned int num);
 void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
 		 const unsigned long *bitmap2, int bits);
 int __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
@@ -68,6 +70,48 @@ static inline int bitmap_weight(const unsigned long *src, unsigned int nbits)
 	return __bitmap_weight(src, nbits);
 }
 
+static __always_inline
+int bitmap_weight_cmp(const unsigned long *src, unsigned int nbits, int num)
+{
+	if (num > (int)nbits || num < 0)
+		return -num;
+
+	if (small_const_nbits(nbits))
+		return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits)) - num;
+
+	return __bitmap_weight_cmp(src, nbits, num);
+}
+
+static __always_inline
+bool bitmap_weight_eq(const unsigned long *src, unsigned int nbits, int num)
+{
+	return bitmap_weight_cmp(src, nbits, num) == 0;
+}
+
+static __always_inline
+bool bitmap_weight_gt(const unsigned long *src, unsigned int nbits, int num)
+{
+	return bitmap_weight_cmp(src, nbits, num) > 0;
+}
+
+static __always_inline
+bool bitmap_weight_ge(const unsigned long *src, unsigned int nbits, int num)
+{
+	return bitmap_weight_cmp(src, nbits, num - 1) > 0;
+}
+
+static __always_inline
+bool bitmap_weight_lt(const unsigned long *src, unsigned int nbits, int num)
+{
+	return bitmap_weight_cmp(src, nbits, num - 1) <= 0;
+}
+
+static __always_inline
+bool bitmap_weight_le(const unsigned long *src, unsigned int nbits, int num)
+{
+	return bitmap_weight_cmp(src, nbits, num) <= 0;
+}
+
 static inline void bitmap_or(unsigned long *dst, const unsigned long *src1,
 			     const unsigned long *src2, unsigned int nbits)
 {
diff --git a/tools/lib/bitmap.c b/tools/lib/bitmap.c
index db466ef7be9d..06e58fee8523 100644
--- a/tools/lib/bitmap.c
+++ b/tools/lib/bitmap.c
@@ -18,6 +18,26 @@ int __bitmap_weight(const unsigned long *bitmap, int bits)
 	return w;
 }
 
+int __bitmap_weight_cmp(const unsigned long *bitmap, unsigned int bits, int num)
+{
+	unsigned int k, w, lim = bits / BITS_PER_LONG;
+
+	for (k = 0, w = 0; k < lim; k++) {
+		if (w + bits - k * BITS_PER_LONG < num)
+			goto out;
+
+		w += hweight_long(bitmap[k]);
+
+		if (w > num)
+			goto out;
+	}
+
+	if (bits % BITS_PER_LONG)
+		w += hweight_long(bitmap[k] & BITMAP_LAST_WORD_MASK(bits));
+out:
+	return w - num;
+}
+
 void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
 		 const unsigned long *bitmap2, int bits)
 {
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 6ae58406f4fc..015ee1321c7c 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1314,7 +1314,7 @@ static int pmu_config_term(const char *pmu_name,
 	 */
 	if (term->type_val == PARSE_EVENTS__TERM_TYPE_NUM) {
 		if (term->no_value &&
-		    bitmap_weight(format->bits, PERF_PMU_FORMAT_BITS) > 1) {
+		    bitmap_weight_gt(format->bits, PERF_PMU_FORMAT_BITS, 1)) {
 			if (err) {
 				parse_events_error__handle(err, term->err_val,
 					   strdup("no value assigned for term"),
-- 
2.30.2


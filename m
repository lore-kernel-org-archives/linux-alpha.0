From: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 4/9] tools: sync bitmap_weight() usage with the kernel
Date: Sat, 27 Nov 2021 19:56:59 -0800
Message-ID: <20211128035704.270739-5-yury.norov__3863.56636170007$1638071982$gmane$org@gmail.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=H+0/mMWVLBc0wFNpOhji1TJiaceI6QMtcr7R9Q6dM20=;
        b=lVAvJuseRVdeHTOo2Y7mk5xddpnWMThQC/FDqaOqWEil7NGqGvuTT2vTtc8JApB1On
         rwTrnsliJwpLmiyQSM9OqqWa6EPw1ymcYojog7rfeiVURqwEdf9hS6xTZe8oDGGwHdny
         aK1w2tg5Ekqv9iv81kAt7Npug+iyEUgf4o3nEvYzrRlhZteFt02vrviCT9i+8phbPXRu
         JJqg4OHU+ohLAbgYCuyVHyXqucl7jQ4rcAejOtbHfC4KnrOUVWH2RMVL4Idjxyc1kFhq
         oY2cTtJH+fz+Xupw9BJ2IoO73mMs9A7hwVo8/Z5tWCtaVDaOzAvUblIFixjHUSHPMB1Y
         bM1g==
In-Reply-To: <20211128035704.270739-1-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>

bitmap_weight() counts all set bits in the bitmap unconditionally.
However in some cases we can traverse a part of bitmap when we
only need to check if number of set bits is greater, less or equal
to some number.

This patch adds bitmap_weight_{eq,gt,le}, reimplements bitmap_{empty,full}
and replace bitmap_weight() where appropriate.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 tools/include/linux/bitmap.h | 42 +++++++++++++++++++------
 tools/lib/bitmap.c           | 60 ++++++++++++++++++++++++++++++++++++
 tools/perf/builtin-c2c.c     |  4 +--
 tools/perf/util/pmu.c        |  2 +-
 4 files changed, 96 insertions(+), 12 deletions(-)

diff --git a/tools/include/linux/bitmap.h b/tools/include/linux/bitmap.h
index ea97804d04d4..eb2831f7e5a7 100644
--- a/tools/include/linux/bitmap.h
+++ b/tools/include/linux/bitmap.h
@@ -12,6 +12,9 @@
 	unsigned long name[BITS_TO_LONGS(bits)]
 
 int __bitmap_weight(const unsigned long *bitmap, int bits);
+bool __bitmap_weight_eq(const unsigned long *bitmap, unsigned int nbits, unsigned int num);
+bool __bitmap_weight_gt(const unsigned long *bitmap, unsigned int nbits, unsigned int num);
+bool __bitmap_weight_le(const unsigned long *bitmap, unsigned int nbits, unsigned int num);
 void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
 		 const unsigned long *bitmap2, int bits);
 int __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
@@ -45,27 +48,48 @@ static inline void bitmap_fill(unsigned long *dst, unsigned int nbits)
 	dst[nlongs - 1] = BITMAP_LAST_WORD_MASK(nbits);
 }
 
-static inline int bitmap_empty(const unsigned long *src, unsigned nbits)
+static inline int bitmap_weight(const unsigned long *src, unsigned int nbits)
 {
 	if (small_const_nbits(nbits))
-		return ! (*src & BITMAP_LAST_WORD_MASK(nbits));
+		return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits));
+	return __bitmap_weight(src, nbits);
+}
 
-	return find_first_bit(src, nbits) == nbits;
+static __always_inline bool bitmap_weight_eq(const unsigned long *src,
+			unsigned int nbits, unsigned int num)
+{
+	if (small_const_nbits(nbits))
+		return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits)) == num;
+
+	return __bitmap_weight_eq(src, nbits, num);
 }
 
-static inline int bitmap_full(const unsigned long *src, unsigned int nbits)
+static __always_inline bool bitmap_weight_gt(const unsigned long *src,
+			unsigned int nbits, unsigned int num)
 {
 	if (small_const_nbits(nbits))
-		return ! (~(*src) & BITMAP_LAST_WORD_MASK(nbits));
+		return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits)) > num;
 
-	return find_first_zero_bit(src, nbits) == nbits;
+	return __bitmap_weight_gt(src, nbits, num);
 }
 
-static inline int bitmap_weight(const unsigned long *src, unsigned int nbits)
+static __always_inline bool bitmap_weight_le(const unsigned long *src,
+			unsigned int nbits, unsigned int num)
 {
 	if (small_const_nbits(nbits))
-		return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits));
-	return __bitmap_weight(src, nbits);
+		return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits)) < num;
+
+	return __bitmap_weight_le(src, nbits, num);
+}
+
+static __always_inline bool bitmap_empty(const unsigned long *src, unsigned int nbits)
+{
+	return bitmap_weight_eq(src, nbits, 0);
+}
+
+static __always_inline bool bitmap_full(const unsigned long *src, unsigned int nbits)
+{
+	return bitmap_weight_eq(src, nbits, nbits);
 }
 
 static inline void bitmap_or(unsigned long *dst, const unsigned long *src1,
diff --git a/tools/lib/bitmap.c b/tools/lib/bitmap.c
index db466ef7be9d..3aaf1767d237 100644
--- a/tools/lib/bitmap.c
+++ b/tools/lib/bitmap.c
@@ -18,6 +18,66 @@ int __bitmap_weight(const unsigned long *bitmap, int bits)
 	return w;
 }
 
+bool __bitmap_weight_eq(const unsigned long *bitmap, unsigned int bits, unsigned int num)
+{
+	unsigned int k, w, lim = bits / BITS_PER_LONG;
+
+	for (k = 0, w = 0; k < lim; k++) {
+		if (w + bits - k * BITS_PER_LONG < num)
+			return false;
+
+		w += hweight_long(bitmap[k]);
+
+		if (w > num)
+			return false;
+	}
+
+	if (bits % BITS_PER_LONG)
+		w += hweight_long(bitmap[k] & BITMAP_LAST_WORD_MASK(bits));
+
+	return w == num;
+}
+
+bool __bitmap_weight_gt(const unsigned long *bitmap, unsigned int bits, unsigned int num)
+{
+	unsigned int k, w, lim = bits / BITS_PER_LONG;
+
+	for (k = 0, w = 0; k < lim; k++) {
+		if (w + bits - k * BITS_PER_LONG <= num)
+			return false;
+
+		w += hweight_long(bitmap[k]);
+
+		if (w > num)
+			return true;
+	}
+
+	if (bits % BITS_PER_LONG)
+		w += hweight_long(bitmap[k] & BITMAP_LAST_WORD_MASK(bits));
+
+	return w > num;
+}
+
+bool __bitmap_weight_le(const unsigned long *bitmap, unsigned int bits, unsigned int num)
+{
+	unsigned int k, w, lim = bits / BITS_PER_LONG;
+
+	for (k = 0, w = 0; k < lim; k++) {
+		if (w + bits - k * BITS_PER_LONG < num)
+			return true;
+
+		w += hweight_long(bitmap[k]);
+
+		if (w >= num)
+			return false;
+	}
+
+	if (bits % BITS_PER_LONG)
+		w += hweight_long(bitmap[k] & BITMAP_LAST_WORD_MASK(bits));
+
+	return w < num;
+}
+
 void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
 		 const unsigned long *bitmap2, int bits)
 {
diff --git a/tools/perf/builtin-c2c.c b/tools/perf/builtin-c2c.c
index b5c67ef73862..51997386fb31 100644
--- a/tools/perf/builtin-c2c.c
+++ b/tools/perf/builtin-c2c.c
@@ -1080,7 +1080,7 @@ node_entry(struct perf_hpp_fmt *fmt __maybe_unused, struct perf_hpp *hpp,
 		bitmap_zero(set, c2c.cpus_cnt);
 		bitmap_and(set, c2c_he->cpuset, c2c.nodes[node], c2c.cpus_cnt);
 
-		if (!bitmap_weight(set, c2c.cpus_cnt)) {
+		if (bitmap_empty(set, c2c.cpus_cnt)) {
 			if (c2c.node_info == 1) {
 				ret = scnprintf(hpp->buf, hpp->size, "%21s", " ");
 				advance_hpp(hpp, ret);
@@ -1944,7 +1944,7 @@ static int set_nodestr(struct c2c_hist_entry *c2c_he)
 	if (c2c_he->nodestr)
 		return 0;
 
-	if (bitmap_weight(c2c_he->nodeset, c2c.nodes_cnt)) {
+	if (!bitmap_empty(c2c_he->nodeset, c2c.nodes_cnt)) {
 		len = bitmap_scnprintf(c2c_he->nodeset, c2c.nodes_cnt,
 				      buf, sizeof(buf));
 	} else {
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
2.25.1


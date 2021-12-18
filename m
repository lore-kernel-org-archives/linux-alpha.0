From: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 10/17] lib/nodemask: add nodemask_weight_{eq,gt,ge,lt,le}
Date: Sat, 18 Dec 2021 13:20:06 -0800
Message-ID: <20211218212014.1315894-11-yury.norov__5608.87966291688$1639862479$gmane$org@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CEg5Pz3jzK+yQWJ1b0gYNPIQm++ujg7tBpTQAFfsgrU=;
        b=eHOpKLINiZVw1U8UFLmv4Z4orUsxMHu+htgZlUDET11qp6Xd7CyNXR8JJgc+Do9AtO
         3GiFTQq1k3gdmq11sXaXRequzZr5JLiN1ST8SltutFMt0Ut4vjnWsFkLx5x/LH+J7CgT
         9yorXhsUWIRB06dk0K6v5eIPVRBqMJY2Fuz1xiOJvI/LXDTuQVNjNlbnagLP/dEwkxQr
         og7VA+7k41dDowSRrQm1WJKv9RiBZnFc7NtVisoEJRIhXLga9sDmCfszVXjyJtpvXsLX
         jb68zUDuR+zJaayYQ4raYutAZdhAFVDWfd717kmQBxY79TgsQLCen1fY3ep1+UZrNOrO
         LWww==
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>

Kernel code calls nodes_weight() to compare the weight of nodemask with
a given number. We can do it more efficiently with nodes_weight_{eq, ...}
because conditional nodes_weight may stop traversing the nodemask earlier,
as soon as condition is met.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/acpi/numa/srat.c |  2 +-
 include/linux/nodemask.h | 35 +++++++++++++++++++++++++++++++++++
 mm/mempolicy.c           |  2 +-
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
index 66a0142dc78c..484b9307f8cc 100644
--- a/drivers/acpi/numa/srat.c
+++ b/drivers/acpi/numa/srat.c
@@ -67,7 +67,7 @@ int acpi_map_pxm_to_node(int pxm)
 	node = pxm_to_node_map[pxm];
 
 	if (node == NUMA_NO_NODE) {
-		if (nodes_weight(nodes_found_map) >= MAX_NUMNODES)
+		if (nodes_weight_ge(nodes_found_map, MAX_NUMNODES))
 			return NUMA_NO_NODE;
 		node = first_unset_node(nodes_found_map);
 		__acpi_map_pxm_to_node(pxm, node);
diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 567c3ddba2c4..197598e075e9 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -38,6 +38,11 @@
  * int nodes_empty(mask)		Is mask empty (no bits sets)?
  * int nodes_full(mask)			Is mask full (all bits sets)?
  * int nodes_weight(mask)		Hamming weight - number of set bits
+ * bool nodes_weight_eq(src, nbits, num) Hamming Weight is equal to num
+ * bool nodes_weight_gt(src, nbits, num) Hamming Weight is greater than num
+ * bool nodes_weight_ge(src, nbits, num) Hamming Weight is greater than or equal to num
+ * bool nodes_weight_lt(src, nbits, num) Hamming Weight is less than num
+ * bool nodes_weight_le(src, nbits, num) Hamming Weight is less than or equal to num
  *
  * void nodes_shift_right(dst, src, n)	Shift right
  * void nodes_shift_left(dst, src, n)	Shift left
@@ -240,6 +245,36 @@ static inline int __nodes_weight(const nodemask_t *srcp, unsigned int nbits)
 	return bitmap_weight(srcp->bits, nbits);
 }
 
+#define nodes_weight_eq(nodemask, num) __nodes_weight_eq(&(nodemask), MAX_NUMNODES, (num))
+static inline int __nodes_weight_eq(const nodemask_t *srcp, unsigned int nbits, int num)
+{
+	return bitmap_weight_eq(srcp->bits, nbits, num);
+}
+
+#define nodes_weight_gt(nodemask, num) __nodes_weight_gt(&(nodemask), MAX_NUMNODES, (num))
+static inline int __nodes_weight_gt(const nodemask_t *srcp, unsigned int nbits, int num)
+{
+	return bitmap_weight_gt(srcp->bits, nbits, num);
+}
+
+#define nodes_weight_ge(nodemask, num) __nodes_weight_ge(&(nodemask), MAX_NUMNODES, (num))
+static inline int __nodes_weight_ge(const nodemask_t *srcp, unsigned int nbits, int num)
+{
+	return bitmap_weight_ge(srcp->bits, nbits, num);
+}
+
+#define nodes_weight_lt(nodemask, num) __nodes_weight_lt(&(nodemask), MAX_NUMNODES, (num))
+static inline int __nodes_weight_lt(const nodemask_t *srcp, unsigned int nbits, int num)
+{
+	return bitmap_weight_lt(srcp->bits, nbits, num);
+}
+
+#define nodes_weight_le(nodemask, num) __nodes_weight_le(&(nodemask), MAX_NUMNODES, (num))
+static inline int __nodes_weight_le(const nodemask_t *srcp, unsigned int nbits, int num)
+{
+	return bitmap_weight_le(srcp->bits, nbits, num);
+}
+
 #define nodes_shift_right(dst, src, n) \
 			__nodes_shift_right(&(dst), &(src), (n), MAX_NUMNODES)
 static inline void __nodes_shift_right(nodemask_t *dstp,
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index a86590b2507d..27817cf2f2a0 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -1157,7 +1157,7 @@ int do_migrate_pages(struct mm_struct *mm, const nodemask_t *from,
 			 *          [0-7] - > [3,4,5] moves only 0,1,2,6,7.
 			 */
 
-			if ((nodes_weight(*from) != nodes_weight(*to)) &&
+			if (!nodes_weight_eq(*from, nodes_weight(*to)) &&
 						(node_isset(s, *to)))
 				continue;
 
-- 
2.30.2


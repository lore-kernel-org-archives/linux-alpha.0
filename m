From: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 6/9] lib/nodemask: add nodemask_weight_{eq,gt,le}
Date: Sat, 27 Nov 2021 19:57:01 -0800
Message-ID: <20211128035704.270739-7-yury.norov__37131.179757283$1638071986$gmane$org@gmail.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jzLzZlFUvFeqj4QS59vSNbpytRIoqeqf9/2ASrWiyLI=;
        b=XZk2hdbImcYXcyTC2jMa8yUglMKlAaSa3xH9sAgN8RhIne1RnBqfSUZL708Dj5PShJ
         1QAgIr7OGJSVFq2mZi9yqGYZICTi3cTPrtQ0tOobYJNIG4wvvbUN4d801KAluKhZSNaw
         5kUnpLot57OvMvoht9gsbXIMAs09ng0JZiqnM+0yYWP+TepGtZssa5wn06dX9ufDHnvD
         ZPHBWKdLOu3HgdCy3bnlMuzdGZFZAy+/D4yK35zPune2uhYUFd+hI1kPxLZJWSAJgOhj
         nARVFLZUHE85Uc6xvOKK1lK1j8FJ1rHLaJoLnfMbZbIjECHtDtB3Pw6waYVEs3Vzk86C
         rZ8A==
In-Reply-To: <20211128035704.270739-1-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexey Klimov <aklimov@redhat.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>, Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>

Add nodemask_weight_{eq,gt,le} and replace nodemask_weight() where
appropriate. This allows nodemask_weight_*() to return earlier
depending on the condition.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/x86/mm/amdtopology.c    |  2 +-
 arch/x86/mm/numa_emulation.c |  4 ++--
 drivers/acpi/numa/srat.c     |  2 +-
 include/linux/nodemask.h     | 24 ++++++++++++++++++++++++
 mm/mempolicy.c               |  2 +-
 5 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/x86/mm/amdtopology.c b/arch/x86/mm/amdtopology.c
index 058b2f36b3a6..b3ca7d23e4b0 100644
--- a/arch/x86/mm/amdtopology.c
+++ b/arch/x86/mm/amdtopology.c
@@ -154,7 +154,7 @@ int __init amd_numa_init(void)
 		node_set(nodeid, numa_nodes_parsed);
 	}
 
-	if (!nodes_weight(numa_nodes_parsed))
+	if (nodes_empty(numa_nodes_parsed))
 		return -ENOENT;
 
 	/*
diff --git a/arch/x86/mm/numa_emulation.c b/arch/x86/mm/numa_emulation.c
index 1a02b791d273..9a9305367fdd 100644
--- a/arch/x86/mm/numa_emulation.c
+++ b/arch/x86/mm/numa_emulation.c
@@ -123,7 +123,7 @@ static int __init split_nodes_interleave(struct numa_meminfo *ei,
 	 * Continue to fill physical nodes with fake nodes until there is no
 	 * memory left on any of them.
 	 */
-	while (nodes_weight(physnode_mask)) {
+	while (!nodes_empty(physnode_mask)) {
 		for_each_node_mask(i, physnode_mask) {
 			u64 dma32_end = PFN_PHYS(MAX_DMA32_PFN);
 			u64 start, limit, end;
@@ -270,7 +270,7 @@ static int __init split_nodes_size_interleave_uniform(struct numa_meminfo *ei,
 	 * Fill physical nodes with fake nodes of size until there is no memory
 	 * left on any of them.
 	 */
-	while (nodes_weight(physnode_mask)) {
+	while (!nodes_empty(physnode_mask)) {
 		for_each_node_mask(i, physnode_mask) {
 			u64 dma32_end = PFN_PHYS(MAX_DMA32_PFN);
 			u64 start, limit, end;
diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
index 66a0142dc78c..c4f80d2d85bf 100644
--- a/drivers/acpi/numa/srat.c
+++ b/drivers/acpi/numa/srat.c
@@ -67,7 +67,7 @@ int acpi_map_pxm_to_node(int pxm)
 	node = pxm_to_node_map[pxm];
 
 	if (node == NUMA_NO_NODE) {
-		if (nodes_weight(nodes_found_map) >= MAX_NUMNODES)
+		if (nodes_weight_gt(nodes_found_map, MAX_NUMNODES + 1))
 			return NUMA_NO_NODE;
 		node = first_unset_node(nodes_found_map);
 		__acpi_map_pxm_to_node(pxm, node);
diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 567c3ddba2c4..3801ec5b06f4 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -38,6 +38,9 @@
  * int nodes_empty(mask)		Is mask empty (no bits sets)?
  * int nodes_full(mask)			Is mask full (all bits sets)?
  * int nodes_weight(mask)		Hamming weight - number of set bits
+ * bool nodes_weight_eq(src, nbits, num) Hamming Weight is equal to num
+ * bool nodes_weight_gt(src, nbits, num) Hamming Weight is greater than num
+ * bool nodes_weight_le(src, nbits, num) Hamming Weight is less than num
  *
  * void nodes_shift_right(dst, src, n)	Shift right
  * void nodes_shift_left(dst, src, n)	Shift left
@@ -240,6 +243,27 @@ static inline int __nodes_weight(const nodemask_t *srcp, unsigned int nbits)
 	return bitmap_weight(srcp->bits, nbits);
 }
 
+#define nodes_weight_eq(nodemask, num) __nodes_weight_eq(&(nodemask), MAX_NUMNODES, (num))
+static inline int __nodes_weight_eq(const nodemask_t *srcp,
+					unsigned int nbits, unsigned int num)
+{
+	return bitmap_weight_eq(srcp->bits, nbits, num);
+}
+
+#define nodes_weight_gt(nodemask, num) __nodes_weight_gt(&(nodemask), MAX_NUMNODES, (num))
+static inline int __nodes_weight_gt(const nodemask_t *srcp,
+					unsigned int nbits, unsigned int num)
+{
+	return bitmap_weight_gt(srcp->bits, nbits, num);
+}
+
+#define nodes_weight_le(nodemask, num) __nodes_weight_le(&(nodemask), MAX_NUMNODES, (num))
+static inline int __nodes_weight_le(const nodemask_t *srcp,
+					unsigned int nbits, unsigned int num)
+{
+	return bitmap_weight_le(srcp->bits, nbits, num);
+}
+
 #define nodes_shift_right(dst, src, n) \
 			__nodes_shift_right(&(dst), &(src), (n), MAX_NUMNODES)
 static inline void __nodes_shift_right(nodemask_t *dstp,
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index b1fcdb4d25d6..4a48ce5b86cf 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -1154,7 +1154,7 @@ int do_migrate_pages(struct mm_struct *mm, const nodemask_t *from,
 			 *          [0-7] - > [3,4,5] moves only 0,1,2,6,7.
 			 */
 
-			if ((nodes_weight(*from) != nodes_weight(*to)) &&
+			if (!nodes_weight_eq(*from, nodes_weight(*to)) &&
 						(node_isset(s, *to)))
 				continue;
 
-- 
2.25.1


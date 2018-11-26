From: Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH] alpha: fix hang caused by the bootmem removal
Date: Mon, 26 Nov 2018 13:53:36 +0200
Message-ID: <1543233216-25833-1-git-send-email-rppt@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Meelis Roos <mroos@linux.ee>, linux-alpha@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>

The conversion of alpha to memblock as the early memory manager caused boot
to hang as described at [1].

The issue is caused because for CONFIG_DISCTONTIGMEM=y case, memblock_add()
is called using memory start PFN that had been rounded down to the nearest
8Mb and it caused memblock to see more memory that is actually present in
the system.

Besides, memblock allocates memory from high addresses while bootmem was
using low memory, which broke the assumption that early allocations are
always accessible by the hardware.

This patch ensures that memblock_add() is using the correct PFN for the
memory start and forces memblock to use bottom-up allocations.

[1] https://lkml.org/lkml/2018/11/22/1032

Reported-by: Meelis Roos <mroos@linux.ee>
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Tested-by: Meelis Roos <mroos@linux.ee>
---
 arch/alpha/kernel/setup.c | 1 +
 arch/alpha/mm/numa.c      | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index a37fd99..4b5b1b2 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -634,6 +634,7 @@ setup_arch(char **cmdline_p)
 
 	/* Find our memory.  */
 	setup_memory(kernel_end);
+	memblock_set_bottom_up(true);
 
 	/* First guess at cpu cache sizes.  Do this before init_arch.  */
 	determine_cpu_caches(cpu->type);
diff --git a/arch/alpha/mm/numa.c b/arch/alpha/mm/numa.c
index 74846553..d0b7337 100644
--- a/arch/alpha/mm/numa.c
+++ b/arch/alpha/mm/numa.c
@@ -144,14 +144,14 @@ setup_memory_node(int nid, void *kernel_end)
 	if (!nid && (node_max_pfn < end_kernel_pfn || node_min_pfn > start_kernel_pfn))
 		panic("kernel loaded out of ram");
 
+	memblock_add(PFN_PHYS(node_min_pfn),
+		     (node_max_pfn - node_min_pfn) << PAGE_SHIFT);
+
 	/* Zone start phys-addr must be 2^(MAX_ORDER-1) aligned.
 	   Note that we round this down, not up - node memory
 	   has much larger alignment than 8Mb, so it's safe. */
 	node_min_pfn &= ~((1UL << (MAX_ORDER-1))-1);
 
-	memblock_add(PFN_PHYS(node_min_pfn),
-		     (node_max_pfn - node_min_pfn) << PAGE_SHIFT);
-
 	NODE_DATA(nid)->node_start_pfn = node_min_pfn;
 	NODE_DATA(nid)->node_present_pages = node_max_pfn - node_min_pfn;
 
-- 
2.7.4


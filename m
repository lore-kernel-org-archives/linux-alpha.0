From: Mike Rapoport <rppt@kernel.org>
Subject: [PATCH 04/13] ia64: discontig: paging_init(): remove local max_pfn calculation
Date: Tue, 27 Oct 2020 13:29:46 +0200
Message-ID: <20201027112955.14157-5-rppt@kernel.org>
References: <20201027112955.14157-1-rppt@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603798233;
        bh=UfaD/WmylipAS87Fv242yQHFr5+l5RhyHEWJxMmp2r8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AZ3uGKlwmDzw01MtfzRYyVNFCrBHcj9hNEcpMvUBfVE6GXyYWgRs8+pNMO0tSpZ5n
         oKhgEP2eGtZrAXR4Jr+NuG5k7tt55ZwBXPkLdsRajrq8dYk0EnHYeNA20jabsK6JID
         37xeaYZ4dJneHg8tW/gL3ZpBIbtl8c+S6BeyS9O0=
In-Reply-To: <20201027112955.14157-1-rppt@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>, Meelis Roos <mroos@linux.ee>, Michael Schmitz <schmitzmic@gmail.com>, Mike Rapoport <rppt@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, Russell King <linux@armlinux.org.uk>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linu

From: Mike Rapoport <rppt@linux.ibm.com>

The maximal PFN in the system is calculated during find_memory() time and
it is stored at max_low_pfn then.

Use this value in paging_init() and remove the redundant detection of
max_pfn in that function.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/ia64/mm/discontig.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/ia64/mm/discontig.c b/arch/ia64/mm/discontig.c
index d255596f52c6..f41dcf75887b 100644
--- a/arch/ia64/mm/discontig.c
+++ b/arch/ia64/mm/discontig.c
@@ -594,7 +594,6 @@ void __init paging_init(void)
 {
 	unsigned long max_dma;
 	unsigned long pfn_offset = 0;
-	unsigned long max_pfn = 0;
 	int node;
 	unsigned long max_zone_pfns[MAX_NR_ZONES];
 
@@ -616,13 +615,11 @@ void __init paging_init(void)
 #ifdef CONFIG_VIRTUAL_MEM_MAP
 		NODE_DATA(node)->node_mem_map = vmem_map + pfn_offset;
 #endif
-		if (mem_data[node].max_pfn > max_pfn)
-			max_pfn = mem_data[node].max_pfn;
 	}
 
 	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
 	max_zone_pfns[ZONE_DMA32] = max_dma;
-	max_zone_pfns[ZONE_NORMAL] = max_pfn;
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
 	free_area_init(max_zone_pfns);
 
 	zero_page_memmap_ptr = virt_to_page(ia64_imva(empty_zero_page));
-- 
2.28.0


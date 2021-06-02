From: Mike Rapoport <rppt@kernel.org>
Subject: [PATCH 2/9] arc: update comment about HIGHMEM implementation
Date: Wed,  2 Jun 2021 13:53:41 +0300
Message-ID: <20210602105348.13387-3-rppt@kernel.org>
References: <20210602105348.13387-1-rppt@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622631253;
        bh=M0bKVaGHx9OxuQ1E9oxHVBUkdvBwvAMGJJiXepUaSFE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NZQ2rr2E/OctHk1XnG/C5vLVoo2DWWNRKDUphu7Fh35eCKk7WRb+E/oZ1QWpjns4n
         483dCoOUenIqXs2GkrV7dD0CBQudFaPjtEpqVBzYDkYbv3dPEwgvpFNS1sK8Qm2M5h
         dfPcSWwLtEgixqKEsihdQBlQLPat/EiAfVdcN+PKy/jPFrwO4GBJW17FhoiRnP5FE/
         LjACmzvLPl6AQjzug1qGPe7CVpkPamqtdaxLDkkdyw7FIplstRB17LG7WMeV+G4ZvT
         AznPR6UfbTW4ZrJ8sIkP2lNwVl5gX3ybDLO4yKMbiW88ZJjTyFtboulTH3d2QuUriT
         IjqRNXEinP8RQ==
In-Reply-To: <20210602105348.13387-1-rppt@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jonathan Corbet <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>, Mike Rapoport <rppt@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, Richard Henderson <rth@twiddle.net>, Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org

From: Mike Rapoport <rppt@linux.ibm.com>

Arc does not use DISCONTIGMEM to implement high memory, update the comment
describing how high memory works to reflect this.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arc/mm/init.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index e2ed355438c9..397a201adfe3 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -139,16 +139,13 @@ void __init setup_arch_memory(void)
 
 #ifdef CONFIG_HIGHMEM
 	/*
-	 * Populate a new node with highmem
-	 *
 	 * On ARC (w/o PAE) HIGHMEM addresses are actually smaller (0 based)
-	 * than addresses in normal ala low memory (0x8000_0000 based).
+	 * than addresses in normal aka low memory (0x8000_0000 based).
 	 * Even with PAE, the huge peripheral space hole would waste a lot of
-	 * mem with single mem_map[]. This warrants a mem_map per region design.
-	 * Thus HIGHMEM on ARC is imlemented with DISCONTIGMEM.
-	 *
-	 * DISCONTIGMEM in turns requires multiple nodes. node 0 above is
-	 * populated with normal memory zone while node 1 only has highmem
+	 * mem with single contiguous mem_map[].
+	 * Thus when HIGHMEM on ARC is enabled the memory map corresponding
+	 * to the hole is freed and ARC specific version of pfn_valid()
+	 * handles the hole in the memory map.
 	 */
 #ifdef CONFIG_DISCONTIGMEM
 	node_set_online(1);
-- 
2.28.0


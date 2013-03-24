From: Jiang Liu <liuj97@gmail.com>
Subject: [RFC PATCH v2, part4 10/39] mm/alpha: prepare for removing num_physpages and simplify mem_init()
Date: Sun, 24 Mar 2013 15:24:37 +0800
Message-ID: <1364109934-7851-12-git-send-email-jiang.liu@huawei.com>
References: <1364109934-7851-1-git-send-email-jiang.liu@huawei.com>
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=2mso016No1A+5fkSQ7HjyS7SmfqgjpHOr5ffMIwzIMc=;
        b=gx0gFrsj6AVN6GtYfW+bKXJIv9fHaZxP56EoRkArYlP8kkLf8XCQ9f6Aq8ZtMOA0so
         5XM5yDtubb+D+DZFX2bi5P+mu64V9Yh+x9vs/zbYi5PCKvDob68orqOP8G/L0+rnR0NG
         UESpR5z4li0RgJ6nGNCiR+vQjlC3os2OH8Za1GiY6keuLNX1LQXkqD/fAiv8LZWlptrt
         uJRqSaKD5Kae0QropVk3xyIMAELP70ITUAxHGAHDY2GuhjIqSu5P9aMh5Y5W7VfFJ2Vg
         MjOiupPERwNZUwPems9O+0fMRQRrJId6MB+JTTw6qYOE/iwQBPQGwH0NL1HN3oS2U4ps
         /21A==
In-Reply-To: <1364109934-7851-1-git-send-email-jiang.liu@huawei.com>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, David Rientjes <rientjes@google.com>
Cc: Jiang Liu <jiang.liu@huawei.com>, Wen Congyang <wency@cn.fujitsu.com>, Mel Gorman <mgorman@suse.de>, Minchan Kim <minchan@kernel.org>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Michal Hocko <mhocko@suse.cz>, Jianguo Wu <wujianguo@huawei.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, David Howells <dhowells@redhat.com>, linux-alpha@vger.kernel.org

Prepare for removing num_physpages and simplify mem_init().

Signed-off-by: Jiang Liu <jiang.liu@huawei.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: David Howells <dhowells@redhat.com>
Cc: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/alpha/mm/init.c |   32 ++------------------------------
 arch/alpha/mm/numa.c |   34 +++++-----------------------------
 2 files changed, 7 insertions(+), 59 deletions(-)

diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index ca07a97..04c933c 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -277,42 +277,14 @@ srm_paging_stop (void)
 #endif
 
 #ifndef CONFIG_DISCONTIGMEM
-static void __init
-printk_memory_info(void)
-{
-	unsigned long codesize, reservedpages, datasize, initsize, tmp;
-	extern int page_is_ram(unsigned long) __init;
-
-	/* printk all informations */
-	reservedpages = 0;
-	for (tmp = 0; tmp < max_low_pfn; tmp++)
-		/*
-		 * Only count reserved RAM pages
-		 */
-		if (page_is_ram(tmp) && PageReserved(mem_map+tmp))
-			reservedpages++;
-
-	codesize =  (unsigned long) &_etext - (unsigned long) &_text;
-	datasize =  (unsigned long) &_edata - (unsigned long) &_data;
-	initsize =  (unsigned long) &__init_end - (unsigned long) &__init_begin;
-
-	printk("Memory: %luk/%luk available (%luk kernel code, %luk reserved, %luk data, %luk init)\n",
-	       nr_free_pages() << (PAGE_SHIFT-10),
-	       max_mapnr << (PAGE_SHIFT-10),
-	       codesize >> 10,
-	       reservedpages << (PAGE_SHIFT-10),
-	       datasize >> 10,
-	       initsize >> 10);
-}
-
 void __init
 mem_init(void)
 {
-	max_mapnr = num_physpages = max_low_pfn;
+	max_mapnr = max_low_pfn;
 	free_all_bootmem();
 	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
 
-	printk_memory_info();
+	mem_init_print_info(NULL);
 }
 #endif /* CONFIG_DISCONTIGMEM */
 
diff --git a/arch/alpha/mm/numa.c b/arch/alpha/mm/numa.c
index 857452c..e5086fc 100644
--- a/arch/alpha/mm/numa.c
+++ b/arch/alpha/mm/numa.c
@@ -129,8 +129,6 @@ setup_memory_node(int nid, void *kernel_end)
 	if (node_max_pfn > max_low_pfn)
 		max_pfn = max_low_pfn = node_max_pfn;
 
-	num_physpages += node_max_pfn - node_min_pfn;
-
 #if 0 /* we'll try this one again in a little while */
 	/* Cute trick to make sure our local node data is on local memory */
 	node_data[nid] = (pg_data_t *)(__va(node_min_pfn << PAGE_SHIFT));
@@ -324,37 +322,15 @@ void __init paging_init(void)
 
 void __init mem_init(void)
 {
-	unsigned long codesize, reservedpages, datasize, initsize, pfn;
-	extern int page_is_ram(unsigned long) __init;
-	unsigned long nid, i;
+	unsigned long nid;
+
 	high_memory = (void *) __va(max_low_pfn << PAGE_SHIFT);
 
-	reservedpages = 0;
-	for_each_online_node(nid) {
-		/*
-		 * This will free up the bootmem, ie, slot 0 memory
-		 */
+	/* This will free up the bootmem, ie, slot 0 memory */
+	for_each_online_node(nid)
 		free_all_bootmem_node(NODE_DATA(nid));
 
-		pfn = NODE_DATA(nid)->node_start_pfn;
-		for (i = 0; i < node_spanned_pages(nid); i++, pfn++)
-			if (page_is_ram(pfn) &&
-			    PageReserved(nid_page_nr(nid, i)))
-				reservedpages++;
-	}
-
-	codesize =  (unsigned long) &_etext - (unsigned long) &_text;
-	datasize =  (unsigned long) &_edata - (unsigned long) &_data;
-	initsize =  (unsigned long) &__init_end - (unsigned long) &__init_begin;
-
-	printk("Memory: %luk/%luk available (%luk kernel code, %luk reserved, "
-	       "%luk data, %luk init)\n",
-	       nr_free_pages() << (PAGE_SHIFT-10),
-	       num_physpages << (PAGE_SHIFT-10),
-	       codesize >> 10,
-	       reservedpages << (PAGE_SHIFT-10),
-	       datasize >> 10,
-	       initsize >> 10);
+	mem_init_print_info(NULL);
 #if 0
 	mem_stress();
 #endif
-- 
1.7.9.5

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

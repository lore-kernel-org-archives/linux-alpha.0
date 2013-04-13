From: Jiang Liu <liuj97@gmail.com>
Subject: [RFC PATCH v1 18/19] mm/alpha: unify mem_init() for both UMA and NUMA architectures
Date: Sat, 13 Apr 2013 23:36:38 +0800
Message-ID: <1365867399-21323-19-git-send-email-jiang.liu@huawei.com>
References: <1365867399-21323-1-git-send-email-jiang.liu@huawei.com>
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=rM3Y40ACKJGr0yshOzxyq/BK+67QoXo3ddtslCKqZ7Q=;
        b=gAmzdK4ipsU3TqThHA/ywZOcidHkaZIzpCBUtsd+jtC20L7jtVUPKV43B2iZn+mUTU
         RtgVEOA151Xwq31xwEVaj0rdiKCEMYhmDOfSYg5rPvXUyoBcI3I4yDueRvO98tgCtUQi
         imn4GWU+xC1DHedzYv7gZugFrbnzCkLvTWXnIFBxGhZMlWv2SK8zx9nQ1HcnoCsSWFW1
         LbFgklbQq7zgbevSID8ViRPjSF0VjsBGMSUoCxLHGg58Zl0ONfD+feiiWd4pu9UeWLwW
         0xHy/VpycUJOYNx8XmgVoHnzSsnIuynotBGIv6oEqrJ1RKOEaEJ2ULcTWy1n2zVR2IUJ
         HDRw==
In-Reply-To: <1365867399-21323-1-git-send-email-jiang.liu@huawei.com>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Yinghai Lu <yinghai@kernel.org>
Cc: Jiang Liu <jiang.liu@huawei.com>, David Rientjes <rientjes@google.com>, Wen Congyang <wency@cn.fujitsu.com>, Mel Gorman <mgorman@suse.de>, Minchan Kim <minchan@kernel.org>, KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Michal Hocko <mhocko@suse.cz>, David Howells <dhowells@redhat.com>, Mark Salter <msalter@redhat.com>, Jianguo Wu <wujianguo@huawei.com>, linux-mm@kvack.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

Now mem_init() for both Alpha UMA and Alpha NUMA are the same,
so unify it to reduce duplicated code.

Signed-off-by: Jiang Liu <jiang.liu@huawei.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/alpha/mm/init.c |    7 ++-----
 arch/alpha/mm/numa.c |   10 ----------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index 04c933c..39de408 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -276,17 +276,14 @@ srm_paging_stop (void)
 }
 #endif
 
-#ifndef CONFIG_DISCONTIGMEM
 void __init
 mem_init(void)
 {
-	max_mapnr = max_low_pfn;
-	free_all_bootmem();
+	set_max_mapnr(max_low_pfn);
 	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
-
+	free_all_bootmem();
 	mem_init_print_info(NULL);
 }
-#endif /* CONFIG_DISCONTIGMEM */
 
 void
 free_initmem(void)
diff --git a/arch/alpha/mm/numa.c b/arch/alpha/mm/numa.c
index 0894b3a8..d543d71 100644
--- a/arch/alpha/mm/numa.c
+++ b/arch/alpha/mm/numa.c
@@ -319,13 +319,3 @@ void __init paging_init(void)
 	/* Initialize the kernel's ZERO_PGE. */
 	memset((void *)ZERO_PGE, 0, PAGE_SIZE);
 }
-
-void __init mem_init(void)
-{
-	high_memory = (void *) __va(max_low_pfn << PAGE_SHIFT);
-	free_all_bootmem();
-	mem_init_print_info(NULL);
-#if 0
-	mem_stress();
-#endif
-}
-- 
1.7.9.5

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

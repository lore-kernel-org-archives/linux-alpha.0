From: Waiman Long <longman@redhat.com>
Subject: [PATCH] mm: Remove dummy struct bootmem_data/bootmem_data_t
Date: Wed, 25 Mar 2020 22:26:17 -0400
Message-ID: <20200326022617.26208-1-longman@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585189599;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=GfJ4nA8hsV5lYbIG/OIJe+XHSi1/g2DRiOwxW3jISRw=;
        b=BlRf+TsFkB/Bz+xfQKFBC+zh/vX9HUQQ0W6QFrQlQupmp5BKKOAbFPCaBxVMf8MaDsCl29
        LPT3DKT/6rpC6lZPmAPf3M26M7rAEGKCjSry8+9wMCczFGhqQeu9poKdf2aAlMTeQbTLJh
        YXXiEaQyG/IOgVKdWjwzxtTspcF46Kc=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Waiman Long <longman@redhat.com>

Both bootmem_data and bootmem_data_t structures are no longer defined.
Remove the dummy forward declarations.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 arch/alpha/include/asm/mmzone.h | 2 --
 include/linux/mmzone.h          | 1 -
 2 files changed, 3 deletions(-)

diff --git a/arch/alpha/include/asm/mmzone.h b/arch/alpha/include/asm/mmzone.h
index 7ee144f484f1..9b521c857436 100644
--- a/arch/alpha/include/asm/mmzone.h
+++ b/arch/alpha/include/asm/mmzone.h
@@ -8,8 +8,6 @@
 
 #include <asm/smp.h>
 
-struct bootmem_data_t; /* stupid forward decl. */
-
 /*
  * Following are macros that are specific to this numa platform.
  */
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 462f6873905a..5c388eced889 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -706,7 +706,6 @@ struct deferred_split {
  * Memory statistics and page replacement data structures are maintained on a
  * per-zone basis.
  */
-struct bootmem_data;
 typedef struct pglist_data {
 	struct zone node_zones[MAX_NR_ZONES];
 	struct zonelist node_zonelists[MAX_ZONELISTS];
-- 
2.18.1


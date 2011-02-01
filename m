From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 2/2] amd-k7-agp: remove non-x86 code
Date: Tue,  1 Feb 2011 11:54:16 -0500
Message-ID: <1296579256-14777-2-git-send-email-mattst88@gmail.com>
References: <1296579256-14777-1-git-send-email-mattst88@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
         :in-reply-to:references;
        bh=uwyJDcvlvx2eSw4dfdUnSj7TJsR01+E7+3G+GG/hwAA=;
        b=e2ivao3AxlwfD1kemHfsg9AqEUgdj4cXJ229nGUS4q89bLjWgnenfZNpdbaDV9FEp3
         aa9dLrqrhaLM223soJs9lacAXbXaDbpAT6mai8EZ/0qi4ro0OwW/1lqjKEFdI+fWGS4T
         XAUm6olVs6FnwMieM6Q0mtDTGYfSLam/mS/Pc=
In-Reply-To: <1296579256-14777-1-git-send-email-mattst88@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-alpha@vger.kernel.org, Alan Hourihane <alanh@fairlite.demon.co.uk>, Matt Turner <mattst88@gmail.com>

amd-k7-agp can't be built on Alpha anymore, so remove now unnecessary
code.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 drivers/char/agp/amd-k7-agp.c |   19 -------------------
 1 files changed, 0 insertions(+), 19 deletions(-)

diff --git a/drivers/char/agp/amd-k7-agp.c b/drivers/char/agp/amd-k7-agp.c
index b1b4362..45681c0 100644
--- a/drivers/char/agp/amd-k7-agp.c
+++ b/drivers/char/agp/amd-k7-agp.c
@@ -41,22 +41,8 @@ static int amd_create_page_map(struct amd_page_map *page_map)
 	if (page_map->real == NULL)
 		return -ENOMEM;
 
-#ifndef CONFIG_X86
-	SetPageReserved(virt_to_page(page_map->real));
-	global_cache_flush();
-	page_map->remapped = ioremap_nocache(virt_to_phys(page_map->real),
-					    PAGE_SIZE);
-	if (page_map->remapped == NULL) {
-		ClearPageReserved(virt_to_page(page_map->real));
-		free_page((unsigned long) page_map->real);
-		page_map->real = NULL;
-		return -ENOMEM;
-	}
-	global_cache_flush();
-#else
 	set_memory_uc((unsigned long)page_map->real, 1);
 	page_map->remapped = page_map->real;
-#endif
 
 	for (i = 0; i < PAGE_SIZE / sizeof(unsigned long); i++) {
 		writel(agp_bridge->scratch_page, page_map->remapped+i);
@@ -68,12 +54,7 @@ static int amd_create_page_map(struct amd_page_map *page_map)
 
 static void amd_free_page_map(struct amd_page_map *page_map)
 {
-#ifndef CONFIG_X86
-	iounmap(page_map->remapped);
-	ClearPageReserved(virt_to_page(page_map->real));
-#else
 	set_memory_wb((unsigned long)page_map->real, 1);
-#endif
 	free_page((unsigned long) page_map->real);
 }
 
-- 
1.7.2.2


From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] alpha: agp: make empty macros use do-while-0 style
Date: Sun,  8 Aug 2021 20:08:22 -0700
Message-ID: <20210809030822.20658-1-rdunlap@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=horbXQOjZIRZ8FBSbpv2mepupGhB9Lf75u+uewvzT7E=; b=pN4ZQh9wtiZxDIDzmK+R3OZ5F/
        eeZMoe7hIh2BRlKUexii6Eom7jOGOxa1MbCX+B8wS88BXdZOHMd4lzs7/npXFVbHyH4JLUCT9t5NO
        wbsle8wghUocp5bSnskvw5ErHxzAw3HVtoFXlSxRgdgJRIuoKq4DZpXhR35dSOC4iafTGz3ogcusM
        AgMj0F7WL9WbTToxQcnYxXDLjtqY/0M6ZYwIFPV5T6DXm6SK4VOGazamJhqJ6RAI2i1mlAMQgePqg
        ZFyMv8bDEqH45vyPNeEblm7kJHdQU+ULOhfUR5lNprUoni14ld212WMiOyM29ZiD3q65kR2Xa+cY1
        8N+R62Eg==;
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, David Airlie <airlied@linux.ie>

Copy these macros from ia64/include/asm/agp.h to avoid the
"empty-body" in 'if' statment warning.

drivers/char/agp/generic.c: In function 'agp_generic_destroy_page':
../drivers/char/agp/generic.c:1265:42: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
 1265 |                 unmap_page_from_agp(page);

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Airlie <airlied@linux.ie>
---
 arch/alpha/include/asm/agp.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20210806.orig/arch/alpha/include/asm/agp.h
+++ linux-next-20210806/arch/alpha/include/asm/agp.h
@@ -6,8 +6,8 @@
 
 /* dummy for now */
 
-#define map_page_into_agp(page) 
-#define unmap_page_from_agp(page) 
+#define map_page_into_agp(page)		do { } while (0)
+#define unmap_page_from_agp(page)	do { } while (0)
 #define flush_agp_cache() mb()
 
 /* GATT allocation. Returns/accepts GATT kernel virtual address. */

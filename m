From: cgel.zte@gmail.com
Subject: [PATCH] alpha: add null pointer check
Date: Sat,  2 Apr 2022 08:34:36 +0000
Message-ID: <20220402083436.2413189-1-lv.ruyi@zte.com.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tfha1nXEQp5tnH0OT7lYvNtXkp0/rCs/1BLKkrtZnbc=;
        b=Okfx0/e4xNIm4mKw8WX9qJApxey2071CaaKEMbniVf5ghLGtCCW+JTr3NaZVhnghOe
         96iwVtE/kpNO0QyNa62PqceYRwvr4amAsOqmAFMzO92vcC5PI4eTjGV9xi+ILjZxwU6K
         iQETuQmcDrGV1EQNq+uBZNHHAMqCXTkSLieoJpqzZtq6Eu5ecUzppmdiHl6W/u184Mxp
         Cgx4Tq83A39LIC9xcfl3uFRthf4hCIxRXnMt/ZWh9R4unIYPzRh2pVkzfbX0jpgkXS49
         RSUV+808bVOA8RJOlrE9cIDF4WG2eyrMuZURXdoIfuYIS1C8RwL+vsUzn/DkmWG5FtqU
         x66g==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, lv.ruyi@zte.com.cn, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

kmalloc is a memory allocation function which can return NULL when some
internal memory errors happen. Add null pointer check to avoid
dereferencing null pointer.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 arch/alpha/kernel/module.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/alpha/kernel/module.c b/arch/alpha/kernel/module.c
index 5b60c248de9e..5442b75a98c2 100644
--- a/arch/alpha/kernel/module.c
+++ b/arch/alpha/kernel/module.c
@@ -47,6 +47,8 @@ process_reloc_for_got(Elf64_Rela *rela,
 		}
 
 	g = kmalloc (sizeof (*g), GFP_KERNEL);
+	if (!g)
+		return;
 	g->next = chains[r_sym].next;
 	g->r_addend = r_addend;
 	g->got_offset = *poffset;
-- 
2.25.1



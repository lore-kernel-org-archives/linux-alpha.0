From: Roel Kluin <roel.kluin@gmail.com>
Subject: [PATCH] alpha: kmalloc failure ignored in process_reloc_for_got()
Date: Wed, 09 Sep 2009 01:40:10 +0200
Message-ID: <4AA6EB5A.5090309@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=W6cFaIi4SzmF0oQbMn7TasFVMyZhuMaXlBYBLe+1GqA=;
        b=iXL22RfrRjJcn4zQ1zPibGHQLU/rW+4753vGWgxfHqlGKe0CzhoufhCOxsyAQ1lhDb
         Mu5tEW43zinnTF73rOjceo9J09CCrVzg7QBjuVKBLkc3tLesNK49KR/vwt1KK7pT0tqZ
         vlOLn29wSJsLZrd0CCaXs3APvyi3MphqkfXRs=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Prevent NULL dereference if kmalloc() fails.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
Found with sed: http://kernelnewbies.org/roelkluin

diff --git a/arch/alpha/kernel/module.c b/arch/alpha/kernel/module.c
index ebc3c89..8ceec20 100644
--- a/arch/alpha/kernel/module.c
+++ b/arch/alpha/kernel/module.c
@@ -73,6 +73,8 @@ process_reloc_for_got(Elf64_Rela *rela,
 		}
 
 	g = kmalloc (sizeof (*g), GFP_KERNEL);
+	if (g == NULL)
+		return;
 	g->next = chains[r_sym].next;
 	g->r_addend = r_addend;
 	g->got_offset = *poffset;

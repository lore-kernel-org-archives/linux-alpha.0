From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 2/2] alpha-module: Delete an error message for a failed memory
 allocation in module_frob_arch_sections()
Date: Thu, 11 May 2017 13:55:54 +0200
Message-ID: <98da03ff-97b5-af3a-f129-a212591fc3d5@users.sourceforge.net>
References: <21258632-0cde-f750-5864-406dc6dfad20@users.sourceforge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <21258632-0cde-f750-5864-406dc6dfad20@users.sourceforge.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 13:00:34 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/alpha/kernel/module.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/alpha/kernel/module.c b/arch/alpha/kernel/module.c
index 387d9c500e48..211e62e9a0af 100644
--- a/arch/alpha/kernel/module.c
+++ b/arch/alpha/kernel/module.c
@@ -109,9 +109,5 @@ module_frob_arch_sections(Elf64_Ehdr *hdr, Elf64_Shdr *sechdrs,
-	if (!chains) {
-		printk(KERN_ERR
-		       "module %s: no memory for symbol chain buffer\n",
-		       me->name);
+	if (!chains)
 		return -ENOMEM;
-	}
 
 	got->sh_size = 0;
 	got->sh_addralign = 8;
-- 
2.12.3


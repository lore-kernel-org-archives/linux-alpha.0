From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 1/2] alpha-module: Improve a size determination in
 module_frob_arch_sections()
Date: Thu, 11 May 2017 13:54:42 +0200
Message-ID: <7e1572c7-8c8e-7b1b-ae56-cbdf1ad23fbc@users.sourceforge.net>
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
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 12:54:29 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/alpha/kernel/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/module.c b/arch/alpha/kernel/module.c
index 936bc8f89a67..387d9c500e48 100644
--- a/arch/alpha/kernel/module.c
+++ b/arch/alpha/kernel/module.c
@@ -105,5 +105,5 @@ module_frob_arch_sections(Elf64_Ehdr *hdr, Elf64_Shdr *sechdrs,
 	}
 
 	nsyms = symtab->sh_size / sizeof(Elf64_Sym);
-	chains = kcalloc(nsyms, sizeof(struct got_entry), GFP_KERNEL);
+	chains = kcalloc(nsyms, sizeof(*chains), GFP_KERNEL);
 	if (!chains) {
-- 
2.12.3


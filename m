From: <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBhbHBoYTogcG90ZW50aWFsIGRlcmVmZXJlbmNlIG9mIG51bGwgcG9pbnRlcg==?=
Date: Tue, 17 Jan 2023 18:23:47 +0800 (CST)
Message-ID: <202301171823476416320@zte.com.cn>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: richard.henderson@linaro.org
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, chi.minghao@zte.com.cn

From: Minghao Chi <chi.minghao@zte.com.cn>

The return value of kmalloc() needs to be checked.
To avoid use of null pointer in case of the failure of alloc.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
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

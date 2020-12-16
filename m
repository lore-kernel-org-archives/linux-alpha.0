From: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] alpha: kernel: convert comma to semicolon
Date: Wed, 16 Dec 2020 21:12:41 +0800
Message-ID: <20201216131241.14447-1-zhengyongjun3@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 arch/alpha/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 4c7b0414a3ff..71041347d189 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -256,7 +256,7 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 		childstack->r26 = (unsigned long) ret_from_kernel_thread;
 		childstack->r9 = usp;	/* function */
 		childstack->r10 = kthread_arg;
-		childregs->hae = alpha_mv.hae_cache,
+		childregs->hae = alpha_mv.hae_cache;
 		childti->pcb.usp = 0;
 		return 0;
 	}
-- 
2.22.0


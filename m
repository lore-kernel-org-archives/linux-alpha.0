From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] alpha: fix build failures
Date: Sun, 17 Sep 2017 18:20:10 +0100
Message-ID: <1505668810-7497-1-git-send-email-sudipm.mukherjee@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=2ERJEpAF0jbc35Gin6iBEReEUhf2EyjWnj9aZJzsT5o=;
        b=sjf2G8CGzot6njIplK+8YdiZYe0YR3H1AFftx1LgQviv38it7HlsPhW8sq2deeFJS7
         uiCDG6zJng5Rey4WuOCpGhm8NJfKhMljjs0TT6XuYSrASczOlGb/hggNkrk6j6HsyCEF
         Cuk8HDRLgcN7s/DMsZ7Euod20vOvyTOntQeYXPbndUeF72q6Znh2Y66t2asObB0iHbl9
         VFGDqjz0BOgW7wgE0pQTGHpxLaSh4mOYt00kEGCvW1/xx6TiGTU0ayetf9fND7c32DgX
         T8y39PfIZSGvJtNezogHEM8XmuUf2yX8gKGZ81gVhRFyqSf4KYxpnzCxbkjPbEudH08p
         J3Pg==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>

The build of alpha allmodconfig is giving error:
arch/alpha/include/asm/mmu_context.h: In function 'ev5_switch_mm':
arch/alpha/include/asm/mmu_context.h:160:2: error:
	implicit declaration of function 'task_thread_info';
	did you mean 'init_thread_info'? [-Werror=implicit-function-declaration]

The file 'mmu_context.h' needed an extra header file.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---

The build log of next-20170915 is at:
https://travis-ci.org/sudipm-mukherjee/parport/jobs/275726322

 arch/alpha/include/asm/mmu_context.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/include/asm/mmu_context.h b/arch/alpha/include/asm/mmu_context.h
index 384bd47..45c020a 100644
--- a/arch/alpha/include/asm/mmu_context.h
+++ b/arch/alpha/include/asm/mmu_context.h
@@ -8,6 +8,7 @@
  */
 
 #include <linux/mm_types.h>
+#include <linux/sched.h>
 
 #include <asm/machvec.h>
 #include <asm/compiler.h>
-- 
2.7.4


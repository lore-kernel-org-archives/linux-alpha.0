From: Li zeming <zeming@nfschina.com>
Subject: [PATCH] kernel: process: Remove unnecessary (void*) conversions
Date: Tue, 13 Dec 2022 15:36:33 +0800
Message-ID: <20221213073633.3586-1-zeming@nfschina.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, ebiederm@xmission.com, akpm@linux-foundation.org
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Li zeming <zeming@nfschina.com>

generic_ptr is a void * type and does not require a cast.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 arch/alpha/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 65fdae9e48f3..5bc8be1eba11 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -74,7 +74,7 @@ struct halt_info {
 static void
 common_shutdown_1(void *generic_ptr)
 {
-	struct halt_info *how = (struct halt_info *)generic_ptr;
+	struct halt_info *how = generic_ptr;
 	struct percpu_struct *cpup;
 	unsigned long *pflags, flags;
 	int cpuid = smp_processor_id();
-- 
2.18.2


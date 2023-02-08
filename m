From: Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next] alpha: Fix warning comparing pointer to 0
Date: Wed,  8 Feb 2023 09:12:26 +0800
Message-ID: <20230208011226.81918-1-yang.lee@linux.alibaba.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: richard.henderson@linaro.org
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>, Abaci Robot <abaci@linux.alibaba.com>

./arch/alpha/kernel/smp.c:271:39-40: WARNING comparing pointer to 0

Avoid pointer type value compared with 0 to make code clear.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3979
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/alpha/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 0ede4b044e86..3edf1e572d10 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -268,7 +268,7 @@ recv_secondary_console_msg(void)
 			memcpy(cp2, cp1, cnt);
 			cp2[cnt] = '\0';
 			
-			while ((cp2 = strchr(cp2, '\r')) != 0) {
+			while ((cp2 = strchr(cp2, '\r'))) {
 				*cp2 = ' ';
 				if (cp2[1] == '\n')
 					cp2[1] = ' ';
-- 
2.20.1.7.g153144c


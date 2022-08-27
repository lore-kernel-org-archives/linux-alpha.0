From: Shaomin Deng <dengshaomin@cdjrlc.com>
Subject: [PATCH] tty: Do not initialise statics to 0
Date: Sat, 27 Aug 2022 12:30:47 -0400
Message-ID: <20220827163047.22095-1-dengshaomin@cdjrlc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Shaomin Deng <dengshaomin@cdjrlc.com>

Compiler will initialise statics to 0, so there is no need to do that.

Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
---
 arch/alpha/kernel/srmcons.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/srmcons.c b/arch/alpha/kernel/srmcons.c
index 6dc952b0df4a..5024318b14a8 100644
--- a/arch/alpha/kernel/srmcons.c
+++ b/arch/alpha/kernel/srmcons.c
@@ -23,7 +23,7 @@
 
 
 static DEFINE_SPINLOCK(srmcons_callback_lock);
-static int srm_is_registered_console = 0;
+static int srm_is_registered_console;
 
 /* 
  * The TTY driver
-- 
2.35.1


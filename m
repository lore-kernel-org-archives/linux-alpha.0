From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: Fix section mismatches
Date: Sat, 26 Aug 2017 20:52:57 -0700
Message-ID: <20170827035257.21630-1-mattst88@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=EFfa/pcMiaehHH7uBR/g8bMBlfPInEzVvroAR/VKzG0=;
        b=cDesysV46PM+uVKiutS4OIaqqa3RPNNLaJO+bLARl5/qDbW4RvbZ4DrdhfpfCooMld
         uj0VF5WR+itDUfrCoKpAL82OQQJ0Fm7e2ypok8Qoxyg7Rfxy80QbI7qJd4TdPfyvnzzL
         mib2nBg7RGWA7hMeBOzdEXnylXadfYtgSubZZBElohtphks7mRQkBwpg5CEzYUeWzYBA
         V1QZe9f+vHUbwqO460cY4kNME6PIOrQOG/xaVB5Tnf90dagokEhqp3tGyg/0YzXuNzaN
         7BU2+M/N4ZGEQb54bNiA/Fbwt3Kx+bMIuWY0z2w93kWTGk2Q4JIPrTTznKykslN10B0f
         mNuQ==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/core_marvel.c | 4 ++--
 arch/alpha/kernel/smp.c         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index db72356714c1..03ff832b1cb4 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -351,7 +351,7 @@ marvel_init_io7(struct io7 *io7)
 	}
 }
 
-void
+void __init
 marvel_io7_present(gct6_node *node)
 {
 	int pe;
@@ -406,7 +406,7 @@ marvel_find_console_vga_hose(void)
 #endif
 }
 
-gct6_search_struct gct_wanted_node_list[] = {
+gct6_search_struct gct_wanted_node_list[] __initdata = {
 	{ GCT_TYPE_HOSE, GCT_SUBTYPE_IO_PORT_MODULE, marvel_io7_present },
 	{ 0, 0, NULL }
 };
diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 9fc560459ebd..f6726a746427 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -115,7 +115,7 @@ wait_boot_cpu_to_stop(int cpuid)
 /*
  * Where secondaries begin a life of C.
  */
-void
+void __init
 smp_callin(void)
 {
 	int cpuid = hard_smp_processor_id();
-- 
2.13.0


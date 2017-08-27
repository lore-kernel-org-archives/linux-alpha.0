From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: Fix build error without CONFIG_VGA_HOSE.
Date: Sat, 26 Aug 2017 20:52:28 -0700
Message-ID: <20170827035228.21556-1-mattst88@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=TFS5F3O24ZlLBYVVMWT97eCfANM8A7oI2JYWtuLM9mg=;
        b=KFFtNDltf2vs5ri8OFoC/KECGfa6TH8sUxH5aAhA7MV823aNfziQgr5Nk6S/5x6tuf
         mAezuyN+crhmiS9iyRnjb3yooB+/1i8KD8z9w7r0WUGVITctJlEonjKnXLmusAZGju7S
         Yv0O2iCrFaKIXz2Sj7COqV4dl8T95s7bZbWurhVAre2BiYvxZ6vVCWFFTarRO6zkJHeJ
         d+k+3O6XgPa42rPsW1Nn28QcPNrm30xLA4hEHTuZfWydC9YE6pwHaKpMTKDOhA4c7v2P
         fr0Pkugdj6IdfdVAr9Xq3b6Vsuqag2tu2v5xN1WsGJCJSFIHFqvWNXL2n4p2W0vaxlyG
         Qyzg==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

pci_vga_hose is #defined to 0 in include/asm/vga.h if CONFIG_VGA_HOSE is
not set.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/core_marvel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index d5f0580746a5..db72356714c1 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -369,6 +369,7 @@ marvel_io7_present(gct6_node *node)
 static void __init
 marvel_find_console_vga_hose(void)
 {
+#ifdef CONFIG_VGA_HOSE
 	u64 *pu64 = (u64 *)((u64)hwrpb + hwrpb->ctbt_offset);
 
 	if (pu64[7] == 3) {	/* TERM_TYPE == graphics */
@@ -402,6 +403,7 @@ marvel_find_console_vga_hose(void)
 			pci_vga_hose = hose;
 		}
 	}
+#endif
 }
 
 gct6_search_struct gct_wanted_node_list[] = {
-- 
2.13.0


From: Jason Wang <wangborong@cdjrlc.com>
Subject: [PATCH] alpha: Remove the static variable initialisations to 0
Date: Sat, 23 Jul 2022 17:22:00 +0800
Message-ID: <20220723092200.6659-1-wangborong@cdjrlc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ink@jurassic.park.msu.ru
Cc: rth@twiddle.net, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Wang <wangborong@cdjrlc.com>

Initialise global and static variable to 0 is always unnecessary.
Remove the unnecessary initialisations.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/alpha/kernel/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/pci.c b/arch/alpha/kernel/pci.c
index 64fbfb0763b2..bce5f07c1d79 100644
--- a/arch/alpha/kernel/pci.c
+++ b/arch/alpha/kernel/pci.c
@@ -210,7 +210,7 @@ static struct pdev_srm_saved_conf *srm_saved_configs;
 static void pdev_save_srm_config(struct pci_dev *dev)
 {
 	struct pdev_srm_saved_conf *tmp;
-	static int printed = 0;
+	static int printed;
 
 	if (!alpha_using_srm || pci_has_flag(PCI_PROBE_ONLY))
 		return;
-- 
2.35.1


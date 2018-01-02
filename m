From: Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH] alpha: fix reboot on Avanti platform
Date: Tue, 2 Jan 2018 13:59:54 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1801021359060.12797@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org

We need to define NEED_SRM_SAVE_RESTORE on the Avanti, otherwise we get
machine check exception when attempting to reboot the machine.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 arch/alpha/kernel/pci_impl.h |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: linux-stable/arch/alpha/kernel/pci_impl.h
===================================================================
--- linux-stable.orig/arch/alpha/kernel/pci_impl.h	2017-12-30 11:21:22.000000000 +0100
+++ linux-stable/arch/alpha/kernel/pci_impl.h	2017-12-30 11:22:10.000000000 +0100
@@ -143,7 +143,8 @@ struct pci_iommu_arena
 };
 
 #if defined(CONFIG_ALPHA_SRM) && \
-    (defined(CONFIG_ALPHA_CIA) || defined(CONFIG_ALPHA_LCA))
+    (defined(CONFIG_ALPHA_CIA) || defined(CONFIG_ALPHA_LCA) || \
+     defined(CONFIG_ALPHA_AVANTI))
 # define NEED_SRM_SAVE_RESTORE
 #else
 # undef NEED_SRM_SAVE_RESTORE

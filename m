From: Colin King <colin.king@canonical.com>
Subject: [PATCH] alpha: fix spelling mistake QSD_PORT_ACTUVE -> QSD_PORT_ACTIVE
Date: Fri, 12 Oct 2018 15:53:14 +0100
Message-ID: <20181012145314.20897-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in kernel error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/alpha/kernel/core_wildfire.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/core_wildfire.c b/arch/alpha/kernel/core_wildfire.c
index cad36fc6ed7d..445e96e0c206 100644
--- a/arch/alpha/kernel/core_wildfire.c
+++ b/arch/alpha/kernel/core_wildfire.c
@@ -557,7 +557,7 @@ wildfire_dump_qsd_regs(int qbbno)
 	printk(KERN_ERR " QSD_REV:           0x%16lx\n", qsd->qsd_rev.csr);
 	printk(KERN_ERR " QSD_PORT_PRESENT:  0x%16lx\n",
 	       qsd->qsd_port_present.csr);
-	printk(KERN_ERR " QSD_PORT_ACTUVE:   0x%16lx\n",
+	printk(KERN_ERR " QSD_PORT_ACTIVE:   0x%16lx\n",
 	       qsd->qsd_port_active.csr);
 	printk(KERN_ERR " QSD_FAULT_ENA:     0x%16lx\n",
 	       qsd->qsd_fault_ena.csr);
-- 
2.17.1


From: Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH v2 1/3] scsi: dpt_i2o: drop stale VIRT_TO_BUS dependency
Date: Fri, 17 Jun 2022 14:57:48 +0200
Message-ID: <20220617125750.728590-2-arnd@kernel.org>
References: <20220617125750.728590-1-arnd@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655470687;
        bh=PHa+k1YPCB+2jgYk545vxPTI79A930ycNAnnkPIO8Q0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nLNheZIMb11YnK30s1ue4ClOfmXib4scSxsRBkan3jiCrsYF14v8dRzqdsbD07xD/
         7CVlJX/9vypOil3A0ym7H4qwTjHxFVs2953dx4vTr/1tKVrlExjRwnVrNjB56/54b8
         mI5c0Afql8VfQwtkoOtgPCBjeHOOsjVos0BnP7RKevmdbYMVMVehSfmRtWEVM7Zo+0
         32Oor1aZzOjFgybMMdE7DBEwLj2FGEfKPYV0Lcgg2w1dTdhpLzSWnnUROwn+W6xw1r
         brAoIaL/gkUAawWzU4UY6DLRjidv0/55hJJFNX7mCSRMsy9E0xCQG8rGi327Q83BHu
         JVJbuHA/NBGRA==
In-Reply-To: <20220617125750.728590-1-arnd@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org, Khalid Aziz <khalid@gonehiking.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>, Miquel van Smoorenburg <mikevs@xs4all.net>, Mark Salyzyn <salyzyn@android.com>, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org, Denis Efremov <efremov@linux.com>

From: Arnd Bergmann <arnd@arndb.de>

The dpt_i2o driver was fixed to stop using virt_to_bus() in 2008, but
it still has a stale reference in an error handling code path that could
never work.

Fix it up to build without VIRT_TO_BUS and remove the Kconfig dependency.

The alternative to this would be to just remove the driver, as it is
clearly obsolete. The i2o driver layer was removed in 2015 with commit
4a72a7af462d ("staging: remove i2o subsystem"), but the even older
dpt_i2o scsi driver stayed around.

The last non-cleanup patches I could find were from Miquel van Smoorenburg
and Mark Salyzyn back in 2008, they might know if there is any chance
of the hardware still being used anywhere.

Fixes: 67af2b060e02 ("[SCSI] dpt_i2o: move from virt_to_bus/bus_to_virt to dma_alloc_coherent")
Cc: Miquel van Smoorenburg <mikevs@xs4all.net>
Cc: Mark Salyzyn <salyzyn@android.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/scsi/Kconfig   | 2 +-
 drivers/scsi/dpt_i2o.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/Kconfig b/drivers/scsi/Kconfig
index a9fe5152addd..cf75588a2587 100644
--- a/drivers/scsi/Kconfig
+++ b/drivers/scsi/Kconfig
@@ -460,7 +460,7 @@ config SCSI_MVUMI
 
 config SCSI_DPT_I2O
 	tristate "Adaptec I2O RAID support "
-	depends on SCSI && PCI && VIRT_TO_BUS
+	depends on SCSI && PCI
 	help
 	  This driver supports all of Adaptec's I2O based RAID controllers as 
 	  well as the DPT SmartRaid V cards.  This is an Adaptec maintained
diff --git a/drivers/scsi/dpt_i2o.c b/drivers/scsi/dpt_i2o.c
index 2e9155ba7408..55dfe7011912 100644
--- a/drivers/scsi/dpt_i2o.c
+++ b/drivers/scsi/dpt_i2o.c
@@ -52,11 +52,11 @@ MODULE_DESCRIPTION("Adaptec I2O RAID Driver");
 
 #include <linux/timer.h>
 #include <linux/string.h>
+#include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/mutex.h>
 
 #include <asm/processor.h>	/* for boot_cpu_data */
-#include <asm/io.h>		/* for virt_to_bus, etc. */
 
 #include <scsi/scsi.h>
 #include <scsi/scsi_cmnd.h>
@@ -2112,7 +2112,7 @@ static irqreturn_t adpt_isr(int irq, void *dev_id)
 		} else {
 			/* Ick, we should *never* be here */
 			printk(KERN_ERR "dpti: reply frame not from pool\n");
-			reply = (u8 *)bus_to_virt(m);
+			goto out;
 		}
 
 		if (readl(reply) & MSG_FAIL) {
-- 
2.29.2


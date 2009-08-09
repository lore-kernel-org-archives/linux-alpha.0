From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: [PATCH 01/14] alpha: use printk_once
Date: Sun,  9 Aug 2009 21:53:56 +0200
Message-ID: <1249847649-11631-2-git-send-email-marcin.slusarz@gmail.com>
References: <1249847649-11631-1-git-send-email-marcin.slusarz@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=4l7gbJOsGDy7r59CUBiI9iis2hYE/QHAzV4L/9uFPYs=;
        b=Pql6udRUdUxdIdir3tkbpbzpZpKEdL6IZhmIMmaMFXZc8fgwct0anzskcCIWEsr9oS
         2QHhULlvKk8paNY+ECgRJhuc38+Xw+0+JEnzmfGyMyNYOZBja1/GqTbJf35cZDVzKEB9
         OInrGJ+THJnBNq46nrB4We/5lrqxfuvC18h3A=
In-Reply-To: <1249847649-11631-1-git-send-email-marcin.slusarz@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Richard Henderson <rth@twiddle.net>, Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org
---
 arch/alpha/kernel/pci_iommu.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index bfb880a..d15aedf 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -268,11 +268,7 @@ pci_map_single_1(struct pci_dev *pdev, void *cpu_addr, size_t size,
 	   assume it doesn't support sg mapping, and, since we tried to
 	   use direct_map above, it now must be considered an error. */
 	if (! alpha_mv.mv_pci_tbi) {
-		static int been_here = 0; /* Only print the message once. */
-		if (!been_here) {
-		    printk(KERN_WARNING "pci_map_single: no HW sg\n");
-		    been_here = 1;
-		}
+		printk_once(KERN_WARNING "pci_map_single: no HW sg\n");
 		return 0;
 	}
 
-- 
1.6.3.3


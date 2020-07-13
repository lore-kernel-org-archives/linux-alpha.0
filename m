From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
Subject: [RFC PATCH 35/35] alpha: Tidy Success/Failure checks
Date: Mon, 13 Jul 2020 14:22:47 +0200
Message-ID: <20200713122247.10985-36-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ogb36sa6vQqtiEyWjTGxiNgWIm0WCLEYPRrILza4y+A=;
        b=gSWxYJ9bQdXtfjpV5tTR8o48guQJpHgLZf/AFrheK3RnuqHSN8PTPjtDsp1el2JhLA
         xFCqfnmY4I7S2CJAQ1NmuTzbhZ+piSkoZznsvy3Ns6sv6mxGXQY1LdtWlLP+9RnLbvXe
         r/Z3B8mPu7oFnRhOq8liQCkwx28YatrK0EbWmFhCqq/6Rr79MhPcZV4WnSI65ji95OpV
         ms24mXH2uX3XY+qu+zM38pKy89l+0Gj1XPT4jmw8tkzOC0+cpGPcRFakRw5saJjkZrdH
         lY4jJJb8LP1Ym3wBB9vuW3lr9lDBYXspDKgKgVf6kbF4xOtHe02GGveSvba0Tbzeq0Zz
         tSPg==
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: helgaas@kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>, bjorn@helgaas.com, skhan@linuxfoundation.org, linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Remove unnecessary check for 0.

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
This patch depends on 34/35

 arch/alpha/kernel/sys_miata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/sys_miata.c b/arch/alpha/kernel/sys_miata.c
index 1b4c03ac34d8..539f803c1614 100644
--- a/arch/alpha/kernel/sys_miata.c
+++ b/arch/alpha/kernel/sys_miata.c
@@ -185,7 +185,7 @@ miata_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
 	if((slot == 7) && (PCI_FUNC(dev->devfn) == 3)) {
 		u8 irq=0;
 		struct pci_dev *pdev = pci_get_slot(dev->bus, dev->devfn & ~7);
-		if (pdev == NULL || pci_read_config_byte(pdev, 0x40, &irq) != 0) {
+		if (pdev == NULL || pci_read_config_byte(pdev, 0x40, &irq)) {
 			pci_dev_put(pdev);
 			return -1;
 		}
-- 
2.18.2


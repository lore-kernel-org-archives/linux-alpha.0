From: Denis Efremov <efremov@linux.com>
Subject: [PATCH v3 08/26] alpha/PCI: Use PCI_STD_NUM_BARS
Date: Mon, 16 Sep 2019 23:41:40 +0300
Message-ID: <20190916204158.6889-9-efremov@linux.com>
References: <20190916204158.6889-1-efremov@linux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190916204158.6889-1-efremov@linux.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Denis Efremov <efremov@linux.com>, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Andrew Murray <andrew.murray@arm.com>, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

Use define PCI_STD_NUM_BARS instead of PCI_ROM_RESOURCE for the number of
PCI BARs.

Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Signed-off-by: Denis Efremov <efremov@linux.com>
---
 arch/alpha/kernel/pci-sysfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.c
index f94c732fedeb..0021580d79ad 100644
--- a/arch/alpha/kernel/pci-sysfs.c
+++ b/arch/alpha/kernel/pci-sysfs.c
@@ -71,10 +71,10 @@ static int pci_mmap_resource(struct kobject *kobj,
 	struct pci_bus_region bar;
 	int i;
 
-	for (i = 0; i < PCI_ROM_RESOURCE; i++)
+	for (i = 0; i < PCI_STD_NUM_BARS; i++)
 		if (res == &pdev->resource[i])
 			break;
-	if (i >= PCI_ROM_RESOURCE)
+	if (i >= PCI_STD_NUM_BARS)
 		return -ENODEV;
 
 	if (res->flags & IORESOURCE_MEM && iomem_is_exclusive(res->start))
@@ -115,7 +115,7 @@ void pci_remove_resource_files(struct pci_dev *pdev)
 {
 	int i;
 
-	for (i = 0; i < PCI_ROM_RESOURCE; i++) {
+	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
 		struct bin_attribute *res_attr;
 
 		res_attr = pdev->res_attr[i];
@@ -232,7 +232,7 @@ int pci_create_resource_files(struct pci_dev *pdev)
 	int retval;
 
 	/* Expose the PCI resources from this device as files */
-	for (i = 0; i < PCI_ROM_RESOURCE; i++) {
+	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
 
 		/* skip empty resources */
 		if (!pci_resource_len(pdev, i))
-- 
2.21.0


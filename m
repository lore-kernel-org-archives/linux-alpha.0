From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] alpha: pci-sysfs: fix all kernel-doc warnings
Date: Sun,  8 Aug 2021 11:52:49 -0700
Message-ID: <20210808185249.31442-1-rdunlap@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=7xHe0IsDz2E3Hhb6jeb89h6VK3JMpAzRGyDvDgecJCU=; b=iuT8vzKYUjX2u/kiPCEn3zxUn3
        TXQ/XjzmnfLmxPsAokw5XzoMJ5mtpUdjlgvRK9KfhCyYUPVV1RlueLLbsuVXTthaHuN2NHrxOvpzt
        XrB1hyapzBVbi7Pga5abqs+xO+Mc/mINHj0HkzuTosrlroda/eYFi18r7vG8xq+FklbZQ6XDX9Suo
        Qk//BRq4N3p5+UwZ9DMjDdC2aFPzNAGQnIsbLSDNNZmj+tzvEzbUccA1xz7hTEHTExBgbc40OsSQn
        euqAj0UudVQBbHDfPmGE87Xy/QBg029GvRApi9Srf6bGsuAR8RW+l5sGR+D80AT8ar3/fGGDdeCFt
        IWix9Wvw==;
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Fix all kernel-doc warnings in arch/alpha/kernel/pci-sysfs.c:

../arch/alpha/kernel/pci-sysfs.c:67: warning: No description found for return value of 'pci_mmap_resource'
../arch/alpha/kernel/pci-sysfs.c:115: warning: Function parameter or member 'pdev' not described in 'pci_remove_resource_files'
../arch/alpha/kernel/pci-sysfs.c:115: warning: Excess function parameter 'dev' description in 'pci_remove_resource_files'
../arch/alpha/kernel/pci-sysfs.c:230: warning: Function parameter or member 'pdev' not described in 'pci_create_resource_files'
../arch/alpha/kernel/pci-sysfs.c:230: warning: Excess function parameter 'dev' description in 'pci_create_resource_files'
../arch/alpha/kernel/pci-sysfs.c:232: warning: No description found for return value of 'pci_create_resource_files'
../arch/alpha/kernel/pci-sysfs.c:305: warning: Function parameter or member 'bus' not described in 'pci_adjust_legacy_attr'
../arch/alpha/kernel/pci-sysfs.c:305: warning: Excess function parameter 'b' description in 'pci_adjust_legacy_attr'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 arch/alpha/kernel/pci-sysfs.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

--- linux-next-20210806.orig/arch/alpha/kernel/pci-sysfs.c
+++ linux-next-20210806/arch/alpha/kernel/pci-sysfs.c
@@ -60,6 +60,8 @@ static int __pci_mmap_fits(struct pci_de
  * @sparse: address space type
  *
  * Use the bus mapping routines to map a PCI resource into userspace.
+ *
+ * Return: %0 on success, negative error code otherwise
  */
 static int pci_mmap_resource(struct kobject *kobj,
 			     struct bin_attribute *attr,
@@ -106,7 +108,7 @@ static int pci_mmap_resource_dense(struc
 
 /**
  * pci_remove_resource_files - cleanup resource files
- * @dev: dev to cleanup
+ * @pdev: pci_dev to cleanup
  *
  * If we created resource files for @dev, remove them from sysfs and
  * free their resources.
@@ -221,10 +223,12 @@ static int pci_create_attr(struct pci_de
 }
 
 /**
- * pci_create_resource_files - create resource files in sysfs for @dev
- * @dev: dev in question
+ * pci_create_resource_files - create resource files in sysfs for @pdev
+ * @pdev: pci_dev in question
  *
  * Walk the resources in @dev creating files for each resource available.
+ *
+ * Return: %0 on success, or negative error code
  */
 int pci_create_resource_files(struct pci_dev *pdev)
 {
@@ -296,7 +300,7 @@ int pci_mmap_legacy_page_range(struct pc
 
 /**
  * pci_adjust_legacy_attr - adjustment of legacy file attributes
- * @b: bus to create files under
+ * @bus: bus to create files under
  * @mmap_type: I/O port or memory
  *
  * Adjust file name and size for sparse mappings.

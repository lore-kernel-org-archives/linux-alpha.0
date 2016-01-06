From: Geliang Tang <geliangtang@163.com>
Subject: [PATCH] PCI/alpha: use kobj_to_dev()
Date: Wed,  6 Jan 2016 23:35:16 +0800
Message-ID: <49691094601fdc2cfe200b8a291a5230a58cf6d6.1452094358.git.geliangtang@163.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=O7X2RMI7DdTfiz3e4z
	R64UrWjGmfGDYU0wExFy8FUkg=; b=f1vxGBDRuartxQEJI/vGJuXIjTY50lWvDM
	B1usvy7+mKf1ReR5Q2ht5Ssmuw+dptEdrU6I+ugUP1lxBvUwvvBby3idSkl9fcX4
	kOrS3MMs0PsL5xyBwn+mGQi5LhQ5Rhhx+B0ZD+bE2pCEuT8SWWs3xV2fVYFa4Hr6
	u2EE84XjE=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: Geliang Tang <geliangtang@163.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Use kobj_to_dev() instead of open-coding it.

Signed-off-by: Geliang Tang <geliangtang@163.com>
---
 arch/alpha/kernel/pci-sysfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.c
index 99e8d47..bba09eb 100644
--- a/arch/alpha/kernel/pci-sysfs.c
+++ b/arch/alpha/kernel/pci-sysfs.c
@@ -64,8 +64,7 @@ static int pci_mmap_resource(struct kobject *kobj,
 			     struct bin_attribute *attr,
 			     struct vm_area_struct *vma, int sparse)
 {
-	struct pci_dev *pdev = to_pci_dev(container_of(kobj,
-						       struct device, kobj));
+	struct pci_dev *pdev = to_pci_dev(kobj_to_dev(kobj));
 	struct resource *res = attr->private;
 	enum pci_mmap_state mmap_type;
 	struct pci_bus_region bar;
-- 
2.5.0


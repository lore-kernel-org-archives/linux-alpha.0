From: Joe Perches <joe@perches.com>
Subject: [PATCH 02/39] arch/alpha: Update WARN uses
Date: Sat, 30 Oct 2010 14:08:19 -0700
Message-ID: <517a3d5c620dd4843a35a05c9a1c123b4b936cd9.1288471898.git.joe@perches.com>
References: <cover.1288471897.git.joe@perches.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <cover.1288471897.git.joe@perches.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Coalesce long formats.
Align arguments.

Signed-off-by: Joe Perches <joe@perches.com>
---
 arch/alpha/kernel/pci-sysfs.c |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.c
index b899e95..6f30ac3 100644
--- a/arch/alpha/kernel/pci-sysfs.c
+++ b/arch/alpha/kernel/pci-sysfs.c
@@ -44,10 +44,9 @@ static int __pci_mmap_fits(struct pci_dev *pdev, int num,
 
 	if (start < size && size - start >= nr)
 		return 1;
-	WARN(1, "process \"%s\" tried to map%s 0x%08lx-0x%08lx on %s BAR %d "
-		"(size 0x%08lx)\n",
-		current->comm, sparse ? " sparse" : "", start, start + nr,
-		pci_name(pdev), num, size);
+	WARN(1, "process \"%s\" tried to map%s 0x%08lx-0x%08lx on %s BAR %d (size 0x%08lx)\n",
+	     current->comm, sparse ? " sparse" : "", start, start + nr,
+	     pci_name(pdev), num, size);
 	return 0;
 }
 
@@ -261,10 +260,9 @@ static int __legacy_mmap_fits(struct pci_controller *hose,
 
 	if (start < size && size - start >= nr)
 		return 1;
-	WARN(1, "process \"%s\" tried to map%s 0x%08lx-0x%08lx on hose %d "
-		"(size 0x%08lx)\n",
-		current->comm, sparse ? " sparse" : "", start, start + nr,
-		hose->index, size);
+	WARN(1, "process \"%s\" tried to map%s 0x%08lx-0x%08lx on hose %d (size 0x%08lx)\n",
+	     current->comm, sparse ? " sparse" : "", start, start + nr,
+	     hose->index, size);
 	return 0;
 }
 
-- 
1.7.3.1.g432b3.dirty


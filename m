From: Joe Perches <joe@perches.com>
Subject: [PATCH 02/29] alpha: Avoid comma separated statements
Date: Mon, 24 Aug 2020 21:55:59 -0700
Message-ID: <4facd57f80c70437f085ba3a1bcf13ae0b63c3bc.1598331148.git.joe@perches.com>
References: <cover.1598331148.git.joe@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1598331148.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jiri Kosina <trivial@kernel.org>, Robert Richter <rric@kernel.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, oprofile-list@lists.sf.net

Use semicolons and braces.

Signed-off-by: Joe Perches <joe@perches.com>
---
 arch/alpha/kernel/pci_iommu.c      |  8 +++++---
 arch/alpha/oprofile/op_model_ev4.c | 22 ++++++++++++++--------
 arch/alpha/oprofile/op_model_ev5.c |  8 +++++---
 3 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 81037907268d..b8af7ad6c607 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -161,10 +161,12 @@ iommu_arena_find_pages(struct device *dev, struct pci_iommu_arena *arena,
 			goto again;
 		}
 
-		if (ptes[p+i])
-			p = ALIGN(p + i + 1, mask + 1), i = 0;
-		else
+		if (ptes[p+i]) {
+			p = ALIGN(p + i + 1, mask + 1);
+			i = 0;
+		} else {
 			i = i + 1;
+		}
 	}
 
 	if (i < n) {
diff --git a/arch/alpha/oprofile/op_model_ev4.c b/arch/alpha/oprofile/op_model_ev4.c
index 086a0d5445c5..004f80a4291f 100644
--- a/arch/alpha/oprofile/op_model_ev4.c
+++ b/arch/alpha/oprofile/op_model_ev4.c
@@ -46,18 +46,24 @@ ev4_reg_setup(struct op_register_config *reg,
 	   map it onto one of the possible values, and write it back.  */
 
 	count = ctr[0].count;
-	if (count <= 4096)
-		count = 4096, hilo = 1;
-	else
-		count = 65536, hilo = 0;
+	if (count <= 4096) {
+		count = 4096;
+		hilo = 1;
+	} else {
+		count = 65536;
+		hilo = 0;
+	}
 	ctr[0].count = count;
 	ctl |= (ctr[0].enabled && hilo) << 3;
 
 	count = ctr[1].count;
-	if (count <= 256)
-		count = 256, hilo = 1;
-	else
-		count = 4096, hilo = 0;
+	if (count <= 256) {
+		count = 256;
+		hilo = 1;
+	} else {
+		count = 4096;
+		hilo = 0;
+	}
 	ctr[1].count = count;
 	ctl |= (ctr[1].enabled && hilo);
 
diff --git a/arch/alpha/oprofile/op_model_ev5.c b/arch/alpha/oprofile/op_model_ev5.c
index c300f5ef3482..6f52244e1181 100644
--- a/arch/alpha/oprofile/op_model_ev5.c
+++ b/arch/alpha/oprofile/op_model_ev5.c
@@ -92,9 +92,11 @@ common_reg_setup(struct op_register_config *reg,
 		if (!ctr[i].enabled)
 			continue;
 
-		if (count <= 256)
-			count = 256, hilo = 3, max = 256;
-		else {
+		if (count <= 256) {
+			max = 256;
+			hilo = 3;
+			count = 256;
+		} else {
 			max = (i == 2 ? 16384 : 65536);
 			hilo = 2;
 			if (count > max)
-- 
2.26.0


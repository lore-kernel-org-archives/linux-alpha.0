From: matt mooney <mfm@muteddisk.com>
Subject: [PATCH 2/4] alpha: remove cast from void*
Date: Mon, 13 Sep 2010 22:27:39 -0700
Message-ID: <1284442059-11641-1-git-send-email-mfm@muteddisk.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux-foundation.org>, Jan-Benedict Glaw <jbglaw@lug-owl.de>, Andrew Morton <akpm@linux-foundation.org>, Alexey Dobriyan <adobriyan@gmail.com>, linux-alpha@vger.kernel.org, kernel-janitors@vger.kernel.org

Unnecessary cast from void* in assignment.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 arch/alpha/kernel/pci-sysfs.c |    2 +-
 arch/alpha/kernel/srm_env.c   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/pci-sysfs.c b/arch/alpha/kernel/pci-sysfs.c
index 738fc82..b899e95 100644
--- a/arch/alpha/kernel/pci-sysfs.c
+++ b/arch/alpha/kernel/pci-sysfs.c
@@ -66,7 +66,7 @@ static int pci_mmap_resource(struct kobject *kobj,
 {
 	struct pci_dev *pdev = to_pci_dev(container_of(kobj,
 						       struct device, kobj));
-	struct resource *res = (struct resource *)attr->private;
+	struct resource *res = attr->private;
 	enum pci_mmap_state mmap_type;
 	struct pci_bus_region bar;
 	int i;
diff --git a/arch/alpha/kernel/srm_env.c b/arch/alpha/kernel/srm_env.c
index 4afc1a1..f0df3fb 100644
--- a/arch/alpha/kernel/srm_env.c
+++ b/arch/alpha/kernel/srm_env.c
@@ -87,7 +87,7 @@ static int srm_env_proc_show(struct seq_file *m, void *v)
 	srm_env_t	*entry;
 	char		*page;
 
-	entry = (srm_env_t *)m->private;
+	entry = m->private;
 	page = (char *)__get_free_page(GFP_USER);
 	if (!page)
 		return -ENOMEM;
-- 
1.7.2.1


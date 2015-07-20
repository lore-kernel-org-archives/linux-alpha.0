From: Yijing Wang <wangyijing@huawei.com>
Subject: [PATCH part3 v12 04/10] PCI: Introduce pci_host_assign_domain_nr() to
 assign domain
Date: Mon, 20 Jul 2015 20:01:12 +0800
Message-ID: <1437393678-4077-5-git-send-email-wangyijing@huawei.com>
References: <1437393678-4077-1-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1437393678-4077-1-git-send-email-wangyijing@huawei.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-mips@linux-mips.org, linux-ia64@vger.kernel.org, linux-pci@vger.kernel.org, Yijing Wang <wangyijing@huawei.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-s390@vger.kernel.org, linux-am33-list@redhat.com, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Rusty Russell <rusty@rustcorp.com.au>, linux-m68k@lists.linux-m68k.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, dja@axtens.net, Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>

Introduce pci_host_assign_domain_nr() to assign domain number
for pci_host_bridge.

Signed-off-by: Yijing Wang <wangyijing@huawei.com>
---
 drivers/pci/pci.c |   24 +++++++++++++++++++-----
 drivers/pci/pci.h |    1 +
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 59032e2..79d01e4 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4484,10 +4484,10 @@ static int pci_get_new_domain_nr(void)
 	return atomic_inc_return(&__domain_nr);
 }
 
-void pci_bus_assign_domain_nr(struct pci_bus *bus, struct device *parent)
+static int pci_assign_domain_nr(struct device *dev)
 {
 	static int use_dt_domains = -1;
-	int domain = of_get_pci_domain_nr(parent->of_node);
+	int domain = of_get_pci_domain_nr(dev->of_node);
 
 	/*
 	 * Check DT domain and use_dt_domains values.
@@ -4521,16 +4521,30 @@ void pci_bus_assign_domain_nr(struct pci_bus *bus, struct device *parent)
 		use_dt_domains = 0;
 		domain = pci_get_new_domain_nr();
 	} else {
-		dev_err(parent, "Node %s has inconsistent \"linux,pci-domain\" property in DT\n",
-			parent->of_node->full_name);
+		dev_err(dev, "Node %s has inconsistent \"linux,pci-domain\" property in DT\n",
+			dev->of_node->full_name);
 		domain = -1;
 	}
 
-	bus->domain_nr = domain;
+	return domain;
+}
+
+void pci_bus_assign_domain_nr(struct pci_bus *bus, struct device *parent)
+{
+	bus->domain_nr = pci_assign_domain_nr(parent);
 }
 #endif
 #endif
 
+void pci_host_assign_domain_nr(struct pci_host_bridge *host, int domain)
+{
+#ifdef CONFIG_PCI_DOMAINS_GENERIC
+	host->domain = pci_assign_domain_nr(host->dev.parent);
+#else
+	host->domain = domain;
+#endif
+}
+
 /**
  * pci_ext_cfg_avail - can we access extended PCI config space?
  *
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 02192aa..4a815c9 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -344,4 +344,5 @@ static inline void pci_bus_assign_domain_nr(struct pci_bus *bus,
 }
 #endif
 
+void pci_host_assign_domain_nr(struct pci_host_bridge *host, int domain);
 #endif /* DRIVERS_PCI_H */
-- 
1.7.1

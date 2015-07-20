From: Yijing Wang <wangyijing@huawei.com>
Subject: [PATCH part3 v12 02/10] PCI: Move pci_bus_assign_domain_nr()
 declaration into drivers/pci/pci.h
Date: Mon, 20 Jul 2015 20:01:10 +0800
Message-ID: <1437393678-4077-3-git-send-email-wangyijing@huawei.com>
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

pci_bus_assign_domain_nr() is only called in probe.c,
Move pci_bus_assign_domain_nr() declaration into
drivers/pci/pci.h.

Signed-off-by: Yijing Wang <wangyijing@huawei.com>
---
 drivers/pci/pci.h   |    9 +++++++++
 include/linux/pci.h |    6 ------
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 4ff0ff1..02192aa 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -335,4 +335,13 @@ static inline int pci_dev_specific_reset(struct pci_dev *dev, int probe)
 
 struct pci_host_bridge *pci_find_host_bridge(struct pci_bus *bus);
 
+#ifdef CONFIG_PCI_DOMAINS_GENERIC
+void pci_bus_assign_domain_nr(struct pci_bus *bus, struct device *parent);
+#else
+static inline void pci_bus_assign_domain_nr(struct pci_bus *bus,
+					struct device *parent)
+{
+}
+#endif
+
 #endif /* DRIVERS_PCI_H */
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 50c0c47..f7e4204 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1337,12 +1337,6 @@ static inline int pci_domain_nr(struct pci_bus *bus)
 {
 	return bus->domain_nr;
 }
-void pci_bus_assign_domain_nr(struct pci_bus *bus, struct device *parent);
-#else
-static inline void pci_bus_assign_domain_nr(struct pci_bus *bus,
-					struct device *parent)
-{
-}
 #endif
 
 /* some architectures require additional setup to direct VGA traffic */
-- 
1.7.1

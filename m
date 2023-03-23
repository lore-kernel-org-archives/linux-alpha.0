From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v7 6/6] PCI: Make use of pci_resource_n()
Date: Thu, 23 Mar 2023 19:36:10 +0200
Message-ID: <20230323173610.60442-7-andriy.shevchenko@linux.intel.com>
References: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679592959; x=1711128959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yfeoYNUxbO0e2gvMFM4I3e9/lrxCDzuwgcUE0vRubSk=;
  b=SnsPC8EmMiZi1EyU3GPkdcv2rNN7HJ4yLh8AdCyIFA4SZ48euhSX1lW+
   rrHIa9gzDxTZusb6BbxusNULuLAzqlz0pnMDIROuxvM+wSql53f/3S9Jj
   ul77FVTI8THfhOPW0oCVMHE7pM/1jvlaGomKra8N0u9ChzvFCgTK/ynLl
   2ya3Av+3Lw+Ed9z8EQs2V1tKnG+gh/JTMMI5Zctem8snBc/1Hn/885kRd
   eMYsxOqWY44WhaeDyTseU9vdnZbgj910ZUzaB3INL+bR04Eo3ngRTlYTF
   /LwWUNAW7jym4R4KkNjpFphUELz7l58OOkv6XmqAk5Qnm9xC/CHYvRysR
   w==;
In-Reply-To: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@li
Cc: Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Anatolij Gustschin <agust@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Replace open-coded implementations of pci_resource_n() in pci.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/pci.h | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 70a4684d5f26..9539cf63fe5e 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2006,14 +2006,12 @@ int pci_iobar_pfn(struct pci_dev *pdev, int bar, struct vm_area_struct *vma);
  * for accessing popular PCI BAR info
  */
 #define pci_resource_n(dev, bar)	(&(dev)->resource[(bar)])
-#define pci_resource_start(dev, bar)	((dev)->resource[(bar)].start)
-#define pci_resource_end(dev, bar)	((dev)->resource[(bar)].end)
-#define pci_resource_flags(dev, bar)	((dev)->resource[(bar)].flags)
-#define pci_resource_len(dev,bar) \
-	((pci_resource_end((dev), (bar)) == 0) ? 0 :	\
-							\
-	 (pci_resource_end((dev), (bar)) -		\
-	  pci_resource_start((dev), (bar)) + 1))
+#define pci_resource_start(dev, bar)	(pci_resource_n(dev, bar)->start)
+#define pci_resource_end(dev, bar)	(pci_resource_n(dev, bar)->end)
+#define pci_resource_flags(dev, bar)	(pci_resource_n(dev, bar)->flags)
+#define pci_resource_len(dev,bar)					\
+	(pci_resource_end((dev), (bar)) ? 				\
+	 resource_size(pci_resource_n((dev), (bar))) : 0)
 
 #define __pci_dev_for_each_resource_0(dev, res, ...)			\
 	for (unsigned int __b = 0;					\
-- 
2.40.0.1.gaa8946217a0b



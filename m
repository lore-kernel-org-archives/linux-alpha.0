From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v8 4/7] PCI: Document pci_bus_for_each_resource() to avoid confusion
Date: Thu, 30 Mar 2023 19:24:31 +0300
Message-ID: <20230330162434.35055-5-andriy.shevchenko@linux.intel.com>
References: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680193712; x=1711729712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mMeyztJwnpsG6WpiZZE3Wzd++aYBpdo5TdtsAUuwHek=;
  b=UeetYP0z4KQE3eGjgEb1rZcZdEKa4Zt/lw25k6ICMVHP/gr5WLpuWQOv
   vHX230IkzboLjCyY0SQaC5V2mklJtqcbYRk2INBRiPU+nUZ2ThENiWsQl
   QjVZ5ibEfB6QA9H2UxZ8Z3lAFcYb+cVp+jJSkiiHMmVkMr1XHd/axlD3J
   3JHxWBMqslYXAnMN15EbgPmZAp1alUykAZS6TnuASxRudTBpBTdr4LXG/
   0kqpNQWr3EUMkEcrs+OLeQYpHrCj5mOTQr8ShpTdUC6iUyfiIoVSwlr14
   MPiOzkt1azTtcvTJEyW41A0oyLudH1otqOsj8j/Ds4aW4rMZ3DlizoKzE
   g==;
In-Reply-To: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@list
Cc: Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Anatolij Gustschin <agust@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>

There might be a confusion with the implementation of the
pci_bus_for_each_resources() due to side effect of Logical
OR. Document entire macro and explain how it works and why
the conditional needs to be like that.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/pci.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 5cacd9e4c8cd..e3b3af606280 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1446,6 +1446,26 @@ int devm_request_pci_bus_resources(struct device *dev,
 /* Temporary until new and working PCI SBR API in place */
 int pci_bridge_secondary_bus_reset(struct pci_dev *dev);
 
+/**
+ * pci_bus_for_each_resource - iterate over PCI bus resources
+ * @bus: the PCI bus
+ * @res: a varible to keep a pointer to the current resource
+ * @i: a variable to keep the index of the current resource
+ *
+ * Iterate over PCI bus resources. The first part is to go over PCI bus
+ * resource array, which has at most the %PCI_BRIDGE_RESOURCE_NUM entries.
+ * After that continue with the separate list of the additional resources,
+ * if not empty. That's why the Logical OR is being used.
+ *
+ * Possible usage:
+ *
+ *	struct pci_bus *bus = ...;
+ *	struct resource *res;
+ *	unsigned int i;
+ *
+ * 	pci_bus_for_each_resource(bus, res, i)
+ * 		pr_info("PCI bus resource[%u]: %pR\n", i, res);
+ */
 #define pci_bus_for_each_resource(bus, res, i)				\
 	for (i = 0;							\
 	    (res = pci_bus_resource_n(bus, i)) || i < PCI_BRIDGE_RESOURCE_NUM; \
-- 
2.40.0.1.gaa8946217a0b


From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v8 6/7] EISA: Convert to use less arguments in pci_bus_for_each_resource()
Date: Thu, 30 Mar 2023 19:24:33 +0300
Message-ID: <20230330162434.35055-7-andriy.shevchenko@linux.intel.com>
References: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680193714; x=1711729714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xbQWUNZRhMDKSfWq+Wm+hoCdoGH5KZ6pm5K/n+XSSwM=;
  b=HT85l5NYyZLNzawnUtxbMAOFjsxDUmwxdiOu9NPsFbr3jTarqFqrumeb
   ADFomDuksf0r16xVkhXHTJtMi82ssKSmNZVJm1IueNDOuEQEnMsuWdwpV
   k5On/KlKTBy4Qv4YbZUQJakA7oFY7c0Mq8GyeD1CsnlHxSNF1WSa0TM+D
   XGlYiPil0mPNDQCh2gVTQw+xJD8WDYczG5X0SxONWIt9k6yPns26oWl5b
   nF/gzBfSKEdbt0TBLd9Xjr7N6aF30BQ82lhXJ0cs9P8giPP/J249Xkvzx
   nYLM3TZfjZ+uz1sQ2h93CPQuhtNYLmUWeBaFSvqW1dM68/NjirmKPZ10v
   A==;
In-Reply-To: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@list
Cc: Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Anatolij Gustschin <agust@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>

The pci_bus_for_each_resource() can hide the iterator loop since
it may be not used otherwise. With this, we may drop that iterator
variable definition.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 drivers/eisa/pci_eisa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/eisa/pci_eisa.c b/drivers/eisa/pci_eisa.c
index 930c2332c3c4..8173e60bb808 100644
--- a/drivers/eisa/pci_eisa.c
+++ b/drivers/eisa/pci_eisa.c
@@ -20,8 +20,8 @@ static struct eisa_root_device pci_eisa_root;
 
 static int __init pci_eisa_init(struct pci_dev *pdev)
 {
-	int rc, i;
 	struct resource *res, *bus_res = NULL;
+	int rc;
 
 	if ((rc = pci_enable_device (pdev))) {
 		dev_err(&pdev->dev, "Could not enable device\n");
@@ -38,7 +38,7 @@ static int __init pci_eisa_init(struct pci_dev *pdev)
 	 * eisa_root_register() can only deal with a single io port resource,
 	*  so we use the first valid io port resource.
 	 */
-	pci_bus_for_each_resource(pdev->bus, res, i)
+	pci_bus_for_each_resource(pdev->bus, res)
 		if (res && (res->flags & IORESOURCE_IO)) {
 			bus_res = res;
 			break;
-- 
2.40.0.1.gaa8946217a0b


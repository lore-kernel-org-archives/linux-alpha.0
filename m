From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 4/4] pcmcia: Convert to use pci_bus_for_each_resource_p()
Date: Mon, 14 Nov 2022 20:58:22 +0200
Message-ID: <20221114185822.65038-5-andriy.shevchenko@linux.intel.com>
References: <20221114185822.65038-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <sparclinux-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668452289; x=1699988289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BZMLhTwKqFLidxOVtwWq081cCaNo7ow4HF5ovB57GGE=;
  b=GppoaM+AeBp3THbC30cQaYtJRZEhR9Bow3agyfVCEymlXZT04nkSUfCD
   mw4b2xegRjaRphDpIwI1QrwTgYEjHrL0FLVujEYahf/V1BiQxDIZjb/I8
   wm5QIx3yBjhv83yx38PoslQ2/yvHxKPfQPD2PSDPhuNfpRQSboPBvWB6u
   PzX2E0QEq0NP4PpejxFDllRUt1OuQFHPn7+3DN1SWFIGVBbXlg91YU8NI
   JsgdAjcvLjnEPttsOSwiq63F/2B1jgN8LV0+Zhc+9E8YxekRC1b3+P70I
   PoIhQxiyLsEoZwhaMVbHz6yF0R9s9U31s/4fFYkDQ2RGQdlrBYOjuIVvK
   A==;
In-Reply-To: <20221114185822.65038-1-andriy.shevchenko@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The pci_bus_for_each_resource_p() hides the iterator loop since
it may be not used otherwise. With this, we may drop that iterator
variable definition.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 drivers/pcmcia/rsrc_nonstatic.c | 9 +++------
 drivers/pcmcia/yenta_socket.c   | 3 +--
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/pcmcia/rsrc_nonstatic.c b/drivers/pcmcia/rsrc_nonstatic.c
index ad1141fddb4c..9d92d4bb6239 100644
--- a/drivers/pcmcia/rsrc_nonstatic.c
+++ b/drivers/pcmcia/rsrc_nonstatic.c
@@ -934,7 +934,7 @@ static int adjust_io(struct pcmcia_socket *s, unsigned int action, unsigned long
 static int nonstatic_autoadd_resources(struct pcmcia_socket *s)
 {
 	struct resource *res;
-	int i, done = 0;
+	int done = 0;
 
 	if (!s->cb_dev || !s->cb_dev->bus)
 		return -ENODEV;
@@ -960,12 +960,9 @@ static int nonstatic_autoadd_resources(struct pcmcia_socket *s)
 	 */
 	if (s->cb_dev->bus->number == 0)
 		return -EINVAL;
-
-	for (i = 0; i < PCI_BRIDGE_RESOURCE_NUM; i++) {
-		res = s->cb_dev->bus->resource[i];
-#else
-	pci_bus_for_each_resource(s->cb_dev->bus, res, i) {
 #endif
+
+	pci_bus_for_each_resource_p(s->cb_dev->bus, res) {
 		if (!res)
 			continue;
 
diff --git a/drivers/pcmcia/yenta_socket.c b/drivers/pcmcia/yenta_socket.c
index 3966a6ceb1ac..b200f2b99a7a 100644
--- a/drivers/pcmcia/yenta_socket.c
+++ b/drivers/pcmcia/yenta_socket.c
@@ -673,9 +673,8 @@ static int yenta_search_res(struct yenta_socket *socket, struct resource *res,
 			    u32 min)
 {
 	struct resource *root;
-	int i;
 
-	pci_bus_for_each_resource(socket->dev->bus, root, i) {
+	pci_bus_for_each_resource_p(socket->dev->bus, root) {
 		if (!root)
 			continue;
 
-- 
2.35.1


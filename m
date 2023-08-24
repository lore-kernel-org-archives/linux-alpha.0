From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 01/14] alpha: Streamline convoluted PCI error handling
Date: Thu, 24 Aug 2023 16:28:19 +0300
Message-ID: <20230824132832.78705-2-ilpo.jarvinen@linux.intel.com>
References: <20230824132832.78705-1-ilpo.jarvinen@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692884440; x=1724420440;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EIzH6I89fHcXXY3uRmCZDeB2Y9jdsZHRRgZCynpqYTM=;
  b=a6RWK/PlOhomwS7OIp0vMta4NZMmDMlwl5pcdsN916A89KY7MUcRgH7m
   PelkSdMx460WFwUMdi75lF/wA487BLsytvIyL4lVi0PBOXKKHSi7CRVwS
   kRLpafAu2SX70RMyQi2kewe595Iyl6nxnp2d6cFwOBlCeIl2A0IGGBVsJ
   wc/+gu4P1kDn8n7MBcziBY+jqJKwcpuMX+TudqjfC178KYzf7FBdBY3OE
   cl0TnBHSlhm8iigeU3K3YXbjeOqMbVpFtK5syo4e3PaIdf1/mRNSXPryA
   9W9HXBdeo1EJ3IxbS3dZ3jUwW1arpEWYINReQ0SvP0mt2xHBK+7anpSxl
   A==;
In-Reply-To: <20230824132832.78705-1-ilpo.jarvinen@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>

miata_map_irq() handles PCI device and read config related errors in a
conditional block that is more complex than necessary.

Streamline the code flow and error handling.

No functional changes intended.

Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---
 arch/alpha/kernel/sys_miata.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/alpha/kernel/sys_miata.c b/arch/alpha/kernel/sys_miata.c
index e1bee8f84c58..33b2798de8fc 100644
--- a/arch/alpha/kernel/sys_miata.c
+++ b/arch/alpha/kernel/sys_miata.c
@@ -183,16 +183,17 @@ miata_map_irq(const struct pci_dev *dev, u8 slot, u8 =
pin)
            the 2nd 8259 controller. So we have to check for it first. */
=20
 	if((slot =3D=3D 7) && (PCI_FUNC(dev->devfn) =3D=3D 3)) {
-		u8 irq=3D0;
 		struct pci_dev *pdev =3D pci_get_slot(dev->bus, dev->devfn & ~7);
-		if(pdev =3D=3D NULL || pci_read_config_byte(pdev, 0x40,&irq) !=3D PCIBIO=
S_SUCCESSFUL) {
-			pci_dev_put(pdev);
+		u8 irq =3D 0;
+		int ret;
+
+		if (!pdev)
 			return -1;
-		}
-		else	{
-			pci_dev_put(pdev);
-			return irq;
-		}
+
+		ret =3D pci_read_config_byte(pdev, 0x40, &irq);
+		pci_dev_put(pdev);
+
+		return ret =3D=3D PCIBIOS_SUCCESSFUL ? irq : -1;
 	}
=20
 	return COMMON_TABLE_LOOKUP;
--=20
2.30.2


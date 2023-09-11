From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v3 5/6] PCI: xgene: Do PCI error check on own line & keep return value
Date: Mon, 11 Sep 2023 15:53:53 +0300
Message-ID: <20230911125354.25501-6-ilpo.jarvinen@linux.intel.com>
References: <20230911125354.25501-1-ilpo.jarvinen@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-scsi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694436887; x=1725972887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=icV8SsP9lTlQT1/vuwPuhc7cV1t/gtJOjQvxjYnKJJc=;
  b=G1dIvOTBrgSZFWWxpdmDDMeOvD/nX0RlC8BmwQlHsZFJmBslmWlZT9jL
   qifbA/mQj1FPCYf7JWpHatLZYeH5X8BB7V3zLAFFN3g5wwL8uq/BY9D2Y
   v6xsjuPuBA/SJ/9u+mEl07764CV+zomKs9nZmq0UX5p2RrC1tc7BL+619
   T1DjvDDChLfvvGhW8htgM1YqcYpamab+gU2mmo1ipcdiACxhwBpJX39qP
   SmcI/e05KSMXZlOaKmpMnyBtHlRxNne+3XQCjwex2UylOIp2MP5Vf3bPR
   Y3X9gQ0/GbmE/7cju0aqLLVJQXqaF57qzdHVxdG6hQyIU0d9RgRl/WFIL
   w==;
In-Reply-To: <20230911125354.25501-1-ilpo.jarvinen@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, Toan Le <toan@os.amperecomputing.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: 3chas3@gmail.com, brking@us.ibm.com, dalias@libc.org, glaubitz@physik.fu-berlin.de, ink@jurassic.park.msu.ru, jejb@linux.ibm.com, linux-alpha@vger.kernel.org, linux-atm-general@lists.sourceforge.net, linux-scsi@vger.kernel.org, linux-sh@vger.kernel.org, martin.petersen@oracle.com, mattst88@gmail.com, netdev@vger.kernel.org, richard.henderson@linaro.org, ysato@users.sourceforge.jp, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>

Instead of a if condition with a line split, use the usual error
handling pattern with a separate variable to improve readability.

pci_generic_config_read32() already returns either PCIBIOS_SUCCESSFUL
or PCIBIOS_DEVICE_NOT_FOUND so it is enough to simply return its
return value when ret !=3D PCIBIOS_SUCCESSFUL.

No functional changes intended.

Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/controller/pci-xgene.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pc=
i-xgene.c
index 887b4941ff32..8e457fa450a2 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -163,10 +163,11 @@ static int xgene_pcie_config_read32(struct pci_bus *b=
us, unsigned int devfn,
 				    int where, int size, u32 *val)
 {
 	struct xgene_pcie *port =3D pcie_bus_to_port(bus);
+	int ret;
=20
-	if (pci_generic_config_read32(bus, devfn, where & ~0x3, 4, val) !=3D
-	    PCIBIOS_SUCCESSFUL)
-		return PCIBIOS_DEVICE_NOT_FOUND;
+	ret =3D pci_generic_config_read32(bus, devfn, where & ~0x3, 4, val);
+	if (ret !=3D PCIBIOS_SUCCESSFUL)
+		return ret;
=20
 	/*
 	 * The v1 controller has a bug in its Configuration Request Retry
--=20
2.30.2


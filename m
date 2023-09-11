From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v3 2/6] sh: pci: Do PCI error check on own line
Date: Mon, 11 Sep 2023 15:53:50 +0300
Message-ID: <20230911125354.25501-3-ilpo.jarvinen@linux.intel.com>
References: <20230911125354.25501-1-ilpo.jarvinen@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-scsi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694436863; x=1725972863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tnx7Bflw7Y/aVGaG8EH0QBwqdgCKqxJb3mqsR3QL2Es=;
  b=ipEenqZC/TbR4sspeEDz6DPiQH7eglzBAWTy0KtnvVno1wIb3IcZwGVF
   DKpIwFdkeEE69H+yFAS/CCiPo+fo1RBXedZLPzxwoGljadGaS1+6X7nww
   pqgxpsAGh1lsefVbii/JgN+YTZrl9yHpx2nsOxHk1lKG0P4ZOwHejMRog
   3PSLllKj9S8VP/FRe0uNvWmbRQ0XQGlXKdodzbxGwnJVCp4xdH+EPRaf0
   vYflbBgSCp/6FI68vcXa0nag3ewDsJ30f3BpYwscO3fOXBaEqYHtA5sGY
   18ZMdCGXNe3RLXARK4SowECS1R+TFL+vPVr3HCwSLAA8gbDIprvj/c8kJ
   w==;
In-Reply-To: <20230911125354.25501-1-ilpo.jarvinen@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: 3chas3@gmail.com, brking@us.ibm.com, ink@jurassic.park.msu.ru, jejb@linux.ibm.com, kw@linux.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-atm-general@lists.sourceforge.net, linux-scsi@vger.kernel.org, lpieralisi@kernel.org, martin.petersen@oracle.com, mattst88@gmail.com, netdev@vger.kernel.org, richard.henderson@linaro.org, toan@os.amperecomputing.com, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>

Instead of a if condition with a line split, use the usual error
handling pattern with a separate variable to improve readability.

No functional changes intended.

Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
---
 arch/sh/drivers/pci/common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/sh/drivers/pci/common.c b/arch/sh/drivers/pci/common.c
index 2fd2b77e12ce..f59e5b9a6a80 100644
--- a/arch/sh/drivers/pci/common.c
+++ b/arch/sh/drivers/pci/common.c
@@ -53,15 +53,16 @@ int __init pci_is_66mhz_capable(struct pci_channel *hos=
e,
 	unsigned short vid;
 	int cap66 =3D -1;
 	u16 stat;
+	int ret;
=20
 	pr_info("PCI: Checking 66MHz capabilities...\n");
=20
 	for (pci_devfn =3D 0; pci_devfn < 0xff; pci_devfn++) {
 		if (PCI_FUNC(pci_devfn))
 			continue;
-		if (early_read_config_word(hose, top_bus, current_bus,
-					   pci_devfn, PCI_VENDOR_ID, &vid) !=3D
-		    PCIBIOS_SUCCESSFUL)
+		ret =3D early_read_config_word(hose, top_bus, current_bus,
+					     pci_devfn, PCI_VENDOR_ID, &vid);
+		if (ret !=3D PCIBIOS_SUCCESSFUL)
 			continue;
 		if (vid =3D=3D 0xffff)
 			continue;
--=20
2.30.2


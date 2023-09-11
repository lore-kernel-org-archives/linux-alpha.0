From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v3 4/6] PCI: Do error check on own line to split long if conditions
Date: Mon, 11 Sep 2023 15:53:52 +0300
Message-ID: <20230911125354.25501-5-ilpo.jarvinen@linux.intel.com>
References: <20230911125354.25501-1-ilpo.jarvinen@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-scsi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694436880; x=1725972880;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QCUHLcOIhxBRk27P/kLo+OYYTB7a6Wv3t3NHhSYLmJ0=;
  b=gyuhulO1f4sSNWvKqFVmH51yb9CiwI0WX0vTlhOdWgZEkzRDh8i7oSUI
   1HiI4MH5LzbH08Jlv96YouT0MWOVBEuA03qRfGoDE4Wfe03shkkf4vmmj
   bjE1jNGb/c9u/ZxxxJvYxrzyjdbpr35vg2+vp97tehXw9JCNkd7LoAI2T
   EZWKq1K2w365gAXnXvI0D5y8/hCRbY+7ub+CXWVpDJ02LEWoNz6VNxo1K
   eZbrHc77ibTY91otw+Lcjg8Li0Xt7msRsQbLZCcsySLO0oz9d9KynZqSS
   qWnov/S6qEfw5f5WQgfbOd9bJugrKROiUQrdrT32/2sJn7t0A1zLW7Sqv
   Q==;
In-Reply-To: <20230911125354.25501-1-ilpo.jarvinen@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org
Cc: 3chas3@gmail.com, brking@us.ibm.com, dalias@libc.org, glaubitz@physik.fu-berlin.de, ink@jurassic.park.msu.ru, jejb@linux.ibm.com, kw@linux.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-atm-general@lists.sourceforge.net, linux-scsi@vger.kernel.org, linux-sh@vger.kernel.org, lpieralisi@kernel.org, martin.petersen@oracle.com, mattst88@gmail.com, netdev@vger.kernel.org, richard.henderson@linaro.org, toan@os.amperecomputing.com, ysato@users.sourceforge.jp, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>

Placing PCI error code check inside if condition usually results in
need to split lines. Combined with additional conditions the if
condition becomes messy.

Convert to the usual error handling pattern with an additional variable
to improve code readability. In addition, reverse the logic in
pci_find_vsec_capability() to get rid of &&.

No functional changes intended.

Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pci.c    | 9 ++++++---
 drivers/pci/probe.c  | 6 +++---
 drivers/pci/quirks.c | 6 +++---
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 59c01d68c6d5..5e51e8bd5c13 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -732,15 +732,18 @@ u16 pci_find_vsec_capability(struct pci_dev *dev, u16=
 vendor, int cap)
 {
 	u16 vsec =3D 0;
 	u32 header;
+	int ret;
=20
 	if (vendor !=3D dev->vendor)
 		return 0;
=20
 	while ((vsec =3D pci_find_next_ext_capability(dev, vsec,
 						     PCI_EXT_CAP_ID_VNDR))) {
-		if (pci_read_config_dword(dev, vsec + PCI_VNDR_HEADER,
-					  &header) =3D=3D PCIBIOS_SUCCESSFUL &&
-		    PCI_VNDR_HEADER_ID(header) =3D=3D cap)
+		ret =3D pci_read_config_dword(dev, vsec + PCI_VNDR_HEADER, &header);
+		if (ret !=3D PCIBIOS_SUCCESSFUL)
+			continue;
+
+		if (PCI_VNDR_HEADER_ID(header) =3D=3D cap)
 			return vsec;
 	}
=20
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index ab2a4a3a4c06..0ad440190a32 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1651,15 +1651,15 @@ static void pci_set_removable(struct pci_dev *dev)
 static bool pci_ext_cfg_is_aliased(struct pci_dev *dev)
 {
 #ifdef CONFIG_PCI_QUIRKS
-	int pos;
+	int pos, ret;
 	u32 header, tmp;
=20
 	pci_read_config_dword(dev, PCI_VENDOR_ID, &header);
=20
 	for (pos =3D PCI_CFG_SPACE_SIZE;
 	     pos < PCI_CFG_SPACE_EXP_SIZE; pos +=3D PCI_CFG_SPACE_SIZE) {
-		if (pci_read_config_dword(dev, pos, &tmp) !=3D PCIBIOS_SUCCESSFUL
-		    || header !=3D tmp)
+		ret =3D pci_read_config_dword(dev, pos, &tmp);
+		if ((ret !=3D PCIBIOS_SUCCESSFUL) || (header !=3D tmp))
 			return false;
 	}
=20
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 5de09d2eb014..0d2e6b0f56cc 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5383,7 +5383,7 @@ int pci_dev_specific_disable_acs_redir(struct pci_dev=
 *dev)
  */
 static void quirk_intel_qat_vf_cap(struct pci_dev *pdev)
 {
-	int pos, i =3D 0;
+	int pos, i =3D 0, ret;
 	u8 next_cap;
 	u16 reg16, *cap;
 	struct pci_cap_saved_state *state;
@@ -5429,8 +5429,8 @@ static void quirk_intel_qat_vf_cap(struct pci_dev *pd=
ev)
 		pdev->pcie_mpss =3D reg16 & PCI_EXP_DEVCAP_PAYLOAD;
=20
 		pdev->cfg_size =3D PCI_CFG_SPACE_EXP_SIZE;
-		if (pci_read_config_dword(pdev, PCI_CFG_SPACE_SIZE, &status) !=3D
-		    PCIBIOS_SUCCESSFUL || (status =3D=3D 0xffffffff))
+		ret =3D pci_read_config_dword(pdev, PCI_CFG_SPACE_SIZE, &status);
+		if ((ret !=3D PCIBIOS_SUCCESSFUL) || (status =3D=3D 0xffffffff))
 			pdev->cfg_size =3D PCI_CFG_SPACE_SIZE;
=20
 		if (pci_find_saved_cap(pdev, PCI_CAP_ID_EXP))
--=20
2.30.2


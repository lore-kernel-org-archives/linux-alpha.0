From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v3 3/6] atm: iphase: Do PCI error checks on own line
Date: Mon, 11 Sep 2023 15:53:51 +0300
Message-ID: <20230911125354.25501-4-ilpo.jarvinen@linux.intel.com>
References: <20230911125354.25501-1-ilpo.jarvinen@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-scsi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694436869; x=1725972869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RKVN1bWO+6tJ6WlmxsOXbk1vq7oGMYXcJ+RHQjqKcpI=;
  b=bUWitqMHJGU633zc/Q/sIHhMdeFHAvfs/B8VP5XJ6il1JBZefbVulsxG
   fA00ac7Cnc/s2hzzvrtjBvHQ3abVM59iirsEfL44JgMnVu6E8DVTJ4YTY
   aBqVxCFXyX9ZGPjAd/NlthlVSiv6WkggN8i4buRyBOEP7NGwdxvPoGxAQ
   OwUqoudOJJ4x44nqUCJPy+vDr3jbUo9uSehQSSHUlmmBcws646fMBOMX/
   98LC0B5OOerAZ/G6LP/Mp2YRY4UVMiox4xMS7d9fPR3z7eJfSOCRM0UDg
   VxgSX5Qc2qeDjwjgj1kx6ibvN5N1OLjQg0I3nksP9OQY8E2fQVwvOFDkb
   A==;
In-Reply-To: <20230911125354.25501-1-ilpo.jarvinen@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: brking@us.ibm.com, dalias@libc.org, glaubitz@physik.fu-berlin.de, ink@jurassic.park.msu.ru, jejb@linux.ibm.com, kw@linux.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-scsi@vger.kernel.org, linux-sh@vger.kernel.org, lpieralisi@kernel.org, martin.petersen@oracle.com, mattst88@gmail.com, richard.henderson@linaro.org, toan@os.amperecomputing.com, ysato@users.sourceforge.jp, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>

In get_esi() PCI errors are checked inside line-split if conditions (in
addition to the file not following the coding style). To make the code
in get_esi() more readable, fix the coding style and use the usual
error handling pattern with a separate variable.

In addition, initialization of 'error' variable at declaration is not
needed.

No function changes intended.

Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/atm/iphase.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/atm/iphase.c b/drivers/atm/iphase.c
index 324148686953..9bba8f280a4d 100644
--- a/drivers/atm/iphase.c
+++ b/drivers/atm/iphase.c
@@ -2291,19 +2291,21 @@ static int get_esi(struct atm_dev *dev)
 static int reset_sar(struct atm_dev *dev) =20
 { =20
 	IADEV *iadev; =20
-	int i, error =3D 1; =20
+	int i, error;
 	unsigned int pci[64]; =20
 	 =20
 	iadev =3D INPH_IA_DEV(dev); =20
-	for(i=3D0; i<64; i++) =20
-	  if ((error =3D pci_read_config_dword(iadev->pci, =20
-				i*4, &pci[i])) !=3D PCIBIOS_SUCCESSFUL) =20
-  	      return error; =20
+	for (i =3D 0; i < 64; i++) {
+		error =3D pci_read_config_dword(iadev->pci, i * 4, &pci[i]);
+		if (error !=3D PCIBIOS_SUCCESSFUL)
+			return error;
+	}
 	writel(0, iadev->reg+IPHASE5575_EXT_RESET); =20
-	for(i=3D0; i<64; i++) =20
-	  if ((error =3D pci_write_config_dword(iadev->pci, =20
-					i*4, pci[i])) !=3D PCIBIOS_SUCCESSFUL) =20
-	    return error; =20
+	for (i =3D 0; i < 64; i++) {
+		error =3D pci_write_config_dword(iadev->pci, i * 4, pci[i]);
+		if (error !=3D PCIBIOS_SUCCESSFUL)
+			return error;
+	}
 	udelay(5); =20
 	return 0; =20
 } =20
--=20
2.30.2


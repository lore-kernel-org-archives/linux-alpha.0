From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v3 0/6] PCI/treewide: Cleanup/streamline PCI error code handling
Date: Mon, 11 Sep 2023 15:53:48 +0300
Message-ID: <20230911125354.25501-1-ilpo.jarvinen@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-scsi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694436858; x=1725972858;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/wVoKjEeeLBla+cD7axdVwdKaE7wsNtpVj0vYnNrywc=;
  b=Z3fj7/2EfR1b3zuqQtYOaM4Yb6DW282iMlq+B69OcNKYepd0qNVuV31z
   lJ73kZHdjxFHj+TdSw6+Tienu22amOVY35deP/3o4tQBqhmx1IZu061me
   mowQRZu6GIIXfr4OL2ppgYe2Bp5OQT0efZv8a98PzYteMP0xNjXo0WfCR
   Stql+xNZfXygVuAEZj5bYVo+uzIRNxe7pI2wEpIxKWO4BPQYZCu7dOLVI
   k2/cXyVIluxOR581pjqjxBXyl3mcyjuF9AnB5Y3f2aL92VORQTRdUJYzD
   x2zpBcpN37L8rNdxSf+y45Aeuxj2ZPu42IkvVRsNgXQPuKplyUgMG32fu
   Q==;
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, 3chas3@gmail.com, brking@us.ibm.com, dalias@libc.org, glaubitz@physik.fu-berlin.de, ink@jurassic.park.msu.ru, jejb@linux.ibm.com, kw@linux.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-atm-general@lists.sourceforge.net, linux-scsi@vger.kernel.org, linux-sh@vger.kernel.org, lpieralisi@kernel.org, martin.petersen@oracle.com, mattst88@gmail.com, netdev@vger.kernel.org, richard.henderson@linaro.org, toan@os.amperecomputing.com, ysato@users.sourceforge.jp, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>

As the first step towards converting PCI accessor function return codes
into normal errnos this series cleans up related code paths which have
complicated multi-line construct to handle the PCI error checking.

I'd prefer these (the remaining ones) to be routed through PCI tree due
to PCI accessor function return code conversion being built on top of
them.

v3:
- Return pci_generic_config_read32()'s error code directly
- Removed already accepted patches

v2:
- Moved ret local var to the inner block (I2C: ali15x3)
- Removed already accepted patches


Ilpo J=C3=A4rvinen (6):
  alpha: Streamline convoluted PCI error handling
  sh: pci: Do PCI error check on own line
  atm: iphase: Do PCI error checks on own line
  PCI: Do error check on own line to split long if conditions
  PCI: xgene: Do PCI error check on own line & keep return value
  scsi: ipr: Do PCI error checks on own line

 arch/alpha/kernel/sys_miata.c      | 17 +++++++++--------
 arch/sh/drivers/pci/common.c       |  7 ++++---
 drivers/atm/iphase.c               | 20 +++++++++++---------
 drivers/pci/controller/pci-xgene.c |  7 ++++---
 drivers/pci/pci.c                  |  9 ++++++---
 drivers/pci/probe.c                |  6 +++---
 drivers/pci/quirks.c               |  6 +++---
 drivers/scsi/ipr.c                 | 12 ++++++++----
 8 files changed, 48 insertions(+), 36 deletions(-)

--=20
2.30.2


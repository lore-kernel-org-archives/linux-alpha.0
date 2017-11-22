From: Sinan Kaya <okaya@codeaurora.org>
Subject: [PATCH 01/30] alpha/PCI: deprecate pci_get_bus_and_slot()
Date: Wed, 22 Nov 2017 00:30:46 -0500
Message-ID: <1511328675-21981-2-git-send-email-okaya@codeaurora.org>
References: <1511328675-21981-1-git-send-email-okaya@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1511328685;
        bh=VPdjwfzKLmtcyX1Jw5mwHr5Yu73zAyy669QzXlgaPHU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KlY5YKUuwFH980P8qs7aumSyjefaVyDRBHObDcRwLo+xX1CeaWtu2H75CedynhyeI
         bLSUvNNcYFfBn/PL76eSC8PsPx0UhTf6caTfsVmdd1tbIG58eMqH23las5Rl5q9dpJ
         PTV57p0d1m9BJpsEu8d+y64hCIP2LWYbKdPSaHL0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1511328684;
        bh=VPdjwfzKLmtcyX1Jw5mwHr5Yu73zAyy669QzXlgaPHU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C0F2eKotsre9c+G/jy64rfVIVcuJYN8UR9U1Y33V1QIzJH4dmCQl8FEL0nBhMi+YP
         lIyjE/mi2FD+c5cB3c7QfbMKSFlLSUygHADNkaVGHodZiv5n3ID9oEema9oVrvo/qN
         6LV70R8VbNHRtxS3j+djjbrvPDIJqYvDmS5XCvRQ=
In-Reply-To: <1511328675-21981-1-git-send-email-okaya@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pci@vger.kernel.org, timur@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sinan Kaya <okaya@codeaurora.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

pci_get_bus_and_slot() is restrictive such that it assumes domain=0 as
where a PCI device is present. This restricts the device drivers to be
reused for other domain numbers.

Use pci_get_domain_bus_and_slot() with a domain number of 0 where we can't
extract the domain number. Other places, use the actual domain number from
the device.

Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
---
 arch/alpha/kernel/pci.c          | 2 +-
 arch/alpha/kernel/sys_nautilus.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/pci.c b/arch/alpha/kernel/pci.c
index 08235bb..e866daf 100644
--- a/arch/alpha/kernel/pci.c
+++ b/arch/alpha/kernel/pci.c
@@ -416,7 +416,7 @@ struct resource * __init
 		if (bus == 0 && dfn == 0) {
 			hose = pci_isa_hose;
 		} else {
-			dev = pci_get_bus_and_slot(bus, dfn);
+			dev = pci_get_domain_bus_and_slot(0, bus, dfn);
 			if (!dev)
 				return -ENODEV;
 			hose = dev->sysdata;
diff --git a/arch/alpha/kernel/sys_nautilus.c b/arch/alpha/kernel/sys_nautilus.c
index 239dc0e..5eacaf9 100644
--- a/arch/alpha/kernel/sys_nautilus.c
+++ b/arch/alpha/kernel/sys_nautilus.c
@@ -237,7 +237,7 @@
 	bus = hose->bus = bridge->bus;
 	pcibios_claim_one_bus(bus);
 
-	irongate = pci_get_bus_and_slot(0, 0);
+	irongate = pci_get_domain_bus_and_slot(0, 0, 0);
 	bus->self = irongate;
 	bus->resource[0] = &irongate_io;
 	bus->resource[1] = &irongate_mem;
-- 
1.9.1

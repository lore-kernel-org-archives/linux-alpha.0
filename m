From: Sinan Kaya <okaya@codeaurora.org>
Subject: [PATCH V4 01/26] alpha/PCI: deprecate pci_get_bus_and_slot()
Date: Tue, 19 Dec 2017 00:37:37 -0500
Message-ID: <1513661883-28662-2-git-send-email-okaya@codeaurora.org>
References: <1513661883-28662-1-git-send-email-okaya@codeaurora.org>
Return-path: <linux-pci-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1513661895;
        bh=nlBLy3aTwEBPERskKV+zwVjUcnEag2XGTrSp7R32tG4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O7VwxRFXHp4OT0/nRfHMiXHupRhwRJ4jgaPBN1bLCZJeWiHcdny3RY+KPWYNTAeMY
         KLHSUlCCgBiwRZhVyD57MTmWo0Og0MLUG9vRP7ZD+lagKIUgJDPfRZc6QgpIc4r5bY
         K2V9B7NvAQTyKgL2OhfROid9IKBBPResWyBiprwM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1513661894;
        bh=nlBLy3aTwEBPERskKV+zwVjUcnEag2XGTrSp7R32tG4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iK8CKcJBrV1svRKED7nDkM4Cnz63ZYXqTmAg8MrJTvKEsVB9dvFDibk7C9JD22ihV
         6G3C4Z51P9qjQNY+mqGiB1PZzphbeVCRCtr05RJJP60TEjAIk8JBaZ0DOr4rLkTD+C
         VJ/5PVfSSBn6SyQcp2K98M/bNIhOU9PO5Hn4GvRg=
In-Reply-To: <1513661883-28662-1-git-send-email-okaya@codeaurora.org>
Sender: linux-pci-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pci@vger.kernel.org, timur@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sinan Kaya <okaya@codeaurora.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

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
index 87da005..2e86ebb 100644
--- a/arch/alpha/kernel/pci.c
+++ b/arch/alpha/kernel/pci.c
@@ -425,7 +425,7 @@ struct resource * __init
 		if (bus == 0 && dfn == 0) {
 			hose = pci_isa_hose;
 		} else {
-			dev = pci_get_bus_and_slot(bus, dfn);
+			dev = pci_get_domain_bus_and_slot(0, bus, dfn);
 			if (!dev)
 				return -ENODEV;
 			hose = dev->sysdata;
diff --git a/arch/alpha/kernel/sys_nautilus.c b/arch/alpha/kernel/sys_nautilus.c
index 239dc0e..ff4f54b 100644
--- a/arch/alpha/kernel/sys_nautilus.c
+++ b/arch/alpha/kernel/sys_nautilus.c
@@ -237,7 +237,7 @@
 	bus = hose->bus = bridge->bus;
 	pcibios_claim_one_bus(bus);
 
-	irongate = pci_get_bus_and_slot(0, 0);
+	irongate = pci_get_domain_bus_and_slot(pci_domain_nr(bus), 0, 0);
 	bus->self = irongate;
 	bus->resource[0] = &irongate_io;
 	bus->resource[1] = &irongate_mem;
-- 
1.9.1


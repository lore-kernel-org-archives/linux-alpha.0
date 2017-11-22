From: Sinan Kaya <okaya@codeaurora.org>
Subject: [PATCH V2 01/29] alpha/PCI: deprecate pci_get_bus_and_slot()
Date: Wed, 22 Nov 2017 17:48:56 -0500
Message-ID: <1511390964-9979-2-git-send-email-okaya@codeaurora.org>
References: <1511390964-9979-1-git-send-email-okaya@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1511390975;
        bh=bWpMibMxMjQqJYJAUqBCowNJMCpFFzaMKkcTSsEajEY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EgX/+PQrgWjDCTAdYsPB0ZleU6cYT5xPkdZqactpvvDTiGJ3lAIggdVycmesgQutN
         AqC56mYknjrO6PBtbqXMii2LBqpUdo+2ERby6jcLXB++T9s5HES5++s+/shZAsKHe/
         PdEY40pbkFDNjHK465fAiS8oD2ut8Mpfo7uzLFO8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1511390974;
        bh=bWpMibMxMjQqJYJAUqBCowNJMCpFFzaMKkcTSsEajEY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JETsqLzqDsk6/mmdNCBy0AgjP0t6FTjK+6/KMMQJFK+bF4EdTT6ysqqz5udIHfQ0i
         I0oU5R2lk0zDONjl3BdG13hkn90mv9GE3CWfHQZzDFb9FmlL3Xe9YeLh4EPnSkLwdZ
         Fxtut4yrbdvlPrIouYaBxIx+qbm0bQ2m0vt2wsy4=
In-Reply-To: <1511390964-9979-1-git-send-email-okaya@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pci@vger.kernel.org, timur@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sinan Kaya <okaya@codeaurora.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Bjorn Helgaas <bhelgaas@google.com>, Kate Stewart <kstewart@linuxfoundation.org>, "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

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


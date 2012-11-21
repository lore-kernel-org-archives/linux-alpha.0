From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: Add irongate_io to to PCI bus resources
Date: Tue, 20 Nov 2012 20:59:41 -0800
Message-ID: <1353473981-30945-1-git-send-email-mattst88@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:x-mailer;
        bh=AwnW+cKZVOtC8SI0sdOG5zPIM5XOJnGTkyqcQqtxaE4=;
        b=rlmJXwtDsUbg2dZJYNe92nS+zjbuh/m7HJHLAEP2DlZPLgBA2ntUkysHFJygWutqle
         OzpKTMyq52JGi7IRerWPX0QSD2H/CERnGrve+P/qvIjxCxSZMdTSBRwaSLO0Fvh38fYm
         HAI4ZyTGBF7HiDUR3ht1eodccm+Ez0rYgmcDDMmIU10+1XfUX4m0yeivyN1nQGpFGEMb
         19UJ6iAH3imVjjaQuE/cykL98bVoY2cSPHqxDDCK3FUsSkJShYRcmIzBTE4raGJWT8uG
         XcRkQMUk5H5+ApRmKHGv4g6HE/hWZootZtzV+99WRVrG4RyNYRJujVkESS8Cg2vLZOog
         +YTA==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-alpha@vger.kernel.org, Jay Estabrook <jay.estabrook@gmail.com>, Matt Turner <mattst88@gmail.com>

From: Jay Estabrook <jay.estabrook@gmail.com>

Fixes a NULL pointer dereference at boot on UP1500.

Cc: stable@vger.kernel.org
Signed-off-by: Jay Estabrook <jay.estabrook@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/sys_nautilus.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/alpha/kernel/sys_nautilus.c b/arch/alpha/kernel/sys_nautilus.c
index 4d4c046..1383f86 100644
--- a/arch/alpha/kernel/sys_nautilus.c
+++ b/arch/alpha/kernel/sys_nautilus.c
@@ -188,6 +188,10 @@ nautilus_machine_check(unsigned long vector, unsigned long la_ptr)
 extern void free_reserved_mem(void *, void *);
 extern void pcibios_claim_one_bus(struct pci_bus *);
 
+static struct resource irongate_io = {
+	.name	= "Irongate PCI IO",
+	.flags	= IORESOURCE_IO,
+};
 static struct resource irongate_mem = {
 	.name	= "Irongate PCI MEM",
 	.flags	= IORESOURCE_MEM,
@@ -209,6 +213,7 @@ nautilus_init_pci(void)
 
 	irongate = pci_get_bus_and_slot(0, 0);
 	bus->self = irongate;
+	bus->resource[0] = &irongate_io;
 	bus->resource[1] = &irongate_mem;
 
 	pci_bus_size_bridges(bus);
-- 
1.7.8.6


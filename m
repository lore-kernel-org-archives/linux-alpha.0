From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 2/7] alpha/PCI: Use default pcibios_enable_device()
Date: Wed, 26 Feb 2014 16:41:42 -0700
Message-ID: <20140226234142.18970.8692.stgit@bhelgaas-glaptop.roam.corp.google.com>
References: <20140226233541.18970.83328.stgit@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=subject:to:from:cc:date:message-id:in-reply-to:references
         :user-agent:mime-version:content-type:content-transfer-encoding;
        bh=+GV0ywF6Fnayr7AWeDHvni7n/8dp+2019xLuZzNIaDc=;
        b=NsbWiKsZamNOKiHLVE//l2zz7/ZQDz8XEVcQ9Dpjg9HyJe+rUaHBCFMTFnNFRx03Ia
         Cik33QGAP2LB6KTQvtavh+s/deNG2HJaagr2LvR1EhwclOD3EUMO1jkEOgv1ZU//TVRy
         N4Fg1qJlGLinzQvsKG7VgZ94Drg887H/SZcYaGUHXVQHwl7jYybtFVFixwb5yn90nQUI
         tRvDU66wesn9jA9t+a+fpfLWPqxomoT+mrbUqdNRxTaTGt99T6YzjmMB3zHojufImBlt
         rSrB3YSuelGgHzZEX1MeypAamxHaKcSMKKUywaPiqWFYD7eui5JG4h7c8MLXqgfROTCV
         sF7A==
In-Reply-To: <20140226233541.18970.83328.stgit@bhelgaas-glaptop.roam.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org

We don't need anything arch-specific in pcibios_enable_device(), so drop
the arch implementation and use the default generic one.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
CC: linux-alpha@vger.kernel.org
---
 arch/alpha/kernel/pci.c |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/alpha/kernel/pci.c b/arch/alpha/kernel/pci.c
index edb4e0097b75..076c35cd6cde 100644
--- a/arch/alpha/kernel/pci.c
+++ b/arch/alpha/kernel/pci.c
@@ -254,12 +254,6 @@ void pcibios_fixup_bus(struct pci_bus *bus)
 	}
 }
 
-int
-pcibios_enable_device(struct pci_dev *dev, int mask)
-{
-	return pci_enable_resources(dev, mask);
-}
-
 /*
  *  If we set up a device for bus mastering, we need to check the latency
  *  timer as certain firmware forgets to set it properly, as seen

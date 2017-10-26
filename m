From: Meelis Roos <mroos@linux.ee>
Subject: Re: [PATCH] alpha/pci: Fix pci_map_irq()/pci_swizzle() functions
 section markers
Date: Fri, 27 Oct 2017 00:46:09 +0300 (EEST)
Message-ID: <alpine.LRH.2.21.1710270045170.20563@math.ut.ee>
References: <1509029655-30493-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1509029655-30493-1-git-send-email-lorenzo.pieralisi@arm.com>
Sender: linux-pci-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-pci@vger.kernel.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

> Fix the issue by removing the __init/__initdata markers from all subarch
> struct alpha_machine_vector.pci_map_irq()/pci_swizzle() functions (and
> data).
> 
> Fixes: 0e4c2eeb758a ("alpha/PCI: Replace pci_fixup_irqs() call with host bridge IRQ mapping hooks")
> Link: http://lkml.kernel.org/r/alpine.LRH.2.21.1710251043170.7098@math.ut.ee
> Reported-by: Meelis Roos <mroos@linux.ee>

This works on both DS10L and PC164.

-- 
Meelis Roos (mroos@linux.ee)

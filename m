From: Meelis Roos <mroos@linux.ee>
Subject: alpha boot hang - 4.14-rc* regression
Date: Wed, 25 Oct 2017 11:05:42 +0300 (EEST)
Message-ID: <alpine.LRH.2.21.1710251043170.7098@math.ut.ee>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-alpha@vger.kernel.org, Linux Kernel list <linux-kernel@vger.kernel.org>

I run Gentoo Linux on my alphas, with latest git kernels for test. 
4.13.0 worked well on 3 alphas but 4.13.0-09217-g5969d1bb3082 hangs on 
boot on all 3 of them. Tried bisecting on PC164, got into unrelated 
stuff, so probably it does not trigger always. Retried bisecting on 
DS10L. On the first try I got that the same keel where I first saw bad 
was the culprit, another bisect led me to 
0e4c2eeb758a91e68b9eaf7a4bee9bd5ed97ff2b which looks more related.

This is how the crash looks on console:

 * Starting udev ...
starting version 225
 [ ok ]
 * Generating a rule to create a /dev/root symlink ...
 [ ok ]
 * Populating /dev with existing devices through uevents ...
 [ ok ]

halted CPU 0

halt code = 5
HALT instruction executed
PC = fffffc00009bf914
boot failure
>>>

What else can I do to debug this?


0e4c2eeb758a91e68b9eaf7a4bee9bd5ed97ff2b is the first bad commit
commit 0e4c2eeb758a91e68b9eaf7a4bee9bd5ed97ff2b
Author: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Date:   Mon Jul 31 17:37:51 2017 +0100

    alpha/PCI: Replace pci_fixup_irqs() call with host bridge IRQ mapping hooks
    
    The pci_fixup_irqs() function allocates IRQs for all PCI devices present in
    a system; those PCI devices possibly belong to different PCI bus trees (and
    possibly rooted at different host bridges) and may well be enabled (ie
    probed and bound to a driver) by the time pci_fixup_irqs() is called when
    probing a given host bridge driver.
    
    Furthermore, current kernel code relying on pci_fixup_irqs() to assign
    legacy PCI IRQs to devices does not work at all for hotplugged devices in
    that the code carrying out the IRQ fixup is called at host bridge driver
    probe time, which just cannot take into account devices hotplugged after
    the system has booted.
    
    The introduction of map/swizzle function hooks in struct pci_host_bridge
    allows us to define per-bridge map/swizzle functions that can be used at
    device probe time in PCI core code to allocate IRQs for a given device
    (through pci_assign_irq()).
    
    Convert PCI host bridge initialization code to the
    pci_scan_root_bus_bridge() API (that allows to pass a struct
    pci_host_bridge with initialized map/swizzle pointers) and remove the
    pci_fixup_irqs() call from arch code.
    
    Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
    Cc: Richard Henderson <rth@twiddle.net>
    Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>

:040000 040000 18f71e214185d05a58284efd4e97927f48e217ac 327e88f6df911f58be520ae99a02022dab6a8f5e M      arch

In case this does not look related, here are all the known bad kernels 
from all my bisect logs:

# bad: [0e4c2eeb758a91e68b9eaf7a4bee9bd5ed97ff2b] alpha/PCI: Replace pci_fixup_irqs() call with host bridge IRQ mapping hooks
# bad: [19cc4c843f40c6110dd07270414586e7fe4121b2] m68k/PCI: Replace pci_fixup_irqs() call with host bridge IRQ mapping hooks
# bad: [1c9fec470b81ca5e89391c20a11ead31a1e9314b] waitid(): Avoid unbalanced user_access_end() on access_ok() error
# bad: [572c01ba19ef150e98aea0b45ca17d43356521b5] Merge tag 'scsi-misc' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
# bad: [5969d1bb3082b41eba8fd2c826559abe38ccb6df] Merge branch 'gperf-removal'
# bad: [7f1b9be13a7dbe8e51ea541bbcd6c47adae39c71] Merge tag 'armsoc-platforms' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc
# bad: [98611dd735b472c23cc1e8cca90a997393a3a955] tile/PCI: Replace pci_fixup_irqs() call with host bridge IRQ mapping hooks
# bad: [c054be10ffdbd5507a1fd738067d76acfb4808fd] remove gperf left-overs from build system
# bad: [d4fdf844c9c3debc080aea1be8b71d9d0aaa01dc] Merge branch 'pci/irq-fixups' into next
# bad: [d872694bac212f76ca13fd20a85e5c1bdb53a945] Merge branch 'pci/pm' into next



-- 
Meelis Roos (mroos@linux.ee)

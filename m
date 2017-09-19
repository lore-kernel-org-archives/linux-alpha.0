From: Guenter Roeck <linux@roeck-us.net>
Subject: alpha runtime warnings due to commit 0e4c2eeb758 ("alpha/PCI: Replace
 pci_fixup_irqs() call with host ...")
Date: Mon, 18 Sep 2017 19:00:55 -0700
Message-ID: <32ec730f-c1b0-5584-cd35-f8a809122b96@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=OoC5+EMXk0CzcxTSoNHA2CAwUqkIpb3b3YskUV0YVOU=;
        b=Zx966pIwZaPf4I5Q0EQ/QPCBsTOT7bGePiKqcUB4p1RKMmr2R7ZHDcYj2XPTjnM52e
         3xnYDQztQATmPR0CCMUWFj7T3R8K8yXWoIZdcvzx570R+SoF7DmOpTgQ6FqWf45y32Py
         6dS5YL1zWh+RpQPktIiIYRDS2/RA7E9Ow1CEm/olgH9u4bzEciz/LrmnxbIlCCuGzzV8
         NDJPotOxyCvPJqOuqM+YZ20F5XUDu2DpyMQsXAoUqmgk9AdIIbAfcGwz693bs0qogEzh
         P0gCyNOLt4L+K3NZky68cZzPQy/+XggXqs9xN20bSYvndjyy9s1WCydX6lJhkEJcVQ3V
         aE7w==
Content-Language: en-US
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>

Hi,

I see the following runtime warnings in mainline when running alpha images in qemu.


Floppy drive(s): fd0 is 2.88M
ide0: disabled, no IRQ
ide0: failed to initialize IDE interface
ide0: disabling port
cmd64x 0000:00:02.0: IDE controller (0x1095:0x0646 rev 0x07)
CMD64x_IDE 0000:00:02.0: BAR 0: can't reserve [io  0x8050-0x8057]
cmd64x 0000:00:02.0: can't reserve resources
CMD64x_IDE: probe of 0000:00:02.0 failed with error -16
ide_generic: please use "probe_mask=0x3f" module parameter for probing all legacy ISA IDE ports
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at fs/sysfs/dir.c:31 sysfs_warn_dup+0x94/0xd0
sysfs: cannot create duplicate filename '/class/ide_port/ide0'
...

Trace:
[<fffffc00003308a0>] __warn+0x160/0x190
[<fffffc000048c9f4>] sysfs_warn_dup+0x94/0xd0
[<fffffc0000330928>] warn_slowpath_fmt+0x58/0x70
[<fffffc000048c9f4>] sysfs_warn_dup+0x94/0xd0
[<fffffc0000486d40>] kernfs_path_from_node+0x30/0x60
[<fffffc00004874ac>] kernfs_put+0x16c/0x2c0
[<fffffc00004874ac>] kernfs_put+0x16c/0x2c0
[<fffffc000048d010>] sysfs_do_create_link_sd.isra.2+0x100/0x120
[<fffffc00005b9d64>] device_add+0x2a4/0x7c0
[<fffffc00005ba5cc>] device_create_groups_vargs+0x14c/0x170
[<fffffc00005ba518>] device_create_groups_vargs+0x98/0x170
[<fffffc00005ba690>] device_create+0x50/0x70
[<fffffc00005df36c>] ide_host_register+0x48c/0xa00
[<fffffc00005df330>] ide_host_register+0x450/0xa00
[<fffffc00005ba2a0>] device_register+0x20/0x50
[<fffffc00005df330>] ide_host_register+0x450/0xa00
[<fffffc00005df944>] ide_host_add+0x64/0xe0
[<fffffc000079b41c>] kobject_uevent_env+0x16c/0x710
[<fffffc0000310288>] do_one_initcall+0x68/0x260
[<fffffc00007b13bc>] kernel_init+0x1c/0x1a0
[<fffffc00007b13a0>] kernel_init+0x0/0x1a0
[<fffffc0000311868>] ret_from_kernel_thread+0x18/0x20
[<fffffc00007b13a0>] kernel_init+0x0/0x1a0

---[ end trace 24a70433c3e4d374 ]---
ide0: disabling port

[ multiple times ]

A complete log is available at http://kerneltests.org/builders/qemu-alpha-master.

Prior to the offending commit, the kernel log looks as follows.

...
Uniform Multi-Platform E-IDE driver
cmd64x 0000:00:02.0: IDE controller (0x1095:0x0646 rev 0x07)
cmd64x 0000:00:02.0: IDE port disabled
cmd64x 0000:00:02.0: 100% native mode on irq 28
PCI: Setting latency timer of device 0000:00:02.0 to 64
     ide0: BM-DMA at 0x8040-0x8047
Floppy drive(s): fd0 is 2.88M
ide0 at 0x8050-0x8057,0x8062 on irq 28 (serialized)
ide_generic: please use "probe_mask=0x3f" module parameter for probing all legacy ISA IDE ports
ide1 at 0x1f0-0x1f7,0x3f6 on irq 14
ide2 at 0x170-0x177,0x376 on irq 15
ide-gd driver 1.18
ide-cd driver 5.00
...

Reverting the commit is not possible due to context changes.

Bisect log is attached.

Guenter

----------------------
# bad: [ebb2c2437d8008d46796902ff390653822af6cc4] Merge tag 'mmc-v4.14-2' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc
# good: [5969d1bb3082b41eba8fd2c826559abe38ccb6df] Merge branch 'gperf-removal'
git bisect start 'HEAD' '5969d1bb3082'
# bad: [ae46654bcff303b33facbbd04a3ad9c21d303f9b] Merge tag 'armsoc-drivers' of git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc
git bisect bad ae46654bcff303b33facbbd04a3ad9c21d303f9b
# bad: [126e76ffbf78d9e948b641aadb265d16c57f5a3d] Merge branch 'for-4.14/block-postmerge' of git://git.kernel.dk/linux-block
git bisect bad 126e76ffbf78d9e948b641aadb265d16c57f5a3d
# bad: [0d519f2d1ed1f11e49abc88cfcf6cf13b83ba14c] Merge tag 'pci-v4.14-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci
git bisect bad 0d519f2d1ed1f11e49abc88cfcf6cf13b83ba14c
# good: [cf5f9cc8e4e5e8e0ecc35f1c904d98f889be2c0f] Merge branch 'pci/hotplug' into next
git bisect good cf5f9cc8e4e5e8e0ecc35f1c904d98f889be2c0f
# good: [5f54c8b2d4fad95d1f8ecbe023ebe6038e6d3760] Merge branch 'kvm-ppc-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/paulus/powerpc
git bisect good 5f54c8b2d4fad95d1f8ecbe023ebe6038e6d3760
# good: [369130b63178e0e2f863a2da2a5ad0238ded6d9d] selftests: Enhance kselftest_harness.h to print which assert failed
git bisect good 369130b63178e0e2f863a2da2a5ad0238ded6d9d
# bad: [d872694bac212f76ca13fd20a85e5c1bdb53a945] Merge branch 'pci/pm' into next
git bisect bad d872694bac212f76ca13fd20a85e5c1bdb53a945
# bad: [d4fdf844c9c3debc080aea1be8b71d9d0aaa01dc] Merge branch 'pci/irq-fixups' into next
git bisect bad d4fdf844c9c3debc080aea1be8b71d9d0aaa01dc
# bad: [04c81c7293df875ca6a46e2c9a272c7ec72e5145] MIPS: PCI: Replace pci_fixup_irqs() call with host bridge IRQ mapping hooks
git bisect bad 04c81c7293df875ca6a46e2c9a272c7ec72e5145
# good: [20d693225ab78f0651b0e116b74196aaf8a950bb] sh/PCI: Replace pci_fixup_irqs() call with host bridge IRQ mapping hooks
git bisect good 20d693225ab78f0651b0e116b74196aaf8a950bb
# bad: [19cc4c843f40c6110dd07270414586e7fe4121b2] m68k/PCI: Replace pci_fixup_irqs() call with host bridge IRQ mapping hooks
git bisect bad 19cc4c843f40c6110dd07270414586e7fe4121b2
# bad: [0e4c2eeb758a91e68b9eaf7a4bee9bd5ed97ff2b] alpha/PCI: Replace pci_fixup_irqs() call with host bridge IRQ mapping hooks
git bisect bad 0e4c2eeb758a91e68b9eaf7a4bee9bd5ed97ff2b
# first bad commit: [0e4c2eeb758a91e68b9eaf7a4bee9bd5ed97ff2b] alpha/PCI: Replace pci_fixup_irqs() call with host bridge IRQ mapping hooks


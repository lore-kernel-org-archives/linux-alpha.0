From: Samuel Holland <samuel@sholland.org>
Subject: [PATCH v3 0/8] genirq: Provide real IRQ affinity masks in non-SMP configs
Date: Fri,  1 Jul 2022 15:00:48 -0500
Message-ID: <20220701200056.46555-1-samuel@sholland.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to;
         s=fm3; t=1656705670; x=1656712870; bh=h3WN3AcddFJuwhQ39XPEdgr5t
        ejPWmRF9a5JWUKLi6w=; b=mK5frjjpRETCdaizhOvpq/mQo5UlOZqfHCt356wLu
        +SqVP3qKJ9LvP7YyRWEopUxCgCJ/Co0nb1GRIXbVwdtlJ5JrYoRlSvc+27WDag9+
        3jqJC6Nc5lLjDB1EbFnpv2S6VMiJgoGG3ESQyrzvFx4wbwb1+hfvfkj14nzE1iZ9
        iHVs2Uh7tOwAj5coKNt98E1KuIr4Dy7ZidSi8Si+tRxxbGIc8g9/Wkp/PXxkdKWp
        GwXvkDhS2Mkt7Y8U+OzIUgUEfaENyM7PjR+7UVXgmM8J+652ddmFvBKyk157w8wr
        Skl8C3hKCbHheCLVFZJbuy7hz1/cffoSdxxCfnrh8YV+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1656705670; x=1656712870; bh=h3WN3AcddFJuwhQ39XPEdgr5tejPWmRF9a5
        JWUKLi6w=; b=hcCVwh1PvSeKLtV/WWesjzpJEJOw4znKr5Z/2vhxnZuKQA9kLw4
        /4+bCBG81guTmscsfsRlkY2MRf/An6IfLb4PqUB9cFC2NzaudqFlvP/yY19K+3XC
        pDHCoLiIcwUV2Xv5FAIqCmEYAOVR+oCL2f261uukUnOGmb9sZJ1Wjru1FpMPNx9q
        O20C8qlSGZIk/uqxcd6LnT2yDuqwiTmpUUWND72se1ELzfF/mrU6icJu6Gm0jlH3
        iWOFR5OoOCZxlEPQplc7c7ud1SjE6qek/nk6mnJ70FNjkvapXHjyVwlAV5qpv1MZ
        45+fzYTFXAvc9YboPqeOQ31my0wQpPDiZ5Q==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Samuel Holland <samuel@sholland.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chris Zankel <chris@zankel.net>, Colin Ian King <colin.king@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Dexuan Cui <decui@microsoft.com>, Florian Fainelli <f.fainelli@gmail.com>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Haiyang Zhang <haiyangz@microsoft.com>, Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "James E.J. Bottomley" <James.Bottomley@HansenP>

This series solves some inconsistency with how IRQ affinity masks are
handled between SMP and non-SMP configurations.

In non-SMP configs, an IRQ's true affinity is always cpumask_of(0), so
irq_{,data_}get_affinity_mask now return that, instead of returning an
uninitialized per-IRQ cpumask. This change makes iterating over the
affinity mask do the right thing in both SMP and non-SMP configurations.

To accomplish that:
 - patches 1-3 disable some library code that was broken anyway on !SMP
 - patches 4-7 refactor the code so that irq_{,data_}get_affinity_mask
   can return a const cpumask, since that is what cpumask_of provides
 - patch 8 drops the per-IRQ cpumask and replaces it with cpumask_of(0)

This series was split from the v2 series here, which uses the new
behavior in the RISC-V PLIC irqchip driver:

https://lore.kernel.org/lkml/20220616064028.57933-1-samuel@sholland.org/

Changes in v3:
 - New patch to fix build errors in uniprocessor MIPS configs
 - New patch to drop irq_init_effective_affinity
 - New patch to introduce irq_data_update_affinity
 - New patch to make the returned cpumasks const
 - Use cpumask_of(0) instead of cpu_possible_mask

Changes in v2:
 - New patch to prevent GENERIC_IRQ_IPI from being selected on !SMP

Samuel Holland (8):
  irqchip/mips-gic: Only register IPI domain when SMP is enabled
  genirq: GENERIC_IRQ_IPI depends on SMP
  genirq: GENERIC_IRQ_EFFECTIVE_AFF_MASK depends on SMP
  genirq: Drop redundant irq_init_effective_affinity
  genirq: Refactor accessors to use irq_data_get_affinity_mask
  genirq: Add and use an irq_data_update_affinity helper
  genirq: Return a const cpumask from irq_data_get_affinity_mask
  genirq: Provide an IRQ affinity mask in non-SMP configs

 arch/alpha/kernel/irq.c              |  2 +-
 arch/arm/mach-hisi/Kconfig           |  2 +-
 arch/ia64/kernel/iosapic.c           |  2 +-
 arch/ia64/kernel/irq.c               |  4 +-
 arch/ia64/kernel/msi_ia64.c          |  4 +-
 arch/mips/cavium-octeon/octeon-irq.c |  4 +-
 arch/parisc/kernel/irq.c             |  2 +-
 arch/sh/kernel/irq.c                 |  7 +--
 arch/x86/hyperv/irqdomain.c          |  2 +-
 arch/xtensa/kernel/irq.c             |  7 +--
 drivers/iommu/hyperv-iommu.c         |  2 +-
 drivers/irqchip/Kconfig              | 19 +++----
 drivers/irqchip/irq-bcm6345-l1.c     |  4 +-
 drivers/irqchip/irq-mips-gic.c       | 80 +++++++++++++++++++---------
 drivers/parisc/iosapic.c             |  2 +-
 drivers/pci/controller/pci-hyperv.c  | 10 ++--
 drivers/sh/intc/chip.c               |  2 +-
 drivers/xen/events/events_base.c     |  7 +--
 include/linux/irq.h                  | 34 ++++++++----
 kernel/irq/Kconfig                   |  2 +
 kernel/irq/chip.c                    |  8 +--
 kernel/irq/debugfs.c                 |  2 +-
 kernel/irq/ipi.c                     | 16 +++---
 kernel/irq/manage.c                  | 10 +---
 24 files changed, 140 insertions(+), 94 deletions(-)

-- 
2.35.1


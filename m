From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 0/3] IRQ trivial clarifications
Date: Sun, 12 Jul 2015 17:01:45 -0500
Message-ID: <20150712215559.7166.33068.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=subject:to:from:cc:date:message-id:user-agent:mime-version
         :content-type:content-transfer-encoding;
        bh=vm+llnLKuJ98kWsRukKf4ELJz+mj1f+Wk9P4dgdlL2A=;
        b=JFUmISTSl80ujcZafLRQnswcfIhluszmB64GDxvBcLsyFhu0ukEZcZQ3DK7G7X4ce6
         1YCjVPeOY/KlftBkce7YCBO4vXcsBf0kB8V4cmuMFvMBId8m2Uq6qQWFoxTcV9fYYueq
         ylZWt2mwsdcBiPheFiOMgP5zY1mH7FLxg3bl1HNnUnu/e8+JpJ7jO1bon2DCg4VMQ/jl
         2WbDp1bYnTFLOZWC+mwnBEs2vemeKRLGFp5MYvEkIHwnaT6daLoleX3WFLiJSV9gKW9z
         nRqXqk5X1ZcO+GwybMXiHF7Qtj5DKr1nP64BMmc1v38xtVlapAU1ki3bwk6QDbVMJD9L
         gBQQ==
Sender: linux-parisc-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arch@vger.kernel.org, linux-mips@linux-mips.org, linux-am33-list@redhat.com, linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org

These don't fix anything at all.  But they might make code understanding
and debugging slightly easier.

---

Bjorn Helgaas (3):
      x86, irq: Rename VECTOR_UNDEFINED and VECTOR_RETRIGGERED to IRQ_*
      x86, irq: Clarify "No irq handler" message
      IRQ: Print "unexpected IRQ" messages consistently across architectures


 arch/alpha/kernel/irq.c            |    2 +-
 arch/blackfin/kernel/irqchip.c     |    2 +-
 arch/c6x/kernel/irq.c              |    2 +-
 arch/ia64/kernel/irq.c             |    2 +-
 arch/m68k/include/asm/hardirq.h    |    2 +-
 arch/mips/kernel/irq.c             |    2 +-
 arch/mn10300/kernel/irq.c          |    2 +-
 arch/parisc/include/asm/hardirq.h  |    2 +-
 arch/powerpc/include/asm/hardirq.h |    2 +-
 arch/s390/include/asm/hardirq.h    |    2 +-
 arch/sh/kernel/irq.c               |    2 +-
 arch/tile/kernel/irq.c             |    2 +-
 arch/x86/include/asm/hw_irq.h      |    4 ++--
 arch/x86/kernel/apic/vector.c      |   14 +++++++-------
 arch/x86/kernel/irq.c              |   19 +++++++++----------
 arch/x86/kernel/irqinit.c          |    4 ++--
 include/asm-generic/hardirq.h      |    2 +-
 17 files changed, 33 insertions(+), 34 deletions(-)

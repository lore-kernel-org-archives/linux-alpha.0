From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 0/4] PCI: Add pci_dev_for_each_resource() helper and refactor bus one
Date: Thu,  3 Nov 2022 18:46:40 +0200
Message-ID: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667493999; x=1699029999;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6sEwb2LvPX9v9prH3mu2nEGi0LVqQc1+Me9tIfh9Gsk=;
  b=Nd7KO1lUqzSnMtk3j7fYSRN4GBMulzyp8KtXzvtG6CJ3U8l0+Bw02ZYM
   56Q0/w04hbsprEsCu7TpWXhSVHW587RksAV9JZ3yEL2KDC35A8DgUON9T
   S9V3ICr0AbOnFFdGzl+JWCeDkn+TJ2uCNhdvnrKcDIYU80ENRVrjjvMF4
   QUfEk+tVFXZSWMcVeL34qNT0ZZ1z/dnzaFvI2fa3BGd6WgiLFY42JwZV0
   FZvWu40M4ewv8maytGzDy0gsJ2WHoIajwyNW4eo7g+olJU+E9weHXxkKP
   gTgBjOqn60ynR9iyRXS6K2OkGl47/em5PD+/9CmQm1sHGCEdA6k878nFy
   g==;
Content-Type: text/plain; charset="us-ascii"
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Provide two new helper macros to iterate over PCI device resources and
convert users.

Looking at it, refactor existing pci_bus_for_each_resource() and convert
users accordingly.

This applies on top of this patch Mika sent out earlier:
https://lore.kernel.org/linux-pci/20221103103254.30497-1-mika.westerberg@linux.intel.com/

Changelog v2:
- refactor to have two macros
- refactor existing pci_bus_for_each_resource() in the same way and
  convert users

Andy Shevchenko (3):
  PCI: Split pci_bus_for_each_resource_p() out of
    pci_bus_for_each_resource()
  EISA: Convert to use pci_bus_for_each_resource_p()
  pcmcia: Convert to use pci_bus_for_each_resource_p()

Mika Westerberg (1):
  PCI: Introduce pci_dev_for_each_resource()

 .clang-format                      |  3 +++
 arch/alpha/kernel/pci.c            |  5 ++---
 arch/arm/kernel/bios32.c           | 16 ++++++-------
 arch/mips/pci/pci-legacy.c         |  3 +--
 arch/powerpc/kernel/pci-common.c   |  5 ++---
 arch/sparc/kernel/leon_pci.c       |  5 ++---
 arch/sparc/kernel/pci.c            | 10 ++++-----
 arch/sparc/kernel/pcic.c           |  5 ++---
 drivers/eisa/pci_eisa.c            |  4 ++--
 drivers/pci/bus.c                  |  7 +++---
 drivers/pci/hotplug/shpchp_sysfs.c |  8 +++----
 drivers/pci/pci.c                  |  5 ++---
 drivers/pci/probe.c                |  2 +-
 drivers/pci/remove.c               |  5 ++---
 drivers/pci/setup-bus.c            | 36 ++++++++++++------------------
 drivers/pci/setup-res.c            |  4 +---
 drivers/pci/xen-pcifront.c         |  4 +---
 drivers/pcmcia/rsrc_nonstatic.c    |  9 +++-----
 drivers/pcmcia/yenta_socket.c      |  3 +--
 include/linux/pci.h                | 25 +++++++++++++++++----
 20 files changed, 78 insertions(+), 86 deletions(-)

-- 
2.35.1



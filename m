From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v5 0/4] PCI: Add pci_dev_for_each_resource() helper and update users
Date: Tue, 14 Mar 2023 21:26:30 +0200
Message-ID: <20230314192634.63531-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678821963; x=1710357963;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o5wvjgss3WToenPFVgKISR2zGwGV5RepaqjvWSlSslQ=;
  b=KNrV18sw6210DnZK1eieibt424sRaN+UjSdho91UXgFOgW/lEG8JWKz5
   dhfMivped0VLpl0ybj6BNJzl7yzEhQI0fGzFVDb9vEBEckYbo8LvOXEgm
   Mw1qT5qFhwAHk/1JDAs7Z7s7shsyEBN1uQXEMKEAJALn1mfyZm7UcMiT8
   RNMhkkNzgDdwaVxUslhQO72V36/Ov44/5qdbWqLMlVOivs4sHCtUDIjXk
   PoH0fk20HUsiCrn1luqIfo27Fyl4mD8SEiR3CmYgm+RwJemFxCk5wraEQ
   PaVKEpYPezzHzTd7b/c7xp+7Onkq+/k9dP6mnOBpl/PEvLV9LdCmFdSiB
   w==;
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists
Cc: Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Anatolij Gustschin <agust@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>

Provide two new helper macros to iterate over PCI device resources and
convert users.

Looking at it, refactor existing pci_bus_for_each_resource() and convert
users accordingly.

Changelog v5:
- renamed loop variable to minimize the clash (Keith)
- addressed smatch warning (Dan)
- addressed 0-day bot findings (LKP)

Changelog v4:
- rebased on top of v6.3-rc1
- added tag (Krzysztof)

Changelog v3:
- rebased on top of v2 by Mika, see above
- added tag to pcmcia patch (Dominik)

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

 .clang-format                             |  3 ++
 arch/alpha/kernel/pci.c                   |  5 ++-
 arch/arm/kernel/bios32.c                  | 16 +++++-----
 arch/arm/mach-dove/pcie.c                 | 10 +++---
 arch/arm/mach-mv78xx0/pcie.c              | 10 +++---
 arch/arm/mach-orion5x/pci.c               | 10 +++---
 arch/mips/pci/ops-bcm63xx.c               |  8 ++---
 arch/mips/pci/pci-legacy.c                |  3 +-
 arch/powerpc/kernel/pci-common.c          | 21 +++++++------
 arch/powerpc/platforms/4xx/pci.c          |  8 ++---
 arch/powerpc/platforms/52xx/mpc52xx_pci.c |  4 +--
 arch/powerpc/platforms/pseries/pci.c      | 16 +++++-----
 arch/sh/drivers/pci/pcie-sh7786.c         | 10 +++---
 arch/sparc/kernel/leon_pci.c              |  5 ++-
 arch/sparc/kernel/pci.c                   | 10 +++---
 arch/sparc/kernel/pcic.c                  |  5 ++-
 drivers/eisa/pci_eisa.c                   |  4 +--
 drivers/pci/bus.c                         |  7 ++---
 drivers/pci/hotplug/shpchp_sysfs.c        |  8 ++---
 drivers/pci/pci.c                         |  5 ++-
 drivers/pci/probe.c                       |  2 +-
 drivers/pci/remove.c                      |  5 ++-
 drivers/pci/setup-bus.c                   | 37 +++++++++--------------
 drivers/pci/setup-res.c                   |  4 +--
 drivers/pci/vgaarb.c                      | 17 +++--------
 drivers/pci/xen-pcifront.c                |  4 +--
 drivers/pcmcia/rsrc_nonstatic.c           |  9 ++----
 drivers/pcmcia/yenta_socket.c             |  3 +-
 drivers/pnp/quirks.c                      | 29 ++++++------------
 include/linux/pci.h                       | 29 ++++++++++++++----
 30 files changed, 142 insertions(+), 165 deletions(-)

-- 
2.39.2


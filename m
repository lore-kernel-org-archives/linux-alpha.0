From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v6 0/4] Add pci_dev_for_each_resource() helper and update users
Date: Mon, 20 Mar 2023 15:16:29 +0200
Message-ID: <20230320131633.61680-1-andriy.shevchenko@linux.intel.com>
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
  t=1679318222; x=1710854222;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KxlXRVH7N+45zvim8tIjdmWaRb89rG1+XDN/qvGgUbg=;
  b=bZkUpuYj/B3KIGy/Dfw8TygtMhZ24TJ+9OYByu5a4HyyqGsnU/YCG+Vx
   iArX7bAfj6r63j0JR7qk8xRR7Ar/9O6g3KyaMxXrZJEw06CYwh9XOiFwO
   vb3+ZMwNC1Gp2mQgNe61E2uOufdRIPw6d6JysmVRfI5ImDQMuvHn9qpbE
   kKbi6Z+65gWi/v1Ity+2XUUROLic14C385BaSt4fyJevpTjzHRGe/tv9u
   3D5fRVK/4r27FTNSEPIWIVtChq1ACYAU25faSRjjG9NVKlOTgsqgQ/xdd
   RAfMs9YnT9Yzg5O3Z5jkRSRSjODjcDe3SwkXFPjmTM9BgnD/l66JDGVZj
   g==;
Content-Type: text/plain; charset="us-ascii"
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@li
Cc: Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Anatolij Gustschin <agust@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Provide two new helper macros to iterate over PCI device resources and
convert users.

Looking at it, refactor existing pci_bus_for_each_resource() and convert
users accordingly.

Changelog v6:
- dropped unused variable in PPC code (LKP)

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
 arch/powerpc/platforms/52xx/mpc52xx_pci.c |  5 ++-
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
 30 files changed, 142 insertions(+), 166 deletions(-)

-- 
2.39.2



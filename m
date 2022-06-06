From: Arnd Bergmann <arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/6] phase out CONFIG_VIRT_TO_BUS
Date: Mon,  6 Jun 2022 10:41:03 +0200
Message-ID: <20220606084109.4108188-1-arnd@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654504884;
 bh=sDOLXYQR0wOt3J1gNTtbMOI7sGHc/kgPyuM8RXutK6o=;
 h=From:To:Cc:Subject:Date:From;
 b=SkDVuZeDrFJ5adNIjdWczP7EVnrZrEp+b8yU8nbse1AbBTmXLuujgQXqukIPdpKP3
 jSZ31jnOZ/+J/T/tRB28RAeo8NGiBd/TKqQnFCLbG+oG/dtT3GCqi/W3IS2bDK+hNi
 i0jDa5e9iaXrvGUPpvloldIKntp4YGFDBwTdkXFsEdbaMrGtGPlL0fuvuGwxCMBdVV
 76gpV0DFczhbrMGSff3e/ZOmlqAnKy+kOhfKLgF12HFzcDvn0yARasaaVFnbObBUAl
 uX74CL7XSW/CloOp4Tr2E8Z8nhD9gE9XMoP2apFoo0WvB+vAsfa8d7hBmEvkZ2XDcE
 aSXARa3ZlYuZg==
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
Cc: linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-m68k-cunTk1MwBs8S/qaLPR03pWD2FQJk+8+b@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Martyn Welch <martyn-UcCTFicEjwugMbh0pXVFDA@public.gmane.org>, Manohar Vanga <manohar.vanga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Denis Efremov <efremov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Khalid Aziz <khalid-21RPF02GE+GXwddmVfQv5g@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>

From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

The virt_to_bus/bus_to_virt interface has been deprecated for
decades. After Jakub Kicinski put a lot of work into cleaning out the
network drivers using them, there are only a couple of other drivers
left, which can all be removed or otherwise cleaned up, to remove the
old interface for good.

Any out of tree drivers using virt_to_bus() should be converted to
using the dma-mapping interfaces, typically dma_alloc_coherent()
or dma_map_single()).

There are a few m68k and ppc32 specific drivers that keep using the
interfaces, but these are all guarded with architecture-specific
Kconfig dependencies, and are not actually broken.

There are still a number of drivers that are using virt_to_phys()
and phys_to_virt() in place of dma-mapping operations, and these
are often broken, but they are out of scope for this series.

      Arnd

Cc: Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> # dma-mapping
Cc: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> # dma-mapping
Cc: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org> # dma-mapping
Cc: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Cc: Khalid Aziz <khalid-21RPF02GE+GXwddmVfQv5g@public.gmane.org> # buslogic
Cc: linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Manohar Vanga <manohar.vanga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> # vme
Cc: Martyn Welch <martyn-UcCTFicEjwugMbh0pXVFDA@public.gmane.org> # vme
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> # vme
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-m68k-cunTk1MwBs8S/qaLPR03pWD2FQJk+8+b@public.gmane.org
Cc: linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Denis Efremov <efremov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org> # floppy

Arnd Bergmann (6):
  vme: remove ca91cx42 Universe-II support
  vme: move back to staging
  media: sta2x11: remove VIRT_TO_BUS dependency
  scsi: dpt_i2o: drop stale VIRT_TO_BUS dependency
  scsi: remove stale BusLogic driver
  arch/*/: remove CONFIG_VIRT_TO_BUS

 .../core-api/bus-virt-phys-mapping.rst        |  220 -
 Documentation/core-api/dma-api-howto.rst      |   14 -
 Documentation/core-api/index.rst              |    1 -
 Documentation/driver-api/vme.rst              |    4 +-
 Documentation/scsi/BusLogic.rst               |  581 --
 Documentation/scsi/FlashPoint.rst             |  176 -
 .../translations/zh_CN/core-api/index.rst     |    1 -
 MAINTAINERS                                   |   11 +-
 arch/alpha/Kconfig                            |    1 -
 arch/alpha/include/asm/floppy.h               |    2 +-
 arch/alpha/include/asm/io.h                   |    8 +-
 arch/ia64/Kconfig                             |    1 -
 arch/ia64/include/asm/io.h                    |    8 -
 arch/m68k/Kconfig                             |    1 -
 arch/m68k/include/asm/virtconvert.h           |    4 +-
 arch/microblaze/Kconfig                       |    1 -
 arch/microblaze/include/asm/io.h              |    2 -
 arch/mips/Kconfig                             |    1 -
 arch/mips/include/asm/io.h                    |    9 -
 arch/parisc/Kconfig                           |    1 -
 arch/parisc/include/asm/floppy.h              |    4 +-
 arch/parisc/include/asm/io.h                  |    2 -
 arch/powerpc/Kconfig                          |    1 -
 arch/powerpc/include/asm/io.h                 |    2 -
 arch/riscv/include/asm/page.h                 |    1 -
 arch/x86/Kconfig                              |    1 -
 arch/x86/include/asm/io.h                     |    9 -
 arch/xtensa/Kconfig                           |    1 -
 arch/xtensa/include/asm/io.h                  |    3 -
 drivers/Kconfig                               |    2 -
 drivers/Makefile                              |    1 -
 drivers/media/pci/sta2x11/Kconfig             |    2 +-
 drivers/scsi/BusLogic.c                       | 3727 --------
 drivers/scsi/BusLogic.h                       | 1284 ---
 drivers/scsi/FlashPoint.c                     | 7560 -----------------
 drivers/scsi/Kconfig                          |   26 +-
 drivers/scsi/dpt_i2o.c                        |    4 +-
 drivers/staging/vme_user/Kconfig              |   27 +
 drivers/staging/vme_user/Makefile             |    3 +
 drivers/{vme => staging/vme_user}/vme.c       |    2 +-
 .../linux => drivers/staging/vme_user}/vme.h  |    0
 .../{vme => staging/vme_user}/vme_bridge.h    |    2 +-
 .../bridges => staging/vme_user}/vme_fake.c   |    4 +-
 .../bridges => staging/vme_user}/vme_tsi148.c |    4 +-
 .../bridges => staging/vme_user}/vme_tsi148.h |    0
 drivers/staging/vme_user/vme_user.c           |    2 +-
 drivers/vme/Kconfig                           |   18 -
 drivers/vme/Makefile                          |    8 -
 drivers/vme/boards/Kconfig                    |   10 -
 drivers/vme/boards/Makefile                   |    6 -
 drivers/vme/boards/vme_vmivme7805.c           |  106 -
 drivers/vme/boards/vme_vmivme7805.h           |   33 -
 drivers/vme/bridges/Kconfig                   |   24 -
 drivers/vme/bridges/Makefile                  |    4 -
 drivers/vme/bridges/vme_ca91cx42.c            | 1928 -----
 drivers/vme/bridges/vme_ca91cx42.h            |  579 --
 include/asm-generic/io.h                      |   14 -
 mm/Kconfig                                    |    8 -
 58 files changed, 54 insertions(+), 16405 deletions(-)
 delete mode 100644 Documentation/core-api/bus-virt-phys-mapping.rst
 delete mode 100644 Documentation/scsi/BusLogic.rst
 delete mode 100644 Documentation/scsi/FlashPoint.rst
 delete mode 100644 drivers/scsi/BusLogic.c
 delete mode 100644 drivers/scsi/BusLogic.h
 delete mode 100644 drivers/scsi/FlashPoint.c
 rename drivers/{vme => staging/vme_user}/vme.c (99%)
 rename {include/linux => drivers/staging/vme_user}/vme.h (100%)
 rename drivers/{vme => staging/vme_user}/vme_bridge.h (99%)
 rename drivers/{vme/bridges => staging/vme_user}/vme_fake.c (99%)
 rename drivers/{vme/bridges => staging/vme_user}/vme_tsi148.c (99%)
 rename drivers/{vme/bridges => staging/vme_user}/vme_tsi148.h (100%)
 delete mode 100644 drivers/vme/Kconfig
 delete mode 100644 drivers/vme/Makefile
 delete mode 100644 drivers/vme/boards/Kconfig
 delete mode 100644 drivers/vme/boards/Makefile
 delete mode 100644 drivers/vme/boards/vme_vmivme7805.c
 delete mode 100644 drivers/vme/boards/vme_vmivme7805.h
 delete mode 100644 drivers/vme/bridges/Kconfig
 delete mode 100644 drivers/vme/bridges/Makefile
 delete mode 100644 drivers/vme/bridges/vme_ca91cx42.c
 delete mode 100644 drivers/vme/bridges/vme_ca91cx42.h

-- 
2.29.2

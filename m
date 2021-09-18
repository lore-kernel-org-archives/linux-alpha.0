From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
Date: Sat, 18 Sep 2021 15:11:20 +0200 (CEST)
Message-ID: <202109181311.18IDBKQB005215@valdese.nms.ulrich-teichert.org>
References: <20210918095134.GA5001@tower>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-sparse-owner@vger.kernel.org>
In-Reply-To: <20210918095134.GA5001@tower>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Cree <mcree@orcon.net.nz>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, alpha <linux-alpha@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-parisc@vger.kernel.org, Netdev <netdev@vger.kernel.org>, Sparse Mailing-list <linux-sparse@vger.kernel.org>

Hi,

> 
> On Thu, Sep 16, 2021 at 11:35:36AM -0700, Linus Torvalds wrote:
> > On Wed, Sep 15, 2021 at 3:33 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > drivers/net/ethernet/3com/3c515.c: In function 'corkscrew_start_xmit':
> > > drivers/net/ethernet/3com/3c515.c:1053:22: error:
> > >         cast from pointer to integer of different size
> > >
> > > That is a typecast from a pointer to an int, which is then sent to an
> > > i/o port. That driver should probably be disabled for 64-bit builds.
> > 
> > Naah. I think the Jensen actually had an ISA slot. Came with a
> > whopping 8MB too, so the ISA DMA should work just fine.
> > 
> > Or maybe it was EISA only? I really don't remember.

It's EISA only. I've made some pictures of a somewhat dusty inside of
a Jensen with 4 EISA cards (from bottom to top: SCSI, video, 2x network):

http://alpha.ulrich-teichert.org/

(don't worry about the loose cable on one of the pictures, that's just
my crude RTC battery replacment)

> > I have no way - or interest - to test that on real hardware, but I did
> > check that if I relax the config I can at least build it cleanly on
> > x86-64 with that change.

I could not get a recent kernel to boot, but it's booting ancient kernels
just fine:

Linux version 2.4.27-2-generic (tretkowski@bastille) (gcc version 3.3.5 (Debian 1:3.3.5-12)) #1 Sun May 29 18:40:58 UTC 2005
Booting GENERIC on Jensen using machine vector Jensen from SRM
Major Options: LEGACY_START 
Command line: ro  root=/dev/sda3
memcluster 0, usage 1, start        0, end      256
memcluster 1, usage 0, start      256, end     8192
freeing pages 256:384
freeing pages 757:8192
reserving pages 757:758
Initial ramdisk at: 0xfffffc00039d2000 (5308416 bytes)
Max ASN from HWRPB is bad (0xf)
On node 0 totalpages: 8192
zone(0): 8192 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: ro  root=/dev/sda3
...

> > It can't make matters worse, and it's the RightThing(tm).
> > 
> > Since Micheal replied about that other alpha issue, maybe he knows
> > about the ISA slot situation too?
> 
> Ah, yeah, not really.  I am not familiar with the Jensen hardware,
> and have never played around with the EISA slot on the Alphas I do
> have.

I know the feeling.... So many computers, so little time...
While we're at it, during my vain attempts to get new kernels to boot,
I tried to disable PCI support to make the kernels smaller (after all,
the Jensen has only EISA, so what good would PCI support for?) and
got it to compile with the attached patch (which fixes some warnings,
too). Should apply cleanly to Linus tree.

Enable compile for the Jensen without PCI support.

Signed-off-by: Ulrich Teichert <ulrich.teichert@gmx.de>
---
 arch/alpha/include/asm/jensen.h | 8 ++++----
 arch/alpha/kernel/sys_jensen.c  | 2 +-
 include/asm-generic/pci_iomap.h | 6 +++++-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/include/asm/jensen.h b/arch/alpha/include/asm/jensen.h
index 916895155a88..1c4131453db2 100644
--- a/arch/alpha/include/asm/jensen.h
+++ b/arch/alpha/include/asm/jensen.h
@@ -111,18 +111,18 @@ __EXTERN_INLINE void jensen_set_hae(unsigned long addr)
  * convinced that I need one of the newer machines.
  */
 
-static inline unsigned int jensen_local_inb(unsigned long addr)
+__EXTERN_INLINE unsigned int jensen_local_inb(unsigned long addr)
 {
 	return 0xff & *(vuip)((addr << 9) + EISA_VL82C106);
 }
 
-static inline void jensen_local_outb(u8 b, unsigned long addr)
+__EXTERN_INLINE void jensen_local_outb(u8 b, unsigned long addr)
 {
 	*(vuip)((addr << 9) + EISA_VL82C106) = b;
 	mb();
 }
 
-static inline unsigned int jensen_bus_inb(unsigned long addr)
+__EXTERN_INLINE unsigned int jensen_bus_inb(unsigned long addr)
 {
 	long result;
 
@@ -131,7 +131,7 @@ static inline unsigned int jensen_bus_inb(unsigned long addr)
 	return __kernel_extbl(result, addr & 3);
 }
 
-static inline void jensen_bus_outb(u8 b, unsigned long addr)
+__EXTERN_INLINE void jensen_bus_outb(u8 b, unsigned long addr)
 {
 	jensen_set_hae(0);
 	*(vuip)((addr << 7) + EISA_IO + 0x00) = b * 0x01010101;
diff --git a/arch/alpha/kernel/sys_jensen.c b/arch/alpha/kernel/sys_jensen.c
index e5d870ff225f..40db6c3d9690 100644
--- a/arch/alpha/kernel/sys_jensen.c
+++ b/arch/alpha/kernel/sys_jensen.c
@@ -17,7 +17,7 @@
 
 #include <asm/ptrace.h>
 
-#define __EXTERN_INLINE inline
+#define __EXTERN_INLINE extern inline
 #include <asm/io.h>
 #include <asm/jensen.h>
 #undef  __EXTERN_INLINE
diff --git a/include/asm-generic/pci_iomap.h b/include/asm-generic/pci_iomap.h
index df636c6d8e6c..446a0c576b33 100644
--- a/include/asm-generic/pci_iomap.h
+++ b/include/asm-generic/pci_iomap.h
@@ -18,6 +18,7 @@ extern void __iomem *pci_iomap_range(struct pci_dev *dev, int bar,
 extern void __iomem *pci_iomap_wc_range(struct pci_dev *dev, int bar,
 					unsigned long offset,
 					unsigned long maxlen);
+extern void pci_iounmap(struct pci_dev *dev, void __iomem *p);
 /* Create a virtual mapping cookie for a port on a given PCI device.
  * Do not call this directly, it exists to make it easier for architectures
  * to override */
@@ -28,7 +29,7 @@ extern void __iomem *__pci_ioport_map(struct pci_dev *dev, unsigned long port,
 #define __pci_ioport_map(dev, port, nr) ioport_map((port), (nr))
 #endif
 
-#elif defined(CONFIG_GENERIC_PCI_IOMAP)
+#elif defined(CONFIG_GENERIC_PCI_IOMAP) || !defined(CONFIG_PCI)
 static inline void __iomem *pci_iomap(struct pci_dev *dev, int bar, unsigned long max)
 {
 	return NULL;
@@ -50,6 +51,9 @@ static inline void __iomem *pci_iomap_wc_range(struct pci_dev *dev, int bar,
 {
 	return NULL;
 }
+static inline void pci_iounmap(struct pci_dev *dev, void __iomem *p)
+{
+}
 #endif
 
 #endif /* __ASM_GENERIC_PCI_IOMAP_H */

-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de | Listening to:
Stormweg 24               |Eat Lipstick: Dirty Little Secret, The Baboon Show:
24539 Neumuenster, Germany|Work Work Work, The Bellrays: Bad Reaction

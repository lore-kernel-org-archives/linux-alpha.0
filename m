From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] alpha: Use generic <asm-generic/io.h>
Date: Tue,  6 Sep 2022 20:59:39 +0200
Message-ID: <20220906185939.765081-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=AoHnqnr0FE/g5bqLBuJhdmE6ggNrJW2TUcpKJKYnc14=;
        b=eu8eo/H0b6EyerFfxTAuAbaksF7Ja6kjamVHqj/wP4ijCRcraLs91Dc2WJ1BxIgctN
         Xhe4s1XTPi2MdOjSOzTDcQCg2XXA1k6aPzAvEUDxYqKZoctXm7qizUlA3dv0whffN4v4
         G2gnOIaezPuaEXKbxbgXy5T2NCdhSXwpiMjqt079rlt8g+x69yUNMBGHDQzJ/mHtG4lN
         pfxPbJGT3evrz/AiHdx8IPCisx7i/BQhQy8jCo0vjDY2v0zyo0E2EdGcuf1uJba9vdwO
         7YxoOAKrUrCx09DrWJraRUGXUHwM8qWfdESpsr3sMxQAQjY9LlE875mx2SX1tz4TlxAY
         /Kzw==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-alpha@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>, linux-arch@vger.kernel.org

This enables the alpha to use <asm-generic/io.h> to fill in the
missing (undefined) I/O accessor functions.

This is needed if Alpha ever wants to uses CONFIG_REGMAP_MMIO
which has been patches to use accelerated _noinc accessors
such as readsq/writesq that Alpha, while being a 64bit platform,
as of now not yet provide. readq/writeq is however provided
so the machine can do 64bit I/O.

This comes with the requirement that everything the architecture
already provides needs to be defined, rather than just being,
say, static inline functions.

Bite the bullet and just provide the definitions and make it work.

Some defines need to be piled right before the inclusion of
<asm-generic/io.h> due to the fact that alpha is including
<asm-generic/iomap.h> without selecting GENERIC_IOMAP.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/linux-mm/202208181447.G9FLcMkI-lkp@intel.com/
Cc: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-arch@vger.kernel.org
Cc: linux-alpha@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Move some defines to more natural places in the header.
- Explain the last few defines caused by including
  <asm-generic/iomap.h> but not defining GENERIC_IOMAP
- Will send this in a series to the arch tree soon.
---
 arch/alpha/include/asm/io.h | 78 ++++++++++++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 10 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index d277189b2677..a887628f2ea6 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -90,6 +90,8 @@ static inline void * phys_to_virt(unsigned long address)
 }
 #endif
 
+#define virt_to_phys		virt_to_phys
+#define phys_to_virt		phys_to_virt
 #define page_to_phys(page)	page_to_pa(page)
 
 /* Maximum PIO space address supported?  */
@@ -242,6 +244,12 @@ extern u32		inl(unsigned long port);
 extern void		outb(u8 b, unsigned long port);
 extern void		outw(u16 b, unsigned long port);
 extern void		outl(u32 b, unsigned long port);
+#define inb inb
+#define inw inw
+#define inl inl
+#define outb outb
+#define outw outw
+#define outl outl
 
 extern u8		readb(const volatile void __iomem *addr);
 extern u16		readw(const volatile void __iomem *addr);
@@ -251,6 +259,14 @@ extern void		writeb(u8 b, volatile void __iomem *addr);
 extern void		writew(u16 b, volatile void __iomem *addr);
 extern void		writel(u32 b, volatile void __iomem *addr);
 extern void		writeq(u64 b, volatile void __iomem *addr);
+#define readb readb
+#define readw readw
+#define readl readl
+#define readq readq
+#define writeb writeb
+#define writew writew
+#define writel writel
+#define writeq writeq
 
 extern u8		__raw_readb(const volatile void __iomem *addr);
 extern u16		__raw_readw(const volatile void __iomem *addr);
@@ -260,6 +276,14 @@ extern void		__raw_writeb(u8 b, volatile void __iomem *addr);
 extern void		__raw_writew(u16 b, volatile void __iomem *addr);
 extern void		__raw_writel(u32 b, volatile void __iomem *addr);
 extern void		__raw_writeq(u64 b, volatile void __iomem *addr);
+#define __raw_readb __raw_readb
+#define __raw_readw __raw_readw
+#define __raw_readl __raw_readl
+#define __raw_readq __raw_readq
+#define __raw_writeb __raw_writeb
+#define __raw_writew __raw_writew
+#define __raw_writel __raw_writel
+#define __raw_writeq __raw_writeq
 
 /*
  * Mapping from port numbers to __iomem space is pretty easy.
@@ -277,6 +301,9 @@ extern inline void ioport_unmap(void __iomem *addr)
 {
 }
 
+#define ioport_map ioport_map
+#define ioport_unmap ioport_unmap
+
 static inline void __iomem *ioremap(unsigned long port, unsigned long size)
 {
 	return IO_CONCAT(__IO_PREFIX,ioremap) (port, size);
@@ -358,6 +385,11 @@ extern inline void outw(u16 b, unsigned long port)
 }
 #endif
 
+#define ioread8 ioread8
+#define ioread16 ioread16
+#define iowrite8 iowrite8
+#define iowrite16 iowrite16
+
 #if IO_CONCAT(__IO_PREFIX,trivial_io_lq)
 extern inline unsigned int ioread32(const void __iomem *addr)
 {
@@ -385,6 +417,9 @@ extern inline void outl(u32 b, unsigned long port)
 }
 #endif
 
+#define ioread32 ioread32
+#define iowrite32 iowrite32
+
 #if IO_CONCAT(__IO_PREFIX,trivial_rw_bw) == 1
 extern inline u8 __raw_readb(const volatile void __iomem *addr)
 {
@@ -505,6 +540,10 @@ extern u8 readb_relaxed(const volatile void __iomem *addr);
 extern u16 readw_relaxed(const volatile void __iomem *addr);
 extern u32 readl_relaxed(const volatile void __iomem *addr);
 extern u64 readq_relaxed(const volatile void __iomem *addr);
+#define readb_relaxed readb_relaxed
+#define readw_relaxed readw_relaxed
+#define readl_relaxed readl_relaxed
+#define readq_relaxed readq_relaxed
 
 #if IO_CONCAT(__IO_PREFIX,trivial_io_bw)
 extern inline u8 readb_relaxed(const volatile void __iomem *addr)
@@ -557,6 +596,10 @@ static inline void memsetw_io(volatile void __iomem *addr, u16 c, long len)
 	_memset_c_io(addr, 0x0001000100010001UL * c, len);
 }
 
+#define memset_io memset_io
+#define memcpy_fromio memcpy_fromio
+#define memcpy_toio memcpy_toio
+
 /*
  * String versions of in/out ops:
  */
@@ -567,6 +610,13 @@ extern void outsb (unsigned long port, const void *src, unsigned long count);
 extern void outsw (unsigned long port, const void *src, unsigned long count);
 extern void outsl (unsigned long port, const void *src, unsigned long count);
 
+#define insb insb
+#define insw insw
+#define insl insl
+#define outsb outsb
+#define outsw outsw
+#define outsl outsl
+
 /*
  * The Alpha Jensen hardware for some rather strange reason puts
  * the RTC clock at 0x170 instead of 0x70. Probably due to some
@@ -586,22 +636,30 @@ extern void outsl (unsigned long port, const void *src, unsigned long count);
 #endif
 #define RTC_ALWAYS_BCD	0
 
-/*
- * Some mucking forons use if[n]def writeq to check if platform has it.
- * It's a bloody bad idea and we probably want ARCH_HAS_WRITEQ for them
- * to play with; for now just use cpp anti-recursion logics and make sure
- * that damn thing is defined and expands to itself.
- */
-
-#define writeq writeq
-#define readq readq
-
 /*
  * Convert a physical pointer to a virtual kernel pointer for /dev/mem
  * access
  */
 #define xlate_dev_mem_ptr(p)	__va(p)
 
+/*
+ * These get provided from <asm-generic/iomap.h> since alpha does not
+ * select GENERIC_IOMAP.
+ */
+#define ioread64 ioread64
+#define iowrite64 iowrite64
+#define ioread64be ioread64be
+#define iowrite64be iowrite64be
+#define ioread8_rep ioread8_rep
+#define ioread16_rep ioread16_rep
+#define ioread32_rep ioread32_rep
+#define iowrite8_rep iowrite8_rep
+#define iowrite16_rep iowrite16_rep
+#define iowrite32_rep iowrite32_rep
+#define pci_iounmap pci_iounmap
+
+#include <asm-generic/io.h>
+
 #endif /* __KERNEL__ */
 
 #endif /* __ALPHA_IO_H */
-- 
2.37.2


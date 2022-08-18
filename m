From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] alpha: Use generic <asm-generic/io.h>
Date: Thu, 18 Aug 2022 11:20:59 +0200
Message-ID: <20220818092059.103884-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=/zYJErApCC+NtYlUzpQqIqKi+vktCBbpfAwM285ZRpc=;
        b=AuBdBv0qvGl/QbCMREqseSdHJCm1iaOzaNuXnfqGhc8PSmH3hXUReB8CCihOkRhd1S
         LGxI6aB6YgigUBOm9VfZHQeGMjRDu5Nc/OrKzoRCXSuAHfj89Wj4cjrzv26/GwatK8MC
         vcSCylENZTLEUxP/xSVNCEBJWV72+PGRAmmH2XyHGCf+1V/6OWmNLKRjST9T52UPAUxD
         IAVA+svdStC/STsFWbuAtojzGHHWZkT9w+ucaE8PU/CDGqMMt93+fHpxzhL6dj96Ltvg
         8kftlKB1qG2DUvvbv0qh/bUn/V2ADo3cqYfpVarjp5YTKPYLWw71cpfOOcPmvsME1fQP
         J+/Q==
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

Alternative approaches:

- Implement proper readsq/writesq inline accessors for alpha
- Rewrite the whole world of io.h to use something like __weak
  instead of relying on defines
- Leave regmap MMIO broken on Alpha because none of its drivers
  use it
- Make regmap MMIO depend of !ARCH_ALPHA

The latter seems a bit over the top. First option to implement
readsq/writesq seems possible but I cannot test it (no hardware)
so using the generic fallbacks seems like a better idea, also in
general that will provide future defaults for accelerated defines.

Leaving regmap MMIO broken or disabling it for Alpha feels bad
because it breaks compiler coverage.

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
I'd like this applied to the alpha tree if there is such a
thing otherwise maybe Arnd can apply it to the arch generic
tree?
---
 arch/alpha/include/asm/io.h | 76 ++++++++++++++++++++++++++++++++-----
 1 file changed, 66 insertions(+), 10 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index d277189b2677..53f1312d394e 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -586,22 +586,78 @@ extern void outsl (unsigned long port, const void *src, unsigned long count);
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
+ * These defines are necessary to use the generic io.h for filling in
+ * the missing parts of the API contract. This is because the platform
+ * uses (inline) functions rather than defines and the generic helper
+ * fills in the undefined.
+ */
+#define virt_to_phys virt_to_phys
+#define phys_to_virt phys_to_virt
+#define memset_io memset_io
+#define memcpy_fromio memcpy_fromio
+#define memcpy_toio memcpy_toio
+#define __raw_readb __raw_readb
+#define __raw_readw __raw_readw
+#define __raw_readl __raw_readl
+#define __raw_readq __raw_readq
+#define __raw_writeb __raw_writeb
+#define __raw_writew __raw_writew
+#define __raw_writel __raw_writel
+#define __raw_writeq __raw_writeq
+#define readb readb
+#define readw readw
+#define readl readl
+#define readq readq
+#define writeb writeb
+#define writew writew
+#define writel writel
+#define writeq writeq
+#define readb_relaxed readb_relaxed
+#define readw_relaxed readw_relaxed
+#define readl_relaxed readl_relaxed
+#define readq_relaxed readq_relaxed
+/* Relaxed writes are already defines */
+#define ioport_map ioport_map
+#define ioport_unmap ioport_unmap
+#define inb inb
+#define inw inw
+#define inl inl
+#define outb outb
+#define outw outw
+#define outl outl
+#define insb insb
+#define insw insw
+#define insl insl
+#define outsb outsb
+#define outsw outsw
+#define outsl outsl
+#define ioread8 ioread8
+#define ioread16 ioread16
+#define ioread32 ioread32
+#define ioread64 ioread64
+#define iowrite8 iowrite8
+#define iowrite16 iowrite16
+#define iowrite32 iowrite32
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


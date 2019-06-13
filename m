From: Stephen Kitt <steve@sk2.org>
Subject: [PATCH] Drop unused isa_page_to_bus
Date: Thu, 13 Jun 2019 18:11:55 +0200
Message-ID: <20190613161155.16946-1-steve@sk2.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>

isa_page_to_bus is deprecated and no longer used anywhere, this patch
removes it entirely.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 arch/alpha/include/asm/io.h | 5 -----
 arch/arm/include/asm/io.h   | 1 -
 arch/mips/include/asm/io.h  | 2 --
 arch/x86/include/asm/io.h   | 1 -
 4 files changed, 9 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index ccf9d65166bb..af2c0063dc75 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -93,11 +93,6 @@ static inline void * phys_to_virt(unsigned long address)
 
 #define page_to_phys(page)	page_to_pa(page)
 
-static inline dma_addr_t __deprecated isa_page_to_bus(struct page *page)
-{
-	return page_to_phys(page);
-}
-
 /* Maximum PIO space address supported?  */
 #define IO_SPACE_LIMIT 0xffff
 
diff --git a/arch/arm/include/asm/io.h b/arch/arm/include/asm/io.h
index 7e22c81398c4..f96ec93679b7 100644
--- a/arch/arm/include/asm/io.h
+++ b/arch/arm/include/asm/io.h
@@ -33,7 +33,6 @@
  * ISA I/O bus memory addresses are 1:1 with the physical address.
  */
 #define isa_virt_to_bus virt_to_phys
-#define isa_page_to_bus page_to_phys
 #define isa_bus_to_virt phys_to_virt
 
 /*
diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 29997e42480e..1790274c27eb 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -149,8 +149,6 @@ static inline void *isa_bus_to_virt(unsigned long address)
 	return phys_to_virt(address);
 }
 
-#define isa_page_to_bus page_to_phys
-
 /*
  * However PCI ones are not necessarily 1:1 and therefore these interfaces
  * are forbidden in portable PCI drivers.
diff --git a/arch/x86/include/asm/io.h b/arch/x86/include/asm/io.h
index a06a9f8294ea..6bed97ff6db2 100644
--- a/arch/x86/include/asm/io.h
+++ b/arch/x86/include/asm/io.h
@@ -165,7 +165,6 @@ static inline unsigned int isa_virt_to_bus(volatile void *address)
 {
 	return (unsigned int)virt_to_phys(address);
 }
-#define isa_page_to_bus(page)	((unsigned int)page_to_phys(page))
 #define isa_bus_to_virt		phys_to_virt
 
 /*
-- 
2.11.0


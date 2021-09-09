From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] alpha: Declare virt_to_phys and virt_to_bus parameter as pointer to volatile
Date: Wed,  8 Sep 2021 22:00:33 -0700
Message-ID: <20210909050033.1564459-1-linux@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o8FqMxDgd8l7sId2kCNTKyMoE47Aco1YprUDt2DkIx8=;
        b=hlay4CXUq7sieBd59o93+7cIFWC5zal3YB2NYexwhQAUI6cSAFd0++lgc2qN01kNwR
         7vVa13kkaGNUXihmRAjmdZfmRvruBTcmFGbI/FUWX5cCN8GEBXUNDiLtdvvsZdQNDc1v
         DCE3/YhO7XjrZFy7K2ojujqVkY7yc4kYYgplQzNBbqgo4t5A4dEk1ffPEseO+O47uWkR
         bBIjputuQG2O/OczjEwNO5pnbWAEMa7IVPu+OzPn2QCtuM2iNBMzhXBO8dekF474JXiu
         5u7BslPoZVLaTowwt1Kmu+Axkdp7lxiq3on+pVZSxj693VPFb5mkQgrJQctoZ2e1MLqW
         jdgA==
Sender: Guenter Roeck <groeck7@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@kernel.org>

Some drivers pass a pointer to volatile data to virt_to_bus() and
virt_to_phys(). One exception is alpha. This results in a number
of compile errors such as

drivers/net/wan/lmc/lmc_main.c: In function 'lmc_softreset':
drivers/net/wan/lmc/lmc_main.c:1782:50: error:
	passing argument 1 of 'virt_to_bus' discards 'volatile'
	qualifier from pointer target type

drivers/atm/ambassador.c: In function 'do_loader_command':
drivers/atm/ambassador.c:1747:58: error:
	passing argument 1 of 'virt_to_bus' discards 'volatile'
	qualifier from pointer target type

Declare the parameter of virt_to_phys and virt_to_bus as pointer to volatile
to fix the problem.

Cc: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
We could instead try to modify the affected drivers, but both drivers
use the buffer to communicate with the chip, so that would require lots
of typecasts there. Another option would be to disable affected drivers
for alpha, but that seems undesirable.
Other ideas welcome.

 arch/alpha/include/asm/io.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index 0fab5ac90775..c9cb554fbe54 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -60,7 +60,7 @@ extern inline void set_hae(unsigned long new_hae)
  * Change virtual addresses to physical addresses and vv.
  */
 #ifdef USE_48_BIT_KSEG
-static inline unsigned long virt_to_phys(void *address)
+static inline unsigned long virt_to_phys(volatile void *address)
 {
 	return (unsigned long)address - IDENT_ADDR;
 }
@@ -70,7 +70,7 @@ static inline void * phys_to_virt(unsigned long address)
 	return (void *) (address + IDENT_ADDR);
 }
 #else
-static inline unsigned long virt_to_phys(void *address)
+static inline unsigned long virt_to_phys(volatile void *address)
 {
         unsigned long phys = (unsigned long)address;
 
@@ -106,7 +106,7 @@ static inline void * phys_to_virt(unsigned long address)
 extern unsigned long __direct_map_base;
 extern unsigned long __direct_map_size;
 
-static inline unsigned long __deprecated virt_to_bus(void *address)
+static inline unsigned long __deprecated virt_to_bus(volatile void *address)
 {
 	unsigned long phys = virt_to_phys(address);
 	unsigned long bus = phys + __direct_map_base;
-- 
2.33.0


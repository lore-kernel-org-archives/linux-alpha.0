From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 11/13] alpha: Declare virt_to_phys and virt_to_bus parameter as pointer to volatile
Date: Wed, 22 Sep 2021 23:39:57 -0400
Message-ID: <20210923033959.1421662-11-sashal@kernel.org>
References: <20210923033959.1421662-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632368423;
        bh=abM+FohBr2Y/WPAMMSacB16/MO1KNwqAuumtzzMql1Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SHz2/dP59WUvt05RbXjP3BnLtGBdY5PJofP87C9hhV6+/JLeZ3iszSUgakBvqS6yw
         VIgKchNFziKU10gMkO9mcqFoArqOuIMNj7A8ZjqRzMYTjEPxvgsdExt1k9m+zyLol6
         MhL01ODzU2+k2Imavfhhhd290XMZhCrydB52slH9BL5CR+CffXi1XbQila0vq0fITC
         0eZD92yvEYdWNTKjxjUxmje8ReLAGxoG1n73JJgkEqjyJxgyMZD2ZQOAO1Qt4TDanX
         0ioawXmWlsOHcWYd3Fhd+oArODi4AKQVtH13Cc9hJyEoNbTS5j5FPd9OW6/ozgV63q
         G0OJm2kNPUsoA==
In-Reply-To: <20210923033959.1421662-1-sashal@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, Sasha Levin <sashal@kernel.org>, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, akpm@linux-foundation.org, mhocko@suse.com, david@redhat.com, linux-alpha@vger.kernel.org

From: Guenter Roeck <linux@roeck-us.net>

[ Upstream commit 35a3f4ef0ab543daa1725b0c963eb8c05e3376f8 ]

Some drivers pass a pointer to volatile data to virt_to_bus() and
virt_to_phys(), and that works fine.  One exception is alpha.  This
results in a number of compile errors such as

  drivers/net/wan/lmc/lmc_main.c: In function 'lmc_softreset':
  drivers/net/wan/lmc/lmc_main.c:1782:50: error:
	passing argument 1 of 'virt_to_bus' discards 'volatile'
	qualifier from pointer target type

  drivers/atm/ambassador.c: In function 'do_loader_command':
  drivers/atm/ambassador.c:1747:58: error:
	passing argument 1 of 'virt_to_bus' discards 'volatile'
	qualifier from pointer target type

Declare the parameter of virt_to_phys and virt_to_bus as pointer to
volatile to fix the problem.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/alpha/include/asm/io.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index 9995bed6e92e..204c4fb69ee1 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -61,7 +61,7 @@ extern inline void set_hae(unsigned long new_hae)
  * Change virtual addresses to physical addresses and vv.
  */
 #ifdef USE_48_BIT_KSEG
-static inline unsigned long virt_to_phys(void *address)
+static inline unsigned long virt_to_phys(volatile void *address)
 {
 	return (unsigned long)address - IDENT_ADDR;
 }
@@ -71,7 +71,7 @@ static inline void * phys_to_virt(unsigned long address)
 	return (void *) (address + IDENT_ADDR);
 }
 #else
-static inline unsigned long virt_to_phys(void *address)
+static inline unsigned long virt_to_phys(volatile void *address)
 {
         unsigned long phys = (unsigned long)address;
 
@@ -112,7 +112,7 @@ static inline dma_addr_t __deprecated isa_page_to_bus(struct page *page)
 extern unsigned long __direct_map_base;
 extern unsigned long __direct_map_size;
 
-static inline unsigned long __deprecated virt_to_bus(void *address)
+static inline unsigned long __deprecated virt_to_bus(volatile void *address)
 {
 	unsigned long phys = virt_to_phys(address);
 	unsigned long bus = phys + __direct_map_base;
-- 
2.30.2


From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] alpha: io: Make sparse happy about bitwise types
Date: Thu, 18 Jun 2020 16:51:17 +0300
Message-ID: <20200618135117.14894-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, kernel test robot <lkp@intel.com>

On Alpha the IO accessors are using plain unsigned types, such as uXX.
But Alpha can be configured to any endianess and implementation of
BE IO accessors, such as iowrite32be(), require endianess conversion.
This conversion, when done via cpu_to*() and *_to_cpu() helpers, uses
bitwise types of which sparse is not happy.

8250_dwlib.c:45:17: sparse: sparse: incorrect type in argument 1 (different base types)
8250_dwlib.c:45:17: sparse:     expected unsigned int [usertype]
8250_dwlib.c:45:17: sparse:     got restricted __be32 [usertype]

One way is to use a lot of ifdeffery to properly use swab*() combination with
writel() or so, another is much simpler, i.e. forcing types, especially taking
into consideration the commit message of the original commit for that API.

Fixes: 25534eb77078 ("alpha: add io{read,write}{16,32}be functions")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/alpha/include/asm/io.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index a4d0c19f1e79..9529656c24bb 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -491,8 +491,8 @@ extern inline void writeq(u64 b, volatile void __iomem *addr)
 
 #define ioread16be(p) be16_to_cpu(ioread16(p))
 #define ioread32be(p) be32_to_cpu(ioread32(p))
-#define iowrite16be(v,p) iowrite16(cpu_to_be16(v), (p))
-#define iowrite32be(v,p) iowrite32(cpu_to_be32(v), (p))
+#define iowrite16be(v,p) iowrite16((__force u16)cpu_to_be16(v), (p))
+#define iowrite32be(v,p) iowrite32((__force u32)cpu_to_be32(v), (p))
 
 #define inb_p		inb
 #define inw_p		inw
-- 
2.27.0.rc2


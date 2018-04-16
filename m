From: Sinan Kaya <okaya@codeaurora.org>
Subject: [PATCH] alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering #2
Date: Mon, 16 Apr 2018 18:16:56 -0400
Message-ID: <1523917017-28084-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1523917023;
        bh=QBPD/8VyLsPq8gTO0OMGnDMhaNKKNBYLIZ9QLcCHCjA=;
        h=From:To:Cc:Subject:Date:From;
        b=HgpPul9Du4Co/rv6Y+9eV5dZw4u2XiIUa2P/BlH+Lw+IKk0gh3kzL2g/LGgWYPy4+
         ss5L80MztJI1254ZPIwI3BEFrhz0FNNtDsd90+P5WHsVIwbm8UJk0HAQEy0Dsj3Uxk
         fGBaoxt9M/C/rWhjkA/t2CMv2ISjQdnLIqJiwcSw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1523917022;
        bh=QBPD/8VyLsPq8gTO0OMGnDMhaNKKNBYLIZ9QLcCHCjA=;
        h=From:To:Cc:Subject:Date:From;
        b=Ukak19d3YonwBPfInb8ELjavhlnBMcy4xhYem4Jrkbe6rQZ18LBY98tpGAg7KHLBI
         iM1As7HJW+irDovC6eHhJVwct5y4xFlNJWpyWzW056K/FIJSuLqlx3nG6P8/G/JmOn
         qoC3GJxzuPLoVLzljFCGh9M6Z4Vt8yWnWkV/YK5I=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, arnd@arndb.de, timur@codeaurora.org, sulrich@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sinan Kaya <okaya@codeaurora.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Kate Stewart <kstewart@linuxfoundation.org>, linux-kernel@vger.kernel.org

memory-barriers.txt has been updated with the following requirement.

"When using writel(), a prior wmb() is not needed to guarantee that the
cache coherent memory writes have completed before writing to the MMIO
region."

Current writeX() and iowriteX() implementations on alpha are not
satisfying this requirement as the barrier is after the register write.

Move mb() in writeX() and iowriteX() functions to guarantee that HW
observes memory changes before performing register operations.

Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
Reported-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/alpha/kernel/io.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/alpha/kernel/io.c b/arch/alpha/kernel/io.c
index 3e3d49c..c025a3e 100644
--- a/arch/alpha/kernel/io.c
+++ b/arch/alpha/kernel/io.c
@@ -37,20 +37,20 @@ unsigned int ioread32(void __iomem *addr)
 
 void iowrite8(u8 b, void __iomem *addr)
 {
-	IO_CONCAT(__IO_PREFIX,iowrite8)(b, addr);
 	mb();
+	IO_CONCAT(__IO_PREFIX,iowrite8)(b, addr);
 }
 
 void iowrite16(u16 b, void __iomem *addr)
 {
-	IO_CONCAT(__IO_PREFIX,iowrite16)(b, addr);
 	mb();
+	IO_CONCAT(__IO_PREFIX,iowrite16)(b, addr);
 }
 
 void iowrite32(u32 b, void __iomem *addr)
 {
-	IO_CONCAT(__IO_PREFIX,iowrite32)(b, addr);
 	mb();
+	IO_CONCAT(__IO_PREFIX,iowrite32)(b, addr);
 }
 
 EXPORT_SYMBOL(ioread8);
@@ -176,26 +176,26 @@ u64 readq(const volatile void __iomem *addr)
 
 void writeb(u8 b, volatile void __iomem *addr)
 {
-	__raw_writeb(b, addr);
 	mb();
+	__raw_writeb(b, addr);
 }
 
 void writew(u16 b, volatile void __iomem *addr)
 {
-	__raw_writew(b, addr);
 	mb();
+	__raw_writew(b, addr);
 }
 
 void writel(u32 b, volatile void __iomem *addr)
 {
-	__raw_writel(b, addr);
 	mb();
+	__raw_writel(b, addr);
 }
 
 void writeq(u64 b, volatile void __iomem *addr)
 {
-	__raw_writeq(b, addr);
 	mb();
+	__raw_writeq(b, addr);
 }
 
 EXPORT_SYMBOL(readb);
-- 
2.7.4


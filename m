From: Sinan Kaya <okaya@codeaurora.org>
Subject: [PATCH] alpha: io: reorder barriers to guarantee writeX() and iowriteX() ordering
Date: Mon,  2 Apr 2018 13:48:00 -0400
Message-ID: <1522691281-21593-1-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1522691289;
        bh=KEbDxTqRnoli8BV6m7pSzTjmw92ch6lmjReUBG3d1hA=;
        h=From:To:Cc:Subject:Date:From;
        b=ONJGzm0UcBo5scebpwHms8j3WydpMSR1umW6mmyx5OGW/a+sNxmX7AQXYYMefXBE5
         d7bEl9rifxI4wmAMmGXF9ck4pkRX5Orq0ChTnEn/qEMoRE9/VY6GWulx9hlMBTQNaq
         nZPZ8Zzt9gQSOp5iyM5f/CR/DSC13/U1ZMcsBon0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1522691288;
        bh=KEbDxTqRnoli8BV6m7pSzTjmw92ch6lmjReUBG3d1hA=;
        h=From:To:Cc:Subject:Date:From;
        b=nVKbJih6GBFQbqd67q00ys0HLRA1a8S4hE9jJtBJh9yHN3erXBE29J//S2LNA/mK1
         pEuRzMoRnW4y6NV3mzn0I+J2XmuFEorC2SMFX0hlG27ixANY/OWV7TMOqx/qmMaFvi
         JWd4ymVdRGjBd+sprpXC0tD+4gnND3yqazFSvv3I=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, timur@codeaurora.org, sulrich@codeaurora.org
Cc: arnd@arndb.de, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sinan Kaya <okaya@codeaurora.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Kate Stewart <kstewart@linuxfoundation.org>, linux-kernel@vger.kernel.org

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
 arch/alpha/include/asm/io.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index d123ff9..4c533fc 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -341,14 +341,14 @@ extern inline unsigned int ioread16(void __iomem *addr)
 
 extern inline void iowrite8(u8 b, void __iomem *addr)
 {
-	IO_CONCAT(__IO_PREFIX,iowrite8)(b, addr);
 	mb();
+	IO_CONCAT(__IO_PREFIX, iowrite8)(b, addr);
 }
 
 extern inline void iowrite16(u16 b, void __iomem *addr)
 {
-	IO_CONCAT(__IO_PREFIX,iowrite16)(b, addr);
 	mb();
+	IO_CONCAT(__IO_PREFIX, iowrite16)(b, addr);
 }
 
 extern inline u8 inb(unsigned long port)
@@ -382,8 +382,8 @@ extern inline unsigned int ioread32(void __iomem *addr)
 
 extern inline void iowrite32(u32 b, void __iomem *addr)
 {
-	IO_CONCAT(__IO_PREFIX,iowrite32)(b, addr);
 	mb();
+	IO_CONCAT(__IO_PREFIX, iowrite32)(b, addr);
 }
 
 extern inline u32 inl(unsigned long port)
@@ -434,14 +434,14 @@ extern inline u16 readw(const volatile void __iomem *addr)
 
 extern inline void writeb(u8 b, volatile void __iomem *addr)
 {
-	__raw_writeb(b, addr);
 	mb();
+	__raw_writeb(b, addr);
 }
 
 extern inline void writew(u16 b, volatile void __iomem *addr)
 {
-	__raw_writew(b, addr);
 	mb();
+	__raw_writew(b, addr);
 }
 #endif
 
@@ -482,14 +482,14 @@ extern inline u64 readq(const volatile void __iomem *addr)
 
 extern inline void writel(u32 b, volatile void __iomem *addr)
 {
-	__raw_writel(b, addr);
 	mb();
+	__raw_writel(b, addr);
 }
 
 extern inline void writeq(u64 b, volatile void __iomem *addr)
 {
-	__raw_writeq(b, addr);
 	mb();
+	__raw_writeq(b, addr);
 }
 #endif
 
-- 
2.7.4


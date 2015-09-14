From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH 1/2] alpha: io: define ioremap_uc
Date: Mon, 14 Sep 2015 17:19:28 +0530
Message-ID: <1442231369-27118-2-git-send-email-sudipm.mukherjee@gmail.com>
References: <1442231369-27118-1-git-send-email-sudipm.mukherjee@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DOmZt+VUC5i5iCrSiozon0AiZxCGbxomi/9QxxS6s9E=;
        b=XbWLh0WByGj2m/5hdaRtMky9HXCU1T4hyR9Cfk8Lg0/2sbqkCtP/0MuwmB9yTSpzkm
         4VFniDRnxzztxrrrD7Y4wmgWlbZGMcUfStG8WzuKRn5wul7l7lMjbvritTGNpvHMDHk8
         J6yaXfAUA0QQ/MpwupMVrBCf2Fpy87Ghzc8vqsJHtjPN2d4XnZwQaJKIWUE2uxY4uPCy
         W3T/n1++9+g3BonCR7p491JcGWHCEF+J/FlBsQ3JOPesCBRGFbHOSZGRgQyKhwhR1WR1
         lxFDXOqCA3w8cLDqGWblB/Yog7+FHjh+sWDec7GhVFXouxEqzLW4HXz0puzO3kRvApug
         gPEA==
In-Reply-To: <1442231369-27118-1-git-send-email-sudipm.mukherjee@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>

ioremap_uc was not defined and as a result while building with
allmodconfig were getting build error of:
implicit declaration of function 'ioremap_uc'.

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---
 arch/alpha/include/asm/io.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index f05bdb4..ff40491 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -297,7 +297,9 @@ static inline void __iomem * ioremap_nocache(unsigned long offset,
 					     unsigned long size)
 {
 	return ioremap(offset, size);
-} 
+}
+
+#define ioremap_uc ioremap_nocache
 
 static inline void iounmap(volatile void __iomem *addr)
 {
-- 
1.9.1


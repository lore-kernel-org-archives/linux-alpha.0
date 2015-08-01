From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH -next] alpha: Define ioremap_uc and ioremap_wc
Date: Fri, 31 Jul 2015 19:32:39 -0700
Message-ID: <1438396359-27697-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=roeck-us.net; s=default;
	h=Message-Id:Date:Subject:Cc:To:From; bh=ZAe0FXiLfc86/T9hyN3sY2QrPyZYKL7vQ5jZi6AWxus=;
	b=SnqcRbe2RKk5CObI1AdpeAH0d2bEeIdbdJaKVIAjr+TVEUOfULN0EyvBqD9DCjBR/wHesyfqjPNHNQLhA732OZgUw85QZUXOz53rCXTKkr9oDI5wHb6PUWc0RLClplzPG3F83MmT7njUgPOwguYV1vI8zGXSRjGjDa4yS6ApOxk=;
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Paul Gortmaker <paul.gortmaker@windriver.com>, "Luis R. Rodriguez" <mcgrof@suse.com>

Commit 3cc2dac5be3f ("drivers/video/fbdev/atyfb: Replace MTRR UC hole
with strong UC") introduces calls to ioremap_wc and ioremap_uc. This
causes build failures with alpha:allmodconfig. Map the missing functions
to ioremap_nocache.

Fixes: 3cc2dac5be3f ("drivers/video/fbdev/atyfb:
        Replace MTRR UC hole with strong UC")
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Luis R. Rodriguez <mcgrof@suse.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/alpha/include/asm/io.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index f05bdb4b1cb9..7edfe6bf0ee6 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -299,6 +299,9 @@ static inline void __iomem * ioremap_nocache(unsigned long offset,
 	return ioremap(offset, size);
 } 
 
+#define ioremap_wc	ioremap_nocache
+#define ioremap_uc	ioremap_nocache
+
 static inline void iounmap(volatile void __iomem *addr)
 {
 	IO_CONCAT(__IO_PREFIX,iounmap)(addr);
-- 
2.1.4


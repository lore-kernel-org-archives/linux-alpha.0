From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH -next] alpha: lib: Export __delay
Date: Tue,  4 Aug 2015 23:57:32 -0700
Message-ID: <1438757852-24298-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=roeck-us.net; s=default;
	h=Message-Id:Date:Subject:Cc:To:From; bh=sqRdr4GwIVWvNBlUGCyDmnh1cPlKeRWsJmvN8hFAo1s=;
	b=XCr1sBJ5r4qqZgMcpwGqWbArEoC5lTtRKQPVW5u/QgD78nS6oO9Xl6J0fveW4oYHBD/5NT7DqzwRESI7yvVxBM8bqfoqLcWVtX4sl9urEBgAuTtzZsmzqxrII6I4jQlkLX8L7jrlBMKHbvDJUsmjY7TtA2g3En2LdXx0yAW1tSg=;
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Radha Mohan Chintakuntla <rchintakuntla@cavium.com>, David Daney <david.daney@cavium.com>

__delay is exported by most architectures, and may be used in modules.
Since it is not exported for alpha, alpha builds currently fail
to build in -next with

ERROR: "__delay" [drivers/net/phy/mdio-octeon.ko] undefined!

if the offending driver is configured.

Fixes: a6d678645210 ("net: mdio-octeon: Modify driver to work on both
	ThunderX and Octeon")
Cc: Radha Mohan Chintakuntla <rchintakuntla@cavium.com>
Cc: David Daney <david.daney@cavium.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/alpha/lib/udelay.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/lib/udelay.c b/arch/alpha/lib/udelay.c
index 69d52aa37bae..f2d81ff38aa6 100644
--- a/arch/alpha/lib/udelay.c
+++ b/arch/alpha/lib/udelay.c
@@ -30,6 +30,7 @@ __delay(int loops)
 		"	bgt %0,1b"
 		: "=&r" (tmp), "=r" (loops) : "1"(loops));
 }
+EXPORT_SYMBOL(__delay);
 
 #ifdef CONFIG_SMP
 #define LPJ	 cpu_data[smp_processor_id()].loops_per_jiffy
-- 
2.1.4


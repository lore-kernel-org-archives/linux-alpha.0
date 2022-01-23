From: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 13/54] arch/alpha: replace cpumask_weight with cpumask_empty where appropriate
Date: Sun, 23 Jan 2022 10:38:44 -0800
Message-ID: <20220123183925.1052919-14-yury.norov@gmail.com>
References: <20220123183925.1052919-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EaZo6YWz+PE4Amu8QukF1Cw8oSIakZDIQiKoGR/62wY=;
        b=V2jPEDWq3IwIGuJgkDE35gcjcxe2X2oRT+W5/8zZD364JRtYsD/NetC+jPipdlP248
         VCZINxrgU8tohaAr/uOO2w7qtXxaF4tnonr9b/tMDnGy8/JWEsbHewV6ABBhs9UVYadY
         ZRHqPkouoaRfLkfknvSgvJd3V0Cre7vIvYAmqjqhx7RQhsyXW3ho+RqXj9q9WBKZaFnw
         0zGgSRnEyOR8m11UhivzNB8lHiu2vzn+ZubLLiEtRJUlCjBZqg4O7WmF/YhdMkw1DmSN
         owVHE4zq1o6nHuVmcX62AylgLcK1BDygi77X2PO2ga9uCd6LKSXnMX8BIaj6I1/fkfLo
         NAtQ==
In-Reply-To: <20220123183925.1052919-1-yury.norov@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yury Norov <yury.norov@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, David Laight <David.Laight@aculab.com>, Joe Perches <joe@perches.com>, Dennis Zhou <dennis@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Nicholas Piggin <npiggin@gmail.com>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Alexey Klimov <aklimov@redhat.com>, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Geert Uytterhoeven <ge>

common_shutdown_1() calls cpumask_weight() to check if any bit of a
given cpumask is set. We can do it more efficiently with cpumask_empty()
because cpumask_empty() stops traversing the cpumask as soon as it finds
first set bit, while cpumask_weight() counts all bits unconditionally.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/alpha/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 5f8527081da9..0d4bc60828bf 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -125,7 +125,7 @@ common_shutdown_1(void *generic_ptr)
 	/* Wait for the secondaries to halt. */
 	set_cpu_present(boot_cpuid, false);
 	set_cpu_possible(boot_cpuid, false);
-	while (cpumask_weight(cpu_present_mask))
+	while (!cpumask_empty(cpu_present_mask))
 		barrier();
 #endif
 
-- 
2.30.2


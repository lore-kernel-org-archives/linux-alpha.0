From: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 14/49] arch/alpha: replace cpumask_weight with cpumask_empty where appropriate
Date: Thu, 10 Feb 2022 14:48:58 -0800
Message-ID: <20220210224933.379149-15-yury.norov@gmail.com>
References: <20220210224933.379149-1-yury.norov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dreoFKrn4wH6smW2GLCfxxjyjJhnljmILHzGoj0K5Es=;
        b=nLj6aJoGZkZ+ciKqW/DpUozk1sjRaY94bK8YuXc85MMjn3ka8sf0yQDAo55lM3nr9s
         1UIDIaeoEc4NFplxVMfgEZe4JIrvw8GFfSt1bRxcGbE0R7FyhYrq+5ERL2XmXd+8DMkk
         msBJbFAY1A+uHQjX7pxCUlcRExj2gbm5HbdzAQorQnEsygPb0hInpXn+NwVt3GhNOenQ
         J0K9n2OBOnFaqIu1bZ69zDwx9EEDX1LJK5djkopX8BKeW9OK8X83/KG1m+Y67AzZEzoo
         b5YViod/+8inu3M7Flygc6qvfuFZ1LVXz4M9bMQ7qyAMxhj5BHtXI5n7+YviS6OqDhuk
         u4FA==
In-Reply-To: <20220210224933.379149-1-yury.norov@gmail.com>
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
2.32.0


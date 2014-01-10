From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] alpha: don't use module_init for non-modular core code
Date: Fri, 10 Jan 2014 17:02:02 -0500
Message-ID: <1389391322-29873-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

The srm console is always built in.  It will never be modular,
so using module_init as an alias for __initcall is rather
misleading.

Fix this up now, so that we can relocate module_init from
init.h into module.h in the future.  If we don't do this, we'd
have to add module.h to obviously non-modular code, and that
would be a worse thing.

Direct use of __initcall is discouraged, vs prioritized ones.
Use of device_initcall is consistent with what __initcall
maps onto, and hence does not change the init order, making the
impact of this change zero.   Should someone with real hardware
for boot testing want to change it later to arch_initcall or
console_initcall, they can do that at a later date.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/arch/alpha/kernel/srmcons.c b/arch/alpha/kernel/srmcons.c
index 6f01d9ad7b81..72b59511e59a 100644
--- a/arch/alpha/kernel/srmcons.c
+++ b/arch/alpha/kernel/srmcons.c
@@ -237,8 +237,7 @@ srmcons_init(void)
 
 	return -ENODEV;
 }
-
-module_init(srmcons_init);
+device_initcall(srmcons_init);
 
 
 /*
-- 
1.8.5.2


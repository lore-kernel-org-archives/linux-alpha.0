From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH v4] alpha: Clean-up the panic notifier code
Date: Mon, 20 Feb 2023 18:22:45 -0300
Message-ID: <20230220212245.153554-1-gpiccoli@igalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=g922yg1g9NH71TSdfv2O7rorl313NaV/Mj9LoIZeB/s=; b=V9CoriCseTPWK+0DD2sbU2j6M0
        oxZkX5eeJlIazFmt7PaBXun4K3/wCoZPLM00CKslop5VFDuJZn7iVNTyKI9tAfdPgWK2R4vzxadyV
        FxbsDenxw76ZvxQDvN6NqhQqDShsEpC1yNnAqD8ZOdKcIEZrxU1Wzj2xjErzBAOd4jJkKikyY7/t+
        HGATqu1ePZEJGzaNiNizu3VGPKfowEKsrv62XumULwHIbiz3XjcYa0E/cbNTFbWPjVO69pxNGtAJ5
        7rAToGttlJUbK6u/V+h3UAj/mtTTZx5ealfEbGbVYzVsC/NWXsHJjDKDmQNf+ezD0dbT6DiQfTHi+
        tWF3uNY 
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Petr Mladek <pmladek@suse.com>

The alpha panic notifier has some code issues, not following
the conventions of other notifiers. Also, it might halt the
machine but still it is set to run as early as possible, which
doesn't seem to be a good idea.

So, let's clean the code and set the notifier to run as the
latest, following the same approach other architectures are
doing - also, remove the unnecessary include of a header already
included indirectly.

Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

---


V4:
- Rebased (and build-tested) against v6.2.

V3:
- No changes.

V2:
- Fixed rth email address;
- Added Petr's review tag - thanks!


 arch/alpha/kernel/setup.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 33bf3a627002..1eb67a67823f 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -41,19 +41,11 @@
 #include <linux/sysrq.h>
 #include <linux/reboot.h>
 #endif
-#include <linux/notifier.h>
 #include <asm/setup.h>
 #include <asm/io.h>
 #include <linux/log2.h>
 #include <linux/export.h>
 
-static int alpha_panic_event(struct notifier_block *, unsigned long, void *);
-static struct notifier_block alpha_panic_block = {
-	alpha_panic_event,
-        NULL,
-        INT_MAX /* try to do it first */
-};
-
 #include <linux/uaccess.h>
 #include <asm/hwrpb.h>
 #include <asm/dma.h>
@@ -435,6 +427,21 @@ static const struct sysrq_key_op srm_sysrq_reboot_op = {
 };
 #endif
 
+static int alpha_panic_event(struct notifier_block *this,
+			     unsigned long event, void *ptr)
+{
+	/* If we are using SRM and serial console, just hard halt here. */
+	if (alpha_using_srm && srmcons_output)
+		__halt();
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block alpha_panic_block = {
+	.notifier_call = alpha_panic_event,
+	.priority = INT_MIN, /* may not return, do it last */
+};
+
 void __init
 setup_arch(char **cmdline_p)
 {
@@ -1427,19 +1434,6 @@ const struct seq_operations cpuinfo_op = {
 	.show	= show_cpuinfo,
 };
 
-
-static int
-alpha_panic_event(struct notifier_block *this, unsigned long event, void *ptr)
-{
-#if 1
-	/* FIXME FIXME FIXME */
-	/* If we are using SRM and serial console, just hard halt here. */
-	if (alpha_using_srm && srmcons_output)
-		__halt();
-#endif
-        return NOTIFY_DONE;
-}
-
 static __init int add_pcspkr(void)
 {
 	struct platform_device *pd;
-- 
2.39.1


From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: [PATCH 01/11] tty/sysrq: alpha: export and use __sysrq_get_key_op()
Date: Wed, 13 May 2020 22:43:41 +0100
Message-ID: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jW05YIYcf1GNolkjiyr0mICfCVmFkBpfqxOEcp+jfSE=;
        b=B6ufszp741BrL+8jST20P2NOnKbKE/LNB0r5wtKJFYTRDlckV/y9gXmjPYv7DSytm5
         N3AMbtHVrYFTCSwCiaDlyXrW9z+p7l1w7/eCeTbBxTMtWGRX/SMolhOP8VQuYczT9DkW
         CHxeTsCHlwc5lCyzBPRZ+M31ujfjBfGSgHqx/27EQC1XXYkWNnbps5HfIjw+hKDNFXxN
         vWzEDj7eVxbdYYTapTC0qlRtAKivLG64U/FR6pXzZpuchoBxHQ3c4SiBUSL+C8ypStQB
         5zCBc5kn2VvrXWVcZpwx3hfjvSfAo0EhObsX7ynqyraCai9yJALEmKdL3D464SExMah7
         6OvQ==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dri-devel@lists.freedesktop.org
Cc: emil.l.velikov@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

Export a pointer to the sysrq_get_key_op(). This way we can cleanly
unregister it, instead of the current solutions of modifuing it inplace.

Since __sysrq_get_key_op() is no longer used externally, let's make it
a static function.

This patch will allow us to limit access to each and every sysrq op and
constify the sysrq handling.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: linux-kernel@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Please keep me in the CC list, as I'm not subscribed to the list.

IMHO it would be better if this gets merged this via the tty tree.
---
 arch/alpha/kernel/setup.c | 13 +++++++++++--
 drivers/tty/sysrq.c       |  4 +++-
 include/linux/sysrq.h     |  2 +-
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index f19aa577354b..dd7f770f23cf 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -430,6 +430,15 @@ register_cpus(void)
 
 arch_initcall(register_cpus);
 
+#ifdef CONFIG_MAGIC_SYSRQ
+static struct sysrq_key_op srm_sysrq_reboot_op = {
+	.handler	= machine_halt,
+	.help_msg       = "reboot(b)",
+	.action_msg     = "Resetting",
+	.enable_mask    = SYSRQ_ENABLE_BOOT,
+};
+#endif
+
 void __init
 setup_arch(char **cmdline_p)
 {
@@ -550,8 +559,8 @@ setup_arch(char **cmdline_p)
 	/* If we're using SRM, make sysrq-b halt back to the prom,
 	   not auto-reboot.  */
 	if (alpha_using_srm) {
-		struct sysrq_key_op *op = __sysrq_get_key_op('b');
-		op->handler = (void *) machine_halt;
+		unregister_sysrq_key('b', __sysrq_reboot_op);
+		register_sysrq_key('b', &srm_sysrq_reboot_op);
 	}
 #endif
 
diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index 0dc3878794fd..1741134cabca 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -172,6 +172,8 @@ static struct sysrq_key_op sysrq_reboot_op = {
 	.enable_mask	= SYSRQ_ENABLE_BOOT,
 };
 
+struct sysrq_key_op *__sysrq_reboot_op = &sysrq_reboot_op;
+
 static void sysrq_handle_sync(int key)
 {
 	emergency_sync();
@@ -516,7 +518,7 @@ static int sysrq_key_table_key2index(int key)
 /*
  * get and put functions for the table, exposed to modules.
  */
-struct sysrq_key_op *__sysrq_get_key_op(int key)
+static struct sysrq_key_op *__sysrq_get_key_op(int key)
 {
         struct sysrq_key_op *op_p = NULL;
         int i;
diff --git a/include/linux/sysrq.h b/include/linux/sysrq.h
index 8e159e16850f..9b51f98e5f60 100644
--- a/include/linux/sysrq.h
+++ b/include/linux/sysrq.h
@@ -47,7 +47,7 @@ void handle_sysrq(int key);
 void __handle_sysrq(int key, bool check_mask);
 int register_sysrq_key(int key, struct sysrq_key_op *op);
 int unregister_sysrq_key(int key, struct sysrq_key_op *op);
-struct sysrq_key_op *__sysrq_get_key_op(int key);
+extern struct sysrq_key_op *__sysrq_reboot_op;
 
 int sysrq_toggle_support(int enable_mask);
 int sysrq_mask(void);
-- 
2.25.1


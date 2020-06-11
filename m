From: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH] alpha: Fix build around srm_sysrq_reboot_op
Date: Thu, 11 Jun 2020 11:11:39 +0200
Message-ID: <20200611091139.8525-1-joro@8bytes.org>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Linus Torvalds <torvalds@linux-foundation.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Joerg Roedel <jroedel@suse.de>, Emil Velikov <emil.l.velikov@gmail.com>, Guenter Roeck <linux@roeck-us.net>

From: Joerg Roedel <jroedel@suse.de>

The patch introducing the struct was probably never compile tested,
because it sets a handler with a wrong function signature. Wrap the
handler into a functions with the correct signature to fix the build.

Fixes: 0f1c9688a194 ("tty/sysrq: alpha: export and use __sysrq_get_key_op()")
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 arch/alpha/kernel/setup.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index f5c42a8fcf9c..53520f8cb904 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -430,8 +430,13 @@ register_cpus(void)
 arch_initcall(register_cpus);
 
 #ifdef CONFIG_MAGIC_SYSRQ
+static void sysrq_reboot_handler(int unused)
+{
+	machine_halt();
+}
+
 static const struct sysrq_key_op srm_sysrq_reboot_op = {
-	.handler	= machine_halt,
+	.handler	= sysrq_reboot_handler,
 	.help_msg       = "reboot(b)",
 	.action_msg     = "Resetting",
 	.enable_mask    = SYSRQ_ENABLE_BOOT,
-- 
2.26.2


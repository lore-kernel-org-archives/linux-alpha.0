From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH 11/30] um: Improve panic notifiers consistency and ordering
Date: Wed, 27 Apr 2022 19:49:05 -0300
Message-ID: <20220427224924.592546-12-gpiccoli@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2J2jSLnXNvBvmpciKblg4G4i+SPcETpMAPTLs4SmilU=; b=Y7G5SOutjd2Wok
	eOyM/esuui0QZBr4gkTsLhnmqEEeGbd+In77GKbksgAOxrIO7HbCsUZQcDTTdZllOUFDnZn+1J+ou
	BV4nO8+6Q2WdpR/fDD0kV+shVHAMTh2Hr5a/Sr4Vda4sgh79vEInyaVcoPs++DPhRbdlIy8EGH71i
	Y2kc3AsdR/n5Ku9jee0sNns+9iA5tXbPhVT8Q872TmkRHblpR76EoYTd+hcRTjpSZXLkWKDqXE01W
	x+L6Id7cK69VkV7rRWNMBklkKlskGt8OqOAzMN0hqdR7F+e/HQf5Zjq+VKzpCgfk/8Rw3rtuImpJa
	pnU1ljiyK6r4BOMk1SSQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bCeC+folLkdyk3b6apumHxcRwMBwOys8pMRPpqSclew=; b=TqPRVvgSfmMVR610uLcwg2vC34
 pLIumny6UC9NAVKrJeC8kjbMxl/tivBCI9wjj++xXokR3qbvfCHXTOfrOaZezN2wYfsTeWwS7JgiC
 ST58COWgOj0NVLj/RM40gpf1tYeZ+3Akn0o3OOB9wnVZqXRK498bYXNcV51purgIjJ73eodK18ucj
 +Iyv87VDCsJruNsaOWJAaGmlYU1Av1XSojv9QPvuFZsys/hw7VJ6aN2N3d0SlURJabJe1PgCqptXF
 Xo2aIypAELGn+aiNCAnoOIj6PgcxN1C5aslHAtr3OG/wMakbb0/ORKtlMkkFaGzr7X86jahmQbl4p
 VjCzjD3g==;
In-Reply-To: <20220427224924.592546-1-gpiccoli@igalia.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-um/>
List-Post: <mailto:linux-um@lists.infradead.org>
List-Help: <mailto:linux-um-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=subscribe>
Sender: "linux-um" <linux-um-bounces@lists.infradead.org>
Errors-To: linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org
To: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, gpiccoli@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.

Currently the panic notifiers from user mode linux don't follow
the convention for most of the other notifiers present in the
kernel (indentation, priority setting, numeric return).
More important, the priorities could be improved, since it's a
special case (userspace), hence we could run the notifiers earlier;
user mode linux shouldn't care much with other panic notifiers but
the ordering among the mconsole and arch notifier is important,
given that the arch one effectively triggers a core dump.

This patch fixes that by running the mconsole notifier as the first
panic notifier, followed by the architecture one (that coredumps).
Also, we remove a useless header inclusion.

Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Richard Weinberger <richard@nod.at>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 arch/um/drivers/mconsole_kern.c | 8 +++-----
 arch/um/kernel/um_arch.c        | 8 ++++----
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/um/drivers/mconsole_kern.c b/arch/um/drivers/mconsole_kern.c
index 8ca67a692683..2ea0421bcc3f 100644
--- a/arch/um/drivers/mconsole_kern.c
+++ b/arch/um/drivers/mconsole_kern.c
@@ -11,7 +11,6 @@
 #include <linux/list.h>
 #include <linux/mm.h>
 #include <linux/module.h>
-#include <linux/notifier.h>
 #include <linux/panic_notifier.h>
 #include <linux/reboot.h>
 #include <linux/sched/debug.h>
@@ -846,13 +845,12 @@ static int notify_panic(struct notifier_block *self, unsigned long unused1,
 
 	mconsole_notify(notify_socket, MCONSOLE_PANIC, message,
 			strlen(message) + 1);
-	return 0;
+	return NOTIFY_DONE;
 }
 
 static struct notifier_block panic_exit_notifier = {
-	.notifier_call 		= notify_panic,
-	.next 			= NULL,
-	.priority 		= 1
+	.notifier_call	= notify_panic,
+	.priority	= INT_MAX, /* run as soon as possible */
 };
 
 static int add_notifier(void)
diff --git a/arch/um/kernel/um_arch.c b/arch/um/kernel/um_arch.c
index 0760e24f2eba..4485b1a7c8e4 100644
--- a/arch/um/kernel/um_arch.c
+++ b/arch/um/kernel/um_arch.c
@@ -246,13 +246,13 @@ static int panic_exit(struct notifier_block *self, unsigned long unused1,
 	bust_spinlocks(0);
 	uml_exitcode = 1;
 	os_dump_core();
-	return 0;
+
+	return NOTIFY_DONE;
 }
 
 static struct notifier_block panic_exit_notifier = {
-	.notifier_call 		= panic_exit,
-	.next 			= NULL,
-	.priority 		= 0
+	.notifier_call	= panic_exit,
+	.priority	= INT_MAX - 1, /* run as 2nd notifier, won't return */
 };
 
 void uml_finishsetup(void)
-- 
2.36.0

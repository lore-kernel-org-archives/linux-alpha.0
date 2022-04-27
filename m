From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH 15/30] bus: brcmstb_gisb: Clean-up panic/die notifiers
Date: Wed, 27 Apr 2022 19:49:09 -0300
Message-ID: <20220427224924.592546-16-gpiccoli@igalia.com>
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
	List-Owner; bh=AJtaRy0boUiQ5Z+aDEAOREZ/POSzJesGBF1/DsyHL9M=; b=NIACGEJOCqd52/
	BgM1y7gK7gi/8iA5F+f21NnMSpx7EYvpJoJgjQajuHbuJ1nk+HckrSe7UPF4TXXu1rhntkCTs9tlf
	gJsQlauX31PAsAOJMkWi+Mjz2nOOKUZwlugfzDmg8ubNCDf4WCw3UkCjwy2AEZDx1ud8j0fWomgI5
	zky4AwZMu+H0i8Tw+ukPHIBdzkE5bsHKVsESmI6JNFZX7Ncv9LEs2V1Q0PEPfmTRGDpSyi7GFlgqu
	RDTqnECV1Z2vHqlS4JO4R6nYL03p2UTLS/bA6X9DhqdZCd9Ao7F0oifpAl9ZTxhaC5u4Pr8ewj6E6
	SMzrAQ0eswKo32wuKAww==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LH6oQ+KUrT2+UZ27jtgU/PGKhQQ202wn79cJAeqj5IE=; b=N1tY0S0aaQeR9NcKuaJbTqnNXy
 9pcqa1SEZnYDO5/TLstJB48aWkEQ4PDoBYIETAyDlKfJL300Z2BuvN4dT08YXOJQkKQRfd88YbBla
 BhKcNiLHKco0hFkhYWPs6DIH4v+5YaEldHsDLnnpsbsgJuChEIxNDXB5/EzphACOoX7xqZH0abztl
 vLKxKzrcWguRmMXDmvcU5nsznWqZJ1nSmpm/gOBpgQqBxhdFVL/WA1XIODSmEAnbcKKqL8Xui+5p0
 wYd62C0elRAkgaFmQPZ2Uk5W3nR2kjl80X0bqLIyvZBOzCHJbiVCOEqqyvgKj3yUn8TPr60YsbPp0
 Lml85pLA==;
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

This patch improves the panic/die notifiers in this driver by
making use of a passed "id" instead of comparing pointer
address; also, it removes an useless prototype declaration
and unnecessary header inclusion.

This is part of a panic notifiers refactor - this notifier in
the future will be moved to a new list, that encompass the
information notifiers only.

Fixes: 9eb60880d9a9 ("bus: brcmstb_gisb: add notifier handling")
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 drivers/bus/brcmstb_gisb.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/bus/brcmstb_gisb.c b/drivers/bus/brcmstb_gisb.c
index 183d5cc37d42..1ea7b015e225 100644
--- a/drivers/bus/brcmstb_gisb.c
+++ b/drivers/bus/brcmstb_gisb.c
@@ -19,7 +19,6 @@
 #include <linux/pm.h>
 #include <linux/kernel.h>
 #include <linux/kdebug.h>
-#include <linux/notifier.h>
 
 #ifdef CONFIG_MIPS
 #include <asm/traps.h>
@@ -347,25 +346,14 @@ static irqreturn_t brcmstb_gisb_bp_handler(int irq, void *dev_id)
 /*
  * Dump out gisb errors on die or panic.
  */
-static int dump_gisb_error(struct notifier_block *self, unsigned long v,
-			   void *p);
-
-static struct notifier_block gisb_die_notifier = {
-	.notifier_call = dump_gisb_error,
-};
-
-static struct notifier_block gisb_panic_notifier = {
-	.notifier_call = dump_gisb_error,
-};
-
 static int dump_gisb_error(struct notifier_block *self, unsigned long v,
 			   void *p)
 {
 	struct brcmstb_gisb_arb_device *gdev;
-	const char *reason = "panic";
+	const char *reason = "die";
 
-	if (self == &gisb_die_notifier)
-		reason = "die";
+	if (v == PANIC_NOTIFIER)
+		reason = "panic";
 
 	/* iterate over each GISB arb registered handlers */
 	list_for_each_entry(gdev, &brcmstb_gisb_arb_device_list, next)
@@ -374,6 +362,14 @@ static int dump_gisb_error(struct notifier_block *self, unsigned long v,
 	return NOTIFY_DONE;
 }
 
+static struct notifier_block gisb_die_notifier = {
+	.notifier_call = dump_gisb_error,
+};
+
+static struct notifier_block gisb_panic_notifier = {
+	.notifier_call = dump_gisb_error,
+};
+
 static DEVICE_ATTR(gisb_arb_timeout, S_IWUSR | S_IRUGO,
 		gisb_arb_get_timeout, gisb_arb_set_timeout);
 
-- 
2.36.0

From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH 07/30] mips: ip22: Reword PANICED to PANICKED and remove
 useless header
Date: Wed, 27 Apr 2022 19:49:01 -0300
Message-ID: <20220427224924.592546-8-gpiccoli@igalia.com>
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
	List-Owner; bh=/VtyQemnkMb5LF85ihAfszxNFfOojAxZ0FskJ79OHWc=; b=RSLoP9HZhh76hT
	yK2dJZhm0uDDYD4pyYCrVHiU4OVAmz+ToX38crmNXoSeyNy270236wbtbkk1sT8rSKUYbtwo+Un5N
	3WLr3bs2rZmnZohNj59fl6Y1Zt/euvmzXjtH58iHRl9ksZMCxk1HhbV5IzK7p0ao5fie6YXzx3iJz
	DzG41D2LP8lj2Ezd/mY8x4X+TzzB/9cHH582YAH6AVkYXHhAuJb4oBwSyjTHQ3JZoJcy53wohut+a
	bCqKO2xGlA8nmyOsjLVN5nDfh2i3kh2yA5gpSL5JezoYL9fyLcPjq5fAJta/eOyzfXFfnbC1ssb1+
	bFnnItAtsaCtYOqhuKCw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sBnzQEgOETevrWvoFDe4UXYaoyJvnokumNTnFd8nYd4=; b=C3WoMDzHemUiz3TJonrj4OLB2r
 FSxQF+F2lHHptNuVBTghKMJZClefE6Imxei6ehl090Dy2iIiwWYXrKfz8k6+wORL9DMg3LEbLg3HV
 Yy5IDocQKz78CwwV1x1BjunLLiApngptGwnQE+MM0c5kIHbxgr5QD1BtqzYPoELgJZUScA99Ow0T5
 DgoMAXPJxcpvr2MM73b5S2P6pfeIYXcyYWBlbiqaBO38Mb9qP/Auq8X4+iMlX3NAoRdIHY9DVHKc8
 OvjiTLZuxC2PHt1XEzIKelV5l8TbSCfHnuQVB2KdJOLt6lDAQzFhqrTn+CsXTsATCFcE2SPeUMfAC
 eC7wzCXg==;
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

Many other place in the kernel prefer the latter, so let's keep
it consistent in MIPS code as well. Also, removes a useless header.

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 arch/mips/sgi-ip22/ip22-reset.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/mips/sgi-ip22/ip22-reset.c b/arch/mips/sgi-ip22/ip22-reset.c
index 9028dbbb45dd..8f0861c58080 100644
--- a/arch/mips/sgi-ip22/ip22-reset.c
+++ b/arch/mips/sgi-ip22/ip22-reset.c
@@ -11,7 +11,6 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/sched/signal.h>
-#include <linux/notifier.h>
 #include <linux/panic_notifier.h>
 #include <linux/pm.h>
 #include <linux/timer.h>
@@ -41,7 +40,7 @@
 static struct timer_list power_timer, blink_timer, debounce_timer;
 static unsigned long blink_timer_timeout;
 
-#define MACHINE_PANICED		1
+#define MACHINE_PANICKED		1
 #define MACHINE_SHUTTING_DOWN	2
 
 static int machine_state;
@@ -112,7 +111,7 @@ static void debounce(struct timer_list *unused)
 		return;
 	}
 
-	if (machine_state & MACHINE_PANICED)
+	if (machine_state & MACHINE_PANICKED)
 		sgimc->cpuctrl0 |= SGIMC_CCTRL0_SYSINIT;
 
 	enable_irq(SGI_PANEL_IRQ);
@@ -120,7 +119,7 @@ static void debounce(struct timer_list *unused)
 
 static inline void power_button(void)
 {
-	if (machine_state & MACHINE_PANICED)
+	if (machine_state & MACHINE_PANICKED)
 		return;
 
 	if ((machine_state & MACHINE_SHUTTING_DOWN) ||
@@ -167,9 +166,9 @@ static irqreturn_t panel_int(int irq, void *dev_id)
 static int panic_event(struct notifier_block *this, unsigned long event,
 		      void *ptr)
 {
-	if (machine_state & MACHINE_PANICED)
+	if (machine_state & MACHINE_PANICKED)
 		return NOTIFY_DONE;
-	machine_state |= MACHINE_PANICED;
+	machine_state |= MACHINE_PANICKED;
 
 	blink_timer_timeout = PANIC_FREQ;
 	blink_timeout(&blink_timer);
-- 
2.36.0

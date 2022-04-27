From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH 05/30] misc/pvpanic: Convert regular spinlock into trylock on
 panic path
Date: Wed, 27 Apr 2022 19:48:59 -0300
Message-ID: <20220427224924.592546-6-gpiccoli@igalia.com>
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
	List-Owner; bh=bjmQBon4ZPf54pX5Of0jL1twDGChrxI7tbY8kSwcQmQ=; b=KPbYGPRmNMOeJr
	441MpiDemJuEgTyVZGDGluRgV3l1ger26QHB9a++DV+BFQOAz6LhSxGUmtBvl2SoyjlV9Un4VY3EZ
	zzgGKhNv3XEOlU8DBwo5iIkUXwiKw2Xh7rJbDnOZM6oxXC9+G9a7yxZQyOhkc3kYQx+8LMJacTCsi
	3O4wKp6WHtVpmkB/PkIEwnmGgKqSLEvjaYU3JDuLGpYRuiqAKU3kC9h8mQJrJfTI5PB19OMqeuKHn
	LE200hvY13gAVh/i+pdCSO7NP8M/ODhAuQ067rNl4Q6CgOq9O4//O7BVsUJ8E3KEqo5rAyzjJIld1
	q0qyiJYZYVD/+vum3DDg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/X9VGFpkqSi0Xw+sb2fnqT5ti0fEX/+xmh5q7q7MhDY=; b=p3QOIFADQeeHCVp8bxPKwO62s+
 EGcZOVKN2qbhBt1Pf/EZXw+tkBx2x9DRVMO1uTp94JqIADubO77jiICP/E04L/nn99FEYBzZb+44L
 /kz24xVDrX4FFqomkvxzWUTFlHhE4ZhZCfkHWBQr0/Lzkqr3CE/w4r7fAtX83L8f0pEarK5Qx6XYH
 4zbdyCjIZQkKS6mh2t53k79tPqORut15Ek94GDPyIzx6i+d57M9a0UcH7EVEXkkbVPk2r+5s4ram2
 N0+1/N2WpK9qFZ8QFj+vJFSqHIZNJD4YgbbIqqLYxl+DJIQthPO2tybUvOHdIFVD8Tw3e7+DHlkve
 LuLH0yww==;
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

The pvpanic driver relies on panic notifiers to execute a callback
on panic event. Such function is executed in atomic context - the
panic function disables local IRQs, preemption and all other CPUs
that aren't running the panic code.

With that said, it's dangerous to use regular spinlocks in such path,
as introduced by commit b3c0f8774668 ("misc/pvpanic: probe multiple instances").
This patch fixes that by replacing regular spinlocks with the trylock
safer approach.

It also fixes an old comment (about a long gone framebuffer code) and
the notifier priority - we should execute hypervisor notifiers early,
deferring this way the panic action to the hypervisor, as expected by
the users that are setting up pvpanic.

Fixes: b3c0f8774668 ("misc/pvpanic: probe multiple instances")
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Mihai Carabas <mihai.carabas@oracle.com>
Cc: Shile Zhang <shile.zhang@linux.alibaba.com>
Cc: Wang ShaoBo <bobo.shaobowang@huawei.com>
Cc: zhenwei pi <pizhenwei@bytedance.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 drivers/misc/pvpanic/pvpanic.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/pvpanic/pvpanic.c b/drivers/misc/pvpanic/pvpanic.c
index 4b8f1c7d726d..049a12006348 100644
--- a/drivers/misc/pvpanic/pvpanic.c
+++ b/drivers/misc/pvpanic/pvpanic.c
@@ -34,7 +34,9 @@ pvpanic_send_event(unsigned int event)
 {
 	struct pvpanic_instance *pi_cur;
 
-	spin_lock(&pvpanic_lock);
+	if (!spin_trylock(&pvpanic_lock))
+		return;
+
 	list_for_each_entry(pi_cur, &pvpanic_list, list) {
 		if (event & pi_cur->capability & pi_cur->events)
 			iowrite8(event, pi_cur->base);
@@ -55,9 +57,13 @@ pvpanic_panic_notify(struct notifier_block *nb, unsigned long code, void *unused
 	return NOTIFY_DONE;
 }
 
+/*
+ * Call our notifier very early on panic, deferring the
+ * action taken to the hypervisor.
+ */
 static struct notifier_block pvpanic_panic_nb = {
 	.notifier_call = pvpanic_panic_notify,
-	.priority = 1, /* let this called before broken drm_fb_helper() */
+	.priority = INT_MAX,
 };
 
 static void pvpanic_remove(void *param)
-- 
2.36.0

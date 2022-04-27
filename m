From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH 09/30] coresight: cpu-debug: Replace mutex with mutex_trylock
 on panic notifier
Date: Wed, 27 Apr 2022 19:49:03 -0300
Message-ID: <20220427224924.592546-10-gpiccoli@igalia.com>
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
	List-Owner; bh=R1Quj6rrnBB8G76Zh2OImd+/2izMbhCspCy0GgEFtQk=; b=icn6b7Gm4PRyMO
	c3rfv+X/Ompk4huY72XsfJHvKZPioGPjOfHmkpPH06Vx5FKV8AaMZW+/1JqUlDNmcH8w+eB/PRz8R
	IeW7G8hPd856anH1/Xbt1WOcOvCDSoQf3hxC/0o3PvcZxqt+qXzm1O8G98cIchsjF1ZBjLCYEM6yl
	RmkXjBJaSOzF/va7iYteRD4DRjrLZ7O4vDNeyNSCKkMuez2JuPuNwA0ffMMXm6ZpluI2AuwA15uwv
	xn3nDVgmMKF78JSQbLQcwduD6aa7TmmXJNJ0AwGa3GFQUSEMrjDbLV/MIsAOFG6U9NYqgqQvL99fN
	wyuhirVJPtSCo747+NGg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=seVlMlqj/OOgqWCw1tUxCfRyMjTeYr5Z28M++b51Xf4=; b=ZaOL9ZgN+EGmQho6+KGFZHTRbn
 OaOWIMR4M4pabKtnueiNn0ccKPcDo3HPhyU+dXv5cnfPUStBzfPFVl+jQM59vF4ZhACUpuR43IYXQ
 ZxDFWoPV6MSwPwBTAmhnCK48+3Rd3s3YxmPfJVkzBknJImEbRwxzoUg95gTvTUorv8vMDdjprmUy3
 YkS66FLAwKwDNOu8o7q4f4XVv/vUJe4PGzk68gQ9Mx3uMtXXVmK27/P4rcS4LEEam3214m5o7ahcQ
 5LKqcAxUSITnoTva0XbxnJK2lHjf45/V+xGb9BJP25J23hUhWNHPX2AXkANv1NANWHSZgkACdPcYF
 QXixtySQ==;
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

The panic notifier infrastructure executes registered callbacks when
a panic event happens - such callbacks are executed in atomic context,
with interrupts and preemption disabled in the running CPU and all other
CPUs disabled. That said, mutexes in such context are not a good idea.

This patch replaces a regular mutex with a mutex_trylock safer approach;
given the nature of the mutex used in the driver, it should be pretty
uncommon being unable to acquire such mutex in the panic path, hence
no functional change should be observed (and if it is, that would be
likely a deadlock with the regular mutex).

Fixes: 2227b7c74634 ("coresight: add support for CPU debug module")
Cc: Leo Yan <leo.yan@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 drivers/hwtracing/coresight/coresight-cpu-debug.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 8845ec4b4402..1874df7c6a73 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -380,9 +380,10 @@ static int debug_notifier_call(struct notifier_block *self,
 	int cpu;
 	struct debug_drvdata *drvdata;
 
-	mutex_lock(&debug_lock);
+	/* Bail out if we can't acquire the mutex or the functionality is off */
+	if (!mutex_trylock(&debug_lock))
+		return NOTIFY_DONE;
 
-	/* Bail out if the functionality is disabled */
 	if (!debug_enable)
 		goto skip_dump;
 
@@ -401,7 +402,7 @@ static int debug_notifier_call(struct notifier_block *self,
 
 skip_dump:
 	mutex_unlock(&debug_lock);
-	return 0;
+	return NOTIFY_DONE;
 }
 
 static struct notifier_block debug_notifier = {
-- 
2.36.0

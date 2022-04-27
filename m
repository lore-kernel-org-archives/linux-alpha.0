From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH 03/30] notifier: Add panic notifiers info and purge trailing
 whitespaces
Date: Wed, 27 Apr 2022 19:48:57 -0300
Message-ID: <20220427224924.592546-4-gpiccoli@igalia.com>
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
	List-Owner; bh=sr2NJ+OJS89/48jmMEMfB65h+zaxNKU7SQr3h8RMvEk=; b=O/3Sy//FlBAcaU
	Uhj5nxAe/QxIWCC2TGbq5jgc/lsQFbhnI7/V+LmMLnw8Zf5htUFdc9Yz22OzWaoNEli6hFiOoTtLK
	AAx9bRrdDniUIy/6RTIsSZ7w8mCn+nczh3xDsi/li6D0kCiAAphacBbAmYnJxLYnDBbm0F7dCu0Oc
	MtyhPzon43EMw29daoSyuHJf+PRMr5SKgu03Egfj1nA5HD2mTZQuFXuTjFr39/Ur2rg9CQCZv9NnD
	CUBGaQEvWOloksJp16GcUIFLogmR8/nHFQbozu5k1eQbMcS865xbizoLcBXPYPI4KJYlxSACIzPgL
	FoAMTmEEPmq/l/7wklBA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jw69MD++mJtoVz+5OF/yDyT7SM6GG1QVsO5qZnTbfPY=; b=R4BaLs+44BYJptao8GvC8ttDH3
 QBY0eMxhKSzWFCpxMbR+Fbp293MCB3zvPYgTPMf/b3OkQdSjP24E3L8e4Mxpy4tg+aM7LX40+eANn
 E9NmhqtSLVcTKfq6OAtiABfZVuEeL7pK/Jggwsb0Z66SwiIPgUgdk8N8FAOWtcyDE4pUFXnvlOs4u
 KY15nvIzaU7LDhXzbLelthG04bdK8jQeGFwa+aWfBFuZkkmcHkGvkm9AzL5O497raBTZiIXIwFkMO
 bBhCSNyrOC33WN5GrpTyqWn82roSYAhC1Njfns6EapEQdXDs5qCmdq3kXZk6bj6zjDvwVdiy1jwJ3
 PjTlDVgw==;
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

Although many notifiers are mentioned in the comments, the panic
notifiers infrastructure is not. Also, the file contains some
trailing whitespaces. This commit fix both issues.

Cc: Arjan van de Ven <arjan@linux.intel.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Xiaoming Ni <nixiaoming@huawei.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 include/linux/notifier.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index 87069b8459af..0589896fc7bd 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -201,12 +201,12 @@ static inline int notifier_to_errno(int ret)
 
 /*
  *	Declared notifiers so far. I can imagine quite a few more chains
- *	over time (eg laptop power reset chains, reboot chain (to clean 
+ *	over time (eg laptop power reset chains, reboot chain (to clean
  *	device units up), device [un]mount chain, module load/unload chain,
- *	low memory chain, screenblank chain (for plug in modular screenblankers) 
+ *	low memory chain, screenblank chain (for plug in modular screenblankers)
  *	VC switch chains (for loadable kernel svgalib VC switch helpers) etc...
  */
- 
+
 /* CPU notfiers are defined in include/linux/cpu.h. */
 
 /* netdevice notifiers are defined in include/linux/netdevice.h */
@@ -217,6 +217,8 @@ static inline int notifier_to_errno(int ret)
 
 /* Virtual Terminal events are defined in include/linux/vt.h. */
 
+/* Panic notifiers are defined in include/linux/panic_notifier.h. */
+
 #define NETLINK_URELEASE	0x0001	/* Unicast netlink socket released */
 
 /* Console keyboard events.
-- 
2.36.0

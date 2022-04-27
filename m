From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH 30/30] um: Avoid duplicate call to kmsg_dump()
Date: Wed, 27 Apr 2022 19:49:24 -0300
Message-ID: <20220427224924.592546-31-gpiccoli@igalia.com>
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
	List-Owner; bh=deI3Uzmjp2hGCYGNObAzYu3W9ufyciXlDrjKEJbPXS0=; b=A1VuV6aopLo6xh
	a/vAvyBgbRteia2Vrcies6cSwNuwe9Pr3bxc8h7ZfXyHHUC/DCMw8W5NER86nO7k8Fjb/Lo5IlwKc
	lBVYyzpQRckmepSw8hsf37sjBNa+xR2ZYeisrBmbqcsYo47vId4YyQqNVp+hpVMH0UO8cKJYF67/W
	qbGEvZGRoCsagECgPLv+LDPlwWfiBQjtA5BCQct4l7mX0Ld1D6kgVGi5hI9o/WUFWuPhMuYI4bwfI
	Yz15ZjLlm9j21JAw7YsKma7FqYhYYeN5HaSZPs6KE3/nvX9CS/x2daU1cJEMBUXrXCZOejn0fqR98
	PR3cMkGx48tPp5kX7JBA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hhYlsUbOeU+dOwRnxPZPUYbOytvtm3s9TOl//oHNJDA=; b=d0jf6vbMLbNOzh0eGG9B6/Px+6
 qkEUtrYepm4ucy/4pLos0iQRqgjXbtzxxFn26kSmjojOKmseLi3xGvVq3y13qqT30NTY0kTvl6DKc
 b6KKl04amU0+oieZ13497T1EMR69awT+qjyjGwR4D5aTKq4vZpRUj+GzWZO2UZDfeYATrEMziknBs
 TEMzSmzx206U+K28hnKwrx3+IjpI8ZztfEqS39tmb441zpVb+KuDwyZTgdwShziC74jYqn49bnQHG
 y/bSqJ0agKp8q0sRXPRW98dnPCHObluazUbKWH8Sqc1S7wQ8dewAG//hvPY5MrIv8zVHDor3/GUxI
 SaUMFP1g==;
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

Currently the panic notifier panic_exit() calls kmsg_dump() and
some console flushing routines - this makes sense since such
panic notifier exits UserMode Linux and never returns.

Happens that after a panic refactor, kmsg_dump() is now always
called *before* the pre_reboot list of panic notifiers, in which
panic_exit() belongs, leading to a double call situation.

This patch changes that by removing such call from the panic
notifier, but leaving the console flushing calls since the
pre_reboot list still runs before console flushing on panic().

Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Richard Weinberger <richard@nod.at>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 arch/um/kernel/um_arch.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/um/kernel/um_arch.c b/arch/um/kernel/um_arch.c
index fc6e443299da..651310e3e86f 100644
--- a/arch/um/kernel/um_arch.c
+++ b/arch/um/kernel/um_arch.c
@@ -241,7 +241,6 @@ static void __init uml_postsetup(void)
 static int panic_exit(struct notifier_block *self, unsigned long unused1,
 		      void *unused2)
 {
-	kmsg_dump(KMSG_DUMP_PANIC);
 	bust_spinlocks(1);
 	bust_spinlocks(0);
 	uml_exitcode = 1;
-- 
2.36.0

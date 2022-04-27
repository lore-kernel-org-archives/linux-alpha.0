From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH 28/30] panic: Unexport crash_kexec_post_notifiers
Date: Wed, 27 Apr 2022 19:49:22 -0300
Message-ID: <20220427224924.592546-29-gpiccoli@igalia.com>
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
	List-Owner; bh=JMa5LCnSsLEAVBhfuFDpAGoxifAznYLcyHmVA8FwnYw=; b=U19MfWTnnOn7hp
	4c8aq0r3FSslos1hJAD2/mtCSWFS9A+QPcG5utAfd020hZBzOR+et+O5xNMozYTEoJ9+pk6RBRqtr
	AFB1Gm7LzljDFFsuGSvxtiWRHza0a3poj2CCFyeYMqtTb8iZjRJm5ujqf+L56jfd/oZu+IwSkYufr
	sJjX/J7MyK5ZBTm0QCy1Dw835aBY2eokMQXHu4LtRZq56tAEzJLWVocg5jAFlV1vpvQ110HyaYSL4
	+58QWG/qU/SQqXIi88qc5aYz6slGGcxkWHk46p6ZIGh2FW278YQ3LqT/PpSz3nvz74eZIlK/Lbzg6
	UOYJ3lolzyNUDmqO0XOg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jupyQNOg8qT8hQfxmdiNJNMjaTUz/u9LiRmSHTNez6Y=; b=p7drin3mWpI9T0ZfMOO6eJj4J8
 Szpgonvq7i/v524yc5jBLpbigKUiUN0wy7/WDOnlytx03+FGgGN1Adqusl4cOO6PJlw+seakKl4N4
 fX95EDE8pbxBc/NNWRr732wIqJtKKX/BphsJRWnwXH/62I6x/BTA0R4L8cWEa/lku3Ma0ky8B2K89
 MQrzxBf2Hm8tnWC5d0fBkJ7uMzqRE/yfr9AAId6oRoN4APimw2mDpSMEi6ZVrVuwLoacCVsSTBNQz
 KQprHSNi9G6RdCXwUMjprlLz6QcEgqvhkAE50juvJF1BOQucBso5epBizOEqf+g5ZQam3KuAFn9x9
 BasVHnnQ==;
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

There is no users anymore of this variable that requires
it to be "exported" in the headers; also, it was deprecated
by the kernel parameter "panic_notifiers_level".

Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 include/linux/panic.h          | 2 --
 include/linux/panic_notifier.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/include/linux/panic.h b/include/linux/panic.h
index 34175d0188d0..d301db07a8af 100644
--- a/include/linux/panic.h
+++ b/include/linux/panic.h
@@ -34,8 +34,6 @@ extern int sysctl_panic_on_rcu_stall;
 extern int sysctl_max_rcu_stall_to_panic;
 extern int sysctl_panic_on_stackoverflow;
 
-extern bool crash_kexec_post_notifiers;
-
 /*
  * panic_cpu is used for synchronizing panic() and crash_kexec() execution. It
  * holds a CPU number which is executing panic() currently. A value of
diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
index b5041132321d..8fda7045e2f7 100644
--- a/include/linux/panic_notifier.h
+++ b/include/linux/panic_notifier.h
@@ -11,7 +11,6 @@ extern struct atomic_notifier_head panic_pre_reboot_list;
 extern struct atomic_notifier_head panic_post_reboot_list;
 
 bool panic_notifiers_before_kdump(void);
-extern bool crash_kexec_post_notifiers;
 
 enum panic_notifier_val {
 	PANIC_UNUSED,
-- 
2.36.0

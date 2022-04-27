From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH 26/30] Drivers: hv: Do not force all panic notifiers to
 execute before kdump
Date: Wed, 27 Apr 2022 19:49:20 -0300
Message-ID: <20220427224924.592546-27-gpiccoli@igalia.com>
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
	List-Owner; bh=gb+jRxRXcjeYHPrILhMSgeWInBejvUmS4FsiIa4PHt0=; b=dk29PZIgt8Z/AR
	tQWMinP/FIdjOTo/D14omYhfIIh3F1ABgP8gYD7z0m7xv9gFcgx6RlITcTAUw6ePY+HKdAm3NDjnD
	n7t/pvWhX2Tg+d3FbfOmU5jN2l6RC7mpAud7OfFSX4RSf8Y6iKOMNg6eeFhm+795+MfJM7oUoRhHB
	tOLoRXz1Uu8BxABEsAhdJ7kfornPH2GTCyOoRcuusvX17bh6ZYi2IwJK9i3aWzlvMeBkfuM897dfV
	TJqaa3DLQQQuRgAdIXem6sklR24x4Qe9mtyul1mmRnSXX34nmJf/bfrkzYupve/+QJF4b5+Tld/vG
	lB5Xd9YVNh4o0mWGhZQw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vlo9T2/mvIa7VmsgTZAplfpKcY639xSpi9Lsc7QD2sA=; b=ZiYAT8sJyiBNaHzrk2673FL4+8
 1oiyWalKP6LGmKEc9hZJWoXC6cS5nMMrcCw5Iicmmfaanay2XW+Ea9CLz93XJRZPptEPdWhd8bk0b
 rKw9muPDbsgcmhx+6dtX/C/iDyONNGYxGodf7FR5gZ6gaCx9CBSOMyg/WgkwloH6LwMYOPDHwMc9i
 DlZzPF1Rmfq/gUUioCECpXAnYQMmNjWP7xmmSjqLdHZxdMlvMlgrtO3h+d5FTnJJbisLeLao1OJx/
 z7mwY9pmIo/3ja9SO2+rtPXIxKaESObUyZjm7eg6MS41mJJ7ZAlwRmPdpw93iK7tmvwyFHIvecdrE
 ZFlVRrJg==;
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

Since commit a11589563e96 ("x86/Hyper-V: Report crash register
data or kmsg before running crash kernel") Hyper-V forcibly sets
the kernel parameter "crash_kexec_post_notifiers"; with that, it
did enforce the execution of *all* panic notifiers before kdump.
The main reason behind that is that Hyper-V has an hypervisor
notification mechanism that has the ability of warning the
hypervisor when the guest panics.

Happens that after the panic notifiers refactor, we now have 3 lists
and a level mechanism that defines the ordering of the notifiers
execution with regards to kdump. And for Hyper-V, the specific
notifier to inform the hypervisor about a panic lies in the first
list, which *by default* is set to execute before kdump. Hence,
this patch removes the hardcoded setting, effectively reverting
the aforementioned commit.

One of the problems with the forced approach was greatly exposed by
commit d57d6fe5bf34 ("drivers: hv: log when enabling crash_kexec_post_notifiers")
which ended-up confusing the user that didn't expect the notifiers
to execute before kdump, since it's a user setting and wasn't
enabled by such user. With the patch hereby proposed, that kind
of issue doesn't happen anymore, the panic notifiers level is
well-documented and users can expect a predictable behavior.

Fixes: a11589563e96 ("x86/Hyper-V: Report crash register data or kmsg before running crash kernel")
Fixes: d57d6fe5bf34 ("drivers: hv: log when enabling crash_kexec_post_notifiers"
Cc: Andrea Parri (Microsoft) <parri.andrea@gmail.com>
Cc: Dexuan Cui <decui@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Michael Kelley <mikelley@microsoft.com>
Cc: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: Tianyu Lan <Tianyu.Lan@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Tested-by: Fabio A M Martins <fabiomirmar@gmail.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---

Special thanks to Michael Kelley for the good information about the Hyper-V
panic path in email threads some months ago, and to Fabio for the testing
performed.

 drivers/hv/hv_common.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index ae68298c0dca..af59793de523 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -73,18 +73,6 @@ int __init hv_common_init(void)
 {
 	int i;
 
-	/*
-	 * Hyper-V expects to get crash register data or kmsg when
-	 * crash enlightment is available and system crashes. Set
-	 * crash_kexec_post_notifiers to be true to make sure that
-	 * calling crash enlightment interface before running kdump
-	 * kernel.
-	 */
-	if (ms_hyperv.misc_features & HV_FEATURE_GUEST_CRASH_MSR_AVAILABLE) {
-		crash_kexec_post_notifiers = true;
-		pr_info("Hyper-V: enabling crash_kexec_post_notifiers\n");
-	}
-
 	/*
 	 * Allocate the per-CPU state for the hypercall input arg.
 	 * If this allocation fails, we will not be able to setup
-- 
2.36.0

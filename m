From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH 27/30] powerpc: Do not force all panic notifiers to execute
 before kdump
Date: Wed, 27 Apr 2022 19:49:21 -0300
Message-ID: <20220427224924.592546-28-gpiccoli@igalia.com>
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
	List-Owner; bh=anFDFlu0bsCOXNr2IgAtKg5GaPR/PV6lDnUPtLXtsK8=; b=ZtJFqSfOY1cqQi
	weIGml9EsEcjU9WbB/kVX5PlkjB3Z0NX2ydCyTMSL0WAjvCs3cB7zi8d1uk5R1/XrYmFjQk08w4PG
	jjIsBxx79fMWCIUv5wIExNmg9DVjd07AP2nZqh9CAzqJlFXkMm6d/tNzJsCzM0epVlRufAHEoEWCI
	ASLwle7SHQmSkvrZcplS4/i8uMhJKn1WTImBZL61lyoiicWslSF0OlyAQ+jxivPnJ2fkPvqZSZwpd
	d4ZpvBLdqNJ0L2GdMIJ6pBuQ1Q0jBGtJT8235X5TNCtS1VJ8RjYxs9P1VSryx5l3stQQ48Ww8lElP
	x/J5MYKgZPFJclVlCofQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C9iT/xJ8gF8J/f7SmqQO2c8pu+KvBPlFfkqGdYboS2I=; b=PMFgjQG40D4y0EE10+nqxAPHVI
 yNLZ1EZJdP0IH30iYafdBfM788VaINOAVfe8Gnevld0DclzQJRd8t+br/vJapdawGOEWHQTLdmHei
 1IQvYGZ//MLpN+QQDVtOXWSfDQyyspNE1J3gOgOC4NUam3dGx8JeBgJ9jpYRHFoaP71Y3fG1ERN+7
 JvwIb059Xf3lNBTrEP8JiyuPOh5ugwSvNao5NfaR+bMPV8BospKPkEU02jshVAtp1UBbOdjrRb2r2
 ze90RIwfaZigyOQntmQCmXs163wt4gsMUWHmf1nSoidLeEjFKj9WA7H531Eyz4iqvzof4LvLiIP9u
 dq8Lxg9g==;
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

Commit 06e629c25daa ("powerpc/fadump: Fix inaccurate CPU state info in
vmcore generated with panic") introduced a hardcoded setting of kernel
parameter "crash_kexec_post_notifiers", effectively forcing all the
panic notifiers to execute earlier in the panic path, before kdump.

The reason for that was a fadump issue on collecting data accurately,
due to smp_send_stop() setting all CPUs offline, so the net effect
desired with this change was to avoid calling the regular CPU
shutdown function, and instead rely on crash_smp_send_stop(), which
copes fine with fadump. The collateral effect was to increase the
risk for kdump if fadump is not used, since it forces all panic
notifiers to execute early, before kdump.

Happens that, after a panic refactor, crash_smp_send_stop() is
now used by default in the panic path, so there is no reason to
mess with the notifiers ordering (which was also improved in the
refactor) from within arch code.

Fixes: 06e629c25daa ("powerpc/fadump: Fix inaccurate CPU state info in vmcore generated with panic")
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---

We'd like to thanks specially the MiniCloud infrastructure [0] maintainers,
that allow us to test PowerPC code in a very complete, functional and FREE
environment.

[0] https://openpower.ic.unicamp.br/minicloud

 arch/powerpc/kernel/fadump.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 65562c4a0a69..35ae8c09af66 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1649,14 +1649,6 @@ int __init setup_fadump(void)
 		register_fadump();
 	}
 
-	/*
-	 * In case of panic, fadump is triggered via ppc_panic_event()
-	 * panic notifier. Setting crash_kexec_post_notifiers to 'true'
-	 * lets panic() function take crash friendly path before panic
-	 * notifiers are invoked.
-	 */
-	crash_kexec_post_notifiers = true;
-
 	return 1;
 }
 /*
-- 
2.36.0

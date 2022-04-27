From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH 02/30] ARM: kexec: Disable IRQs/FIQs also on crash CPUs
 shutdown path
Date: Wed, 27 Apr 2022 19:48:56 -0300
Message-ID: <20220427224924.592546-3-gpiccoli@igalia.com>
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
	List-Owner; bh=3tSzLhxiCWvOXEBMYw5I07iytwEMkPfa6BAn8QO2Qvw=; b=s4B+SK+TdfUJ/x
	EFKYkA4yKJZIlZzFuSUreQIlpvHIDfbYylbYSLf0zidsXuhkcOnGApx2fdwnsIO+JIO/iYxXf4tCW
	0hWoK4q8jlaJz46cgvzeavRHCzeYx0odW5kRGIGOHhADVFs7USp6j7L80P9wV/T+/gkhsP21s9JEi
	Is9E0QRDZ2IYumfD5kOYZp7a/bbjfLaUAv0NaExZj1jEIS5BJX6dlvTt5MeesE2b7+Cmu+aXqRpyu
	WPVFGpniv1qLtlAoOhYcGk2v8z/03oznzyte3LljpTIAApOj9IUoLbtDYIpXwfLDEb60GuEAxS8vZ
	cNcjyVW12H//aYXgXdwA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9bJIN4/MOEhLx8CsVfKAquGTzb1mVDbHr+j6ymCNHAs=; b=S+EoVVMbG0R6l0pBfRnMsKZosp
 2PXBHwhmghS5Lvs4v4GQMUSqpGyoQ5U6Zbnyj6sMhUP4BCGILxO7PkeMyVqV/H8eeh+l7ihT1MYQn
 6lRWijWvq/MbBgY8W5xo5rf6VIJ8bQ3A6HUNn+RlRorsijlroe/vsascbDWK+dCTLeTv/edmbXzZt
 IkkQl7Ezob0EK5zEWLgIk+XPPHoVSiw2Ov7kaRBDa36NQrRgmO2O3HFxvBLZEYb5QzmHEcsWLMOdr
 YdjDzKF3as62X+/HBzxjW/bJqz3Ux15HOHGOCZtJDgeQcPUWNNi8PdpLZsxk0QJWHs39xjqIBwc58
 XGSV7jaw==;
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

Currently the regular CPU shutdown path for ARM disables IRQs/FIQs
in the secondary CPUs - smp_send_stop() calls ipi_cpu_stop(), which
is responsible for that. This makes sense, since we're turning off
such CPUs, putting them in an endless busy-wait loop.

Problem is that there is an alternative path for disabling CPUs,
in the form of function crash_smp_send_stop(), used for kexec/panic
paths. This functions relies in a SMP call that also triggers a
busy-wait loop [at machine_crash_nonpanic_core()], but *without*
disabling interrupts. This might lead to odd scenarios, like early
interrupts in the boot of kexec'd kernel or even interrupts in
other CPUs while the main one still works in the panic path and
assumes all secondary CPUs are (really!) off.

This patch mimics the ipi_cpu_stop() interrupt disable mechanism
in the crash CPU shutdown path, hence disabling IRQs/FIQs in all
secondary CPUs in the kexec/panic path as well.

Cc: Marc Zyngier <maz@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 arch/arm/kernel/machine_kexec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/kernel/machine_kexec.c b/arch/arm/kernel/machine_kexec.c
index f567032a09c0..ef788ee00519 100644
--- a/arch/arm/kernel/machine_kexec.c
+++ b/arch/arm/kernel/machine_kexec.c
@@ -86,6 +86,9 @@ void machine_crash_nonpanic_core(void *unused)
 	set_cpu_online(smp_processor_id(), false);
 	atomic_dec(&waiting_for_crash_ipi);
 
+	local_fiq_disable();
+	local_irq_disable();
+
 	while (1) {
 		cpu_relax();
 		wfe();
-- 
2.36.0

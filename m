From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH 01/30] x86/crash,
 reboot: Avoid re-disabling VMX in all CPUs on crash/restart
Date: Wed, 27 Apr 2022 19:48:55 -0300
Message-ID: <20220427224924.592546-2-gpiccoli@igalia.com>
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
	List-Owner; bh=To17xy3w4Wi1B7277ANJ+nVLHcMKoh9caJ8KRkL8EiI=; b=cU5KGq521qOEU9
	6sJlwxdqMP6/miJGzkpEeopdLU2HAfyTvvQVJaSmgAybKeXDY4St8pOuKCM2ZNSn2KRQzf4JIziD1
	mnaJiMZvimUMZ6roy/SiJRA6ese1zBslOTgWN1Jx1AUc1jDinNRHCoYNK6/LDVrs67zzotGyjfDmo
	kTXbgSMCEQWuQwwNee1I/qZ7LBucjUn1vB9gWuCJdmlaDhYocaHKrH84xCyhVT7f4WqZjiNA909Oc
	3ddYyVpvj6dBEbY+swwWxcv+8aaQVRytYlo2uRM0vTSrBuGnaY2VUatiq5WSjKEIJtfH9A/U5Spim
	VC7PyxnlpMmgiqkOBAXw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r/T7YOY0VHwWAfHSEqxJa3Wt3qfvSExYRCUKLKE/qpM=; b=XhhicIlaxPAENQgGkNSZu/8JWa
 MoKMtLET2WEey/cUMjdoOeeZp/qIHF9AnIAQ1U9UG9ceTx5YsNvbqlEug3W8sTqjMADP3kqZkWGXE
 81ePHhsZB9/Fl6O5VwXVIzqdUd2GxbFqpTJI3oISOjep5UHhEIJ1gEAyfbzeKWGz11qqm1H8SqNmy
 PIXViapEJaVN3g1qVA0ll8xOHoXY2Fth5HpQAgahG3Orvdyx32C20SUgZY0+6ymNqW2eIcskQ9hv0
 PnRYqaVu+GNdXU/wxDKHHXg22u4+P2b/VN7O5/RK6RnCNvbziWOBIpkgY1JIKXd1EMfFHtVMCWu3y
 LPmztM1w==;
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

In the panic path we have a list of functions to be called, the panic
notifiers - such callbacks perform various actions in the machine's
last breath, and sometimes users want them to run before kdump. We
have the parameter "crash_kexec_post_notifiers" for that. When such
parameter is used, the function "crash_smp_send_stop()" is executed
to poweroff all secondary CPUs through the NMI-shootdown mechanism;
part of this process involves disabling virtualization features in
all CPUs (except the main one).

Now, in the emergency restart procedure we have also a way of
disabling VMX in all CPUs, using the same NMI-shootdown mechanism;
what happens though is that in case we already NMI-disabled all CPUs,
the emergency restart fails due to a second addition of the same items
in the NMI list, as per the following log output:

sysrq: Trigger a crash
Kernel panic - not syncing: sysrq triggered crash
[...]
Rebooting in 2 seconds..
list_add double add: new=<addr1>, prev=<addr2>, next=<addr1>.
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:29!
invalid opcode: 0000 [#1] PREEMPT SMP PTI

In order to reproduce the problem, users just need to set the kernel
parameter "crash_kexec_post_notifiers" *without* kdump set in any
system with the VMX feature present.

Since there is no benefit in re-disabling VMX in all CPUs in case
it was already done, this patch prevents that by guarding the restart
routine against doubly issuing NMIs unnecessarily. Notice we still
need to disable VMX locally in the emergency restart.

Fixes: ed72736183c4 ("x86/reboot: Force all cpus to exit VMX root if VMX is supported)
Fixes: 0ee59413c967 ("x86/panic: replace smp_send_stop() with kdump friendly version in panic path")
Cc: David P. Reed <dpreed@deepplum.com>
Cc: Hidehiro Kawai <hidehiro.kawai.ez@hitachi.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 arch/x86/include/asm/cpu.h |  1 +
 arch/x86/kernel/crash.c    |  8 ++++----
 arch/x86/kernel/reboot.c   | 14 ++++++++++++--
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/cpu.h b/arch/x86/include/asm/cpu.h
index 86e5e4e26fcb..b6a9062d387f 100644
--- a/arch/x86/include/asm/cpu.h
+++ b/arch/x86/include/asm/cpu.h
@@ -36,6 +36,7 @@ extern int _debug_hotplug_cpu(int cpu, int action);
 #endif
 #endif
 
+extern bool crash_cpus_stopped;
 int mwait_usable(const struct cpuinfo_x86 *);
 
 unsigned int x86_family(unsigned int sig);
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index e8326a8d1c5d..71dd1a990e8d 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -42,6 +42,8 @@
 #include <asm/crash.h>
 #include <asm/cmdline.h>
 
+bool crash_cpus_stopped;
+
 /* Used while preparing memory map entries for second kernel */
 struct crash_memmap_data {
 	struct boot_params *params;
@@ -108,9 +110,7 @@ void kdump_nmi_shootdown_cpus(void)
 /* Override the weak function in kernel/panic.c */
 void crash_smp_send_stop(void)
 {
-	static int cpus_stopped;
-
-	if (cpus_stopped)
+	if (crash_cpus_stopped)
 		return;
 
 	if (smp_ops.crash_stop_other_cpus)
@@ -118,7 +118,7 @@ void crash_smp_send_stop(void)
 	else
 		smp_send_stop();
 
-	cpus_stopped = 1;
+	crash_cpus_stopped = true;
 }
 
 #else
diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index fa700b46588e..2fc42b8402ac 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -589,8 +589,18 @@ static void native_machine_emergency_restart(void)
 	int orig_reboot_type = reboot_type;
 	unsigned short mode;
 
-	if (reboot_emergency)
-		emergency_vmx_disable_all();
+	/*
+	 * We can reach this point in the end of panic path, having
+	 * NMI-disabled all secondary CPUs. This process involves
+	 * disabling the CPU virtualization technologies, so if that
+	 * is the case, we only miss disabling the local CPU VMX...
+	 */
+	if (reboot_emergency) {
+		if (!crash_cpus_stopped)
+			emergency_vmx_disable_all();
+		else
+			cpu_emergency_vmxoff();
+	}
 
 	tboot_shutdown(TB_SHUTDOWN_REBOOT);
 
-- 
2.36.0

From: gushengxian <gushengxian507419@gmail.com>
Subject: [PATCH] arch: alpha: fix spelling mistakes
Date: Fri,  2 Jul 2021 05:48:12 -0700
Message-ID: <20210702124812.639641-1-gushengxian507419@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ua7jcnq1KkRupY4R+8sEqCnGnigSamk+j60c3bJxSG8=;
        b=E0tqI1l3hyH7P5shwM0sDw4GzP0uS/Koipa36gnxRCE/K1lDizFWS6kMmGddqwM7Pe
         FKtl3I5daTD0KMoc6xmiFSau9925ZRNn8u4UhW+ChOEhyt0dH4jxIewjbm7A8volT4Cu
         45Fy99lI9rD8qiJ2OjlHY+LkgNE+ddGUFIXBJBTYJTL4bgLa0u5nz6c5hhPJ1wD0hU+m
         IAyPf8FYCtHXQ3h3ZKQu8AAclCOEDksIG4jXsJVx/9ZGDmqL2sfj776Uy6uAYhbE+Ctn
         FOiFPYbO97soiykqR8sVW79gNOD/jOEeRN0vvmxu90q2BL4N8xP4S/88ty5tQ2A/PSaG
         +azw==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, peterz@infradead.org, mingo@redhat.com, acme@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, gushengxian <gushengxian@yulong.com>

From: gushengxian <gushengxian@yulong.com>

Fix some spelling mistakes in comments:
delarations ==> declarations
softare ==> software
suffiently ==> sufficiently
requred ==> required
unaliged ==> unaligned

Signed-off-by: gushengxian <gushengxian@yulong.com>
---
 arch/alpha/boot/misc.c           | 2 +-
 arch/alpha/kernel/osf_sys.c      | 4 ++--
 arch/alpha/kernel/perf_event.c   | 2 +-
 arch/alpha/kernel/sys_nautilus.c | 2 +-
 arch/alpha/kernel/traps.c        | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/boot/misc.c b/arch/alpha/boot/misc.c
index d65192202703..325d4dd4f904 100644
--- a/arch/alpha/boot/misc.c
+++ b/arch/alpha/boot/misc.c
@@ -30,7 +30,7 @@ extern long srm_printk(const char *, ...)
      __attribute__ ((format (printf, 1, 2)));
 
 /*
- * gzip delarations
+ * gzip declarations
  */
 #define OF(args)  args
 #define STATIC static
diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index d5367a1c6300..d31167e3269c 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -834,7 +834,7 @@ SYSCALL_DEFINE5(osf_setsysinfo, unsigned long, op, void __user *, buffer,
 			return -EFAULT;
 		state = &current_thread_info()->ieee_state;
 
-		/* Update softare trap enable bits.  */
+		/* Update software trap enable bits.  */
 		*state = (*state & ~IEEE_SW_MASK) | (swcr & IEEE_SW_MASK);
 
 		/* Update the real fpcr.  */
@@ -854,7 +854,7 @@ SYSCALL_DEFINE5(osf_setsysinfo, unsigned long, op, void __user *, buffer,
 		state = &current_thread_info()->ieee_state;
 		exc &= IEEE_STATUS_MASK;
 
-		/* Update softare trap enable bits.  */
+		/* Update software trap enable bits.  */
  		swcr = (*state & IEEE_SW_MASK) | exc;
 		*state |= exc;
 
diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index e7a59d927d78..efcf7321701b 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -574,7 +574,7 @@ static void alpha_pmu_start(struct perf_event *event, int flags)
  * Check that CPU performance counters are supported.
  * - currently support EV67 and later CPUs.
  * - actually some later revisions of the EV6 have the same PMC model as the
- *     EV67 but we don't do suffiently deep CPU detection to detect them.
+ *     EV67 but we don't do sufficiently deep CPU detection to detect them.
  *     Bad luck to the very few people who might have one, I guess.
  */
 static int supported_cpu(void)
diff --git a/arch/alpha/kernel/sys_nautilus.c b/arch/alpha/kernel/sys_nautilus.c
index 53adf43dcd44..96fd6ff3fe81 100644
--- a/arch/alpha/kernel/sys_nautilus.c
+++ b/arch/alpha/kernel/sys_nautilus.c
@@ -212,7 +212,7 @@ nautilus_init_pci(void)
 
 	/* Use default IO. */
 	pci_add_resource(&bridge->windows, &ioport_resource);
-	/* Irongate PCI memory aperture, calculate requred size before
+	/* Irongate PCI memory aperture, calculate required size before
 	   setting it up. */
 	pci_add_resource(&bridge->windows, &irongate_mem);
 
diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
index 921d4b6e4d95..5398f982bdd1 100644
--- a/arch/alpha/kernel/traps.c
+++ b/arch/alpha/kernel/traps.c
@@ -730,7 +730,7 @@ do_entUnaUser(void __user * va, unsigned long opcode,
 	long error;
 
 	/* Check the UAC bits to decide what the user wants us to do
-	   with the unaliged access.  */
+	   with the unaligned access.  */
 
 	if (!(current_thread_info()->status & TS_UAC_NOPRINT)) {
 		if (__ratelimit(&ratelimit)) {
-- 
2.25.1


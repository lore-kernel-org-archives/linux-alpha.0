From: Christoph Lameter <cl@linux.com>
Subject: Re: alpha: Replace __get_cpu_var
Date: Fri, 2 May 2014 10:11:10 -0500 (CDT)
Message-ID: <alpine.DEB.2.10.1405021010290.31444@gentwo.org>
References: <alpine.DEB.2.10.1405011537360.21035@gentwo.org> <20140502081844.GA6891@omega> <alpine.DEB.2.10.1405021007150.30890@gentwo.org>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.10.1405021007150.30890@gentwo.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1399043472;
	bh=aOhZjkaX7JOEi6SnQRnvzn3HY/3JqujFdmeOgDsq02A=;
	h=Received:Received:Received:Received:Date:From:To:Subject:
	 Message-ID:Content-Type;
	b=G9zkXbNC4kWrGIUVagbNfqas7VoHxLkIH3ibBKHB2v7fvohc4M0U4kCsDvIpqJhCH
	 N2EjL1qI7a/FBPBd1VJquaLxVgmy8zAZkYPAlw8bShKpDJBIj6CHdYIsBPLCM3m22p
	 Fn5gICxhIpcOgs0aeWHx8v4ftgyfIlfhfMESzi3wuBUoofznQ1Zbu+mIpDT8TTBUfw
	 3kVoLEY4KX9MUxzT/wk03Lbb1R7kVtUfAsgqOjVc+EGXn8B8XpPr0FKG0JB3vh7KuO
	 3Um4ODEPlAY6LMAoYbGcDINtuSzSdaeOR+y0GlrLu6pjSpLK9Mffl07eq5BpznNdZv
	 gs6FtgAayfFRQ==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Cree <mcree@orcon.net.nz>
Cc: Richard Henderson <rth@twiddle.net>, linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

v2 rediffed aginst Linus tree and fixed the macro def in time.c

Subject: alpha: Replace __get_cpu_var

__get_cpu_var() is used for multiple purposes in the kernel source. One of
them is address calculation via the form &__get_cpu_var(x).  This calculates
the address for the instance of the percpu variable of the current processor
based on an offset.

Other use cases are for storing and retrieving data from the current
processors percpu area.  __get_cpu_var() can be used as an lvalue when
writing data or on the right side of an assignment.

__get_cpu_var() is defined as :


#define __get_cpu_var(var) (*this_cpu_ptr(&(var)))



__get_cpu_var() always only does an address determination. However, store
and retrieve operations could use a segment prefix (or global register on
other platforms) to avoid the address calculation.

this_cpu_write() and this_cpu_read() can directly take an offset into a
percpu area and use optimized assembly code to read and write per cpu
variables.


This patch converts __get_cpu_var into either an explicit address
calculation using this_cpu_ptr() or into a use of this_cpu operations that
use the offset.  Thereby address calculations are avoided and less registers
are used when code is generated.

At the end of the patch set all uses of __get_cpu_var have been removed so
the macro is removed too.

The patch set includes passes over all arches as well. Once these operations
are used throughout then specialized macros can be defined in non -x86
arches as well in order to optimize per cpu access by f.e.  using a global
register that may be set to the per cpu base.




Transformations done to __get_cpu_var()


1. Determine the address of the percpu instance of the current processor.

	DEFINE_PER_CPU(int, y);
	int *x = &__get_cpu_var(y);

    Converts to

	int *x = this_cpu_ptr(&y);


2. Same as #1 but this time an array structure is involved.

	DEFINE_PER_CPU(int, y[20]);
	int *x = __get_cpu_var(y);

    Converts to

	int *x = this_cpu_ptr(y);


3. Retrieve the content of the current processors instance of a per cpu
variable.

	DEFINE_PER_CPU(int, y);
	int x = __get_cpu_var(y)

   Converts to

	int x = __this_cpu_read(y);


4. Retrieve the content of a percpu struct

	DEFINE_PER_CPU(struct mystruct, y);
	struct mystruct x = __get_cpu_var(y);

   Converts to

	memcpy(&x, this_cpu_ptr(&y), sizeof(x));


5. Assignment to a per cpu variable

	DEFINE_PER_CPU(int, y)
	__get_cpu_var(y) = x;

   Converts to

	__this_cpu_write(y, x);


6. Increment/Decrement etc of a per cpu variable

	DEFINE_PER_CPU(int, y);
	__get_cpu_var(y)++

   Converts to

	__this_cpu_inc(y)

CC: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Acked-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Christoph Lameter <cl@linux.com>

Index: linux/arch/alpha/kernel/perf_event.c
===================================================================
--- linux.orig/arch/alpha/kernel/perf_event.c	2014-05-02 10:08:46.435517017 -0500
+++ linux/arch/alpha/kernel/perf_event.c	2014-05-02 10:09:27.426730968 -0500
@@ -431,7 +431,7 @@
  */
 static int alpha_pmu_add(struct perf_event *event, int flags)
 {
-	struct cpu_hw_events *cpuc = &__get_cpu_var(cpu_hw_events);
+	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
 	struct hw_perf_event *hwc = &event->hw;
 	int n0;
 	int ret;
@@ -483,7 +483,7 @@
  */
 static void alpha_pmu_del(struct perf_event *event, int flags)
 {
-	struct cpu_hw_events *cpuc = &__get_cpu_var(cpu_hw_events);
+	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
 	struct hw_perf_event *hwc = &event->hw;
 	unsigned long irq_flags;
 	int j;
@@ -531,7 +531,7 @@
 static void alpha_pmu_stop(struct perf_event *event, int flags)
 {
 	struct hw_perf_event *hwc = &event->hw;
-	struct cpu_hw_events *cpuc = &__get_cpu_var(cpu_hw_events);
+	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);

 	if (!(hwc->state & PERF_HES_STOPPED)) {
 		cpuc->idx_mask &= ~(1UL<<hwc->idx);
@@ -551,7 +551,7 @@
 static void alpha_pmu_start(struct perf_event *event, int flags)
 {
 	struct hw_perf_event *hwc = &event->hw;
-	struct cpu_hw_events *cpuc = &__get_cpu_var(cpu_hw_events);
+	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);

 	if (WARN_ON_ONCE(!(hwc->state & PERF_HES_STOPPED)))
 		return;
@@ -724,7 +724,7 @@
  */
 static void alpha_pmu_enable(struct pmu *pmu)
 {
-	struct cpu_hw_events *cpuc = &__get_cpu_var(cpu_hw_events);
+	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);

 	if (cpuc->enabled)
 		return;
@@ -750,7 +750,7 @@

 static void alpha_pmu_disable(struct pmu *pmu)
 {
-	struct cpu_hw_events *cpuc = &__get_cpu_var(cpu_hw_events);
+	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);

 	if (!cpuc->enabled)
 		return;
@@ -815,7 +815,7 @@
 	int idx, j;

 	__get_cpu_var(irq_pmi_count)++;
-	cpuc = &__get_cpu_var(cpu_hw_events);
+	cpuc = this_cpu_ptr(&cpu_hw_events);

 	/* Completely counting through the PMC's period to trigger a new PMC
 	 * overflow interrupt while in this interrupt routine is utterly
Index: linux/arch/alpha/kernel/time.c
===================================================================
--- linux.orig/arch/alpha/kernel/time.c	2014-05-02 10:08:46.435517017 -0500
+++ linux/arch/alpha/kernel/time.c	2014-05-02 10:10:08.053951701 -0500
@@ -56,9 +56,9 @@

 DEFINE_PER_CPU(u8, irq_work_pending);

-#define set_irq_work_pending_flag()  __get_cpu_var(irq_work_pending) = 1
-#define test_irq_work_pending()      __get_cpu_var(irq_work_pending)
-#define clear_irq_work_pending()     __get_cpu_var(irq_work_pending) = 0
+#define set_irq_work_pending_flag()  __this_cpu_write(irq_work_pending, 1)
+#define test_irq_work_pending()      __this_cpu_read(irq_work_pending)
+#define clear_irq_work_pending()     __this_cpu_write(irq_work_pending, 0)

 void arch_irq_work_raise(void)
 {

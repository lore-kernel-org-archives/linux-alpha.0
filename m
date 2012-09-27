From: tip-bot for Frederic Weisbecker <fweisbec@gmail.com>
Subject: [tip:core/rcu] alpha: Add missing RCU idle APIs on idle loop
Date: Wed, 26 Sep 2012 22:16:00 -0700
Message-ID: <tip-4c94cada48f7c660eca582be6032427a5e367117@git.kernel.org>
Reply-To: linux-kernel@vger.kernel.org, mingo@kernel.org, hpa@zytor.com,
	  paulmck@linux.vnet.ibm.com, fweisbec@gmail.com,
	  linux-alpha@vger.kernel.org, mattst88@gmail.com,
	  ink@jurassic.park.msu.ru, tglx@linutronix.de,
	  josh@joshtriplett.org, rth@twiddle.net, mcree@orcon.net.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-tip-commits@vger.kernel.org
Cc: hpa@zytor.com, mingo@kernel.org, paulmck@linux.vnet.ibm.com, fweisbec@gmail.com, linux-alpha@vger.kernel.org, mattst88@gmail.com, ink@jurassic.park.msu.ru, tglx@linutronix.de, josh@joshtriplett.org, rth@twiddle.net, mcree@orcon.net.nz

Commit-ID:  4c94cada48f7c660eca582be6032427a5e367117
Gitweb:     http://git.kernel.org/tip/4c94cada48f7c660eca582be6032427a5e367117
Author:     Frederic Weisbecker <fweisbec@gmail.com>
AuthorDate: Wed, 22 Aug 2012 17:27:34 +0200
Committer:  Paul E. McKenney <paulmck@linux.vnet.ibm.com>
CommitDate: Sun, 23 Sep 2012 07:44:43 -0700

alpha: Add missing RCU idle APIs on idle loop

In the old times, the whole idle task was considered
as an RCU quiescent state. But as RCU became more and
more successful overtime, some RCU read side critical
section have been added even in the code of some
architectures idle tasks, for tracing for example.

So nowadays, rcu_idle_enter() and rcu_idle_exit() must
be called by the architecture to tell RCU about the part
in the idle loop that doesn't make use of rcu read side
critical sections, typically the part that puts the CPU
in low power mode.

This is necessary for RCU to find the quiescent states in
idle in order to complete grace periods.

Add this missing pair of calls in the Alpha's idle loop.

Reported-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
Tested-by: Michael Cree <mcree@orcon.net.nz>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: alpha <linux-alpha@vger.kernel.org>
Cc: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Cc: <stable@vger.kernel.org> # 3.3+
Reviewed-by: Josh Triplett <josh@joshtriplett.org>
---
 arch/alpha/kernel/process.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index db56f31..83638aa 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -28,6 +28,7 @@
 #include <linux/tty.h>
 #include <linux/console.h>
 #include <linux/slab.h>
+#include <linux/rcupdate.h>
 
 #include <asm/reg.h>
 #include <asm/uaccess.h>
@@ -54,9 +55,11 @@ cpu_idle(void)
 		/* FIXME -- EV6 and LCA45 know how to power down
 		   the CPU.  */
 
+		rcu_idle_enter();
 		while (!need_resched())
 			cpu_relax();
 
+		rcu_idle_exit();
 		schedule_preempt_disabled();
 	}
 }

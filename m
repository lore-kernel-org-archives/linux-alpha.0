From: tip-bot for Frederic Weisbecker <fweisbec@gmail.com>
Subject: [tip:core/rcu] alpha: Fix preemption handling in idle loop
Date: Wed, 26 Sep 2012 22:15:03 -0700
Message-ID: <tip-6a6c0272f17cc80a8286d915f2ddf31557c2d559@git.kernel.org>
Reply-To: linux-kernel@vger.kernel.org, mingo@kernel.org, hpa@zytor.com,
	  paulmck@linux.vnet.ibm.com, fweisbec@gmail.com,
	  linux-alpha@vger.kernel.org, mattst88@gmail.com,
	  ink@jurassic.park.msu.ru, josh@joshtriplett.org,
	  tglx@linutronix.de, rth@twiddle.net, mcree@orcon.net.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-tip-commits@vger.kernel.org
Cc: hpa@zytor.com, mingo@kernel.org, paulmck@linux.vnet.ibm.com, fweisbec@gmail.com, linux-alpha@vger.kernel.org, mattst88@gmail.com, ink@jurassic.park.msu.ru, josh@joshtriplett.org, tglx@linutronix.de, rth@twiddle.net, mcree@orcon.net.nz

Commit-ID:  6a6c0272f17cc80a8286d915f2ddf31557c2d559
Gitweb:     http://git.kernel.org/tip/6a6c0272f17cc80a8286d915f2ddf31557c2d559
Author:     Frederic Weisbecker <fweisbec@gmail.com>
AuthorDate: Thu, 23 Aug 2012 14:11:25 +0200
Committer:  Paul E. McKenney <paulmck@linux.vnet.ibm.com>
CommitDate: Sun, 23 Sep 2012 07:44:42 -0700

alpha: Fix preemption handling in idle loop

cpu_idle() is called on the boot CPU by the init code with
preemption disabled. But the cpu_idle() function in alpha
doesn't handle this when it calls schedule() directly.

Fix it by converting it into schedule_preempt_disabled().

Also disable preemption before calling cpu_idle() from
secondary CPU entry code to stay consistent with this
state.

Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
Tested-by: Michael Cree <mcree@orcon.net.nz>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: alpha <linux-alpha@vger.kernel.org>
Cc: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Reviewed-by: Josh Triplett <josh@joshtriplett.org>
---
 arch/alpha/kernel/process.c |    3 ++-
 arch/alpha/kernel/smp.c     |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index d6fde98..db56f31 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -56,7 +56,8 @@ cpu_idle(void)
 
 		while (!need_resched())
 			cpu_relax();
-		schedule();
+
+		schedule_preempt_disabled();
 	}
 }
 
diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index 35ddc02..a41ad90 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -166,6 +166,7 @@ smp_callin(void)
 	DBGS(("smp_callin: commencing CPU %d current %p active_mm %p\n",
 	      cpuid, current, current->active_mm));
 
+	preempt_disable();
 	/* Do nothing.  */
 	cpu_idle();
 }

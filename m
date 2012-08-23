From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 02/11] alpha: Add missing RCU idle APIs on idle loop
Date: Thu, 23 Aug 2012 16:58:26 +0200
Message-ID: <1345733915-20040-3-git-send-email-fweisbec@gmail.com>
References: <1345733915-20040-1-git-send-email-fweisbec@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
        bh=0rxNlnLJDSIlB1HRjMHv9LT+U8t2xvAg9wS4FJh6vUk=;
        b=wpqXSW/9EdTCB0xkpFTpLdz0mM6wrok7EKvwM47okTV1Bn8MFRcQALgLew2gU9awAB
         U318EJPQtIr9jHX7fxTPYFOET46i+UBFJMzX7XAHBhDcOnZMetz0qJDGAO8Xdae3yHQy
         hNZ0u08R054iFkZOAdLWmPobvmXdChh8tnINUGdlwl8frCxEo4vyLuUP4b0CPj9YjpIX
         rFpbnTTPizT9TOrCQ3wE9IqIdf3oO5n9KCbJvtPqsUT8XkH869W95xBzA/ka8m6FHFGG
         8/GmAc+HJ8bTM3GcZFFLWKEW9U+iGd9URBwsWcuXqQktY9JoEFhXmDTqhO1Xgkuvy6n/
         M6ng==
In-Reply-To: <1345733915-20040-1-git-send-email-fweisbec@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Michael Cree <mcree@orcon.net.nz>, "3.2.x.." <stable@vger.kernel.org>

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
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: alpha <linux-alpha@vger.kernel.org>
Cc: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Cc: Michael Cree <mcree@orcon.net.nz>
Cc: 3.2.x.. <stable@vger.kernel.org>
---
 arch/alpha/kernel/process.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index eac5e01..eb9558c 100644
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
-- 
1.7.5.4

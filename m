From: <gregkh@linuxfoundation.org>
Subject: Patch "alpha: Add missing RCU idle APIs on idle loop" has been added to the 3.4-stable tree
Date: Wed, 10 Oct 2012 09:24:59 +0900
Message-ID: <13498286993248@kroah.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: fweisbec@gmail.com, gregkh@linuxfoundation.org, ink@jurassic.park.msu.ru, josh@joshtriplett.org, linux-alpha@vger.kernel.org, mattst88@gmail.com, mcree@orcon.net.nz, paulmck@linux.vnet.ibm.com, rth@twiddle.net
Cc: stable@vger.kernel.org, stable-commits@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    alpha: Add missing RCU idle APIs on idle loop

to the 3.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     alpha-add-missing-rcu-idle-apis-on-idle-loop.patch
and it can be found in the queue-3.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 4c94cada48f7c660eca582be6032427a5e367117 Mon Sep 17 00:00:00 2001
From: Frederic Weisbecker <fweisbec@gmail.com>
Date: Wed, 22 Aug 2012 17:27:34 +0200
Subject: alpha: Add missing RCU idle APIs on idle loop

From: Frederic Weisbecker <fweisbec@gmail.com>

commit 4c94cada48f7c660eca582be6032427a5e367117 upstream.

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
Reviewed-by: Josh Triplett <josh@joshtriplett.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/alpha/kernel/process.c |    4 ++++
 1 file changed, 4 insertions(+)

--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -28,6 +28,7 @@
 #include <linux/tty.h>
 #include <linux/console.h>
 #include <linux/slab.h>
+#include <linux/rcupdate.h>
 
 #include <asm/reg.h>
 #include <asm/uaccess.h>
@@ -54,8 +55,11 @@ cpu_idle(void)
 		/* FIXME -- EV6 and LCA45 know how to power down
 		   the CPU.  */
 
+		rcu_idle_enter();
 		while (!need_resched())
 			cpu_relax();
+
+		rcu_idle_exit();
 		schedule();
 	}
 }


Patches currently in stable-queue which might be from fweisbec@gmail.com are

queue-3.4/frv-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.4/cris-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.4/m68k-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.4/alpha-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.4/h8300-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.4/parisc-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.4/m32r-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.4/score-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.4/mn10300-add-missing-rcu-idle-apis-on-idle-loop.patch
queue-3.4/xtensa-add-missing-rcu-idle-apis-on-idle-loop.patch

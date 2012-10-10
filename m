From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [ 107/133] alpha: Add missing RCU idle APIs on idle loop
Date: Thu, 11 Oct 2012 07:52:13 +0900
Message-ID: <20121010224913.798777370@linuxfoundation.org>
References: <20121010224854.313159132@linuxfoundation.org>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references; s=smtpout; bh=IHSaM7TDtH4IIGlftoAWOTeRS
	DA=; b=Bh8z4Md3wTpMLwt40NbKNaR5WhAxOBKWu3106X52UV55icMNdnpnNCOxQ
	64cl9lDe2QNnkSIx1ruot3j5k3woyjM1yBqoK4i3WZIrGazKujAilXIXQGPwQK0K
	LyoMiEKTxcR41rgRaJuc64xrMVm3siALYKW+y3L/OYl8IxLE2M=
In-Reply-To: <20121010224854.313159132@linuxfoundation.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alan@lxorguk.ukuu.org.uk, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Frederic Weisbecker <fweisbec@gmail.com>, Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, Josh Triplett <josh@joshtriplett.org>

3.5-stable review patch.  If anyone has any objections, please let me know.

------------------

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
 arch/alpha/kernel/process.c |    3 +++
 1 file changed, 3 insertions(+)

--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -28,6 +28,7 @@
 #include <linux/tty.h>
 #include <linux/console.h>
 #include <linux/slab.h>
+#include <linux/rcupdate.h>
 
 #include <asm/reg.h>
 #include <asm/uaccess.h>
@@ -54,8 +55,10 @@ cpu_idle(void)
 		/* FIXME -- EV6 and LCA45 know how to power down
 		   the CPU.  */
 
+		rcu_idle_enter();
 		while (!need_resched())
 			cpu_relax();
+		rcu_idle_exit();
 		schedule();
 	}
 }



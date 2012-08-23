From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 01/11] alpha: Fix preemption handling in idle loop
Date: Thu, 23 Aug 2012 16:58:25 +0200
Message-ID: <1345733915-20040-2-git-send-email-fweisbec@gmail.com>
References: <1345733915-20040-1-git-send-email-fweisbec@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
        bh=D33zDTJ5opd0dSeBXpSEWW/Z0TUsESBBXYR89DEBP4w=;
        b=HvgjxI6ham+eD/Rg8jNMmPZZgnmAzSUNglX1lxaEsVc0gOEncbHYSGmsUkyP/d3MpW
         I7h24UIYCRf0dd8pK48FAihj/TRlUQQnvmWY1F8YoYsxIX1iCZ66JPUl1nwRS3IbvPol
         X8EdvH8FrirJXQkeAlwJcgB7OXYEneWaPUi34bP1MXw1sng5p0SJtjeOKNJth2K8mCMy
         m2bLd+gRUQ6ZslwcBNVk3a1l+ReEv40yljbcbvXY1+PqLxM+Dy2NwAA9WkEeDypdaWSo
         a3P6I3ob+2v1F81NOoTe+fDx3+usTnbErsOi3wwxgeQi0cpb0YI9gdvy2mgQmc2ChOco
         7sfQ==
In-Reply-To: <1345733915-20040-1-git-send-email-fweisbec@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, alpha <linux-alpha@vger.kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Michael Cree <mcree@orcon.net.nz>

cpu_idle() is called on the boot CPU by the init code with
preemption disabled. But the cpu_idle() function in alpha
doesn't handle this when it calls schedule() directly.

Fix it by converting it into schedule_preempt_disabled().

Also disable preemption before calling cpu_idle() from
secondary CPU entry code to stay consistent with this
state.

Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Richard Henderson<rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: alpha <linux-alpha@vger.kernel.org>
Cc: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Cc: Michael Cree <mcree@orcon.net.nz>
---
 arch/alpha/kernel/process.c |    3 ++-
 arch/alpha/kernel/smp.c     |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 153d3fc..eac5e01 100644
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
-- 
1.7.5.4


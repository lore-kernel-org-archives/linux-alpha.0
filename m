From: Richard Weinberger <richard@nod.at>
Subject: [PATCH] alpha: Forward declare struct pt_regs in processor.h
Date: Thu, 16 Apr 2015 08:58:53 +0200
Message-ID: <1429167533-13442-1-git-send-email-richard@nod.at>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, akpm@linux-foundation.org, Richard Weinberger <richard@nod.at>

Removal of exec domains uncovered this new warning.
processor.h re-used struct pt_regs from personality.h
which is now gone.

./arch/alpha/include/asm/processor.h:47:33: warning: 'struct pt_regs' declared inside parameter list [enabled by default]

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 arch/alpha/include/asm/processor.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/include/asm/processor.h b/arch/alpha/include/asm/processor.h
index b4cf036..43a7559 100644
--- a/arch/alpha/include/asm/processor.h
+++ b/arch/alpha/include/asm/processor.h
@@ -44,6 +44,7 @@ struct task_struct;
 extern unsigned long thread_saved_pc(struct task_struct *);
 
 /* Do necessary setup to start up a newly executed thread.  */
+struct pt_regs;
 extern void start_thread(struct pt_regs *, unsigned long, unsigned long);
 
 /* Free all resources held by a thread. */
-- 
1.8.4.5

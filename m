From: Tobias Klauser <tklauser@distanz.ch>
Subject: [PATCH] alpha: make thread_saved_pc static
Date: Mon, 18 Sep 2017 13:35:44 +0200
Message-ID: <20170918113544.28493-1-tklauser@distanz.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

The only user of thread_saved_pc() in non-arch-specific code was removed
in commit 8243d5597793 ("sched/core: Remove pointless printout in
sched_show_task()"), so it no longer needs to be globally defined for
Alpha and can be made static.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 arch/alpha/include/asm/processor.h | 5 +----
 arch/alpha/kernel/process.c        | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/include/asm/processor.h b/arch/alpha/include/asm/processor.h
index 2fec2dee3020..1f8f20d08f66 100644
--- a/arch/alpha/include/asm/processor.h
+++ b/arch/alpha/include/asm/processor.h
@@ -39,15 +39,12 @@ typedef struct {
 struct thread_struct { };
 #define INIT_THREAD  { }
 
-/* Return saved PC of a blocked thread.  */
-struct task_struct;
-extern unsigned long thread_saved_pc(struct task_struct *);
-
 /* Do necessary setup to start up a newly executed thread.  */
 struct pt_regs;
 extern void start_thread(struct pt_regs *, unsigned long, unsigned long);
 
 /* Free all resources held by a thread. */
+struct task_struct;
 extern void release_thread(struct task_struct *);
 
 unsigned long get_wchan(struct task_struct *p);
diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 0b9635040721..f802b63ad708 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -360,7 +360,7 @@ EXPORT_SYMBOL(dump_elf_task_fp);
  * all.  -- r~
  */
 
-unsigned long
+static unsigned long
 thread_saved_pc(struct task_struct *t)
 {
 	unsigned long base = (unsigned long)task_stack_page(t);
-- 
2.13.0



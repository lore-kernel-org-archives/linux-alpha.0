From: Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH] alpha: fix formating of stack content
Date: Tue, 2 Jan 2018 14:00:32 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1801021359560.12797@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org

Since version 4.9, the kernel automatically breaks printk calls into
multiple newlines unless pr_cont is used. Fix the alpha stacktrace code,
so that it prints stack trace in four columns, as it was initially
intended.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org	# v4.9+

---
 arch/alpha/kernel/traps.c |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

Index: linux-stable/arch/alpha/kernel/traps.c
===================================================================
--- linux-stable.orig/arch/alpha/kernel/traps.c	2017-12-30 11:37:13.000000000 +0100
+++ linux-stable/arch/alpha/kernel/traps.c	2017-12-30 11:47:29.000000000 +0100
@@ -158,11 +158,16 @@ void show_stack(struct task_struct *task
 	for(i=0; i < kstack_depth_to_print; i++) {
 		if (((long) stack & (THREAD_SIZE-1)) == 0)
 			break;
-		if (i && ((i % 4) == 0))
-			printk("\n       ");
-		printk("%016lx ", *stack++);
+		if ((i % 4) == 0) {
+			if (i)
+				pr_cont("\n");
+			printk("       ");
+		} else {
+			pr_cont(" ");
+		}
+		pr_cont("%016lx", *stack++);
 	}
-	printk("\n");
+	pr_cont("\n");
 	dik_show_trace(sp);
 }
 

From: Joe Perches <joe@perches.com>
Subject: [TRIVIAL PATCH 02/26] alpha: Convert print_symbol to %pSR
Date: Wed, 12 Dec 2012 10:18:51 -0800
Message-ID: <0cb31d5042d32b88cc756414dc8099fe4beb75f8.1355335227.git.joe@perches.com>
References: <cover.1355335227.git.joe@perches.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1355335227.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Use the new vsprintf extension to avoid any possible
message interleaving.

Signed-off-by: Joe Perches <joe@perches.com>
---
 arch/alpha/kernel/traps.c |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
index 272666d..9ac7318 100644
--- a/arch/alpha/kernel/traps.c
+++ b/arch/alpha/kernel/traps.c
@@ -66,8 +66,8 @@ dik_show_regs(struct pt_regs *regs, unsigned long *r9_15)
 {
 	printk("pc = [<%016lx>]  ra = [<%016lx>]  ps = %04lx    %s\n",
 	       regs->pc, regs->r26, regs->ps, print_tainted());
-	print_symbol("pc is at %s\n", regs->pc);
-	print_symbol("ra is at %s\n", regs->r26 );
+	printk("pc is at %pSR\n", (void *)regs->pc);
+	printk("ra is at %pSR\n", (void *)regs->r26);
 	printk("v0 = %016lx  t0 = %016lx  t1 = %016lx\n",
 	       regs->r0, regs->r1, regs->r2);
 	printk("t2 = %016lx  t3 = %016lx  t4 = %016lx\n",
@@ -132,9 +132,7 @@ dik_show_trace(unsigned long *sp)
 			continue;
 		if (tmp >= (unsigned long) &_etext)
 			continue;
-		printk("[<%lx>]", tmp);
-		print_symbol(" %s", tmp);
-		printk("\n");
+		printk("[<%lx>] %pSR\n", tmp, (void *)tmp);
 		if (i > 40) {
 			printk(" ...");
 			break;
-- 
1.7.8.112.g3fd21

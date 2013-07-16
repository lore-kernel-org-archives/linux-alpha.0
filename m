From: Richard Henderson <rth@twiddle.net>
Subject: [RFC PATCH 05/10] alpha: Primitive support for CPU power down.
Date: Tue, 16 Jul 2013 10:34:13 -0700
Message-ID: <1373996058-13399-6-git-send-email-rth@twiddle.net>
References: <1373996058-13399-1-git-send-email-rth@twiddle.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=hYuSMSjUJg/wytVwAto+H2662FSZfLbPuExPQvdAtXQ=;
        b=jav/ONkfbyzHGg7h+/KlHmdCb+l9032xAy+ZqrqIH8uEKlh492hs3FNGFdVlPQc4QA
         B75f76ma3MpKieLpqd1vTIzUBzwiubihS+v7YSbfT1DLn9JI4e19EkcCiAoaYyfsIobL
         Waw/ucZeUomQqR80e6vzfBGOH0cUpw1viaieDYfM86tG8CUcykB2bMBcs8VNhWRr3c9H
         TiZwKY8J1a8iuFxgjDCT41NwHGD4IVg5CtHOT4a/5QuaxMQqC8n45xwinEGNSzlBqQoi
         nOiKZ5svdDzEBZn4yERZfHbNBFvHNrpm88XChaKxdZ580eVDEypSeJaBDoTcpCfhVIQJ
         0/8A==
In-Reply-To: <1373996058-13399-1-git-send-email-rth@twiddle.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

Use WTINT to wait for the next interrupt.  Squash the WTINT call
if the PALcode doesn't support it (e.g. MILO).  No attempt is yet
made to skip clock ticks during normal scheduling in order to stay
in power down mode longer.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/alpha/include/asm/pal.h      |  1 +
 arch/alpha/include/uapi/asm/pal.h |  1 +
 arch/alpha/kernel/process.c       | 15 +++++++++++++++
 arch/alpha/kernel/traps.c         | 12 ++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/arch/alpha/include/asm/pal.h b/arch/alpha/include/asm/pal.h
index 6fcd2b5..e78ec9b 100644
--- a/arch/alpha/include/asm/pal.h
+++ b/arch/alpha/include/asm/pal.h
@@ -89,6 +89,7 @@ __CALL_PAL_W1(wrmces, unsigned long);
 __CALL_PAL_RW2(wrperfmon, unsigned long, unsigned long, unsigned long);
 __CALL_PAL_W1(wrusp, unsigned long);
 __CALL_PAL_W1(wrvptptr, unsigned long);
+__CALL_PAL_RW1(wtint, unsigned long, unsigned long);
 
 /*
  * TB routines..
diff --git a/arch/alpha/include/uapi/asm/pal.h b/arch/alpha/include/uapi/asm/pal.h
index 3c0ce08..dfc8140 100644
--- a/arch/alpha/include/uapi/asm/pal.h
+++ b/arch/alpha/include/uapi/asm/pal.h
@@ -46,6 +46,7 @@
 #define PAL_rdusp	58
 #define PAL_whami	60
 #define PAL_retsys	61
+#define PAL_wtint	62
 #define PAL_rti		63
 
 
diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index f2360a7..3130f13 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -46,6 +46,21 @@
 void (*pm_power_off)(void) = machine_power_off;
 EXPORT_SYMBOL(pm_power_off);
 
+/*
+ * Sleep the CPU.
+ * EV6, LCA45 and QEMU know how to power down, skipping N timer interrupts.
+ */
+void arch_cpu_idle(void)
+{
+	wtint(0);
+	local_irq_enable();
+}
+
+void arch_cpu_idle_dead(void)
+{
+	wtint(INT_MAX);
+}
+
 struct halt_info {
 	int mode;
 	char *restart_cmd;
diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
index affccb9..991f6c3 100644
--- a/arch/alpha/kernel/traps.c
+++ b/arch/alpha/kernel/traps.c
@@ -243,6 +243,18 @@ do_entIF(unsigned long type, struct pt_regs *regs)
 			       (const char *)(data[1] | (long)data[2] << 32), 
 			       data[0]);
 		}
+		if (type == 4) {
+			/* If CALL_PAL WTINT is not supported by the PALcode,
+			   "emulate" it by overwriting the insn.  */
+			unsigned int *pinsn
+			  = (unsigned int *) regs->pc - 1;
+			if (*pinsn == PAL_wtint) {
+				*pinsn = 0x47e01400; /* mov 0,$0 */
+				imb();
+				regs->r0 = 0;
+				return;
+			}
+		}
 		die_if_kernel((type == 1 ? "Kernel Bug" : "Instruction fault"),
 			      regs, type, NULL);
 	}
-- 
1.8.1.4

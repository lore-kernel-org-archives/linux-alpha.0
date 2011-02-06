From: Thomas Gleixner <tglx@linutronix.de>
Subject: [patch 19/19] alpha: Enable GENERIC_HARDIRQS_NO_DEPRECATED
Date: Sun, 06 Feb 2011 14:33:02 -0000
Message-ID: <20110206143149.710554951@linutronix.de>
References: <20110206143037.124533892@linutronix.de>
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline; filename=alpha-enable-no-deprecated.patch
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: Kyle McMartin <kyle@redhat.com>, Matt Turner <mattst88@gmail.com>

All interrupt chips are converted. Mark it clean.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/alpha/Kconfig |    1 +
 1 file changed, 1 insertion(+)

Index: linux-next/arch/alpha/Kconfig
===================================================================
--- linux-next.orig/arch/alpha/Kconfig
+++ linux-next/arch/alpha/Kconfig
@@ -11,6 +11,7 @@ config ALPHA
 	select HAVE_GENERIC_HARDIRQS
 	select GENERIC_IRQ_PROBE
 	select AUTO_IRQ_AFFINITY if SMP
+	select GENERIC_HARDIRQS_NO_DEPRECATED
 	help
 	  The Alpha is a 64-bit general-purpose processor designed and
 	  marketed by the Digital Equipment Corporation of blessed memory,



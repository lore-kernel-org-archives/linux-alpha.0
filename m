From: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: [PATCH] Alpha: Remove redundant local asm header redirections
Date: Sun, 13 Feb 2022 20:01:21 +0000 (GMT)
Message-ID: <alpine.DEB.2.21.2202131944000.34636@angie.orcam.me.uk>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Remove a number of asm headers locally redirected to the respective 
generic or generated versions.

For asm-offsets.h all that is needed is a Kbuild entry for the generic 
version, and for div64.h, irq_regs.h and kdebug.h nothing is needed as 
in their absence they will be redirected automatically according to 
include/asm-generic/Kbuild.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
Hi,

 Noticed while fiddling with Kbuild for PARPORT_PC.  Please apply.

  Maciej
---
 arch/alpha/include/asm/Kbuild        |    1 +
 arch/alpha/include/asm/asm-offsets.h |    1 -
 arch/alpha/include/asm/div64.h       |    1 -
 arch/alpha/include/asm/irq_regs.h    |    1 -
 arch/alpha/include/asm/kdebug.h      |    1 -
 5 files changed, 1 insertion(+), 4 deletions(-)

linux-alpha-include-gen.diff
Index: linux-macro/arch/alpha/include/asm/Kbuild
===================================================================
--- linux-macro.orig/arch/alpha/include/asm/Kbuild
+++ linux-macro/arch/alpha/include/asm/Kbuild
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 generated-y += syscall_table.h
+generic-y += asm-offsets.h
 generic-y += export.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
Index: linux-macro/arch/alpha/include/asm/asm-offsets.h
===================================================================
--- linux-macro.orig/arch/alpha/include/asm/asm-offsets.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <generated/asm-offsets.h>
Index: linux-macro/arch/alpha/include/asm/div64.h
===================================================================
--- linux-macro.orig/arch/alpha/include/asm/div64.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm-generic/div64.h>
Index: linux-macro/arch/alpha/include/asm/irq_regs.h
===================================================================
--- linux-macro.orig/arch/alpha/include/asm/irq_regs.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm-generic/irq_regs.h>
Index: linux-macro/arch/alpha/include/asm/kdebug.h
===================================================================
--- linux-macro.orig/arch/alpha/include/asm/kdebug.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm-generic/kdebug.h>

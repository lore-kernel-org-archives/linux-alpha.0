From: Bob Tracy <rct@gherkin.frus.com>
Subject: Re: [BUG] 4.9.0 build error on Alpha
Date: Mon, 2 Jan 2017 18:15:36 -0600
Message-ID: <20170103001536.GB14773@gherkin.frus.com>
References: <20161230033747.GB26007@gherkin.frus.com>
 <alpine.LFD.2.20.1612301554130.1811@eddie.linux-mips.org>
 <3a3389e5-e6f5-5ec3-ca26-762162d2a4ac@gmx.de>
 <20161231064337.GA3209@gherkin.frus.com>
 <20161231072032.GA3544@gherkin.frus.com>
 <alpine.LFD.2.20.1612310907560.1811@eddie.linux-mips.org>
 <20161231152037.GA4896@gherkin.frus.com>
 <alpine.LFD.2.20.1701010121490.1811@eddie.linux-mips.org>
 <20170101033258.GA7310@gherkin.frus.com>
 <20170101202948.GB8958@gherkin.frus.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="mYCpIKhGyMATD0i+"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170101202948.GB8958@gherkin.frus.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Helge Deller <deller@gmx.de>, Matt Turner <mattst88@gmail.com>, linux-alpha <linux-alpha@vger.kernel.org>, Debian Alpha Mailing List <debian-alpha@lists.debian.org>, Michael Cree <mcree@orcon.net.nz>, Richard Henderson <rth@twiddle.net>


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Credit to all who participated in working this issue.  Matt -- attached
is a patch set to be applied against the kernel.org 4.9.0 source tree.
If it passes inspection, please approve and forward upstream.

Apologies for not including in-line, but I don't trust my mailer to
preserve formatting unless I send as an attachment.

Thanks.
--Bob

--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch09_gcc

This series of patches addresses vmlinux ld relocation errors on the
Alpha architecture that appeared at some point after the 4.8.0 release
of the kernel.org source tree.  Fixes are as suggested by Helge Deller
<deller@gmx.de> and Michael Cree <mcree@orcon.net.nz>, with significant
input from Maciej W. Rozycki <macro@linux-mips.org> and Matt Turner
<mattst88@gmail.com>.  The patch set is known to apply cleanly to 4.9.0.

Approach is to define a new "alphalib" section for all the Alpha-specific
library functions to be linked into the final vmlinux.  The "uaccess.h"
patch addresses "__copy_user" relocation errors reported elsewhere.

Tested-by: Bob Tracy <rct@frus.com>

--- a/arch/alpha/include/asm/uaccess.h	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/include/asm/uaccess.h	2016-12-31 15:01:41.621694846 -0600
@@ -344,7 +344,7 @@
 /* This little bit of silliness is to get the GP loaded for a function
    that ordinarily wouldn't.  Otherwise we could have it done by the macro
    directly, which can be optimized the linker.  */
-#ifdef MODULE
+#if 1
 #define __module_address(sym)		"r"(sym),
 #define __module_call(ra, arg, sym)	"jsr $" #ra ",(%" #arg ")," #sym
 #else
--- a/arch/alpha/kernel/vmlinux.lds.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/kernel/vmlinux.lds.S	2016-12-31 09:06:15.548643355 -0600
@@ -20,6 +20,7 @@
 	_text = .;	/* Text and read-only data */
 	.text : {
 		HEAD_TEXT
+		*(.alphalib)
 		TEXT_TEXT
 		SCHED_TEXT
 		CPUIDLE_TEXT
--- a/arch/alpha/lib/callback_srm.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/callback_srm.S	2016-12-31 21:24:37.930036466 -0600
@@ -5,7 +5,7 @@
 #include <asm/console.h>
 #include <asm/export.h>
 
-.text
+.section .alphalib,"ax"
 #define HWRPB_CRB_OFFSET 0xc0
 
 #if defined(CONFIG_ALPHA_SRM) || defined(CONFIG_ALPHA_GENERIC)
--- a/arch/alpha/lib/clear_page.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/clear_page.S	2016-12-31 21:25:11.237910422 -0600
@@ -4,7 +4,7 @@
  * Zero an entire page.
  */
 #include <asm/export.h>
-	.text
+	.section .alphalib,"ax"
 	.align 4
 	.global clear_page
 	.ent clear_page
--- a/arch/alpha/lib/clear_user.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/clear_user.S	2016-12-31 00:54:48.458611939 -0600
@@ -24,6 +24,8 @@
  * Clobbers:
  *	$1,$2,$3,$4,$5,$6
  */
+.section .alphalib,"ax"
+
 #include <asm/export.h>
 
 /* Allow an exception for an insn; exit if we get one.  */
--- a/arch/alpha/lib/copy_page.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/copy_page.S	2016-12-31 21:25:35.673189381 -0600
@@ -4,7 +4,7 @@
  * Copy an entire page.
  */
 #include <asm/export.h>
-	.text
+	.section .alphalib,"ax"
 	.align 4
 	.global copy_page
 	.ent copy_page
--- a/arch/alpha/lib/copy_user.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/copy_user.S	2016-12-31 00:57:16.032150766 -0600
@@ -26,6 +26,7 @@
  *	$1,$2,$3,$4,$5,$6,$7
  */
 
+.section .alphalib,"ax"
 #include <asm/export.h>
 
 /* Allow an exception for an insn; exit if we get one.  */
--- a/arch/alpha/lib/csum_ipv6_magic.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/csum_ipv6_magic.S	2016-12-31 00:57:26.872418989 -0600
@@ -12,6 +12,7 @@
  * added by Ivan Kokshaysky <ink@jurassic.park.msu.ru>
  */
 
+.section .alphalib,"ax"
 #include <asm/export.h>
 	.globl csum_ipv6_magic
 	.align 4
--- a/arch/alpha/lib/dbg_current.S	2007-12-03 00:52:36.000000000 -0600
+++ b/arch/alpha/lib/dbg_current.S	2016-12-31 21:26:09.439047824 -0600
@@ -7,7 +7,7 @@
 
 #include <asm/pal.h>
 
-	.text
+	.section .alphalib,"ax"
 	.set noat
 
 	.globl _mcount
--- a/arch/alpha/lib/dbg_stackcheck.S	2007-12-03 00:52:36.000000000 -0600
+++ b/arch/alpha/lib/dbg_stackcheck.S	2016-12-31 21:26:21.816347141 -0600
@@ -7,7 +7,7 @@
 
 #include <asm/asm-offsets.h>
 
-	.text
+	.section .alphalib,"ax"
 	.set noat
 
 	.align 3
--- a/arch/alpha/lib/dbg_stackkill.S	2007-12-03 00:52:36.000000000 -0600
+++ b/arch/alpha/lib/dbg_stackkill.S	2016-12-31 21:26:31.401796458 -0600
@@ -8,7 +8,7 @@
 
 #include <asm/asm-offsets.h>
 
-	.text
+	.section .alphalib,"ax"
 	.set noat
 
 	.align 5
--- a/arch/alpha/lib/divide.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/divide.S	2016-12-31 00:58:07.403557879 -0600
@@ -45,6 +45,7 @@
  *	$28 - compare status
  */
 
+.section .alphalib,"ax"
 #include <asm/export.h>
 #define halt .long 0
 
--- a/arch/alpha/lib/ev67-strcat.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/ev67-strcat.S	2016-12-31 21:27:02.497868998 -0600
@@ -20,7 +20,7 @@
  */
 
 #include <asm/export.h>
-	.text
+	.section .alphalib,"ax"
 
 	.align 4
 	.globl strcat
--- a/arch/alpha/lib/ev67-strchr.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/ev67-strchr.S	2016-12-31 00:58:26.975803260 -0600
@@ -15,6 +15,7 @@
  *	L	- lower subcluster; L0 - subcluster L0; L1 - subcluster L1
  * Try not to change the actual algorithm if possible for consistency.
  */
+.section .alphalib,"ax"
 #include <asm/export.h>
 #include <asm/regdef.h>
 
--- a/arch/alpha/lib/ev67-strlen.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/ev67-strlen.S	2016-12-31 00:58:33.516485771 -0600
@@ -17,6 +17,7 @@
  *	U	- upper subcluster; U0 - subcluster U0; U1 - subcluster U1
  *	L	- lower subcluster; L0 - subcluster L0; L1 - subcluster L1
  */
+.section .alphalib,"ax"
 #include <asm/export.h>
 	.set noreorder
 	.set noat
--- a/arch/alpha/lib/ev67-strncat.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/ev67-strncat.S	2016-12-31 21:27:26.335522143 -0600
@@ -21,7 +21,7 @@
  */
 
 #include <asm/export.h>
-	.text
+	.section .alphalib,"ax"
 
 	.align 4
 	.globl strncat
--- a/arch/alpha/lib/ev67-strrchr.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/ev67-strrchr.S	2016-12-31 00:58:46.298061373 -0600
@@ -18,6 +18,7 @@
  *	L	- lower subcluster; L0 - subcluster L0; L1 - subcluster L1
  */
 
+.section .alphalib,"ax"
 #include <asm/export.h>
 #include <asm/regdef.h>
 
--- a/arch/alpha/lib/ev6-clear_page.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/ev6-clear_page.S	2016-12-31 21:27:46.951659672 -0600
@@ -4,7 +4,7 @@
  * Zero an entire page.
  */
 #include <asm/export.h>
-        .text
+	.section .alphalib,"ax"
         .align 4
         .global clear_page
         .ent clear_page
--- a/arch/alpha/lib/ev6-clear_user.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/ev6-clear_user.S	2016-12-31 00:58:59.744642169 -0600
@@ -43,6 +43,7 @@
  *	want to leave a hole (and we also want to avoid repeating lots of work)
  */
 
+.section .alphalib,"ax"
 #include <asm/export.h>
 /* Allow an exception for an insn; exit if we get one.  */
 #define EX(x,y...)			\
--- a/arch/alpha/lib/ev6-copy_page.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/ev6-copy_page.S	2016-12-31 21:28:32.237439223 -0600
@@ -57,7 +57,7 @@
    less important than the dcache miss case.  */
 
 #include <asm/export.h>
-	.text
+	.section .alphalib,"ax"
 	.align 4
 	.global copy_page
 	.ent copy_page
--- a/arch/alpha/lib/ev6-copy_user.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/ev6-copy_user.S	2016-12-31 00:59:19.063970744 -0600
@@ -37,6 +37,7 @@
  *	L	- lower subcluster; L0 - subcluster L0; L1 - subcluster L1
  */
 
+.section .alphalib,"ax"
 #include <asm/export.h>
 /* Allow an exception for an insn; exit if we get one.  */
 #define EXI(x,y...)			\
--- a/arch/alpha/lib/ev6-csum_ipv6_magic.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/ev6-csum_ipv6_magic.S	2016-12-31 00:59:27.887740103 -0600
@@ -52,6 +52,7 @@
  * may cause additional delay in rare cases (load-load replay traps).
  */
 
+.section .alphalib,"ax"
 #include <asm/export.h>
 	.globl csum_ipv6_magic
 	.align 4
--- a/arch/alpha/lib/ev6-divide.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/ev6-divide.S	2016-12-31 00:59:37.545451364 -0600
@@ -55,6 +55,7 @@
  * Try not to change the actual algorithm if possible for consistency.
  */
 
+.section .alphalib,"ax"
 #include <asm/export.h>
 #define halt .long 0
 
--- a/arch/alpha/lib/ev6-memchr.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/ev6-memchr.S	2016-12-31 00:59:42.961191168 -0600
@@ -27,6 +27,7 @@
  *	L	- lower subcluster; L0 - subcluster L0; L1 - subcluster L1
  * Try not to change the actual algorithm if possible for consistency.
  */
+.section .alphalib,"ax"
 #include <asm/export.h>
         .set noreorder
         .set noat
--- a/arch/alpha/lib/ev6-memcpy.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/ev6-memcpy.S	2016-12-31 00:59:49.235285693 -0600
@@ -19,6 +19,7 @@
  * Temp usage notes:
  *	$1,$2,		- scratch
  */
+.section .alphalib,"ax"
 #include <asm/export.h>
 	.set noreorder
 	.set noat
--- a/arch/alpha/lib/ev6-memset.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/ev6-memset.S	2016-12-31 21:29:41.882329737 -0600
@@ -29,7 +29,7 @@
 #include <asm/export.h>
 	.set noat
 	.set noreorder
-.text
+.section .alphalib,"ax"
 	.globl memset
 	.globl __memset
 	.globl ___memset
--- a/arch/alpha/lib/ev6-stxcpy.S	2007-12-03 00:52:36.000000000 -0600
+++ b/arch/alpha/lib/ev6-stxcpy.S	2016-12-31 21:30:00.686059571 -0600
@@ -35,7 +35,7 @@
 	.set noat
 	.set noreorder
 
-	.text
+	.section .alphalib,"ax"
 
 /* There is a problem with either gdb (as of 4.16) or gas (as of 2.7) that
    doesn't like putting the entry point for a procedure somewhere in the
--- a/arch/alpha/lib/ev6-stxncpy.S	2008-03-12 22:37:52.000000000 -0500
+++ b/arch/alpha/lib/ev6-stxncpy.S	2016-12-31 21:30:13.334829437 -0600
@@ -43,7 +43,7 @@
 	.set noat
 	.set noreorder
 
-	.text
+	.section .alphalib,"ax"
 
 /* There is a problem with either gdb (as of 4.16) or gas (as of 2.7) that
    doesn't like putting the entry point for a procedure somewhere in the
--- a/arch/alpha/lib/memchr.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/memchr.S	2016-12-31 01:00:16.566901518 -0600
@@ -31,6 +31,7 @@
       - only minimum number of quadwords may be accessed
       - the third argument is an unsigned long
 */
+.section .alphalib,"ax"
 #include <asm/export.h>
         .set noreorder
         .set noat
--- a/arch/alpha/lib/memmove.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/memmove.S	2016-12-31 21:30:33.528136937 -0600
@@ -9,7 +9,7 @@
 #include <asm/export.h>        
 	.set noat
 	.set noreorder
-	.text
+	.section .alphalib,"ax"
 
 	.align 4
 	.globl memmove
--- a/arch/alpha/lib/memset.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/memset.S	2016-12-31 21:30:44.767798881 -0600
@@ -16,7 +16,7 @@
 #include <asm/export.h>
 	.set noat
 	.set noreorder
-.text
+.section .alphalib,"ax"
 	.globl memset
 	.globl __memset
 	.globl ___memset
--- a/arch/alpha/lib/strcat.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/strcat.S	2016-12-31 21:30:53.534930499 -0600
@@ -6,7 +6,7 @@
  */
 #include <asm/export.h>
 
-	.text
+	.section .alphalib,"ax"
 
 	.align 3
 	.globl strcat
--- a/arch/alpha/lib/strchr.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/strchr.S	2016-12-31 01:00:38.366572519 -0600
@@ -5,6 +5,7 @@
  * Return the address of a given character within a null-terminated
  * string, or null if it is not found.
  */
+.section .alphalib,"ax"
 #include <asm/export.h>
 #include <asm/regdef.h>
 
--- a/arch/alpha/lib/strcpy.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/strcpy.S	2016-12-31 21:31:06.929756119 -0600
@@ -6,7 +6,7 @@
  * to the null-terminator in the source.
  */
 #include <asm/export.h>
-	.text
+	.section .alphalib,"ax"
 
 	.align 3
 	.globl strcpy
--- a/arch/alpha/lib/strlen.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/strlen.S	2016-12-31 01:00:48.429536579 -0600
@@ -11,6 +11,7 @@
  *	  do this instead of the 9 instructions that
  *	  binary search needs).
  */
+.section .alphalib,"ax"
 #include <asm/export.h>
 	.set noreorder
 	.set noat
--- a/arch/alpha/lib/strncat.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/strncat.S	2016-12-31 21:31:21.879190063 -0600
@@ -10,7 +10,7 @@
  * implementation in lib/string.c and is, IMHO, more sensible.
  */
 #include <asm/export.h>
-	.text
+	.section .alphalib,"ax"
 
 	.align 3
 	.globl strncat
--- a/arch/alpha/lib/strncpy.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/strncpy.S	2016-12-31 21:31:30.980289048 -0600
@@ -14,7 +14,7 @@
 	.set noat
 	.set noreorder
 
-	.text
+	.section .alphalib,"ax"
 
 	.align 4
 	.globl strncpy
--- a/arch/alpha/lib/strrchr.S	2016-11-19 08:26:53.000000000 -0600
+++ b/arch/alpha/lib/strrchr.S	2016-12-31 01:01:03.720749992 -0600
@@ -5,6 +5,7 @@
  * Return the address of the last occurrence of a given character
  * within a null-terminated string, or null if it is not found.
  */
+.section .alphalib,"ax"
 #include <asm/export.h>
 #include <asm/regdef.h>
 
--- a/arch/alpha/lib/stxcpy.S	2007-12-03 00:52:36.000000000 -0600
+++ b/arch/alpha/lib/stxcpy.S	2016-12-31 21:31:45.535211834 -0600
@@ -25,7 +25,7 @@
 	.set noat
 	.set noreorder
 
-	.text
+	.section .alphalib,"ax"
 
 /* There is a problem with either gdb (as of 4.16) or gas (as of 2.7) that
    doesn't like putting the entry point for a procedure somewhere in the
--- a/arch/alpha/lib/stxncpy.S	2008-03-12 22:37:52.000000000 -0500
+++ b/arch/alpha/lib/stxncpy.S	2016-12-31 21:31:54.913640444 -0600
@@ -33,7 +33,7 @@
 	.set noat
 	.set noreorder
 
-	.text
+	.section .alphalib,"ax"
 
 /* There is a problem with either gdb (as of 4.16) or gas (as of 2.7) that
    doesn't like putting the entry point for a procedure somewhere in the

--mYCpIKhGyMATD0i+--

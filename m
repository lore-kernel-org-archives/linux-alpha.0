From: Richard Henderson <rth@twiddle.net>
Subject: [RFC PATCH 02/10] alpha: Notice if we're being run under QEMU
Date: Tue, 16 Jul 2013 10:34:10 -0700
Message-ID: <1373996058-13399-3-git-send-email-rth@twiddle.net>
References: <1373996058-13399-1-git-send-email-rth@twiddle.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=HS1V6LjtGLrRDbVNs8bQcfo7LVDlow151eoP92r1CBQ=;
        b=DC/qA5d0gOe9+rYEW38ATjmYBwo+D7GGEfHZstVodn0CurcMGKtG6/nOkY14JTRV1u
         w2ZNBjWbr8SGuh4YZ/3UCP8xdaLkQ84aBR6kl6bvHMmMSR6SUYsQxpW5U9yEgYX9FntW
         UW0gWDmSzUErJkmZGPqdy00pHQLESn+Lb0eT2gAYNTyNRSryG8jvqnlMgi+LCGdf6BIs
         9Lj8TAUahucWFKQu0Yls5puLQ1m+GqPbg7I7bc9iFblawXs6LtyT5DJU1AAmnbvicTrd
         J/hcNzebiUbGoz6b+wFG0XGOsBtopNhSOothsCv+AR7UvtWD0SJIMHzCRQIlg2Esl7Ak
         ewwQ==
In-Reply-To: <1373996058-13399-1-git-send-email-rth@twiddle.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

When building a generic kernel, do a run-time check on the serial
number, like we do for MILO.  When building a custom kernel, make
this a configure-time check.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/alpha/Kconfig               | 14 ++++++++++++++
 arch/alpha/include/asm/machvec.h | 18 ++++++++++++------
 arch/alpha/kernel/setup.c        | 13 ++++++++++++-
 3 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 082d9b4..2053f215 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -488,6 +488,20 @@ config VGA_HOSE
 	  which always have multiple hoses, and whose consoles support it.
 
 
+config ALPHA_QEMU
+	bool "Run under QEMU emulation"
+	depends on !ALPHA_GENERIC
+	---help---
+	  Assume the presence of special features supported by QEMU PALcode
+	  that reduce the overhead of system emulation.
+
+	  Generic kernels will auto-detect QEMU.  But when building a
+	  system-specific kernel, the assumption is that we want to
+	  elimiate as many runtime tests as possible.
+
+	  If unsure, say N.
+
+
 config ALPHA_SRM
 	bool "Use SRM as bootloader" if ALPHA_CABRIOLET || ALPHA_AVANTI_CH || ALPHA_EB64P || ALPHA_PC164 || ALPHA_TAKARA || ALPHA_EB164 || ALPHA_ALCOR || ALPHA_MIATA || ALPHA_LX164 || ALPHA_SX164 || ALPHA_NAUTILUS || ALPHA_NONAME
 	depends on TTY
diff --git a/arch/alpha/include/asm/machvec.h b/arch/alpha/include/asm/machvec.h
index 72dbf23..4ac9016 100644
--- a/arch/alpha/include/asm/machvec.h
+++ b/arch/alpha/include/asm/machvec.h
@@ -126,13 +126,19 @@ extern struct alpha_machine_vector alpha_mv;
 
 #ifdef CONFIG_ALPHA_GENERIC
 extern int alpha_using_srm;
+extern int alpha_using_qemu;
 #else
-#ifdef CONFIG_ALPHA_SRM
-#define alpha_using_srm 1
-#else
-#define alpha_using_srm 0
-#endif
+# ifdef CONFIG_ALPHA_SRM
+#  define alpha_using_srm 1
+# else
+#  define alpha_using_srm 0
+# endif
+# ifdef CONFIG_ALPHA_QEMU
+#  define alpha_using_qemu 1
+# else
+#  define alpha_using_qemu 0
+# endif
 #endif /* GENERIC */
 
-#endif
+#endif /* __KERNEL__ */
 #endif /* __ALPHA_MACHVEC_H */
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 9e3107cc5..c38d6a1 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -115,10 +115,17 @@ unsigned long alpha_agpgart_size = DEFAULT_AGP_APER_SIZE;
 
 #ifdef CONFIG_ALPHA_GENERIC
 struct alpha_machine_vector alpha_mv;
+#endif
+
+#ifndef alpha_using_srm
 int alpha_using_srm;
 EXPORT_SYMBOL(alpha_using_srm);
 #endif
 
+#ifndef alpha_using_qemu
+int alpha_using_qemu;
+#endif
+
 static struct alpha_machine_vector *get_sysvec(unsigned long, unsigned long,
 					       unsigned long);
 static struct alpha_machine_vector *get_sysvec_byname(const char *);
@@ -529,11 +536,15 @@ setup_arch(char **cmdline_p)
 	atomic_notifier_chain_register(&panic_notifier_list,
 			&alpha_panic_block);
 
-#ifdef CONFIG_ALPHA_GENERIC
+#ifndef alpha_using_srm
 	/* Assume that we've booted from SRM if we haven't booted from MILO.
 	   Detect the later by looking for "MILO" in the system serial nr.  */
 	alpha_using_srm = strncmp((const char *)hwrpb->ssn, "MILO", 4) != 0;
 #endif
+#ifndef alpha_using_qemu
+	/* Similarly, look for QEMU.  */
+	alpha_using_qemu = strstr((const char *)hwrpb->ssn, "QEMU") != 0;
+#endif
 
 	/* If we are using SRM, we want to allow callbacks
 	   as early as possible, so do this NOW, and then
-- 
1.8.1.4

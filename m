From: Mathieu Chouquet-Stringer <mchouque@online.fr>
Subject: [PATCH] Fix for 2.6.6 Makefiles to get KBUILD_OUTPUT working
Date: Sat, 15 May 2004 21:22:45 -0400
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040516012245.GA11733@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, rth@twiddle.net, linux-alpha@vger.kernel.org, ralf@gnu.org, linux-mips@linux-mips.org, akpm@osdl.org, bjornw@axis.com, dev-etrax@axis.com

	Hi,

if you use O=/someotherdir or KBUILD_OUTPUT=/someotherdir on the following
architectures: alpha, mips, sh and cris, the build process is probably
going to fail at one point or another, depending on the target you used,
because make can't find scripts/Makefile.build or scripts/Makefile.clean.

The following patch (which should apply cleanly to the latest 2.6.6 bk
tree) fixes this, I greped the whole tree and these four were the only
"offenders" I found.

PS: Andrew I mailed you because I couldn't find the maintainer for the sh
    port and you're the last who touched arch/sh/Makefile

--- arch/alpha/Makefile.orig	2004-05-15 20:46:06.000000000 -0400
+++ arch/alpha/Makefile	2004-05-15 20:47:52.000000000 -0400
@@ -106,10 +106,10 @@ boot := arch/alpha/boot
 all boot: $(boot)/vmlinux.gz
 
 $(boot)/vmlinux.gz: vmlinux
-	$(Q)$(MAKE) -f scripts/Makefile.build obj=$(boot) $@
+	$(Q)$(MAKE) $(build)=$(boot) $@
 
 bootimage bootpfile bootpzfile: vmlinux
-	$(Q)$(MAKE) -f scripts/Makefile.build obj=$(boot) $(boot)/$@
+	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 
 
 prepare: include/asm-$(ARCH)/asm_offsets.h
@@ -121,7 +121,7 @@ include/asm-$(ARCH)/asm_offsets.h: arch/
 	$(call filechk,gen-asm-offsets)
 
 archclean:
-	$(Q)$(MAKE) -f scripts/Makefile.clean obj=$(boot)
+	$(Q)$(MAKE) $(clean)=$(boot)
 
 CLEAN_FILES += include/asm-$(ARCH)/asm_offsets.h
 
--- arch/mips/Makefile.orig	2004-05-15 20:48:52.000000000 -0400
+++ arch/mips/Makefile	2004-05-15 20:49:58.000000000 -0400
@@ -686,7 +686,7 @@ vmlinux.64: vmlinux
 		--change-addresses=0xa800000080000000 $< $@
 endif
 
-makeboot =$(Q)$(MAKE) -f scripts/Makefile.build obj=arch/mips/boot $(1)
+makeboot =$(Q)$(MAKE) $(build)=arch/mips/boot $(1)
 
 ifdef CONFIG_SGI_IP27
 all:	vmlinux.64
@@ -708,9 +708,9 @@ CLEAN_FILES += vmlinux.ecoff \
 	       vmlinux.rm200
 
 archclean:
-	@$(MAKE) -f scripts/Makefile.clean obj=arch/mips/boot
-	@$(MAKE) -f scripts/Makefile.clean obj=arch/mips/baget
-	@$(MAKE) -f scripts/Makefile.clean obj=arch/mips/lasat
+	@$(MAKE) $(clean)=arch/mips/boot
+	@$(MAKE) $(clean)=arch/mips/baget
+	@$(MAKE) $(clean)=arch/mips/lasat
 
 # Generate <asm/offset.h 
 #
--- arch/sh/boot/Makefile.orig	2004-05-15 20:50:11.000000000 -0400
+++ arch/sh/boot/Makefile	2004-05-15 20:50:41.000000000 -0400
@@ -16,5 +16,5 @@ $(obj)/zImage: $(obj)/compressed/vmlinux
 	@echo 'Kernel: $@ is ready'
 
 $(obj)/compressed/vmlinux: FORCE
-	$(Q)$(MAKE) -f scripts/Makefile.build obj=$(obj)/compressed $@
+	$(Q)$(MAKE) $(build)=$(obj)/compressed $@
 
--- arch/cris/Makefile.orig	2004-05-15 20:59:49.000000000 -0400
+++ arch/cris/Makefile	2004-05-15 21:00:36.000000000 -0400
@@ -81,7 +81,7 @@ compressed: zImage
 
 archmrproper:
 archclean:
-	$(Q)$(MAKE) -f scripts/Makefile.clean obj=arch/$(ARCH)/boot	
+	$(Q)$(MAKE) $(clean)=arch/$(ARCH)/boot	
 	rm -f timage vmlinux.bin cramfs.img
 	rm -rf $(LD_SCRIPT).tmp
 

-- 
Mathieu Chouquet-Stringer                 E-Mail: mchouque@online.fr
       Never attribute to malice that which can be adequately
                    explained by stupidity.
                     -- Hanlon's Razor --

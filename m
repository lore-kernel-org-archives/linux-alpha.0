From: Mathieu Chouquet-Stringer <mchouque@online.fr>
Subject: Re: [PATCH] Fix for 2.6.6 Makefiles to get KBUILD_OUTPUT working
Date: Mon, 17 May 2004 11:23:11 -0400
Sender: linux-mips-bounce@linux-mips.org
Message-ID: <20040517152311.GA29999@localhost>
References: <20040516012245.GA11733@localhost>
 <20040516203322.GA4784@mars.ravnborg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-mips-bounce@linux-mips.org>
In-reply-to: <20040516203322.GA4784@mars.ravnborg.org>
Content-Disposition: inline
Errors-to: linux-mips-bounce@linux-mips.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, rth@twiddle.net, linux-alpha@vger.kernel.org, ralf@gnu.org, linux-mips@linux-mips.org, akpm@osdl.org, bjornw@axis.com, dev-etrax@axis.com, mikael.starvik@axis.com, sam@ravnborg.org

On Sun, May 16, 2004 at 10:33:22PM +0200, Sam Ravnborg wrote:
> > --- arch/mips/Makefile.orig	2004-05-15 20:48:52.000000000 -0400
> > +++ arch/mips/Makefile	2004-05-15 20:49:58.000000000 -0400
> >  
> > -makeboot =$(Q)$(MAKE) -f scripts/Makefile.build obj=arch/mips/boot $(1)
> > +makeboot =$(Q)$(MAKE) $(build)=arch/mips/boot $(1)
> 
> Please get rid of makeboot. Use $(Q)$(MAKE) ... instead.
> Hereby the '+' sign is no longer needed (used today where makeboot is used.

Ok, I applied the changes you requested, please check the diff for mips as
I had to modify some other lines too.

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
@@ -121,8 +121,8 @@ include/asm-$(ARCH)/asm_offsets.h: arch/
 	$(call filechk,gen-asm-offsets)
 
 archclean:
-	$(Q)$(MAKE) -f scripts/Makefile.clean obj=$(boot)
+	$(Q)$(MAKE) $(clean)=$(boot)
 
 CLEAN_FILES += include/asm-$(ARCH)/asm_offsets.h
 
--- arch/mips/Makefile.orig	2004-05-15 20:48:52.000000000 -0400
+++ arch/mips/Makefile	2004-05-17 11:11:57.000000000 -0400
@@ -686,8 +686,6 @@ vmlinux.64: vmlinux
 		--change-addresses=0xa800000080000000 $< $@
 endif
 
-makeboot =$(Q)$(MAKE) -f scripts/Makefile.build obj=arch/mips/boot $(1)
-
 ifdef CONFIG_SGI_IP27
 all:	vmlinux.64
 endif
@@ -697,10 +695,10 @@ all:	vmlinux.ecoff
 endif
 
 vmlinux.ecoff vmlinux.rm200: vmlinux
-	+@$(call makeboot,$@)
+	$(Q)$(MAKE) $(build)=arch/mips/boot $@
 
 vmlinux.srec: vmlinux
-	+@$(call makeboot,$@)
+	$(Q)$(MAKE) $(build)=arch/mips/boot $@
 
 CLEAN_FILES += vmlinux.ecoff \
 	       vmlinux.srec \
@@ -708,10 +706,10 @@ CLEAN_FILES += vmlinux.ecoff \
 	       vmlinux.rm200
 
 archclean:
-	@$(MAKE) -f scripts/Makefile.clean obj=arch/mips/boot
-	@$(MAKE) -f scripts/Makefile.clean obj=arch/mips/baget
-	@$(MAKE) -f scripts/Makefile.clean obj=arch/mips/lasat
+	$(Q)$(MAKE) $(clean)=arch/mips/boot
+	$(Q)$(MAKE) $(clean)=arch/mips/baget
+	$(Q)$(MAKE) $(clean)=arch/mips/lasat
 
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


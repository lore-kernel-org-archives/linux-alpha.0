Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFED3909A5
	for <linux-alpha@vger.kernel.org>; Sat, 12 Sep 2026 19:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789242953; cv=none; b=H/zanpuYjIgv5nVK16m9UImZlzVyRQBUXj+ul3ZBVi4NdEZcrQ8lZr2MAwt6ch0SuHM7mbaLuzTvgBB9DGOhLzw7VugDqSKfwJRqWyvBYquBoOvKsYYrqVshojyZEicNQR+aNXIPH7YU+5AXxnFUWvcU8c2JYh6IwR9OErwonp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789242953; c=relaxed/simple;
	bh=TLG+FXxYj02zo3kFa0FcfgOuzRpjmn0I45fl4soM91s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qhBUWwcNm1WQpt+GWb+b3elKuI7562XflTrhM1dsRGneNTI0GsL81quBYTRqQ2azlREFe73Vczc1qvQ41bZMvLxYMdlkt2PfUVVKGVcLx3K/okqmI5NDrLD/oMtp+2eRUMF/RQz1JCi/EwSWItHKJM1kKbka3q72l5aFR5uwFKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNYHIzkd; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNYHIzkd"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-670fee39d73so465906d50.3
        for <linux-alpha@vger.kernel.org>; Sat, 12 Sep 2026 12:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789242950; x=1789847750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LAJFGKkQwja5Ngco4ah+sb/VGagRIkZqgTZaNgWxDv8=;
        b=KNYHIzkdSZSaIu+jkiXgG1sC1BpEacu4sDCSHHpLmDD89CxBYXXAPlOknKONFDyyGG
         PnoyoSKDeKKsDrh/Em/Ud0dj3eVeHmq9YqWmgsjWKTG667s/LqdFo5+pMtIGkR+hLYjl
         eA9lqj4gv2tQK1W64+Nen3gBRHLXDvfVb7uEMqflXSxYTS1E23FzIHdG7GnZzxmveW62
         IAE+3uWYdTh8C/g4MlMH41JSP74ZE25+enRHAs/J0/67Auv1cUzZmlOjRiboryZ1UCpS
         jshUS/5NVR8HTwU37GuwvKmrUwPzYulNG2NSxB041P38KQB8nP1wWvpdoXzQp4rRH9+A
         iyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789242950; x=1789847750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAJFGKkQwja5Ngco4ah+sb/VGagRIkZqgTZaNgWxDv8=;
        b=gU6/4v6nALOS0j54bCNoQ2L338pa554F5kBzKFNR50pWxkXTk5EW75e96DNIA2bxOw
         FJG6r6vvfVVo43oYuw3dK1GdNZFB6o4GApJ/Wh7TAgqdQujLVIQAM234yJ40laOJ85rz
         G/DHgkLR6r29JyZGPGiOZfTfRyvYadZdu1RO4WWoeTvaC7KThQ2MP0sfxMUA7PL0igEb
         hYSaEHsWdHIRzlGmOXe+VD74v3jDxS86Iff2LE5SibzNnaMrNlIbDjDq8wKdGUDnutDi
         InLi0gp077YoYBf4rJejOP0B2GHa6meZCc5M4Gjm6hKRUmfbWvjnd5NmPvskc/sZENyo
         m3bQ==
X-Forwarded-Encrypted: i=1; AKwUvByzcn4ChCZ7rWsz0d8AlLo80i93/ryXFlt0Zpv+CN/oln9DVh67SkVvVyVkBVU+5ILardztdUxQ6RmJ7A==@vger.kernel.org
X-Gm-Message-State: AFuF++nStuunZxNJQnHX/AiykUOXoMxHhqM76qS6qHvYcZ8INeIuIaO7
	IRp7G70/RQA1+dyV8VCspeUckIIapOBqGlvHmIqCgeDBbwHHxaWPWh0c
X-Gm-Gg: AYBFou3mcC4JCQlpJu0FF8ss82HDXMiO/OMN+cPKHwJm+Pg/ncUnpwaKK0dbyTxOa4M
	qTUlpIxv3n9mVjyBtgNmfFhLfnyRofT9AEVHcCAcy1ZqlEwE6FNtzTay1rAV7eWqbuE9FZwTuD8
	x865nvI9PTEUh7FhprJ0tlTQzWPP9bxf8gbYM4KrstxobWriGIHzUuY5CtIcVE+xW7lxYKP/w+Z
	arWrQwoWpkG5F7Yl6bNfs8Di7lnehTRg/FpwOJgpEOGClSV0T3MGyNUFcK904HNAUFRB/IDr+NR
	XVeOcKUmqfK3Zf9EcmJr4AR2GmOgLwKiugm5HXJwiMA+X7AwM7ZGHSiAIK5Nr2kYMT6DUNc1VwY
	cCaH3DV/Ft7pihVQQXSEiAP1Y9QuAHQQqdQQ8TfHYnFHLXKjq8NsDezMCXZFwSvjCJJ87m0ok/9
	N8ryvKYThBtW6qCAJv8sSvG+1gqRwjjt+09FMA6+/e4MX1aqP/QO+MoYWGaqBOoLa9AIMRx5M=
X-Received: by 2002:a05:690e:1301:b0:671:3b52:60ef with SMTP id 956f58d0204a3-6713b52629bmr548164d50.93.1789242950165;
        Sat, 12 Sep 2026 12:55:50 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125db4fecsm2562366d50.4.2026.09.12.12.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:55:49 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 12 Sep 2026 15:55:44 -0400
Subject: [PATCH 2/3] alpha: add self-extracting compressed kernel boot stub
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-alpha-kernel-compression-v1-2-ce9d55330193@gmail.com>
References: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
In-Reply-To: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
To: Lasse Collin <lasse.collin@tukaani.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=17649; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=TLG+FXxYj02zo3kFa0FcfgOuzRpjmn0I45fl4soM91s=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKWrrNvm5xlr54mfXYtP1+Q2Gmmh7/q9p2+rq2QH70kc
 /OGy30nOz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaaej1GhgVvb6To1g
 v25/r93/NHQePlqi0ZZmfjDmY37NepeXzdVY6RYU7mRM5/y1dHqG3zPTlTLiP4no/ZR5YIq68sP
 OvmrAy1ZwcA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha only ever supported gzip for the kernel image, and did so in a way
out of step with every other architecture: aboot, the disk boot loader,
decompresses vmlinux.gz itself with its own bundled inflate code, so
adding a compression format meant writing a new decompressor inside
aboot as well as in the kernel.

Build a proper self-extracting arch/alpha/boot/compressed/vmlinux
instead, modeled on parisc: a small ELF stub with the real, compressed
vmlinux linked in, which decompresses the kernel, relocates it into
place and jumps to its entry point. aboot needs no changes.

The build now emits arch/alpha/boot/vmlinuz rather than vmlinux.gz,
which was never a name aboot cared about and would be a lie for an ELF
stub: the bootpz path in the same directory still produces real gzip
data as vmlinux.nh.gz. Existing aboot.conf files name the image as it
was installed in /boot, so only the command that copies it out of the
build tree changes.

Unlike parisc and mips, the stub is linked at START_ADDR rather than at
a separate low address; see compressed/vmlinux.lds.S. It has no console
output, since bringing up the HWRPB console callbacks needs more than
the CRB dispatch the kernel proper does much later, so error() just
halts.

The legacy SRM netboot path (bootpz.c) is left alone: it has its own
boot protocol (PALcode reinitialization, self-populated ZERO_PGE,
build-time-computed image sizes) that does not fit this design without a
separate rewrite, and keeps using plain gzip via vmlinux.nh.gz.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig                       |   1 +
 arch/alpha/Makefile                      |   6 +-
 arch/alpha/boot/.gitignore               |   2 +
 arch/alpha/boot/Makefile                 |  16 ++-
 arch/alpha/boot/compressed/.gitignore    |   3 +
 arch/alpha/boot/compressed/Makefile      |  36 +++++++
 arch/alpha/boot/compressed/head.S        |  36 +++++++
 arch/alpha/boot/compressed/misc.c        | 178 +++++++++++++++++++++++++++++++
 arch/alpha/boot/compressed/trampoline.S  |  46 ++++++++
 arch/alpha/boot/compressed/vmlinux.lds.S |  83 ++++++++++++++
 arch/alpha/boot/compressed/vmlinux.scr   |  10 ++
 11 files changed, 409 insertions(+), 8 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 04511242506b..2688bb00f175 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -30,6 +30,7 @@ config ALPHA
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_GUP_FAST
+	select HAVE_KERNEL_GZIP
 	select HAVE_PAGE_SIZE_8KB
 	select HAVE_PCSPKR_PLATFORM
 	select HAVE_PERF_EVENTS
diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
index 7074602dca94..405d4bfd644c 100644
--- a/arch/alpha/Makefile
+++ b/arch/alpha/Makefile
@@ -47,9 +47,9 @@ export LIBS_Y
 boot := arch/alpha/boot
 
 #Default target when executing make with no arguments
-all boot: $(boot)/vmlinux.gz
+all boot: $(boot)/vmlinuz
 
-$(boot)/vmlinux.gz: vmlinux
+$(boot)/vmlinuz: vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $@
 
 bootimage bootpfile bootpzfile: vmlinux
@@ -59,7 +59,7 @@ archheaders:
 	$(Q)$(MAKE) $(build)=arch/alpha/kernel/syscalls all
 
 define archhelp
-  echo '* boot		- Compressed kernel image (arch/alpha/boot/vmlinux.gz)'
+  echo '* boot		- Compressed kernel image (arch/alpha/boot/vmlinuz)'
   echo '  bootimage	- SRM bootable image (arch/alpha/boot/bootimage)'
   echo '  bootpfile	- BOOTP bootable image (arch/alpha/boot/bootpfile)'
   echo '  bootpzfile	- compressed kernel BOOTP image (arch/alpha/boot/bootpzfile)'
diff --git a/arch/alpha/boot/.gitignore b/arch/alpha/boot/.gitignore
new file mode 100644
index 000000000000..4125506521f6
--- /dev/null
+++ b/arch/alpha/boot/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+vmlinuz
diff --git a/arch/alpha/boot/Makefile b/arch/alpha/boot/Makefile
index d8dba85e606c..7c2a41c1e2a0 100644
--- a/arch/alpha/boot/Makefile
+++ b/arch/alpha/boot/Makefile
@@ -9,9 +9,10 @@
 #
 
 hostprogs	:= tools/mkbb tools/objstrip
-targets		:= vmlinux.gz vmlinux \
+targets		:= vmlinuz vmlinux \
 		   vmlinux.nh tools/lxboot tools/bootlx tools/bootph \
-		   tools/bootpzh bootloader bootpheader bootpzheader 
+		   tools/bootpzh bootloader bootpheader bootpzheader
+subdir-		:= compressed
 OBJSTRIP	:= $(obj)/tools/objstrip
 
 KBUILD_HOSTCFLAGS := -Wall -I$(objtree)/usr/include
@@ -38,9 +39,14 @@ ifdef INITRD
 	cat $(INITRD) >> $@
 endif
 
-# Compressed kernel image
-$(obj)/vmlinux.gz: $(obj)/vmlinux FORCE
-	$(call if_changed,gzip)
+# Self-extracting compressed kernel image: a small ELF stub (see
+# compressed/) with the real vmlinux linked in compressed, which aboot
+# loads and enters like a plain vmlinux.
+$(obj)/compressed/vmlinux: vmlinux FORCE
+	$(Q)$(MAKE) $(build)=$(obj)/compressed $@
+
+$(obj)/vmlinuz: $(obj)/compressed/vmlinux FORCE
+	$(call if_changed,copy)
 	@echo '  Kernel $@ is ready'
 
 $(obj)/main.o: $(obj)/ksize.h
diff --git a/arch/alpha/boot/compressed/.gitignore b/arch/alpha/boot/compressed/.gitignore
new file mode 100644
index 000000000000..765a08f1bd77
--- /dev/null
+++ b/arch/alpha/boot/compressed/.gitignore
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+vmlinux
+vmlinux.lds
diff --git a/arch/alpha/boot/compressed/Makefile b/arch/alpha/boot/compressed/Makefile
new file mode 100644
index 000000000000..d826f7e4384d
--- /dev/null
+++ b/arch/alpha/boot/compressed/Makefile
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Create a self-extracting compressed vmlinux image from the original
+# vmlinux. aboot loads and enters it like a plain vmlinux.
+#
+
+OBJECTS := head.o misc.o trampoline.o piggy.o
+targets := vmlinux.lds vmlinux vmlinux.bin vmlinux.bin.gz
+targets += $(OBJECTS)
+
+# The stub runs before the kernel has identified the CPU it booted on, so
+# build it for the base Alpha instruction set rather than inheriting the
+# kernel's -mcpu=.
+KBUILD_CFLAGS := -D__KERNEL__ -std=gnu11 -Os -fno-strict-aliasing
+KBUILD_CFLAGS += -fno-PIE -ffreestanding -fno-stack-protector
+KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
+KBUILD_CFLAGS += -pipe -mno-fp-regs -ffixed-8
+KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING -D__DISABLE_EXPORTS
+KBUILD_CFLAGS += $(CC_FLAGS_DIALECT)
+
+LDFLAGS_vmlinux := -X --orphan-handling=warn -T
+$(obj)/vmlinux: $(obj)/vmlinux.lds $(addprefix $(obj)/, $(OBJECTS)) $(LIBS_Y) FORCE
+	$(call if_changed,ld)
+
+OBJCOPYFLAGS_vmlinux.bin := -R .comment -R .note -S
+$(obj)/vmlinux.bin: vmlinux FORCE
+	$(call if_changed,objcopy)
+
+suffix-$(CONFIG_KERNEL_GZIP)	:= gz
+
+$(obj)/vmlinux.bin.gz: $(obj)/vmlinux.bin FORCE
+	$(call if_changed,gzip)
+
+LDFLAGS_piggy.o := -r --format binary --oformat elf64-alpha -T
+$(obj)/piggy.o: $(obj)/vmlinux.scr $(obj)/vmlinux.bin.$(suffix-y) FORCE
+	$(call if_changed,ld)
diff --git a/arch/alpha/boot/compressed/head.S b/arch/alpha/boot/compressed/head.S
new file mode 100644
index 000000000000..c689ac439d15
--- /dev/null
+++ b/arch/alpha/boot/compressed/head.S
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Entry point for the self-extracting compressed kernel stub. aboot
+ * jumps here with the OSF/1 parameter page (ZERO_PGE) already populated
+ * and $30 set to INIT_STACK, exactly as it would for an uncompressed
+ * vmlinux.
+ */
+
+#include <linux/init.h>
+#include <asm/pal.h>
+
+	.set noreorder
+
+__HEAD
+	.globl	__start
+	.ent	__start
+__start:
+	br	$29,1f
+1:	ldgp	$29,0($29)
+
+	/*
+	 * Clear our own bss. The decompressors keep state there, and
+	 * nothing guarantees that aboot zeroed the part of our PT_LOAD
+	 * segment that has no file backing.
+	 */
+	lda	$1,_bss
+	lda	$2,_ebss
+2:	cmpult	$1,$2,$3
+	beq	$3,3f
+	stq	$31,0($1)
+	addq	$1,8,$1
+	br	$31,2b
+
+3:	jsr	$26,decompress_and_boot
+	call_pal PAL_halt
+	.end __start
diff --git a/arch/alpha/boot/compressed/misc.c b/arch/alpha/boot/compressed/misc.c
new file mode 100644
index 000000000000..72998582be68
--- /dev/null
+++ b/arch/alpha/boot/compressed/misc.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Decompression and self-relocation for the compressed kernel boot stub,
+ * based on arch/parisc/boot/compressed/misc.c.
+ *
+ * aboot loads the stub as an ordinary ELF at START_ADDR and jumps to it
+ * with the parameter page and stack already set up; vmlinux.lds.S
+ * explains why the stub has to be linked there. We decompress above our
+ * own bss and never write below START_ADDR, so what aboot prepared stays
+ * valid for the real kernel.
+ */
+
+#include <linux/elf.h>
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include <asm/hwrpb.h>
+#include <asm/page.h>
+#include <asm/pal.h>
+#include <asm/setup.h>
+
+#define STATIC static
+#define memzero(s, n) memset((s), 0, (n))
+
+extern char input_data[];
+extern int input_len;
+/* output_len is inserted by the linker, possibly at an unaligned address */
+extern char output_len;
+
+extern char _ebss[];
+extern char trampoline_start[], trampoline_end[];
+
+static unsigned long free_mem_ptr;
+static unsigned long free_mem_end_ptr;
+static unsigned long mem_end;
+
+/* The stub has no console, so the message is only for debuggers. */
+void __noreturn error(char *m)
+{
+	while (1)
+		__halt();
+}
+
+#ifdef CONFIG_KERNEL_GZIP
+#include "../../../../lib/decompress_inflate.c"
+#endif
+
+/* Scratch heap for the decompressors, larger than any of them needs. */
+#define STUB_HEAP_SIZE	(4 * 1024 * 1024)
+
+/*
+ * Type punning through a packed struct, to avoid the warnings the regular
+ * get_unaligned_le32() produces when reading a char-typed symbol as an
+ * integer.
+ */
+static u32 punned_get_unaligned_le32(const void *p)
+{
+	const struct { __le32 x; } __packed *pp = p;
+
+	return le32_to_cpu(pp->x);
+}
+
+/*
+ * End of the usable memory cluster that holds the kernel, or 0 if the
+ * HWRPB does not describe one. Used to check that the decompressed image
+ * and the stub's scratch space fit before anything is written.
+ */
+static unsigned long usable_memory_end(void)
+{
+	struct hwrpb_struct *hwrpb;
+	struct memdesc_struct *memdesc;
+	unsigned long pfn = (START_ADDR - PAGE_OFFSET) >> PAGE_SHIFT;
+	unsigned long i;
+
+	hwrpb = (struct hwrpb_struct *)(PAGE_OFFSET + INIT_HWRPB->phys_addr);
+	memdesc = (struct memdesc_struct *)((unsigned long)hwrpb +
+					    hwrpb->mddt_offset);
+
+	for (i = 0; i < memdesc->numclusters; i++) {
+		struct memclust_struct *cluster = &memdesc->cluster[i];
+		unsigned long end_pfn = cluster->start_pfn + cluster->numpages;
+
+		if (cluster->usage)
+			continue;
+		if (pfn >= cluster->start_pfn && pfn < end_pfn)
+			return PAGE_OFFSET + (end_pfn << PAGE_SHIFT);
+	}
+
+	return 0;
+}
+
+/*
+ * Move the decompressed kernel's single PT_LOAD segment down onto
+ * START_ADDR and jump to its entry point. The kernel is always linked
+ * with exactly one PT_LOAD whose p_vaddr equals its e_entry equals
+ * START_ADDR (see arch/alpha/kernel/vmlinux.lds.S); anything else we do
+ * not know how to boot.
+ *
+ * The copy cannot run from this stub, which is itself executing at
+ * START_ADDR; see trampoline.S.
+ */
+static void __noreturn relocate_and_jump(void *image)
+{
+	void (*trampoline)(unsigned long dest, unsigned long src,
+			   unsigned long filesz, unsigned long memsz,
+			   unsigned long entry);
+	unsigned long tramp_len = trampoline_end - trampoline_start;
+	Elf64_Phdr phdr, load_phdr = {};
+	Elf64_Ehdr ehdr;
+	int i, found_load = 0;
+	unsigned long tramp;
+
+	memcpy(&ehdr, image, sizeof(ehdr));
+
+	if (ehdr.e_ident[EI_MAG0] != ELFMAG0 ||
+	    ehdr.e_ident[EI_MAG1] != ELFMAG1 ||
+	    ehdr.e_ident[EI_MAG2] != ELFMAG2 ||
+	    ehdr.e_ident[EI_MAG3] != ELFMAG3 ||
+	    ehdr.e_ident[EI_CLASS] != ELFCLASS64 ||
+	    ehdr.e_ident[EI_DATA] != ELFDATA2LSB ||
+	    ehdr.e_machine != EM_ALPHA ||
+	    ehdr.e_type != ET_EXEC ||
+	    ehdr.e_entry != START_ADDR)
+		error("Not a bootable Alpha kernel image");
+
+	for (i = 0; i < ehdr.e_phnum; i++) {
+		memcpy(&phdr, image + ehdr.e_phoff + i * ehdr.e_phentsize,
+		       sizeof(phdr));
+
+		if (phdr.p_type != PT_LOAD)
+			continue;
+		if (found_load || phdr.p_vaddr != START_ADDR)
+			error("Unexpected kernel segment layout");
+		found_load = 1;
+		load_phdr = phdr;
+	}
+	if (!found_load)
+		error("Kernel image has no PT_LOAD segment");
+
+	/*
+	 * The trampoline has to outlive both the scratch heap it is copied
+	 * into and the region it is about to write, which extends past the
+	 * kernel's file image to the end of its bss.
+	 */
+	tramp = ALIGN(max(free_mem_end_ptr, START_ADDR + load_phdr.p_memsz), 8);
+	if (mem_end && tramp + tramp_len > mem_end)
+		error("Not enough memory to relocate the kernel");
+
+	memcpy((void *)tramp, trampoline_start, tramp_len);
+	imb();
+
+	trampoline = (void *)tramp;
+	trampoline(load_phdr.p_vaddr,
+		   (unsigned long)image + load_phdr.p_offset,
+		   load_phdr.p_filesz, load_phdr.p_memsz, ehdr.e_entry);
+	unreachable();
+}
+
+void __noreturn decompress_and_boot(void)
+{
+	unsigned long image_len = punned_get_unaligned_le32(&output_len);
+	void *image = (void *)ALIGN((unsigned long)_ebss, PAGE_SIZE);
+
+	free_mem_ptr = ALIGN((unsigned long)image + image_len, PAGE_SIZE);
+	free_mem_end_ptr = free_mem_ptr + STUB_HEAP_SIZE;
+
+	mem_end = usable_memory_end();
+	if (mem_end && free_mem_end_ptr > mem_end)
+		error("Not enough memory to decompress the kernel");
+
+	/* Some decompressors report failure only through the return value. */
+	if (__decompress(input_data, input_len, NULL, NULL, image, image_len,
+			 NULL, error))
+		error("Kernel decompression failed");
+
+	relocate_and_jump(image);
+}
diff --git a/arch/alpha/boot/compressed/trampoline.S b/arch/alpha/boot/compressed/trampoline.S
new file mode 100644
index 000000000000..bf57d3b0fd7f
--- /dev/null
+++ b/arch/alpha/boot/compressed/trampoline.S
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copy the decompressed kernel onto START_ADDR, clear its bss and jump to
+ * its entry point. See relocate_and_jump() in misc.c for why this cannot
+ * run from the stub itself. It is position independent (no data or
+ * rodata references, no gp) and clobbers only its argument registers and
+ * $1, so misc.c can copy it anywhere and call it there.
+ */
+
+	.set noreorder
+
+	.globl	trampoline_start
+	.globl	trampoline_end
+	.ent	trampoline_start
+trampoline_start:
+	/* $16 = dest, $17 = src, $18 = p_filesz, $19 = p_memsz, $20 = entry */
+
+	/*
+	 * dest and src are both page aligned, and everything above
+	 * p_filesz is bss, so round both lengths up and work in quadwords
+	 * only, using instructions every Alpha implements.
+	 */
+	addq	$18,7,$18
+	bic	$18,7,$18
+	addq	$19,7,$19
+	bic	$19,7,$19
+	subq	$19,$18,$19		/* bytes to zero after the copy */
+
+1:	beq	$18,2f
+	ldq	$1,0($17)
+	stq	$1,0($16)
+	addq	$17,8,$17
+	addq	$16,8,$16
+	subq	$18,8,$18
+	br	$31,1b
+
+2:	beq	$19,3f
+	stq	$31,0($16)
+	addq	$16,8,$16
+	subq	$19,8,$19
+	br	$31,2b
+
+3:	imb
+	jmp	$31,($20)
+	.end trampoline_start
+trampoline_end:
diff --git a/arch/alpha/boot/compressed/vmlinux.lds.S b/arch/alpha/boot/compressed/vmlinux.lds.S
new file mode 100644
index 000000000000..5328c1ccaccf
--- /dev/null
+++ b/arch/alpha/boot/compressed/vmlinux.lds.S
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm-generic/vmlinux.lds.h>
+#include <asm/page.h>
+#include <asm/setup.h>
+
+OUTPUT_FORMAT("elf64-alpha")
+OUTPUT_ARCH(alpha)
+ENTRY(__start)
+
+SECTIONS
+{
+	/*
+	 * Link the stub at the address the real, uncompressed vmlinux has
+	 * always occupied. aboot derives the OSF/1 parameter-page
+	 * (ZERO_PGE) and initial stack (INIT_STACK) addresses from the
+	 * loaded image's own p_vaddr, so a stub linked anywhere else would
+	 * hand the real kernel a parameter page it does not expect.
+	 */
+	. = START_ADDR;
+
+	.head.text : {
+		_head = .;
+		HEAD_TEXT
+		_ehead = .;
+	}
+
+	. = ALIGN(8);
+	.rodata.compressed : {
+		*(.rodata.compressed)
+	}
+
+	. = ALIGN(PAGE_SIZE);
+	.text : {
+		_text = .;
+		*(.text)
+		*(.text.*)
+		_etext = .;
+	}
+	. = ALIGN(8);
+	.rodata : {
+		*(.rodata)
+		*(.rodata.*)
+	}
+	. = ALIGN(8);
+	.data : {
+		*(.data)
+		*(.data.*)
+	}
+	.got : {
+		*(.got)
+	}
+	.sdata : {
+		*(.sdata)
+	}
+	/*
+	 * misc.c decompresses to _ebss, so nothing that the stub still
+	 * needs may be placed after .bss. --orphan-handling=warn keeps a
+	 * new section from silently landing there.
+	 */
+	. = ALIGN(8);
+	.bss : {
+		_bss = .;
+		*(.sbss)
+		*(.scommon)
+		*(.bss)
+		*(.bss.*)
+		*(COMMON)
+		. = ALIGN(8);
+		_ebss = .;
+	}
+
+	STABS_DEBUG
+	DWARF_DEBUG
+	ELF_DETAILS
+
+	DISCARDS
+	/DISCARD/ : {
+		*(.eh_frame)
+		*(.modinfo)
+		*(.note)
+		*(.note.*)
+	}
+}
diff --git a/arch/alpha/boot/compressed/vmlinux.scr b/arch/alpha/boot/compressed/vmlinux.scr
new file mode 100644
index 000000000000..dac2d142bcfa
--- /dev/null
+++ b/arch/alpha/boot/compressed/vmlinux.scr
@@ -0,0 +1,10 @@
+SECTIONS
+{
+  .rodata.compressed : {
+	input_len = .;
+	LONG(input_data_end - input_data) input_data = .;
+	*(.data)
+	output_len = . - 4; /* can be at unaligned address */
+	input_data_end = .;
+	}
+}

-- 
2.54.0


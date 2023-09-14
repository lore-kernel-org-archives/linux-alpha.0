From: Sohil Mehta <sohil.mehta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] arch: Reserve map_shadow_stack() syscall number for all architectures
Date: Thu, 14 Sep 2023 18:58:03 +0000
Message-ID: <20230914185804.2000497-1-sohil.mehta@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-api-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694717957; x=1726253957;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pceMbNIsdo4RORvgoEGhTgk0j8EFv/tAosFUlFWx7lE=;
  b=KRZa64vNGU7GPrZL5eEtSty7dzkADcHBrq+ota6glnTMIZKlpR/ckCeh
   oPq5cxmzlayPzd8rMvegfHD7nodniD/gY25EXt8KIqNkRGNVUGGmYDoHJ
   mkwLD7mR01FoqLAazzfk75+srs4sVye4zyrLy3VULmiITrMRGCdbQUWsl
   FrJPWApgqeRse+miUTKvziWyuUlJa8GHbcVLy7D/8jMAHOFS18SE9oNAd
   TTg+FiWaVfJ5DTX5LgrOQt0k1oBY6RS9gp50+lsUe9i0r8ahcDxPGvOkZ
   xEpJz5wdDTmLKRAvwgndzTP0fs4Jj+zUvTZSFYND58eP9Fw9MPMcu7aYF
   w==;
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-api-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sohil Mehta <sohil.mehta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Richard Henderson <richard.henderson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Thomas Bogendoerfer <tsbogend-I1c7kopa9pxLokYuJOExCg@public.gmane.org>, "James E . J . Bottomley" <James.Bottomley-d9PhHud1JfjCXq6kfMZ53/egYHeGw8Jk@public.gmane.org>, Helge Deller <deller-Mmb7MZpHnFY@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Nicholas Piggin <npiggin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christophe Leroy <christophe.leroy-2tlSp11Fh4xulxpn9UvDqw@public.gmane.org>, Heiko Carstens <hca-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Vasily Gorbik <gor-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Alexander Gordeev <agordeev-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Christian

commit c35559f94ebc ("x86/shstk: Introduce map_shadow_stack syscall")
recently added support for map_shadow_stack() but it is limited to x86
only for now. There is a possibility that other architectures (namely,
arm64 and RISC-V), that are implementing equivalent support for shadow
stacks, might need to add support for it.

Independent of that, reserving arch-specific syscall numbers in the
syscall tables of all architectures is good practice and would help
avoid future conflicts. map_shadow_stack() is marked as a conditional
syscall in sys_ni.c. Adding it to the syscall tables of other
architectures is harmless and would return ENOSYS when exercised.

Note, map_shadow_stack() was assigned #453 during the merge process
since #452 was taken by fchmodat2().

For Powerpc, map it to sys_ni_syscall() as is the norm for Powerpc
syscall tables.

For Alpha, map_shadow_stack() takes up #563 as Alpha still diverges from
the common syscall numbering system in the other architectures.

Link: https://lore.kernel.org/lkml/20230515212255.GA562920-Fj+DGH1r1ZPdDInqDg1lI3xStJ4P+DSV@public.gmane.org/
Link: https://lore.kernel.org/lkml/b402b80b-a7c6-4ef0-b977-c0f5f582b78a-GFdadSzt00ze9xe1eoZjHA@public.gmane.org/

Signed-off-by: Sohil Mehta <sohil.mehta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
v2:
- Skip syscall table changes to tools/. They will be handled separetely by the
  perf folks.
- Map Powerpc to sys_ni_syscall (Rick Edgecombe)
---
 arch/alpha/kernel/syscalls/syscall.tbl      | 1 +
 arch/arm/tools/syscall.tbl                  | 1 +
 arch/arm64/include/asm/unistd.h             | 2 +-
 arch/arm64/include/asm/unistd32.h           | 2 ++
 arch/ia64/kernel/syscalls/syscall.tbl       | 1 +
 arch/m68k/kernel/syscalls/syscall.tbl       | 1 +
 arch/microblaze/kernel/syscalls/syscall.tbl | 1 +
 arch/mips/kernel/syscalls/syscall_n32.tbl   | 1 +
 arch/mips/kernel/syscalls/syscall_n64.tbl   | 1 +
 arch/mips/kernel/syscalls/syscall_o32.tbl   | 1 +
 arch/parisc/kernel/syscalls/syscall.tbl     | 1 +
 arch/powerpc/kernel/syscalls/syscall.tbl    | 1 +
 arch/s390/kernel/syscalls/syscall.tbl       | 1 +
 arch/sh/kernel/syscalls/syscall.tbl         | 1 +
 arch/sparc/kernel/syscalls/syscall.tbl      | 1 +
 arch/x86/entry/syscalls/syscall_32.tbl      | 1 +
 arch/xtensa/kernel/syscalls/syscall.tbl     | 1 +
 include/uapi/asm-generic/unistd.h           | 5 ++++-
 18 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index ad37569d0507..6e8479c96e65 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -492,3 +492,4 @@
 560	common	set_mempolicy_home_node		sys_ni_syscall
 561	common	cachestat			sys_cachestat
 562	common	fchmodat2			sys_fchmodat2
+563	common	map_shadow_stack		sys_map_shadow_stack
diff --git a/arch/arm/tools/syscall.tbl b/arch/arm/tools/syscall.tbl
index c572d6c3dee0..6d494dfbf5e4 100644
--- a/arch/arm/tools/syscall.tbl
+++ b/arch/arm/tools/syscall.tbl
@@ -466,3 +466,4 @@
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
 451	common	cachestat			sys_cachestat
 452	common	fchmodat2			sys_fchmodat2
+453	common	map_shadow_stack		sys_map_shadow_stack
diff --git a/arch/arm64/include/asm/unistd.h b/arch/arm64/include/asm/unistd.h
index bd77253b62e0..6a28fb91b85d 100644
--- a/arch/arm64/include/asm/unistd.h
+++ b/arch/arm64/include/asm/unistd.h
@@ -39,7 +39,7 @@
 #define __ARM_NR_compat_set_tls		(__ARM_NR_COMPAT_BASE + 5)
 #define __ARM_NR_COMPAT_END		(__ARM_NR_COMPAT_BASE + 0x800)
 
-#define __NR_compat_syscalls		453
+#define __NR_compat_syscalls		454
 #endif
 
 #define __ARCH_WANT_SYS_CLONE
diff --git a/arch/arm64/include/asm/unistd32.h b/arch/arm64/include/asm/unistd32.h
index 78b68311ec81..a201d842ec82 100644
--- a/arch/arm64/include/asm/unistd32.h
+++ b/arch/arm64/include/asm/unistd32.h
@@ -911,6 +911,8 @@ __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
 __SYSCALL(__NR_cachestat, sys_cachestat)
 #define __NR_fchmodat2 452
 __SYSCALL(__NR_fchmodat2, sys_fchmodat2)
+#define __NR_map_shadow_stack 453
+__SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
 
 /*
  * Please add new compat syscalls above this comment and update
diff --git a/arch/ia64/kernel/syscalls/syscall.tbl b/arch/ia64/kernel/syscalls/syscall.tbl
index 83d8609aec03..be02ce9d376f 100644
--- a/arch/ia64/kernel/syscalls/syscall.tbl
+++ b/arch/ia64/kernel/syscalls/syscall.tbl
@@ -373,3 +373,4 @@
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
 451	common	cachestat			sys_cachestat
 452	common	fchmodat2			sys_fchmodat2
+453	common	map_shadow_stack		sys_map_shadow_stack
diff --git a/arch/m68k/kernel/syscalls/syscall.tbl b/arch/m68k/kernel/syscalls/syscall.tbl
index 259ceb125367..bee2d2f7f82c 100644
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@ -452,3 +452,4 @@
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
 451	common	cachestat			sys_cachestat
 452	common	fchmodat2			sys_fchmodat2
+453	common	map_shadow_stack		sys_map_shadow_stack
diff --git a/arch/microblaze/kernel/syscalls/syscall.tbl b/arch/microblaze/kernel/syscalls/syscall.tbl
index a3798c2637fd..09eda7ed91b0 100644
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@ -458,3 +458,4 @@
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
 451	common	cachestat			sys_cachestat
 452	common	fchmodat2			sys_fchmodat2
+453	common	map_shadow_stack		sys_map_shadow_stack
diff --git a/arch/mips/kernel/syscalls/syscall_n32.tbl b/arch/mips/kernel/syscalls/syscall_n32.tbl
index 152034b8e0a0..3c02cc3886ca 100644
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@ -391,3 +391,4 @@
 450	n32	set_mempolicy_home_node		sys_set_mempolicy_home_node
 451	n32	cachestat			sys_cachestat
 452	n32	fchmodat2			sys_fchmodat2
+453	n32	map_shadow_stack		sys_map_shadow_stack
diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel/syscalls/syscall_n64.tbl
index cb5e757f6621..aa9ed6a7cb48 100644
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@ -367,3 +367,4 @@
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
 451	n64	cachestat			sys_cachestat
 452	n64	fchmodat2			sys_fchmodat2
+453	n64	map_shadow_stack		sys_map_shadow_stack
diff --git a/arch/mips/kernel/syscalls/syscall_o32.tbl b/arch/mips/kernel/syscalls/syscall_o32.tbl
index 1a646813afdc..756f6feb21c2 100644
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@ -440,3 +440,4 @@
 450	o32	set_mempolicy_home_node		sys_set_mempolicy_home_node
 451	o32	cachestat			sys_cachestat
 452	o32	fchmodat2			sys_fchmodat2
+453	o32	map_shadow_stack		sys_map_shadow_stack
diff --git a/arch/parisc/kernel/syscalls/syscall.tbl b/arch/parisc/kernel/syscalls/syscall.tbl
index e97c175b56f9..c80eedbe0170 100644
--- a/arch/parisc/kernel/syscalls/syscall.tbl
+++ b/arch/parisc/kernel/syscalls/syscall.tbl
@@ -451,3 +451,4 @@
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
 451	common	cachestat			sys_cachestat
 452	common	fchmodat2			sys_fchmodat2
+453	common	map_shadow_stack		sys_map_shadow_stack
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index 20e50586e8a2..87a54acf8346 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -539,3 +539,4 @@
 450 	nospu	set_mempolicy_home_node		sys_set_mempolicy_home_node
 451	common	cachestat			sys_cachestat
 452	common	fchmodat2			sys_fchmodat2
+453	common	map_shadow_stack		sys_ni_syscall
diff --git a/arch/s390/kernel/syscalls/syscall.tbl b/arch/s390/kernel/syscalls/syscall.tbl
index 0122cc156952..22249c07e556 100644
--- a/arch/s390/kernel/syscalls/syscall.tbl
+++ b/arch/s390/kernel/syscalls/syscall.tbl
@@ -455,3 +455,4 @@
 450  common	set_mempolicy_home_node	sys_set_mempolicy_home_node	sys_set_mempolicy_home_node
 451  common	cachestat		sys_cachestat			sys_cachestat
 452  common	fchmodat2		sys_fchmodat2			sys_fchmodat2
+453  common	map_shadow_stack	sys_map_shadow_stack		sys_map_shadow_stack
diff --git a/arch/sh/kernel/syscalls/syscall.tbl b/arch/sh/kernel/syscalls/syscall.tbl
index e90d585c4d3e..5ccfe6fbb6b1 100644
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@ -455,3 +455,4 @@
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
 451	common	cachestat			sys_cachestat
 452	common	fchmodat2			sys_fchmodat2
+453	common	map_shadow_stack		sys_map_shadow_stack
diff --git a/arch/sparc/kernel/syscalls/syscall.tbl b/arch/sparc/kernel/syscalls/syscall.tbl
index 4ed06c71c43f..b2d664edebdd 100644
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@ -498,3 +498,4 @@
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
 451	common	cachestat			sys_cachestat
 452	common	fchmodat2			sys_fchmodat2
+453	common	map_shadow_stack		sys_map_shadow_stack
diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscalls/syscall_32.tbl
index 2d0b1bd866ea..743a7ef5a4b9 100644
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@ -457,3 +457,4 @@
 450	i386	set_mempolicy_home_node		sys_set_mempolicy_home_node
 451	i386	cachestat		sys_cachestat
 452	i386	fchmodat2		sys_fchmodat2
+453	i386	map_shadow_stack	sys_map_shadow_stack
diff --git a/arch/xtensa/kernel/syscalls/syscall.tbl b/arch/xtensa/kernel/syscalls/syscall.tbl
index fc1a4f3c81d9..94e6bcc2bec7 100644
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@ -423,3 +423,4 @@
 450	common	set_mempolicy_home_node		sys_set_mempolicy_home_node
 451	common	cachestat			sys_cachestat
 452	common	fchmodat2			sys_fchmodat2
+453	common	map_shadow_stack		sys_map_shadow_stack
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index abe087c53b4b..203ae30d7761 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -823,8 +823,11 @@ __SYSCALL(__NR_cachestat, sys_cachestat)
 #define __NR_fchmodat2 452
 __SYSCALL(__NR_fchmodat2, sys_fchmodat2)
 
+#define __NR_map_shadow_stack 453
+__SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
+
 #undef __NR_syscalls
-#define __NR_syscalls 453
+#define __NR_syscalls 454
 
 /*
  * 32 bit systems traditionally used different
-- 
2.34.1


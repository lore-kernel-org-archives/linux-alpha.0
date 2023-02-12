From: Mike Rapoport <rppt@kernel.org>
Subject: [PATCH 2/2] char/agp: introduce asm-generic/agp.h
Date: Sun, 12 Feb 2023 10:46:11 +0200
Message-ID: <20230212084611.1311177-3-rppt@kernel.org>
References: <20230212084611.1311177-1-rppt@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676191595;
        bh=fNKiSkZ0o+fOQDkH9eY0UIJa/qeemlNg5a9Sbw7z4oc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JUVV+chRkL08PzBAHoMlpmcJa2IhpSQwAz96rwplIsxNTcOagjdz1FjKgKIZm9Xz7
         4pv6hHt7b9nmaV+hF833gn5hNvsDucwwTXlMhpuMzThGhvVuFGMqBA2B5yRqwzl9KX
         2Wc43Xj/4Yfdsa0SIH7Q5qUXhOFTLhOk1YBgVMXYGMKSEd71o/EYsAImLe9oH0tXo8
         IToPWVX6nfL1eBM61cT0MPNI30pgAm15llCo3a4+ZAa7MfdSDZzLkYkYfIFt92bOZ2
         SPXfPRn2/UPxDP60AHCYuVhKHfGgEbsnHoBn/wXC8LSi6TGrRpBsT6yHBMhlRtOwBk
         OSNHjjVZwDwtw==
In-Reply-To: <20230212084611.1311177-1-rppt@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Airlie <airlied@redhat.com>, "David S. Miller" <davem@davemloft.net>, Helge Deller <deller@gmx.de>, Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, dri-devel@lists.freedesktop.org, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, "Mike Rapoport (IBM)" <rppt@kernel.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

There are several architectures that duplicate definitions of
map_page_into_agp(), unmap_page_from_agp() and flush_agp_cache().

Define those in asm-generic/agp.h and use it instead of duplicated
per-architecture headers.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/alpha/include/asm/Kbuild                 |  1 +
 arch/alpha/include/asm/agp.h                  | 13 ------------
 arch/ia64/include/asm/Kbuild                  |  1 +
 arch/ia64/include/asm/agp.h                   | 21 -------------------
 arch/parisc/include/asm/Kbuild                |  1 +
 arch/parisc/include/asm/agp.h                 | 15 -------------
 arch/powerpc/include/asm/Kbuild               |  1 +
 arch/sparc/include/asm/Kbuild                 |  1 +
 arch/sparc/include/asm/agp.h                  | 11 ----------
 .../include/asm => include/asm-generic}/agp.h |  8 +++----
 10 files changed, 8 insertions(+), 65 deletions(-)
 delete mode 100644 arch/alpha/include/asm/agp.h
 delete mode 100644 arch/ia64/include/asm/agp.h
 delete mode 100644 arch/parisc/include/asm/agp.h
 delete mode 100644 arch/sparc/include/asm/agp.h
 rename {arch/powerpc/include/asm => include/asm-generic}/agp.h (59%)

diff --git a/arch/alpha/include/asm/Kbuild b/arch/alpha/include/asm/Kbuild
index 42911c8340c7..54f5126628c6 100644
--- a/arch/alpha/include/asm/Kbuild
+++ b/arch/alpha/include/asm/Kbuild
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 generated-y += syscall_table.h
+generic-y += agp.h
 generic-y += export.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
diff --git a/arch/alpha/include/asm/agp.h b/arch/alpha/include/asm/agp.h
deleted file mode 100644
index 4197b3bc78ee..000000000000
--- a/arch/alpha/include/asm/agp.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef AGP_H
-#define AGP_H 1
-
-#include <asm/io.h>
-
-/* dummy for now */
-
-#define map_page_into_agp(page)		do { } while (0)
-#define unmap_page_from_agp(page)	do { } while (0)
-#define flush_agp_cache() mb()
-
-#endif
diff --git a/arch/ia64/include/asm/Kbuild b/arch/ia64/include/asm/Kbuild
index f994c1daf9d4..aefae2efde9f 100644
--- a/arch/ia64/include/asm/Kbuild
+++ b/arch/ia64/include/asm/Kbuild
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 generated-y += syscall_table.h
+generic-y += agp.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
 generic-y += vtime.h
diff --git a/arch/ia64/include/asm/agp.h b/arch/ia64/include/asm/agp.h
deleted file mode 100644
index f42c7dcb3d79..000000000000
--- a/arch/ia64/include/asm/agp.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_IA64_AGP_H
-#define _ASM_IA64_AGP_H
-
-/*
- * IA-64 specific AGP definitions.
- *
- * Copyright (C) 2002-2003 Hewlett-Packard Co
- *	David Mosberger-Tang <davidm@hpl.hp.com>
- */
-
-/*
- * To avoid memory-attribute aliasing issues, we require that the AGPGART engine operate
- * in coherent mode, which lets us map the AGP memory as normal (write-back) memory
- * (unlike x86, where it gets mapped "write-coalescing").
- */
-#define map_page_into_agp(page)		do { } while (0)
-#define unmap_page_from_agp(page)	do { } while (0)
-#define flush_agp_cache()		mb()
-
-#endif /* _ASM_IA64_AGP_H */
diff --git a/arch/parisc/include/asm/Kbuild b/arch/parisc/include/asm/Kbuild
index e6e7f74c8ac9..4fb596d94c89 100644
--- a/arch/parisc/include/asm/Kbuild
+++ b/arch/parisc/include/asm/Kbuild
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 generated-y += syscall_table_32.h
 generated-y += syscall_table_64.h
+generic-y += agp.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
 generic-y += user.h
diff --git a/arch/parisc/include/asm/agp.h b/arch/parisc/include/asm/agp.h
deleted file mode 100644
index d193a48490e2..000000000000
--- a/arch/parisc/include/asm/agp.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_PARISC_AGP_H
-#define _ASM_PARISC_AGP_H
-
-/*
- * PARISC specific AGP definitions.
- * Copyright (c) 2006 Kyle McMartin <kyle@parisc-linux.org>
- *
- */
-
-#define map_page_into_agp(page)		do { } while (0)
-#define unmap_page_from_agp(page)	do { } while (0)
-#define flush_agp_cache()		mb()
-
-#endif /* _ASM_PARISC_AGP_H */
diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
index bcf95ce0964f..419319c4963c 100644
--- a/arch/powerpc/include/asm/Kbuild
+++ b/arch/powerpc/include/asm/Kbuild
@@ -2,6 +2,7 @@
 generated-y += syscall_table_32.h
 generated-y += syscall_table_64.h
 generated-y += syscall_table_spu.h
+generic-y += agp.h
 generic-y += export.h
 generic-y += kvm_types.h
 generic-y += mcs_spinlock.h
diff --git a/arch/sparc/include/asm/Kbuild b/arch/sparc/include/asm/Kbuild
index 0b9d98ced34a..595ca0be286b 100644
--- a/arch/sparc/include/asm/Kbuild
+++ b/arch/sparc/include/asm/Kbuild
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 generated-y += syscall_table_32.h
 generated-y += syscall_table_64.h
+generic-y += agp.h
 generic-y += export.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
diff --git a/arch/sparc/include/asm/agp.h b/arch/sparc/include/asm/agp.h
deleted file mode 100644
index 5186924fa673..000000000000
--- a/arch/sparc/include/asm/agp.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef AGP_H
-#define AGP_H 1
-
-/* dummy for now */
-
-#define map_page_into_agp(page)		do { } while (0)
-#define unmap_page_from_agp(page)	do { } while (0)
-#define flush_agp_cache()		mb()

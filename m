From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] alpha: syscalls: switch to generic syscalltbl.sh
Date: Mon,  1 Mar 2021 23:18:25 +0900
Message-ID: <20210301141827.342315-1-masahiroy@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 121EIV2v001499
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614608311;
        bh=havbgPvxshsn+072GB8NK8K1m7iwCxNAcFrkfBfXWY4=;
        h=From:To:Cc:Subject:Date:From;
        b=gDMQoaqK0DpoCOlBJz3CeCbbs7qMtYiGR3BH+sIllGTjNPpTNQPU7O0JPkYaOKCKI
         h097H7ytbWOC9irOc/65jUT97YOFrNudUenwkqOnmESr29YdjrdHXwDzXLBTua7SaP
         QDBbyx0dykj68ILUgmt12v3EUC+ldjV1Um1gQAyDdmI9fdlEl+OEBiIFY+HqCPRKgZ
         l2w1ofl79JK1md/mL6PM80bf40L7N4aRjtZTcMKY6HXnqwjcV1vVvUuXwfol9XKvVz
         a1TJlyuAS9KLdOl/tGkBZPWVfEFfdWp0TDvLQQJA5YQFG2BCJWNYPJAJDGWmmF8+cx
         ApACa1QbAZzFw==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Many architectures duplicate similar shell scripts.

This commit converts alpha to use scripts/syscalltbl.sh.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/alpha/kernel/syscalls/Makefile      |  7 ++----
 arch/alpha/kernel/syscalls/syscalltbl.sh | 32 ------------------------
 arch/alpha/kernel/systbls.S              |  3 +--
 3 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 arch/alpha/kernel/syscalls/syscalltbl.sh

diff --git a/arch/alpha/kernel/syscalls/Makefile b/arch/alpha/kernel/syscalls/Makefile
index 285aaba832d9..ad2492cb5568 100644
--- a/arch/alpha/kernel/syscalls/Makefile
+++ b/arch/alpha/kernel/syscalls/Makefile
@@ -7,7 +7,7 @@ _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 
 syscall := $(src)/syscall.tbl
 syshdr := $(srctree)/$(src)/syscallhdr.sh
-systbl := $(srctree)/$(src)/syscalltbl.sh
+systbl := $(srctree)/scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) '$(syshdr)' '$<' '$@'	\
@@ -16,10 +16,7 @@ quiet_cmd_syshdr = SYSHDR  $@
 		   '$(syshdr_offset_$(basetarget))'
 
 quiet_cmd_systbl = SYSTBL  $@
-      cmd_systbl = $(CONFIG_SHELL) '$(systbl)' '$<' '$@'	\
-		   '$(systbl_abis_$(basetarget))'		\
-		   '$(systbl_abi_$(basetarget))'		\
-		   '$(systbl_offset_$(basetarget))'
+      cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
 
 $(uapi)/unistd_32.h: $(syscall) $(syshdr) FORCE
 	$(call if_changed,syshdr)
diff --git a/arch/alpha/kernel/syscalls/syscalltbl.sh b/arch/alpha/kernel/syscalls/syscalltbl.sh
deleted file mode 100644
index 85d78d9309ad..000000000000
--- a/arch/alpha/kernel/syscalls/syscalltbl.sh
+++ /dev/null
@@ -1,32 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-in="$1"
-out="$2"
-my_abis=`echo "($3)" | tr ',' '|'`
-my_abi="$4"
-offset="$5"
-
-emit() {
-	t_nxt="$1"
-	t_nr="$2"
-	t_entry="$3"
-
-	while [ $t_nxt -lt $t_nr ]; do
-		printf "__SYSCALL(%s, sys_ni_syscall, )\n" "${t_nxt}"
-		t_nxt=$((t_nxt+1))
-	done
-	printf "__SYSCALL(%s, %s, )\n" "${t_nxt}" "${t_entry}"
-}
-
-grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
-	nxt=0
-	if [ -z "$offset" ]; then
-		offset=0
-	fi
-
-	while read nr abi name entry ; do
-		emit $((nxt+offset)) $((nr+offset)) $entry
-		nxt=$((nr+1))
-	done
-) > "$out"
diff --git a/arch/alpha/kernel/systbls.S b/arch/alpha/kernel/systbls.S
index 9704f22ed5e3..68f3e4f329eb 100644
--- a/arch/alpha/kernel/systbls.S
+++ b/arch/alpha/kernel/systbls.S
@@ -7,10 +7,9 @@
 
 #include <asm/unistd.h>
 
-#define __SYSCALL(nr, entry, nargs) .quad entry
+#define __SYSCALL(nr, entry) .quad entry
 	.data
 	.align 3
 	.globl sys_call_table
 sys_call_table:
 #include <asm/syscall_table.h>
-#undef __SYSCALL
-- 
2.27.0


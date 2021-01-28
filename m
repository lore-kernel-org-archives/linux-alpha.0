From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 10/27] ia64: syscalls: switch to generic syscalltbl.sh
Date: Thu, 28 Jan 2021 09:50:52 +0900
Message-ID: <20210128005110.2613902-11-masahiroy@kernel.org>
References: <20210128005110.2613902-1-masahiroy@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6TfY3l209rkJ62UP2uGwBcQmQLC+VYTtadFJiq8JJ+k=; b=nOE423y01iqF+SsW53uTsItFo
	IfTjTu/mw6gvdSy8ybo9xygka0eS9GwWI2LKAdX4eVe0vWUtGs+RdadeF4ZjKvBcrbCq+gEHBwcqF
	0tWWjZiz+RRaixK/QCt8Wc5l80vZAqWLT6zUBXpyiNzpMG+c9bFbKWM09OZhNs9fKDJq0LY/2Y8sI
	EzbrXSq8gZX8CKclD+b/Zm9QpxEd4ARYEQxYSoqEMe6VtRjt9vBJHdr38G6fUn3jCWwsfJUDLnRKC
	GehEsPmDNA/R0AVfhS6uLZkuMLwRCETstTvnj3IxDLBaLQst06NVvtdfq5oEGQkNgvE+dzLx0NPRq
	p80Co1K2w==;
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10S0pjIf024172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611795119;
 bh=rBLp71LtjpuuJPTZfY8wyXr/eNgPWxVdIzAA/RbYs94=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ncmaBvIdvqCtN37U8UilCIrLG5daIG+MpFyR0DOzscMmQhXASvCj2Ve/Y+J+efscl
 wknNeFIzr8RuBoBmpcuEDisXwXqK8AKVkge6et4MSslEx8cU26I9R56kxfyT8K+TJm
 BX2rBEuM64LRbu6Nb70V2XfOX5OUqnyDJo6L0ibHK/kvaocSMuYTM14N5gpssXYPFd
 DKXhpUuqI05Jv+mwacNLSA1T3ioDONJ7L5x4bPukIbs4kFMhHw47qBhwreq0jyWw9R
 m1G3adstD3R/OymtgbTjouC66AUUW64KI6eYXlvQgpfIH7bCEBXfv6Ei4GI7ZiK2oB
 BzKWztL08/vFQ==
In-Reply-To: <20210128005110.2613902-1-masahiroy@kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: linux-arch@vger.kernel.org, x86@kernel.org
Cc: linux-xtensa@linux-xtensa.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org

As of v5.11-rc1, 12 architectures duplicate similar shell scripts in
order to generate syscall table headers. My goal is to unify them into
the single scripts/syscalltbl.sh.

This commit converts ia64 to use scripts/syscalltbl.sh.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/ia64/kernel/entry.S                |  3 +--
 arch/ia64/kernel/syscalls/Makefile      |  8 ++-----
 arch/ia64/kernel/syscalls/syscalltbl.sh | 32 -------------------------
 3 files changed, 3 insertions(+), 40 deletions(-)
 delete mode 100644 arch/ia64/kernel/syscalls/syscalltbl.sh

diff --git a/arch/ia64/kernel/entry.S b/arch/ia64/kernel/entry.S
index e98e3dafffd8..5eba3fb2e311 100644
--- a/arch/ia64/kernel/entry.S
+++ b/arch/ia64/kernel/entry.S
@@ -1420,10 +1420,9 @@ END(ftrace_stub)
 
 #endif /* CONFIG_FUNCTION_TRACER */
 
-#define __SYSCALL(nr, entry, nargs) data8 entry
+#define __SYSCALL(nr, entry) data8 entry
 	.rodata
 	.align 8
 	.globl sys_call_table
 sys_call_table:
 #include <asm/syscall_table.h>
-#undef __SYSCALL
diff --git a/arch/ia64/kernel/syscalls/Makefile b/arch/ia64/kernel/syscalls/Makefile
index b9bfd186295f..3f7e0bfae7e3 100644
--- a/arch/ia64/kernel/syscalls/Makefile
+++ b/arch/ia64/kernel/syscalls/Makefile
@@ -7,7 +7,7 @@ _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
 
 syscall := $(srctree)/$(src)/syscall.tbl
 syshdr := $(srctree)/$(src)/syscallhdr.sh
-systbl := $(srctree)/$(src)/syscalltbl.sh
+systbl := $(srctree)/scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) '$(syshdr)' '$<' '$@'	\
@@ -16,16 +16,12 @@ quiet_cmd_syshdr = SYSHDR  $@
 		   '$(syshdr_offset_$(basetarget))'
 
 quiet_cmd_systbl = SYSTBL  $@
-      cmd_systbl = $(CONFIG_SHELL) '$(systbl)' '$<' '$@'	\
-		   '$(systbl_abis_$(basetarget))'		\
-		   '$(systbl_abi_$(basetarget))'		\
-		   '$(systbl_offset_$(basetarget))'
+      cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@ "" 1024
 
 syshdr_offset_unistd_64 := __NR_Linux
 $(uapi)/unistd_64.h: $(syscall) $(syshdr) FORCE
 	$(call if_changed,syshdr)
 
-systbl_offset_syscall_table := 1024
 $(kapi)/syscall_table.h: $(syscall) $(systbl) FORCE
 	$(call if_changed,systbl)
 
diff --git a/arch/ia64/kernel/syscalls/syscalltbl.sh b/arch/ia64/kernel/syscalls/syscalltbl.sh
deleted file mode 100644
index 85d78d9309ad..000000000000
--- a/arch/ia64/kernel/syscalls/syscalltbl.sh
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
-- 
2.27.0

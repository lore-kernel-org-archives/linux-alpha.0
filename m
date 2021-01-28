From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 18/27] parisc: syscalls: switch to generic syscalltbl.sh
Date: Thu, 28 Jan 2021 19:53:31 +0100
Message-ID: <4f998691-73be-5bef-ecdb-d17b94110859@gmx.de>
References: <20210128005110.2613902-1-masahiroy@kernel.org>
 <20210128005110.2613902-19-masahiroy@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ChVHaUh5Rxz4B35Wxb0xXypmeTSJMkUqlx+P0p58pXo=; b=AoFh1YXdv6HWXnthNZTEPAuu3
	NHkoNH9hlnn0VEvYEqGwOFN2FD/v9L8Oz6Gwzfi0kxNnn85gzHWAc97qB5XGkwNNClkiyJ1P1nGvK
	62DxxFL0pEHmoPxSGXU6ywE17Qy3bF7H2qgxui2QoWILJu1MTM7Iau0NjsDIiuOnBVcwzhiMFMzQW
	auFszElZ8GLf3Tgi49iNXZVyH64KaV79ybQIJ72C2i++FOZk7yMwRCvvs4xVBxnNq51qdCT0qCP2B
	mbEfxdiTQjc10SjK8bP3hon1O4qiqcI9Flzxyn8QulQCuVCOZD2rykOeJ7sKRbXDrfghyYsQcYKqJ
	R9pN4ldPQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=ozMrDhGzjUhaIIWK38ppANxNj8OggMZ1a+YSsl8UpvA=; b=S2KSNh7bfRCrHNKh9TeJPA7+2M
 ppXMw+NiNgtKnAC6BPLzVwI1EZ9lOJcobkd8ITj9UrnoqRqnnYmBuNefEazIJ79mF5lh+jhtFdxqF
 wlMmYsdupz4MC9k9jmcad9SNPxv8WQ5wVQ7cy9m6UC6cey8DaAy9yyEd0fIZqS6MxTppc03O98HeX
 QE2WCzX/zkdsYDAlE1aRaKa+p/562ZXxMZBwlMpXM5Oy3mWteLVJnVxAkIUikGBYfMUp6tN25oDZ5
 /UpPlqTB2sxjJt/f3sONiDCOCQOi0OtoknH/yhdYOZlbLcCazDarlZpy41o3H7fw3SIWj/sJey38z
 59zg7LRw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1611860013;
 bh=zvfoTxB/oWZawXpH0SRm5ZKqx8FIDouPHHwj+K25VOQ=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=RnjVDwdfP0qwCoQ9h5j13OQTY8iR11zNH8HqYPjh65RAIaoBUZLVg4G9A8zZipXWH
 ujO3pYQ5FsKNBF8t97S7mOwf7lbSgnu4XnPYRE2Bwkeke+VvT5QrNMvGKjEFh/l100
 A3DOp/DxAd636wFGv1z9xk7UXxIUjPHJudv0cPMY=
In-Reply-To: <20210128005110.2613902-19-masahiroy@kernel.org>
Content-Language: en-US
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
To: Masahiro Yamada <masahiroy@kernel.org>, linux-arch@vger.kernel.org, x86@kernel.org
Cc: linux-xtensa@linux-xtensa.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org

On 1/28/21 1:51 AM, Masahiro Yamada wrote:
> As of v5.11-rc1, 12 architectures duplicate similar shell scripts in
> order to generate syscall table headers. My goal is to unify them into
> the single scripts/syscalltbl.sh.
>
> This commit converts parisc to use scripts/syscalltbl.sh. This also
> unifies syscall_table_64.h and syscall_table_c32.h.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the cleanup!

You may add:
Acked-by: Helge Deller <deller@gmx.de> # parisc

Helge

> ---
>
>  arch/parisc/include/asm/Kbuild            |  1 -
>  arch/parisc/kernel/syscall.S              | 16 +++++-----
>  arch/parisc/kernel/syscalls/Makefile      | 19 ++++--------
>  arch/parisc/kernel/syscalls/syscalltbl.sh | 36 -----------------------
>  4 files changed, 12 insertions(+), 60 deletions(-)
>  delete mode 100644 arch/parisc/kernel/syscalls/syscalltbl.sh
>
> diff --git a/arch/parisc/include/asm/Kbuild b/arch/parisc/include/asm/Kbuild
> index 4406475a2304..e6e7f74c8ac9 100644
> --- a/arch/parisc/include/asm/Kbuild
> +++ b/arch/parisc/include/asm/Kbuild
> @@ -1,7 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  generated-y += syscall_table_32.h
>  generated-y += syscall_table_64.h
> -generated-y += syscall_table_c32.h
>  generic-y += kvm_para.h
>  generic-y += mcs_spinlock.h
>  generic-y += user.h
> diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
> index 322503780db6..3f24a0af1e04 100644
> --- a/arch/parisc/kernel/syscall.S
> +++ b/arch/parisc/kernel/syscall.S
> @@ -919,24 +919,24 @@ ENTRY(lws_table)
>  END(lws_table)
>  	/* End of lws table */
>
> +#ifdef CONFIG_64BIT
> +#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
> +#else
> +#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
> +#endif
>  #define __SYSCALL(nr, entry)	ASM_ULONG_INSN entry
>  	.align 8
>  ENTRY(sys_call_table)
>  	.export sys_call_table,data
> -#ifdef CONFIG_64BIT
> -#include <asm/syscall_table_c32.h>   /* Compat syscalls */
> -#else
> -#include <asm/syscall_table_32.h>    /* 32-bit native syscalls */
> -#endif
> +#include <asm/syscall_table_32.h>    /* 32-bit syscalls */
>  END(sys_call_table)
>
>  #ifdef CONFIG_64BIT
>  	.align 8
>  ENTRY(sys_call_table64)
> -#include <asm/syscall_table_64.h>    /* 64-bit native syscalls */
> +#include <asm/syscall_table_64.h>    /* 64-bit syscalls */
>  END(sys_call_table64)
>  #endif
> -#undef __SYSCALL
>
>  	/*
>  		All light-weight-syscall atomic operations
> @@ -961,5 +961,3 @@ END(lws_lock_start)
>  	.previous
>
>  .end
> -
> -
> diff --git a/arch/parisc/kernel/syscalls/Makefile b/arch/parisc/kernel/syscalls/Makefile
> index 556fe30a6c8f..77fea5beb9be 100644
> --- a/arch/parisc/kernel/syscalls/Makefile
> +++ b/arch/parisc/kernel/syscalls/Makefile
> @@ -7,7 +7,7 @@ _dummy := $(shell [ -d '$(uapi)' ] || mkdir -p '$(uapi)')	\
>
>  syscall := $(srctree)/$(src)/syscall.tbl
>  syshdr := $(srctree)/$(src)/syscallhdr.sh
> -systbl := $(srctree)/$(src)/syscalltbl.sh
> +systbl := $(srctree)/scripts/syscalltbl.sh
>
>  quiet_cmd_syshdr = SYSHDR  $@
>        cmd_syshdr = $(CONFIG_SHELL) '$(syshdr)' '$<' '$@'	\
> @@ -16,10 +16,7 @@ quiet_cmd_syshdr = SYSHDR  $@
>  		   '$(syshdr_offset_$(basetarget))'
>
>  quiet_cmd_systbl = SYSTBL  $@
> -      cmd_systbl = $(CONFIG_SHELL) '$(systbl)' '$<' '$@'	\
> -		   '$(systbl_abis_$(basetarget))'		\
> -		   '$(systbl_abi_$(basetarget))'		\
> -		   '$(systbl_offset_$(basetarget))'
> +      cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@ $(abis)
>
>  syshdr_abis_unistd_32 := common,32
>  $(uapi)/unistd_32.h: $(syscall) $(syshdr) FORCE
> @@ -29,23 +26,17 @@ syshdr_abis_unistd_64 := common,64
>  $(uapi)/unistd_64.h: $(syscall) $(syshdr) FORCE
>  	$(call if_changed,syshdr)
>
> -systbl_abis_syscall_table_32 := common,32
> +$(kapi)/syscall_table_32.h: abis := common,32
>  $(kapi)/syscall_table_32.h: $(syscall) $(systbl) FORCE
>  	$(call if_changed,systbl)
>
> -systbl_abis_syscall_table_64 := common,64
> +$(kapi)/syscall_table_64.h: abis := common,64
>  $(kapi)/syscall_table_64.h: $(syscall) $(systbl) FORCE
>  	$(call if_changed,systbl)
>
> -systbl_abis_syscall_table_c32 := common,32
> -systbl_abi_syscall_table_c32 := c32
> -$(kapi)/syscall_table_c32.h: $(syscall) $(systbl) FORCE
> -	$(call if_changed,systbl)
> -
>  uapisyshdr-y		+= unistd_32.h unistd_64.h
>  kapisyshdr-y		+= syscall_table_32.h		\
> -			   syscall_table_64.h		\
> -			   syscall_table_c32.h
> +			   syscall_table_64.h
>
>  uapisyshdr-y	:= $(addprefix $(uapi)/, $(uapisyshdr-y))
>  kapisyshdr-y	:= $(addprefix $(kapi)/, $(kapisyshdr-y))
> diff --git a/arch/parisc/kernel/syscalls/syscalltbl.sh b/arch/parisc/kernel/syscalls/syscalltbl.sh
> deleted file mode 100644
> index f7393a7b18aa..000000000000
> --- a/arch/parisc/kernel/syscalls/syscalltbl.sh
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -#!/bin/sh
> -# SPDX-License-Identifier: GPL-2.0
> -
> -in="$1"
> -out="$2"
> -my_abis=`echo "($3)" | tr ',' '|'`
> -my_abi="$4"
> -offset="$5"
> -
> -emit() {
> -	t_nxt="$1"
> -	t_nr="$2"
> -	t_entry="$3"
> -
> -	while [ $t_nxt -lt $t_nr ]; do
> -		printf "__SYSCALL(%s,sys_ni_syscall)\n" "${t_nxt}"
> -		t_nxt=$((t_nxt+1))
> -	done
> -	printf "__SYSCALL(%s,%s)\n" "${t_nxt}" "${t_entry}"
> -}
> -
> -grep -E "^[0-9A-Fa-fXx]+[[:space:]]+${my_abis}" "$in" | sort -n | (
> -	nxt=0
> -	if [ -z "$offset" ]; then
> -		offset=0
> -	fi
> -
> -	while read nr abi name entry compat ; do
> -		if [ "$my_abi" = "c32" ] && [ ! -z "$compat" ]; then
> -			emit $((nxt+offset)) $((nr+offset)) $compat
> -		else
> -			emit $((nxt+offset)) $((nr+offset)) $entry
> -		fi
> -		nxt=$((nr+1))
> -	done
> -) > "$out"
>

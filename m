From: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 01/27] scripts: add generic syscalltbl.sh
Date: Thu, 28 Jan 2021 10:01:50 +0900
Message-ID: <CAK7LNASxQkX9R3g+r2mwKGE11oFLkNVPwsTezgHFzLgHjzcjdw@mail.gmail.com>
References: <20210128005110.2613902-1-masahiroy@kernel.org>
 <20210128005110.2613902-2-masahiroy@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zpJblI7XeHC0fFmBpTwI4FTaWRlNTdluZ9Xs31jqL1w=; b=HqJvLt/uqQaO2GPfQcoNUn+8K
	tjizSrZKkYdiql5gGW+grzmX5JSX3yCob6xsEHgpDvYs7ZlnOpChaHyFZE+Nwo2PRQqLHeH6SI8xd
	SpwFvMFVmSm/CrAgrN8rf0Jvz41+ZCA7Q99UR31a1PfsOApKUOhj0iwjLyDT41IxAMqwc0dEjrQiN
	A9yCAkik3tZu76z7bYSu2v/XV+AZOybrbYHiLiNGvdkfIfiSwmSrHUA8QTEsmIoxNHvtvuMLTHusT
	2epOUHsUvB0nik40Hs/vaT4Mjrq3FcbXqyln+snhbygHsSZDAn4Ab3hQXAccB6cb+e1rUedpHXC4w
	b2i0NvzYA==;
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 10S12Tb7022947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611795750;
 bh=kQBsC8DD1I5pmWkAr2jPmQQNw1PckPFdZPVIdpQVYdo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X2YfGmKV6JyqV6skhwNlBN5EndPUYjWcNkOTo404Y6vE/VjuzQzR3Hwre1o9jMX7P
 t3pE8Eb/agEN1+SaB5WdhX3qLWKgeotk+EENxzm+2r79cEMgEquohGT/DZdc81+USy
 n577YnXPqvQTSLbcIfGIwlXir96y4XYna6GbZ8JMehDKy3q1du6FKs+xB6Ee7gryFW
 8fZJW0K2rhzEg2LE1IdBsw1wzN8ed4VgNVCiOpTvAQkAVq2uvVboz8HiD/Bu/u7vRJ
 Dx8w8fXdYSaprH/rcXQNKd/WA9Z42fXEQaKNyPcCBPduv5pMUUnZ/FcS8rZF2bdrdk
 Arf+3kYeRwbDg==
In-Reply-To: <20210128005110.2613902-2-masahiroy@kernel.org>
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
To: linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>
Cc: "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, linux-um@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>, linux-alpha@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On Thu, Jan 28, 2021 at 9:51 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Most of architectures generate syscall headers at the compile time
> in the almost same way.
>
> The syscall table has the same format for all architectures. Each line
> has 3, 4 or 5 fields; syscall number, ABI, syscall name, native entry
> point, and compat entry point. The syscall table is processed by
> syscalltbl.sh script into header files.
>
> Despite the same pattern, scripts are maintained per architecture,
> which results in code duplication and bad maintainability.
>
> As of v5.11-rc1, 12 architectures duplicate similar shell scripts:
>
>   $ find arch -name syscalltbl.sh | sort
>   arch/alpha/kernel/syscalls/syscalltbl.sh
>   arch/arm/tools/syscalltbl.sh
>   arch/ia64/kernel/syscalls/syscalltbl.sh
>   arch/m68k/kernel/syscalls/syscalltbl.sh
>   arch/microblaze/kernel/syscalls/syscalltbl.sh
>   arch/mips/kernel/syscalls/syscalltbl.sh
>   arch/parisc/kernel/syscalls/syscalltbl.sh
>   arch/powerpc/kernel/syscalls/syscalltbl.sh
>   arch/sh/kernel/syscalls/syscalltbl.sh
>   arch/sparc/kernel/syscalls/syscalltbl.sh
>   arch/x86/entry/syscalls/syscalltbl.sh
>   arch/xtensa/kernel/syscalls/syscalltbl.sh
>
> My goal is to unify them into a single file, scripts/syscalltbl.sh.
>
> For example, the i386 syscall table looks like this:
>
>   0  i386  restart_syscall  sys_restart_syscall
>   1  i386  exit             sys_exit
>   2  i386  fork             sys_fork
>   3  i386  read             sys_read
>   4  i386  write            sys_write
>   5  i386  open             sys_open              compat_sys_open
>   ...
>
> scripts/syscalltbl.sh generates the following code:
>
>   __SYSCALL(0, sys_restart_syscall)
>   __SYSCALL(1, sys_exit)
>   __SYSCALL(2, sys_fork)
>   __SYSCALL(3, sys_read)
>   __SYSCALL(4, sys_write)
>   __SYSCALL_WITH_COMPAT(5, sys_open, compat_sys_open)
>   ...
>
> Then, the i386 kernel will do:
>
>   #define __SYSCALL_WITH_COMPAT(nr, native, compat) __SYSCALL(nr, native)
>
> and the x86_64 kernel will do:
>
>   #define __SYSCALL_WITH_COMPAT(nr, native, compat) __SYSCALL(nr, compat)
>
> I noticed all 32/64 bit architectures can be covered by the same
> pattern. Having an arch-specific script is fine if there is a good
> reason to do so, but a single generic script should work for this case.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/syscalltbl.sh | 52 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 scripts/syscalltbl.sh
>
> diff --git a/scripts/syscalltbl.sh b/scripts/syscalltbl.sh
> new file mode 100644
> index 000000000000..15bf4e09f88c
> --- /dev/null
> +++ b/scripts/syscalltbl.sh
> @@ -0,0 +1,52 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Usage:
> +#  scripts/syscalltbl.sh INFILE OUTFILE [ABIS] [OFFSET]
> +#
> +# INFILE: input syscall table
> +# OUTFILE: output file
> +# ABIS (optional): specify the ABIs to handle.
> +#                  If omitted, all lines are handled.
> +# OFFSET (optinal): spefify the offset of the syscall numbers.
> +#                   If omitted, the offset is zero.
> +#
> +# The syscall table format:
> +# nr abi name native [compat]


This line should be

 nr abi name [native] [compat]


because the native entry point is also optional.
(if it is missing, sys_ni_syscall is used)




> +#
> +# nr: syscall number
> +# abi: ABI name
> +# name: syscall name
> +# native: native entry point

native (optional): native entry point


> +# compat (optional): compat entry point
> +
> +set -e
> +
> +in="$1"
> +out="$2"
> +abis=$(echo "($3)" | tr ',' '|')
> +offset="${4:-0}"
> +
> +nxt=$offset
> +
> +grep -E "^[0-9]+[[:space:]]+${abis}" "$in" | sort -n | {
> +
> +       while read nr abi name native compat ; do
> +
> +               nr=$((nr + $offset))
> +
> +               while [ $nxt -lt $nr ]; do
> +                       echo "__SYSCALL($nxt, sys_ni_syscall)"
> +                       nxt=$((nxt + 1))
> +               done
> +
> +               if [ -n "$compat" ]; then
> +                       echo "__SYSCALL_WITH_COMPAT($nr, $native, $compat)"
> +               elif [ -n "$native" ]; then
> +                       echo "__SYSCALL($nr, $native)"
> +               else
> +                       echo "__SYSCALL($nr, sys_ni_syscall)"
> +               fi
> +               nxt=$((nr + 1))
> +       done
> +} > "$out"
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada

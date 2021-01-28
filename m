From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: Re: [PATCH 02/27] x86/syscalls: fix -Wmissing-prototypes warnings
 from COND_SYSCALL()
Date: Thu, 28 Jan 2021 10:59:07 +0300
Message-ID: <dd37a7f2-55e1-2e96-0c93-4a40980b8ef2@gmail.com>
References: <20210128005110.2613902-1-masahiroy@kernel.org>
 <20210128005110.2613902-3-masahiroy@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9yhe+VqZf/IGoKapUB13qD+eR9al1k9ZhV5p2KUQ+1U=; b=xM7TW6k+f/5zmbeyop9CGCS3n
	EvJrTl6mqhykleyi/B05jVa3BzmIPItvDay/tPXOIxrRMrhd6kN0Ac+es891Wp2EpLyp0J0gYkhPM
	JLykO2rHPQITLNGwmUnH51icJVPy8HluWlxlssMdiJTxXg3W7kd07XxFX9kGD+pEhjxyjqtvR0zxc
	x9+9Laa6h15Ox+gfAiweGhsNLy02gcbUwEIERJNzrviJrjALDFWgHKpMSoWS2pyyyE3ySGuGvXEfP
	9AjQkc7EGjJTpIqnozxV2r8zCfMTPf3yg9D8VI3dgL4aUWaRLOg10KAA7m3/vLa51eFrykHxIBvmy
	Mc9QHzhzg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZhLAAud3HvOatZc8bWa160+GGDrtwAXLfmrfPeaVYS8=;
 b=iipPbsfxZVCoeVKuars96HlwaPhNMoxff6kXibVhpITK1M6liR5Y9O7+S15Bs18l09
 qlUtM1wTfg9Ou6I6g23AZm7cVsi8afl9ywua8K9yMdO5bZr9nt5kjWGTXEGzGKuOa9/g
 1XUmU2pb08XIkn2+EUpygz+rpS2BWuStq+kp1Z0L+RWjtUcubBnlDUTz5WKp9v7710os
 SLNWgHiJ3JIV+8IAHjWh/nhAgSk/YRdA5r5xJzX10KabfIVPeT0lFPft9QR1HE2XX97r
 YL6s2qMMPrVFtgVS0PASinY6oq3v5br43OEKFxy7K4ebWVUxXV6rGDy0rY0fMsVaCwye
 p0Aw==
In-Reply-To: <20210128005110.2613902-3-masahiroy@kernel.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Masahiro Yamada <masahiroy@kernel.org>, linux-arch@vger.kernel.org, x86@kernel.org
Cc: linux-xtensa@linux-xtensa.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org

Hello!

On 28.01.2021 3:50, Masahiro Yamada wrote:

> Building kernel/sys_ni.c with W=1 omits tons of -Wmissing-prototypes

    Emits?

> warnings.
> 
> $ make W=1 kernel/sys_ni.o
>    [ snip ]
>    CC      kernel/sys_ni.o
> In file included from kernel/sys_ni.c:10:
> ./arch/x86/include/asm/syscall_wrapper.h:83:14: warning: no previous prototype for '__x64_sys_io_setup' [-Wmissing-prototypes]
>     83 |  __weak long __##abi##_##name(const struct pt_regs *__unused) \
>        |              ^~
> ./arch/x86/include/asm/syscall_wrapper.h:100:2: note: in expansion of macro '__COND_SYSCALL'
>    100 |  __COND_SYSCALL(x64, sys_##name)
>        |  ^~~~~~~~~~~~~~
> ./arch/x86/include/asm/syscall_wrapper.h:256:2: note: in expansion of macro '__X64_COND_SYSCALL'
>    256 |  __X64_COND_SYSCALL(name)     \
>        |  ^~~~~~~~~~~~~~~~~~
> kernel/sys_ni.c:39:1: note: in expansion of macro 'COND_SYSCALL'
>     39 | COND_SYSCALL(io_setup);
>        | ^~~~~~~~~~~~
> ./arch/x86/include/asm/syscall_wrapper.h:83:14: warning: no previous prototype for '__ia32_sys_io_setup' [-Wmissing-prototypes]
>     83 |  __weak long __##abi##_##name(const struct pt_regs *__unused) \
>        |              ^~
> ./arch/x86/include/asm/syscall_wrapper.h:120:2: note: in expansion of macro '__COND_SYSCALL'
>    120 |  __COND_SYSCALL(ia32, sys_##name)
>        |  ^~~~~~~~~~~~~~
> ./arch/x86/include/asm/syscall_wrapper.h:257:2: note: in expansion of macro '__IA32_COND_SYSCALL'
>    257 |  __IA32_COND_SYSCALL(name)
>        |  ^~~~~~~~~~~~~~~~~~~
> kernel/sys_ni.c:39:1: note: in expansion of macro 'COND_SYSCALL'
>     39 | COND_SYSCALL(io_setup);
>        | ^~~~~~~~~~~~
>    ...
> 
> __SYS_STUB0() and __SYS_STUBx() defined a few lines above have forward
> declarations. Let's do likewise for __COND_SYSCALL() to fix the
> warnings.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>   arch/x86/include/asm/syscall_wrapper.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/include/asm/syscall_wrapper.h b/arch/x86/include/asm/syscall_wrapper.h
> index a84333adeef2..80c08c7d5e72 100644
> --- a/arch/x86/include/asm/syscall_wrapper.h
> +++ b/arch/x86/include/asm/syscall_wrapper.h
> @@ -80,6 +80,7 @@ extern long __ia32_sys_ni_syscall(const struct pt_regs *regs);
>   	}
>   
>   #define __COND_SYSCALL(abi, name)					\
> +	__weak long __##abi##_##name(const struct pt_regs *__unused);	\
>   	__weak long __##abi##_##name(const struct pt_regs *__unused)	\

    Aren't these two lines identical?

[...]

MBR, Sergei

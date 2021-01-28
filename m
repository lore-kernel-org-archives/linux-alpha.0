From: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 02/27] x86/syscalls: fix -Wmissing-prototypes warnings
 from COND_SYSCALL()
Date: Thu, 28 Jan 2021 09:55:30 +0900
Message-ID: <CAK7LNATkX6=FNsMu0X44u0FSYYhW7iGfPq9cY43TReFCSdrsUg@mail.gmail.com>
References: <20210128005110.2613902-1-masahiroy@kernel.org>
 <20210128005110.2613902-3-masahiroy@kernel.org>
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
	 bh=c5MCoDBwa92QRmogmwDyRB/QjOsFdol3+3Qritjf7o8=; b=aPcfZYjKrKr27f1GxFFfmfTig
	NTTTYw4psr1/D8NMsBsIBfyK24XtcK1j/TxRQ4TyBm1iRQd38+PepUhmXXZpmfoWrtGMGIgaSntK2
	pjOP/hClbVf+8AazTCDk6/ge0kqQUlsx+8qP0PQww0ZnC/8YHVCJ5Hx7NSH69th3IESxQ4NCbiaFx
	dv2k79QdleScGREDymdTzu4f51YpK7+cMTPNEGFjDaq/9aD4a6skk2epzDpH60E/3JXk/H0AKbgt/
	tG51FybyFGZ9JzYnImOCEhbOmbrPmTHjDkEVdIUNzqtLGM7oLwhhYZcriZUgvyl6Zkippj6Wwv2sX
	LBb67p44A==;
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 10S0u7Kw027642
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611795368;
 bh=C9LObEhixqVjpaN6rdMkGqM2Xyb7MoUJDaq7yjC2Zac=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IkmWBDfwdvX+igh3pETYYFNb85y9N40ugyD2QkIaSl3gCnqt0sA2rbNJW6YUypyS4
 w4JRcmF/UdHxDAmZFKbsN4fgW8UKMP9hKNej5GRQO6ohFyBQ708fW4jl7PX/kJg0J1
 aFVW0TiepmxIdUhSebG33ZVax4jGwL8IVMJsg5Z5VH5JR2E9dhGLcMTrjck5EUjVb4
 XiCDAfCkir9V8MK+oTVxfhcLK95dOXxN5Ef5fxmKmxTP71wObZ000Fy1HFwSXnlaRO
 +aq3Mv6FDhai9Zj9oUzf7ysIQnLv9UV6Ej85eWfexeY4VwcIrqO2XVoKs7JYqApRtv
 FryylukgsGUFA==
In-Reply-To: <20210128005110.2613902-3-masahiroy@kernel.org>
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

On Thu, Jan 28, 2021 at 9:52 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Building kernel/sys_ni.c with W=1 omits tons of -Wmissing-prototypes


This is a typo.  "omits" -> "emits"



> warnings.
>
> $ make W=1 kernel/sys_ni.o
>   [ snip ]
>   CC      kernel/sys_ni.o
> In file included from kernel/sys_ni.c:10:
> ./arch/x86/include/asm/syscall_wrapper.h:83:14: warning: no previous prototype for '__x64_sys_io_setup' [-Wmissing-prototypes]
>    83 |  __weak long __##abi##_##name(const struct pt_regs *__unused) \
>       |              ^~
> ./arch/x86/include/asm/syscall_wrapper.h:100:2: note: in expansion of macro '__COND_SYSCALL'
>   100 |  __COND_SYSCALL(x64, sys_##name)
>       |  ^~~~~~~~~~~~~~
> ./arch/x86/include/asm/syscall_wrapper.h:256:2: note: in expansion of macro '__X64_COND_SYSCALL'
>   256 |  __X64_COND_SYSCALL(name)     \
>       |  ^~~~~~~~~~~~~~~~~~
> kernel/sys_ni.c:39:1: note: in expansion of macro 'COND_SYSCALL'
>    39 | COND_SYSCALL(io_setup);
>       | ^~~~~~~~~~~~
> ./arch/x86/include/asm/syscall_wrapper.h:83:14: warning: no previous prototype for '__ia32_sys_io_setup' [-Wmissing-prototypes]
>    83 |  __weak long __##abi##_##name(const struct pt_regs *__unused) \
>       |              ^~
> ./arch/x86/include/asm/syscall_wrapper.h:120:2: note: in expansion of macro '__COND_SYSCALL'
>   120 |  __COND_SYSCALL(ia32, sys_##name)
>       |  ^~~~~~~~~~~~~~
> ./arch/x86/include/asm/syscall_wrapper.h:257:2: note: in expansion of macro '__IA32_COND_SYSCALL'
>   257 |  __IA32_COND_SYSCALL(name)
>       |  ^~~~~~~~~~~~~~~~~~~
> kernel/sys_ni.c:39:1: note: in expansion of macro 'COND_SYSCALL'
>    39 | COND_SYSCALL(io_setup);
>       | ^~~~~~~~~~~~
>   ...
>
> __SYS_STUB0() and __SYS_STUBx() defined a few lines above have forward
> declarations. Let's do likewise for __COND_SYSCALL() to fix the
> warnings.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/x86/include/asm/syscall_wrapper.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/x86/include/asm/syscall_wrapper.h b/arch/x86/include/asm/syscall_wrapper.h
> index a84333adeef2..80c08c7d5e72 100644
> --- a/arch/x86/include/asm/syscall_wrapper.h
> +++ b/arch/x86/include/asm/syscall_wrapper.h
> @@ -80,6 +80,7 @@ extern long __ia32_sys_ni_syscall(const struct pt_regs *regs);
>         }
>
>  #define __COND_SYSCALL(abi, name)                                      \
> +       __weak long __##abi##_##name(const struct pt_regs *__unused);   \
>         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
>         {                                                               \
>                 return sys_ni_syscall();                                \
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada

From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/1] audit: Add CONFIG_HAVE_ARCH_AUDITSYSCALL
Date: Wed, 26 Feb 2014 23:31:36 +1100
Message-ID: <1393417896.17341.2.camel@concordia>
References: <1391407232-4623-1-git-send-email-takahiro.akashi@linaro.org>
	 <1393319784-2758-1-git-send-email-takahiro.akashi@linaro.org>
	 <1393319784-2758-2-git-send-email-takahiro.akashi@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <1393319784-2758-2-git-send-email-takahiro.akashi@linaro.org>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc: viro@zeniv.linux.org.uk, eparis@redhat.com, rgb@redhat.com, arndb@arndb.de, linux-s390@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-ia64@vger.kernel.org, user-mode-linux-devel@lists.sourceforge.net, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, catalin.marinas@arm.com, x86@kernel.org, will.deacon@arm.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, dsaxena@linaro.org, user-mode-linux-user@lists.sourceforge.net, linux-audit@redhat.com, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org

On Tue, 2014-02-25 at 18:16 +0900, AKASHI Takahiro wrote:
> Currently AUDITSYSCALL has a long list of architecture depencency:
>        depends on AUDIT && (X86 || PARISC || PPC || S390 || IA64 || UML ||
> 		SPARC64 || SUPERH || (ARM && AEABI && !OABI_COMPAT) || ALPHA)
> The purpose of this patch is to replace it with HAVE_ARCH_AUDITSYSCALL
> for simplicity.
> 
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 957bf34..7b3b8fe 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -141,6 +141,7 @@ config PPC
>  	select HAVE_DEBUG_STACKOVERFLOW
>  	select HAVE_IRQ_EXIT_ON_IRQ_STACK
>  	select ARCH_USE_CMPXCHG_LOCKREF if PPC64
> +	select HAVE_ARCH_AUDITSYSCALL
>  
>  config GENERIC_CSUM
>  	def_bool CPU_LITTLE_ENDIAN

Looks good for powerpc.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers



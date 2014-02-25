From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH v2 1/1] audit: Add CONFIG_HAVE_ARCH_AUDITSYSCALL
Date: Tue, 25 Feb 2014 09:40:15 -0800
Message-ID: <CAEdQ38Hf=vEXEKhYaduR8HAcXyChQ-Wo7rHPGs20DirVwkDAxw@mail.gmail.com>
References: <1391407232-4623-1-git-send-email-takahiro.akashi@linaro.org>
 <1393319784-2758-1-git-send-email-takahiro.akashi@linaro.org> <1393319784-2758-2-git-send-email-takahiro.akashi@linaro.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=qYSurm+ea8IGk2Leh9UB00TDg5twF52t5E8B7Y2Zaxo=;
        b=NR5Zc+tlCX1Oon1tD+cuSiS0s/VVXTJsi97MWWKLLlUYnP5x9RCNWu/AQVMvcP0QHK
         d1wPmBubr/KCD6vYDUggVVorU+uApoU7Lpa8E5SI+3Ad0gfqJO/hS+f59EeOFZZm0gfP
         PBCgEbSDTinJlMhp9GKGsVJaWt3TPkFrAHkl5cxKEtKMDS2NSRw0Nx3mvPDW67EcVpSR
         IandHjqIHkVE3VvbjQ36kxYrN/TFJCrcyMHXrP2ZUMIZ+JTBgBlsYzCxHcYIQJFUIz8m
         1yPXNiCc6ZvP9rwjDavquwtJMrF1b8RjxPv/BMZyl6FgHJ27VwqIP8Aqx9QvDZLkv8NC
         i7UA==
In-Reply-To: <1393319784-2758-2-git-send-email-takahiro.akashi@linaro.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: AKASHI Takahiro <takahiro.akashi@linaro.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, eparis@redhat.com, rgb@redhat.com, arndb@arndb.de, catalin.marinas@arm.com, Will Deacon <will.deacon@arm.com>, dsaxena@linaro.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, LKML <linux-kernel@vger.kernel.org>, linux-audit@redhat.com, x86@kernel.org, linux-alpha <linux-alpha@vger.kernel.org>, linux-ia64@vger.kernel.org, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, user-mode-linux-devel@lists.sourceforge.net, user-mode-linux-user@lists.sourceforge.net

On Tue, Feb 25, 2014 at 1:16 AM, AKASHI Takahiro
<takahiro.akashi@linaro.org> wrote:
> Currently AUDITSYSCALL has a long list of architecture depencency:
>        depends on AUDIT && (X86 || PARISC || PPC || S390 || IA64 || UML ||
>                 SPARC64 || SUPERH || (ARM && AEABI && !OABI_COMPAT) || ALPHA)
> The purpose of this patch is to replace it with HAVE_ARCH_AUDITSYSCALL
> for simplicity.
>
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> ---
>  arch/alpha/Kconfig     |    1 +
>  arch/arm/Kconfig       |    1 +
>  arch/ia64/Kconfig      |    1 +
>  arch/parisc/Kconfig    |    1 +
>  arch/powerpc/Kconfig   |    1 +
>  arch/s390/Kconfig      |    1 +
>  arch/sh/Kconfig        |    1 +
>  arch/sparc/Kconfig     |    1 +
>  arch/um/Kconfig.common |    1 +
>  arch/x86/Kconfig       |    1 +
>  init/Kconfig           |    5 ++++-
>  11 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index f6c6b34..b7ff9a3 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -22,6 +22,7 @@ config ALPHA
>         select GENERIC_SMP_IDLE_THREAD
>         select GENERIC_STRNCPY_FROM_USER
>         select GENERIC_STRNLEN_USER
> +       select HAVE_ARCH_AUDITSYSCALL
>         select HAVE_MOD_ARCH_SPECIFIC
>         select MODULES_USE_ELF_RELA
>         select ODD_RT_SIGACTION

Thanks.

Acked-by: Matt Turner <mattst88@gmail.com>

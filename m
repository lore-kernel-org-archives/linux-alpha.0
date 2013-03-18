From: Thorsten Kranzkowski <dl8bcu@dl8bcu.de>
Subject: Re: [PATCH] alpha: makefile: don't enforce small data model for
 kernel builds
Date: Mon, 18 Mar 2013 18:18:58 +0000
Message-ID: <20130318181858.GB899@ds20.borg.net>
References: <1363556926-21097-1-git-send-email-will.deacon@arm.com>
Reply-To: dl8bcu@dl8bcu.de
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1363556926-21097-1-git-send-email-will.deacon@arm.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Deacon <will.deacon@arm.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

On Sun, Mar 17, 2013 at 09:48:46PM +0000, Will Deacon wrote:
> Due to all of the goodness being packed into today's kernels, the
> resulting image isn't as slim as it once was.
> 
> In light of this, don't pass -msmall-data to the tools, which results in
> link failures due to impossible relocations when compiling anything but
> the most trivial configurations.

I use the same patch locally for quite some time, so

Tested-by: Thorsten Kranzkowski <dl8bcu@dl8bcu.de>

> 
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Signed-off-by: Will Deacon <will.deacon@arm.com>
> ---
>  arch/alpha/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
> index 4759fe7..2cc3cc5 100644
> --- a/arch/alpha/Makefile
> +++ b/arch/alpha/Makefile
> @@ -12,7 +12,7 @@ NM := $(NM) -B
>  
>  LDFLAGS_vmlinux	:= -static -N #-relax
>  CHECKFLAGS	+= -D__alpha__ -m64
> -cflags-y	:= -pipe -mno-fp-regs -ffixed-8 -msmall-data
> +cflags-y	:= -pipe -mno-fp-regs -ffixed-8
>  cflags-y	+= $(call cc-option, -fno-jump-tables)
>  
>  cpuflags-$(CONFIG_ALPHA_EV4)		:= -mcpu=ev4

-- 
| Thorsten Kranzkowski        Internet: dl8bcu@dl8bcu.de                      |
| Mobile: ++49 170 1876134       Snail: Kiebitzstr. 14, 49324 Melle, Germany  |
| Ampr: dl8bcu@db0lj.#rpl.deu.eu, dl8bcu@marvin.dl8bcu.ampr.org [44.130.8.19] |

From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] Fix for 2.6.6 Makefiles to get KBUILD_OUTPUT working
Date: Sun, 16 May 2004 22:33:22 +0200
Sender: linux-alpha-owner@vger.kernel.org
Message-ID: <20040516203322.GA4784@mars.ravnborg.org>
References: <20040516012245.GA11733@localhost>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040516012245.GA11733@localhost>
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Chouquet-Stringer <mchouque@online.fr>, linux-kernel@vger.kernel.org, rth@twiddle.net, linux-alpha@vger.kernel.org, ralf@gnu.org, linux-mips@linux-mips.org, akpm@osdl.org, bjornw@axis.com, dev-etrax@axis.com, mikael.starvik@axis.com

On Sat, May 15, 2004 at 09:22:45PM -0400, Mathieu Chouquet-Stringer wrote:
> 	Hi,
> 
> if you use O=/someotherdir or KBUILD_OUTPUT=/someotherdir on the following
> architectures: alpha, mips, sh and cris, the build process is probably
> going to fail at one point or another, depending on the target you used,
> because make can't find scripts/Makefile.build or scripts/Makefile.clean.
> 
> The following patch (which should apply cleanly to the latest 2.6.6 bk
> tree) fixes this, I greped the whole tree and these four were the only
> "offenders" I found.
Thanks, it has been on my todo for a while.
A few comments though.

> --- arch/mips/Makefile.orig	2004-05-15 20:48:52.000000000 -0400
> +++ arch/mips/Makefile	2004-05-15 20:49:58.000000000 -0400
>  
> -makeboot =$(Q)$(MAKE) -f scripts/Makefile.build obj=arch/mips/boot $(1)
> +makeboot =$(Q)$(MAKE) $(build)=arch/mips/boot $(1)

Please get rid of makeboot. Use $(Q)$(MAKE) ... instead.
Hereby the '+' sign is no longer needed (used today where makeboot is used.

>  archclean:
> -	@$(MAKE) -f scripts/Makefile.clean obj=arch/mips/boot
> -	@$(MAKE) -f scripts/Makefile.clean obj=arch/mips/baget
> -	@$(MAKE) -f scripts/Makefile.clean obj=arch/mips/lasat
> +	@$(MAKE) $(clean)=arch/mips/boot
> +	@$(MAKE) $(clean)=arch/mips/baget
> +	@$(MAKE) $(clean)=arch/mips/lasat
Please use $(Q)$(MAKE), so command is expanded with make V=1, and
to make it look like all other usages.


> --- arch/cris/Makefile.orig	2004-05-15 20:59:49.000000000 -0400
> +++ arch/cris/Makefile	2004-05-15 21:00:36.000000000 -0400
OK.

But this file in general looks strange. There seems to be no way
to descend into arch-v10?
Mikael - any pending patches for this file / architecture?

Mathieu, could you please update the patch and send onwards to Andrew.
Do not touch the cris Makefile more than you did, the maintainer needs
to clean it up.

Thanks,
	Sam

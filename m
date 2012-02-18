From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH] fix modpost when CONFIG_ALPHA_TSUNAMI=y
Date: Sun, 19 Feb 2012 11:29:34 +1300
Message-ID: <4F40264E.6050602@orcon.net.nz>
References: <20120109003504.GA19756@alumni-linux.ccs.neu.edu> <20120218212431.GA25058@alumni-linux.ccs.neu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120218212431.GA25058@alumni-linux.ccs.neu.edu>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jim Faulkner <jfaulkne@ccs.neu.edu>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, gregkh@linuxfoundation.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, torvalds@linux-foundation.org, jay.estabrook@gmail.com

On 19/02/12 10:24, Jim Faulkner wrote:
> Linux 3.2.6 fails to modpost on my alpha machine when
> CONFIG_ALPHA_TSUNAMI=y.  Linux 3.3-rc3 does not appear to have a fix for
> this bug, so is likely also affected.  I've attached a patch which fixes
> this issue.  I have tested this patch on Linux 3.2.6 successfully, and
> the patch also applies cleanly to Linux 3.3-rc3.

> diff -uNr linux-3.3-rc3/arch/alpha/kernel/core_tsunami.c linux-3.3-rc3.patched/arch/alpha/kernel/core_tsunami.c
> --- linux-3.3-rc3/arch/alpha/kernel/core_tsunami.c	2012-02-08 22:21:53.000000000 -0500
> +++ linux-3.3-rc3.patched/arch/alpha/kernel/core_tsunami.c	2012-02-18 16:07:12.859977887 -0500
> @@ -11,6 +11,7 @@
>  #include <asm/core_tsunami.h>
>  #undef __EXTERN_INLINE
>  
> +#include <linux/module.h>

Wouldn't <linux/exports.h> be better?  I seem to recall that this was a
problem with EXPORT_SYMBOL not being defined and I see my own personal
fix (which I had completely forgotten to send upstream) was to include
<linux/exports.h>

>  #include <linux/types.h>
>  #include <linux/pci.h>
>  #include <linux/sched.h>

Cheers
Michael.

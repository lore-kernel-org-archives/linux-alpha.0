From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH] include/asm/cmpxchg.h: Remove duplicate header
Date: Sat, 3 Nov 2018 07:29:05 +1300
Message-ID: <20181102182905.3klrdw4dxapeoiib@tower>
References: <20181102152637.GA3105@hp-pavilion-15-notebook-pc-brajeswar>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181102152637.GA3105@hp-pavilion-15-notebook-pc-brajeswar>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brajeswar Ghosh <brajeswar.linux@gmail.com>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, parri.andrea@gmail.com, mingo@kernel.org, paulmck@linux.vnet.ibm.com, jrdr.linux@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, sabyasachi.linux@gmail.com

On Fri, Nov 02, 2018 at 08:56:37PM +0530, Brajeswar Ghosh wrote:
> Remove asm/xchg.h which is included more than once
> 
> Signed-off-by: Brajeswar Ghosh <brajeswar.linux@gmail.com>
> ---
>  arch/alpha/include/asm/cmpxchg.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/alpha/include/asm/cmpxchg.h b/arch/alpha/include/asm/cmpxchg.h
> index 6c7c39452471..bcbdac0744f9 100644
> --- a/arch/alpha/include/asm/cmpxchg.h
> +++ b/arch/alpha/include/asm/cmpxchg.h
> @@ -36,7 +36,6 @@
>  #undef ____cmpxchg
>  #define ____xchg(type, args...)		__xchg ##type(args)
>  #define ____cmpxchg(type, args...)	__cmpxchg ##type(args)
> -#include <asm/xchg.h>

It's amazing the number of times we get a patch to remove that.

Instead of just automatically removing a second include of a
header file, why don't you take a closer look to see what it
actually does?

Cheers,
Michael.

From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] mm: Remove duplicate definitions of MADV_FREE
Date: Mon, 18 Jan 2016 09:23:49 +0100
Message-ID: <569CA115.3010305@gmx.de>
References: <1453087746-4658-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453087746-4658-1-git-send-email-linux@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Guenter Roeck <linux@roeck-us.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: Richard Henderson <rth@twiddle.net>, Ralf Baechle <ralf@linux-mips.org>, Chris Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-parisc@vger.kernel.org, Chen Gang <gang.chen.5i5j@gmail.com>, Minchan Kim <minchan@kernel.org>

On 18.01.2016 04:29, Guenter Roeck wrote:
> Commits 21f55b018ba5 ("arch/*/include/uapi/asm/mman.h: : let MADV_FREE
> have same value for all architectures") and ef58978f1eaa ("mm: define
> MADV_FREE for some arches") both defined MADV_FREE, but did not use the
> same values. This results in build errors such as
> 
> ./arch/alpha/include/uapi/asm/mman.h:53:0: error: "MADV_FREE" redefined
> ./arch/alpha/include/uapi/asm/mman.h:50:0: note:
> 	this is the location of the previous definition
> 
> for the affected architectures.
> 
> Fixes: 21f55b018ba5 ("arch/*/include/uapi/asm/mman.h: : let MADV_FREE have same value for all architectures")
> Fixes: ef58978f1eaa ("mm: define MADV_FREE for some arches")
> Cc: Chen Gang <gang.chen.5i5j@gmail.com>
> Cc: Minchan Kim <minchan@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>


On parisc both definitions of MADV_FREE are 8, so I do not face the compiler error.
Nevertheless it should be cleaned up.

Acked-by: Helge Deller <deller@gmx.de>  (for parisc)

Thanks!
Helge

> ---
>  arch/alpha/include/uapi/asm/mman.h  | 1 -
>  arch/mips/include/uapi/asm/mman.h   | 1 -
>  arch/parisc/include/uapi/asm/mman.h | 1 -
>  arch/xtensa/include/uapi/asm/mman.h | 1 -
>  4 files changed, 4 deletions(-)
> 
> diff --git a/arch/parisc/include/uapi/asm/mman.h b/arch/parisc/include/uapi/asm/mman.h
> index cf830d465f75..f3db7d8eb0c2 100644
> --- a/arch/parisc/include/uapi/asm/mman.h
> +++ b/arch/parisc/include/uapi/asm/mman.h
> @@ -43,7 +43,6 @@
>  #define MADV_SPACEAVAIL 5               /* insure that resources are reserved */
>  #define MADV_VPS_PURGE  6               /* Purge pages from VM page cache */
>  #define MADV_VPS_INHERIT 7              /* Inherit parents page size */
> -#define MADV_FREE	8		/* free pages only if memory pressure */
>  
>  /* common/generic parameters */
>  #define MADV_FREE	8		/* free pages only if memory pressure */


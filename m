From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] alpha: Silence -Warray-bounds warnings
Date: Wed, 2 Feb 2022 15:17:18 -0800
Message-ID: <20220202231718.GA2539669@roeck-us.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=SmM5LOXhBptwLoFRQx1xbAsZgGTvkZX2rXC6lKb25Rc=;
        b=afYIE2hcFMLGO3iC6MkgeyjxvbwUqtd06XMSOBgKA1JmeSorzZXwTl1okvDiOYnB9l
         I0H4UD7lxXr3PUThf/7IcIvIOsF5sWw5thHdOOKBvrdXNNtS/fD9Ym1WoVqea2HcAfwi
         6eEM+v9OMcXZhik2LMP/jIpsfUBHKKr1qXWqemYWSWpEtU8twc7PHCgRkvAj36dDXHKE
         uLVrjqstlVzY4jSFwk3Jc70uwRhAL+ie85/Q+5kwNmZl1ItfbAGYUKAEGF4u54rFb7cz
         Sw3GPDOyJc4VqVkcsGaX8KF/n9Nh4c/uPgrvkaSGfcBxTVFi0X7Uj8fFeP1i1rAsy4Ge
         cYCA==
Sender: Guenter Roeck <groeck7@gmail.com>
Content-Disposition: inline
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-hardening@vger.kernel.org

On Wed, Feb 02, 2022 at 02:18:25PM -0800, Kees Cook wrote:
> GCC 11 (incorrectly[1]) assumes that literal values cast to (void *)
> should be treated like a NULL pointer with an offset, and raises
> diagnostics when doing bounds checking:
> 
> In function '__memset',
>     inlined from '__bad_pagetable' at arch/alpha/mm/init.c:79:2:
> ./arch/alpha/include/asm/string.h:37:32: error: '__builtin_memset' offset [0, 8191] is out of the bounds [0, 0] [-Werror=array-bounds]
>    37 |                         return __builtin_memset(s, c, n);
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
> In function '__memset',
>     inlined from '__bad_page' at arch/alpha/mm/init.c:86:2:
> ./arch/alpha/include/asm/string.h:37:32: error: '__builtin_memset' offset [0, 8191] is out of the bounds [0, 0] [-Werror=array-bounds]
>    37 |                         return __builtin_memset(s, c, n);
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
> In function '__memset',
>     inlined from 'paging_init' at arch/alpha/mm/init.c:256:2:
> ./arch/alpha/include/asm/string.h:37:32: error: '__builtin_memset' offset [0, 8191] is out of the bounds [0, 0] [-Werror=array-bounds]
>    37 |                         return __builtin_memset(s, c, n);
> 
> This has been solved in other places[2] already by using the recently
> added absolute_pointer() macro. Do the same here.
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
> [2] https://lore.kernel.org/all/20210912160149.2227137-1-linux@roeck-us.net/
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-and-tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/alpha/mm/init.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
> index f6114d03357c..7511723b7669 100644
> --- a/arch/alpha/mm/init.c
> +++ b/arch/alpha/mm/init.c
> @@ -76,14 +76,14 @@ pgd_alloc(struct mm_struct *mm)
>  pmd_t *
>  __bad_pagetable(void)
>  {
> -	memset((void *) EMPTY_PGT, 0, PAGE_SIZE);
> +	memset(absolute_pointer(EMPTY_PGT), 0, PAGE_SIZE);
>  	return (pmd_t *) EMPTY_PGT;
>  }
>  
>  pte_t
>  __bad_page(void)
>  {
> -	memset((void *) EMPTY_PGE, 0, PAGE_SIZE);
> +	memset(absolute_pointer(EMPTY_PGE), 0, PAGE_SIZE);
>  	return pte_mkdirty(mk_pte(virt_to_page(EMPTY_PGE), PAGE_SHARED));
>  }
>  
> @@ -253,7 +253,7 @@ void __init paging_init(void)
>  	free_area_init(max_zone_pfn);
>  
>  	/* Initialize the kernel's ZERO_PGE. */
> -	memset((void *)ZERO_PGE, 0, PAGE_SIZE);
> +	memset(absolute_pointer(ZERO_PGE), 0, PAGE_SIZE);
>  }
>  
>  #if defined(CONFIG_ALPHA_GENERIC) || defined(CONFIG_ALPHA_SRM)
> -- 
> 2.30.2
> 

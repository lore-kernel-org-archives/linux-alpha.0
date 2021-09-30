From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v4 10/11] microblaze: Use is_kernel_text() helper
Date: Thu, 30 Sep 2021 12:13:08 +0200
Message-ID: <2a23c06c-62e5-d4f8-4c7c-4e5c055a9e69@monstr.eu>
References: <20210930071143.63410-1-wangkefeng.wang@huawei.com>
 <20210930071143.63410-11-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=di22f+1qtT1rJlDsDU5gv52bfkIzi99/0/f5YELZTOw=;
        b=ppyHc1xu2ZjQ/kTBT2c/n07AkMuYUtXvdy0s7QXVTxECAFMjweuXUCK7xVE+xwaX0C
         6o8ZrsH3/9Aynnbf9fMbiY9C8vrkZKxMS2dYyF99LaMNbMDmo+1MshkoCVBu64oPE6ga
         zFJAQfJwiWTcCZsmLrqej5kKbY2vHfu7puIu4/K01CNJFBuzzGgBrIqsTKFJtWl1D8WY
         Zs33o3bUzbg+B6tae1aWxdGoSxVf8Jp54BcOj5rIAhOIm93rKhQ0OmZemre71DGprt/y
         YIumJdsINVkRuayzKbrt7Bx5i0AKwik6J4Ki1n3eaMHv8bBS9zWjaa6znfhzuZJX3poI
         GbLg==
In-Reply-To: <20210930071143.63410-11-wangkefeng.wang@huawei.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kefeng Wang <wangkefeng.wang@huawei.com>, arnd@arndb.de, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org, mingo@redhat.com, davem@davemloft.net, ast@kernel.org, ryabinin.a.a@gmail.com, akpm@linux-foundation.org
Cc: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, bpf@vger.kernel.org, linux-alpha@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>



On 9/30/21 9:11 AM, Kefeng Wang wrote:
> Use is_kernel_text() helper to simplify code.
> 
> Cc: Michal Simek <monstr@monstr.eu>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/microblaze/mm/pgtable.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/microblaze/mm/pgtable.c b/arch/microblaze/mm/pgtable.c
> index c1833b159d3b..9f73265aad4e 100644
> --- a/arch/microblaze/mm/pgtable.c
> +++ b/arch/microblaze/mm/pgtable.c
> @@ -34,6 +34,7 @@
>  #include <linux/mm_types.h>
>  #include <linux/pgtable.h>
>  #include <linux/memblock.h>
> +#include <linux/kallsyms.h>
>  
>  #include <asm/pgalloc.h>
>  #include <linux/io.h>
> @@ -171,7 +172,7 @@ void __init mapin_ram(void)
>  	for (s = 0; s < lowmem_size; s += PAGE_SIZE) {
>  		f = _PAGE_PRESENT | _PAGE_ACCESSED |
>  				_PAGE_SHARED | _PAGE_HWEXEC;
> -		if ((char *) v < _stext || (char *) v >= _etext)
> +		if (!is_kernel_text(v))
>  			f |= _PAGE_WRENABLE;
>  		else
>  			/* On the MicroBlaze, no user access
> 

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs


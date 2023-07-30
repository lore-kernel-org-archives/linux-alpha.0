From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] alpha: remove __init annotation from exported
 page_is_ram()
Date: Sat, 29 Jul 2023 18:49:58 -0700
Message-ID: <1c4b9496-2ac3-d271-0ef9-0c0979da55ae@infradead.org>
References: <20230729074223.1457109-1-masahiroy@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=NbwbCQT8KMNRIPvq+q9lapcQ2h0sWsXj0fj9zqMOVKI=; b=O3JWKw4XNWjyAbDPQmLJilCOgX
        eCSDsaDMyaSYoP1ehB6ebHPhygQWZsuv/uXlyeuu2uLa1dyCtL/nWtdlrNuKUsRDkW+fNQoWxYLPB
        eyEmWr94Eqj5+vKictOKFtZM40gWI9jyNgbrEZY0WUnck1Z9MVyhmT8mmqNT0u7Ay+MGs9boK7eV5
        +U885x4QsoQ9LaKaL36Al+sdqfhHvpSWDx+nHrfc+1BlHXcPvW7hRD0sAq0tfXC2n2A/05KKzF+Ee
        9ZzZpNYDBYq95yoP+VGJPBQAflx5UPkEJ1L+zv35zRvS73LPNF6DRK2Qrd8fY2CwSJT+B1SUCtPOy
        rcVDzpmQ==;
Content-Language: en-US
In-Reply-To: <20230729074223.1457109-1-masahiroy@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Chen Gong <gong.chen@linux.intel.com>, Tony Luck <tony.luck@intel.com>



On 7/29/23 00:42, Masahiro Yamada wrote:
> EXPORT_SYMBOL and __init is a bad combination because the .init.text
> section is freed up after the initialization.
> 
> Commit c5a130325f13 ("ACPI/APEI: Add parameter check before error
> injection") exported page_is_ram(), hence the __init annotation should
> be removed.
> 
> This fixes the modpost warning in ARCH=alpha builds:
> 
>   WARNING: modpost: vmlinux: page_is_ram: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
> 
> Fixes: c5a130325f13 ("ACPI/APEI: Add parameter check before error injection")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> 
>  arch/alpha/kernel/setup.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
> index b650ff1cb022..3d7473531ab1 100644
> --- a/arch/alpha/kernel/setup.c
> +++ b/arch/alpha/kernel/setup.c
> @@ -385,8 +385,7 @@ setup_memory(void *kernel_end)
>  #endif /* CONFIG_BLK_DEV_INITRD */
>  }
>  
> -int __init
> -page_is_ram(unsigned long pfn)
> +int page_is_ram(unsigned long pfn)
>  {
>  	struct memclust_struct * cluster;
>  	struct memdesc_struct * memdesc;

-- 
~Randy

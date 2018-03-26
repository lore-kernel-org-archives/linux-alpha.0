From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2 02/16] riscv: Use INITRAMFS_GENERIC_UNLOAD.
Date: Sun, 25 Mar 2018 17:41:14 -0700 (PDT)
Message-ID: <mhng-5691a509-dedf-4092-bd6d-020a81512c15@palmer-si-x1c4>
References: <20180325221853.10839-3-shea@shealevy.com>
Mime-Version: 1.0 (MHng)
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=BxrHL3J7YJxSNgyCRyTp73AOcDaRIcmFR/r65TD40dw=;
        b=BBQxIF+wGf8o0y0IdPWdzFmMryeUsjC8+7txLItLE+RASKysUxjFSb+d2PI0EAiPuc
         nZrhvdtRiKawpd0JDkmh/GqT245XT9/NS3fCrOTQe9H4HkUHneotzJqkY0r7cDFQLKJn
         zf0gJtRVNrtJdiTGEaU+Eenhm1sQ/ApZ+wssn2qSFX/HtlLSj1yeHj3XZqMPVIOM2eLo
         ptxFRr0Hdj3lNUjwco0mvSm47m1jOXUgzNBadbx4ilOXle1i6GJUcmgl1i9rh+OZOtX3
         GEM2hgqrYk+imjPdRzdQuCYfA4Cj8XK8FlPMm0ynOY2PKm9EdGtsqgTaDJl+Bu9dktCk
         38oQ==
In-Reply-To: <20180325221853.10839-3-shea@shealevy.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-c6x-dev@linux-c6x.org, uclinux-h8-devel@lists.sourceforge.jp, linux-m68k@lists.linux-m68k.org, nios2-dev@lists.rocketboards.org, openrisc@lists.librecores.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, user-mode-linux-devel@lists.sourceforge.net, shea@shealevy.com

On Sun, 25 Mar 2018 15:18:39 PDT (-0700), shea@shealevy.com wrote:
> Signed-off-by: Shea Levy <shea@shealevy.com>
> ---
>  arch/riscv/Kconfig   | 1 +
>  arch/riscv/mm/init.c | 6 ------
>  2 files changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index c22ebe08e902..ab1b4cee84fc 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -37,6 +37,7 @@ config RISCV
>  	select THREAD_INFO_IN_TASK
>  	select RISCV_TIMER
>  	select GENERIC_IRQ_MULTI_HANDLER
> +	select INITRAMFS_GENERIC_UNLOAD
>
>  config MMU
>  	def_bool y
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index c77df8142be2..36f83fe8a726 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -62,9 +62,3 @@ void free_initmem(void)
>  {
>  	free_initmem_default(0);
>  }
> -
> -#ifdef CONFIG_BLK_DEV_INITRD
> -void free_initrd_mem(unsigned long start, unsigned long end)
> -{
> -}
> -#endif /* CONFIG_BLK_DEV_INITRD */

I haven't looked through the rest of the patch set, but this is a pretty 
trivial change so feel free to add a 

Reviewed-By: Palmer Dabbelt <palmer@sifive.com>

if you'd like.  If you'd like it merged through my tree then just say 
something!

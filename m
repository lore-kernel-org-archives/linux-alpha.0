From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: Add DMA_ERROR_CODE defn to avert compiler error in drm
Date: Wed, 4 May 2011 17:59:29 -0400
Message-ID: <BANLkTiknKa8xq5UQYTWKZnGDqVyAjGhVmw@mail.gmail.com>
References: <1304496817-7646-1-git-send-email-mcree@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=bceqMTYRiIQA5feXvn/cXfKNt6R+w52knm6A3y6rloA=;
        b=I/t4RkXNxebf05yMP2oW/OjPDDiTnAUOfHgUrxD/95+T+HLQ2ZPfaeHMC+r5iiRqgD
         OwB9SrQAt+WGBmLEZXd50upCLSnXDn4A1/BPm89z38TOMvWL4CGMPeX+v8+KIp/9ivoA
         IRPsaJ4jG6rQrzge7ZFD8Lo9VekkAeLXZVGYs=
In-Reply-To: <1304496817-7646-1-git-send-email-mcree@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

On Wed, May 4, 2011 at 4:13 AM, Michael Cree <mcree@orcon.net.nz> wrote=
:
> The radeon drm code now relies on DMA_ERROR_CODE. =A0This defines
> it in alpha dma-mapping header to at least enable me to compile
> radeon drm/kms into kernel.
>
> Signed-off-by: Michael Cree <mcree@orcon.net.nz>
> ---
> =A0arch/alpha/include/asm/dma-mapping.h | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/alpha/include/asm/dma-mapping.h b/arch/alpha/includ=
e/asm/dma-mapping.h
> index 4567aca..644d9c3 100644
> --- a/arch/alpha/include/asm/dma-mapping.h
> +++ b/arch/alpha/include/asm/dma-mapping.h
> @@ -3,6 +3,8 @@
>
> =A0#include <linux/dma-attrs.h>
>
> +#define DMA_ERROR_CODE 0
> +
> =A0extern struct dma_map_ops *dma_ops;
>
> =A0static inline struct dma_map_ops *get_dma_ops(struct device *dev)
> --
> 1.7.4.3
>
>

Other architectures define this differently.

arch/ia64/include/asm/dma-mapping.h:#define DMA_ERROR_CODE 0
arch/microblaze/include/asm/dma-mapping.h:#define DMA_ERROR_CODE
         (~(dma_addr_t)0x0)
arch/powerpc/include/asm/dma-mapping.h:#define DMA_ERROR_CODE
 (~(dma_addr_t)0x0)
arch/sparc/include/asm/dma-mapping.h:#define DMA_ERROR_CODE
(~(dma_addr_t)0x0)
arch/x86/include/asm/dma-mapping.h:#define DMA_ERROR_CODE       0

Any idea what the reason is?

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

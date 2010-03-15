From: Matt Turner <mattst88@gmail.com>
Subject: Re: Alpha: Compilation error 2.6.34-rc1 git a3d3203e4b
Date: Mon, 15 Mar 2010 17:50:24 -0400
Message-ID: <b4198de61003151450q67a24686pcc335b2e62923794@mail.gmail.com>
References: <4B9DDCD8.4070902@orcon.net.nz>
	 <20100315192321I.fujita.tomonori@lab.ntt.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=kcEGZYNjiN/G4Y81yEVwXbnXDghX4NAcbXGVN7SfvQk=;
        b=qxMtQOjHFJHfkTvUuch8Qr4Igmj8tKd30B8wxC/a3yR81gNMBOosegbtdq6VD0DLk7
         vThlw36/0zfEE1+Am0fqe7TQE9477qnEYyLAKMCccMF5S145UOdOB1+/wSUkO8TG6WYv
         xGx4w/O+hUvmbJ8Ag25gOWIA014ijhXN2YSpw=
In-Reply-To: <20100315192321I.fujita.tomonori@lab.ntt.co.jp>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Cc: mcree@orcon.net.nz, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, akpm@linux-foundation.org

On Mon, Mar 15, 2010 at 6:23 AM, FUJITA Tomonori
<fujita.tomonori@lab.ntt.co.jp> wrote:
> On Mon, 15 Mar 2010 20:08:08 +1300
> Michael Cree <mcree@orcon.net.nz> wrote:
>
>> I note that for_each_sg is defined in include/linux/scatterlist.h, w=
hich
>> arch/alpha/include/asm/dma-mapping.h attempts to load, however
>> include/linux/scatterlist.h was the one that included (indirectly)
>> arch/alpha/include/asm/dma-mapping.h. =A0There is therefore a comple=
te
>> loop of includes from include/linux/scatterlist.h back to itself.
>
> Very sorry about that. Seems that I broke CONFIG_ALPHA_{TSUNAMI,
> TITAN, RAWHIDE, MARVEL}.
>
> =3D
> From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
> Subject: [PATCH] alpha: fix compile errors in dma-mapping-common.h
>
> The commit c186caca3dbe7f44da624cb4f9d78e1b1dfb13b8 leads to the
> following errors with CONFIG_ALPHA_{TSUNAMI, TITAN, RAWHIDE, MARVEL}:
>
> /home/fujita/git/linux-2.6/include/asm-generic/dma-mapping-common.h: =
In function `dma_map_sg_attrs':
> /home/fujita/git/linux-2.6/include/asm-generic/dma-mapping-common.h:4=
9: error: implicit declaration of function `for_each_sg'
> /home/fujita/git/linux-2.6/include/asm-generic/dma-mapping-common.h:5=
0: error: syntax error before "kmemcheck_mark_initialized"
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
> Reported-by: Michael Cree <mcree@orcon.net.nz>
> ---
> =A0arch/alpha/include/asm/core_marvel.h =A0| =A0 =A01 -
> =A0arch/alpha/include/asm/core_mcpcia.h =A0| =A0 =A01 -
> =A0arch/alpha/include/asm/core_titan.h =A0 | =A0 =A01 -
> =A0arch/alpha/include/asm/core_tsunami.h | =A0 =A01 -
> =A04 files changed, 0 insertions(+), 4 deletions(-)
>
> diff --git a/arch/alpha/include/asm/core_marvel.h b/arch/alpha/includ=
e/asm/core_marvel.h
> index 30d55fe..dad300f 100644
> --- a/arch/alpha/include/asm/core_marvel.h
> +++ b/arch/alpha/include/asm/core_marvel.h
> @@ -12,7 +12,6 @@
> =A0#define __ALPHA_MARVEL__H__
>
> =A0#include <linux/types.h>
> -#include <linux/pci.h>
> =A0#include <linux/spinlock.h>
>
> =A0#include <asm/compiler.h>
> diff --git a/arch/alpha/include/asm/core_mcpcia.h b/arch/alpha/includ=
e/asm/core_mcpcia.h
> index acf55b4..21ac533 100644
> --- a/arch/alpha/include/asm/core_mcpcia.h
> +++ b/arch/alpha/include/asm/core_mcpcia.h
> @@ -6,7 +6,6 @@
> =A0#define MCPCIA_ONE_HAE_WINDOW 1
>
> =A0#include <linux/types.h>
> -#include <linux/pci.h>
> =A0#include <asm/compiler.h>
>
> =A0/*
> diff --git a/arch/alpha/include/asm/core_titan.h b/arch/alpha/include=
/asm/core_titan.h
> index a17f6f3..8cf79d1 100644
> --- a/arch/alpha/include/asm/core_titan.h
> +++ b/arch/alpha/include/asm/core_titan.h
> @@ -2,7 +2,6 @@
> =A0#define __ALPHA_TITAN__H__
>
> =A0#include <linux/types.h>
> -#include <linux/pci.h>
> =A0#include <asm/compiler.h>
>
> =A0/*
> diff --git a/arch/alpha/include/asm/core_tsunami.h b/arch/alpha/inclu=
de/asm/core_tsunami.h
> index 58d4fe4..8e39ecf 100644
> --- a/arch/alpha/include/asm/core_tsunami.h
> +++ b/arch/alpha/include/asm/core_tsunami.h
> @@ -2,7 +2,6 @@
> =A0#define __ALPHA_TSUNAMI__H__
>
> =A0#include <linux/types.h>
> -#include <linux/pci.h>
> =A0#include <asm/compiler.h>
>
> =A0/*
> --
> 1.7.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-alpha=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Thanks for the fix. Will get this into my tree and to Linus ASAP.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

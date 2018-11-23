From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 1/9] arm: remove EISA kconfig option
Date: Fri, 23 Nov 2018 11:38:20 +0900
Message-ID: <CAK7LNAT+gHJcxhb=ufzzHHcfWqNOAJXaOAp2aJP9dGYxBkqQFw@mail.gmail.com>
References: <20181115190538.17016-1-hch@lst.de> <20181115190538.17016-2-hch@lst.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com wAN2cus7032084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1542940737;
        bh=RwCL9Ri+CN8GV/mcouXy7Bn2m5DMHOHs2NKrn7tRBFs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MYhJUu0L0a+CSKTHu66tCSIlEPx+cikVX1ZeeFJJJm+V/LS62+QKlo0YuU3BlAbbw
         AsWTdHqbqdveA+kVvHdFVvyOuwFaH8+owiGVG4pVsSpFbI97zO2nPbIrDm9G8w+JJA
         HQJBZ6OaYZqSTOmFr3ri2G48XmixRLG+GICPONonqugmiLwoeF6GXdpFb+zWI52b3n
         +Y/q6MvJjeUsBEWsY/sIEaEPQ+fX+mycQqY7B6OtENsc5C3eCOVeov8yPQZYqRumiY
         G/yEfSi/YD5kR1o+R1Vy4v9aP/E9epQ21KXaYMb/2lBHJJByu1kQlaB3xOQU5okA1+
         XTsn9lvMF8w/g==
In-Reply-To: <20181115190538.17016-2-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: mporter@kernel.crashing.org, Alex Bounine <alex.bou9@gmail.com>, Dominik Brodowski <linux@dominikbrodowski.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-pci@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-alpha@vger.kernel.org, Linux-MIPS <linux-mips@linux-mips.org>

On Fri, Nov 16, 2018 at 4:06 AM Christoph Hellwig <hch@lst.de> wrote:
>
> No arm config enables EISA, and arm does not include drivers/eisa/Kconfig
> which provides support for things like PCI to EISA bridges, so it is most
> likely dead.

As I said before, this is absolutely dead.

Only the difference between arch/powerpc/Kconfig and arch/arm/Kconfig
is the presence of ---help--- property.


I squashed this to "eisa: consolidate EISA ..."


> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arm/Kconfig | 15 ---------------
>  1 file changed, 15 deletions(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 91be74d8df65..f24a7435d19a 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -163,21 +163,6 @@ config HAVE_PROC_CPU
>  config NO_IOPORT_MAP
>         bool
>
> -config EISA
> -       bool
> -       ---help---
> -         The Extended Industry Standard Architecture (EISA) bus was
> -         developed as an open alternative to the IBM MicroChannel bus.
> -
> -         The EISA bus provided some of the features of the IBM MicroChannel
> -         bus while maintaining backward compatibility with cards made for
> -         the older ISA bus.  The EISA bus saw limited use between 1988 and
> -         1995 when it was made obsolete by the PCI bus.
> -
> -         Say Y here if you are building a kernel for an EISA-based machine.
> -
> -         Otherwise, say N.
> -
>  config SBUS
>         bool
>
> --
> 2.19.1
>


--
Best Regards
Masahiro Yamada

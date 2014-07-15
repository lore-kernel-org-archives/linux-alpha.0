From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH 6/6] alpha: Join lines 90 and 91
Date: Tue, 15 Jul 2014 19:54:59 +0100
Message-ID: <yw1xzjgaa1vg.fsf@unicorn.mansr.com>
References: <1405448304-3724-1-git-send-email-xerofoify@gmail.com>
	<1405448304-3724-6-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1405448304-3724-6-git-send-email-xerofoify@gmail.com> (Nicholas
	Krause's message of "Tue, 15 Jul 2014 14:18:24 -0400")
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Nicholas Krause <xerofoify@gmail.com>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Nicholas Krause <xerofoify@gmail.com> writes:

> This fixes the checkpatch error I get in this file relating to a
> quoted string needed to be joined to the line above it.
> ---
>  arch/alpha/boot/bootpz.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
> index 6fc840d..a9e127b 100644
> --- a/arch/alpha/boot/bootpz.c
> +++ b/arch/alpha/boot/bootpz.c
> @@ -87,8 +87,7 @@ check_range(unsigned long vstart, unsigned long ven=
d,
>  		kaddr =3D (find_pa(vaddr) | PAGE_OFFSET);
>  		if (kaddr >=3D kstart && kaddr <=3D kend) {
>  #ifdef DEBUG_CHECK_RANGE
> -			srm_printk("OVERLAP: vaddr 0x%lx kaddr 0x%lx"
> -				   " [0x%lx:0x%lx]\n",
> +			srm_printk("OVERLAP: vaddr 0x%lx kaddr 0x%lx" " [0x%lx:0x%lx]\n",
>  				   vaddr, kaddr, kstart, kend);
>  #endif

If you're doing this, you should merge the strings too.

--=20
M=E5ns Rullg=E5rd
mans@mansr.com
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

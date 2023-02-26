From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] fixed a typo in core_cia.c
Date: Sat, 25 Feb 2023 21:05:13 -0500
Message-ID: <CAEdQ38EPhkgD65hk0yybD34gczUS49xMxDjnebRXGbTdEPbcaA@mail.gmail.com>
References: <20230204004702.692906-1-rj1@riseup.net>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0L8r3cRKnMGy4Y82nwO2/l5Qawyc49ENJXAV167Z7Yk=;
        b=NdnIxmRGf1OVCSJ73bW7SlG0J+VV24DzAMzHh8uhA1OrlvMeFnjAufCeMgpmYnStdl
         OYwvfZtqLPibMsxewZcCCTl3OFE3gducfshgPmaEpt8Lqgc1xkJ9I/qKtCTasrVFkTIc
         0P8t5EFgQXiaMmEMRNV0ejgtWyGzflZbbzsDoxb82gM9Mq4pp9QWpqh1W+b5Zv0N6SKX
         WtbjCDb47N6nHPIq40oU2ZA3BUEOs8K4i1YVb9RA34SiAM42mSc7/A6qZmPl6mXCzeHr
         9108SHx3kvAmXUuSn7/Fyzpz1UCZemvxT6X35iCIewUfjc7/yO+2gmBlD1Is/3S8SS6w
         BtVQ==
In-Reply-To: <20230204004702.692906-1-rj1@riseup.net>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rj1 <rj1@riseup.net>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, ink@jurassic.park.msu.ru

On Fri, Feb 3, 2023 at 7:48 PM rj1 <rj1@riseup.net> wrote:
>
> ---
>  arch/alpha/kernel/core_cia.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/core_cia.c b/arch/alpha/kernel/core_cia.c
> index f489170201c3..12926e9538b8 100644
> --- a/arch/alpha/kernel/core_cia.c
> +++ b/arch/alpha/kernel/core_cia.c
> @@ -527,7 +527,7 @@ verify_tb_operation(void)
>         if (use_tbia_try2) {
>                 alpha_mv.mv_pci_tbi = cia_pci_tbi_try2;
>
> -               /* Tags 0-3 must be disabled if we use this workaraund. */
> +               /* Tags 0-3 must be disabled if we use this workaround. */
>                 wmb();
>                 *(vip)CIA_IOC_TB_TAGn(0) = 2;
>                 *(vip)CIA_IOC_TB_TAGn(1) = 2;
> --
> 2.39.1
>

Thanks for the patch! This was included in my pull request today and
is now upstream in Linus' tree.

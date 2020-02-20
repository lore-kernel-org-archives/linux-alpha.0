From: Jiri Slaby <jirislaby@gmail.com>
Subject: Re: [RESEND PATCH v2 9/9] ath5k: Constify ioreadX() iomem argument
 (as in generic implementation)
Date: Thu, 20 Feb 2020 10:48:33 +0100
Message-ID: <518a9023-f802-17b3-fca5-582400bc34ae@gmail.com>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-10-krzk@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E4lJsyRn5c8MRRBS5Cfwnz0ljZFD9tB/hN4lq7BDblw=;
        b=WkpaZeHVz17Y1TMUSg/nKktlNbfBErrdzoba0X8m4cd2P+F0769UaDz6I4KmBu48o2
         lMoOi/Cwm+PHYYNbWqK7Ddg/jlaRJig2OiNl83hjM8JEctgMO879Fa5MFFDWMnuNi1k3
         oB1m3BjwL1HKQZvs4FU4NBj4c0gf6LY8jqmIItkPOMh1NVaVIR8uNdWFlGs43xKkFye8
         MIRnGs1ImZeWy/9DqLH6/lyVmwBM206+HSE37MuJ7ym2aMui87j7PTvT1b25lk2LHNCf
         oSNvige6GVgAR0IuWMvroCs7ZPRfiu/roVTLsk7djT08it5jZA0EliiUAAzBaB6lW8jC
         eAew==
In-Reply-To: <20200219175007.13627-10-krzk@kernel.org>
Content-Language: en-US
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Krzysztof Kozlowski <krzk@kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nick Kossifidis <mickflemm@gmail.com>, Lui

On 19. 02. 20, 18:50, Krzysztof Kozlowski wrote:
> The ioreadX() helpers have inconsistent interface.  On some architectures
> void *__iomem address argument is a pointer to const, on some not.
> 
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Kalle Valo <kvalo@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath5k/ahb.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath5k/ahb.c b/drivers/net/wireless/ath/ath5k/ahb.c
> index 2c9cec8b53d9..8bd01df369fb 100644
> --- a/drivers/net/wireless/ath/ath5k/ahb.c
> +++ b/drivers/net/wireless/ath/ath5k/ahb.c
> @@ -138,18 +138,18 @@ static int ath_ahb_probe(struct platform_device *pdev)
>  
>  	if (bcfg->devid >= AR5K_SREV_AR2315_R6) {
>  		/* Enable WMAC AHB arbitration */
> -		reg = ioread32((void __iomem *) AR5K_AR2315_AHB_ARB_CTL);
> +		reg = ioread32((const void __iomem *) AR5K_AR2315_AHB_ARB_CTL);

While I understand why the parameter of ioread32 should be const, I
don't see a reason for these casts on the users' side. What does it
bring except longer code to read?

thanks,
-- 
js

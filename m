From: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] alpha: Fix double word in comments
Date: Tue, 30 Aug 2022 07:52:56 -0700
Message-ID: <3ad149d0-916c-e80e-ef17-ca406a4d7f6d@linaro.org>
References: <20220830074202.11274-1-dengshaomin@cdjrlc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=VF2yFiQXsHFg7elo8aq6tkA58KhGU6nq72XqcwehWe4=;
        b=XZXsT8Id4sJb7OFK0gZZSv/2povrfct6wbmT+3Zzu4tjCBBi9ckJ2GoH4dcomkl1ID
         +9UKEyIv1myh9gpvwWeVjE/KSd2NEmHd9Zdqv+rRfiQ7TbDBjiCBip5XUl0+A77bgVUL
         HnGtz7C/ecJ5g2APqttxLpP6WrnRiofrIGUcUaZEZlt0qdVIBp7Wz8TzRO5mV6dAmnTY
         3yuY8lYum69Gtnm6MnD0K/n3SvnGK+fp5H0yLm8L+2lQ1xh6oIbHCq/jQ/DKgajojTM/
         Ew+QcBTP6t0wjN0ZRLTDpgGFo6o0JBxd5SAtL0v5WFVDIp7ffZiKA/wGHkZl3mVw2M8R
         wV8A==
Content-Language: en-US
In-Reply-To: <20220830074202.11274-1-dengshaomin@cdjrlc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Shaomin Deng <dengshaomin@cdjrlc.com>, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

On 8/30/22 00:42, Shaomin Deng wrote:
> Delete the rebundant word "and" in comments.

typo.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> 
> Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
> ---
>   arch/alpha/kernel/irq_i8259.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/alpha/kernel/irq_i8259.c b/arch/alpha/kernel/irq_i8259.c
> index 1dcf0d9038fd..db574dcd6675 100644
> --- a/arch/alpha/kernel/irq_i8259.c
> +++ b/arch/alpha/kernel/irq_i8259.c
> @@ -147,7 +147,7 @@ isa_no_iack_sc_device_interrupt(unsigned long vector)
>   	 */
>   	/*
>   	 *  The first read of gives you *all* interrupting lines.
> -	 *  Therefore, read the mask register and and out those lines
> +	 *  Therefore, read the mask register and out those lines
>   	 *  not enabled.  Note that some documentation has 21 and a1
>   	 *  write only.  This is not true.
>   	 */


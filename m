From: Bob Tracy <rct@frus.com>
Subject: Re: [PATCH] alpha: Fix double word in comments
Date: Wed, 31 Aug 2022 17:09:09 -0500
Message-ID: <Yw/cBRA2FIsW7QhN@gherkin.frus.com>
References: <20220830074202.11274-1-dengshaomin@cdjrlc.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20220830074202.11274-1-dengshaomin@cdjrlc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org
Cc: richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com

On Tue, Aug 30, 2022 at 03:42:02AM -0400, Shaomin Deng wrote:
> Delete the rebundant word "and" in comments.
> 
> Signed-off-by: Shaomin Deng <dengshaomin@cdjrlc.com>
> ---
>  arch/alpha/kernel/irq_i8259.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/alpha/kernel/irq_i8259.c b/arch/alpha/kernel/irq_i8259.c
> index 1dcf0d9038fd..db574dcd6675 100644
> --- a/arch/alpha/kernel/irq_i8259.c
> +++ b/arch/alpha/kernel/irq_i8259.c
> @@ -147,7 +147,7 @@ isa_no_iack_sc_device_interrupt(unsigned long vector)
>  	 */
>  	/* 
>  	 *  The first read of gives you *all* interrupting lines.
> -	 *  Therefore, read the mask register and and out those lines
> +	 *  Therefore, read the mask register and out those lines
>  	 *  not enabled.  Note that some documentation has 21 and a1 
>  	 *  write only.  This is not true.
>  	 */
> -- 
> 2.35.1

This may have been beaten to death elsewhere, but the comment without
the second "and" doesn't make any sense, so I conclude the second "and"
is a logic operation.  As in, "... and AND out those lines...".  If that
is the case, capitalization will help disambiguate, much as I would expect
to see "OR" if that was the intended operation.  The code following the
read of the mask register (not included in the diff fragment above) should
make the meaning clear.

Accordingly, I would reject this proposed patch.

Respectfully,
--Bob

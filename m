From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] alpha: Fix comment typo
Date: Sat, 07 May 2022 21:30:56 -0700
Message-ID: <a18ecdef2efc0a5c23a85cc2a6dc17cf6e7d94c9.camel@perches.com>
References: <20220508030029.123056-1-wangborong@cdjrlc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20220508030029.123056-1-wangborong@cdjrlc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jason Wang <wangborong@cdjrlc.com>, rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2022-05-08 at 11:00 +0800, Jason Wang wrote:
> Remove one of the repeated 'and' in comment line 150.
[]
> diff --git a/arch/alpha/kernel/irq_i8259.c b/arch/alpha/kernel/irq_i8259.c
[]
> @@ -147,7 +147,7 @@ isa_no_iack_sc_device_interrupt(unsigned long vector)
>  	 */
>  	/* 
>  	 *  The first read of gives you *all* interrupting lines.
> -	 *  Therefore, read the mask register and and out those lines
> +	 *  Therefore, read the mask register and out those lines

Not really a repeated word but
perhaps s/and and/then and/

>  	 *  not enabled.  Note that some documentation has 21 and a1 
>  	 *  write only.  This is not true.
>  	 */



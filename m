From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] mm: fix typos in comments
Date: Fri, 18 Mar 2022 04:07:52 -0700
Message-ID: <176f485c00e3c6c03ff794dc47f23702fc592a4f.camel@perches.com>
References: <20220318103729.157574-19-Julia.Lawall@inria.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20220318103729.157574-19-Julia.Lawall@inria.fr>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Julia Lawall <Julia.Lawall@inria.fr>, Richard Henderson <rth@twiddle.net>
Cc: kernel-janitors@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2022-03-18 at 11:37 +0100, Julia Lawall wrote:
> Various spelling mistakes in comments.
[]
> diff --git a/arch/alpha/kernel/sys_eiger.c b/arch/alpha/kernel/sys_eiger.c
[]
> @@ -148,7 +148,7 @@ eiger_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
>  
>  	/* The SRM console has already calculated out the IRQ value's for
>  	   option cards. As this works lets just read in the value already
> -	   set and change it to a useable value by Linux.
> +	   set and change it to a usable value by Linux.

generally accepted alternative spelling.

https://www.dictionary.com/browse/useable



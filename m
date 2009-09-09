From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] alpha: kmalloc failure ignored in
 process_reloc_for_got()
Date: Wed, 9 Sep 2009 15:18:48 -0700
Message-ID: <20090909151848.45db437f.akpm@linux-foundation.org>
References: <4AA6EB5A.5090309@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <4AA6EB5A.5090309@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roel Kluin <roel.kluin@gmail.com>
Cc: rth@twiddle.net, linux-alpha@vger.kernel.org

On Wed, 09 Sep 2009 01:40:10 +0200
Roel Kluin <roel.kluin@gmail.com> wrote:

> Prevent NULL dereference if kmalloc() fails.
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> ---
> Found with sed: http://kernelnewbies.org/roelkluin
> 
> diff --git a/arch/alpha/kernel/module.c b/arch/alpha/kernel/module.c
> index ebc3c89..8ceec20 100644
> --- a/arch/alpha/kernel/module.c
> +++ b/arch/alpha/kernel/module.c
> @@ -73,6 +73,8 @@ process_reloc_for_got(Elf64_Rela *rela,
>  		}
>  
>  	g = kmalloc (sizeof (*g), GFP_KERNEL);
> +	if (g == NULL)
> +		return;
>  	g->next = chains[r_sym].next;
>  	g->r_addend = r_addend;
>  	g->got_offset = *poffset;

I don't know if that's an improvement.  afacit the kernel will now
blunder along and do something wrong.  An oops might well be
preferable behaviour.

IOW, we should handle this failure properly - back out, clean
everything up, return -ENOMEM to userspace


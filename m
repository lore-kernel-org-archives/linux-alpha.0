From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] alpha/boot: fixes formatting issues in `main.c`
Date: Mon, 28 Aug 2023 11:12:00 +0200
Message-ID: <2023082835-germproof-ecosphere-5ce5@gregkh>
References: <20230828071829.64366-1-anshulusr@gmail.com>
 <20230828080703.107031-1-anshulusr@gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1693213933; x=1693300333; bh=Dv
        eWy5bJAk2TdvNVYiVcOl4OPq7/VIXwIVFQN7u8suY=; b=BMF/KEsGbXfnm55dDz
        AVu/sBAkn87Hhf7myXBCek8rdlOhw7E8fe1vE4f2SUPqQ951D83W2ZFlI7CtDGPz
        6aw9nBOfQZ5k/AZhkd4db5m2XOOGboWGlfTg+1lxCzYm7ZOHp5CFKShCviLBJysV
        3gd28IGek2Bys6G5KrpA3g9557tnSMCUo6ctMTzr5pAQc0ZLGXpSwmQND3zuilt3
        NmMc0Zol3SrQeDGDTCuiUL/lPZ1XJM8dfpuCCF8sDNnNWRlQVyRJc4EqGzptLrF1
        3xRkgBQ2INY4zSNklmmxz0M3dWPOr+mtDFHAcuzH4d9ViTNraDINCEYRhC7QRTiG
        xpfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1693213933; x=1693300333; bh=DveWy5bJAk2Td
        vNVYiVcOl4OPq7/VIXwIVFQN7u8suY=; b=s3zMM45rssS4mcGmyqnAshX6SRNTJ
        16U0c9ohtJwLCEEoQdQ6aONu8KPF9xs2yqo+nn2wYGob0FK8qHAtvIAtyIbp+Tys
        tpKns8GN+dG7q3ElnB2+KKCckgUevEIHiZa6ugIkoKiFhtxIlDHk3BbuUV2GRynT
        oCfWc5vqmKPUynlfbjAGa26gZ+V+1G9jGotkRaBGfYCwlO4S4ADLCtLq+ilKOLQM
        M/CsnX+WMgJ2/fH7H1c2ihn0hqbuhSvglmTxVnmRhhKlWXeMxmpHh8++lEo8U6pr
        bvKBYzJL1lU1N9cJKGluVoPSloF9bN2IVy8StkonObEU8803oWgoGDcmg==
Content-Disposition: inline
In-Reply-To: <20230828080703.107031-1-anshulusr@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anshul <anshulusr@gmail.com>
Cc: richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org

On Mon, Aug 28, 2023 at 01:36:59PM +0530, Anshul wrote:
> Fixed minor formatting issues as per `scripts/checkpatch.pl`
> 
> Six changes to the file and their severity are as follows:
> * [WARNING] Removed unnecessary braces from single statement blocks
> * [ERROR] 5 fixes are to pointer formatting
> * [ERROR] Removed a trailing whitespace
> 
> 6 errors and 1 warning of the previously present 6 errors and 5
> warnings have been fixed.
> 
> Signed-off-by: Anshul <anshulusr@gmail.com>
> ---
>  arch/alpha/boot/main.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/alpha/boot/main.c b/arch/alpha/boot/main.c
> index 22a1cb026..f609c3a83 100644
> --- a/arch/alpha/boot/main.c
> +++ b/arch/alpha/boot/main.c
> @@ -20,8 +20,9 @@
>  #include "ksize.h"
>  
>  extern unsigned long switch_to_osf_pal(unsigned long nr,
> -	struct pcb_struct * pcb_va, struct pcb_struct * pcb_pa,
> -	unsigned long *vptb);
> +				       struct pcb_struct *pcb_va,
> +				       struct pcb_struct *pcb_pa,
> +				       unsigned long *vptb);
>  struct hwrpb_struct *hwrpb = INIT_HWRPB;
>  static struct pcb_struct pcb_va[1];
>  
> @@ -42,7 +43,7 @@ find_pa(unsigned long *vptb, void *ptr)
>  	result <<= 13;
>  	result |= address & 0x1fff;
>  	return (void *) result;
> -}	
> +}
>  
>  /*
>   * This function moves into OSF/1 pal-code, and has a temporary
> @@ -62,8 +63,8 @@ void
>  pal_init(void)
>  {
>  	unsigned long i, rev;
> -	struct percpu_struct * percpu;
> -	struct pcb_struct * pcb_pa;
> +	struct percpu_struct *percpu;
> +	struct pcb_struct *pcb_pa;
>  
>  	/* Create the dummy PCB.  */
>  	pcb_va->ksp = 0;
> @@ -176,11 +177,10 @@ void start_kernel(void)
>  	}
>  
>  	nbytes = callback_getenv(ENV_BOOTED_OSFLAGS, envval, sizeof(envval));
> -	if (nbytes < 0) {
> +	if (nbytes < 0)
>  		nbytes = 0;
> -	}
>  	envval[nbytes] = '\0';
> -	strcpy((char*)ZERO_PGE, envval);
> +	strcpy((char *)ZERO_PGE, envval);
>  
>  	srm_printk(" Ok\nNow booting the kernel\n");
>  	runkernel();
> -- 
> 2.42.0


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

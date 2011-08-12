From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH] Alpha: unbreak osf_setsysinfo(SSI_NVPAIRS, [SSIN_UACPROC,
 UAC_SIGBUS])
Date: Fri, 12 Aug 2011 19:21:14 +1200
Message-ID: <4E44D46A.1070007@orcon.net.nz>
References: <1313076314-6111-1-git-send-email-slyich@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1313076314-6111-1-git-send-email-slyich@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: slyich@gmail.com
Cc: linux-alpha@vger.kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com

On 12/08/11 03:25, slyich@gmail.com wrote:
> From: Sergei Trofimovich <slyfox@gentoo.org>
> 
> Update 'UAC_SHIFT' to match 'ALPHA_UAC_SHIFT'.
> 
> I don't know why kernel maintains 2 copies of the same constant.
> One (UAC_SHIFT) is used to shift bits in syscall definition, and
> another is in trap handler (ALPHA_UAC_SHIFT).
> 
> Was broken by
>> commit 745dd2405e281d96c0a449103bdf6a895048f28c
>> Author: Michael Cree <mcree@orcon.net.nz>

Bollocks.

The shift for the UAC flags was well and truly broken before that commit
as the TIF_UAC_NOPRINT, etc., flags did not match the definition of
either the UAC_ALPHA_SHIFT or the UAC_SHIFT flag.  I fixed
UAC_ALPHA_SHIFT to match the actual UAC flag definitions.

What I didn't realise was that UAC_SHIFT was also defined and used
elsewhere in the Alpha architecture code (so UAC_SHIFT _remained_ broken).

> diff --git a/arch/alpha/include/asm/sysinfo.h b/arch/alpha/include/asm/sysinfo.h
> index 086aba2..42b3edc 100644
> --- a/arch/alpha/include/asm/sysinfo.h
> +++ b/arch/alpha/include/asm/sysinfo.h
> @@ -32,7 +32,7 @@
>  
>  /* This is the shift that is applied to the UAC bits as stored in the
>     per-thread flags.  See thread_info.h.  */
> -#define UAC_SHIFT			6
> +#define UAC_SHIFT			10

But you haven't really fixed it.  If indeed UAC_SHIFT is exactly the
same as UAC_ALPHA_SHIFT then two definitions remain and that leaves the
possibility of someone changing one thereby screwing up the other.

Surely it would be better to unify UAC_ALPHA_SHIFT and UAC_SHIFT and use
one macro in all relevant places.

I am happy for you to reference my commit but I would prefer the commit
message saying something more along the line that it left part of the
fix undone which you are now completing.

With the above changes I will be happy to give my acknowledgement.

Thanks
Michael.

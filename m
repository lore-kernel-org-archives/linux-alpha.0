From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] arch/alpha: fix typo in a comment in
 arch/alpha/boot/bootpz.c
Date: Wed, 20 Jan 2021 08:20:09 -0800
Message-ID: <5e4ed85d-140c-3d85-e4f4-97b27fa37885@infradead.org>
References: <20210120133410.2182-1-tangchunyou@163.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=6zbXo40IH5Uu71xo0sssuQB6SsVmGWBgsmHqDUPpMXo=; b=phwPCU05NdSG5sT2A2X7d5RMJb
        /k0H3vv3f6ylRPdpA+nQZ11ugPnKPLaGsn35s/PxrMsgDA+aM/TrhjYm8A5rzPfaLBbJ3IkSi+RBF
        /d8wwbUG/RjjH+RMwG25M3KD3SIb0qWp5o0ogqll2xBeg+yDsPaKG/Z2NKydNQycjqKLs1Ob6wYZ9
        fpO0br0ZJcJIuOPMQCA93nkx3553fDKAtkoTPbGXNegeR92noH9QgSXG0YCs8Sp0EJmD/Ya8FUhjU
        XSFHF8n1b0E4AsRdG/6JuheZ7/FHCKtr+y0XI4BPqKlvoYR2yWMA3BFbnMTXSbBzlf5iqzSVo0ODK
        C6m1Eqkw==;
In-Reply-To: <20210120133410.2182-1-tangchunyou@163.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ChunyouTang <tangchunyou@163.com>, ink@jurassic.park.msu.ru, mattst88@gmail.com, akpm@linux-foundation.org, rppt@kernel.org
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, zhangwen@yulong.com, tangchunyou@yulong.com

On 1/20/21 5:34 AM, ChunyouTang wrote:
> From: tangchunyou <tangchunyou@yulong.com>
> 
> "kerne" -> "kernel"
> 
> Signed-off-by: tangchunyou <tangchunyou@yulong.com>
> ---
>  arch/alpha/boot/bootpz.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
> index 43af718..61b61be 100644
> --- a/arch/alpha/boot/bootpz.c
> +++ b/arch/alpha/boot/bootpz.c
> @@ -200,7 +200,7 @@ extern int decompress_kernel(void* destination, void *source,
>  	START_ADDR	KSEG address of the entry point of kernel code.
>  
>  	ZERO_PGE	KSEG address of page full of zeroes, but 
> -			upon entry to kerne cvan be expected
> +			upon entry to kernel cvan be expected

s/cvan/can/ also

>  			to hold the parameter list and possible
>  			INTRD information.
>  
> 


-- 
~Randy
"He closes his eyes and drops the goggles.  You can't get hurt
by looking at a bitmap.  Or can you?"
(Neal Stephenson: Snow Crash)

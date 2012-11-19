From: Michael Cree <mcree@orcon.net.nz>
Subject: Re: [PATCH 1/1] alpha: Remove duplicate inclusion of asm/xchg.h
Date: Tue, 20 Nov 2012 07:30:15 +1300
Message-ID: <20121119183015.GA2325@omega>
References: <1353323499-8638-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1353323499-8638-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-alpha@vger.kernel.org, paul.gortmaker@windriver.com, rth@twiddle.net, mattst88@gmail.com, patches@linaro.org

On Mon, Nov 19, 2012 at 04:41:39PM +0530, Sachin Kamat wrote:
> asm/xchg.h was included twice.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/alpha/include/asm/cmpxchg.h |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/cmpxchg.h b/arch/alpha/include/asm/cmpxchg.h
> index 429e8cd..8df1674 100644
> --- a/arch/alpha/include/asm/cmpxchg.h
> +++ b/arch/alpha/include/asm/cmpxchg.h
> @@ -40,7 +40,6 @@
>  #undef ____cmpxchg
>  #define ____xchg(type, args...)		__xchg ##type(args)
>  #define ____cmpxchg(type, args...)	__cmpxchg ##type(args)
> -#include <asm/xchg.h>

asm/xchg.h is intended to be included twice.  Your patch will break 
compilation.

Cheers
Michael.


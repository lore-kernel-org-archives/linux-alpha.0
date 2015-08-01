From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC] alpha: use asm-generic/io.h
Date: Fri, 31 Jul 2015 18:00:15 -0700
Message-ID: <55BC1A1F.4090702@roeck-us.net>
References: <1438389509-16908-1-git-send-email-mcgrof@do-not-panic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=roeck-us.net; s=default;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:Message-ID; bh=xwYpdzwJbtjBWiEusZz05xRhUWreJInnWfyo4dgxzUg=;
	b=D879blhv7MzrIKU1gvFRXxeDeaHIyb4OA/73EYQ7bS6fER46z00COcxS45ReOIXBvFlAFWbfDdJbynugGeLzKsXMjkbfQpIvLUuR3jjHnXGko20qudqaFYHZBj02GGkP/+5SZcceaFNSeb44HrBWKHjfWI4jNbFu9Ihqn6uA5M4=;
In-Reply-To: <1438389509-16908-1-git-send-email-mcgrof@do-not-panic.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, will.deacon@arm.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, paul.gortmaker@windriver.com, mingo@kernel.org, linux-next@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@suse.com>

On 07/31/2015 05:38 PM, Luis R. Rodriguez wrote:
> From: "Luis R. Rodriguez" <mcgrof@suse.com>
>
> Since alpha does not include asm-generic/io.h it would mean
> alpha folks have to always carefully monitor asm-generic patches
> and before they get merged make sure their own arch implementation
> solution gets added. By using asm-generic/io.h alpha gets sensible
> defaults, in this case ioremap_uc() would be one example, where
> by default it would return NULL, so not implemented. When alpha
> folks get a chance then they can add the appropriate
> implementation.
>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
> Signed-off-by: Luis R. Rodriguez <mcgrof@suse.com>

Doesn't work. Gives me lots of duplicate symbols.

Guenter

> ---
>
> The easy solution *for now* is to just do:
>
> #define ioremap_uc ioremap_nocache
>
> *But* that would have to be done for any other asm-generic/io.h collateral
> evolution, this on the other hand, would get it right for alpha from the
> get-go -- so I ask -- can this please be tested and if it is OK then consider
> it be merged?
>
> If we can't add asm-generic/io.h then the above define replacement would
> be the way to go.
>
>   arch/alpha/include/asm/io.h | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
> index f05bdb4b1cb9..16a5bda42750 100644
> --- a/arch/alpha/include/asm/io.h
> +++ b/arch/alpha/include/asm/io.h
> @@ -581,4 +581,6 @@ extern void outsl (unsigned long port, const void *src, unsigned long count);
>
>   #endif /* __KERNEL__ */
>
> +#include <asm-generic/io.h>
> +
>   #endif /* __ALPHA_IO_H */
>


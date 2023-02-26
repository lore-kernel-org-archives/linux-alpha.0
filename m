From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: remove unused __SLOW_DOWN_IO and SLOW_DOWN_IO definitions
Date: Sat, 25 Feb 2023 21:05:43 -0500
Message-ID: <CAEdQ38Er01WkGqydMSU3VAfiZCJREhOFDRxnujDp53jLVdN7Gg@mail.gmail.com>
References: <20221021201838.306176-1-helgaas@kernel.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x/0MEJE8eloddSd5KLY1ASt9rHQoQE4Cfr7iia6AURE=;
        b=B3g3/YTYCORgwWWLF4iJlTMvpGOrOtxDVMearm05vuwTR7VnMT0YMktYnfCvk57nr6
         hfqtxaNgU6PgokEN5ivb+fO8JHuAy9tDAHSYdronSPdV40rOwvs67vCY3JbFS6hpalYI
         IBhVDQKDiCacYQVx/+d5qp4MTicO6/dFPzpIYZgQWcT45FC/1OH3wQodzbJDX3/6+y48
         2safF1xZbnZH3ShH5FohXsbA0PuBzXkxWn0DscXRRMGHTUAVTaFZyS5Z4tJmN6kivzpW
         CL+/wea8RiPywO3F2clR10qtGPH1xwoGq9K6gWC23dVR2CFmNIrb340Z1ohKZv6HvsdX
         xL7A==
In-Reply-To: <20221021201838.306176-1-helgaas@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>

On Fri, Oct 21, 2022 at 4:18 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Remove unused __SLOW_DOWN_IO and SLOW_DOWN_IO definitions.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>
> [Sorry for the noise; I sent this a few minutes ago, but it bounced from
> all the individual recipients because of DMARC issues]
>
> Previously posted v1 4/15/2022 at
>   https://lore.kernel.org/all/20220415190817.842864-1-helgaas@kernel.org/
> and reposted v1 10/13/2022 at
>   https://lore.kernel.org/all/20221014001911.3342485-1-helgaas@kernel.org/
>
> Changes from v1 to v2:
>   - Drop the ia64 patch because Andrew applied it
>       https://lore.kernel.org/all/20221021045245.99636C433C1@smtp.kernel.org/
>
>   - Split sh and alpha to separate series
>
>  arch/alpha/include/asm/io.h | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
> index 1c3605d874e9..7aeaf7c30a6f 100644
> --- a/arch/alpha/include/asm/io.h
> +++ b/arch/alpha/include/asm/io.h
> @@ -14,10 +14,6 @@
>     the implementation we have here matches that interface.  */
>  #include <asm-generic/iomap.h>
>
> -/* We don't use IO slowdowns on the Alpha, but.. */
> -#define __SLOW_DOWN_IO do { } while (0)
> -#define SLOW_DOWN_IO   do { } while (0)
> -
>  /*
>   * Virtual -> physical identity mapping starts at this offset
>   */
> --
> 2.25.1
>

Thanks for the patch! This was included in my pull request today and
is now upstream in Linus' tree.

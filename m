From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH 06/15] alpha: don't use module_init for non-modular core code
Date: Thu, 28 May 2015 22:51:11 -0700
Message-ID: <CAEdQ38GBZkOuDb=Qu2ddXEV9B+q0F6f=fL3pTm13-r5WA3LHsA@mail.gmail.com>
References: <1432860493-23831-1-git-send-email-paul.gortmaker@windriver.com> <1432860493-23831-7-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=yHmpUfSDwBMBCXSevuN7dTjnr+mj/POBz7C7o+Lilko=;
        b=Cp85JaD6alWHyMoso2FE+Yo2eatz+5Yxyuh3epymX8b1zrGGCt+OWy+bOVlJxEVacj
         Zk33oL+C7wF4NvxGk2Bd5/wXMowCgCcVvee4UOgT5iRlg5TyKmLWE65zlHTHGb4yU1ng
         lYx2AzVTEgca/Se88lgU4z0NSlzxXZf4lUcq63UoGaR7MZZ7O1zHABRP+ARqaoNm8Y3i
         w6UHdC99IIBthqjlPtTLimsoYlUjp1ja1U4OTy+KHdm0PdajQB2nka3wUBEVH32VCqEe
         ixy4A5K5ymr2RcR0VEZf9hN+AFqBRQUOB5QX5xRW92kzuf1wxMYce9dNAQiBiRrabJIt
         qbww==
In-Reply-To: <1432860493-23831-7-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha <linux-alpha@vger.kernel.org>

On Thu, May 28, 2015 at 5:48 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> The srm console is always built in.  It will never be modular,
> so using module_init as an alias for __initcall is rather
> misleading.
>
> Fix this up now, so that we can relocate module_init from
> init.h into module.h in the future.  If we don't do this, we'd
> have to add module.h to obviously non-modular code, and that
> would be a worse thing.
>
> Direct use of __initcall is discouraged, vs prioritized ones.
> Use of device_initcall is consistent with what __initcall
> maps onto, and hence does not change the init order, making the
> impact of this change zero.   Should someone with real hardware
> for boot testing want to change it later to arch_initcall or
> console_initcall, they can do that at a later date.
>
> Cc: Richard Henderson <rth@twiddle.net>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
> Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> Cc: Matt Turner <mattst88@gmail.com>
> Cc: linux-alpha@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---

I included this in my pull request to Linus that went upstream
yesterday. Thanks!

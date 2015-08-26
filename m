From: Richard Henderson <rth@twiddle.net>
Subject: Re: Ping Re: [PATCH 0/8] math-emu: Update kernel math-emu code from
 current glibc soft-fp
Date: Wed, 26 Aug 2015 12:48:35 -0700
Message-ID: <55DE1813.7030901@twiddle.net>
References: <alpine.DEB.2.10.1507021542380.29415@digraph.polyomino.org.uk>
 <alpine.DEB.2.10.1508191433380.11312@digraph.polyomino.org.uk>
 <1440026806.13406.2.camel@ellerman.id.au>
 <alpine.DEB.2.10.1508261442440.13146@digraph.polyomino.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=AXEVF0WpvdxVLP7fLqUjPN2WEYrel/An3XdJd53XQ+I=;
        b=qxzIFZf+2WkqZ4bONqvLfpc4Vs8vQt8mmgeJR1e9IohlyVhY435Nu6WgzbRWV6xJ86
         gX/JrBODuyTXW2yC65U+sBOyOP66QnE77JL6MBP3kiFo10qmfdbb5GMm2dy/3jVZ2z8Z
         FmFfy1g2a3YTzIQZQO0a1PC2qZZoYQqvYhO2S5H1XmY7a/OM2ASwRlvRCgwJLSpwbnbN
         t6bUCrUHFLlBJs2pBH8utO26DLVnKYrng3LbgHjIY2riwIjersAFJ6sFn1F3kPSIM/7B
         2BYjlXIQbfIdKjjUwEG1/F9UfYBfvLOclFinMudgynPHH3BYW7NIzZb9QZsJcILYVhH1
         q1Pw==
In-Reply-To: <alpine.DEB.2.10.1508261442440.13146@digraph.polyomino.org.uk>
Sender: linux-sh-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Joseph Myers <joseph@codesourcery.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org

On 08/26/2015 07:44 AM, Joseph Myers wrote:
> On Thu, 20 Aug 2015, Michael Ellerman wrote:
>
>> On Wed, 2015-08-19 at 14:39 +0000, Joseph Myers wrote:
>>> I'd like to ping this patch series, not having seen any comments on it.
>>>
>>> [PATCH 0/8] math-emu: Update kernel math-emu code from current glibc soft-fp
>>> https://lkml.org/lkml/2015/7/2/394
>>>
>>> [PATCH 1/8] math-emu: Move math-emu to math-emu-old
>>> https://lkml.org/lkml/2015/7/2/395
>>>
>>> [PATCH 2/8] math-emu: Import current glibc soft-fp as include/math-emu
>>> https://lkml.org/lkml/2015/7/2/398
>>>
>>> [PATCH 3/8] alpha/math-emu: Move alpha from math-emu-old to math-emu
>>> https://lkml.org/lkml/2015/7/2/399
>>>
>>> [PATCH 4/8] powerpc/math-emu: Move powerpc from math-emu-old to math-emu
>>> https://lkml.org/lkml/2015/7/2/400
>>>
>>> [PATCH 5/8] s390/math-emu: Move s390 from math-emu-old to math-emu
>>> https://lkml.org/lkml/2015/7/2/401
>>>
>>> [PATCH 6/8] sh/math-emu: Move sh from math-emu-old to math-emu
>>> https://lkml.org/lkml/2015/7/2/402
>>>
>>> [PATCH 7/8] sparc/math-emu: Move sparc from math-emu-old to math-emu
>>> https://lkml.org/lkml/2015/7/2/404
>>>
>>> [PATCH 8/8] math-emu: Remove math-emu-old
>>> https://lkml.org/lkml/2015/7/2/405
>>>
>>> As noted in patch 0, the dependencies are as follows: patch 2 depends on
>>> patch 1, patches 3-7 depend on patches 1 and 2 but are independent of each
>>> other, patch 8 depends on all the other patches.
>>
>> Hi Joseph,
>>
>> I have done some testing on powerpc, and it seems good.
>>
>> I'm reluctant to proceed with merging them though until we've heard at least
>> *something* from the other maintainers.
>
> Ping again for the other-architecture maintainers (alpha, s390, sh,
> sparc)....
>

I thought I already gave an

Acked-by: Richard Henderson <rth@twiddle.net>

for the alpha patches.


r~

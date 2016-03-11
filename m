From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH v3 0/4] generic relative extable support
Date: Fri, 11 Mar 2016 07:41:17 +0700
Message-ID: <CAKv+Gu-WR3ssyaA+cXCgATJeq=1SgRr-dtqYdfDu3-pBoeXUBQ@mail.gmail.com>
References: <1457620996-462-1-git-send-email-ard.biesheuvel@linaro.org>
	<20160310140702.0c1fd6129a62d10dadd5f3c3@linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc;
        bh=YlE6YIR20SoKq9P+5t/G0nxe/5IioxDkWb67D0VU/os=;
        b=CQy69Eog1kk4zdwsl+BWBy9VJat8jdECr4xkyqBt6TT/3PN8JlEkY+EC0GOHxYYbp7
         W6gsDNmrhHKR5jlx8QkpNCFLGx63CA5+oH8lG1/W5YpaI9cpAuFVmopEr5Pkly0ntnnV
         Zjdt1Q79S7ECYB43/I9bn8rKiE86v3z2v7ABo=
In-Reply-To: <20160310140702.0c1fd6129a62d10dadd5f3c3@linux-foundation.org>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, Tony Luck <tony.luck@intel.com>, Richard Henderson <rth@twiddle.net>, "hpa@zytor.com" <hpa@zytor.com>, Heiko Carstens <heiko.carstens@de.ibm.com>

On 11 March 2016 at 05:07, Andrew Morton <akpm@linux-foundation.org> wrote:
> On Thu, 10 Mar 2016 21:43:12 +0700 Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
[...]
>> ---- v2 blurb ----
>> There are currently four architectures (x86, ia64, alpha and s390) whose
>> user-access exception tables are relative to the table entry address rather
>> than absolute. Each of these architectures has its own search_extable() and
>> sort_extable() implementation, which are not only mostly identical to each
>> other, but also deviate very little from the generic absolute implementations
>> in lib/extable.c that they override.
>>
>> So before making arm64 the fifth architecture that reimplements this, let's
>> refactor the existing code so that all of these architectures use common code
>> for searching and sorting the relative extables. Archs may set
>> ARCH_HAS_RELATIVE_EXTABLE to indicate that the table consists of a pair of
>> relative ints, and may define swap_ex_entry_fixup() if the fixup member needs
>> special treatment in the swapping step of the sorting routine (such as alpha).
>>
>
> I'll want to manually verify that the required patches are upstreamed.
> I assume we're referring to a272858a3c1ecd4a ("extable: add support for
> relative extables to search and sort routines") and related patches?
>

Correct. As long as that single patch is in, these are good to go.

Thanks,
Ard.

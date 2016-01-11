From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH v2 0/6] generic relative extable support
Date: Mon, 11 Jan 2016 14:59:46 +0100
Message-ID: <CAKv+Gu8WW7opaa2ck9kEP91BF=amBo=jejcjnKQB1DgLWvtK3w@mail.gmail.com>
References: <1452007180-27411-1-git-send-email-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=0uupQbjYcl+szuPDpgBEpC4B3j0D/wzsaFuEdgPMEVw=;
        b=SCkNMZTiqV5vstUrmQiy5tZZk1Y+skcOce2Aj77Cd++XgHvd7PzVYFferU8TrStI/Q
         p97m1K/ZJ2OHO9KoC24m4V2YePBB9+c3jm/oVESwyd8dk+vQq4QzoDS6xhHLDcSUgEoq
         FE40XhRnudxltsqP+u0GzQIrbBdO+cQKic86c=
In-Reply-To: <1452007180-27411-1-git-send-email-ard.biesheuvel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, linux-s390@vger.kernel.org, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, schwidefsky@de.ibm.com, Matt Turner <mattst88@gmail.com>, ink@jurassic.park.msu.ru, Richard Henderson <rth@twiddle.net>, Tony Luck <tony.luck@intel.com>, "Yu, Fenghua" <fenghua.yu@intel.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Helge Deller <deller@gmx.de>, Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>

On 5 January 2016 at 16:19, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> There are currently four architectures (x86, ia64, alpha and s390) whose
> user-access exception tables are relative to the table entry address rather
> than absolute. Each of these architectures has its own search_extable() and
> sort_extable() implementation, which are not only mostly identical to each
> other, but also deviate very little from the generic absolute implementations
> in lib/extable.c that they override.
>
> So before making arm64 the fifth architecture that reimplements this, let's
> refactor the existing code so that all of these architectures use common code
> for searching and sorting the relative extables. Archs may set
> ARCH_HAS_RELATIVE_EXTABLE to indicate that the table consists of a pair of
> relative ints, and may define swap_ex_entry_fixup() if the fixup member needs
> special treatment in the swapping step of the sorting routine (such as alpha).
>

[...]

Now that I have collected acks for all the patches, I think this is
good to go in.

@Andrew: since this touches 5 different architectures, is this perhaps
something that could go in via your tree after -rc1?
(assuming that the s390 bugfix has been merged by then)

Thanks,
Ard.

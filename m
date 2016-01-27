From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH v2 resend 6/6] arm64: switch to relative exception tables
Date: Wed, 27 Jan 2016 20:39:23 +0100
Message-ID: <CAKv+Gu8hvxcc6Tiu0q7=HWqkEf4ZLfOvyoLGkp2mEgjz_1R9ew@mail.gmail.com>
References: <1453892123-17973-1-git-send-email-ard.biesheuvel@linaro.org>
	<1453892123-17973-7-git-send-email-ard.biesheuvel@linaro.org>
	<20160127113548.d4f2f2a7029b3b89f0e596da@linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=s7gQPW6KgUpuiyekniurtZyPj2dqOntRRVFQrG579lU=;
        b=M8f2vxUrYz4Rpkecn7F3mvKeNNti8edgI1xV+2SsuVFi3TFk8m3zVew7Ra/eR4HeMy
         Cl42A5iLBaf9sdK8f10+Tt6bw74CmHwQIpIbl8Yz+zEYhzzADXkic09hWHxHbMawPQxB
         62Gp7cQrVSP76ahdXmE26gs+/T2lJsJ9eOqVA=
In-Reply-To: <20160127113548.d4f2f2a7029b3b89f0e596da@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, linux-s390@vger.kernel.org, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Richard Henderson <rth@twiddle.net>, Tony Luck <tony.luck@intel.com>, Will Deacon <will.deacon@arm.com>, Helge Deller <deller@gmx.de>

On 27 January 2016 at 20:35, Andrew Morton <akpm@linux-foundation.org> wrote:
> On Wed, 27 Jan 2016 11:55:23 +0100 Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
>> Instead of using absolute addresses for both the exception location
>> and the fixup, use offsets relative to the exception table entry values.
>> Not only does this cut the size of the exception table in half, it is
>> also a prerequisite for KASLR, since absolute exception table entries
>> are subject to dynamic relocation, which is incompatible with the sorting
>> of the exception table that occurs at build time.
>>
>> This patch also introduces the _ASM_EXTABLE preprocessor macro (which
>> exists on x86 as well) and its _asm_extable assembly counterpart, as
>> shorthands to emit exception table entries.
>
> checkpatch speaketh truth:
>
> ERROR: #define of 'ARCH_HAS_RELATIVE_EXTABLE' is wrong - use Kconfig variables or standard guards instead
> #113: FILE: arch/arm64/include/asm/uaccess.h:56:

That may be true, but it extends an established pattern of #defines in
the various uaccess.h versions, i.e., ARCH_HAS_SORT_EXTABLE, and
ARCH_HAS_SEARCH_EXTABLE

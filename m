From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH 6/6] arm64: switch to relative exception tables
Date: Mon, 4 Jan 2016 20:28:52 +0100
Message-ID: <CAKv+Gu-n70=Kdf2NtygzYxEURO+Dnk1cmMX6D3gmXQ1E5-PHUA@mail.gmail.com>
References: <1451837157-447-1-git-send-email-ard.biesheuvel@linaro.org>
	<1451837157-447-7-git-send-email-ard.biesheuvel@linaro.org>
	<20160104144643.GE1616@arm.com>
	<568AB65A.8030901@zytor.com>
	<3908561D78D1C84285E8C5FCA982C28F39FA127B@ORSMSX114.amr.corp.intel.com>
	<568AC64A.4090601@zytor.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=BCDPRiDSO9/LeyyutVLwOU7KJ/NcdlTyiuVoxwANQBU=;
        b=Ul+IJE5yPqCqnwjrxgGbfIV2i8PGoS4J8qcRr3VA2VR243HjB0SBC1YTagniY4LN+3
         7q4E+eYBEneJarQ5wwNa/bUPdjOj6NWw7tGYav1wzBDmUbJIyx17b/ljcgENLXC7mgQj
         GxuWE3Him2aXrx/MC69ACJoKLvY76ByQhqcbs=
In-Reply-To: <568AC64A.4090601@zytor.com>
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, Will Deacon <will.deacon@arm.com>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>, "schwidefsky@de.ibm.com" <schwidefsky@de.ibm.com>, "mattst88@gmail.com" <mattst88@gmail.com>, "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>, "rth@twiddle.net" <rth@twiddle.net>, "Yu, Fenghua" <fenghua.yu@intel.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "arnd@arndb.de" <arnd@arndb.de>, "akpm@linux-foundation.org" <akpm@linux-foun>

On 4 January 2016 at 20:21, H. Peter Anvin <hpa@zytor.com> wrote:
> On 01/04/2016 10:20 AM, Luck, Tony wrote:
>>> May I humbly ask why the [Finnish] you don't use the equivalent of the
>>> x86 _ASM_EXTABLE() macro?  In fact, why don't we make that one generic, too?
>>
>> I'm messing with that right now (with help from Andy Lutomirski and Boris) to
>> add different classes of exception table (so I can tag some instructions as being
>> suitable for fixup from the machine check handler).  So it might not be generic
>> for much longer.
>>
>> http://marc.info/?l=linux-kernel&m=145187079504846&w=2
>>
>
> I suspect that means we will also need to go back to arch-specific
> sorting for x86.
>

AFAICT, Tony's patches are not incompatible with mine. The fixup
address is offset with a large constant, but this does not affect the
sort order (since that is based on the other member), and the swap
operation that adds/subtracts the delta should not care about the
class bits. (I don't see any changes to sort_extable() in Tony's
patch)

@Tony: any comments? And do you have any objections to the ia64 patch
in this series?

I agree that it makes sense to define a macro to emit the extable
entries in this patch, but I am not sure how that extrapolates to the
other architectures, and testing those is going to be cumbersome for
me, so I'd prefer to keep that a local change for arm64 for now.

Thanks,
Ard.

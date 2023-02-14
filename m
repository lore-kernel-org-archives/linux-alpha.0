From: WANG Xuerui <kernel@xen0n.name>
Subject: Re: [PATCH v3 10/24] sparc: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 16:59:46 +0800
Message-ID: <f3db61bb-5c89-2724-769f-9d606f587f92__2604.05142778239$1676369872$gmane$org@xen0n.name>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-11-alexghiti@rivosinc.com>
 <017f0b40-8021-8b3b-24d2-c70661b6b292@omp.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
        t=1676365191; bh=i0XIzR1Y5NYJLkaxQFngDX1j91Olf/QjeHaXDd3DD/c=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=AhilTiebsZniB4h/3TCzhrMAQ0m1fI8D/hKY2T+4ArseJ+m3Ze12b64a7BZ4L0BhC
         Cbii2w7OdAf8LC8paKh0dS4uxyxEGslyDxyzPafGMqQIX/0BH2c+SoMYy+3DyDz8fs
         BbZrEFqt55X8c4cMx2sqOxvYHoYE3tKQfpxZHtYc=
Content-Language: en-US
In-Reply-To: <017f0b40-8021-8b3b-24d2-c70661b6b292@omp.ru>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.l>
Cc: Palmer Dabbelt <palmer@rivosinc.com>

On 2023/2/14 16:50, Sergey Shtylyov wrote:
> On 2/14/23 10:49 AM, Alexandre Ghiti wrote:
> 
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> As far as I can tell this is not used by userspace and thus should not
>> be part of the user-visible API.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>   arch/sparc/include/asm/setup.h      | 6 +++++-
>>   arch/sparc/include/uapi/asm/setup.h | 7 -------
>>   2 files changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/sparc/include/asm/setup.h b/arch/sparc/include/asm/setup.h
>> index 72205684e51e..d1384ed92547 100644
>> --- a/arch/sparc/include/asm/setup.h
>> +++ b/arch/sparc/include/asm/setup.h
>> @@ -7,7 +7,11 @@
>>   
>>   #include <linux/interrupt.h>
>>   
>> -#include <uapi/asm/setup.h>
>> +#if defined(__sparc__) && defined(__arch64__)
> 
>     Mhm, I don't think these two can be #define'd simulaneously...

I believe it's just a SPARC-ism [1] [2] that may look strange and be 
easily confused for __aarch64__ (notice the extra 'a')...

[1]: 
https://github.com/gcc-mirror/gcc/blob/basepoints/gcc-12/gcc/config/sparc/sparc.h#L301
[2]: 
https://github.com/llvm/llvm-project/blob/llvmorg-17-init/clang/lib/Basic/Targets/Sparc.cpp#L241

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/


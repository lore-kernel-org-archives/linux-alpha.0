From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v3 19/24] parisc: Remove empty <uapi/asm/setup.h>
Date: Tue, 14 Feb 2023 10:44:14 +0100
Message-ID: <32c2584a-8777-26b9-ae29-80df9dfa7833__18468.0381835037$1676367975$gmane$org@gmx.de>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-20-alexghiti@rivosinc.com>
 <6f9c7a6b-4f6b-dead-2d9b-14b405f18397@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1676367870; bh=ERFp+UKx/iNbj6Y6kJUSMmT/xdPleSppwgENqVxf/VM=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=Za6u4dReX/HTRyphBPafGiLsxCJ+KKmFXzBp1N3wK/BdK0FrKi1Znyq7KSHyqIyd/
         kgfg1K7p6XNdoVzNndtK42V0pk1FbtgyitZSCQWfWujqXuBYwphv2YLUpu/j4syKSL
         9RAZMIGf3dW2anwxyU5UMo1EVcbifIrk3T62A2sIhCPMYdsaAzhIY5t2nwHlg40Zt7
         HtazUlk5mlSfLPOR/KKhdC1Dq5qLUvlQDvzaYGy2cDXLDVpukIxIWr8q4OHqWuB3tT
         6cx52IlEbcB5iPGAwJpjsjaFv5wT4dz6E7YwfLhROeby+gu9v1sPXxrdEBwhQ+jslK
         7mKSZA/LRAQdg==
Content-Language: en-US
In-Reply-To: <6f9c7a6b-4f6b-dead-2d9b-14b405f18397@linaro.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Chr
Cc: Palmer Dabbelt <palmer@rivosinc.com>

On 2/14/23 10:08, Philippe Mathieu-Daud=C3=A9 wrote:
> On 14/2/23 08:49, Alexandre Ghiti wrote:
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>> =C2=A0 arch/parisc/include/uapi/asm/setup.h | 5 -----
>> =C2=A0 1 file changed, 5 deletions(-)
>> =C2=A0 delete mode 100644 arch/parisc/include/uapi/asm/setup.h
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Helge Deller <deller@gmx.de>



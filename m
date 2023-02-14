From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v3 08/24] parisc: Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 10:43:32 +0100
Message-ID: <dd3f45ec-9578-420b-f1b8-5657fe4d3243__48063.8917930023$1676367938$gmane$org@gmx.de>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-9-alexghiti@rivosinc.com>
 <f327ff48-cd50-4caa-1bea-f9906994e998@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1676367828; bh=bQoG1+qM5Y71xKKNzZAaZKaP54c9/SNL37IJdDcFtMo=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=hihBALAdzJyyuZETKMDTwWBNqyHXT30m1W4+AhNia2aTQ0LGuEudgVjxHBOHc2O/1
         UjuZRvBAir2lTKIaMXuW6l0Jw91yPNhbGpel182Mf/orVb0S6hbISDciYTF54Wy0Zw
         wKM8GKPXEv0aT0K01aIbMc2I219r5PhnIgwwHqOrDmQNcp8nxxBkNf4BBrtdpN/N7Z
         59rGu8CnZqH+X/PEx5ZjDiRwnWNihqf8TyIZs4ozwDLocxhsUitLIrPfomEmdZ19Fu
         jPeCxrDIg0fC138zUyXarDYIQDPoI7A4vyTzEHVqChiz/r0Bk56Uo8AseQSt7S8yL1
         B3Eipy4Ux8oWA==
Content-Language: en-US
In-Reply-To: <f327ff48-cd50-4caa-1bea-f9906994e998@linaro.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Chr
Cc: Palmer Dabbelt <palmer@rivosinc.com>

On 2/14/23 10:08, Philippe Mathieu-Daud=C3=A9 wrote:
> On 14/2/23 08:49, Alexandre Ghiti wrote:
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> As far as I can tell this is not used by userspace and thus should not
>> be part of the user-visible API.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>> =C2=A0 arch/parisc/include/asm/setup.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
7 +++++++
>> =C2=A0 arch/parisc/include/uapi/asm/setup.h | 2 --
>> =C2=A0 2 files changed, 7 insertions(+), 2 deletions(-)
>> =C2=A0 create mode 100644 arch/parisc/include/asm/setup.h
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Helge Deller <deller@gmx.de>




From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 09/24] powerpc: Remove COMMAND_LINE_SIZE from uapi
Date: Wed, 15 Feb 2023 18:04:04 +1100
Message-ID: <87357776l7.fsf__21792.3158708558$1676444725$gmane$org@mpe.ellerman.id.au>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-10-alexghiti@rivosinc.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1676444666;
        bh=JUTkPQAgfduuGSuPZGMfN9jX5ig96F9RnCKqmUbpwX8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=c9jhtw7yA0XcW4ZIPKehScWAnBIE+yzQpATJfnqks6S8ZJ2HNm+BGFL2euWeBOt8a
         OhWOKbt3aSBVpTmFcz15w7a7UuhkDO05uNLtnmT22dKVJC01MB7W9tPpnBm9YQMsGK
         RYNgu0G4CP5zVuci+an4PNoxZ0HU0g5JR/uSa4eE8zpo9iyyuHKEmh9FPQybvgw+KY
         d58FT+wdEKfgJkLAPaL0Cw6X5qfGspbdggu7TZ1U8VrT0mS5Jx5jrv8cpfFyy5N9KE
         2xLTt+2MVtXNE6iyfLrIZtYM6caEuBGdw8QxqlgG0gE7FVIBHx1EiyfBSI2iWVwldk
         /dc0iTP1Vtrhw==
In-Reply-To: <20230214074925.228106-10-alexghiti@rivosinc.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walms>
Cc: Palmer Dabbelt <palmer@rivosinc.com>

Alexandre Ghiti <alexghiti@rivosinc.com> writes:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> As far as I can tell this is not used by userspace and thus should not
> be part of the user-visible API.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/powerpc/include/asm/setup.h      | 2 +-
>  arch/powerpc/include/uapi/asm/setup.h | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

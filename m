From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] mm: generalize ZONE_[DMA|DMA32]
Date: Tue, 01 Jun 2021 12:56:10 +1000
Message-ID: <87k0negunp.fsf@mpe.ellerman.id.au>
References: <20210527143047.123611-1-wangkefeng.wang@huawei.com>
 <20210528074557.17768-1-wangkefeng.wang@huawei.com>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1622516184;
        bh=iY7MeF5kJVTgb76PGSIe64N6mVxLFvLQ+P911N0MgIM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=mgyJJS7Mpwj0xHxjTQUJCbxWXBqEpx7u6kJmlJrory1kepRlcJMq86u8b7CRC0TBx
         2eKAPApa1yyT+8Bx3Nq7xXqq+U0aoxEZ+zVk8LZNufbS19MjY54JklUeikWPo3saVu
         rZYPlntAMlPhhFnF6Z4PsS/40mD9BayKN5dAP0deDvSFY91SZJGkqyvQLfTKpVKAj7
         nHaMrjkuyFLjQPzypNJGHxewO6DV/mxxi6HJjuKa/Hbn4YkWBejjdidjhax1ODsJHB
         2xtaQQzhaLoYsK439xsAx0/uvUVbRJkkNCZEwtolQgis+ZjvEfMSx7TFq4rv4vlYtC
         mKEDQ5CYN2DQw==
In-Reply-To: <20210528074557.17768-1-wangkefeng.wang@huawei.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, Kefeng Wang <wangkefeng.wang@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "David S. Miller" <davem@davemloft.net>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>, Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>

Kefeng Wang <wangkefeng.wang@huawei.com> writes:
> ZONE_[DMA|DMA32] configs have duplicate definitions on platforms
> that subscribe them. Instead, just make them generic options which
> can be selected on applicable platforms.
>
> Also only x86/arm64 architectures could enable both ZONE_DMA and
> ZONE_DMA32 if EXPERT, add ARCH_HAS_ZONE_DMA_SET to make dma zone
> configurable and visible on the two architectures.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Russell King <linux@armlinux.org.uk>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com> # for arm64
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # for m68k
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> v2:
> -i386 can't enable ZONE_DMA32, fix it.
> -make ZONE_DMA default y on X86 as before.
> -collect ACKs
>
>  arch/alpha/Kconfig                     |  5 +----
>  arch/arm/Kconfig                       |  3 ---
>  arch/arm64/Kconfig                     |  9 +--------
>  arch/ia64/Kconfig                      |  4 +---
>  arch/m68k/Kconfig                      |  5 +----
>  arch/microblaze/Kconfig                |  4 +---
>  arch/mips/Kconfig                      |  7 -------
>  arch/powerpc/Kconfig                   |  4 ----
>  arch/powerpc/platforms/Kconfig.cputype |  1 +

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

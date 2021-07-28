From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] arch: Kconfig: clean up obsolete use of HAVE_IDE
Date: Wed, 28 Jul 2021 12:53:29 -0700
Message-ID: <0dcbd285-0fab-cc58-7f1a-013263f9cb45@infradead.org>
References: <20210728182115.4401-1-lukas.bulwahn@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=ceYcn2BX8bAIVCFE8i/J5S2LBC9zV6/rYm2vca9y+zQ=; b=CbeXGXPtzC+++YgD0UKs3sCy4z
        xjIr2ccAUu8H1jL4QUMfTB39zViFf56ayjzZi2T+pyDMcOuFqrGpSUuEsx7kmRSSFI1Lnb4QROgsz
        BZ7rB3SsLcKQD2pb7KyvPyT+J5tztT+NwkZrQMNxK7pFmj8gCKI4+0PDnVimm1wxeH6HASB75HMWb
        uGvf3CRDW2Dgd3bB9/rGbedgA8x3IDtFaTCO6L3w1PWQzgII6RsdMKQ1K18s+s2ez4rhf0Bj2f2hW
        dpU8E8W2SWb9TQaCJqguSH2zqOSNSKYtkaBFpJu9ZYIGAUzcoM7u2FUrNfaZQcWuJgxKtnBwAaDWC
        dfiv6KQQ==;
In-Reply-To: <20210728182115.4401-1-lukas.bulwahn@gmail.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 7/28/21 11:21 AM, Lukas Bulwahn wrote:
> The arch-specific Kconfig files use HAVE_IDE to indicate if IDE is
> supported.
> 
> As IDE support and the HAVE_IDE config vanishes with commit b7fb14d3ac63
> ("ide: remove the legacy ide driver"), there is no need to mention
> HAVE_IDE in all those arch-specific Kconfig files.
> 
> The issue was identified with ./scripts/checkkconfigsymbols.py.
> 
> Fixes: b7fb14d3ac63 ("ide: remove the legacy ide driver")
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  arch/alpha/Kconfig            | 1 -
>  arch/arm/Kconfig              | 6 ------
>  arch/arm/mach-davinci/Kconfig | 1 -
>  arch/h8300/Kconfig.cpu        | 1 -
>  arch/ia64/Kconfig             | 1 -
>  arch/m68k/Kconfig             | 1 -
>  arch/mips/Kconfig             | 1 -
>  arch/parisc/Kconfig           | 1 -
>  arch/powerpc/Kconfig          | 1 -
>  arch/sh/Kconfig               | 1 -
>  arch/sparc/Kconfig            | 1 -
>  arch/x86/Kconfig              | 1 -
>  arch/xtensa/Kconfig           | 1 -
>  13 files changed, 18 deletions(-)
> 


-- 
~Randy


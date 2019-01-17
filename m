From: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH 19/21] treewide: add checks for the return value of
 memblock_alloc*()
Date: Thu, 17 Jan 2019 15:06:03 +0800
Message-ID: <20190117070602.GA31839@guoren-Inspiron-7460>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547708777;
        bh=YQg5kK0CK1gygp8V+fUKHMM30p/aVFKoBFNquIpl8z4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0pw3ulKi3jq4oKmvxSJxzzJsSdMcohB7IigecglkQT5Rx7a1QVi6VMiKG+7/EaK5C
         /1jqt2buqhHUph/IaPf93BCvJIFaI+XBcHutXpZ8WKrpTTySrlp18ZPjm07/tBc6Eg
         nedbQORGuNF/Dh36ZedpPIbDbRoH11rc3m/ItgOI=
Content-Disposition: inline
In-Reply-To: <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.>

On Wed, Jan 16, 2019 at 03:44:19PM +0200, Mike Rapoport wrote:
>  arch/csky/mm/highmem.c                    |  5 +++++
...
> diff --git a/arch/csky/mm/highmem.c b/arch/csky/mm/highmem.c
> index 53b1bfa..3317b774 100644
> --- a/arch/csky/mm/highmem.c
> +++ b/arch/csky/mm/highmem.c
> @@ -141,6 +141,11 @@ static void __init fixrange_init(unsigned long start, unsigned long end,
>  			for (; (k < PTRS_PER_PMD) && (vaddr != end); pmd++, k++) {
>  				if (pmd_none(*pmd)) {
>  					pte = (pte_t *) memblock_alloc_low(PAGE_SIZE, PAGE_SIZE);
> +					if (!pte)
> +						panic("%s: Failed to allocate %lu bytes align=%lx\n",
> +						      __func__, PAGE_SIZE,
> +						      PAGE_SIZE);
> +
>  					set_pmd(pmd, __pmd(__pa(pte)));
>  					BUG_ON(pte != pte_offset_kernel(pmd, 0));
>  				}

Looks good for me and panic is ok.

Reviewed-by: Guo Ren <ren_guo@c-sky.com>

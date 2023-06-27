From: Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH v1 02/10] mm: pass gfp flags and order to vma_alloc_zeroed_movable_folio()
Date: Mon, 26 Jun 2023 20:27:04 -0600
Message-ID: <CAOUHufYWtsAU4PvKpVhzJUeQb9cd+BifY9KzgceBXHp2F2dDRg@mail.gmail.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com> <20230626171430.3167004-3-ryan.roberts@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687832860; x=1690424860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOhy3g1phCLJAkpl2TbZcPe+XFOt300zTop8dH8V1+o=;
        b=SjT+NGU/KYp0j20S0Aem+ucWhH5rMWKMTvqrWJZGHCXKNk/LoqG+k6xJDmv+G7pu6D
         36lTPzR3ohTT2iCmphZKpBld1mzuq6LD9UPdJrMSOKVZrcoMrbToMUK05vMKSq7Mqco1
         ngdqtresiHFCt8k60Ed9MKzMJXlF1YO1/KSGjmI4plvCYnWxPaPtbifQP5Dr0f9dUdkE
         GOFP80hxOfsDuSqNAN8sVcWkRnMvxffTxmCL0n1l8BnOLfZyjhJ7DL36iVd+FjFhPi7M
         T7Qm+yGTZOGslzbLI83m17T3pWe5b3GUGHWu43CR9f/xk0/lyDWAL09H8sRgioiTAqyD
         rSyw==
In-Reply-To: <20230626171430.3167004-3-ryan.roberts@arm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists

On Mon, Jun 26, 2023 at 11:14=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com=
> wrote:
>
> Allow allocation of large folios with vma_alloc_zeroed_movable_folio().
> This prepares the ground for large anonymous folios. The generic
> implementation of vma_alloc_zeroed_movable_folio() now uses
> clear_huge_page() to zero the allocated folio since it may now be a
> non-0 order.
>
> Currently the function is always called with order 0 and no extra gfp
> flags, so no functional change intended. But a subsequent commit will
> take advantage of the new parameters to allocate large folios. The extra
> gfp flags will be used to control the reclaim policy.
>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/alpha/include/asm/page.h   |  5 +++--
>  arch/arm64/include/asm/page.h   |  3 ++-
>  arch/arm64/mm/fault.c           |  7 ++++---
>  arch/ia64/include/asm/page.h    |  5 +++--
>  arch/m68k/include/asm/page_no.h |  7 ++++---
>  arch/s390/include/asm/page.h    |  5 +++--
>  arch/x86/include/asm/page.h     |  5 +++--
>  include/linux/highmem.h         | 23 +++++++++++++----------
>  mm/memory.c                     |  5 +++--
>  9 files changed, 38 insertions(+), 27 deletions(-)
>
> diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.=
h
> index 4db1ebc0ed99..6fc7fe91b6cb 100644
> --- a/arch/alpha/include/asm/page.h
> +++ b/arch/alpha/include/asm/page.h
> @@ -17,8 +17,9 @@
>  extern void clear_page(void *page);
>  #define clear_user_page(page, vaddr, pg)       clear_page(page)
>
> -#define vma_alloc_zeroed_movable_folio(vma, vaddr) \
> -       vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO, 0, vma, vaddr,=
 false)
> +#define vma_alloc_zeroed_movable_folio(vma, vaddr, gfp, order) \
> +       vma_alloc_folio(GFP_HIGHUSER_MOVABLE | __GFP_ZERO | (gfp), \
> +                       order, vma, vaddr, false)

I don't think we need to worry about gfp if we want to make a minimum
series. There would be many discussion points around it, e.g., I
already disagree with what you chose: GFP_TRANSHUGE_LIGHT would be
more suitable than __GFP_NORETRY, and there are even better options
than GFP_TRANSHUGE_LIGHT.

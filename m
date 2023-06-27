From: Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH v1 08/10] mm: Kconfig hooks to determine max anon folio
 allocation order
Date: Mon, 26 Jun 2023 20:47:17 -0600
Message-ID: <CAOUHufZ5pAR=ySs7YyoUpum2_6tJ9jM-H608ZeQucguNGAfKTw@mail.gmail.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com> <20230626171430.3167004-9-ryan.roberts@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687834073; x=1690426073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOHMGk1IHW9nIXyoyhy6ScxjHGO05nJh9iYXmQJ8lRg=;
        b=4Hxtqyz9AC5uq4MuNdUiUTytvXCSHBztZ8M76g0ceKIjnz0PJbRxq4j9xf48iqBl8z
         uOAa0SjGLlNiOmuesNGIjV6ZEtAaql+t7LaLclTsqLdjWGgtUyTYHYxqyoUKW5PZ8+oA
         CPN8+kFMBzGza8w1PEdpNYj3T/H/D2g1+h2yVb1dOKdEkXl3MW7xWHGuBNIsJuI2dpbL
         u9j8wwh7+YY8qKVkw+4OZp6+QPdQwuDjHdLCq2f4ovoXXEUt0D33oYlhzfMu86LnMiFd
         H0aY0bwtPf9reOaOak+4TqM+JB8fShj+0qc6i2vJ8aAkdg1fOGJQnnkCnCjBag5lncQf
         /4HA==
In-Reply-To: <20230626171430.3167004-9-ryan.roberts@arm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists

On Mon, Jun 26, 2023 at 11:15=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com=
> wrote:
>
> For variable-order anonymous folios, we need to determine the order that
> we will allocate. From a SW perspective, the higher the order we
> allocate, the less overhead we will have; fewer faults, fewer folios in
> lists, etc. But of course there will also be more memory wastage as the
> order increases.
>
> From a HW perspective, there are memory block sizes that can be
> beneficial to reducing TLB pressure. arm64, for example, has the ability
> to map "contpte" sized chunks (64K for a 4K base page, 2M for 16K and
> 64K base pages) such that one of these chunks only uses a single TLB
> entry.
>
> So we let the architecture specify the order of the maximally beneficial
> mapping unit when PTE-mapped. Furthermore, because in some cases, this
> order may be quite big (and therefore potentially wasteful of memory),
> allow the arch to specify 2 values; One is the max order for a mapping
> that _would not_ use THP if all size and alignment constraints were met,
> and the other is the max order for a mapping that _would_ use THP if all
> those constraints were met.
>
> Implement this with Kconfig by introducing some new options to allow the
> architecture to declare that it supports large anonymous folios along
> with these 2 preferred max order values. Then introduce a user-facing
> option, LARGE_ANON_FOLIO, which defaults to disabled and can only be
> enabled if the architecture has declared its support. When disabled, it
> forces the max order values, LARGE_ANON_FOLIO_NOTHP_ORDER_MAX and
> LARGE_ANON_FOLIO_THP_ORDER_MAX to 0, meaning only a single page is ever
> allocated.
>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  mm/Kconfig  | 39 +++++++++++++++++++++++++++++++++++++++
>  mm/memory.c |  8 ++++++++
>  2 files changed, 47 insertions(+)
>
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 7672a22647b4..f4ba48c37b75 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1208,4 +1208,43 @@ config PER_VMA_LOCK
>
>  source "mm/damon/Kconfig"
>
> +config ARCH_SUPPORTS_LARGE_ANON_FOLIO
> +       def_bool n
> +       help
> +         An arch should select this symbol if wants to allow LARGE_ANON_=
FOLIO
> +         to be enabled. It must also set the following integer values:
> +         - ARCH_LARGE_ANON_FOLIO_NOTHP_ORDER_MAX
> +         - ARCH_LARGE_ANON_FOLIO_THP_ORDER_MAX
> +
> +config ARCH_LARGE_ANON_FOLIO_NOTHP_ORDER_MAX
> +       int
> +       help
> +         The maximum size of folio to allocate for an anonymous VMA PTE-=
mapping
> +         that does not have the MADV_HUGEPAGE hint set.
> +
> +config ARCH_LARGE_ANON_FOLIO_THP_ORDER_MAX
> +       int
> +       help
> +         The maximum size of folio to allocate for an anonymous VMA PTE-=
mapping
> +         that has the MADV_HUGEPAGE hint set.
> +
> +config LARGE_ANON_FOLIO
> +       bool "Allocate large folios for anonymous memory"
> +       depends on ARCH_SUPPORTS_LARGE_ANON_FOLIO
> +       default n
> +       help
> +         Use large (bigger than order-0) folios to back anonymous memory=
 where
> +         possible. This reduces the number of page faults, as well as ot=
her
> +         per-page overheads to improve performance for many workloads.
> +
> +config LARGE_ANON_FOLIO_NOTHP_ORDER_MAX
> +       int
> +       default 0 if !LARGE_ANON_FOLIO
> +       default ARCH_LARGE_ANON_FOLIO_NOTHP_ORDER_MAX
> +
> +config LARGE_ANON_FOLIO_THP_ORDER_MAX
> +       int
> +       default 0 if !LARGE_ANON_FOLIO
> +       default ARCH_LARGE_ANON_FOLIO_THP_ORDER_MAX
> +
>  endmenu

I don't think an MVP should add this many Kconfigs. One Kconfig sounds
reasonable to me for now.

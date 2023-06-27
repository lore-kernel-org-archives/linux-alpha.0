From: Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH v1 03/10] mm: Introduce try_vma_alloc_movable_folio()
Date: Mon, 26 Jun 2023 20:34:18 -0600
Message-ID: <CAOUHufZKM+aS_hYQ5nDUHh74UQwWipJ27Na5Sw4n+RDqnwyWHA@mail.gmail.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com> <20230626171430.3167004-4-ryan.roberts@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687833294; x=1690425294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQTOkBN0GiMAgDG6ZOmDj9RulFsjN3i64Kvjq5jchlk=;
        b=2ONe3v1NzdXE0h5fj2MWjBVQiq6S1GdLr8eEH6r69uFRebt1NiaIjiqToWQ5+oQSIg
         deN/EOrGfQJTX8/IdlI46HYmmnUjOnsrxEv13aUKomZIkHWSGMAKvqYevb/K3QWcLbR9
         uYFa99/05449KMzf049eKDYSuN8GMHKbyRc3dA/tpDmhB1dFdyQovn3/8ZOwws6k7JBz
         eiSy+SaSo4Ndcni6q+aCfD0OlX9EaJRWRRtbkqrZf+yUHqoDEIGNFR2AH3ma4yaceXsd
         OztHi2s5KfV5Yj8S0MHsmjPInWKZAWUFhMFQytcdDY0Yz3p6nPMmWy44dUIHb/wSpgHH
         azgw==
In-Reply-To: <20230626171430.3167004-4-ryan.roberts@arm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists

On Mon, Jun 26, 2023 at 11:14=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com=
> wrote:
>
> Opportunistically attempt to allocate high-order folios in highmem,
> optionally zeroed. Retry with lower orders all the way to order-0, until
> success. Although, of note, order-1 allocations are skipped since a
> large folio must be at least order-2 to work with the THP machinery. The
> user must check what they got with folio_order().
>
> This will be used to oportunistically allocate large folios for
> anonymous memory with a sensible fallback under memory pressure.
>
> For attempts to allocate non-0 orders, we set __GFP_NORETRY to prevent
> high latency due to reclaim, instead preferring to just try for a lower
> order. The same approach is used by the readahead code when allocating
> large folios.
>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  mm/memory.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 367bbbb29d91..53896d46e686 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3001,6 +3001,39 @@ static vm_fault_t fault_dirty_shared_page(struct v=
m_fault *vmf)
>         return 0;
>  }
>
> +static inline struct folio *vma_alloc_movable_folio(struct vm_area_struc=
t *vma,
> +                               unsigned long vaddr, int order, bool zero=
ed)
> +{
> +       gfp_t gfp =3D order > 0 ? __GFP_NORETRY | __GFP_NOWARN : 0;
> +
> +       if (zeroed)
> +               return vma_alloc_zeroed_movable_folio(vma, vaddr, gfp, or=
der);
> +       else
> +               return vma_alloc_folio(GFP_HIGHUSER_MOVABLE | gfp, order,=
 vma,
> +                                                               vaddr, fa=
lse);
> +}
> +
> +/*
> + * Opportunistically attempt to allocate high-order folios, retrying wit=
h lower
> + * orders all the way to order-0, until success. order-1 allocations are=
 skipped
> + * since a folio must be at least order-2 to work with the THP machinery=
. The
> + * user must check what they got with folio_order(). vaddr can be any vi=
rtual
> + * address that will be mapped by the allocated folio.
> + */
> +static struct folio *try_vma_alloc_movable_folio(struct vm_area_struct *=
vma,
> +                               unsigned long vaddr, int order, bool zero=
ed)
> +{
> +       struct folio *folio;
> +
> +       for (; order > 1; order--) {
> +               folio =3D vma_alloc_movable_folio(vma, vaddr, order, zero=
ed);
> +               if (folio)
> +                       return folio;
> +       }
> +
> +       return vma_alloc_movable_folio(vma, vaddr, 0, zeroed);
> +}

I'd drop this patch. Instead, in do_anonymous_page():

  if (IS_ENABLED(CONFIG_ARCH_WANTS_PTE_ORDER))
    folio =3D vma_alloc_zeroed_movable_folio(vma, addr,
CONFIG_ARCH_WANTS_PTE_ORDER))

  if (!folio)
    folio =3D vma_alloc_zeroed_movable_folio(vma, addr, 0);

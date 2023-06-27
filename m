From: Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH v1 01/10] mm: Expose clear_huge_page() unconditionally
Date: Mon, 26 Jun 2023 19:55:42 -0600
Message-ID: <CAOUHufacvArJh7NjL_3LT-e3s1X+bazkvbgvEU+KPKGKEoW+dw@mail.gmail.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com> <20230626171430.3167004-2-ryan.roberts@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687830979; x=1690422979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tQeS+NgvL9gdsqnn0SpOEkHfViOYxTZPaCYpoCkL24=;
        b=60hic23BjNzvDtmwzOgn1MGUJS385E8qjRXwGDdx5oFNFXl07UFmQ8SM0jme+3UZak
         8TPvxMoBVd0/boJww6XEce0KK+tadb5kh/xWzpmyMgdh351azpInHaKRbmo4Gar6yfp1
         LpKcvaGnWt9AwvtTeNfLxJVQ42I9WXAYeV661LQvCSX90DjXZWn22h1TqBjHU1vXR7rm
         S2VerQn/OQAGb13OsVr68o0IbNssvEcNUN+Sw92W0QMmV67yGkSnOkUgWRUmZEHRdU/m
         O/fz3eCb4kPhxLrxwc2qGdcN3/Wp1+NoSkn2ZQNKQi+jsatj4YqTaMawlQlow2Gq0a0P
         NRxg==
In-Reply-To: <20230626171430.3167004-2-ryan.roberts@arm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists

On Mon, Jun 26, 2023 at 11:14=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com=
> wrote:
>
> In preparation for extending vma_alloc_zeroed_movable_folio() to
> allocate a arbitrary order folio, expose clear_huge_page()
> unconditionally, so that it can be used to zero the allocated folio in
> the generic implementation of vma_alloc_zeroed_movable_folio().
>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  include/linux/mm.h | 3 ++-
>  mm/memory.c        | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 7f1741bd870a..7e3bf45e6491 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3684,10 +3684,11 @@ enum mf_action_page_type {
>   */
>  extern const struct attribute_group memory_failure_attr_group;
>
> -#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBFS)
>  extern void clear_huge_page(struct page *page,
>                             unsigned long addr_hint,
>                             unsigned int pages_per_huge_page);
> +
> +#if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBFS)

We might not want to depend on THP eventually. Right now, we still
have to, unless splitting is optional, which seems to contradict
06/10. (deferred_split_folio()  is a nop without THP.)

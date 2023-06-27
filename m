From: Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH v1 10/10] mm: Allocate large folios for anonymous memory
Date: Mon, 26 Jun 2023 21:01:22 -0600
Message-ID: <CAOUHufarua_JmnTu5NM-W3K4Togw+24F=Pf0HU0ZOjuwbRMC0A@mail.gmail.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com> <20230626171430.3167004-11-ryan.roberts@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687834919; x=1690426919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dubf60A5K0NzNIP7xjDZqZozn3KVMPgogoe8ASnGAZg=;
        b=PDCiQ+OMm+ZYhItlBm9CJOAjt3arCBaIPefCRV+cRGlKtmTkgJuKH7kAOKyAbCQJzL
         BCdmcPnotA0n4v9avoXLaITUGQgCoZm0BKEirmoOrgdrv8GGmlOoIokTT8s6lPxZIxSr
         eePAgRbrFZroffClytmh37SqL9NSTT2FHr7ZtV7QGlDkmk6KAHHYcWPVhpXKOVGr8Tr7
         Xvj/gX5em4lLmUFwa2ra0Yw/kozeJB+nK/9f/BgOWwSt6jpUIMH8XIdAtL1yeNznNHSz
         i5guqpOz9eCzUhqIk6gXiuPNKiSeUkePu5MwafnJai+nUz1Z0jF1fVOyqLoOaTDwUabC
         0MkQ==
In-Reply-To: <20230626171430.3167004-11-ryan.roberts@arm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists

On Mon, Jun 26, 2023 at 11:15=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com=
> wrote:
>
> With all of the enabler patches in place, modify the anonymous memory
> write allocation path so that it opportunistically attempts to allocate
> a large folio up to `max_anon_folio_order()` size (This value is
> ultimately configured by the architecture). This reduces the number of
> page faults, reduces the size of (e.g. LRU) lists, and generally
> improves performance by batching what were per-page operations into
> per-(large)-folio operations.
>
> If CONFIG_LARGE_ANON_FOLIO is not enabled (the default) then
> `max_anon_folio_order()` always returns 0, meaning we get the existing
> allocation behaviour.
>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  mm/memory.c | 159 +++++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 144 insertions(+), 15 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index a8f7e2b28d7a..d23c44cc5092 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3161,6 +3161,90 @@ static inline int max_anon_folio_order(struct vm_a=
rea_struct *vma)
>                 return CONFIG_LARGE_ANON_FOLIO_NOTHP_ORDER_MAX;
>  }
>
> +/*
> + * Returns index of first pte that is not none, or nr if all are none.
> + */
> +static inline int check_ptes_none(pte_t *pte, int nr)
> +{
> +       int i;
> +
> +       for (i =3D 0; i < nr; i++) {
> +               if (!pte_none(ptep_get(pte++)))
> +                       return i;
> +       }
> +
> +       return nr;
> +}
> +
> +static int calc_anon_folio_order_alloc(struct vm_fault *vmf, int order)

As suggested previously in 03/10, we can leave this for later.

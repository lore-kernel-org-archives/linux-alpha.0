From: Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH v1 10/10] mm: Allocate large folios for anonymous memory
Date: Tue, 27 Jun 2023 12:33:09 -0600
Message-ID: <CAOUHufa21rX1ODOZ0iJxiy4pstgGqhkbfYozg8-+sRp5ZxAOjA@mail.gmail.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
 <20230626171430.3167004-11-ryan.roberts@arm.com> <CAOUHufarua_JmnTu5NM-W3K4Togw+24F=Pf0HU0ZOjuwbRMC0A@mail.gmail.com>
 <0c98f854-b4e4-9a71-8e0c-1556bc79468c@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687890825; x=1690482825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTIY9reQDxCVjeBIGzBvbwdTkf7d3X2+E+ffOvvfOt8=;
        b=IFZFZBAdSS5WPvdUVXRmtMP6d4it0zMJf/l2GDxZXOXh1ctIJNlPkvj2sinpxjJpBe
         LSKJg/UTJqQVTKhWODYjkO1i4nmcSjjuGZmBYcplmBZiyiFW6CuoXRu+bQTCz2WCa1nH
         SdQntuzU7sGVa9Zb4/4LWl80uj4Q0BPHxEdxix7lK5L3lwfGKXDqrn1GAAYX6QuI7vNE
         z1pBKRtW9A03Pn/i46V3X9p17H8SAeO0G3yXELGKIy5uxYSjsIK7Iv6IFYtp9hQ3EnpD
         eG251UrPtZeVpaEySuJiM3LXqN8D4gZAZ/2Sukeubj3yBMBzkQ54sCd/tzIGiPBSNQ4H
         dJIw==
In-Reply-To: <0c98f854-b4e4-9a71-8e0c-1556bc79468c@arm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists

On Tue, Jun 27, 2023 at 3:57=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:
>
> On 27/06/2023 04:01, Yu Zhao wrote:
> > On Mon, Jun 26, 2023 at 11:15=E2=80=AFAM Ryan Roberts <ryan.roberts@arm=
.com> wrote:
> >>
> >> With all of the enabler patches in place, modify the anonymous memory
> >> write allocation path so that it opportunistically attempts to allocat=
e
> >> a large folio up to `max_anon_folio_order()` size (This value is
> >> ultimately configured by the architecture). This reduces the number of
> >> page faults, reduces the size of (e.g. LRU) lists, and generally
> >> improves performance by batching what were per-page operations into
> >> per-(large)-folio operations.
> >>
> >> If CONFIG_LARGE_ANON_FOLIO is not enabled (the default) then
> >> `max_anon_folio_order()` always returns 0, meaning we get the existing
> >> allocation behaviour.
> >>
> >> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> >> ---
> >>  mm/memory.c | 159 +++++++++++++++++++++++++++++++++++++++++++++++----=
-
> >>  1 file changed, 144 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/mm/memory.c b/mm/memory.c
> >> index a8f7e2b28d7a..d23c44cc5092 100644
> >> --- a/mm/memory.c
> >> +++ b/mm/memory.c
> >> @@ -3161,6 +3161,90 @@ static inline int max_anon_folio_order(struct v=
m_area_struct *vma)
> >>                 return CONFIG_LARGE_ANON_FOLIO_NOTHP_ORDER_MAX;
> >>  }
> >>
> >> +/*
> >> + * Returns index of first pte that is not none, or nr if all are none=
.
> >> + */
> >> +static inline int check_ptes_none(pte_t *pte, int nr)
> >> +{
> >> +       int i;
> >> +
> >> +       for (i =3D 0; i < nr; i++) {
> >> +               if (!pte_none(ptep_get(pte++)))
> >> +                       return i;
> >> +       }
> >> +
> >> +       return nr;
> >> +}
> >> +
> >> +static int calc_anon_folio_order_alloc(struct vm_fault *vmf, int orde=
r)
> >
> > As suggested previously in 03/10, we can leave this for later.
>
> I disagree. This is the logic that prevents us from accidentally replacin=
g
> already set PTEs, or wandering out of the VMA bounds etc. How would you c=
atch
> all those corener cases without this?

Again, sorry for not being clear previously: we definitely need to
handle alignments & overlapps. But the fallback, i.e., "for (; order >
1; order--) {" in calc_anon_folio_order_alloc() is not necessary.

For now, we just need something like

  bool is_order_suitable() {
    // check whether it fits properly
  }

Later on, we could add

  alloc_anon_folio_best_effort()
  {
    for a list of fallback orders
      is_order_suitable()
  }

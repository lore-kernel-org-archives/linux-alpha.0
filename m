From: Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH v1 07/10] mm: Batch-zap large anonymous folio PTE mappings
Date: Mon, 26 Jun 2023 21:04:25 -0600
Message-ID: <CAOUHufbhVM-+zMUvHy0zeTb1ZFnDWnvD+=f6v9YxNJ_h5bjaRw@mail.gmail.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com> <20230626171430.3167004-8-ryan.roberts@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687835101; x=1690427101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Udfkb7SVUpoKn3jnskw7T04Cur4Mk4q30DewKVsVPBw=;
        b=7dXkce0taLND+PJoW+Jbed5b0GMFVghZW9QTkNtQ/meQQ+G4/JcOxPI9Kz0HTIpUjJ
         DVPqS8EWIMWDNLQb9jkhcv0ZsAV/EK12K1no2eVRvJkp1/XJsLCtTp+lt5ximqKd3QcA
         O/4FOzC2WA2gGIIWEdtacwm2FXxfG0SQAhL3dtnCVqkZxjmSj6j+j9svH7NJ0A6Nj9Rb
         jKGMzazG69HvNtEOmK94lVQRbs31Ue4JFIlJhwIOy1XZl8cJtEk1tGxwOUPkGV61Icm6
         b01rBLpfsO2BiVCGWGTplTaE03Ks9gzUEE9/yTs/Jw+v/FzXpBLgUpA5jsREDvfG7KVe
         F4+Q==
In-Reply-To: <20230626171430.3167004-8-ryan.roberts@arm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists

On Mon, Jun 26, 2023 at 11:15=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com=
> wrote:
>
> This allows batching the rmap removal with folio_remove_rmap_range(),
> which means we avoid spuriously adding a partially unmapped folio to the
> deferrred split queue in the common case, which reduces split queue lock
> contention.
>
> Previously each page was removed from the rmap individually with
> page_remove_rmap(). If the first page belonged to a large folio, this
> would cause page_remove_rmap() to conclude that the folio was now
> partially mapped and add the folio to the deferred split queue. But
> subsequent calls would cause the folio to become fully unmapped, meaning
> there is no value to adding it to the split queue.
>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  mm/memory.c | 119 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)

We don't really need this patch for the series to work. So again, I'd
split it out.

From: Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH v1 09/10] arm64: mm: Declare support for large anonymous folios
Date: Mon, 26 Jun 2023 20:53:09 -0600
Message-ID: <CAOUHufaUT3UzGj-ohPN72CHtgXQHpKFrvJgcPfkJ6HAO=ywKQQ@mail.gmail.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com> <20230626171430.3167004-10-ryan.roberts@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687834425; x=1690426425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXL2A5XwGkQBMKHvJmT9XBgr9QrqO5b2xYT/yObtZVs=;
        b=xBIB9H6D26duO7D5p9m4SYXnyo8r6ka9obuVuhUc1nSeyBJJHDhGhS//0CYhrq0cEo
         C3ZegRAqeuF/nHp1Hz01nsb8c9MfJMrAHGvaaVYgKY+EepRGYl1OeaJM6w1KW+G0F5aY
         Ja7Ufnd8fXGxS7FeHYaRjSPLXtMSgzv5A2UfRDFV+8V3+yG9iAYrGactEFGmsUrKFpMO
         lx6ka2RYtqwA6/JcD2tJ0Voq7K6g6sgAIIREvF1zoR/jNw4UZJnFjM6K6j2Ysp9yjdfl
         md6pDBt8J1TZcYvdzAlWxXHjudvUk4mbHTfK96zyrtLCi00HysOXC1SH5YQBPjkeB6Rt
         +7Og==
In-Reply-To: <20230626171430.3167004-10-ryan.roberts@arm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Yin Fengwei <fengwei.yin@intel.com>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists

On Mon, Jun 26, 2023 at 11:15=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com=
> wrote:
>
> For the unhinted case, when THP is not permitted for the vma, don't
> allow anything bigger than 64K. This means we don't waste too much
> memory. Additionally, for 4K pages this is the contpte size, and for
> 16K, this is (usually) the HPA size when the uarch feature is
> implemented. For the hinted case, when THP is permitted for the vma,
> allow the contpte size for all page size configurations; 64K for 4K, 2M
> for 16K and 2M for 64K.
>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/Kconfig | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 343e1e1cae10..0e91b5bc8cd9 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -243,6 +243,7 @@ config ARM64
>         select TRACE_IRQFLAGS_SUPPORT
>         select TRACE_IRQFLAGS_NMI_SUPPORT
>         select HAVE_SOFTIRQ_ON_OWN_STACK
> +       select ARCH_SUPPORTS_LARGE_ANON_FOLIO
>         help
>           ARM 64-bit (AArch64) Linux support.
>
> @@ -281,6 +282,18 @@ config ARM64_CONT_PMD_SHIFT
>         default 5 if ARM64_16K_PAGES
>         default 4
>
> +config ARCH_LARGE_ANON_FOLIO_NOTHP_ORDER_MAX
> +       int
> +       default 0 if ARM64_64K_PAGES    # 64K (1 page)
> +       default 2 if ARM64_16K_PAGES    # 64K (4 pages; benefits from HPA=
 where HW supports it)
> +       default 4 if ARM64_4K_PAGES     # 64K (16 pages; eligible for con=
tpte-mapping)
> +
> +config ARCH_LARGE_ANON_FOLIO_THP_ORDER_MAX
> +       int
> +       default 5 if ARM64_64K_PAGES    # 2M  (32 page; eligible for cont=
pte-mapping)
> +       default 7 if ARM64_16K_PAGES    # 2M  (128 pages; eligible for co=
ntpte-mapping)
> +       default 4 if ARM64_4K_PAGES     # 64K (16 pages; eligible for con=
tpte-mapping)
> +
>  config ARCH_MMAP_RND_BITS_MIN
>         default 14 if ARM64_64K_PAGES
>         default 16 if ARM64_16K_PAGES

Can we please just add one Kconfig for the large anon folio feature,
i.e., ARCH_WANTS_PTE_ORDER, for now?

Feel free to add as many as you wish for arm specific features like
HPA and contpte.

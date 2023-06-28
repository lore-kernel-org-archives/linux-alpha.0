From: Yin Fengwei <fengwei.yin@intel.com>
Subject: Re: [PATCH v1 06/10] mm: Allow deferred splitting of arbitrary large
 anon folios
Date: Wed, 28 Jun 2023 10:43:05 +0800
Message-ID: <ddcc31b5-0518-e2e3-2887-62a4ccc9e582@intel.com>
References: <20230626171430.3167004-1-ryan.roberts@arm.com>
 <20230626171430.3167004-7-ryan.roberts@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687920211; x=1719456211;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PV4swNzFCtA2mZ08xknEXIY2+fX13/DpmAzwFLdGrFI=;
  b=bTjFsc0qeiJ4cU5PeRoEvOoNsPdfx+ljIHPQfOIKYvPK8fr36F2Flj94
   ygLXNcjxNtJWmwEKzYj2qNDsg56Av5gN4Yn05gfjZeGdqYJNM43FIzndN
   KWWXueIK0t/mb6wc2ZRA7MxTzKeVcH1QpIK9Ve9LO6Jv45btA9HE9Phrv
   prVnWJsRWId71vOmXPTDxyPKqJ/ZZYIhQIpBm6ZvtlnKQ6QIn1WzGEWZd
   Du+iB5rtsid90B/4DjC9gHn+n/fvZsYaGvL68CGKgtFxghfJNWrwtmuPU
   dotEy5jzB2WfVPAog2NLIpCNk9NaqGgasJ2w9CplET9s+9tolqOf3ChJ3
   A==;
Content-Language: en-US
In-Reply-To: <20230626171430.3167004-7-ryan.roberts@arm.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ryan Roberts <ryan.roberts@arm.com>, Andrew Morton <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, David Hildenbrand <david@redhat.com>, Yu Zhao <yuzhao@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-s390@vger.kernel.org



On 6/27/23 01:14, Ryan Roberts wrote:
> With the introduction of large folios for anonymous memory, we would
> like to be able to split them when they have unmapped subpages, in order
> to free those unused pages under memory pressure. So remove the
> artificial requirement that the large folio needed to be at least
> PMD-sized.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Yin Fengwei <fengwei.yin@intel.com>


Regards
Yin, Fengwei

> ---
>  mm/rmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index ac1d93d43f2b..3d11c5fb6090 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1567,7 +1567,7 @@ void page_remove_rmap(struct page *page, struct vm_area_struct *vma,
>  		 * page of the folio is unmapped and at least one page
>  		 * is still mapped.
>  		 */
> -		if (folio_test_pmd_mappable(folio) && folio_test_anon(folio))
> +		if (folio_test_large(folio) && folio_test_anon(folio))
>  			if (!compound || nr < nr_pmdmapped)
>  				deferred_split_folio(folio);
>  	}

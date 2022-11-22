From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH mm-unstable v1 08/20] mm: extend FAULT_FLAG_UNSHARE
 support to anything in a COW mapping
Date: Tue, 22 Nov 2022 16:35:52 +0100
Message-ID: <34835490-57d7-4e26-7474-008b2c4c6b39@suse.cz>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-9-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWQwJ+oZfFpIbLg+UH4untKZ8igohKElwQMujWTIn3E=; b=r1WwRn3RitsjTh
	KLBetDo6McUcrTc2rnhoZ7Z955RNUChzV0/nPhEQYCh7bMSZ6zFy6vWz9L6OdzF/AquEIK80ico5Q
	2n0I3dCKSuXLDnxYsxmSgEfoj4XoccBbZboIR2WB7oDjftuuRX9NaLHKEJD9ASQhlinuQ4Vg+QIiC
	u4iGPEhB6X1SNq1UU5/lxBC6JwWBkJtKGGzGjain5NZHptj1W0pJoCjdGmnyCUH6MsW+wS4lJ9P32
	2QVzqXwvUPPBWPuKPz/Uk2b36WYvu51vMRsz4KNUIsGCLU4z3hn8c4YYCbwLrXjugbMPRKZ6HbwOO
	z08EPQklCXOKgGSj+gRw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1669131353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xzeEtRVGkBValjf4cAqJIIBnm0WLgHIJrOj2Qpyeryk=;
	b=hSz8uo53GqZkaSBqbG3aIh16lgMQB2Sw8gZ6Z+fnEjIR6uPvpuBuVkR8TpcuCDJwN2rjjn
	iqJmydTFhzXH0tY5jw9oJ6zK0Sx7/l0zZrHLYI1mzVvp/woqabMd2RthMdqBUz+tckoXxt
	gvUiGWpp9yM7xLCq0tNctpGuD1es/pI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1669131353;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xzeEtRVGkBValjf4cAqJIIBnm0WLgHIJrOj2Qpyeryk=;
	b=87yFyDfodelF6paPP+3fZVkcbfCamfu6aYJAmnQjTNh2RXFp/RQ8a0uSheJsgsaRl+tSbc
	rgSpbkEWiLk/2KDQ==
Content-Language: en-US
In-Reply-To: <20221116102659.70287-9-david@redhat.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-um/>
List-Post: <mailto:linux-um@lists.infradead.org>
List-Help: <mailto:linux-um-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=subscribe>
Sender: "linux-um" <linux-um-bounces@lists.infradead.org>
Errors-To: linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrea Arcangeli <aarcange@redhat.com>, Hugh Dickins <hughd@google.com>, Nadav Amit <namit@vmware.com>

On 11/16/22 11:26, David Hildenbrand wrote:
> Extend FAULT_FLAG_UNSHARE to break COW on anything mapped into a
> COW (i.e., private writable) mapping and adjust the documentation
> accordingly.
> 
> FAULT_FLAG_UNSHARE will now also break COW when encountering the shared
> zeropage, a pagecache page, a PFNMAP, ... inside a COW mapping, by
> properly replacing the mapped page/pfn by a private copy (an exclusive
> anonymous page).
> 
> Note that only do_wp_page() needs care: hugetlb_wp() already handles
> FAULT_FLAG_UNSHARE correctly. wp_huge_pmd()/wp_huge_pud() also handles it
> correctly, for example, splitting the huge zeropage on FAULT_FLAG_UNSHARE
> such that we can handle FAULT_FLAG_UNSHARE on the PTE level.
> 
> This change is a requirement for reliable long-term R/O pinning in
> COW mappings.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  include/linux/mm_types.h | 8 ++++----
>  mm/memory.c              | 4 ----
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 5e7f4fac1e78..5e9aaad8c7b2 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1037,9 +1037,9 @@ typedef struct {
>   * @FAULT_FLAG_REMOTE: The fault is not for current task/mm.
>   * @FAULT_FLAG_INSTRUCTION: The fault was during an instruction fetch.
>   * @FAULT_FLAG_INTERRUPTIBLE: The fault can be interrupted by non-fatal signals.
> - * @FAULT_FLAG_UNSHARE: The fault is an unsharing request to unshare (and mark
> - *                      exclusive) a possibly shared anonymous page that is
> - *                      mapped R/O.
> + * @FAULT_FLAG_UNSHARE: The fault is an unsharing request to break COW in a
> + *                      COW mapping, making sure that an exclusive anon page is
> + *                      mapped after the fault.
>   * @FAULT_FLAG_ORIG_PTE_VALID: whether the fault has vmf->orig_pte cached.
>   *                        We should only access orig_pte if this flag set.
>   *
> @@ -1064,7 +1064,7 @@ typedef struct {
>   *
>   * The combination FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE is illegal.
>   * FAULT_FLAG_UNSHARE is ignored and treated like an ordinary read fault when
> - * no existing R/O-mapped anonymous page is encountered.
> + * applied to mappings that are not COW mappings.
>   */
>  enum fault_flag {
>  	FAULT_FLAG_WRITE =		1 << 0,
> diff --git a/mm/memory.c b/mm/memory.c
> index d47ad33c6487..56b21ab1e4d2 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3432,10 +3432,6 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
>  		}
>  		wp_page_reuse(vmf);
>  		return 0;
> -	} else if (unshare) {
> -		/* No anonymous page -> nothing to do. */
> -		pte_unmap_unlock(vmf->pte, vmf->ptl);
> -		return 0;
>  	}
>  copy:
>  	/*

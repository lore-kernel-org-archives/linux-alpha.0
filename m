From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] dma-mapping: introduce dma_get_seg_boundary_nr_pages()
Date: Thu, 03 Sep 2020 13:47:43 +1000
Message-ID: <87363z1py8.fsf@mpe.ellerman.id.au>
References: <20200901221646.26491-1-nicoleotsuka@gmail.com> <20200901221646.26491-2-nicoleotsuka@gmail.com>
Mime-Version: 1.0
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1599104874;
        bh=4yAcDTxLmVtFlFmBwViPiQqBxkMUq1/v+ltMjACdmTw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=sLw7B6tBL0tYeiS7UbUp4SBXAdWw1BiuX1rzRD7UWBO4tYjHsDcRVzXhtw9LnwBSb
         TVkfoqm3UH9AlqDYsgMpWDtdLM9KmPlrSHeDnjaQHBRgQyRaye8SGf9zquJweA35N7
         ilN3da+kZMlwnOIFaqVvO5w2y0IGDyDnVFG1VcyDqd8GjM2NTURgLs8goa8r9z4rAX
         bS7CaEKouymf+JkB9pMsYKQDB1pDC1x6WHKsbhAVF7YeLmzAfKXrfbmEv+zmCeShnW
         T7ZxEkdC9W8WnKJu7u5s2wHJv1TU45hmfsmEVHLbTCR7rbxTHbwfqjSrB0uc+2ymCK
         IggJReIsXvpLw==
In-Reply-To: <20200901221646.26491-2-nicoleotsuka@gmail.com>
Sender: linux-parisc-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolin Chen <nicoleotsuka@gmail.com>, hch@lst.de
Cc: sfr@canb.auug.org.au, benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, tony.luck@intel.com, fenghua.yu@intel.com, linux-ia64@vger.kernel.org, schnelle@linux.ibm.com, gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com, linux-s390@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com, James.Bottomley@HansenPartnership.com, deller@gmx.de, linux-parisc@vger.kernel.org

Nicolin Chen <nicoleotsuka@gmail.com> writes:
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index 9704f3f76e63..cbc2e62db597 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -236,15 +236,10 @@ static unsigned long iommu_range_alloc(struct device *dev,
>  		}
>  	}
>  
> -	if (dev)
> -		boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
> -				      1 << tbl->it_page_shift);
> -	else
> -		boundary_size = ALIGN(1UL << 32, 1 << tbl->it_page_shift);
> -	/* 4GB boundary for iseries_hv_alloc and iseries_hv_map */
> +	boundary_size = dma_get_seg_boundary_nr_pages(dev, tbl->it_page_shift);
>  
>  	n = iommu_area_alloc(tbl->it_map, limit, start, npages, tbl->it_offset,
> -			     boundary_size >> tbl->it_page_shift, align_mask);
> +			     boundary_size, align_mask);

This has changed the units of boundary_size, but it's unused elsewhere
in the function so that's OK.

If you need to do a v2 for any other reason, then I'd just drop
boundary_size and call dma_get_seg_boundary_nr_pages() directly in the
function call.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

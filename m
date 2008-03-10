From: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Subject: Re: [PATCH -mm] alpha: use iommu_is_span_boundary helper function
Date: Mon, 10 Mar 2008 19:10:49 +0300
Message-ID: <20080310161049.GA10759@jurassic.park.msu.ru>
References: <20080310231010H.tomof@acm.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080310231010H.tomof@acm.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, akpm@linux-foundation.org, rth@twiddle.net, tomof@acm.org

On Mon, Mar 10, 2008 at 11:34:53PM +0900, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
> Subject: [PATCH -mm] alpha: use iommu_is_span_boundary helper function
> 
> iommu_is_span_boundary in lib/iommu-helper.c was exported for PARISC
> IOMMUs (commit 3715863aa142c4f4c5208f5f3e5e9bac06006d2f). Alpha's
> IOMMU can use it.
> 
> This removes the check on the boundary size alignment because
> iommu_is_span_boundary does.

Acked-by: Ivan Kokshaysky <ink@jurassic.park.msu.ru>

Ivan.

From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH mm-unstable v1 10/20] RDMA/umem: remove FOLL_FORCE usage
Date: Wed, 16 Nov 2022 20:45:21 -0400
Message-ID: <Y3WEIVROhUPTtaeQ@ziepe.ca>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-11-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMw5fxGY1p2h/KXFfbAPV7iCUjQYbLBZtZUT7oyi98c=; b=c7vvvBExsKpv6O
	7Bo2HAw9tcI4WNFQIIeBgGNI+AzKpGb4YfbjjpOnNoNclNLCB47VqzVVv+YTdVIz33RzfAElmrjTJ
	YsdAjrUsnwZoFXxniEXveNkAHm1c7QexPtepDOcMR+ZWKxqrP6+4Npy2mG/ojXokXe3a+34Nj8nVz
	T/9TxYXSh+AaTuZ2ColmsTilyQUtdut63dyJVTlW1XpwolG2PbfRRG/n1mvjw17H377Fm56hfnQ2c
	gPDFcmPoHuzfwJUWvJehLjdDIUaycfgcU6odfvp2ggEjXb4DqIrzZdWHaHicr6A0HHHu8bCmHUxhu
	0rFSRTdIBOlG5uM3T7Hw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HEOs2OljVpzFekHebtNmxJNTS1biZDzbDC+7E+gbGXE=;
        b=NKUDG6/HRBHYArrki2ErKlKAFAloDP3syGXEvUqNJ9D2fVrZim0dI4zYfgnJWEKy+2
         eIgPOs+mttvXhYUIJL/UppN4gHtQqcQpWlrONSgHhATtfRfLqa70r2Y5AFUtDhoXumLz
         QwAO0SpqErl+SpXb2isD+wqK260zhrI3m0OcjGKZmRIuadG54e+ieDR5HURAecTq4gww
         +4XuPNBvBD2G5dec/bz8Eh9V9EDh1RbiHGn8GIrcO4V8END9r1k5y0xfRAbT/lxmG9Cm
         d4SXiY9+ZupOQT/Gb+ZePnA6lwtOPkxvxI9tRVsC2WHBPZX7s+xnX8nZsTymxhqmYSZB
         7vEA==
Content-Disposition: inline
In-Reply-To: <20221116102659.70287-11-david@redhat.com>
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
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrea Arcangeli <aarcange@redhat.com>, Hugh Dickins <hughd@google.com>, Nadav Amit <namit@vmware.com>

On Wed, Nov 16, 2022 at 11:26:49AM +0100, David Hildenbrand wrote:
> GUP now supports reliable R/O long-term pinning in COW mappings, such
> that we break COW early. MAP_SHARED VMAs only use the shared zeropage so
> far in one corner case (DAXFS file with holes), which can be ignored
> because GUP does not support long-term pinning in fsdax (see
> check_vma_flags()).
> 
> Consequently, FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM is no longer required
> for reliable R/O long-term pinning: FOLL_LONGTERM is sufficient. So stop
> using FOLL_FORCE, which is really only for ptrace access.
> 
> Tested-by: Leon Romanovsky <leonro@nvidia.com> # Over mlx4 and mlx5.
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/infiniband/core/umem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

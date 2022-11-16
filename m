From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH mm-unstable v1 17/20] drm/exynos: remove FOLL_FORCE usage
Date: Wed, 16 Nov 2022 11:50:57 +0100
Message-ID: <Y3TAkWy/xXfX1cIv@phenom.ffwll.local>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-18-david@redhat.com>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMt8HjKxItO2J6bIbRsCvEdSlAZpP8uC48lcisou+nI=;
        b=eLnGvKK+w1XqLxzowLTo19VxBdUCyRC3jZCwBMpKaUWXXlLi4fs0Axmuul/wRN/I3k
         Ls2daX/AS8NBqlkGiJqqxb0gEFzgn6n0a6+XnpTDtipAc3J5NayuL7HDBO33beS0D75x
         K2gRZhVXeM0+lA+7zcbmJS/RVo1YdOeZ/sxms=
Content-Disposition: inline
In-Reply-To: <20221116102659.70287-18-david@redhat.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Hildenbrand <david@redhat.com>
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Kyungmin Park <kyungmin.park@samsung.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.f, reedesktop.org, Inki Dae <inki.dae@samsung.com>, Alex Williamson <alex.williamson@redhat.com>, Pet

On Wed, Nov 16, 2022 at 11:26:56AM +0100, David Hildenbrand wrote:
> FOLL_FORCE is really only for ptrace access. As we unpin the pinned pages
> using unpin_user_pages_dirty_lock(true), the assumption is that all these
> pages are writable.
> 
> FOLL_FORCE in this case seems to be a legacy leftover. Let's just remove
> it.
> 
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Plus ack for merging through the appropriate non-drm tree.
-Daniel

> ---
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> index 471fd6c8135f..e19c2ceb3759 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -477,7 +477,7 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
>  	}
>  
>  	ret = pin_user_pages_fast(start, npages,
> -				  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
> +				  FOLL_WRITE | FOLL_LONGTERM,
>  				  g2d_userptr->pages);
>  	if (ret != npages) {
>  		DRM_DEV_ERROR(g2d->dev,
> -- 
> 2.38.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

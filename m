From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH mm-unstable v1 15/20] media: pci/ivtv: remove FOLL_FORCE
 usage
Date: Wed, 23 Nov 2022 14:18:31 +0100
Message-ID: <e0701648-fec1-f1fd-0c69-8ed85e162a01@xs4all.nl>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-16-david@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Language: en-US
In-Reply-To: <20221116102659.70287-16-david@redhat.com>
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
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-ia64@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Alex Williamson <alex.williamson@redhat.com>, Peter Xu <p eterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>, Mauro Carvalho Chehab <mchehab@kernel.o>

On 16/11/2022 11:26, David Hildenbrand wrote:
> FOLL_FORCE is really only for ptrace access. R/O pinning a page is
> supposed to fail if the VMA misses proper access permissions (no VM_READ).
> 
> Let's just remove FOLL_FORCE usage here; there would have to be a pretty
> good reason to allow arbitrary drivers to R/O pin pages in a PROT_NONE
> VMA. Most probably, FOLL_FORCE usage is just some legacy leftover.

I'm pretty sure about that as well, so:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> 
> Cc: Andy Walls <awalls@md.metrocast.net>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/media/pci/ivtv/ivtv-udma.c | 2 +-
>  drivers/media/pci/ivtv/ivtv-yuv.c  | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/pci/ivtv/ivtv-udma.c b/drivers/media/pci/ivtv/ivtv-udma.c
> index 210be8290f24..99b9f55ca829 100644
> --- a/drivers/media/pci/ivtv/ivtv-udma.c
> +++ b/drivers/media/pci/ivtv/ivtv-udma.c
> @@ -115,7 +115,7 @@ int ivtv_udma_setup(struct ivtv *itv, unsigned long ivtv_dest_addr,
>  
>  	/* Pin user pages for DMA Xfer */
>  	err = pin_user_pages_unlocked(user_dma.uaddr, user_dma.page_count,
> -			dma->map, FOLL_FORCE);
> +			dma->map, 0);
>  
>  	if (user_dma.page_count != err) {
>  		IVTV_DEBUG_WARN("failed to map user pages, returned %d instead of %d\n",
> diff --git a/drivers/media/pci/ivtv/ivtv-yuv.c b/drivers/media/pci/ivtv/ivtv-yuv.c
> index 4ba10c34a16a..582146f8d70d 100644
> --- a/drivers/media/pci/ivtv/ivtv-yuv.c
> +++ b/drivers/media/pci/ivtv/ivtv-yuv.c
> @@ -63,12 +63,11 @@ static int ivtv_yuv_prep_user_dma(struct ivtv *itv, struct ivtv_user_dma *dma,
>  
>  	/* Pin user pages for DMA Xfer */
>  	y_pages = pin_user_pages_unlocked(y_dma.uaddr,
> -			y_dma.page_count, &dma->map[0], FOLL_FORCE);
> +			y_dma.page_count, &dma->map[0], 0);
>  	uv_pages = 0; /* silence gcc. value is set and consumed only if: */
>  	if (y_pages == y_dma.page_count) {
>  		uv_pages = pin_user_pages_unlocked(uv_dma.uaddr,
> -				uv_dma.page_count, &dma->map[y_pages],
> -				FOLL_FORCE);
> +				uv_dma.page_count, &dma->map[y_pages], 0);
>  	}
>  
>  	if (y_pages != y_dma.page_count || uv_pages != uv_dma.page_count) {


From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 19/21] treewide: add checks for the return value of
 memblock_alloc*()
Date: Fri, 18 Jan 2019 18:02:03 +0000
Message-ID: <20190118180201.uva5nhf2g23uamkn@pburton-laptop>
References: <1547646261-32535-1-git-send-email-rppt@linux.ibm.com>
 <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ho62IyT8VsftadFS40wngApEgMA3VEp+nEYF1t0eWU0=; b=AjAOcV+EDJlMBP
	RLwKMDexLk6nvj5Dksgun84RX7AM5azHIZWGD8AYovgMJrggNzFP4q7piLJsQqb8lO7s7C80F5uHd
	+uQBxLIZMK9aOJ72zGa67irLpIKhKtVpWBLqykaqkw9nOctBM576iuUFEZ7akJpoi3s1IY2YqOXmv
	XEPq3h9Qq2ZIG5XbCqiLbcCR875ojqlTe39ZbjOE8fBioaEtttfxxaeg+A8YbpdLDxu8Zby0iqgRe
	CoZ6J9eC5k38/i9Dxve7sea8nPXPChsJM8o4H5kQtiwe9fQz6ySg+k9I/cgeS37LsWLZapFaL9uyE
	Q0BW4L514rmp1tuLNN5w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5NWazDTmeGYAYdRDVqWTFJDL8Hi++4oaTpYIJrLhak=;
 b=JvNQZwf6URSu8rSIpz4mfhxqinA373rumfuPVzkqDKb28e2NPsQhKrDMuZR+CudTS3so8H9dmDxaWHv8otgLgpbSLa/qLXHGqlPsw/4DucTnHdVfc6YQhAzlKe66lfOTwaQ6/ILUincSBi0BCEBm0mw8n/8NIvswildvha7dStI=
In-Reply-To: <1547646261-32535-20-git-send-email-rppt@linux.ibm.com>
Content-Language: en-US
Content-ID: <8AB5FF9934BD5A4E822E85B3C315428B@namprd22.prod.outlook.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Rich Felker <dalias@libc.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, "x86@kernel.org" <x86@kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-c6x-dev@linux-c6x.org" <linux-c6x-dev@linux-c6x.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Mike,

On Wed, Jan 16, 2019 at 03:44:19PM +0200, Mike Rapoport wrote:
> Add check for the return value of memblock_alloc*() functions and call
> panic() in case of error.
> The panic message repeats the one used by panicing memblock allocators with
> adjustment of parameters to include only relevant ones.
> 
> The replacement was mostly automated with semantic patches like the one
> below with manual massaging of format strings.
> 
> @@
> expression ptr, size, align;
> @@
> ptr = memblock_alloc(size, align);
> + if (!ptr)
> + 	panic("%s: Failed to allocate %lu bytes align=0x%lx\n", __func__,
> size, align);
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>%
> diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
> index e8eb60e..db1deb2 100644
> --- a/arch/mips/cavium-octeon/dma-octeon.c
> +++ b/arch/mips/cavium-octeon/dma-octeon.c
> @@ -245,6 +245,9 @@ void __init plat_swiotlb_setup(void)
>  	swiotlbsize = swiotlb_nslabs << IO_TLB_SHIFT;
>  
>  	octeon_swiotlb = memblock_alloc_low(swiotlbsize, PAGE_SIZE);
> +	if (!octeon_swiotlb)
> +		panic("%s: Failed to allocate %lu bytes align=%lx\n",
> +		      __func__, swiotlbsize, PAGE_SIZE);
>  
>  	if (swiotlb_init_with_tbl(octeon_swiotlb, swiotlb_nslabs, 1) == -ENOMEM)
>  		panic("Cannot allocate SWIOTLB buffer");

That one should be %zu rather than %lu. The rest looks good, so with
that one tweak:

    Acked-by: Paul Burton <paul.burton@mips.com> # MIPS parts

Thanks,
    Paul

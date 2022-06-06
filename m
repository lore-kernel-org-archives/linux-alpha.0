From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 0/6] phase out CONFIG_VIRT_TO_BUS
Date: Mon, 6 Jun 2022 11:25:35 +0200
Message-ID: <Yp3ID86TBFxl7qyL@kroah.com>
References: <20220606084109.4108188-1-arnd@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1654507538;
 bh=SGyOc8QTUXhFBU0FK2dbWFATxGIrz/5ZeL4pH3h6UnI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o5+R3V8oO4+EAgAGTpyjUIQqB3KNAeJts/jhrJSGEBRzH1PN9a+gCBfvBwaJfsi0j
 S+xDAbHwdHZEgYXeWMOFMcC/5op2p7s+cMgBf8QSuvMTb6YuVTYwduPx5uxc+DOYFd
 fr4c0yZ5gapUx5x3IKS7vTtcG+YZNWc9Hh4gX5Rc=
Content-Disposition: inline
In-Reply-To: <20220606084109.4108188-1-arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Arnd Bergmann <arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Martyn Welch <martyn-UcCTFicEjwugMbh0pXVFDA@public.gmane.org>, Manohar Vanga <manohar.vanga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-m68k-cunTk1MwBs8S/qaLPR03pWD2FQJk+8+b@public.gmane.org, Denis Efremov <efremov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Khalid Aziz <khalid-21RPF02GE+GXwddmVfQv5g@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>

On Mon, Jun 06, 2022 at 10:41:03AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> 
> The virt_to_bus/bus_to_virt interface has been deprecated for
> decades. After Jakub Kicinski put a lot of work into cleaning out the
> network drivers using them, there are only a couple of other drivers
> left, which can all be removed or otherwise cleaned up, to remove the
> old interface for good.
> 
> Any out of tree drivers using virt_to_bus() should be converted to
> using the dma-mapping interfaces, typically dma_alloc_coherent()
> or dma_map_single()).
> 
> There are a few m68k and ppc32 specific drivers that keep using the
> interfaces, but these are all guarded with architecture-specific
> Kconfig dependencies, and are not actually broken.
> 
> There are still a number of drivers that are using virt_to_phys()
> and phys_to_virt() in place of dma-mapping operations, and these
> are often broken, but they are out of scope for this series.

I'll take patches 1 and 2 right now through my staging tree if that's
ok.

thanks,

greg k-h

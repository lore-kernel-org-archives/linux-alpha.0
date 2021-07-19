From: Boris Ostrovsky <boris.ostrovsky-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 13/16] xen: swiotlb: return error code from
 xen_swiotlb_map_sg()
Date: Mon, 19 Jul 2021 16:22:04 -0400
Message-ID: <8cccf120-0b4b-4d66-0b96-4114af27a3d1@oracle.com>
References: <20210715164544.6827-1-logang@deltatee.com>
 <20210715164544.6827-14-logang@deltatee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=BNsCGg2QiqJt2o1wi4MUZO169T4Ki1eHlXiKgwijNKc=;
 b=J9p544sL474mofe+xTQoq8YsvbFrw64oRD5IzTopdPOc91RntHYiswdp+l0iBRxeKsc+
 LcbktqEYtgbIj618AUH+mwgxSMvNsZNUfmN5q0R4CqG4hanO3nDhSowI1eoszHWzWRwR
 4CTXr5nPlUhfI3A53N/MhA8T1pcmM9h5IOwEtui66Ny8pqW9rOmitzNSRdTLMNLrjSCF
 b7BTflkgSt4xkLqJiSaD1JsInPlQnXw4sEV8jRW5VOcm2mhDN6hHGvGb3cFLOD4JnBRJ
 ZbtIt8y0gtUaXpe/YLXPcV3r2J1dr2XHNnTNty3cujYk7RporaQh8GCy1b0AKWgPm6j4 lQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=BNsCGg2QiqJt2o1wi4MUZO169T4Ki1eHlXiKgwijNKc=;
 b=vAfFDN0FVWtFDBxChUpMGJe1jHbRAEf/DAYpK7h724vkUPKNPOp2KtwljQa40crfQb1D
 SP/dBs0HPDzbDyts5CUSy/0ajs62rF2NwRnogKxFF36HN5se6O1/GIF4bqM2QYFOpmyH
 5p/EBPKSLDR5LUgwkXwM9NGmmpPHxhkbJQ3fTQL0AMbQ9tLNcLmI5CrZZDC80iypBKQ/
 zNLH1fM+VmcD0+S8i21ETVE/gQW76CFIj7IoywDqJWGxxIUlA9HdwxMLF5lM7AgAK1uZ
 Rn9HkvFK5T+Wvcpz8lUQvGMOLR2g3UoQSNwsLLHTMeQgrVXMAMLLLlIBUfd1ZbH9s5fz Fg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNsCGg2QiqJt2o1wi4MUZO169T4Ki1eHlXiKgwijNKc=;
 b=Z0bNny2Hn8+wx5EDqRhz5h639ftRumqbgaiVVQ4vUM2dMQ5J1J+75SbZT8ZCLv/vFqMEoFpgbe/5F/Rglo8hGwHz0n+L2lYm//xvCOn+IuFRlm6MuvY+Tib/9SWiWCVEd5BYNtXKHsCQ0GahVlCLStRq0vGBG6VgpsDsIlgyeBM=
In-Reply-To: <20210715164544.6827-14-logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
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
To: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org
Cc: Juergen Gross <jgross-IBi9RG/b67k@public.gmane.org>, Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Konrad Rzeszutek Wilk <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Martin Oliveira <martin.oliveira-N4T0u6BTIXMybS5Ee8rs3A@public.gmane.org>, Stephen Bates <sbates-pv7U853sEMVWk0Htik3J/w@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>


On 7/15/21 12:45 PM, Logan Gunthorpe wrote:
> From: Martin Oliveira <martin.oliveira-N4T0u6BTIXMybS5Ee8rs3A@public.gmane.org>
>
> The .map_sg() op now expects an error code instead of zero on failure.
>
> xen_swiotlb_map_sg() may only fail if xen_swiotlb_map_page() fails, but
> xen_swiotlb_map_page() only supports returning errors as
> DMA_MAPPING_ERROR. So coalesce all errors into EINVAL.


Reviewed-by: Boris Ostrovsky <boris.ostrovsky-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>



From: Arnd Bergmann <arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/6] scsi: remove stale BusLogic driver
Date: Wed, 8 Jun 2022 10:19:44 +0200
Message-ID: <CAK8P3a3dfTNS4m-SVa1UH+ncT7ZOcMBRaEc7TiO9R19J3KNSxg@mail.gmail.com>
References: <20220606084109.4108188-1-arnd@kernel.org>
 <20220606084109.4108188-6-arnd@kernel.org>
 <d39fc9bb-07c1-ad74-1e89-d2aa80578cd4@gonehiking.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654676402;
 bh=rDMX5BalcedoM4G0RTFNbUxPOQoghsgu/8OBAke+GR0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=W/h6WxvlBEsPXQ7LLxZr5QO/u8vafOvVrOKwRNodyKrcwdtYx8uewJ8cCA65YcEMg
 alacQ3aEaCFnYucv14vBpxrln7eE0w+IUl9Ml0Q/7LYCRVNvGSHDuVNBRGtIoi0BHD
 Qr5ufM1dsDnPItR2irIQVGVoxerv51UkVHYmpLW+0WsyY7wVvJ+J6YNWoxtfegtWYz
 FamoyOjC7VQXl4xIUHow5CF1p1P7Wxh0bzVc5DDARXrzB/D9DtH7DJLq2uy7QMFIxO
 8gV+qq78/NW5yn20jf56zStPrE0wosJLKD6MRBsnwDN5kNQhLX1HrDNepJvQufi2cH
 3p2+fMos1M1jw==
In-Reply-To: <d39fc9bb-07c1-ad74-1e89-d2aa80578cd4-21RPF02GE+GXwddmVfQv5g@public.gmane.org>
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
To: Khalid Aziz <khalid-21RPF02GE+GXwddmVfQv5g@public.gmane.org>
Cc: linux-arch <linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-scsi <linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-m68k <linux-m68k-cunTk1MwBs8S/qaLPR03pWD2FQJk+8+b@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Martyn Welch <martyn-UcCTFicEjwugMbh0pXVFDA@public.gmane.org>, Manohar Vanga <manohar.vanga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Denis Efremov <efremov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "open list:IOMMU DRIVERS" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Matt Wang <wwentao-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Parisc List <linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, alpha <linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Maciej W . Rozycki" <macro-fOkVWZO6G+f10XsdtD+oqA@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>

On Mon, Jun 6, 2022 at 6:35 PM Khalid Aziz <khalid-21RPF02GE+GXwddmVfQv5g@public.gmane.org> wrote:
> On 6/6/22 02:41, Arnd Bergmann wrote: From: Arnd Bergmann<arnd-r2nGTMty4D4@public.gmane.org>
>
> I would say no to removing BusLogic driver. Virtualbox is another
> consumer of this driver. This driver is very old but I would rather fix
> the issues than remove it until we do not have any users.

Maciej already offered to help fix the driver, so I think it will be ok.

On the other hand, it sounds like VirtualBox users should not actually try to
use the BusLogic driver with modern Linux guests. From what I can tell
from the documentation [1], VirtualBox only provides this emulation because it
was shipped with early versions of VMware and is supported by Windows 2000
and earlier, but not actually on any modern Windows guest. The VMware
documentation in turn explicitly says that BusLogic does not work with 64-bit
guests [2], presumably this applies to both Windows and Linux guests.

        Arnd

[1] https://www.virtualbox.org/manual/ch05.html#harddiskcontrollers
[2] https://kb.vmware.com/s/article/2010470

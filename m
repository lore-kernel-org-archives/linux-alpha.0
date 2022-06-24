From: Khalid Aziz <khalid@gonehiking.org>
Subject: Re: [PATCH v2 2/3] scsi: BusLogic remove bus_to_virt
Date: Fri, 24 Jun 2022 09:38:20 -0600
Message-ID: <c955bf95-838f-cc0a-8496-322b831e5648@gonehiking.org>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-3-arnd@kernel.org>
 <7a6df2da-95e8-b2fd-7565-e4b7a51c5b63@gonehiking.org>
 <CAK8P3a0t_0scofn_2N1Q8wgJ4panKCN58AgnsJSVEj28K614oQ@mail.gmail.com>
Reply-To: khalid@gonehiking.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <CAK8P3a0t_0scofn_2N1Q8wgJ4panKCN58AgnsJSVEj28K614oQ@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-scsi <linux-scsi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>, Miquel van Smoorenburg <mikevs@xs4all.net>, Mark Salyzyn <salyzyn@android.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arch <linux-arch@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Parisc List <linux-parisc@vger.kernel.org>, Denis Efremov <efremov@linux.com>

On 6/23/22 08:47, Arnd Bergmann wrote:
> 
> 
> Can you test it again with this patch on top?
> 
> diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
> index d057abfcdd5c..9e67f2ee25ee 100644
> --- a/drivers/scsi/BusLogic.c
> +++ b/drivers/scsi/BusLogic.c
> @@ -2554,8 +2554,14 @@ static void blogic_scan_inbox(struct
> blogic_adapter *adapter)
>          enum blogic_cmplt_code comp_code;
> 
>          while ((comp_code = next_inbox->comp_code) != BLOGIC_INBOX_FREE) {
> -               struct blogic_ccb *ccb = blogic_inbox_to_ccb(adapter,
> adapter->next_inbox);
> -               if (comp_code != BLOGIC_CMD_NOTFOUND) {
> +               struct blogic_ccb *ccb = blogic_inbox_to_ccb(adapter,
> next_inbox);
> +               if (!ccb) {
> +                       /*
> +                        * This should never happen, unless the CCB list is
> +                        * corrupted in memory.
> +                        */
> +                       blogic_warn("Could not find CCB for dma
> address 0x%x\n", adapter, next_inbox->ccb);
> +               } else if (comp_code != BLOGIC_CMD_NOTFOUND) {
>                          if (ccb->status == BLOGIC_CCB_ACTIVE ||
>                                          ccb->status == BLOGIC_CCB_RESET) {

Hi Arnd,

Driver works with this change. next_inbox is the correct pointer to pass.

Thanks,
Khalid

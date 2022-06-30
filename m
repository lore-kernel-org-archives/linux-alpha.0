From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Fri, 1 Jul 2022 07:26:05 +1200
Message-ID: <13e45965-4e55-11b1-bfdc-59efaad27464@gmail.com>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
 <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
 <CAK8P3a1ivqYB38c_QTjG8e85ZBnCB6HEa-6LR1HDc8shG1Pwmw@mail.gmail.com>
 <b1edec96-ccb2-49d6-323b-1abc0dc37a50@gmail.com>
 <YrvwZi9NQSpFjStX@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BGB9eQ8ZjliFMgcRVKHE6urD7afsm+Bb1aKDYwW5Jfo=;
        b=iWoDQJ/dSdAde8AnIfDLxTdgiCOtOm+79LF23IYKQzTSvSChn0RKCEgkrj6yW/aq/L
         Ng7bKjXng0gluiBq2N+qXVNpXYJtqS/oCtHvj7VFuOyHwQQMfGgLnLNQOCJAEJPkpiFz
         k9OtgFn1UYqtdFU3SJ6Burv7HN7xACp19dipB8UXOnRrfrcJd6leCbIArojfXdQMEk7Y
         dmdguQ+pTW3/V2p6m9x2fWOO9yUsbTxLRRBRVk14fYaRWck/UzINDGudetShPegD8vs/
         9UYWZVqajm4CeiChNVdfJ+MpdaPqsySivwBLzVcXqDzRte+YXhoifrJyNvp0EqNB047u
         BQTQ==
Content-Language: en-US
In-Reply-To: <YrvwZi9NQSpFjStX@infradead.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Christoph Hellwig <hch@infradead.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, scsi <linux-scsi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Linux IOMMU <iommu@lists.linux-foundation.org>, Khalid Aziz <khalid@gonehiking.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>, Miquel van Smoorenburg <mikevs@xs4all.net>, Mark Salyzyn <salyzyn@android.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux-Arch <linux-arch@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Parisc List <linux-parisc@v>

Hi Christoph,

On 29/06/22 18:25, Christoph Hellwig wrote:
> On Wed, Jun 29, 2022 at 09:38:00AM +1200, Michael Schmitz wrote:
>> That's one of the 'liberties' I alluded to. The reason I left these in is
>> that I'm none too certain what device feature the DMA API uses to decide a
>> device isn't cache-coherent.
> The DMA API does not look at device features at all.  It needs to be
> told so by the platform code.  Once an architecture implements the
> hooks to support non-coherent DMA all devices are treated as
> non-coherent by default unless overriden by the architecture either
> globally (using the global dma_default_coherent variable) or per-device
> (using the dev->dma_coherent field, usually set by arch_setup_dma_ops).
Haven't got any of that, so non-coherent DMA is all we can use (even 
though some of the RAM used for bounce buffers may actually be coherent 
due to the page table cache bits).
>
>> If it's dev->coherent_dma_mask, the way I set
>> up the device in the a3000 driver should leave the coherent mask unchanged.
>> For the Zorro drivers, devices are set up to use the same storage to store
>> normal and coherent masks - something we most likely want to change. I need
>> to think about the ramifications of that.
> No, the coherent mask is slightly misnamed amd not actually related.

Thanks, that had me confused.

Cheers,

     Michael



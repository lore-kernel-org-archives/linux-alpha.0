From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Wed, 29 Jun 2022 11:43:55 +1200
Message-ID: <9334bac7-c9d3-b17b-f6d6-12c4bec3d138@gmail.com>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
 <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
 <CAK8P3a1ivqYB38c_QTjG8e85ZBnCB6HEa-6LR1HDc8shG1Pwmw@mail.gmail.com>
 <b1edec96-ccb2-49d6-323b-1abc0dc37a50@gmail.com>
 <CAK8P3a2jvFQBvKfdR5ivDBECN5tEej6Ja4=7Loze646hrQ5wzg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XXACMyBth2YuRsa3JBFFU2eR9hpIP7dUr/uMuQH5Oj8=;
        b=ZFKa0zjQT6sOAjCHXXkRsROHleG5wCDjvaAfz3h3OP6cgT9grR5oBZm0ZBvAWAay0r
         DR4PyHuT1QNC9LfX+RGxE2XCIQFVlFTEhqlmuIbt4B77yTiI6mL+mqc2kzFUWGgJL3DE
         xqXaW3fwHeQ1Tq9+eDu9x8IB61VGIWMo0s3NI888MArONazUjDsSuXP19BeJL7dtYHwQ
         Zwl3asU6pETG2ISfXFTMTcM6zTMGwEr28kXEV9D1VpMLrcpN6K4XgUsrTwn8x7Uqv2vl
         6hSbXMXNOxewCZj52M37+xep3zYfiDtYF+BjqZMNmFdSwg4GmcfShZeR26gbmY2em+2z
         ik6Q==
Content-Language: en-US
In-Reply-To: <CAK8P3a2jvFQBvKfdR5ivDBECN5tEej6Ja4=7Loze646hrQ5wzg@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Arnd Bergmann <arnd@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, scsi <linux-scsi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Linux IOMMU <iommu@lists.linux-foundation.org>, Khalid Aziz <khalid@gonehiking.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>, Miquel van Smoorenburg <mikevs@xs4all.net>, Mark Salyzyn <salyzyn@android.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux-Arch <linux-arch@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Parisc List <linux-pa>

Hi Arnd,

On 29/06/22 09:55, Arnd Bergmann wrote:
> On Tue, Jun 28, 2022 at 11:38 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On 28/06/22 19:08, Arnd Bergmann wrote:
>>> I see two other problems with your patch though:
>>>
>>> a) you still duplicate the cache handling: the cache_clear()/cache_push()
>>> is supposed to already be done by dma_map_single() when the device
>>> is not cache-coherent.
>> That's one of the 'liberties' I alluded to. The reason I left these in
>> is that I'm none too certain what device feature the DMA API uses to
>> decide a device isn't cache-coherent. If it's dev->coherent_dma_mask,
>> the way I set up the device in the a3000 driver should leave the
>> coherent mask unchanged. For the Zorro drivers, devices are set up to
>> use the same storage to store normal and coherent masks - something we
>> most likely want to change. I need to think about the ramifications of
>> that.
>>
>> Note that zorro_esp.c uses dma_sync_single_for_device() and uses a 32
>> bit coherent DMA mask which does work OK. I might  ask Adrian to test a
>> change to only set dev->dma_mask, and drop the
>> dma_sync_single_for_device() calls if there's any doubt on this aspect.
> The "coherent_mask" is independent of the cache flushing. On some
> architectures, a device can indicate whether it needs cache management
> or not to guarantee coherency, but on m68k it appears that we always
> assume it does, see arch/m68k/kernel/dma.c

Thanks - what I see there indicates that on the relevant platforms, 
pages mapped for DMA have their page table cache bits modified to make 
them non-cacheable (and I suppose unmapping restores the default cache 
bits). That means I should use dma_set_mask_and_coherent() here to take 
advantage of this, and no need to mess around with 
dma_sync_single_for_device() in the drivers' dma_setup() functions.

>>> b) The bounce buffer is never mapped here, instead you have the
>>> virt_to_phys() here, which is not the same. I think you need to map
>>> the pointer that actually gets passed down to the device after deciding
>>> to use a bouce buffer or not.
>> I hadn't realized that I can map the bounce buffer just as it's done for
>> the SCp data buffer. Should have been obvious, but I'm still learning
>> about the DMA API.
>>
>> I've updated the patch now, will re-send as part of a complete series
>> once done.
> I suppose you can just drop the bounce buffer if this just comes
> from kmalloc().

That's only true for a3000 and mvme147 though.

Cheers,

     Michael

>
>         Arnd

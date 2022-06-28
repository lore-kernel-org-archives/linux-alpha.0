From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Wed, 29 Jun 2022 09:38:00 +1200
Message-ID: <b1edec96-ccb2-49d6-323b-1abc0dc37a50@gmail.com>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
 <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
 <CAK8P3a1ivqYB38c_QTjG8e85ZBnCB6HEa-6LR1HDc8shG1Pwmw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WjW+6GW3ETFm2JU8jE79XhUoTv6z3/GSxYftllUP/xs=;
        b=Hl4POJee6IPPulGeCkhFVzmaewHFoLW/+/aEoDQjxUpbODhZ1oymIgaTqZ81qNcby5
         tayUWDYOl9MImX18J8dQD7IqMr+zmUU1bqZHU+pNimB587Iq3zDvd9733Lpd08PJ3ZqN
         hCcDuWiBdimpZlnAS7LXz+VIQLfHxUzeRmXR/DhhOL+83rGT7oCb0qCs+I3LD5qbJUOY
         Z7gwLbNztnnB2BuHaZLhgR2hoazBRvaRufJfP7NUdv99H5O/s5nLD+ERJ1SZjBEJ5o3/
         g1yNYiH51zSIYiit2licB5Pp4Mw6FaB2n5sZmRFysJGeMTkqmhnQmnjN1azWYVr/4Saz
         dDKw==
Content-Language: en-US
In-Reply-To: <CAK8P3a1ivqYB38c_QTjG8e85ZBnCB6HEa-6LR1HDc8shG1Pwmw@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Arnd Bergmann <arnd@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, scsi <linux-scsi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Linux IOMMU <iommu@lists.linux-foundation.org>, Khalid Aziz <khalid@gonehiking.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>, Miquel van Smoorenburg <mikevs@xs4all.net>, Mark Salyzyn <salyzyn@android.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux-Arch <linux-arch@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Parisc List <linux-pa>

Hi Arnd,

On 28/06/22 19:08, Arnd Bergmann wrote:
> On Tue, Jun 28, 2022 at 5:25 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Am 28.06.2022 um 09:12 schrieb Michael Schmitz:
>>
>> Leaving the bounce buffer handling in place, and taking a few other
>> liberties - this is what converting the easiest case (a3000 SCSI) might
>> look like. Any obvious mistakes? The mvme147 driver would be very
>> similar to handle (after conversion to a platform device).
>>
>> The driver allocates bounce buffers using kmalloc if it hits an
>> unaligned data buffer - can such buffers still even happen these days?
>> If I understand dma_map_single() correctly, the resulting dma handle
>> would be equally misaligned?
>>
>> To allocate a bounce buffer, would it be OK to use dma_alloc_coherent()
>> even though AFAIU memory used for DMA buffers generally isn't consistent
>> on m68k?
> I think it makes sense to skip the bounce buffering as you do here:
> the only standardized way we have for integrating that part is to
> use the swiotlb infrastructure, but as you mentioned earlier that
> part is probably too resource-heavy here for Amiga.
OK, leaving the old custom logic in place allows to convert the 24 bit 
DMA drivers more easily.
>
> I see two other problems with your patch though:
>
> a) you still duplicate the cache handling: the cache_clear()/cache_push()
> is supposed to already be done by dma_map_single() when the device
> is not cache-coherent.

That's one of the 'liberties' I alluded to. The reason I left these in 
is that I'm none too certain what device feature the DMA API uses to 
decide a device isn't cache-coherent. If it's dev->coherent_dma_mask, 
the way I set up the device in the a3000 driver should leave the 
coherent mask unchanged. For the Zorro drivers, devices are set up to 
use the same storage to store normal and coherent masks - something we 
most likely want to change. I need to think about the ramifications of 
that.

Note that zorro_esp.c uses dma_sync_single_for_device() and uses a 32 
bit coherent DMA mask which does work OK. I might  ask Adrian to test a 
change to only set dev->dma_mask, and drop the 
dma_sync_single_for_device() calls if there's any doubt on this aspect.

> b) The bounce buffer is never mapped here, instead you have the
> virt_to_phys() here, which is not the same. I think you need to map
> the pointer that actually gets passed down to the device after deciding
> to use a bouce buffer or not.

I hadn't realized that I can map the bounce buffer just as it's done for 
the SCp data buffer. Should have been obvious, but I'm still learning 
about the DMA API.

I've updated the patch now, will re-send as part of a complete series 
once done.

Cheers,

     Michael


>
>       Arnd

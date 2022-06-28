From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Wed, 29 Jun 2022 09:03:37 +1200
Message-ID: <c30bc9b6-6ccd-8856-dc6b-4e16450dad6f@gmail.com>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
 <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
 <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LLK2uhNNvPadjp2Oh/1lKQPTCLeKdmpKaTeJ3RDCHv0=;
        b=Plf/V32RTHjAIcY0bkPGhJbIRr6v2P2QgRVB8+7eP0P4RsyHw26WFtNVMjh4450VSL
         X8EowJeUAPv65bojUQi/l4q/mcLgIz1TUZop7B8mMf4UYeSMN97O5PhtCWd4P5KjohDY
         ALLie3yLHIm0bsPU/TnBkkd6JuMbBayFBbZiLBvLd2yar7+HLEz7eMmp19DAOWF3IuTH
         PHvtCurN4N9bl0vEQmQzWlMPAd2VaDMz3hbsjPHd4Xm7SbhJbAT/RBX6xYjOUAqBtWrm
         FLKt/ZIKzNjI8UX/5SZnYKO15W+v0GW/s3+FFXv5IZLkJGau9LvwFj0fBmt76ie2MA/E
         v/wQ==
Content-Language: en-US
In-Reply-To: <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@kernel.org>, scsi <linux-scsi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Linux IOMMU <iommu@lists.linux-foundation.org>, Khalid Aziz <khalid@gonehiking.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>, Miquel van Smoorenburg <mikevs@xs4all.net>, Mark Salyzyn <salyzyn@android.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux-Arch <linux-arch@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Parisc List <linux-parisc@vger.kernel.o>

Hi Geert,

On 28/06/22 19:03, Geert Uytterhoeven wrote:
>
>> Leaving the bounce buffer handling in place, and taking a few other
>> liberties - this is what converting the easiest case (a3000 SCSI) might
>> look like. Any obvious mistakes? The mvme147 driver would be very
>> similar to handle (after conversion to a platform device).
> Thanks, looks reasonable.
Thanks, I'll take care of Arnd's comments and post a corrected version 
later.
>> The driver allocates bounce buffers using kmalloc if it hits an
>> unaligned data buffer - can such buffers still even happen these days?
> No idea.
Hmmm - I think I'll stick a WARN_ONCE() in there so we know whether this 
code path is still being used.
>
>> If I understand dma_map_single() correctly, the resulting dma handle
>> would be equally misaligned?
>>
>> To allocate a bounce buffer, would it be OK to use dma_alloc_coherent()
>> even though AFAIU memory used for DMA buffers generally isn't consistent
>> on m68k?
>>
>> Thinking ahead to the other two Amiga drivers - I wonder whether
>> allocating a static bounce buffer or a DMA pool at driver init is likely
>> to succeed if the kernel runs from the low 16 MB RAM chunk? It certainly
>> won't succeed if the kernel runs from a higher memory address, so the
>> present bounce buffer logic around amiga_chip_alloc() might still need
>> to be used here.
>>
>> Leaves the question whether converting the gvp11 and a2091 drivers is
>> actually worth it, if bounce buffers still have to be handled explicitly.
> A2091 should be straight-forward, as A3000 is basically A2091 on the
> motherboard (comparing the two drivers, looks like someone's been
> sprinkling mb()s over the A3000 driver).

Yep, and at least the ones in the dma_setup() function are there for no 
reason (the compiler won't reorder stores around the cache flush calls, 
I hope?).

Just leaves the 24 bit DMA mask there (and likely need for bounce buffers).

> I don't have any of these SCSI host adapters (not counting the A590
> (~A2091) expansion of the old A500, which is not Linux-capable, and
>   hasn't been powered on for 20 years).

I wonder whether kullervo has survived - that one was an A3000. Should 
have gone to Adrian a few years ago...

Cheers,

     Michael


>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds

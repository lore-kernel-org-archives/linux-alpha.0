From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Tue, 28 Jun 2022 09:12:33 +1200
Message-ID: <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Oa0Pw8WRwWFDk13UOTNU8r4Zj28fKsbMsHZJFWhjWbI=;
        b=UuI0dBFgPO4diTfHy/9LPAgfpBMcc774BorzXErxQR5b8AL+fMoTv1/RUwCaUUs5Wz
         wZ41GicoS5ofRiqUMfzJSjLcsa3Lrxfcq7QsnrIjny3YpmiuCR7VENM6FYB8xkBQFZxV
         /SvrqOuGEaAsBy3VjIJv2hWBCfpevI/Qjf6b6TAcBGWsZyeAXg1pQFprfgEMNNGBMg2o
         tYBcjNK8DJCwca5jr2WTeEiIenBQUcRBZixJW3S/qcpsfVeN23O6kRkqiR3GcuTz6FFB
         bxC1nlLwsXhKrEY7yB3vYz/3Q3omwcdSNomhexVJsFmeYGEIJmGjE/zTpXa346zjItic
         z0yg==
Content-Language: en-US
In-Reply-To: <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@kernel.org>, scsi <linux-scsi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Linux IOMMU <iommu@lists.linux-foundation.org>, Khalid Aziz <khalid@gonehiking.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>, Miquel van Smoorenburg <mikevs@xs4all.net>, Mark Salyzyn <salyzyn@android.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux-Arch <linux-arch@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Parisc List <linux-parisc@vger.kernel.o>

Hi Geert,

On 27/06/22 20:26, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Sat, Jun 18, 2022 at 3:06 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Am 18.06.2022 um 00:57 schrieb Arnd Bergmann:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> All architecture-independent users of virt_to_bus() and bus_to_virt()
>>> have been fixed to use the dma mapping interfaces or have been
>>> removed now.  This means the definitions on most architectures, and the
>>> CONFIG_VIRT_TO_BUS symbol are now obsolete and can be removed.
>>>
>>> The only exceptions to this are a few network and scsi drivers for m68k
>>> Amiga and VME machines and ppc32 Macintosh. These drivers work correctly
>>> with the old interfaces and are probably not worth changing.
>> The Amiga SCSI drivers are all old WD33C93 ones, and replacing
>> virt_to_bus by virt_to_phys in the dma_setup() function there would
>> cause no functional change at all.
> FTR, the sgiwd93 driver use dma_map_single().

Thanks! From what I see, it doesn't have to deal with bounce buffers 
though?

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

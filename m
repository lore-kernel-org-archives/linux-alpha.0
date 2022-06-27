From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Mon, 27 Jun 2022 20:09:46 +1200
Message-ID: <1fa7f932-ed3d-974c-dccb-de628191993d@gmail.com>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAK8P3a1XfwkTOV7qOs1fTxf4vthNBRXKNu8A5V7TWnHT081NGA@mail.gmail.com>
 <6d1d88ee-1cf6-c735-1e6d-bafd2096e322@gmail.com>
 <CAK8P3a1KKPXr0ews9po_xjmnGYUWf18gBaZYYmnC+DvtxTKLmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=Kp9FmTyX7dGRB9FFbW8qRxYhCrBAW1WHUiTJLo4/9H4=;
        b=K613IOtiRm08GX4X7oLeBesl1pBHqqYHcDPxV7/3JEOF5n76WCWDPXYNIgN0NseE0r
         8bhO3DE3uflpJFhEfLuanvcY7ac1lLtGB/8aZNJ1w8d3jV6V1SXnxHfkCRZIkH+m60fi
         ilVcVdkV5hD1+m3AzPdKtBDW9iqf+vzUo0E9kO/Oxbv+90q0xA8uOJhRB2Gz3SW5oEWi
         yKk2yydgdryqRmqfaDuIl43PVHCXytxBCYpQ5I2V4y5AEhtLIR3BDFYDUcWk3s24zyZI
         ERJQUFowl0fWdYSG/t8vSvdCVgNdMU6LggXDVdbEtT+SZx0p1RxJ0xGekYMy+MddZSUr
         wYaA==
In-Reply-To: <CAK8P3a1KKPXr0ews9po_xjmnGYUWf18gBaZYYmnC+DvtxTKLmQ@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-scsi <linux-scsi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Khalid Aziz <khalid@gonehiking.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>, Miquel van Smoorenburg <mikevs@xs4all.net>, Mark Salyzyn <salyzyn@android.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arch <linux-arch@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Parisc List <linux-parisc@vger.kernel.org>

Arnd,

Am 26.06.2022 um 20:36 schrieb Arnd Bergmann:
>> There are no platform specific header files other than asm/amigahw.h and
>> asm/mvme147hw.h, currently only holding register address definitions.
>> Would it be OK to add m68k_virt_to_bus() in there if it can't remain in
>> asm/virtconvert.h, Geert?
>
> In that case, I would just leave it under the current name and not change
> m68k at all. I don't like the m68k_virt_to_bus() name because there is
> not anything CPU specific in what it does, and keeping it in a common
> header does nothing to prevent it from being used on other platforms
> either.

Fair enough.

>>>> 32bit powerpc is a different matter though.
>>>
>>> It's similar, but unrelated. The two apple ethernet drivers
>>> (bmac and mace) can again either get changed to use the
>>> dma-mapping interfaces, or get a custom pmac_virt_to_bus()/
>>> pmac_bus_to_virt() helper.
>>
>> Hmmm - I see Finn had done the DMA API conversion on macmace.c which
>> might give some hints on what to do about mace.c ... no idea about
>> bmac.c though. And again, haven't got hardware to test, so custom
>> helpers is it, then.
>
> Ok.

Again, no platform specific headers to shift renamed helpers to, so may 
as well keep this as-is.

Cheers,

	Michael


>
>           Arnd
>

From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Wed, 29 Jun 2022 12:14:42 +1200
Message-ID: <2402062b-aae6-a247-06a8-3775c2909bdb@gmail.com>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
 <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
 <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com>
 <c30bc9b6-6ccd-8856-dc6b-4e16450dad6f@gmail.com>
 <CAK8P3a1rxEVwVF5U-PO6pQkfURU5Tro1Qp8SPUfHEV9jjWOmCQ@mail.gmail.com>
 <9f812d3d-0fcd-46e6-6d7e-6d4bf66f24ab@gmail.com>
 <fc47e8da-81d3-e563-0a17-4eb23db015cc@acm.org>
 <859c2adc-d3cb-64e8-faba-06e1ac5eddaf@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-parisc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=05ASLe35KlS/635AYkr9ttdQBevoBXGVkR7t9AbxzS8=;
        b=dzzx4WtXS/WkHpvykE0Ug4pI7IQoDYpxYcwT22eGTgXydtRyVau06KToMULz4WZ85p
         grc9sV1BmBI096bjPV6AYIg+FD5hBe5gj3092gLAqIoDR6Usno3qkCUxW0him8f4Kt+7
         5Uf02V1S6CU9QXgRzjHroyahVKDiR/lHNsV044fz9JWOwGa1zg1AbzobwrAmZjbW8zFF
         NJWZj5bNSbN92/C5/1fpmT4IbOePFpLv8AN2psJq3YvTqAwnlZ6jrlyHQy1YHFlzFM4V
         6GGIoWoQqCmV+YlWQVYdo/a8/uHvejllTjqLg43Sy9OxgGuiI2LvtGtvLWOWEwxpHjVI
         SvDg==
Content-Language: en-US
In-Reply-To: <859c2adc-d3cb-64e8-faba-06e1ac5eddaf@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Bart Van Assche <bvanassche@acm.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, scsi <linux-scsi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Linux IOMMU <iommu@lists.linux-foundation.org>, Khalid Aziz <khalid@gonehiking.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>, Miquel van Smoorenburg <mikevs@xs4all.net>, Mark Salyzyn <salyzyn@android.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux-Arch <linux-arch@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Parisc List <linux-pa>

Hi Bart,

On 29/06/22 12:01, Michael Schmitz wrote:
>
>> An example of a user space application that passes an SG I/O data 
>> buffer to the kernel that is aligned to a four byte boundary but not 
>> to an eight byte boundary if the -s (scattered) command line option 
>> is used: 
>> https://github.com/osandov/blktests/blob/master/src/discontiguous-io.cpp
>
> Thanks - four byte alignment actually wouldn't be an issue for me. 
> It's two byte or smaller that would trip up the SCSI DMA.
>
> While I'm sure such an even more pathological test case could be 
> written, I was rather worried about st.c and sr.c input ...
Nevermind - I just see m68k defines ARCH_DMA_MINALIGN to be four bytes. 
Should be safe for all that matters, then.

Cheers,

     Michael



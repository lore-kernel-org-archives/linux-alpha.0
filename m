From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Fri, 1 Jul 2022 07:21:53 +1200
Message-ID: <c1d245ae-54c3-ec2b-e975-d50f9a863d2b@gmail.com>
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
 <YrvvfpW4MmQiM47H@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=l005vzshb3NCX9X2VM+PRHsKSH+cwoE8+hpxYOqA4As=;
        b=Ryekk371jQ1QiVX/pYGZ1Fxnqlqp0Twrw4fdw7rwXdWNZd8linJuCpYUZVY+Q0iPyf
         MQtHmLDECOfQliv0UkVXxBpP1oEkjtqBA+m+vXUw7eTKeZQm+pLSA86FeQvRbD+P0G11
         vgeXEKD6isj/F1Ee/eKIdEVU/vkXQM/wI5kbLINfslHCrrzOI44xnSHDUGCbhqvwVddM
         j34tTrE1+UG2QZsXwyPCsEBPg2rxRpPI3L1pBalHzCrfK7rgExkmBMwK3cN5a26ttPxc
         nujxQaN3aRGOZJRNQAC0dUIV+4oE8cjHO5gI3kzVIoJ4RZMsmRwklddwhggK/OvBOGty
         iS1w==
Content-Language: en-US
In-Reply-To: <YrvvfpW4MmQiM47H@infradead.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Christoph Hellwig <hch@infradead.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, scsi <linux-scsi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Linux IOMMU <iommu@lists.linux-foundation.org>, Khalid Aziz <khalid@gonehiking.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>, Miquel van Smoorenburg <mikevs@xs4all.net>, Mark Salyzyn <salyzyn@android.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux-Arch <linux-arch@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Parisc List <linux-parisc@v>

Hi Christoph,

On 29/06/22 18:21, Christoph Hellwig wrote:
> On Wed, Jun 29, 2022 at 11:09:00AM +1200, Michael Schmitz wrote:
>> And all SCSI buffers are allocated using kmalloc? No way at all for user
>> space to pass unaligned data?
> Most that you will see actually comes from the page allocator.  But
> the block layer has a dma_alignment limit, and when userspace sends
> I/O that is not properly aligned it will be bounce buffered before
> it it sent to the driver.

That limit is set to L1_CACHE_BYTES on m68k so we're good here.

Thanks,

     Michael



From: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Tue, 28 Jun 2022 16:50:09 -0700
Message-ID: <fc47e8da-81d3-e563-0a17-4eb23db015cc@acm.org>
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
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arch-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <9f812d3d-0fcd-46e6-6d7e-6d4bf66f24ab@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Schmitz <schmitzmic@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, scsi <linux-scsi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Linux IOMMU <iommu@lists.linux-foundation.org>, Khalid Aziz <khalid@gonehiking.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>, Miquel van Smoorenburg <mikevs@xs4all.net>, Mark Salyzyn <salyzyn@android.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux-Arch <linux-arch@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Parisc List <linux-pa>

On 6/28/22 16:09, Michael Schmitz wrote:
> On 29/06/22 09:50, Arnd Bergmann wrote:
>> On Tue, Jun 28, 2022 at 11:03 PM Michael Schmitz 
>> <schmitzmic@gmail.com> wrote:
>>> On 28/06/22 19:03, Geert Uytterhoeven wrote:
>>>>> The driver allocates bounce buffers using kmalloc if it hits an
>>>>> unaligned data buffer - can such buffers still even happen these days?
>>>> No idea.
>>> Hmmm - I think I'll stick a WARN_ONCE() in there so we know whether this
>>> code path is still being used.
>> kmalloc() guarantees alignment to the next power-of-two size or
>> KMALLOC_MIN_ALIGN, whichever is bigger. On m68k this means it
>> is cacheline aligned.
> 
> And all SCSI buffers are allocated using kmalloc? No way at all for user 
> space to pass unaligned data?
> 
> (SCSI is a weird beast - I have used a SCSI DAT tape driver many many 
> years ago, which broke all sorts of assumptions about transfer block 
> sizes ... but that might actually have been in the v0.99 days, many 
> rewrites of SCSI midlevel ago).
> 
> Just being cautious, as getting any of this tested will be a stretch.

An example of a user space application that passes an SG I/O data buffer 
to the kernel that is aligned to a four byte boundary but not to an 
eight byte boundary if the -s (scattered) command line option is used: 
https://github.com/osandov/blktests/blob/master/src/discontiguous-io.cpp

Bart.

From: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Tue, 28 Jun 2022 09:08:14 +0200
Message-ID: <CAK8P3a1ivqYB38c_QTjG8e85ZBnCB6HEa-6LR1HDc8shG1Pwmw@mail.gmail.com>
References: <20220617125750.728590-1-arnd@kernel.org> <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com> <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com> <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656400112;
        bh=Dm+i1ahm5JO1Y0z9h4uqTDK4kJt3Abm9W7KKXWn4iRE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qC+UQmphl8Hd+1T1U0QD9tDpqj4RMtyFkgyHY4s5qIB7gRI+xS50dQLQF60N4d53a
         pt8nrB+n/0dsGBpX9rzm604Cauhg2V1pGMdOs9Z8ftj1edDPVWFevjoguG98IqrTXI
         ivqLmEwSVJigzb4BvjUY8SyP2jqcLYvPGrfQt0+Lb4o5OGtjK05l74oqdAtZe6v+RV
         EiZUgKYNvTN+ggir5o2MPXO4/eJKq2WsfCAQvCsHp1NxR2fH/lMZBuGL6JAF9vspsB
         biRI4WdoUfZ8vhFQRuwocB5PEe84qldt+0c/fmHu+92iK9/LCneqYIva5kjHPnQFrz
         CH1QITDOJFbvA==
In-Reply-To: <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, scsi <linux-scsi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Linux IOMMU <iommu@lists.linux-foundation.org>, Khalid Aziz <khalid@gonehiking.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>, Miquel van Smoorenburg <mikevs@xs4all.net>, Mark Salyzyn <salyzyn@android.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux-Arch <linux-arch@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Parisc List <linux-pa>

On Tue, Jun 28, 2022 at 5:25 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 28.06.2022 um 09:12 schrieb Michael Schmitz:
>
> Leaving the bounce buffer handling in place, and taking a few other
> liberties - this is what converting the easiest case (a3000 SCSI) might
> look like. Any obvious mistakes? The mvme147 driver would be very
> similar to handle (after conversion to a platform device).
>
> The driver allocates bounce buffers using kmalloc if it hits an
> unaligned data buffer - can such buffers still even happen these days?
> If I understand dma_map_single() correctly, the resulting dma handle
> would be equally misaligned?
>
> To allocate a bounce buffer, would it be OK to use dma_alloc_coherent()
> even though AFAIU memory used for DMA buffers generally isn't consistent
> on m68k?

I think it makes sense to skip the bounce buffering as you do here:
the only standardized way we have for integrating that part is to
use the swiotlb infrastructure, but as you mentioned earlier that
part is probably too resource-heavy here for Amiga.

I see two other problems with your patch though:

a) you still duplicate the cache handling: the cache_clear()/cache_push()
is supposed to already be done by dma_map_single() when the device
is not cache-coherent.

b) The bounce buffer is never mapped here, instead you have the
virt_to_phys() here, which is not the same. I think you need to map
the pointer that actually gets passed down to the device after deciding
to use a bouce buffer or not.

     Arnd

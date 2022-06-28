From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Tue, 28 Jun 2022 09:03:53 +0200
Message-ID: <CAMuHMdXUihTPD9A9hs__Xr2ErfOqkZ5KgCHqm+9HvRf39uS5kA@mail.gmail.com>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
 <CAMuHMdVewn0OYA9oJfStk0-+vCKAUou+4Mvd5H2kmrSks1p5jg@mail.gmail.com>
 <b4e5a1c9-e375-63fb-ec7c-abb7384a6d59@gmail.com>
 <9289fd82-285c-035f-5355-4d70ce4f87b0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CDCE82FC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D399981B35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3783781B36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 097B081B35
In-Reply-To: <9289fd82-285c-035f-5355-4d70ce4f87b0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Michael Schmitz <schmitzmic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linux-Arch <linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, scsi <linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Miquel van Smoorenburg <mikevs-qWit8jRvyhWsTnJN9+BGXg@public.gmane.org>, linux-m68k <linux-m68k-cunTk1MwBs8S/qaLPR03pWD2FQJk+8+b@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, "Maciej W . Rozycki" <macro-fOkVWZO6G+f10XsdtD+oqA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denis Efremov <efremov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, Mark Salyzyn <salyzyn-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Linux IOMMU <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Matt Wang <wwentao-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Parisc List <linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, alpha <linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Khalid Aziz <khalid-21RPF02GE+GXwddmVfQv5g@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>

Hi Michael,

On Tue, Jun 28, 2022 at 5:26 AM Michael Schmitz <schmitzmic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Am 28.06.2022 um 09:12 schrieb Michael Schmitz:
> > On 27/06/22 20:26, Geert Uytterhoeven wrote:
> >> On Sat, Jun 18, 2022 at 3:06 AM Michael Schmitz <schmitzmic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> wrote:
> >>> Am 18.06.2022 um 00:57 schrieb Arnd Bergmann:
> >>>> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> >>>>
> >>>> All architecture-independent users of virt_to_bus() and bus_to_virt()
> >>>> have been fixed to use the dma mapping interfaces or have been
> >>>> removed now.  This means the definitions on most architectures, and the
> >>>> CONFIG_VIRT_TO_BUS symbol are now obsolete and can be removed.
> >>>>
> >>>> The only exceptions to this are a few network and scsi drivers for m68k
> >>>> Amiga and VME machines and ppc32 Macintosh. These drivers work
> >>>> correctly
> >>>> with the old interfaces and are probably not worth changing.
> >>> The Amiga SCSI drivers are all old WD33C93 ones, and replacing
> >>> virt_to_bus by virt_to_phys in the dma_setup() function there would
> >>> cause no functional change at all.
> >> FTR, the sgiwd93 driver use dma_map_single().
> >
> > Thanks! From what I see, it doesn't have to deal with bounce buffers
> > though?
>
> Leaving the bounce buffer handling in place, and taking a few other
> liberties - this is what converting the easiest case (a3000 SCSI) might
> look like. Any obvious mistakes? The mvme147 driver would be very
> similar to handle (after conversion to a platform device).

Thanks, looks reasonable.

> The driver allocates bounce buffers using kmalloc if it hits an
> unaligned data buffer - can such buffers still even happen these days?

No idea.

> If I understand dma_map_single() correctly, the resulting dma handle
> would be equally misaligned?
>
> To allocate a bounce buffer, would it be OK to use dma_alloc_coherent()
> even though AFAIU memory used for DMA buffers generally isn't consistent
> on m68k?
>
> Thinking ahead to the other two Amiga drivers - I wonder whether
> allocating a static bounce buffer or a DMA pool at driver init is likely
> to succeed if the kernel runs from the low 16 MB RAM chunk? It certainly
> won't succeed if the kernel runs from a higher memory address, so the
> present bounce buffer logic around amiga_chip_alloc() might still need
> to be used here.
>
> Leaves the question whether converting the gvp11 and a2091 drivers is
> actually worth it, if bounce buffers still have to be handled explicitly.

A2091 should be straight-forward, as A3000 is basically A2091 on the
motherboard (comparing the two drivers, looks like someone's been
sprinkling mb()s over the A3000 driver).

I don't have any of these SCSI host adapters (not counting the A590
(~A2091) expansion of the old A500, which is not Linux-capable, and
 hasn't been powered on for 20 years).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

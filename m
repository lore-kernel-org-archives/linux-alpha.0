From: Arnd Bergmann <arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/3] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Fri, 24 Jun 2022 11:10:49 +0200
Message-ID: <CAK8P3a1XfwkTOV7qOs1fTxf4vthNBRXKNu8A5V7TWnHT081NGA@mail.gmail.com>
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-4-arnd@kernel.org>
 <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EEB984902
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E5B4848D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1756B84902
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E987848FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656061867;
 bh=QZAJaXcIRADU/xKJ+9ztqTuLJLuzfPWx4kL+CXKUusE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DujAp35gBkJI0ojh8Z4cz2WNMnPVa8X09AjvGzpyvg1W3zpRtikVU8S1p5YzkeFQn
 lyqUI2IK/TRwsZ6Fphm5Gnrx8o8G+PE51sAvsFnYOkkSigRwkL7Ti34QY5mgrVlD4K
 q87W/nor5rNmj3N+qIRXTKGiC0CtdvN0KmhO4zeDIsbYYD8QC1BFTaduxwig96j3Pp
 tKSojB4iYnI/xdxLhYubiYytYTgX6J2RKt1/59qilMZK37CJaHmf49rGGpZzrmzm5C
 vXPE3OAWpxbhgHGBmdLEkg9vKAPO5+PD+s0ZO+euAV2nmh7i/+PPY0rPFj46LXVDDi
 0tE0Cc0wwED0w==
In-Reply-To: <6ba86afe-bf9f-1aca-7af1-d0d348d75ffc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: linux-arch <linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Miquel van Smoorenburg <mikevs-qWit8jRvyhWsTnJN9+BGXg@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-scsi <linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-m68k <linux-m68k-cunTk1MwBs8S/qaLPR03pWD2FQJk+8+b@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, "Maciej W . Rozycki" <macro-fOkVWZO6G+f10XsdtD+oqA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Denis Efremov <efremov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, Mark Salyzyn <salyzyn-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "open list:IOMMU DRIVERS" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Matt Wang <wwentao-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Parisc List <linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, alpha <linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Khalid Aziz <khalid-21RPF02GE+GXwddmVfQv5g@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>

On Sat, Jun 18, 2022 at 3:06 AM Michael Schmitz <schmitzmic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Am 18.06.2022 um 00:57 schrieb Arnd Bergmann:
> >
> > All architecture-independent users of virt_to_bus() and bus_to_virt()
> > have been fixed to use the dma mapping interfaces or have been
> > removed now.  This means the definitions on most architectures, and the
> > CONFIG_VIRT_TO_BUS symbol are now obsolete and can be removed.
> >
> > The only exceptions to this are a few network and scsi drivers for m68k
> > Amiga and VME machines and ppc32 Macintosh. These drivers work correctly
> > with the old interfaces and are probably not worth changing.
>
> The Amiga SCSI drivers are all old WD33C93 ones, and replacing
> virt_to_bus by virt_to_phys in the dma_setup() function there would
> cause no functional change at all.

Ok, thanks for taking a look here.

> drivers/vme/bridges/vme_ca91cx42.c hasn't been used at all on m68k (it
> is a PCI-to-VME bridge chipset driver that would be needed on
> architectures that natively use a PCI bus). I haven't found anything
> that selects that driver, so not sure it is even still in use??

It's gone now, Greg has already taken my patches for this through
the staging tree.

> That would allow you to drop the remaining virt_to_bus define from
> arch/m68k/include/asm/virtconvert.h.
>
> I could submit a patch to convert the Amiga SCSI drivers to use
> virt_to_phys if Geert and the SCSI maintainers think it's worth the churn.

I don't think using virt_to_phys() is an improvement here, as
virt_to_bus() was originally meant as a better abstraction to
replace the use of virt_to_phys() to make drivers portable, before
it got replaced by the dma-mapping interface in turn.

It looks like the Amiga SCSI drivers have an open-coded version of
what dma_map_single() does, to do bounce buffering and cache
management. The ideal solution would be to convert the drivers
actually use the appropriate dma-mapping interfaces and remove
this custom code.

The same could be done for the two vme drivers (scsi/mvme147.c
and ethernet/82596.c), which do the cache management but
apparently don't need swiotlb bounce buffering.

Rewriting the drivers to modern APIs is of course non-trivial,
and if you want a shortcut here, I would suggest introducing
platform specific helpers similar to isa_virt_to_bus() and call
them amiga_virt_to_bus() and vme_virt_to_bus, respectively.

Putting these into a platform specific header file at least helps
clarify that both the helper functions and the drivers using them
are non-portable.

> 32bit powerpc is a different matter though.

It's similar, but unrelated. The two apple ethernet drivers
(bmac and mace) can again either get changed to use the
dma-mapping interfaces, or get a custom pmac_virt_to_bus()/
pmac_bus_to_virt() helper.

There is also drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c,
which I think just needs a trivial change, but I'm not sure
how to do it correctly.

      Arnd

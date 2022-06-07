From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 6/6] arch/*/: remove CONFIG_VIRT_TO_BUS
Date: Tue, 7 Jun 2022 09:29:38 +0200
Message-ID: <CAMuHMdXi2LkrWSs9=D9tSfhz+YDHB+638F6JdmgQ7V8Gj1ehqQ@mail.gmail.com>
References: <20220606084109.4108188-1-arnd@kernel.org>
 <20220606084109.4108188-7-arnd@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <20220606084109.4108188-7-arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
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
To: Arnd Bergmann <arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linux-Arch <linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, scsi <linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-m68k <linux-m68k-cunTk1MwBs8S/qaLPR03pWD2FQJk+8+b@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Martyn Welch <martyn-UcCTFicEjwugMbh0pXVFDA@public.gmane.org>, Manohar Vanga <manohar.vanga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Denis Efremov <efremov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Linux IOMMU <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, Parisc List <linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, alpha <linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Khalid Aziz <khalid-21RPF02GE+GXwddmVfQv5g@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>

On Mon, Jun 6, 2022 at 11:10 AM Arnd Bergmann <arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>
> All architecture-independent users of virt_to_bus() and bus_to_virt()
> have been fixed to use the dma mapping interfaces or have been
> removed now.  This means the definitions on most architectures, and the
> CONFIG_VIRT_TO_BUS symbol are now obsolete and can be removed.
>
> The only exceptions to this are a few network and scsi drivers for m68k
> Amiga and VME machines and ppc32 Macintosh. These drivers work correctly
> with the old interfaces and are probably not worth changing.
>
> On alpha and parisc, virt_to_bus() were still used in asm/floppy.h.
> alpha can use isa_virt_to_bus() like x86 does, and parisc can just
> open-code the virt_to_phys() here, as this is architecture specific
> code.
>
> I tried updating the bus-virt-phys-mapping.rst documentation, which
> started as an email from Linus to explain some details of the Linux-2.0
> driver interfaces. The bits about virt_to_bus() were declared obsolete
> backin 2000, and the rest is not all that relevant any more, so in the
> end I just decided to remove the file completely.
>
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

>  arch/m68k/Kconfig                             |   1 -
>  arch/m68k/include/asm/virtconvert.h           |   4 +-

Reviewed-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Acked-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

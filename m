From: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 4/9] m68k: remove support for DISCONTIGMEM
Date: Wed, 2 Jun 2021 17:03:01 +0300
Message-ID: <YLePlSaXR0XvtZki@kernel.org>
References: <20210602105348.13387-1-rppt@kernel.org>
 <20210602105348.13387-5-rppt@kernel.org>
 <CAMuHMdUUzMNcWNXCjwZmH-VBC+jH1ShBpeg6EBCdRXv3mwHxsQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622642595;
        bh=rVTIekozkKZiHFO8KV73KQ3u8bmmogfis0wnY/V9zMk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j8vmJNJ02mTS2qujW9AuK34CyGewsKEQa3NJI4x54mI/kZ6TFkXgNShYSldLi9wwR
         iVZIZpo10XmlpdD1gKCLSxI2hAconHrCrMCgpriX/VTH8VoFXTo8owedKrPE/jIZ0c
         D0z4cOoqJMINruzqON7gaCTnozO9ZlPYtavKjKyFVVT2dZ+EtfNVi3gYHbuLNepcSX
         +gq/yzfSnUELMMLNTwhQ6DbA0qs/Rfv2LkuAbudO4aFFo53imu8k7hO2V3DMiMK48/
         BPzuDC2hRRaPw3diNLbn7YRlcBUV1pB+YMb1s77Dpt31JAkWDkRc6hv1mITOzdI2oz
         pUQhhp2WADSpA==
Content-Disposition: inline
In-Reply-To: <CAMuHMdUUzMNcWNXCjwZmH-VBC+jH1ShBpeg6EBCdRXv3mwHxsQ@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jonathan Corbet <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>, Mike Rapoport <rppt@linux.ibm.com>, Richard Henderson <rth@twiddle.net>, Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org, alpha <linux-alpha@vger.kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Linux MM <linux-mm@kvack.org>

On Wed, Jun 02, 2021 at 01:25:24PM +0200, Geert Uytterhoeven wrote:
> Hi Mike,
> 
> On Wed, Jun 2, 2021 at 12:54 PM Mike Rapoport <rppt@kernel.org> wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> >
> > DISCONTIGMEM was replaced by FLATMEM with freeing of the unused memory map
> > in v5.11.
> >
> > Remove the support for DISCONTIGMEM entirely.
> >
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> > --- a/arch/m68k/include/asm/page_mm.h
> > +++ b/arch/m68k/include/asm/page_mm.h
> > @@ -126,25 +126,7 @@ static inline void *__va(unsigned long x)
> >
> >  extern int m68k_virt_to_node_shift;
> >
> > -#ifndef CONFIG_DISCONTIGMEM
> >  #define __virt_to_node(addr)   (&pg_data_map[0])
> 
> With pg_data_map[] removed, this definition can go as well.
> Seems to be a leftover from 1008a11590b966b4 ("m68k: switch to MEMBLOCK
>  + NO_BOOTMEM")
> 
> There are a few more:
> arch/m68k/include/asm/mmzone.h:extern pg_data_t pg_data_map[];
> arch/m68k/include/asm/mmzone.h:#define NODE_DATA(nid)
> (&pg_data_map[nid])

It seems that arch/m68k/include/asm/mmzone.h can be simply removed.
 
> > -#else
> > -extern struct pglist_data *pg_data_table[];
> > -
> > -static inline __attribute_const__ int __virt_to_node_shift(void)
> > -{
> > -       int shift;
> > -
> > -       asm (
> > -               "1:     moveq   #0,%0\n"
> > -               m68k_fixup(%c1, 1b)
> > -               : "=d" (shift)
> > -               : "i" (m68k_fixup_vnode_shift));
> > -       return shift;
> > -}
> > -
> > -#define __virt_to_node(addr)   (pg_data_table[(unsigned long)(addr) >> __virt_to_node_shift()])
> > -#endif
> 
> > --- a/arch/m68k/mm/init.c
> > +++ b/arch/m68k/mm/init.c
> > @@ -44,28 +44,8 @@ EXPORT_SYMBOL(empty_zero_page);
> >
> >  int m68k_virt_to_node_shift;
> >
> > -#ifdef CONFIG_DISCONTIGMEM
> > -pg_data_t pg_data_map[MAX_NUMNODES];
> > -EXPORT_SYMBOL(pg_data_map);
> > -
> > -pg_data_t *pg_data_table[65];
> > -EXPORT_SYMBOL(pg_data_table);
> > -#endif
> > -
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Sincerely yours,
Mike.

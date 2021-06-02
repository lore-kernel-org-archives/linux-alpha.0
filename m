From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/9] m68k: remove support for DISCONTIGMEM
Date: Wed, 2 Jun 2021 13:25:24 +0200
Message-ID: <CAMuHMdUUzMNcWNXCjwZmH-VBC+jH1ShBpeg6EBCdRXv3mwHxsQ@mail.gmail.com>
References: <20210602105348.13387-1-rppt@kernel.org>
 <20210602105348.13387-5-rppt@kernel.org>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
In-Reply-To: <20210602105348.13387-5-rppt@kernel.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Rapoport <rppt@kernel.org>
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>, "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Richard Henderson <rth@twiddle.net>, Vineet Gupta <vgupta@synops>

Hi Mike,

On Wed, Jun 2, 2021 at 12:54 PM Mike Rapoport <rppt@kernel.org> wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> DISCONTIGMEM was replaced by FLATMEM with freeing of the unused memory map
> in v5.11.
>
> Remove the support for DISCONTIGMEM entirely.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/m68k/include/asm/page_mm.h
> +++ b/arch/m68k/include/asm/page_mm.h
> @@ -126,25 +126,7 @@ static inline void *__va(unsigned long x)
>
>  extern int m68k_virt_to_node_shift;
>
> -#ifndef CONFIG_DISCONTIGMEM
>  #define __virt_to_node(addr)   (&pg_data_map[0])

With pg_data_map[] removed, this definition can go as well.
Seems to be a leftover from 1008a11590b966b4 ("m68k: switch to MEMBLOCK
 + NO_BOOTMEM")

There are a few more:
arch/m68k/include/asm/mmzone.h:extern pg_data_t pg_data_map[];
arch/m68k/include/asm/mmzone.h:#define NODE_DATA(nid)
(&pg_data_map[nid])

> -#else
> -extern struct pglist_data *pg_data_table[];
> -
> -static inline __attribute_const__ int __virt_to_node_shift(void)
> -{
> -       int shift;
> -
> -       asm (
> -               "1:     moveq   #0,%0\n"
> -               m68k_fixup(%c1, 1b)
> -               : "=d" (shift)
> -               : "i" (m68k_fixup_vnode_shift));
> -       return shift;
> -}
> -
> -#define __virt_to_node(addr)   (pg_data_table[(unsigned long)(addr) >> __virt_to_node_shift()])
> -#endif

> --- a/arch/m68k/mm/init.c
> +++ b/arch/m68k/mm/init.c
> @@ -44,28 +44,8 @@ EXPORT_SYMBOL(empty_zero_page);
>
>  int m68k_virt_to_node_shift;
>
> -#ifdef CONFIG_DISCONTIGMEM
> -pg_data_t pg_data_map[MAX_NUMNODES];
> -EXPORT_SYMBOL(pg_data_map);
> -
> -pg_data_t *pg_data_table[65];
> -EXPORT_SYMBOL(pg_data_table);
> -#endif
> -

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

From: Stephen Brennan <stephen-YuLIe7w5MY0WenYVfaLwtA@public.gmane.org>
Subject: Re: [PATCH v3 5/9] mm: remove CONFIG_DISCONTIGMEM
Date: Fri, 11 Jun 2021 13:53:48 -0700
Message-ID: <87r1h886n7.fsf@stepbren-lnx.us.oracle.com>
References: <20210608091316.3622-1-rppt@kernel.org>
 <20210608091316.3622-6-rppt@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kexec-bounces+glkk-kexec=m.gmane-mx.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eyPZsyDw7gABeYwS8XHUulQLNBLiTUhSnWC6Cy+rohc=; b=uLpz38upCOmt7q
	bvj9eUhj3ihP+IpjBeVnsaqYZClCT7Xv0/bXfGPvnsFR2Dmz496oRc1gsNFtF6ymKxtM/pKoIXC4s
	B+TyQtef7YFGhwn0ae2GyAcefV6Mj9kmss1sHpdrtmYrnIuexXqT0qHODCN0ad2ySeHZl6jOObtr3
	AM04r98NsGWuxd2zHo8VI+YNUVxYQ9bYRC4stmsqxC15HWNFFVkTbsDpvc1u/3/cVVKmU9oy3zi72
	Y0Cx6mnlMKTm7JXk3yBwGYY6oms90MMJ19iMI//JCdOa4Cn3DA7pN5XgeIAwQ/g5Tct8wFZtseYrg
	xWDTcVc/AYWDW4feMk8w==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1623444841; 
 s=selector01; d=brennan.io; i=stephen-YuLIe7w5MY0WenYVfaLwtA@public.gmane.org;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
 bh=AoiLwcmX3pbOV819C0Lo7M/WNWjoO/Lazqk1NS5j5f4=;
 b=VUodxOwwNi8y2ZV9XwmfH/FLB5Dutdvekx3lJ+cc3zMogLBOrgoxpvh0Fn5PgteO
 DV4rTlIi8PRtIixHgmUQjDjasTJjwPojeggLpOcOcHRdHq3s5PanSnlFopFMJy1H+Ge
 RNuP8guFfEoTAR0L3QQgAj8N+d01mwEstQBT16Qc=
In-Reply-To: <20210608091316.3622-6-rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kexec>,
 <mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kexec/>
List-Post: <mailto:kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kexec>,
 <mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "kexec" <kexec-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: kexec-bounces+glkk-kexec=m.gmane-mx.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Ivan Kokshaysky <ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Matt Turner <mattst88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Rapoport <rppt-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, Richard Henderson <rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org>, Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arch-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-m68k-cunTk1MwBs8S/qaLPR03pWD2FQJk+8+b@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-riscv-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
> From: Mike Rapoport <rppt-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
>
> There are no architectures that support DISCONTIGMEM left.
>
> Remove the configuration option and the dead code it was guarding in the
> generic memory management code.
>
> Signed-off-by: Mike Rapoport <rppt-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
> ---
>  include/asm-generic/memory_model.h | 37 ++++--------------------------
>  include/linux/mmzone.h             |  8 ++++---
>  mm/Kconfig                         | 25 +++-----------------
>  mm/page_alloc.c                    | 13 -----------
>  4 files changed, 12 insertions(+), 71 deletions(-)
>
> diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
> index 7637fb46ba4f..a2c8ed60233a 100644
> --- a/include/asm-generic/memory_model.h
> +++ b/include/asm-generic/memory_model.h
> @@ -6,47 +6,18 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +/*
> + * supports 3 memory models.
> + */

This comment could either be updated to reflect 2 memory models, or
removed entirely.

Thanks,
Stephen

>  #if defined(CONFIG_FLATMEM)
>  
>  #ifndef ARCH_PFN_OFFSET
>  #define ARCH_PFN_OFFSET		(0UL)
>  #endif
>  
> -#elif defined(CONFIG_DISCONTIGMEM)
> -
> -#ifndef arch_pfn_to_nid
> -#define arch_pfn_to_nid(pfn)	pfn_to_nid(pfn)
> -#endif
> -
> -#ifndef arch_local_page_offset
> -#define arch_local_page_offset(pfn, nid)	\
> -	((pfn) - NODE_DATA(nid)->node_start_pfn)
> -#endif
> -
> -#endif /* CONFIG_DISCONTIGMEM */
> -
> -/*
> - * supports 3 memory models.
> - */
> -#if defined(CONFIG_FLATMEM)
> -
>  #define __pfn_to_page(pfn)	(mem_map + ((pfn) - ARCH_PFN_OFFSET))
>  #define __page_to_pfn(page)	((unsigned long)((page) - mem_map) + \
>  				 ARCH_PFN_OFFSET)
> -#elif defined(CONFIG_DISCONTIGMEM)
> -
> -#define __pfn_to_page(pfn)			\
> -({	unsigned long __pfn = (pfn);		\
> -	unsigned long __nid = arch_pfn_to_nid(__pfn);  \
> -	NODE_DATA(__nid)->node_mem_map + arch_local_page_offset(__pfn, __nid);\
> -})
> -
> -#define __page_to_pfn(pg)						\
> -({	const struct page *__pg = (pg);					\
> -	struct pglist_data *__pgdat = NODE_DATA(page_to_nid(__pg));	\
> -	(unsigned long)(__pg - __pgdat->node_mem_map) +			\
> -	 __pgdat->node_start_pfn;					\
> -})
>  
>  #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
>  
> @@ -70,7 +41,7 @@
>  	struct mem_section *__sec = __pfn_to_section(__pfn);	\
>  	__section_mem_map_addr(__sec) + __pfn;		\
>  })
> -#endif /* CONFIG_FLATMEM/DISCONTIGMEM/SPARSEMEM */
> +#endif /* CONFIG_FLATMEM/SPARSEMEM */
>  
>  /*
>   * Convert a physical address to a Page Frame Number and back
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 0d53eba1c383..700032e99419 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -738,10 +738,12 @@ struct zonelist {
>  	struct zoneref _zonerefs[MAX_ZONES_PER_ZONELIST + 1];
>  };
>  
> -#ifndef CONFIG_DISCONTIGMEM
> -/* The array of struct pages - for discontigmem use pgdat->lmem_map */
> +/*
> + * The array of struct pages for flatmem.
> + * It must be declared for SPARSEMEM as well because there are configurations
> + * that rely on that.
> + */
>  extern struct page *mem_map;
> -#endif
>  
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  struct deferred_split {
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 02d44e3420f5..218b96ccc84a 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -19,7 +19,7 @@ choice
>  
>  config FLATMEM_MANUAL
>  	bool "Flat Memory"
> -	depends on !(ARCH_DISCONTIGMEM_ENABLE || ARCH_SPARSEMEM_ENABLE) || ARCH_FLATMEM_ENABLE
> +	depends on !ARCH_SPARSEMEM_ENABLE || ARCH_FLATMEM_ENABLE
>  	help
>  	  This option is best suited for non-NUMA systems with
>  	  flat address space. The FLATMEM is the most efficient
> @@ -32,21 +32,6 @@ config FLATMEM_MANUAL
>  
>  	  If unsure, choose this option (Flat Memory) over any other.
>  
> -config DISCONTIGMEM_MANUAL
> -	bool "Discontiguous Memory"
> -	depends on ARCH_DISCONTIGMEM_ENABLE
> -	help
> -	  This option provides enhanced support for discontiguous
> -	  memory systems, over FLATMEM.  These systems have holes
> -	  in their physical address spaces, and this option provides
> -	  more efficient handling of these holes.
> -
> -	  Although "Discontiguous Memory" is still used by several
> -	  architectures, it is considered deprecated in favor of
> -	  "Sparse Memory".
> -
> -	  If unsure, choose "Sparse Memory" over this option.
> -
>  config SPARSEMEM_MANUAL
>  	bool "Sparse Memory"
>  	depends on ARCH_SPARSEMEM_ENABLE
> @@ -62,17 +47,13 @@ config SPARSEMEM_MANUAL
>  
>  endchoice
>  
> -config DISCONTIGMEM
> -	def_bool y
> -	depends on (!SELECT_MEMORY_MODEL && ARCH_DISCONTIGMEM_ENABLE) || DISCONTIGMEM_MANUAL
> -
>  config SPARSEMEM
>  	def_bool y
>  	depends on (!SELECT_MEMORY_MODEL && ARCH_SPARSEMEM_ENABLE) || SPARSEMEM_MANUAL
>  
>  config FLATMEM
>  	def_bool y
> -	depends on (!DISCONTIGMEM && !SPARSEMEM) || FLATMEM_MANUAL
> +	depends on !SPARSEMEM || FLATMEM_MANUAL
>  
>  config FLAT_NODE_MEM_MAP
>  	def_bool y
> @@ -85,7 +66,7 @@ config FLAT_NODE_MEM_MAP
>  #
>  config NEED_MULTIPLE_NODES
>  	def_bool y
> -	depends on DISCONTIGMEM || NUMA
> +	depends on NUMA
>  
>  #
>  # SPARSEMEM_EXTREME (which is the default) does some bootmem
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index aaa1655cf682..6fc22482eaa8 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -331,20 +331,7 @@ compound_page_dtor * const compound_page_dtors[NR_COMPOUND_DTORS] = {
>  
>  int min_free_kbytes = 1024;
>  int user_min_free_kbytes = -1;
> -#ifdef CONFIG_DISCONTIGMEM
> -/*
> - * DiscontigMem defines memory ranges as separate pg_data_t even if the ranges
> - * are not on separate NUMA nodes. Functionally this works but with
> - * watermark_boost_factor, it can reclaim prematurely as the ranges can be
> - * quite small. By default, do not boost watermarks on discontigmem as in
> - * many cases very high-order allocations like THP are likely to be
> - * unsupported and the premature reclaim offsets the advantage of long-term
> - * fragmentation avoidance.
> - */
> -int watermark_boost_factor __read_mostly;
> -#else
>  int watermark_boost_factor __read_mostly = 15000;
> -#endif
>  int watermark_scale_factor = 10;
>  
>  static unsigned long nr_kernel_pages __initdata;
> -- 
> 2.28.0

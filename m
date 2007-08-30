From: Christoph Lameter <clameter@sgi.com>
Subject: Re: [1/4] 2.6.23-rc4: known regressions
Date: Wed, 29 Aug 2007 17:11:09 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0708291649500.4336@schroedinger.engr.sgi.com>
References: <46D5902C.1040905@googlemail.com> <46D5B544.4030708@l4x.org>
 <20070829234734.GA26410@stusta.de>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20070829234734.GA26410@stusta.de>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@kernel.org>
Cc: Jan Dittmer <jdi@l4x.org>, Michal Piotrowski <michal.k.k.piotrowski@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org

On Thu, 30 Aug 2007, Adrian Bunk wrote:

> >   CC      init/version.o
> >   LD      init/built-in.o
> >   LD      .tmp_vmlinux1
> > arch/alpha/kernel/built-in.o(.text+0xaaa8): In function `pdev_save_srm_config':
> > include/linux/slub_def.h:154: undefined reference to `__kmalloc_size_too_large'
> > arch/alpha/kernel/built-in.o(.text+0xaaac):include/linux/slub_def.h:154: undefined reference to `__kmalloc_size_too_large'
> > arch/alpha/kernel/built-in.o(.text+0xd0a8): In function `module_frob_arch_sections':
> > include/linux/slub_def.h:154: undefined reference to `__kmalloc_size_too_large'
> > arch/alpha/kernel/built-in.o(.text+0xd0ac):include/linux/slub_def.h:154: undefined reference to `__kmalloc_size_too_large'
> > arch/alpha/kernel/built-in.o(.text+0x19388): In function `srmcons_get_private_struct':
> > include/linux/slub_def.h:154: undefined reference to `__kmalloc_size_too_large'
> > arch/alpha/kernel/built-in.o(.text+0x1938c):include/linux/slub_def.h:154: more undefined references to `__kmalloc_size_too_large' follow
> > make[1]: *** [.tmp_vmlinux1] Error 1
> > make: *** [_all] Error 2
> >...
> 
> Christoph, is your fix in -mm suitable for 2.6.23, or how else should 
> this regression be fixed for 2.6.23?

Could you give me an asm dump via objdump of one of these functions? 
I wonder what is going on there? Seeing the code generated may give us a 
hint what is going on.

Likely an old compiler that has troubles performing constant folding <sigh>. One 
solution would be to use a newer compiler?

And yes, the page allocator pass through patch in mm would fix this.

Or define CONFIG_BROKEN_CONSTANT_FOLDING for alpha and then use this 
patch:

---
 include/linux/slub_def.h |    4 ++++
 1 file changed, 4 insertions(+)

Index: linux-2.6/include/linux/slub_def.h
===================================================================
--- linux-2.6.orig/include/linux/slub_def.h	2007-08-29 17:03:48.000000000 -0700
+++ linux-2.6/include/linux/slub_def.h	2007-08-29 17:09:55.000000000 -0700
@@ -168,6 +168,7 @@ void *__kmalloc(size_t size, gfp_t flags
 
 static inline void *kmalloc(size_t size, gfp_t flags)
 {
+#ifndef CONFIG_BROKEN_CONSTANT_FOLDING
 	if (__builtin_constant_p(size) && !(flags & SLUB_DMA)) {
 		struct kmem_cache *s = kmalloc_slab(size);
 
@@ -176,6 +177,7 @@ static inline void *kmalloc(size_t size,
 
 		return kmem_cache_alloc(s, flags);
 	} else
+#endif
 		return __kmalloc(size, flags);
 }
 
@@ -185,6 +187,7 @@ void *kmem_cache_alloc_node(struct kmem_
 
 static inline void *kmalloc_node(size_t size, gfp_t flags, int node)
 {
+#ifndef CONFIG_BROKEN_CONSTANT_FOLDING
 	if (__builtin_constant_p(size) && !(flags & SLUB_DMA)) {
 		struct kmem_cache *s = kmalloc_slab(size);
 
@@ -193,6 +196,7 @@ static inline void *kmalloc_node(size_t 
 
 		return kmem_cache_alloc_node(s, flags, node);
 	} else
+#endif
 		return __kmalloc_node(size, flags, node);
 }
 #endif

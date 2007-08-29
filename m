From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [1/4] 2.6.23-rc4: known regressions
Date: Thu, 30 Aug 2007 01:47:34 +0200
Message-ID: <20070829234734.GA26410@stusta.de>
References: <46D5902C.1040905@googlemail.com> <46D5B544.4030708@l4x.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <46D5B544.4030708@l4x.org>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Dittmer <jdi@l4x.org>, Christoph Lameter <clameter@sgi.com>
Cc: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org

On Wed, Aug 29, 2007 at 08:04:52PM +0200, Jan Dittmer wrote:
> Michal Piotrowski wrote:
> > Subject         : 2.6.23-rc2 cross compile regressions (alpha,xtensa)
> > References      : http://lkml.org/lkml/2007/8/6/43 
> > Last known good : alpha: 2.6.22-git8 xtensa: 2.6.22-git6
> > Submitter       : Jan Dittmer <jdi@l4x.org>
> > Caused-By       : ?
> > Handled-By      : xtensa: Christian Zankel <chris@zankel.net>
> > Status          : unknown
> 
> Status: Unfixed
> 
> alpha:  http://l4x.org/k/?d=33700
>   CC      init/version.o
>   LD      init/built-in.o
>   LD      .tmp_vmlinux1
> arch/alpha/kernel/built-in.o(.text+0xaaa8): In function `pdev_save_srm_config':
> include/linux/slub_def.h:154: undefined reference to `__kmalloc_size_too_large'
> arch/alpha/kernel/built-in.o(.text+0xaaac):include/linux/slub_def.h:154: undefined reference to `__kmalloc_size_too_large'
> arch/alpha/kernel/built-in.o(.text+0xd0a8): In function `module_frob_arch_sections':
> include/linux/slub_def.h:154: undefined reference to `__kmalloc_size_too_large'
> arch/alpha/kernel/built-in.o(.text+0xd0ac):include/linux/slub_def.h:154: undefined reference to `__kmalloc_size_too_large'
> arch/alpha/kernel/built-in.o(.text+0x19388): In function `srmcons_get_private_struct':
> include/linux/slub_def.h:154: undefined reference to `__kmalloc_size_too_large'
> arch/alpha/kernel/built-in.o(.text+0x1938c):include/linux/slub_def.h:154: more undefined references to `__kmalloc_size_too_large' follow
> make[1]: *** [.tmp_vmlinux1] Error 1
> make: *** [_all] Error 2
>...

Christoph, is your fix in -mm suitable for 2.6.23, or how else should 
this regression be fixed for 2.6.23?

> Jan

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


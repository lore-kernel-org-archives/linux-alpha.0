From: Jan Dittmer <jdi@l4x.org>
Subject: Re: [1/4] 2.6.23-rc4: known regressions
Date: Wed, 29 Aug 2007 20:04:52 +0200
Message-ID: <46D5B544.4030708@l4x.org>
References: <46D5902C.1040905@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <46D5902C.1040905@googlemail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Christian Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org

Michal Piotrowski wrote:
> Subject         : 2.6.23-rc2 cross compile regressions (alpha,xtensa)
> References      : http://lkml.org/lkml/2007/8/6/43 
> Last known good : alpha: 2.6.22-git8 xtensa: 2.6.22-git6
> Submitter       : Jan Dittmer <jdi@l4x.org>
> Caused-By       : ?
> Handled-By      : xtensa: Christian Zankel <chris@zankel.net>
> Status          : unknown

Status: Unfixed

alpha:  http://l4x.org/k/?d=33700
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
arch/alpha/kernel/built-in.o(.text+0xaaa8): In function `pdev_save_srm_config':
include/linux/slub_def.h:154: undefined reference to `__kmalloc_size_too_large'
arch/alpha/kernel/built-in.o(.text+0xaaac):include/linux/slub_def.h:154: undefined reference to `__kmalloc_size_too_large'
arch/alpha/kernel/built-in.o(.text+0xd0a8): In function `module_frob_arch_sections':
include/linux/slub_def.h:154: undefined reference to `__kmalloc_size_too_large'
arch/alpha/kernel/built-in.o(.text+0xd0ac):include/linux/slub_def.h:154: undefined reference to `__kmalloc_size_too_large'
arch/alpha/kernel/built-in.o(.text+0x19388): In function `srmcons_get_private_struct':
include/linux/slub_def.h:154: undefined reference to `__kmalloc_size_too_large'
arch/alpha/kernel/built-in.o(.text+0x1938c):include/linux/slub_def.h:154: more undefined references to `__kmalloc_size_too_large' follow
make[1]: *** [.tmp_vmlinux1] Error 1
make: *** [_all] Error 2


xtensa: http://l4x.org/k/?d=33728
  CC      arch/xtensa/kernel/process.o
arch/xtensa/kernel/process.c:50: error: `INR_OPEN' undeclared here (not in a function)
arch/xtensa/kernel/process.c:50: error: initializer element is not constant
arch/xtensa/kernel/process.c:50: error: (near initialization for `init_signals.rlim[7].rlim_cur')
arch/xtensa/kernel/process.c:50: error: `INR_OPEN' undeclared here (not in a function)
arch/xtensa/kernel/process.c:50: error: initializer element is not constant
arch/xtensa/kernel/process.c:50: error: (near initialization for `init_signals.rlim[7].rlim_max')
arch/xtensa/kernel/process.c:50: error: initializer element is not constant
arch/xtensa/kernel/process.c:50: error: (near initialization for `init_signals.rlim[7]')
arch/xtensa/kernel/process.c:50: error: initializer element is not constant
arch/xtensa/kernel/process.c:50: error: (near initialization for `init_signals.rlim[8]')
arch/xtensa/kernel/process.c:50: error: initializer element is not constant
arch/xtensa/kernel/process.c:50: error: (near initialization for `init_signals.rlim[9]')
arch/xtensa/kernel/process.c:50: error: initializer element is not constant
arch/xtensa/kernel/process.c:50: error: (near initialization for `init_signals.rlim[10]')
arch/xtensa/kernel/process.c:50: error: initializer element is not constant
arch/xtensa/kernel/process.c:50: error: (near initialization for `init_signals.rlim[11]')
arch/xtensa/kernel/process.c:50: error: initializer element is not constant
arch/xtensa/kernel/process.c:50: error: (near initialization for `init_signals.rlim[12]')
arch/xtensa/kernel/process.c:50: error: initializer element is not constant
arch/xtensa/kernel/process.c:50: error: (near initialization for `init_signals.rlim[13]')
arch/xtensa/kernel/process.c:50: error: initializer element is not constant
arch/xtensa/kernel/process.c:50: error: (near initialization for `init_signals.rlim[14]')
arch/xtensa/kernel/process.c:50: error: initializer element is not constant
arch/xtensa/kernel/process.c:50: error: (near initialization for `init_signals.rlim')
arch/xtensa/kernel/process.c:50: error: initializer element is not constant
arch/xtensa/kernel/process.c:50: error: (near initialization for `init_signals.<anonymous>')
arch/xtensa/kernel/process.c: In function `xtensa_execve':
arch/xtensa/kernel/process.c:449: error: implicit declaration of function `getname'
arch/xtensa/kernel/process.c:449: warning: assignment makes pointer from integer without a cast
arch/xtensa/kernel/process.c:460: error: implicit declaration of function `putname'
make[2]: *** [arch/xtensa/kernel/process.o] Error 1
make[1]: *** [arch/xtensa/kernel] Error 2
make: *** [_all] Error 2


Jan


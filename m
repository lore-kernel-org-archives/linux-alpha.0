From: Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: Re: [PATCH] alpha: switch to NO_BOOTMEM
Date: Fri, 29 Jun 2018 12:24:00 +0300
Message-ID: <20180629092359.GC4799@rapoport-lnx>
References: <1530099168-31421-1-git-send-email-rppt@linux.vnet.ibm.com>
 <201806280311.v9maSSpW%fengguang.wu@intel.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201806280311.v9maSSpW%fengguang.wu@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Michal Hocko <mhocko@kernel.org>, linux-alpha <linux-alpha@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, lkml <linux-kernel@vger.kernel.org>

On Thu, Jun 28, 2018 at 05:38:29AM +0800, kbuild test robot wrote:
> Hi Mike,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v4.18-rc2 next-20180627]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Mike-Rapoport/alpha-switch-to-NO_BOOTMEM/20180627-194800
> config: alpha-allyesconfig (attached as .config)
> compiler: alpha-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.2.0 make.cross ARCH=alpha 
> 
> All error/warnings (new ones prefixed by >>):
> 
>    mm/page_alloc.c: In function 'update_defer_init':
> >> mm/page_alloc.c:321:14: error: 'PAGES_PER_SECTION' undeclared (first use in this function); did you mean 'USEC_PER_SEC'?
>          (pfn & (PAGES_PER_SECTION - 1)) == 0) {
>                  ^~~~~~~~~~~~~~~~~
>                  USEC_PER_SEC

The PAGES_PER_SECTION is  defined only for SPARSEMEM with the exception of
x86-32 defining it for DISCONTIGMEM as well. That said, any architecture
that can have DISCTONTIGMEM=y && NO_BOOTMEM=y will fail the build with
DEFERRED_STRUCT_PAGE_INIT enabled.

The simplest solution seems to make DEFERRED_STRUCT_PAGE_INIT explicitly
dependent on SPARSEMEM rather than !FLATMEM. The downside is that deferred
struct page initialization won't be available for x86-32 NUMA setups.

Thoughts?

>    mm/page_alloc.c:321:14: note: each undeclared identifier is reported only once for each function it appears in
>    In file included from include/linux/cache.h:5:0,
>                     from include/linux/printk.h:9,
>                     from include/linux/kernel.h:14,
>                     from include/asm-generic/bug.h:18,
>                     from arch/alpha/include/asm/bug.h:23,
>                     from include/linux/bug.h:5,
>                     from include/linux/mmdebug.h:5,
>                     from include/linux/mm.h:9,
>                     from mm/page_alloc.c:18:
>    mm/page_alloc.c: In function 'deferred_grow_zone':
>    mm/page_alloc.c:1624:52: error: 'PAGES_PER_SECTION' undeclared (first use in this function); did you mean 'USEC_PER_SEC'?
>      unsigned long nr_pages_needed = ALIGN(1 << order, PAGES_PER_SECTION);
>                                                        ^
>    include/uapi/linux/kernel.h:11:47: note: in definition of macro '__ALIGN_KERNEL_MASK'
>     #define __ALIGN_KERNEL_MASK(x, mask) (((x) + (mask)) & ~(mask))
>                                                   ^~~~
> >> include/linux/kernel.h:58:22: note: in expansion of macro '__ALIGN_KERNEL'
>     #define ALIGN(x, a)  __ALIGN_KERNEL((x), (a))
>                          ^~~~~~~~~~~~~~
> >> mm/page_alloc.c:1624:34: note: in expansion of macro 'ALIGN'
>      unsigned long nr_pages_needed = ALIGN(1 << order, PAGES_PER_SECTION);
>                                      ^~~~~
>    In file included from include/asm-generic/bug.h:18:0,
>                     from arch/alpha/include/asm/bug.h:23,
>                     from include/linux/bug.h:5,
>                     from include/linux/mmdebug.h:5,
>                     from include/linux/mm.h:9,
>                     from mm/page_alloc.c:18:
>    mm/page_alloc.c: In function 'free_area_init_node':
>    mm/page_alloc.c:6379:50: error: 'PAGES_PER_SECTION' undeclared (first use in this function); did you mean 'USEC_PER_SEC'?
>      pgdat->static_init_pgcnt = min_t(unsigned long, PAGES_PER_SECTION,
>                                                      ^
>    include/linux/kernel.h:812:22: note: in definition of macro '__typecheck'
>       (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
>                          ^
>    include/linux/kernel.h:836:24: note: in expansion of macro '__safe_cmp'
>      __builtin_choose_expr(__safe_cmp(x, y), \
>                            ^~~~~~~~~~
>    include/linux/kernel.h:904:27: note: in expansion of macro '__careful_cmp'
>     #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
>                               ^~~~~~~~~~~~~
> >> mm/page_alloc.c:6379:29: note: in expansion of macro 'min_t'
>      pgdat->static_init_pgcnt = min_t(unsigned long, PAGES_PER_SECTION,
>                                 ^~~~~
>    include/linux/kernel.h:836:2: error: first argument to '__builtin_choose_expr' not a constant
>      __builtin_choose_expr(__safe_cmp(x, y), \
>      ^
>    include/linux/kernel.h:904:27: note: in expansion of macro '__careful_cmp'
>     #define min_t(type, x, y) __careful_cmp((type)(x), (type)(y), <)
>                               ^~~~~~~~~~~~~
> >> mm/page_alloc.c:6379:29: note: in expansion of macro 'min_t'
>      pgdat->static_init_pgcnt = min_t(unsigned long, PAGES_PER_SECTION,
>                                 ^~~~~
> 
> vim +/__ALIGN_KERNEL +58 include/linux/kernel.h
> 
> 44696908 David S. Miller     2012-05-23  56  
> 3ca45a46 zijun_hu            2016-10-14  57  /* @a is a power of 2 value */
> a79ff731 Alexey Dobriyan     2010-04-13 @58  #define ALIGN(x, a)		__ALIGN_KERNEL((x), (a))
> ed067d4a Krzysztof Kozlowski 2017-04-11  59  #define ALIGN_DOWN(x, a)	__ALIGN_KERNEL((x) - ((a) - 1), (a))
> 9f93ff5b Alexey Dobriyan     2010-04-13  60  #define __ALIGN_MASK(x, mask)	__ALIGN_KERNEL_MASK((x), (mask))
> a83308e6 Matthew Wilcox      2007-09-11  61  #define PTR_ALIGN(p, a)		((typeof(p))ALIGN((unsigned long)(p), (a)))
> f10db627 Herbert Xu          2008-02-06  62  #define IS_ALIGNED(x, a)		(((x) & ((typeof(x))(a) - 1)) == 0)
> 2ea58144 Linus Torvalds      2006-11-26  63  
> 
> :::::: The code at line 58 was first introduced by commit
> :::::: a79ff731a1b277d0e92d9453bdf374e04cec717a netfilter: xtables: make XT_ALIGN() usable in exported headers by exporting __ALIGN_KERNEL()
> 
> :::::: TO: Alexey Dobriyan <adobriyan@gmail.com>
> :::::: CC: Patrick McHardy <kaber@trash.net>
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation



-- 
Sincerely yours,
Mike.


From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH] alpha: switch to NO_BOOTMEM
Date: Fri, 29 Jun 2018 11:43:58 +0200
Message-ID: <20180629094358.GE13860@dhcp22.suse.cz>
References: <1530099168-31421-1-git-send-email-rppt@linux.vnet.ibm.com>
 <201806280311.v9maSSpW%fengguang.wu@intel.com>
 <20180629092359.GC4799@rapoport-lnx>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180629092359.GC4799@rapoport-lnx>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@01.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha <linux-alpha@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, lkml <linux-kernel@vger.kernel.org>

On Fri 29-06-18 12:24:00, Mike Rapoport wrote:
> On Thu, Jun 28, 2018 at 05:38:29AM +0800, kbuild test robot wrote:
> > Hi Mike,
> > 
> > I love your patch! Yet something to improve:
> > 
> > [auto build test ERROR on linus/master]
> > [also build test ERROR on v4.18-rc2 next-20180627]
> > [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> > 
> > url:    https://github.com/0day-ci/linux/commits/Mike-Rapoport/alpha-switch-to-NO_BOOTMEM/20180627-194800
> > config: alpha-allyesconfig (attached as .config)
> > compiler: alpha-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # save the attached .config to linux build tree
> >         GCC_VERSION=7.2.0 make.cross ARCH=alpha 
> > 
> > All error/warnings (new ones prefixed by >>):
> > 
> >    mm/page_alloc.c: In function 'update_defer_init':
> > >> mm/page_alloc.c:321:14: error: 'PAGES_PER_SECTION' undeclared (first use in this function); did you mean 'USEC_PER_SEC'?
> >          (pfn & (PAGES_PER_SECTION - 1)) == 0) {
> >                  ^~~~~~~~~~~~~~~~~
> >                  USEC_PER_SEC
> 
> The PAGES_PER_SECTION is  defined only for SPARSEMEM with the exception of
> x86-32 defining it for DISCONTIGMEM as well. That said, any architecture
> that can have DISCTONTIGMEM=y && NO_BOOTMEM=y will fail the build with
> DEFERRED_STRUCT_PAGE_INIT enabled.
> 
> The simplest solution seems to make DEFERRED_STRUCT_PAGE_INIT explicitly
> dependent on SPARSEMEM rather than !FLATMEM. The downside is that deferred
> struct page initialization won't be available for x86-32 NUMA setups.

I am really dubious that 32b systems really need DEFERRED_STRUCT_PAGE_INIT.
Regardless of the memory mode. Those systems simply do not have enough
memory to bother. Deferred initialization is targeting much larger
beasts.
-- 
Michal Hocko
SUSE Labs

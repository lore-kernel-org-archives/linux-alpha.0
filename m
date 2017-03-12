From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 03/19] alpha: marvel: make use of raw_spinlock variants
Date: Sun, 12 Mar 2017 10:58:35 +0800
Message-ID: <201703121014.YoUhr4Ar%fengguang.wu@intel.com>
References: <0b729cf0f8bf233ed7ef743cd811306fd5c959e8.1489015238.git.julia@ni.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Nq2Wo0NMKNjxTN9z"
Return-path: <linux-alpha-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0b729cf0f8bf233ed7ef743cd811306fd5c959e8.1489015238.git.julia@ni.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Julia Cartwright <julia@ni.com>
Cc: kbuild-all@01.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Julia,

[auto build test ERROR on gpio/for-next]
[also build test ERROR on v4.11-rc1 next-20170309]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Julia-Cartwright/fixup-usage-of-non-raw-spinlocks-in-irqchips/20170312-015922
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
config: alpha-alldefconfig (attached as .config)
compiler: alpha-linux-gnu-gcc (Debian 6.1.1-9) 6.1.1 20160705
reproduce:
        wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=alpha 

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:7:0,
                    from include/linux/gfp.h:5,
                    from include/linux/mm.h:9,
                    from arch/alpha/include/asm/io.h:7,
                    from arch/alpha/kernel/core_marvel.c:8:
   arch/alpha/kernel/core_marvel.c: In function 'alloc_io7':
>> arch/alpha/kernel/core_marvel.c:121:17: error: passing argument 1 of 'spinlock_check' from incompatible pointer type [-Werror=incompatible-pointer-types]
     spin_lock_init(&io7->irq_lock);
                    ^
   include/linux/spinlock.h:293:17: note: in definition of macro 'spin_lock_init'
     spinlock_check(_lock);    \
                    ^~~~~
   include/linux/spinlock.h:286:40: note: expected 'spinlock_t * {aka struct spinlock *}' but argument is of type 'raw_spinlock_t * {aka struct raw_spinlock *}'
    static __always_inline raw_spinlock_t *spinlock_check(spinlock_t *lock)
                                           ^~~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:7:0,
                    from include/linux/gfp.h:5,
                    from include/linux/mm.h:9,
                    from arch/alpha/include/asm/io.h:7,
                    from arch/alpha/kernel/core_marvel.c:8:
>> include/linux/spinlock.h:294:29: error: 'raw_spinlock_t {aka struct raw_spinlock}' has no member named 'rlock'; did you mean 'raw_lock'?
     raw_spin_lock_init(&(_lock)->rlock);  \
                                ^
   include/linux/spinlock.h:104:9: note: in definition of macro 'raw_spin_lock_init'
     do { *(lock) = __RAW_SPIN_LOCK_UNLOCKED(lock); } while (0)
            ^~~~
>> arch/alpha/kernel/core_marvel.c:121:2: note: in expansion of macro 'spin_lock_init'
     spin_lock_init(&io7->irq_lock);
     ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +294 include/linux/spinlock.h

c2f21ce2 Thomas Gleixner 2009-12-02  280  #endif
c2f21ce2 Thomas Gleixner 2009-12-02  281  
c2f21ce2 Thomas Gleixner 2009-12-02  282  /*
c2f21ce2 Thomas Gleixner 2009-12-02  283   * Map the spin_lock functions to the raw variants for PREEMPT_RT=n
c2f21ce2 Thomas Gleixner 2009-12-02  284   */
c2f21ce2 Thomas Gleixner 2009-12-02  285  
3490565b Denys Vlasenko  2015-07-13 @286  static __always_inline raw_spinlock_t *spinlock_check(spinlock_t *lock)
c2f21ce2 Thomas Gleixner 2009-12-02  287  {
c2f21ce2 Thomas Gleixner 2009-12-02  288  	return &lock->rlock;
c2f21ce2 Thomas Gleixner 2009-12-02  289  }
c2f21ce2 Thomas Gleixner 2009-12-02  290  
c2f21ce2 Thomas Gleixner 2009-12-02  291  #define spin_lock_init(_lock)				\
c2f21ce2 Thomas Gleixner 2009-12-02  292  do {							\
c2f21ce2 Thomas Gleixner 2009-12-02  293  	spinlock_check(_lock);				\
c2f21ce2 Thomas Gleixner 2009-12-02 @294  	raw_spin_lock_init(&(_lock)->rlock);		\
c2f21ce2 Thomas Gleixner 2009-12-02  295  } while (0)
c2f21ce2 Thomas Gleixner 2009-12-02  296  
3490565b Denys Vlasenko  2015-07-13  297  static __always_inline void spin_lock(spinlock_t *lock)

:::::: The code at line 294 was first introduced by commit
:::::: c2f21ce2e31286a0a32f8da0a7856e9ca1122ef3 locking: Implement new raw_spinlock

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--Nq2Wo0NMKNjxTN9z
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--Nq2Wo0NMKNjxTN9z--

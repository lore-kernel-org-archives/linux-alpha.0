From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 1/4] PCI: Introduce pci_dev_for_each_resource()
Date: Fri, 17 Mar 2023 03:03:04 +0800
Message-ID: <202303170223.V0xQhs1V-lkp@intel.com>
References: <20230314192634.63531-2-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678993428; x=1710529428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zUzkGxrqKDPR6SroJseKwSx7MVAGnpL/Grdhlw6b7UE=;
  b=GGGcwcWFhVNUPqlV5cS7jhSo++oAJJeSo+qf8YGM9dLprFCOO90c7NMm
   e8AhBjSiTxfCcsA0O81ZpHm5F4j+gpsUAI9H1C81Sv7zAKj5/fHr1lai4
   hEbgqNKOh6T2ENt2DM/sliOpWhZNXF1cX+UNrAZYnmO59Wa+ehb4oCZJd
   bQ6irRFzgXO/MfQ1FFy326yiwnl/C2t1daZQ4tx/KhKcHBV7DzcLjin0g
   3ddESbDNI/pjbsLY+8U2qN/0vrXedmDzmX7lS/nykk7GfmB6WVFfSiZmh
   zoOpHKx6VD5zBdoQp5tLxiS4ZMFiN3xNtXzlWPkv8RD4F3aXnH27TcJ5N
   g==;
Content-Disposition: inline
In-Reply-To: <20230314192634.63531-2-andriy.shevchenko@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozla
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus powerpc/next powerpc/fixes linus/master v6.3-rc2 next-20230316]
[cannot apply to soc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/PCI-Introduce-pci_dev_for_each_resource/20230315-032821
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20230314192634.63531-2-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v5 1/4] PCI: Introduce pci_dev_for_each_resource()
config: powerpc-randconfig-r032-20230312 (https://download.01.org/0day-ci/archive/20230317/202303170223.V0xQhs1V-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/85cdf4746b716f7b6c14d7dc5cd907c3c2a1fb0c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/PCI-Introduce-pci_dev_for_each_resource/20230315-032821
        git checkout 85cdf4746b716f7b6c14d7dc5cd907c3c2a1fb0c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303170223.V0xQhs1V-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/52xx/mpc52xx_pci.c:331:6: error: unused variable 'i' [-Werror,-Wunused-variable]
           int i;
               ^
   1 error generated.


vim +/i +331 arch/powerpc/platforms/52xx/mpc52xx_pci.c

f42963f8646540 Grant Likely    2006-12-12  326  
f42963f8646540 Grant Likely    2006-12-12  327  static void
f42963f8646540 Grant Likely    2006-12-12  328  mpc52xx_pci_fixup_resources(struct pci_dev *dev)
f42963f8646540 Grant Likely    2006-12-12  329  {
85cdf4746b716f Mika Westerberg 2023-03-14  330  	struct resource *res;
f42963f8646540 Grant Likely    2006-12-12 @331  	int i;
f42963f8646540 Grant Likely    2006-12-12  332  
59510820fff76f Randy Dunlap    2021-04-28  333  	pr_debug("%s() %.4x:%.4x\n", __func__, dev->vendor, dev->device);
f42963f8646540 Grant Likely    2006-12-12  334  
f42963f8646540 Grant Likely    2006-12-12  335  	/* We don't rely on boot loader for PCI and resets all
f42963f8646540 Grant Likely    2006-12-12  336  	   devices */
85cdf4746b716f Mika Westerberg 2023-03-14  337  	pci_dev_for_each_resource_p(dev, res) {
f42963f8646540 Grant Likely    2006-12-12  338  		if (res->end > res->start) {	/* Only valid resources */
f42963f8646540 Grant Likely    2006-12-12  339  			res->end -= res->start;
f42963f8646540 Grant Likely    2006-12-12  340  			res->start = 0;
f42963f8646540 Grant Likely    2006-12-12  341  			res->flags |= IORESOURCE_UNSET;
f42963f8646540 Grant Likely    2006-12-12  342  		}
f42963f8646540 Grant Likely    2006-12-12  343  	}
f42963f8646540 Grant Likely    2006-12-12  344  
f42963f8646540 Grant Likely    2006-12-12  345  	/* The PCI Host bridge of MPC52xx has a prefetch memory resource
f42963f8646540 Grant Likely    2006-12-12  346  	   fixed to 1Gb. Doesn't fit in the resource system so we remove it */
f42963f8646540 Grant Likely    2006-12-12  347  	if ( (dev->vendor == PCI_VENDOR_ID_MOTOROLA) &&
f42963f8646540 Grant Likely    2006-12-12  348  	     (   dev->device == PCI_DEVICE_ID_MOTOROLA_MPC5200
f42963f8646540 Grant Likely    2006-12-12  349  	      || dev->device == PCI_DEVICE_ID_MOTOROLA_MPC5200B) ) {
f42963f8646540 Grant Likely    2006-12-12  350  		struct resource *res = &dev->resource[1];
f42963f8646540 Grant Likely    2006-12-12  351  		res->start = res->end = res->flags = 0;
f42963f8646540 Grant Likely    2006-12-12  352  	}
f42963f8646540 Grant Likely    2006-12-12  353  }
f42963f8646540 Grant Likely    2006-12-12  354  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

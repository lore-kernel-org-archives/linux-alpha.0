From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v7 3/6] PCI: Allow pci_bus_for_each_resource() to take
 less arguments
Date: Thu, 30 Mar 2023 18:38:50 +0300
Message-ID: <ZCWtCpQBAM7oR6ra@smile.fi.intel.com>
References: <20230323173610.60442-4-andriy.shevchenko@linux.intel.com>
 <202303302009.55848372-oliver.sang@intel.com>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680190749; x=1711726749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2y+Qd+RESrzEa/F9wmN52tzUziPss+ZxjSltCa9P/hk=;
  b=XUaJ54oMztjo5zzZAkUUI/cSufWKwCGk+SyH47VZs38IDrlrmW3ZKHva
   d8mrCiGnHwlU15WMqeXtQPbsHokH70DPzWNsrSSPjMZshuD2s7OZrmWk/
   pyn1QvXDiS3PaLGXT1/WqAIbH8AUaq8X9WAEkH5+T6DjYthBwUq7uczGS
   s9hd8Xfemsao9ZYhuJ+76SsdxN2A5eulLFlOpPxJuoQJGqrxqbIHzVuPb
   n/LwNNKYiRkILgJC4y03jcTttlmIvNg2WLzqrDdoqsUU4VDdGuLaOZ5D5
   EFf+sM5VEQhKstIf42nlzAagMYyu+km6IvzlCl+uFN3EXbo3iq202khQL
   A==;
Content-Disposition: inline
In-Reply-To: <202303302009.55848372-oliver.sang@intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, linux-pci@vger.kernel.org, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, li

On Thu, Mar 30, 2023 at 09:24:21PM +0800, kernel test robot wrote:
> 
> Greeting,
> 
> FYI, we noticed various errors such like
>     "i40e: probe of 0000:3d:00.0 failed with error -12"
> due to commit (built with gcc-11):
> 
> commit: d23d5938fd7ced817d6aa1ff86cd671ebbaebfc2 ("[PATCH v7 3/6] PCI: Allow pci_bus_for_each_resource() to take less arguments")
> url: https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/kernel-h-Split-out-COUNT_ARGS-and-CONCATENATE/20230324-013857
> base: https://git.kernel.org/cgit/linux/kernel/git/pci/pci.git next
> patch link: https://lore.kernel.org/all/20230323173610.60442-4-andriy.shevchenko@linux.intel.com/
> patch subject: [PATCH v7 3/6] PCI: Allow pci_bus_for_each_resource() to take less arguments
> 
> in testcase: boot
> 
> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> 
> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Link: https://lore.kernel.org/oe-lkp/202303302009.55848372-oliver.sang@intel.com

Thanks, that is useful test!

-- 
With Best Regards,
Andy Shevchenko



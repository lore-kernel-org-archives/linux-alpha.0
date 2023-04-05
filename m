From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v8 5/7] PCI: Allow pci_bus_for_each_resource() to take
 less arguments
Date: Wed, 5 Apr 2023 14:50:47 +0300
Message-ID: <ZC1glzw4F9F8zCK+@smile.fi.intel.com>
References: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
 <20230330162434.35055-6-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Return-path: <linux-acpi-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680695464; x=1712231464;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CNsMJe3NJRh194M0JTRSE7YPi2b+rJpnYVMeT8Rmlsg=;
  b=Lu3tYDLRXv9qwqJIg+37k1wYWQG7yvee8VxkjgZeKlxj/+CA9vN1eNhh
   4LAmNkIWIDNrb9vstLnoW6u3bSbou3j4Y7ZA4ZfkBREEtiBzmc05ikxVQ
   aN0KDmrvCy55qbgK4yQjoNCmpLkZqvbT5WMZTbJQGnppVCFfsWEGs4kQP
   hASFK/q4xHXz0yAPx3fgzPhGC0ojPUMy2HYQlLros+KWfTc6jqVacYLv5
   ATWKoQvfF0xlB7TbwH1eEQZKX/WoG5DTEt0sINIe0ta7cYmzv3hF8hlAb
   rgGA8B9BR6g0nU30KfnHGe7zaPAuISO0qOwGC1HzZEqtH66xNaE5H4X3Q
   w==;
Content-Disposition: inline
In-Reply-To: <20230330162434.35055-6-andriy.shevchenko@linux.intel.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
Cc: Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Anatolij Gustschin <agust@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>

On Thu, Mar 30, 2023 at 07:24:32PM +0300, Andy Shevchenko wrote:
> Refactor pci_bus_for_each_resource() in the same way as it's done in
> pci_dev_for_each_resource() case. This will allow to hide iterator
> inside the loop, where it's not used otherwise.
> 
> No functional changes intended.

Bjorn, this has wrong author in your tree:

https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=resource&id=46dbad19a59e0dd8f1e7065e5281345797fbb365

Or did I misinterpret something?

-- 
With Best Regards,
Andy Shevchenko



From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 1/4] PCI: Introduce pci_dev_for_each_resource()
Date: Tue, 14 Mar 2023 20:43:27 +0200
Message-ID: <ZBDAT4MJO+fBy61n@smile.fi.intel.com>
References: <20230310171416.23356-2-andriy.shevchenko@linux.intel.com>
 <d057ac5c-5947-41e1-abc7-9428fbd2fbe2@kili.mountain>
Mime-Version: 1.0
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678819422; x=1710355422;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HcDoA6lnkNndAAvLyrmktLzn4ToTWYKaGtwl/HFFUFk=;
  b=Q2SM+PncGWYFJsJbm4vISbUrRV85QIpSIy4A0sRsGzUZGLXxWY+g9onv
   +Xh0IxCgqqgS4OgGiiynt5lFyxrC/6uy7YvKUXj3DvrMUlCZ6eJ/RFwJx
   Iyeic7/p8QSE+BudxA3u/TQn3oG3egdgCg3siLGPUNknRpgR9hnh+M+4A
   wnCqORaQld/eclXVEnjAZ1IEqOBzDYOQQmF/mdqsQOWnqCkZfYucvTGmj
   PzDQNwFM0LFOdrYlJxwuzxeEY/TwaPws+HoVhdYwzKKJ97d8/G22zfrel
   bh2Dyj5CoF3qBErTqBpHh1bcTVlxNYYAA5MGX8Jwg8Wc+3jBtFCkFmBSk
   g==;
Content-Disposition: inline
In-Reply-To: <d057ac5c-5947-41e1-abc7-9428fbd2fbe2@kili.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, linux-acpi@vger.

On Sat, Mar 11, 2023 at 04:54:32PM +0300, Dan Carpenter wrote:

> 059b4a086017fb Mika Westerberg 2023-03-10  246  			unsigned long type = resource_type(r);
> 999ed65ad12e37 Rene Herman     2008-07-25  247  
> 059b4a086017fb Mika Westerberg 2023-03-10 @248  			if (type != IORESOURCE_IO || type != IORESOURCE_MEM ||
>                                                                                                   ^^
> This || needs to be &&.  This loop will always hit the continue path
> without doing anything.
> 
> 059b4a086017fb Mika Westerberg 2023-03-10  249  			    resource_size(r) == 0)
> 0509ad5e1a7d92 Bjorn Helgaas   2008-03-11  250  				continue;

Thanks, I'll fix in v5.

-- 
With Best Regards,
Andy Shevchenko




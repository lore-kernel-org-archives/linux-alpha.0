From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 4/4] pcmcia: Convert to use
 pci_bus_for_each_resource_p()
Date: Thu, 3 Nov 2022 20:01:32 +0200
Message-ID: <Y2QB/BxfKCjckaaU@smile.fi.intel.com>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
 <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
 <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
 <Y2P2ja26ikNecTsv@smile.fi.intel.com>
 <Y2P5mRt//Pp6XTLT@owl.dominikbrodowski.net>
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
  t=1667498505; x=1699034505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yb2Mq3fbpPtLAnjCVdV2BEIMFU/XQ1cYRIu5k0HafqM=;
  b=QawNy6MCX1+5ktWAplobfXkYqgAkMLc9J1Ts6EjU3++8Dj486ixCVwJf
   7yBcGzXWd0exg+s579XGAxjcfcycD4UwUMFs/ACPTVbnxN7EFP56BCG14
   m8WLn0HPenmWa/SPu9VPnuzQuCZ+nG6qo3aW9jDXx/xMYl/kpZE9uYOKK
   sFN81QNyO+FEN3cGfhddm2Yk9zGW47ktq5CG8sAbz8Gxn7HEFgkQwBkuW
   mLwZgVc8GWHBkvPSD1q679ncO1PpI8LEhEU0y3qGmSsPAi1ZHnQo9cgNg
   sP5o+i3orj4U98Yg4AH+yTNTYS+ZcTX2fHT2GLoEliZ9wZYrL/wBVX798
   A==;
Content-Disposition: inline
In-Reply-To: <Y2P5mRt//Pp6XTLT@owl.dominikbrodowski.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, Miguel Ojeda <ojeda@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, David S

On Thu, Nov 03, 2022 at 06:25:45PM +0100, Dominik Brodowski wrote:
> Am Thu, Nov 03, 2022 at 07:12:45PM +0200 schrieb Andy Shevchenko:
> > On Thu, Nov 03, 2022 at 06:03:24PM +0100, Dominik Brodowski wrote:

...

> > Considering this is done, can you issue your conditional tag so I will
> > incorporate it in v3?
> 
> Certainly, feel free to add
> 
> 	Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>

Thank you for the review!

-- 
With Best Regards,
Andy Shevchenko




From: "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH 5/6] scsi: remove stale BusLogic driver
Date: Mon, 6 Jun 2022 11:40:21 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2206061057060.19680@angie.orcam.me.uk>
References: <20220606084109.4108188-1-arnd@kernel.org> <20220606084109.4108188-6-arnd@kernel.org>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <20220606084109.4108188-6-arnd@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org, Khalid Aziz <khalid@gonehiking.org>, linux-scsi@vger.kernel.org, Manohar Vanga <manohar.vanga@gmail.com>, Martyn Welch <martyn@welchs.me.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org, Denis Efremov <efremov@linux.com>, Matt Wang <wwentao@vmware.com>

On Mon, 6 Jun 2022, Arnd Bergmann wrote:

> This was in turn fixed in commit 56f396146af2 ("scsi: BusLogic: Fix
> 64-bit system enumeration error for Buslogic"), 8 years later.
> 
> The fact that this was found at all is an indication that there are
> users, and it seems that Maciej, Matt and Khalid all have access to
> this hardware, but if it took eight years to find the problem,
> it's likely that nobody actually relies on it.

 Umm, I use it with a 32-bit system, so it would be quite an issue for me 
to discover a problem with 64-bit configurations.  And I quite rely on 
this system for various stuff too!

> Remove it as part of the global virt_to_bus()/bus_to_virt() removal.
> If anyone is still interested in keeping this driver, the alternative
> is to stop it from using bus_to_virt(), possibly along the lines of
> how dpt_i2o gets around the same issue.

 Thanks for the pointer and for cc-ing me.  Please refrain from removing 
the driver at least for this release cycle and let me fix it.  It should 
be easy to mimic what I did for the defza driver: all bus addresses in the 
DMA API come associated with virtual addresses, so it is just a matter of 
recording those somewhere for later use rather than trying to mess up with 
bus addresses to figure out a reverse mapping.

  Maciej

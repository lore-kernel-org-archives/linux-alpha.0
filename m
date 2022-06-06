From: Khalid Aziz <khalid@gonehiking.org>
Subject: Re: [PATCH 5/6] scsi: remove stale BusLogic driver
Date: Mon, 6 Jun 2022 10:35:28 -0600
Message-ID: <d39fc9bb-07c1-ad74-1e89-d2aa80578cd4@gonehiking.org>
References: <20220606084109.4108188-1-arnd@kernel.org>
 <20220606084109.4108188-6-arnd@kernel.org>
Reply-To: khalid@gonehiking.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <20220606084109.4108188-6-arnd@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org, linux-scsi@vger.kernel.org, Manohar Vanga <manohar.vanga@gmail.com>, Martyn Welch <martyn@welchs.me.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org, Denis Efremov <efremov@linux.com>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>

On 6/6/22 02:41, Arnd Bergmann wrote:
> From: Arnd Bergmann<arnd@arndb.de>
> 
> The BusLogic driver is the last remaining driver that relies on the
> deprecated bus_to_virt() function, which in turn only works on a few
> architectures, and is incompatible with both swiotlb and iommu support.
> 
> Before commit 391e2f25601e ("[SCSI] BusLogic: Port driver to 64-bit."),
> the driver had a dependency on x86-32, presumably because of this
> problem. However, the change introduced another bug that made it still
> impossible to use the driver on any 64-bit machine.
> 
> This was in turn fixed in commit 56f396146af2 ("scsi: BusLogic: Fix
> 64-bit system enumeration error for Buslogic"), 8 years later.
> 
> The fact that this was found at all is an indication that there are
> users, and it seems that Maciej, Matt and Khalid all have access to
> this hardware, but if it took eight years to find the problem,
> it's likely that nobody actually relies on it.
> 
> Remove it as part of the global virt_to_bus()/bus_to_virt() removal.
> If anyone is still interested in keeping this driver, the alternative
> is to stop it from using bus_to_virt(), possibly along the lines of
> how dpt_i2o gets around the same issue.
> 
> Cc: Maciej W. Rozycki<macro@orcam.me.uk>
> Cc: Matt Wang<wwentao@vmware.com>
> Cc: Khalid Aziz<khalid@gonehiking.org>
> Signed-off-by: Arnd Bergmann<arnd@arndb.de>
> ---
>   Documentation/scsi/BusLogic.rst   |  581 ---
>   Documentation/scsi/FlashPoint.rst |  176 -
>   MAINTAINERS                       |    7 -
>   drivers/scsi/BusLogic.c           | 3727 --------------
>   drivers/scsi/BusLogic.h           | 1284 -----
>   drivers/scsi/FlashPoint.c         | 7560 -----------------------------
>   drivers/scsi/Kconfig              |   24 -
>   7 files changed, 13359 deletions(-)
>   delete mode 100644 Documentation/scsi/BusLogic.rst
>   delete mode 100644 Documentation/scsi/FlashPoint.rst
>   delete mode 100644 drivers/scsi/BusLogic.c
>   delete mode 100644 drivers/scsi/BusLogic.h
>   delete mode 100644 drivers/scsi/FlashPoint.c

I would say no to removing BusLogic driver. Virtualbox is another 
consumer of this driver. This driver is very old but I would rather fix 
the issues than remove it until we do not have any users.

Thanks,
Khalid

From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 0/3] phase out CONFIG_VIRT_TO_BUS
Date: Fri, 24 Jun 2022 19:08:19 +0200
Message-ID: <CAK8P3a04C+ZavWb2nnYs-02CKZq10OA8rDE7QHMFF5qZzb6t9g@mail.gmail.com>
References: <20220624155226.2889613-1-arnd@kernel.org>
Mime-Version: 1.0
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20220624155226.2889613-1-arnd@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-scsi <linux-scsi@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Khalid Aziz <khalid@gonehiking.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Matt Wang <wwentao@vmware.com>, Miquel van Smoorenburg <mikevs@xs4all.net>, Mark Salyzyn <salyzyn@android.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arch <linux-arch@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Parisc List <linux-parisc@vger.kernel.org>, Denis Efremov <efremov@linux.com>

On Fri, Jun 24, 2022 at 5:52 PM Arnd Bergmann <arnd@kernel.org> wrote:

> Arnd Bergmann (3):
>   scsi: BusLogic remove bus_to_virt
>   scsi: dpt_i2o: remove obsolete driver

The dpt_i2o removal is overly large and got dropped by some of the
mailing lists,
if anyone wants to see the full patch, it did make it through to the linux-scsi
list at least:

https://lore.kernel.org/all/20220624155226.2889613-3-arnd@kernel.org/

         Arnd

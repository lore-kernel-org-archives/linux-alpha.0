From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH v3 0/3] phase out CONFIG_VIRT_TO_BUS
Date: Thu,  7 Jul 2022 17:47:20 -0400
Message-ID: <165723020283.18731.6642678816129479253.b4-ty@oracle.com>
References: <20220624155226.2889613-1-arnd@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=mYUReDqAAtD2Mc/Slejp/JsQFVi9e1ncghZX3Vavmh0=;
 b=xnJ9jBf8Ufq6J0JVjaiWi0JryS/PVZ3dV0d11TbTkdML8UPIRmyHYhNMlt6sUKGAbpGU
 k64Gx9anLLCmwum/I538ASOgU7UbRmo0/u29MVFnQku7yXhDpqdJGknQJgZIIC+7PFfP
 6qYda/BRPr3r6+vj493eF+dScvU9YM4s8t2JLgWLYQl/zXR8xZlQ8D3ZS3wKx1kMJb2F
 Wuvi0Du4suhANFR9tbfeGAiD3ULI9Pz2yiGidy2GDPuTmHeR5W5sEf3iPLZfq0hS05mS
 g2ODR6pqBet/WF8GYQOzJ13vdtCxaIsKTlR+/B8gSHDywC5rA0KruYY4lScx0RauYNvz yQ== 
In-Reply-To: <20220624155226.2889613-1-arnd@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-scsi@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-parisc@vger.kernel.org, Miquel van Smoorenburg <mikevs@xs4all.net>, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@infradead.org>, Matt Wang <wwentao@vmware.com>, Khalid Aziz <khalid@gonehiking.org>, linux-alpha@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>, linux-arch@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, "Maciej W . Rozycki" <macro@orcam.me.uk>, Jakub Kicinski <kuba@kernel.org>, iommu@lists.linux-foundation.org, Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>, linux-m68k@lists.linux-m68k.org

On Fri, 24 Jun 2022 17:52:23 +0200, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> The virt_to_bus/bus_to_virt interface has been deprecated for
> decades. After Jakub Kicinski put a lot of work into cleaning out the
> network drivers using them, there are only a couple of other drivers
> left, which can all be removed or otherwise cleaned up, to remove the
> old interface for good.
> 
> [...]

Applied to 5.20/scsi-queue, thanks!

[1/3] scsi: BusLogic remove bus_to_virt
      https://git.kernel.org/mkp/scsi/c/9f7c2232e131
[2/3] scsi: dpt_i2o: remove obsolete driver
      https://git.kernel.org/mkp/scsi/c/b04e75a4a8a8

-- 
Martin K. Petersen	Oracle Linux Engineering

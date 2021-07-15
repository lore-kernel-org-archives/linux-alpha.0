From: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v1 00/16] .map_sg() error cleanup
Date: Thu, 15 Jul 2021 10:56:09 -0600
Message-ID: <aa33d2bf-8324-5647-b800-3a2e3e774e80@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
 <20210715165309.GO22278@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:content-disposition;
	bh=zhc7pzLmZmjUsLXsFnMXewKeUUfUybMjLBdEKzxTgWI=; b=a4eD7Hw2j62J4jmrqG3qM9ka82
	5k5K5mLQB+hZHZqXGBpC8vAokNP0Ip4On3I09UBGqNxaWIRq2dmyriwR06pgFKl9jIT5xqRBf9vsD
	YwuOCb9uZhKtsGIHsKDWUmojgkYI2/2LwIaMUocRxIEBx7IUQ/6yxeiqqZGnSG4a85UbkDOZqICEa
	lG9jcrA6QbuiJkY03RA7uB1x8xSEwzPTD/kmMZHa3L73KtXI/2a8MW52t16HXK3n1ZJYijnMXJyfP
	O/wyAVK1kdSyrErsaIIRyaT5BgNIbq1xTAmZfgnfhUHzVRbyGsOS/vCEnIuD/1MU7ahfhlv+CI82Y
	BmE/J6uw==;
In-Reply-To: <20210715165309.GO22278@shell.armlinux.org.uk>
Content-Language: en-CA
Content-Type: text/plain; charset="us-ascii"
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>




On 2021-07-15 10:53 a.m., Russell King (Oracle) wrote:
> On Thu, Jul 15, 2021 at 10:45:28AM -0600, Logan Gunthorpe wrote:
>> Hi,
>>
>> This series is spun out and expanded from my work to add P2PDMA support
>> to DMA map operations[1].
>>
>> The P2PDMA work requires distinguishing different error conditions in
>> a map_sg operation. dma_map_sgtable() already allows for returning an
>> error code (where as dma_map_sg() is only allowed to return zero)
>> however, it currently only returns -EINVAL when a .map_sg() call returns
>> zero.
>>
>> This series cleans up all .map_sg() implementations to return appropriate
>> error codes. After the cleanup, dma_map_sg() will still return zero,
>> however dma_map_sgtable() will pass the error code from the .map_sg()
>> call. Thanks go to Martn Oliveira for doing a lot of the cleanup of the
>> obscure implementations.
>>
>> The patch set is based off of v5.14-rc1 and a git repo can be found
>> here:
> 
> Have all the callers for dma_map_sg() been updated to check for error
> codes? If not, isn't that a pre-requisit to this patch set?

No. Perhaps I wasn't clear enough: This series is changing only
impelemntations of .map_sg(). It does *not* change the return code of
dma_map_sg(). dma_map_sg() will continue to return zero on error for the
foreseeable future. The dma_map_sgtable() call already allows returning
error codes and it will pass the new error code through. This is what
will be used in the P2PDMA work.

Logan


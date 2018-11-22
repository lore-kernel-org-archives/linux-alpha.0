From: Christoph Hellwig <hch@lst.de>
Subject: remove the ->mapping_error method from dma_map_ops V2
Date: Thu, 22 Nov 2018 15:02:56 +0100
Message-ID: <20181122140320.24080-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zrXRxTLe1OGxdD8G3eLL0OLGGHFqAbtX0s1RomlaY18=; b=ZVMula66Vg6T3c
	szVjIf7JmSTO12dGrMlGxDbB3mB01Hn+zMNBPObgDyPlmfO05DJHNPITwXP+39eajn1Otx+lHmQXu
	9G7rwFwctb/x//AWrFuLIxHGWw+Ov4EA9N3hNyimgdZaSIoRgs8YW4fFdj194QwTGd09IFFMFr7Y9
	WFjiHKKw4AqmaSz8qTOS3srbtCYmzKOyhSLT3S57KpinQ+Jkwee4Th2l0JTOr6xpDHwwJXaCGgxVS
	G+QACxEbjrpUMX8ymJp6J4tL+iIuACk7dLwHFIsQt7+1B4YLj42DmhanA3sKSJhxNYMetUPJ56/w6
	lixHLmZxwo8OWu3Q86pA==;
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: iommu@lists.linux-foundation.org
Cc: linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, Jon Mason <jdmason@kudzu.us>, xen-devel@lists.xenproject.org, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

Error reporting for the dma_map_single and dma_map_page operations is
currently a mess.  Both APIs directly return the dma_addr_t to be used for
the DMA, with a magic error escape that is specific to the instance and
checked by another method provided.  This has a few downsides:

 - the error check is easily forgotten and a __must_check marker doesn't
   help as the value always is consumed anyway
 - the error checking requires another indirect call, which have gotten
   incredibly expensive
 - a lot of code is wasted on implementing these methods

The historical reason for this is that people thought DMA mappings would
not fail when the API was created, which sounds like a really bad
assumption in retrospective, and then we tried to cram error handling
onto it later on.

There basically are two variants:  the error code is 0 because the
implementation will never return 0 as a valid DMA address, or the error
code is all-F as the implementation won't ever return an address that
high.  The old AMD GART is the only one not falling into these two camps
as it picks sort of a relative zero relative to where it is mapped.

The 0 return doesn't work for direct mappings that have ram at address
zero and a lot of IOMMUs that start allocating bus space from address
zero, so we can't consolidate on that, but I think we can move everyone
to all-Fs, which the patch here does.  The reason for that is that
there is only one way to ever get this address: by doing a 1-byte long,
1-byte aligned mapping, but all our mappings are not only longer but
generally aligned, and the mappings have to keep at least the basic
alignment.

Note that the first two patches are queued up for 4.20 and included
for reference.

A git tree is also available here:

    git://git.infradead.org/users/hch/misc.git dma-mapping-error.2

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-mapping-error.2

Changes since v1:
 - dropped the signature change
 - split into multiple patches
 - fixed the iova allocator return check in amd-iommu
 - remove EMERGENCY_PAGES in amd_gart and calgary

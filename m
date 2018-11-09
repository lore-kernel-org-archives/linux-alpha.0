From: Christoph Hellwig <hch@lst.de>
Subject: [RFC] remove the ->mapping_error method from dma_map_ops
Date: Fri,  9 Nov 2018 09:46:30 +0100
Message-ID: <20181109084632.22848-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=De2A+1IHJlYtybiY9A9qCj5zOmyIhenMIF4tqQhXVsI=; b=U3ABsBhfauT6Zg3v3DAHwrO1V
        +sOmLkjJ3w1NEbIyAb8kRoWeAQKeHRXdVqtttASanv8RE9azt2xNPy2RC94Cu7bwZpylGP++aaiwU
        UdQBHTlfVuIMPrbvo0GBWD9vAd5nLWrbvWAcAYnEu4wvhBrsPAm9TpGDpxAdu+SBN4DuS+BwMEIi5
        635+nVrr7FjO1s/cCru2V7v13Nncv5B76FOi20Kyi9FjUYt5DDMT04KFnoLj+24RKpmA13IoqbXlg
        1m771/qNeP22p0T/f5DXccUKiAttAcaNC9edarXpwC+ndY1Y4fx0pKnbBuCE/4Xypt1q8aC3V+B6u
    
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: iommu@lists.linux-foundation.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org

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

The 0 return doesn't work for a lot of IOMMUs that start allocating
bus space from address zero, so we can't consolidate on that, but I think
we can move everyone to all-Fs, which the patch here does.  The reason
for that is that there is only one way to ever get this address: by
doing a 1-byte long, 1-byte aligned mapping, but all our mappings
are not only longer but generally aligned, and the mappings have to
keep at least the basic alignment.  Please try to poke holes into this
idea as it would simplify our logic a lot, and also allow to change
at least the not so commonly used yet dma_map_single_attrs and
dma_map_page_attrs to actually return an error code and further improve
the error handling flow in the drivers.

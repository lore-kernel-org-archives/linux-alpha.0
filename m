From: Christoph Hellwig <hch@lst.de>
Subject: ensure dma_alloc_coherent always returns zeroed memory
Date: Fri, 14 Dec 2018 09:25:13 +0100
Message-ID: <20181214082515.14835-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A55u8OYmmop5yBvt1LHRmKZ8Xv4+SvuFOA3GaFWUWls=; b=CptdXZHIInEkKP
	WnTvxkPSSLpdxdyimZifb7oejLwP9yq72TeHCpEdcQ2ancchvZcYhrbV+WpHmKMk9Se7mrRgr9x9q
	74tMC8k7Av9eS6c+mXRKDlzRD/I7t47u86BRrjDmrNbfV8AwM1gwiv3WkByEl1/N9npuTwa521ZnN
	SchsH9SBpV8qx4I0Jo4egDdZvTZRGZuUmR9eVWtQ/k0kaO0jPrzqw/O0iwigBZotuMVCLpD7QaOzS
	JX4+E1vFQCEWnibZlhLcCOQeI6zMz417RktF1QyvIXzLWr30ZX0l1NMgNqbQGdQhrvSAATu/ngWxH
	zvMFTVvsoRvza2kFD80Q==;
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: iommu@lists.linux-foundation.org
Cc: linux-s390@vger.kernel.org, Michal Simek <monstr@monstr.eu>, linux-c6x-dev@linux-c6x.org, linux-parisc@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-kernel@vger.kernel.org, Ashutosh Dixit <ashutosh.dixit@intel.com>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org

For security reasons we already returned zeroed memory from
dma_alloc_coherent on most common platforms, but some implementation
missed out.  Make sure we provide a consistent behavior.

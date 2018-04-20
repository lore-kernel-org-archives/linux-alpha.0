From: Christoph Hellwig <hch@lst.de>
Subject: (unknown)
Date: Fri, 20 Apr 2018 10:02:51 +0200
Message-ID: <20180420080313.18796-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=++DCeC6urNmYjKbvTu8kW/8Jzz4XD2sy3clydZ4wJOw=; b=YKY
	LFze+W0J1FxEmOq3BLclqp3ZaWKYZZRA6XJnQbv67WvilkM9nbp4vxl5P3zDjjINmNGF7GeZe420r
	zp1J4ob0353MPe3dE5wOCdeEVC7iR4+FI1oHl9BkdTZFyBehEoXnkH5hsjKnk92dw24j/r4fiDclV
	UzI83f18LkYohf6EPy2hiKy7Dfc8FAT6byzHiNZVYLG0OIBOU2Z/XNmgJB7cZ8zbUFR0YrUCYXeXm
	aFcNVMGv/CjCE/UnyeH/INY1Z/yHlDBO2VvBDq0nfTNr4GpLtwkqSv8d3CbAC+GxUK59RFcXknhGt
	RZAZ6YJsIcjQ/dVN2AghQ5+WAI20r+A==;
Subject: 
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org, Michal Simek <monstr@monstr.eu>, Vincent Chen <deanbo422@gmail.com>, linux-c6x-dev@linux-c6x.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, nios2-dev@lists.rocketboards.org, linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org

To: iommu@lists.linux-foundation.org
Cc: linux-arch@vger.kernel.org
Cc: Michal Simek <monstr@monstr.eu>
Cc: Greentime Hu <green.hu@gmail.com>
Cc: Vincent Chen <deanbo422@gmail.com>
Cc: linux-alpha@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-c6x-dev@linux-c6x.org
Cc: linux-hexagon@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: nios2-dev@lists.rocketboards.org
Cc: openrisc@lists.librecores.org
Cc: linux-parisc@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-xtensa@linux-xtensa.org
Cc: linux-kernel@vger.kernel.org
Subject: [RFC] common non-cache coherent direct dma mapping ops

Hi all,

this series continues consolidating the dma-mapping code, with a focus
on architectures that do not (always) provide cache coherence for DMA.
Three architectures (arm, mips and powerpc) are still left to be
converted later due to complexity of their dma ops selection.

The dma-noncoherent ops calls the dma-direct ops for the actual
translation of streaming mappins and allow the architecture to provide
any cache flushing required for cpu to device and/or device to cpu
ownership transfers.  The dma coherent allocator is for now still left
entirely to architecture supplied implementations due the amount of
variations.  Hopefully we can do some consolidation for them later on
as well.

A lot of architectures are currently doing very questionable things
in their dma mapping routines, which are documented in the changelogs
for each patch.  Please review them very careful and correct me on
incorrect assumptions.

Because this series sits on top of two previously submitted series
a git tree might be useful to actually test it.  It is provided here:

    git://git.infradead.org/users/hch/misc.git generic-dma-noncoherent

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/generic-dma-noncoherent

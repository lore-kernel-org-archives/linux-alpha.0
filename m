Received: from minute.unseen.parts (minute.unseen.parts [139.162.151.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF08F2BFC85;
	Wed, 26 Aug 2026 15:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.151.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787758017; cv=none; b=VevLfhdPHCac6PHgp6lxfsfsJco0squHQaQB3XmDG1SPFQo8Dmp3fW94EjaPod+a+FVKnyDq027Y4O7el2eL/1MI/R+AlOzeQURpNxx/tTcI6cEpD9Ybnxe+gUeM8GtVOJbbNJ4B5K/77WoU6WIIVHyLCbJjn6fGoO+hMtAkHvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787758017; c=relaxed/simple;
	bh=EUPJfV0x4b69xyH8tF0t30JyhZ3iM/0mnu5hfpQgqSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PO0BuMREjPNZYkCuqAcK6lDYEIh435wH/zdk+wCm1P+GVPb7JKyYWghVhi3i20opPVJyfZrMDxf8Pva+2tdgb12VKcjHUcvQSAUjVk3KWCWxYOX9ow2ZdC1GmiNesHTxwkjlQa35gS0fmpulsJL5QToHozt5ghwRF2FUS7XXEbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts; spf=pass smtp.mailfrom=unseen.parts; dkim=pass (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b=DZ+25+eT; arc=none smtp.client-ip=139.162.151.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unseen.parts
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b="DZ+25+eT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=unseen.parts; s=sig; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bKnNlCT81TUt97BahQ0O2AXNsh0I4ajcfSUsbdV8CUA=; b=DZ+25+eTyY6q+A7Iinh67v6B9W
	XGo65AqSNVX8nfsSs4OFyxxF0NtQKDEFeMaS4QQAnr2KJ2z+alGCgshLd7Pe1wsHr7CnhoEZVaG8l
	ax8SzcjNGuXP4CSnrGmd0zxkVEromUJfXp0jSgXeEtwQGwBVGuo9C2c3J2suNG6UAT8ghdHTyvqOC
	0z2bQ8x8CDEgjdj8x7D8b3xtVeuQ8IFdMdyDA3m76kqvF2mlTRbJjxOYgq5yuGEOCar8h4HeXpF31
	hwqfJiW2r1SulGqeEw/+y1nN0HyjXBxqnk8J3IRP4ekFomA/MNRoZoBztkJEw22NK+kYs2E4zQpUZ
	53FzHMKg==;
Received: from minute.unseen.parts ([139.162.151.61]:54920 helo=minute)
	by minute.unseen.parts with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <ink@unseen.parts>)
	id 1wzEvE-000212-2t;
	Wed, 26 Aug 2026 16:48:41 +0200
Date: Wed, 26 Aug 2026 16:48:39 +0200
From: Ivan Kokshaysky <ink@unseen.parts>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, mattst88@gmail.com,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	Maciej Rozycki <macro@orcam.me.uk>
Subject: Re: [PATCH v2 2/2] alpha: disable DAC for 32-bit PCI cards on
 Tsunami/Typhoon
Message-ID: <ao78x7nKbm7fcdzk@minute>
References: <20260824181126.3559638-1-linmag7@gmail.com>
 <20260824181126.3559638-3-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824181126.3559638-3-linmag7@gmail.com>

Hi Magnus!

On Mon, Aug 24, 2026 at 07:36:54PM +0200, Magnus Lindholm wrote:
> The Tsunami/Typhoon Pchip's DAC ("monster window") path corrupts data
> when used by 32-bit PCI cards using DAC addresses above 4 GiB, even on
> cards whose DAC support is otherwise solid: the same cards work
> correctly with DAC on Rawhide (MCPCIA) systems, and native 64-bit PCI
> cards are unaffected on Tsunami/Typhoon itself. Corruption shows up as
> 64-byte chunks (one 21264 cache block) of unrelated data - typically
> identifiable content belonging to other processes' concurrent DMA -
> substituted into the transfer; the rate varies from none to several
> kilobytes per run and has not been tied to any particular alignment.
> 
> Work around this by capping affected devices to 32-bit DMA, which
> routes them through the existing scatter-gather window instead of DAC.
> Conventional PCI provides no status bit to distinguish a 32-bit from a
> 64-bit option card, so use the presence of a 64-bit memory BAR as a
> practical proxy. This covers every affected card seen so far, but is
> a proxy rather than a direct test: it will also needlessly restrict a
> handful of 64-bit cards that only expose 32-bit BARs (e.g. QLogic
> ISP1080, ISP10160). These controllers are not known to be supported by
> SRM firmware and are therefore uncommon on Alpha systems, so the
> trade-off is accepted.

I don't think it is. You only need SRM-compatible device to boot
the kernel, and then you are free to use any sort of PCI mass storage
controllers supported by Linux. Personally I'm using CF card in IDE mode
as a boot device and PCI SATA controller for everything else for some
20 years. My controller is a cheap 32-bit one because UP1500 PCI is
32-bit only, but there are much more advanced 3ware 64-bit PCI-X SATA
cards still available at very affordable prices. We don't want to limit
them to 32-bit DMA addresing.

> The only driver currently known to hit this is qla1280 with an
> ISP1040 card and a 64-bit DMA mask, which is a common and
> SRM-supported configuration on Alpha.

So it's just one unfortunate core-logic/controller combination
and should be handled as such. Obvious place to check for this is
alpha_pci_suppurted() (which ought to be named alpha_pci_dma_supported,
BTW). If we simply reject 64-bit mask, the qla1280 driver falls back
to DMA_BIT_MASK(32) - see qla1280_probe_one() function in
drivers/scsi/qla1280.c.

The patch below is compile-tested only.

Ivan.

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 955b6ca61627..d60c4c2aa8bb 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -6,6 +6,7 @@
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/pci.h>
+#include <linux/pci_ids.h>
 #include <linux/gfp.h>
 #include <linux/memblock.h>
 #include <linux/export.h>
@@ -786,6 +787,16 @@ static int alpha_pci_supported(struct device *dev, u64 mask)
 	struct pci_controller *hose;
 	struct pci_iommu_arena *arena;
 
+	/* The tsunami monster window doesn't cope well with QLogic ISP1040
+	   chipset's bus master DAC. Reject the 64-bit DMA mask request
+	   for such a card, so that the qla1280 driver falls back to
+	   32-bit DMA mask. */
+	if (pdev && mask == DMA_BIT_MASK(64) &&
+	    hwrpb->sys_type == ST_DEC_TSUNAMI &&
+	    pdev->vendor == PCI_VENDOR_ID_QLOGIC &&
+	    pdev->device == PCI_DEVICE_ID_QLOGIC_ISP1020)
+		return 0;
+
 	/* If there exists a direct map, and the mask fits either
 	   the entire direct mapped space or the total system memory as
 	   shifted by the map base */

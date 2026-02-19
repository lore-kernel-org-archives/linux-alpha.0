Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2385132572C
	for <linux-alpha@vger.kernel.org>; Thu, 19 Feb 2026 20:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771534559; cv=none; b=P/97BrtjCZ4Mp4qj1uH/WpZd4JUH/YP5zBwIAZzzAHZWtiI33w0MeoikjP0bfuyA43IafY9KHVYt8RqKGw33vc38j1WhGJjhAv5cBcBlGJ1UdlH4c7AjXxxuQKambKwC6yLdvEi3QeBOkMPICPg+5JvcdnOaPmir9NWxeU11J6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771534559; c=relaxed/simple;
	bh=BmM1rmPoXawhxPfoovQiyZAor2BEmD6x+G18DKsUqIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=faZHv1dKXSZeZtdoT9PbJalBl33d9Vn6NIRQ1Hu78xCOl5+20oSTfRpl41i1S1ZBTxNNFyzsYFh7OwYu+yjiVjx2zfzLsLTyo7S1DxqB36RILxKFBRk7hl7hUKM0FEUmlFML6WauKwXa5EojLPVdwAb/9EBxh/Qs86Eu3i2kGXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7Pa2Oks; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7Pa2Oks"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59dea72099eso1396192e87.0
        for <linux-alpha@vger.kernel.org>; Thu, 19 Feb 2026 12:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771534554; x=1772139354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgzXRvDQQZ7oZ2PSsmR9Q6xUfKyeNrmd2q6O6qdJQOY=;
        b=Q7Pa2Oksp7Mq3eAHZZFoYp9NhToOpEuqtnM8YMnrBhQSrfCF9i343TTDshBWi2OUGK
         q09LC0Q9AaDgIMN6TJ9LQ7RPUcoLbV6FVjir0dwu2uyXfWoRxi4rzQ3iFdGncRVVcaWV
         ym7h6XBJgQFH7YFwyKuaemQO5JriWfGLhBGJYSipg2yeR+/xvueU3NO8vcanUnKisCX6
         Mjiy8XQrfffWHjoTjSQOI5CbEK509J/iTJsz+BNfC+4ptXJ8Yvv8eQbbdfsd66fqg3Ru
         xhbds3tU/FAGGktViZweAEqdVo3jZXw4J2HcgkfGsmC33akYcou9nBjiFFwd9u1dyOxD
         7AhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771534554; x=1772139354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kgzXRvDQQZ7oZ2PSsmR9Q6xUfKyeNrmd2q6O6qdJQOY=;
        b=gXtnsLwAMvrr+SbEGgGMEdTlBGyWP5bCejFKeA1YdRe5PyLWFsNeB6KSgqhBfQEtpr
         5c+H8isZ430BeDw0lj+j8wdzl0tHvXXhsVrxGXzNG1h/ngsNTaguHR6muGC5v1iyVhpL
         woWTNfsa9qHS3cXHWxlm9qMZflPoSWRqebc33vD7Yed3irk7lB5fCoXc/9dEwk0Us+YA
         dLtO/RSwvsveb9u2QlLw3FgQ/5/qwoMQlohYuVItjGnj9jgTldBPpSUaaq/qCiDXe380
         syVZVMA1rjTTryLHW6efXaA7dZMEp899wCISVNn8MfWEwSNxvQ1F+gKStV0zTG2Ejk5k
         HmjA==
X-Forwarded-Encrypted: i=1; AJvYcCU5p4JFx6tzRSXHQHsxpRCEdNFfL4f12JyHhYqOKn7jkDePYgwDKqvKZfJQk08lBXhddD7VVcftveGYEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGedxofyKhUkP+A+798Ru+zIOt32LdCq1xK4qQDnWoZCDl185Q
	2jNTCrmFe3J1xpdtTbSfT3zezJvRrMfWWDPCgsCVyZh6N5XiYDmbfdLy
X-Gm-Gg: AZuq6aICyvBFh9gXvRYmDLzqeVlN9ccAv44V9gThSxqMk+EVJ38nshvQr16rbeN9uFa
	GdWWLW6RBKa8E1c6LZGzRzgA7jvXgjf1lkiYaz7oiJqRTzl9/7AjITZC601P9SLjOZyWwdetr3L
	69QrV7FkX9wQuUdvdTvENe3fo3KT+RMuL/+lrGFw/YOhUKLAhkYPxLwrW/NCuFE6aVoWmUCOZWf
	VnTn+JIL6i4sHXmyu9h9pRTDNiJ0RvPCH8LvNIp1iUKgdMMQOCob7YFhqyXxIv7P8pP8uon4zUT
	27ZPBgKV1jFji0PuWS/VafIzyvuaucrFTb8wjFXuTtglmqi5McMqFkq2DSO3AhXdoDX0Vs2AQqf
	DxALpfTUuF8NCKHfMey335uArWqN784nHVAnTrNnkiFNlh9Thzlh16SmEklaHo/OBRD1JLyC1pz
	cFyLJdgF7J8psCQkkFiXU2d75N81hp4LLrKhWS8vht1YgYqgGHYYLL2JHjUrXkFaw0W+SIdZuSw
	T35zKINnMDUNSXrjPuHl+izg7jl78cSMak=
X-Received: by 2002:a05:6512:b86:b0:59e:5b5a:c9b3 with SMTP id 2adb3069b0e04-59f6d353df0mr6133972e87.12.1771534554044;
        Thu, 19 Feb 2026 12:55:54 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f89a356sm5443917e87.92.2026.02.19.12.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 12:55:53 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	macro@orcam.me.uk,
	macro@redhat.com,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 1/1] alpha: enable DMA CMA support (HAVE_DMA_CONTIGUOUS)
Date: Thu, 19 Feb 2026 21:53:49 +0100
Message-ID: <20260219205514.4434-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260219205514.4434-1-linmag7@gmail.com>
References: <20260219205514.4434-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alpha currently does not support CONFIG_DMA_CMA, even though the
generic CMA infrastructure is available. As a result, coherent DMA
allocations rely solely on the buddy allocator and may fail for large
contiguous buffers.

Add architecture support for HAVE_DMA_CONTIGUOUS by:

  - Selecting HAVE_DMA_CONTIGUOUS in arch/alpha/Kconfig.
  - Ensuring early command-line parameters are parsed in setup_arch()
    after Alpha-specific command line handling, so that the "cma="
    early parameter is honored.
  - Calling dma_contiguous_reserve() during early memory setup while
    memblock is active.
  - Extending alpha_pci_alloc_coherent() to fall back to
    dma_alloc_from_contiguous() when __get_free_pages() fails.
  - Extending alpha_pci_free_coherent() to release CMA-backed
    allocations via dma_release_from_contiguous().

With these changes, Alpha systems can successfully reserve and use
CMA-backed physically contiguous memory for DMA allocations.

Tested on a DS10 with cma=64M:
  - CMA reservation is correctly sized from the command line.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 .../io/dma-contiguous/arch-support.txt        |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/kernel/pci_iommu.c                 | 46 +++++++++++++++++++
 arch/alpha/kernel/setup.c                     | 16 +++++++
 4 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/Documentation/features/io/dma-contiguous/arch-support.txt b/Documentation/features/io/dma-contiguous/arch-support.txt
index 3c6ce35d704f..6cd205a991f6 100644
--- a/Documentation/features/io/dma-contiguous/arch-support.txt
+++ b/Documentation/features/io/dma-contiguous/arch-support.txt
@@ -6,7 +6,7 @@
     -----------------------
     |         arch |status|
     -----------------------
-    |       alpha: | TODO |
+    |       alpha: |  ok  |
     |         arc: | TODO |
     |         arm: |  ok  |
     |       arm64: |  ok  |
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 6c7dbf0adad6..e3ff6f7d93ab 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -2,6 +2,7 @@
 config ALPHA
 	bool
 	default y
+	select HAVE_DMA_CONTIGUOUS
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DMA_OPS if PCI
diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 955b6ca61627..08c18d49ca8e 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -15,6 +15,7 @@
 #include <linux/iommu-helper.h>
 #include <linux/string_choices.h>
 
+#include <linux/dma-map-ops.h>
 #include <asm/io.h>
 #include <asm/hwrpb.h>
 
@@ -409,12 +410,34 @@ static void *alpha_pci_alloc_coherent(struct device *dev, size_t size,
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	void *cpu_addr;
 	long order = get_order(size);
+	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
+	struct page *cma_page = NULL;
 
+	/* Match existing behavior: prefer normal memory first. */
 	gfp &= ~GFP_DMA;
 
 try_again:
 	cpu_addr = (void *)__get_free_pages(gfp | __GFP_ZERO, order);
 	if (! cpu_addr) {
+		/*
+		 * Fallback to CMA if enabled: this can migrate/compact
+		 * movable pages out of the CMA area to form a contiguous bloc
+		 */
+		if (IS_ENABLED(CONFIG_DMA_CMA)) {
+			cma_page = dma_alloc_from_contiguous(dev, count, order, gfp);
+			if (cma_page) {
+				cpu_addr = page_address(cma_page);
+				if (!cpu_addr) {
+					/* Very unlikely on Alpha, but be safe. */
+					dma_release_from_contiguous(dev, cma_page, count);
+					cma_page = NULL;
+				} else {
+					memset(cpu_addr, 0, size);
+					goto have_mem;
+				}
+			}
+		}
+
 		printk(KERN_INFO "pci_alloc_consistent: "
 		       "get_free_pages failed from %ps\n",
 			__builtin_return_address(0));
@@ -422,11 +445,24 @@ static void *alpha_pci_alloc_coherent(struct device *dev, size_t size,
 		   with vmalloc and sg if we can't find contiguous memory.  */
 		return NULL;
 	}
+	/* __GFP_ZERO already did this, but keep the old behavior explicit. */
 	memset(cpu_addr, 0, size);
 
+have_mem:
 	*dma_addrp = pci_map_single_1(pdev, virt_to_phys(cpu_addr), size, 0);
 	if (*dma_addrp == DMA_MAPPING_ERROR) {
+		/*
+		 * Free the memory using the right backend:
+		 * - If it came from CMA, release to CMA
+		 * - Otherwise free_pages()
+		 */
+		if (IS_ENABLED(CONFIG_DMA_CMA)) {
+			if (dma_release_from_contiguous(dev, virt_to_page(cpu_addr), count))
+				goto map_failed_freed;
+		}
 		free_pages((unsigned long)cpu_addr, order);
+
+map_failed_freed:
 		if (alpha_mv.mv_pci_tbi || (gfp & GFP_DMA))
 			return NULL;
 		/* The address doesn't fit required mask and we
@@ -452,9 +488,19 @@ static void alpha_pci_free_coherent(struct device *dev, size_t size,
 				    unsigned long attrs)
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
+	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
+
 	dma_unmap_single(&pdev->dev, dma_addr, size, DMA_BIDIRECTIONAL);
+
+	if (IS_ENABLED(CONFIG_DMA_CMA)) {
+		/* Returns true if cpu_addr belongs to a CMA allocation. */
+		if (dma_release_from_contiguous(dev, virt_to_page(cpu_addr), count))
+			goto out;
+	}
+
 	free_pages((unsigned long)cpu_addr, get_order(size));
 
+out:
 	DBGA2("pci_free_consistent: [%llx,%zx] from %ps\n",
 	      dma_addr, size, __builtin_return_address(0));
 }
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index f0af444a69a4..24893bca39f5 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -46,6 +46,7 @@
 #include <asm/io.h>
 #include <linux/log2.h>
 #include <linux/export.h>
+#include <linux/dma-map-ops.h>
 
 static int alpha_panic_event(struct notifier_block *, unsigned long, void *);
 static struct notifier_block alpha_panic_block = {
@@ -513,6 +514,13 @@ setup_arch(char **cmdline_p)
 	/* Replace the command line, now that we've killed it with strsep.  */
 	strcpy(command_line, boot_command_line);
 
+	/*
+	 * Alpha mutates command_line with strsep() above, so make sure
+	 * early params (including "cma=") are parsed from the restored
+	 * command line before any CMA reservation happens.
+	 */
+	parse_early_param();
+
 	/* If we want SRM console printk echoing early, do it now. */
 	if (alpha_using_srm && srmcons_output) {
 		register_srm_console();
@@ -648,6 +656,14 @@ setup_arch(char **cmdline_p)
 		printk("Max ASN from HWRPB is bad (0x%lx)\n", hwrpb->max_asn);
  	}
 
+#ifdef CONFIG_CMA
+	/*
+	 * Reserve CMA now that memblock knows RAM layout and early params
+	 * (including cma=) have been parsed.
+	 */
+	dma_contiguous_reserve(0);
+#endif
+
 	/*
 	 * Identify the flock of penguins.
 	 */
-- 
2.52.0


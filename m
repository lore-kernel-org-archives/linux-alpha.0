Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A57262FEC
	for <linux-alpha@vger.kernel.org>; Sun, 28 Dec 2025 06:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766903715; cv=none; b=P41CgeBQXwdcCJEWx2zS8DbAr/COXzoj6t4XpWQdzgLPsth5t0wskClI6Y0f185DeOZjCd+a+qNbCkyyqID9KWp5rFGKAgbIi8W7WjFvp6QXQf7LN52zWZG/ibA3pKDtVUaNFLpvd07ojC8MBpe+Jz2JE/lNxW6aKZm+vfNgqk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766903715; c=relaxed/simple;
	bh=rS2h+ZCMdpPwTIzNg0Jb7vTkc8+4gj++h6kcd7OKP+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jL8a9g+LvorvRrW6xQ5iDBmzucJfpISBnVgxNKEgXpZlX6rmjl+iysye2nyXZfwFF5nIpd8cQAF/7ieRlO9SHY6VDhXxzwNvAwFAoEbNRkej+XhxzWkKWtWkcIhKpGL+O/pZqKYpYAI/ptAC4yQVUhMmNnd86AeM/UAYNdGDIak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMgrTEFM; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMgrTEFM"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37a2dcc52aeso88730761fa.0
        for <linux-alpha@vger.kernel.org>; Sat, 27 Dec 2025 22:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766903711; x=1767508511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRYg9SV9y5XYK7dTy3OiE1QQQSIADoBHA5Qhld4xKiQ=;
        b=fMgrTEFM6MyMcIUbjUXBogOWMHsMfaM5Q23IDJUtPiqUBnUDlD8IOcChCyJY3iMRN/
         p/BzpAT1/dJQ+So7M9bKVuzTvhs17w6vsfFd/nytChsc4pTaWdhQPRLuXW8E+I2ecxMt
         Z6OCPfwxsEoPlMbenZlQbdx5oBhOrJD1BB3H0Jcl93WB/jAvvz4dA8sYhgZTxc8BZ7mj
         XH5PfMgK+VSVR5/70xwKNT8kSW++Q8nUgXx+QWLL/VZMTwDsAiLDjbRPVAiWZH44HmQe
         aqay0bqqMSe7DNyw5KlDpLf6TiwAm2rRsVKxbqBmE/9RouZPEJmaxEjwWr5ka86MhElv
         TwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766903711; x=1767508511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nRYg9SV9y5XYK7dTy3OiE1QQQSIADoBHA5Qhld4xKiQ=;
        b=FjUxekVpjiwf5FORSy1i/rGUAdMCOwdb2oJPJgFwPUi2Sq7iY7TsM9PxmHqZu2kCcZ
         fRsLemFwuUMry5Hqoabm+ZG7apLDmGe2nl09o0mqp39+T/0mDCiGRdadeGioETBeG6Ox
         zfQpRZsLYVBhJk9BVLjdGsoA2zMIimvfgDqW8iefI+S+s6gpB3owEHQSgEgRYlbkbEtG
         yG+ktYWn98oIQjoXmJQF9YuXGNqaWJFW4n9FtNhmhPHGTswDhRabknoWjf8e+/Y6dSfd
         IDpvmAcsNlZCusR9Zj3AVbKc0vLbdrsmWn59OH/xOAzQNPkwDBQocxcqyuAQXIn2cl95
         schw==
X-Forwarded-Encrypted: i=1; AJvYcCX4GArgYbA8TfvvLuWjcZ9Ki+QC/FsIahG27f+T+MgZpLX929pIJufzPnv8XtWxyHCTxpJAE7emy2puEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjbr4L5riFY4XIfwZFNDxYHgnd6nTMV2V15lRhrkg6v5dyWE3w
	pfNtdCxZOKEDaCdNtSD3mC8CQIQCAoG4XOU1Swy/aoamwoZqnTNQd4VU
X-Gm-Gg: AY/fxX61+xOfXpUJBeKHsMfl1UCcY3hL22lZQkDC5COxnk9kRY1uUOqAOBUAVxajLEQ
	TW19z6e1dJnGpe9v5w2PwSgF/bblO3Yj55goFBaP7J9YoVOW9/gurewK5qJczhYCzSfaoAfnWr3
	DQKIrGDyWbi30Cor5606QnAuH4I55nR5Qja4Dhl/M91FqjQrMCcdI67OovBUEHupb4JMdpeBgWl
	Z0vBnntNHy8tTaELItADohOj70aIddqXY4RSJPMuePkGKqx5C9TZBLvPxi9kBk2qTVfimIsKa9h
	zrI7J0jeB9DSIcShH8jJXR7aVSPrqMhtcNCtE3vef/YsWLm6IonC4Fh6xcmf/dbwUGa8mWVT+5B
	sZABhrDzxLbglxINVeQkYBzKvulSem2nULBrkSR4M9zsWuVm1gNMS/nRtTcRh1c1M8yLI0whHw8
	zo/mKNkY4k
X-Google-Smtp-Source: AGHT+IFX1z1K0LJWfAF6kH+lJnxetC8ouTO9QlOH+1r7iPoOX0QCTQu6tJ9aQNKR7aHOZMn4g3QLkw==
X-Received: by 2002:a05:651c:549:b0:37b:8f05:13bb with SMTP id 38308e7fff4ca-38121635cbbmr96623351fa.27.1766903710930;
        Sat, 27 Dec 2025 22:35:10 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-381224de67csm71612921fa.9.2025.12.27.22.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 22:35:09 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	linux-alpha@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH 1/1] alpha: trivial: remove ^L chars
Date: Sun, 28 Dec 2025 06:34:40 +0000
Message-ID: <20251228063440.2623595-2-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251228063440.2623595-1-safinaskar@gmail.com>
References: <20251228063440.2623595-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove ^L (a. k. a. \f a. k. a. form feed a. k. a. \x0c) from arch/alpha.
I'm attempting to write my own tool for parsing kernel code.
And these characters complicate this without giving any benefits.

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 arch/alpha/kernel/core_cia.c      |  6 ++---
 arch/alpha/kernel/core_irongate.c |  2 +-
 arch/alpha/kernel/core_marvel.c   | 18 +++++++--------
 arch/alpha/kernel/core_mcpcia.c   |  4 ++--
 arch/alpha/kernel/core_polaris.c  |  2 +-
 arch/alpha/kernel/core_t2.c       |  2 +-
 arch/alpha/kernel/core_titan.c    | 10 ++++----
 arch/alpha/kernel/core_tsunami.c  |  4 ++--
 arch/alpha/kernel/err_common.c    |  4 ++--
 arch/alpha/kernel/err_titan.c     |  2 +-
 arch/alpha/kernel/pci_iommu.c     |  4 ++--
 arch/alpha/kernel/smc37c669.c     | 38 +++++++++++++++----------------
 arch/alpha/kernel/sys_marvel.c    |  4 ++--
 arch/alpha/kernel/sys_titan.c     |  8 +++----
 arch/alpha/kernel/time.c          | 10 ++++----
 15 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/arch/alpha/kernel/core_cia.c b/arch/alpha/kernel/core_cia.c
index 6e577228e175..af571073266c 100644
--- a/arch/alpha/kernel/core_cia.c
+++ b/arch/alpha/kernel/core_cia.c
@@ -246,7 +246,7 @@ struct pci_ops cia_pci_ops =
 	.read = 	cia_read_config,
 	.write =	cia_write_config,
 };
-
+
 /*
  * CIA Pass 1 and PYXIS Pass 1 and 2 have a broken scatter-gather tlb.
  * It cannot be invalidated.  Rather than hard code the pass numbers,
@@ -555,7 +555,7 @@ verify_tb_operation(void)
 	alpha_mv.mv_pci_tbi = NULL;
 	goto exit;
 }
-
+
 #if defined(ALPHA_RESTORE_SRM_SETUP)
 /* Save CIA configuration data as the console had it set up.  */
 struct 
@@ -626,7 +626,7 @@ cia_restore_srm_settings(void)
 #define cia_restore_srm_settings()	do {} while (0)
 #endif /* ALPHA_RESTORE_SRM_SETUP */
 
-
+
 static void __init
 do_init_arch(int is_pyxis)
 {
diff --git a/arch/alpha/kernel/core_irongate.c b/arch/alpha/kernel/core_irongate.c
index 05dc4c1b9074..a47b4c48a7d3 100644
--- a/arch/alpha/kernel/core_irongate.c
+++ b/arch/alpha/kernel/core_irongate.c
@@ -160,7 +160,7 @@ struct pci_ops irongate_pci_ops =
 	.read =		irongate_read_config,
 	.write =	irongate_write_config,
 };
-
+
 int
 irongate_pci_clr_err(void)
 {
diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index d38f4d6759e4..5ac99c6b0d17 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -30,7 +30,7 @@
 #include "proto.h"
 #include "pci_impl.h"
 
-
+
 /*
  * Debug helpers
  */
@@ -42,13 +42,13 @@
 # define DBG_CFG(args)
 #endif
 
-
+
 /*
  * Private data
  */
 static struct io7 *io7_head = NULL;
 
-
+
 /*
  * Helper functions
  */
@@ -194,7 +194,7 @@ io7_clear_errors(struct io7 *io7)
 	p7csrs->PO7_CRRCT_SYM.csr = -1UL;
 }
 
-
+
 /*
  * IO7 PCI, PCI/X, AGP configuration.
  */
@@ -468,7 +468,7 @@ marvel_kill_arch(int mode)
 {
 }
 
-
+
 /*
  * PCI Configuration Space access functions
  *
@@ -596,7 +596,7 @@ struct pci_ops marvel_pci_ops =
 	.write = 	marvel_write_config,
 };
 
-
+
 /*
  * Other PCI helper functions.
  */
@@ -611,8 +611,8 @@ marvel_pci_tbi(struct pci_controller *hose, dma_addr_t start, dma_addr_t end)
 	csrs->POx_SG_TBIA.csr;
 }
 
-
-
+
+
 /*
  * RTC Support
  */
@@ -673,7 +673,7 @@ __marvel_rtc_io(u8 b, unsigned long addr, int write)
 	return ret;
 }
 
-
+
 /*
  * IO map support.
  */
diff --git a/arch/alpha/kernel/core_mcpcia.c b/arch/alpha/kernel/core_mcpcia.c
index 74b1d018124c..e7f5ecb31991 100644
--- a/arch/alpha/kernel/core_mcpcia.c
+++ b/arch/alpha/kernel/core_mcpcia.c
@@ -241,7 +241,7 @@ struct pci_ops mcpcia_pci_ops =
 	.read =		mcpcia_read_config,
 	.write =	mcpcia_write_config,
 };
-
+
 void
 mcpcia_pci_tbi(struct pci_controller *hose, dma_addr_t start, dma_addr_t end)
 {
@@ -249,7 +249,7 @@ mcpcia_pci_tbi(struct pci_controller *hose, dma_addr_t start, dma_addr_t end)
 	*(vuip)MCPCIA_SG_TBIA(MCPCIA_HOSE2MID(hose->index)) = 0;
 	mb();
 }
-
+
 static int __init
 mcpcia_probe_hose(int h)
 {
diff --git a/arch/alpha/kernel/core_polaris.c b/arch/alpha/kernel/core_polaris.c
index 75d622d96ff2..797b1bda0ec8 100644
--- a/arch/alpha/kernel/core_polaris.c
+++ b/arch/alpha/kernel/core_polaris.c
@@ -142,7 +142,7 @@ struct pci_ops polaris_pci_ops =
 	.read =		polaris_read_config,
 	.write =	polaris_write_config,
 };
-
+
 void __init
 polaris_init_arch(void)
 {
diff --git a/arch/alpha/kernel/core_t2.c b/arch/alpha/kernel/core_t2.c
index 3d72d90624f1..82887e882667 100644
--- a/arch/alpha/kernel/core_t2.c
+++ b/arch/alpha/kernel/core_t2.c
@@ -321,7 +321,7 @@ struct pci_ops t2_pci_ops =
 	.read =		t2_read_config,
 	.write =	t2_write_config,
 };
-
+
 static void __init
 t2_direct_map_window1(unsigned long base, unsigned long length)
 {
diff --git a/arch/alpha/kernel/core_titan.c b/arch/alpha/kernel/core_titan.c
index 77f5d68ed04b..3a217dc3bb3c 100644
--- a/arch/alpha/kernel/core_titan.c
+++ b/arch/alpha/kernel/core_titan.c
@@ -52,7 +52,7 @@ static int titan_pchip1_present;
 # define DBG_CFG(args)
 #endif
 
-
+
 /*
  * Routines to access TIG registers.
  */
@@ -76,7 +76,7 @@ titan_write_tig(int offset, u8 value)
 	*tig_addr = (unsigned long)value;
 }
 
-
+
 /*
  * Given a bus, device, and function number, compute resulting
  * configuration space address
@@ -197,7 +197,7 @@ struct pci_ops titan_pci_ops =
 	.write =	titan_write_config,
 };
 
-
+
 void
 titan_pci_tbi(struct pci_controller *hose, dma_addr_t start, dma_addr_t end)
 {
@@ -438,7 +438,7 @@ titan_kill_arch(int mode)
 	titan_kill_pachips(TITAN_pachip0, TITAN_pachip1);
 }
 
-
+
 /*
  * IO map support.
  */
@@ -571,7 +571,7 @@ EXPORT_SYMBOL(titan_ioremap);
 EXPORT_SYMBOL(titan_iounmap);
 EXPORT_SYMBOL(titan_is_mmio);
 #endif
-
+
 /*
  * AGP GART Support.
  */
diff --git a/arch/alpha/kernel/core_tsunami.c b/arch/alpha/kernel/core_tsunami.c
index fc1ab73f23de..e3452b38e12a 100644
--- a/arch/alpha/kernel/core_tsunami.c
+++ b/arch/alpha/kernel/core_tsunami.c
@@ -173,7 +173,7 @@ struct pci_ops tsunami_pci_ops =
 	.read =		tsunami_read_config,
 	.write = 	tsunami_write_config,
 };
-
+
 void
 tsunami_pci_tbi(struct pci_controller *hose, dma_addr_t start, dma_addr_t end)
 {
@@ -195,7 +195,7 @@ tsunami_pci_tbi(struct pci_controller *hose, dma_addr_t start, dma_addr_t end)
 	mb();
 	*csr;
 }
-
+
 #ifdef NXM_MACHINE_CHECKS_ON_TSUNAMI
 static long __init
 tsunami_probe_read(volatile unsigned long *vaddr)
diff --git a/arch/alpha/kernel/err_common.c b/arch/alpha/kernel/err_common.c
index 94e1b3dcf6d4..877b5231953d 100644
--- a/arch/alpha/kernel/err_common.c
+++ b/arch/alpha/kernel/err_common.c
@@ -24,7 +24,7 @@
  */
 char *err_print_prefix = KERN_NOTICE;
 
-
+
 /*
  * Generic
  */
@@ -77,7 +77,7 @@ mchk_dump_logout_frame(struct el_common *mchk_header)
 	printk("%s  -- End of Frame --\n", err_print_prefix);
 }
 
-
+
 /*
  * Console Data Log
  */
diff --git a/arch/alpha/kernel/err_titan.c b/arch/alpha/kernel/err_titan.c
index 0ffb2feea42a..d5c4c690209e 100644
--- a/arch/alpha/kernel/err_titan.c
+++ b/arch/alpha/kernel/err_titan.c
@@ -581,7 +581,7 @@ titan_register_error_handlers(void)
 	ev6_register_error_handlers();
 }
 
-
+
 /*
  * Privateer
  */
diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 955b6ca61627..9d49908ee2dc 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -55,7 +55,7 @@ size_for_memory(unsigned long max)
 		max = roundup_pow_of_two(mem);
 	return max;
 }
-
+
 struct pci_iommu_arena * __init
 iommu_arena_new_node(int nid, struct pci_controller *hose, dma_addr_t base,
 		     unsigned long window_size, unsigned long align)
@@ -810,7 +810,7 @@ static int alpha_pci_supported(struct device *dev, u64 mask)
 	return 0;
 }
 
-
+
 /*
  * AGP GART extensions to the IOMMU
  */
diff --git a/arch/alpha/kernel/smc37c669.c b/arch/alpha/kernel/smc37c669.c
index a5a6ed97a6ce..8f7a4520771f 100644
--- a/arch/alpha/kernel/smc37c669.c
+++ b/arch/alpha/kernel/smc37c669.c
@@ -1093,7 +1093,7 @@ static int SMC37c669_xlate_drq(
 );
 
 static  __cacheline_aligned DEFINE_SPINLOCK(smc_lock);
-
+
 /*
 **++
 **  FUNCTIONAL DESCRIPTION:
@@ -1189,7 +1189,7 @@ SMC37c669_CONFIG_REGS * __init SMC37c669_detect( int index )
     return SMC37c669;
 }
 
-
+
 /*
 **++
 **  FUNCTIONAL DESCRIPTION:
@@ -1421,7 +1421,7 @@ unsigned int __init SMC37c669_enable_device ( unsigned int func )
     return ret_val;
 }
 
-
+
 /*
 **++
 **  FUNCTIONAL DESCRIPTION:
@@ -1625,7 +1625,7 @@ unsigned int __init SMC37c669_disable_device ( unsigned int func )
     return ret_val;
 }
 
-
+
 /*
 **++
 **  FUNCTIONAL DESCRIPTION:
@@ -1702,7 +1702,7 @@ unsigned int __init SMC37c669_configure_device (
     return FALSE;
 }
 
-
+
 /*
 **++
 **  FUNCTIONAL DESCRIPTION:
@@ -1789,7 +1789,7 @@ static unsigned int __init SMC37c669_is_device_enabled ( unsigned int func )
     return ret_val;
 }
 
-
+
 #if 0
 /*
 **++
@@ -1861,7 +1861,7 @@ static unsigned int __init SMC37c669_get_device_config (
 }
 #endif
 
-
+
 /*
 **++
 **  FUNCTIONAL DESCRIPTION:
@@ -1938,7 +1938,7 @@ void __init SMC37c669_display_device_info ( void )
     }
 }
 
-
+
 /*
 **++
 **  FUNCTIONAL DESCRIPTION:
@@ -1981,7 +1981,7 @@ static void __init SMC37c669_config_mode(
     	wb( &SMC37c669->index_port, SMC37c669_CONFIG_OFF_KEY );
     }
 }
-
+
 /*
 **++
 **  FUNCTIONAL DESCRIPTION:
@@ -2011,7 +2011,7 @@ static unsigned char __init SMC37c669_read_config(
 	wb(&SMC37c669->index_port, index);
 	return rb(&SMC37c669->data_port);
 }
-
+
 /*
 **++
 **  FUNCTIONAL DESCRIPTION:
@@ -2046,7 +2046,7 @@ static void __init SMC37c669_write_config(
     wb( &SMC37c669->data_port, data );
 }
 
-
+
 /*
 **++
 **  FUNCTIONAL DESCRIPTION:
@@ -2175,7 +2175,7 @@ static void __init SMC37c669_init_local_config ( void )
     local_config[IDE_0].irq = 14;
 }
 
-
+
 /*
 **++
 **  FUNCTIONAL DESCRIPTION:
@@ -2222,7 +2222,7 @@ static struct DEVICE_CONFIG * __init SMC37c669_get_config( unsigned int func )
     }
     return cp;
 }
-
+
 /*
 **++
 **  FUNCTIONAL DESCRIPTION:
@@ -2274,7 +2274,7 @@ static int __init SMC37c669_xlate_irq ( int irq )
     return translated_irq;
 }
 
-
+
 /*
 **++
 **  FUNCTIONAL DESCRIPTION:
@@ -2325,7 +2325,7 @@ static int __init SMC37c669_xlate_drq ( int drq )
     }
     return translated_drq;
 }
-
+
 #if 0
 int __init smcc669_init ( void )
 {
@@ -2340,7 +2340,7 @@ int __init smcc669_init ( void )
 
     return msg_success;
 }
-
+
 int __init smcc669_open( struct FILE *fp, char *info, char *next, char *mode )
 {
     struct INODE *ip;
@@ -2365,7 +2365,7 @@ int __init smcc669_open( struct FILE *fp, char *info, char *next, char *mode )
 
     return msg_success;
 }
-
+
 int __init smcc669_close( struct FILE *fp )
 {
     struct INODE *ip;
@@ -2378,7 +2378,7 @@ int __init smcc669_close( struct FILE *fp )
     }
     return msg_success;
 }
-
+
 int __init smcc669_read( struct FILE *fp, int size, int number, unsigned char *buf )
 {
     int i;
@@ -2404,7 +2404,7 @@ int __init smcc669_read( struct FILE *fp, int size, int number, unsigned char *b
     SMC37c669_config_mode( FALSE );
     return nbytes;
 }
-
+
 int __init smcc669_write( struct FILE *fp, int size, int number, unsigned char *buf )
 {
     int i;
diff --git a/arch/alpha/kernel/sys_marvel.c b/arch/alpha/kernel/sys_marvel.c
index 1f99b03effc2..4c38ad39fd37 100644
--- a/arch/alpha/kernel/sys_marvel.c
+++ b/arch/alpha/kernel/sys_marvel.c
@@ -33,7 +33,7 @@
 # error NR_IRQS < MARVEL_NR_IRQS !!!
 #endif
 
-
+
 /*
  * Interrupt handling.
  */
@@ -432,7 +432,7 @@ marvel_smp_callin(void)
 	for (i = 0; i < 16; ++i)
 		io7_redirect_one_msi(io7, i, cpuid);
 }
-
+
 /*
  * System Vectors
  */
diff --git a/arch/alpha/kernel/sys_titan.c b/arch/alpha/kernel/sys_titan.c
index b1f3b4fcf99b..1af0d909f436 100644
--- a/arch/alpha/kernel/sys_titan.c
+++ b/arch/alpha/kernel/sys_titan.c
@@ -36,7 +36,7 @@
 #include "machvec_impl.h"
 #include "err_impl.h"
 
-
+
 /*
  * Titan generic
  */
@@ -255,7 +255,7 @@ titan_dispatch_irqs(u64 mask)
 	}
 }
   
-
+
 /*
  * Titan Family
  */
@@ -337,7 +337,7 @@ titan_init_pci(void)
 	locate_and_init_vga(NULL);
 }
 
-
+
 /*
  * Privateer
  */
@@ -359,7 +359,7 @@ privateer_init_pci(void)
 	return titan_init_pci();
 }
 
-
+
 /*
  * The System Vectors.
  */
diff --git a/arch/alpha/kernel/time.c b/arch/alpha/kernel/time.c
index 4d01c392ab14..1ed69632b01e 100644
--- a/arch/alpha/kernel/time.c
+++ b/arch/alpha/kernel/time.c
@@ -80,7 +80,7 @@ static inline __u32 rpcc(void)
 }
 
 
-
+
 /*
  * The RTC as a clock_event_device primitive.
  */
@@ -129,7 +129,7 @@ init_rtc_clockevent(void)
 	clockevents_config_and_register(ce, CONFIG_HZ, 0, 0);
 }
 
-
+
 /*
  * The QEMU clock as a clocksource primitive.
  */
@@ -199,7 +199,7 @@ init_qemu_clockevent(void)
 	clockevents_config_and_register(ce, NSEC_PER_SEC, 1000, LONG_MAX);
 }
 
-
+
 void __init
 common_init_rtc(void)
 {
@@ -245,7 +245,7 @@ common_init_rtc(void)
 	init_rtc_irq(NULL);
 }
 
-
+
 #ifndef CONFIG_ALPHA_WTINT
 /*
  * The RPCC as a clocksource primitive.
@@ -275,7 +275,7 @@ static struct clocksource clocksource_rpcc = {
 };
 #endif /* ALPHA_WTINT */
 
-
+
 /* Validate a computed cycle counter result against the known bounds for
    the given processor core.  There's too much brokenness in the way of
    timing hardware for any one method to work everywhere.  :-(
-- 
2.47.3


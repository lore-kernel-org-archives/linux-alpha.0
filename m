From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH 0/2] dma-mapping: update default segment_boundary_mask
Date: Tue,  1 Sep 2020 15:16:44 -0700
Message-ID: <20200901221646.26491-1-nicoleotsuka@gmail.com>
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=M8j6Ldkq7Y6L6HNtPJpdtArkg82hNoz7EQt2ZZQpQiE=;
        b=p925V7snElOQZXlWMLip8xP1dwydX4MO40+mVFj0KyAvGYuTSaLzAdLMfBDDV081Yc
         fEnLq463d09UGAfhsrrBF62cGT/GqQtYjv0nq5ng6OZ5m4jKNTDM86uafLdc6j721eOg
         6f1p/HTw+taNTu4O7whEf+6bZmHYqxDOIiy5obUbw/5UsCVHJ9vf6MEnKgvy+pQvF+5J
         IeXr6w2XCQR8Hs6QTtvSXHW9D7hGl2Fnpi3RZZppFwo5+UafHLipz4crtYIUn/PHLBWc
         C/yluXJaWRsBj31/j7ffRgYozI9+twYp8EsiVCVuCJtaxWo11IwJJw/rhIA2CmV/TP98
         71mw==
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hch@lst.de
Cc: sfr@canb.auug.org.au, mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, tony.luck@intel.com, fenghua.yu@intel.com, linux-ia64@vger.kernel.org, schnelle@linux.ibm.com, gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com, linux-s390@vger.kernel.org, davem@davemloft.net, sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com, James.Bottomley@HansenPartnership.com, deller@gmx.de, linux-parisc@vger.kernel.org

These two patches are to update default segment_boundary_mask.

PATCH-1 fixes overflow issues in callers of dma_get_seg_boundary.
Previous version was a series: https://lkml.org/lkml/2020/8/31/1026

Then PATCH-2 sets default segment_boundary_mask to ULONG_MAX.

Nicolin Chen (2):
  dma-mapping: introduce dma_get_seg_boundary_nr_pages()
  dma-mapping: set default segment_boundary_mask to ULONG_MAX

 arch/alpha/kernel/pci_iommu.c    |  7 +------
 arch/ia64/hp/common/sba_iommu.c  |  3 +--
 arch/powerpc/kernel/iommu.c      |  9 ++-------
 arch/s390/pci/pci_dma.c          |  6 ++----
 arch/sparc/kernel/iommu-common.c | 10 +++-------
 arch/sparc/kernel/iommu.c        |  3 +--
 arch/sparc/kernel/pci_sun4v.c    |  3 +--
 arch/x86/kernel/amd_gart_64.c    |  3 +--
 drivers/parisc/ccio-dma.c        |  3 +--
 drivers/parisc/sba_iommu.c       |  3 +--
 include/linux/dma-mapping.h      | 21 ++++++++++++++++++++-
 11 files changed, 34 insertions(+), 37 deletions(-)

-- 
2.17.1


From: David Hildenbrand <david@redhat.com>
Subject: [PATCH mm-unstable v1 00/20] mm/gup: remove FOLL_FORCE usage from drivers (reliable R/O long-term pinning)
Date: Wed, 16 Nov 2022 11:26:39 +0100
Message-ID: <20221116102659.70287-1-david@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lVcq4YgIhkuOPvbVo2VhrzBz+1rKMrX5mFnekLihUoU=; b=eh7JGA5kWv9q+j
	NbwfyeqzfES6oEqylUXB57zaUTrPjJeXajb9h5UGYakJ2szoPLRLy52lqfVF0i3dWDgeRjPPwCPn2
	j0+6Z70HsMBKJKk9AR9RqE9athO6e/v3e3g4hLOt1y6KnP7tAzvyNUqoOkj9bjdCYO3T+zJFNPXFg
	qKafQ2AyiZNJla/tW7TfpVJCvYUDvi53TBnUzDeZqPfj+NZTYtYZgI9fIu8cq0W6Qp2SROPM9I8gj
	6o0k+h8yyK3l0EC2nkO/MjiosScohubo0tWA9sXEENdq+NoDhnpQYeLc+uKpfC5VmG/Q/dJD59IoQ
	eL49Kmn6uyw9EL8JVqKg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668594448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/1/81f1bc3wgoHEbP5M1Zz0wSDu9jba91U8WGSjmQ70=;
	b=WvA7dMHIHgvf3V9r9QbfYGKetZV6oQ36O3P6NSjEDBg0cr91EFzUv0HZat7WOvXw4WLEi5
	L56/YXHJyoXgQR0Xn5PSg3xEu8oLezhdzwvR4BxB6KilhFVN5r5XIaT/VPLqEgR74915Lr
	+ildcLPGdp2Yusfw2xviqsyMd/Vzce8=
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-um/>
List-Post: <mailto:linux-um@lists.infradead.org>
List-Help: <mailto:linux-um-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=subscribe>
Sender: "linux-um" <linux-um-bounces@lists.infradead.org>
Errors-To: linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrea Arcangeli <aarcange@redhat.com>, Hugh Dickins <hughd@google.com>, Nadav Amit <>

For now, we did not support reliable R/O long-term pinning in COW mappings.
That means, if we would trigger R/O long-term pinning in MAP_PRIVATE
mapping, we could end up pinning the (R/O-mapped) shared zeropage or a
pagecache page.

The next write access would trigger a write fault and replace the pinned
page by an exclusive anonymous page in the process page table; whatever the
process would write to that private page copy would not be visible by the
owner of the previous page pin: for example, RDMA could read stale data.
The end result is essentially an unexpected and hard-to-debug memory
corruption.

Some drivers tried working around that limitation by using
"FOLL_FORCE|FOLL_WRITE|FOLL_LONGTERM" for R/O long-term pinning for now.
FOLL_WRITE would trigger a write fault, if required, and break COW before
pinning the page. FOLL_FORCE is required because the VMA might lack write
permissions, and drivers wanted to make that working as well, just like
one would expect (no write access, but still triggering a write access to
break COW).

However, that is not a practical solution, because
(1) Drivers that don't stick to that undocumented and debatable pattern
    would still run into that issue. For example, VFIO only uses
    FOLL_LONGTERM for R/O long-term pinning.
(2) Using FOLL_WRITE just to work around a COW mapping + page pinning
    limitation is unintuitive. FOLL_WRITE would, for example, mark the
    page softdirty or trigger uffd-wp, even though, there actually isn't
    going to be any write access.
(3) The purpose of FOLL_FORCE is debug access, not access without lack of
    VMA permissions by arbitrarty drivers.

So instead, make R/O long-term pinning work as expected, by breaking COW
in a COW mapping early, such that we can remove any FOLL_FORCE usage from
drivers and make FOLL_FORCE ptrace-specific (renaming it to FOLL_PTRACE).
More details in patch #8.

Patches #1--#3 add COW tests for non-anonymous pages.
Patches #4--#7 prepare core MM for extended FAULT_FLAG_UNSHARE support in
COW mappings.
Patch #8 implements reliable R/O long-term pinning in COW mappings
Patches #9--#19 remove any FOLL_FORCE usage from drivers.
Patch #20 renames FOLL_FORCE to FOLL_PTRACE.

I'm refraining from CCing all driver/arch maintainers on the whole patch
set, but only CC them on the cover letter and the applicable patch
(I know, I know, someone is always unhappy ... sorry).

RFC -> v1:
* Use term "ptrace" instead of "debuggers" in patch descriptions
* Added ACK/Tested-by
* "mm/frame-vector: remove FOLL_FORCE usage"
 -> Adjust description
* "mm: rename FOLL_FORCE to FOLL_PTRACE"
 -> Added

David Hildenbrand (20):
  selftests/vm: anon_cow: prepare for non-anonymous COW tests
  selftests/vm: cow: basic COW tests for non-anonymous pages
  selftests/vm: cow: R/O long-term pinning reliability tests for
    non-anon pages
  mm: add early FAULT_FLAG_UNSHARE consistency checks
  mm: add early FAULT_FLAG_WRITE consistency checks
  mm: rework handling in do_wp_page() based on private vs. shared
    mappings
  mm: don't call vm_ops->huge_fault() in wp_huge_pmd()/wp_huge_pud() for
    private mappings
  mm: extend FAULT_FLAG_UNSHARE support to anything in a COW mapping
  mm/gup: reliable R/O long-term pinning in COW mappings
  RDMA/umem: remove FOLL_FORCE usage
  RDMA/usnic: remove FOLL_FORCE usage
  RDMA/siw: remove FOLL_FORCE usage
  media: videobuf-dma-sg: remove FOLL_FORCE usage
  drm/etnaviv: remove FOLL_FORCE usage
  media: pci/ivtv: remove FOLL_FORCE usage
  mm/frame-vector: remove FOLL_FORCE usage
  drm/exynos: remove FOLL_FORCE usage
  RDMA/hw/qib/qib_user_pages: remove FOLL_FORCE usage
  habanalabs: remove FOLL_FORCE usage
  mm: rename FOLL_FORCE to FOLL_PTRACE

 arch/alpha/kernel/ptrace.c                    |   6 +-
 arch/arm64/kernel/mte.c                       |   2 +-
 arch/ia64/kernel/ptrace.c                     |  10 +-
 arch/mips/kernel/ptrace32.c                   |   4 +-
 arch/mips/math-emu/dsemul.c                   |   2 +-
 arch/powerpc/kernel/ptrace/ptrace32.c         |   4 +-
 arch/sparc/kernel/ptrace_32.c                 |   4 +-
 arch/sparc/kernel/ptrace_64.c                 |   8 +-
 arch/x86/kernel/step.c                        |   2 +-
 arch/x86/um/ptrace_32.c                       |   2 +-
 arch/x86/um/ptrace_64.c                       |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |   8 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |   2 +-
 drivers/infiniband/core/umem.c                |   8 +-
 drivers/infiniband/hw/qib/qib_user_pages.c    |   2 +-
 drivers/infiniband/hw/usnic/usnic_uiom.c      |   9 +-
 drivers/infiniband/sw/siw/siw_mem.c           |   9 +-
 drivers/media/common/videobuf2/frame_vector.c |   2 +-
 drivers/media/pci/ivtv/ivtv-udma.c            |   2 +-
 drivers/media/pci/ivtv/ivtv-yuv.c             |   5 +-
 drivers/media/v4l2-core/videobuf-dma-sg.c     |  14 +-
 drivers/misc/habanalabs/common/memory.c       |   3 +-
 fs/exec.c                                     |   2 +-
 fs/proc/base.c                                |   2 +-
 include/linux/mm.h                            |  35 +-
 include/linux/mm_types.h                      |   8 +-
 kernel/events/uprobes.c                       |   4 +-
 kernel/ptrace.c                               |  12 +-
 mm/gup.c                                      |  38 +-
 mm/huge_memory.c                              |  13 +-
 mm/hugetlb.c                                  |  14 +-
 mm/memory.c                                   |  97 +++--
 mm/util.c                                     |   4 +-
 security/tomoyo/domain.c                      |   2 +-
 tools/testing/selftests/vm/.gitignore         |   2 +-
 tools/testing/selftests/vm/Makefile           |  10 +-
 tools/testing/selftests/vm/check_config.sh    |   4 +-
 .../selftests/vm/{anon_cow.c => cow.c}        | 387 +++++++++++++++++-
 tools/testing/selftests/vm/run_vmtests.sh     |   8 +-
 39 files changed, 575 insertions(+), 177 deletions(-)
 rename tools/testing/selftests/vm/{anon_cow.c => cow.c} (75%)

-- 
2.38.1

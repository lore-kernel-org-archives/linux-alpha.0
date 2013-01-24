From: Michel Lespinasse <walken@google.com>
Subject: [PATCH 0/8] convert remaining archs to use vm_unmapped_area()
Date: Wed, 23 Jan 2013 17:29:43 -0800
Message-ID: <1358990991-21316-1-git-send-email-walken@google.com>
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer;
        bh=EvDaU7jYnVqvotkuBceHhz/soqVZwDpwl8NPEqRuA5o=;
        b=FjHi1QmJgTZS+SYsSVGZUn3RnzZLJY5q+gMJ/1pw4s1VmKRqZ2ORn7pcwXBzRMcumz
         fIDkJoLgtCPoakmjw4L1n14Nayq5OoYkFMs/9OJ+aopXjhdEhNs7guqZlTsjmkaE5z+1
         vg+B/ek7rynxrwn2LHri7Bhm2Zpz++0LTIqBajp4i6WtIV9/QW/i9prTCT/tIU+5Z4GO
         EHlcdVdVEVTlgCd93A8bE01y4w1KEuV/CR9tXkWWvvR3wmANYPmLlzsptdUdPZzRFTuD
         JLGcoM6kdSBQrG+m4idtLWAwxqEe74xzsd+BFB1hkOXQrrpBaV7sdn3SVd100kV3tVet
         2NNg==
Sender: owner-linux-mm@kvack.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "James E.J. Bottomley" <jejb@parisc-linux.org>, Helge Deller <deller@gmx.de>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, David Howells <dhowells@redhat.com>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org

This is a resend of my "finish the mission" patch series. I need arch
maintainers to approve so I can push this to andrew's -mm tree.

These patches, which apply on top of v3.8-rc kernels, are to complete the
VMA gap finding code I introduced (following Rik's initial proposal) in
v3.8-rc1.

First 5 patches introduce the use of vm_unmapped_area() to replace brute
force searches on parisc, alpha, frv and ia64 architectures (all relatively
trivial uses of the vm_unmapped_area() infrastructure)

Next 2 patches do the same as above for the powerpc architecture. This
change is not as trivial as for the other architectures, because we
need to account for each address space slice potentially having a
different page size.

The last patch removes the free_area_cache, which was used by all the
brute force searches before they got converted to the
vm_unmapped_area() infrastructure.

I did some basic testing on x86 and powerpc; however the first 5 (simpler)
patches for parisc, alpha, frv and ia64 architectures are untested.

Michel Lespinasse (8):
  mm: use vm_unmapped_area() on parisc architecture
  mm: use vm_unmapped_area() on alpha architecture
  mm: use vm_unmapped_area() on frv architecture
  mm: use vm_unmapped_area() on ia64 architecture
  mm: use vm_unmapped_area() in hugetlbfs on ia64 architecture
  mm: remove free_area_cache use in powerpc architecture
  mm: use vm_unmapped_area() on powerpc architecture
  mm: remove free_area_cache

 arch/alpha/kernel/osf_sys.c              |   20 ++--
 arch/arm/mm/mmap.c                       |    2 -
 arch/arm64/mm/mmap.c                     |    2 -
 arch/frv/mm/elf-fdpic.c                  |   49 +++----
 arch/ia64/kernel/sys_ia64.c              |   37 ++----
 arch/ia64/mm/hugetlbpage.c               |   20 ++--
 arch/mips/mm/mmap.c                      |    2 -
 arch/parisc/kernel/sys_parisc.c          |   46 +++----
 arch/powerpc/include/asm/page_64.h       |    3 +-
 arch/powerpc/mm/hugetlbpage.c            |    2 +-
 arch/powerpc/mm/mmap_64.c                |    2 -
 arch/powerpc/mm/slice.c                  |  228 +++++++++++++-----------------
 arch/powerpc/platforms/cell/spufs/file.c |    2 +-
 arch/s390/mm/mmap.c                      |    4 -
 arch/sparc/kernel/sys_sparc_64.c         |    2 -
 arch/tile/mm/mmap.c                      |    2 -
 arch/x86/ia32/ia32_aout.c                |    2 -
 arch/x86/mm/mmap.c                       |    2 -
 fs/binfmt_aout.c                         |    2 -
 fs/binfmt_elf.c                          |    2 -
 include/linux/mm_types.h                 |    3 -
 include/linux/sched.h                    |    2 -
 kernel/fork.c                            |    4 -
 mm/mmap.c                                |   28 ----
 mm/nommu.c                               |    4 -
 mm/util.c                                |    1 -
 26 files changed, 163 insertions(+), 310 deletions(-)

-- 
1.7.7.3

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

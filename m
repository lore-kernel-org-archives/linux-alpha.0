Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA01463B89
	for <linux-alpha@vger.kernel.org>; Tue,  6 Oct 2026 14:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791295459; cv=none; b=G5+wY4eZGFnh9wOsRiuoFHFygJf5XBB57nCMpSZaDdIhTjIXHTgkNHLER6QHVlLCSXpsKdeRJesKwD+Tu4ieAKCou3v/0vPAJhOEmh6+NWiMvnysH12ywU3JNfKYJzubnTEAssGY0xq0zQ0NcFovfemftqLC2AkoAkD3tnCKweg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791295459; c=relaxed/simple;
	bh=DIvkUKDb2d1cbfa/NEb8X6LQ9w6RPKlSL24EP2wWWho=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pZUrQaJ3VWfHE9dAu8UwJaEquPOriesWTzgwIHY2PAWWHLGBm4Z2N4cL42FrudBBSjoKtht4Ncga7UA2sLoO53ZDk/PN0P2N8VowPXQFxfrLhTJwxfI+DCz4yf3s2/TalYtdySJzdFT6/Wi3APBlahW72DrsJpQTvswdYtNpX6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XW/zt+/E; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XW/zt+/E"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6768ced47aeso764691d50.1
        for <linux-alpha@vger.kernel.org>; Tue, 06 Oct 2026 07:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791295457; x=1791900257; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OxgXcOsL3IumwSzFIGdUIN+/uo85TIGx+KO8eZLRwhQ=;
        b=XW/zt+/EXpLLSNFmGy7vH56TCdRMFMLah+/1K75+DvXmmVWccNwcQnkhST1gACI1XA
         GOi2QTu6jUuBxFBPqb/J25iD3FWdw1Igi27y8Sb6FoEuM/HKXw6Zok66eby1P90JAA5x
         QfhTd6FXfyo5sYIjW89D+T514UlRv9zJRb4r1OA630MtDa2uOymMWEthzw2rUTbUsvDx
         AlAfxWJqx/7bAnrUJAUsMnJpH+fQ1305Ry/zPO0qE97+M8eUH4WltrOMc+lY55kgZy2e
         nWQbS6IAXD5M5n9Uvl4oftipHxv9OZx1AHCNwqIQphBHxW6UkjDHRgM5QNEuCXds+lT7
         K43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295457; x=1791900257;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OxgXcOsL3IumwSzFIGdUIN+/uo85TIGx+KO8eZLRwhQ=;
        b=L0lISDRkTtfdYd1e1K/gYPSp28EhVoa/UNN3v9M+D5WkS+9/WGhdd5z5LJ8825IR3U
         /i5RkR/FXrwqUeLH4WQUFC+aH/9zQyGOf1MYRnbmmPnve4BT27Z5gPksdbWEXSNuefiv
         EVxmYCxxf44TLNkV2w18pOIN+dvrx9BaOrH5QI8tUMzFMkx61sw7/nsYzbozQPSIAyNP
         LeQTStJkovgM0KHA8d1hwN3boSm2HUgfSXWqTFCYHXDVEUZcJp6QF/6uV5hDyVn2z+Ta
         HDfMdpIOvJsl/Y+kYkbaQ2IO0CiFyZsBBMB550RkoE2cT6vYsCPLEuEk5Uv+Pdh24ARS
         Bj3g==
X-Gm-Message-State: AFq9FYKPAVrdHfEaVoTWUwtpy4V97ctPra7WmJvmp5ZqdleQBhn97VSJ
	GfqVRi1zjgdZ9U93IErLzBzkEHtc6gbdngFJICvAFHgcpAT1eD42H6VnBHiw9w==
X-Gm-Gg: AYBFou0aMJeUEAJ5iTbhlwnVmFPSegndAZYkkYbwOBYZwL9o5/P76E3Sf7raGLJH6xZ
	sjvw3Ut+KcdcnBsv07Id4LVpEdC26YtxusbV9KvKwyJWwdbR55aDoLaSS5PDXt/DwUowA+X/8la
	rg3LphBDJGc7/nV8khwtwIY8QShX6TM6J8aHrjtznGBWzJA8rOcdYpuoLHY/ctfnuVVR1a1CK/1
	Fnwm3LT7GIJ4RP4C2He10m6klrz7jk1jMYbL2Bq5XZr/6v9xeAMLvFcLnATxB4u4ChP/AA+9Dj0
	DZsuOfBaejPkCljqbSaGYX9O0oF5nLcAiC6dlLXSXgLhyxQQaCv8cYc5XDNQaefdKw8WYfSPOk4
	l0xSq2wWdNUCTSSBdqzxzqprIMEagk4WdZNn13uKqdP/KjfBPgXf2InPy9/u0lxPL+k6FIqTZP2
	RwAZl7FctPT+2k2RtYXSnbQ4U93FheJi/e+QSlxg96Skswog/nnnn74dkeIU3xiDAskeTDNn8j
X-Received: by 2002:a05:690e:d45:b0:675:5c06:8a4f with SMTP id 956f58d0204a3-678fcf7cb68mr792981d50.105.1791295456598;
        Tue, 06 Oct 2026 07:04:16 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b1a214sm4230428d50.6.2026.10.06.07.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:04:14 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 0/6] alpha: hugetlb support using granularity hints
Date: Tue, 06 Oct 2026 10:04:12 -0400
Message-Id: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBNUSLCrRAvTSQfCRCkC8e5Jy
 7f4v0HFQlhhYQ0KPlTpSgNyYuCiTQE5+WFQQmlhpOL2zNHyeAfMNmDlwmm3ayeMmT2MKhc86P2
 P69b7ByAeKUxhAAAA
X-Change-ID: 20260912-alpha-hugepages-0c6cb6c0995d
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7345; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=DIvkUKDb2d1cbfa/NEb8X6LQ9w6RPKlSL24EP2wWWho=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKO/L+731FgrkHWGx7hnr1KBlYZHZ+SrpoHr1oU5jJT5
 Nerx9dcOz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOYaD0ZGhl8yk0KUJx
 /5ZKbkfSVkrXlPrp6fZ3B76KIfe4tiS0ocHRgZpjsxH7/LEOnz94/+ZNfU3GmW8r/O8X09I/B17
 p1JX27KsQIA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha has no leaf entry above the last page table level, so the usual
PMD sized huge page is not available to it. What it does have is the
granularity hint, bits <6:5> of the PTE, described in Table 17-3 of the
Alpha Architecture Reference Manual: a hint of order N marks a PTE as
one of 8^N physically contiguous, naturally aligned pages that the
translation buffer is permitted to map with a single entry. With 8KB
pages that gives 64KB, 512KB and 4MB blocks, and this series registers
all three as hstates.

This works like arm64's contiguous PTE support rather than RISC-V's
NAPOT: every PTE of a block keeps the frame number of its own page, so a
block is written with set_ptes() and the frame number advances across
it. There is no PMD sized huge page, and hence no transparent huge
pages, no PMD page table sharing and no gigantic pages.

The architecture requires all PTEs of a block to agree in bits <15:0>,
and both __ACCESS_BITS and __DIRTY_BITS reach into that range, so every
update rewrites the whole block and huge_ptep_get() merges the young and
dirty state back together. Changes to a valid block go through break
before make, as section 11.6.1 requires; the invalidate there has to
assume the hint is zero and so must cover every page of the block, which
flush_tlb_range() on alpha already exceeds, since it rolls the address
space number.

The hint is advisory. An implementation that ignores it still translates
correctly through the individual PTEs, so this is safe on every Alpha,
and gup_fast needs no changes. The console block that would report which
hint sizes the translation buffer implements was never filled in by any
console through EV7, so which sizes an implementation honors can only be
established by measuring, as the last section does for EV7.

Patches 1 and 2 are independent fixes. Patch 1 adds a
page_table_check_pte_clear() call missing from alpha's
ptep_get_and_clear(). Patch 2 fixes a BUG() that testing this series
turned up: do_page_fault() fell through to BUG() on VM_FAULT_HWPOISON,
reachable through UFFDIO_POISON without any memory failure support.
Patch 3 documents that the bits Linux calls _PAGE_URE and _PAGE_UWE are
the architecture's ERE and EWE, which matters when reading PTE layout
tables alongside this code. Patches 4 and 5 are groundwork and patch 6
is the implementation.

Testing
=======

Tested on megalith (EV7 Marvel, 8GB), with two CPUs and again with one,
cross-built with alpha-unknown-linux-gnu-gcc, with CONFIG_DEBUG_VM=y,
CONFIG_DEBUG_VM_PGTABLE=y, CONFIG_PAGE_TABLE_CHECK_ENFORCED=y and
CONFIG_CGROUP_HUGETLB=y. All three hint sizes register as hstates.

mm selftests, the same in both configurations: hugetlb 10/10,
userfaultfd and cow 7 pass 1 skip (uffd-wp-mremap), 0 fail, including
uffd-stress hugetlb and hugetlb-private at 128MB/32 threads.
debug_vm_pgtable validates clean at boot. No page_table_check reports
and no DEBUG_VM splats in any run.

Ad hoc tests written for this series also pass at all three sizes: dense
per-base-page write and read back across a block, which catches a wrong
frame number inside a block that a strided pattern would alias over;
mprotect down to PROT_READ and back, including a middle-block-only case,
exercising break before make; fork COW; hugetlbfs shared mappings
checked through pread and through a second independent mapping; hole
punch of a middle block with both neighbors and the refaulted hole
checked; ftruncate down and back up; and the 4MB -> 512KB -> 64KB demote
chain with exact count checks. All of it again with four concurrent
copies, and the whole suite ten times in a row.

An earlier revision of the series was also tested on up1500 (EV68AL
Nautilus, UP, 4GB) with CONFIG_DEBUG_VM=y and
CONFIG_PAGE_TABLE_CHECK_ENFORCED=y. That machine has not been retested
with this revision.

Magnus Lindholm also tested the series on SMP, on a UP2000+ (2x EV68AL
833 MHz), including a multithreaded stress test. It found that
huge_ptep_set_access_flags() broke and rewrote a block on every fault,
so two threads on different CPUs could keep each other faulting: 17,316
faults in 6 seconds after one permission change on a 4MB page. With the
check now in patch 6 the same change causes one fault. No writes were
lost with or without it.

Hugepage migration is not enabled. It has no test coverage: the
migration, rmap and ksm selftests do not cross-build for want of libnuma
in the alpha sysroot, and neither machine is multi-node.

Does the hint do anything?
==========================

On EV7, yes. Since the hint is advisory there is no way to ask the
hardware whether it implements one, and the console block that would
report it was never filled in, so the only way to find out is to
measure.

Comparing the three hint sizes against each other rather than against
normal pages avoids the hugetlb-versus-anonymous confound. A random
pointer chase touches one cache line per 8KB base page, with the
permutation seeded only from the page count, so every backing walks an
identical sequence over an identical footprint and the only variable is
how many DTB entries the working set needs. EV6 and EV7 have a 128 entry
fully associative DTB, so coverage is 128 times the page size: 1MB with
base pages, 8MB at 64KB, 64MB at 512KB, 512MB at 4MB.

Nanoseconds per access on megalith with one CPU, 8,000,000 accesses per
pass. Each figure is the best of ten runs, every run on freshly
allocated memory: single runs differ by 40% or more from one allocation
to the next, at every page size including base pages, so the best run is
the one to compare.

     size      base(8KB)       64KB      512KB     4096KB
      1 MB          11.24      11.11      15.02      11.72
      4 MB         155.47     104.54     105.03     104.17
     16 MB         156.69     127.50     109.55     105.52
     64 MB         154.61     146.79     110.16     105.76
    256 MB         172.56     171.34     175.74     107.47
   1024 MB         232.40     230.08     222.15     190.03

Each size keeps its advantage until the working set passes its own
coverage and then converges on the base page column: 64KB is useful to
about 8MB, 512KB to about 64MB, 4MB to about 512MB.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Matt Turner (6):
      alpha: add missing page_table_check_pte_clear() to ptep_get_and_clear()
      alpha: handle VM_FAULT_HWPOISON in do_page_fault()
      alpha: clarify that _PAGE_URE and _PAGE_UWE are the Executive bits
      alpha: define granularity hint PTE bits
      alpha: align hugetlb mappings in arch_get_unmapped_area()
      alpha: implement hugetlb support

 arch/alpha/Kconfig               |   1 +
 arch/alpha/include/asm/hugetlb.h |  43 ++++++
 arch/alpha/include/asm/page.h    |  13 ++
 arch/alpha/include/asm/pgtable.h |  69 ++++++++-
 arch/alpha/kernel/osf_sys.c      |  14 +-
 arch/alpha/mm/Makefile           |   2 +
 arch/alpha/mm/fault.c            |  19 +++
 arch/alpha/mm/hugetlbpage.c      | 306 +++++++++++++++++++++++++++++++++++++++
 8 files changed, 456 insertions(+), 11 deletions(-)
---
base-commit: e946efcc89066c5d80acbae42d015a4da33a11de
change-id: 20260912-alpha-hugepages-0c6cb6c0995d

Best regards,
-- 
Matt Turner <mattst88@gmail.com>


From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH 0/6] generic relative extable support
Date: Sun,  3 Jan 2016 17:05:51 +0100
Message-ID: <1451837157-447-1-git-send-email-ard.biesheuvel@linaro.org>
Return-path: <linux-ia64-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=nOqw8JG9dbxfpBYCxhyFUdlkon+6GsrdNQFsCkEG7uk=;
        b=LavbI0pNE7KrvAjTlMIWF3CnuFab4JU9yI//5BS8SKZ2GtmCFw4XegM1q+A0mVBK6I
         j27ZQYZFfRdxTtCixGOm3XcLVPmL01PIUQEZzZwoLRONp/cWwZBsHGGCCUhO4eOH3IUo
         /aJN92lXXRUmTWu1M3OlaZUA1yv5JK+tApkpU=
Sender: linux-ia64-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, hpa@zytor.com, mingo@redhat.com, heiko.carstens@de.ibm.com, schwidefsky@de.ibm.com, mattst88@gmail.com, ink@jurassic.park.msu.ru, rth@twiddle.net, tony.luck@intel.com, fenghua.yu@intel.com, catalin.marinas@arm.com, will.deacon@arm.com, arnd@arndb.de, akpm@linux-foundation.org
Cc: mark.rutland@arm.com, marc.zyngier@arm.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>

There are currently four architectures (x86, ia64, alpha and s390) whose
user-access exception tables are relative to the table entry address rather
than absolute. Each of these architectures has its own search_extable() and
sort_extable() implementation, which are not only mostly identical to each
other, but also deviate very little from the generic absolute implementations
in lib/extable.c that they override.

So before making arm64 the fifth architecture that reimplements this, let's
refactor the existing code so that all of these architectures use common code
for searching and sorting the relative extables. Archs may set
ARCH_HAS_RELATIVE_EXTABLE to indicate that the table consists of a pair of
relative ints, and may define swap_ex_entry_fixup() if the fixup member needs
special treatment in the swapping step of the sorting routine (such as alpha).

Note that the s390 patch applies on top of the following patch:

  http://article.gmane.org/gmane.linux.kernel/2117036

which fixes a bug I spotted while working on this code. Since that probably
needs to go to -stable, I broke it out and posted it separately.

Ard Biesheuvel (6):
  extable: add support for relative extables to search and sort routines
  alpha/extable: use generic search and sort routines
  s390/extable: use generic search and sort routines
  x86/extable: use generic search and sort routines
  ia64/extable: use generic search and sort routines
  arm64: switch to relative exception tables

 arch/alpha/include/asm/uaccess.h     |  10 +-
 arch/alpha/mm/Makefile               |   2 +-
 arch/alpha/mm/extable.c              |  92 -----------------
 arch/arm64/include/asm/assembler.h   |   2 +-
 arch/arm64/include/asm/futex.h       |   4 +-
 arch/arm64/include/asm/uaccess.h     |  18 ++--
 arch/arm64/kernel/armv8_deprecated.c |   4 +-
 arch/arm64/mm/extable.c              |   2 +-
 arch/ia64/include/asm/uaccess.h      |   8 +-
 arch/ia64/mm/extable.c               |  97 +-----------------
 arch/s390/include/asm/uaccess.h      |   8 +-
 arch/s390/mm/Makefile                |   2 +-
 arch/s390/mm/extable.c               |  85 ----------------
 arch/x86/include/asm/uaccess.h       |   5 +-
 arch/x86/mm/extable.c                | 106 +-------------------
 lib/extable.c                        |  50 +++++++--
 scripts/sortextable.c                |   2 +-
 17 files changed, 77 insertions(+), 420 deletions(-)
 delete mode 100644 arch/alpha/mm/extable.c
 delete mode 100644 arch/s390/mm/extable.c

-- 
1.9.1


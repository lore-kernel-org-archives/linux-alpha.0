From: Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 0/7] Add memsetN functions
Date: Fri, 24 Mar 2017 09:13:11 -0700
Message-ID: <20170324161318.18718-1-willy@infradead.org>
Return-path: <sparclinux-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Message-Id:Date:Subject:Cc:To:From:
        Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=hIaD524xs3Qn/3Ay5JbEDOGIIDvUrEHXnjPPpXfuEk4=; b=Qg7GSAMp2m8G2uhmZQuXAUrbH
        gDWARADqKzDYia+LS3+2l8wIojVoqVFaSf69zWrIeE9tYgGHTQ8ETuqnZvg7ofs249WzBXUyIELlf
        /xGVuk/l8j08fxPyNWMkvo6tFuWrFLpo9jkf/+Kr0zPUlSPHRegXOHhSi1sti/95bhE7DHN1qO/P4
        9nfhQXLdDoQ8Zf3ahnWH6SW4FuQwRt5Xqhpr8o0hhJD/jUQQ9ksJQYUUSm3VXwQFfxlK6gV6eiSAT
        qs5e0ae5yIZ5Y+lWvvDvt3nDG8ldhZ5bnHuS9/7t1p+G75QQ2zX+VjIA/8spy4LGTKigiuKvxwWea
    
Sender: sparclinux-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-mips@linux-mips.org, linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Matthew Wilcox <mawilcox@microsoft.com>

From: Matthew Wilcox <mawilcox@microsoft.com>

zram was recently enhanced to support compressing pages with a repeating
pattern up to the size of an unsigned long.  As part of the discussion,
we noted it would be nice if architectures had optimised routines
to fill regions of memory with patterns larger than those contained
in a single byte.  Our suspicions were right; the x86 version offers
approximately a 7% performance improvement over the C implementation.

The generic memfill() function is part of Lars Wirzenius' publib,
but it doesn't offer the most convenient interface.  I chose to add
five more-specific functions as part of this patchset -- memset16(),
memset32(), memset64(), memset_l() (long) and memset_p() (pointer).

It would be nice to have some more architectures implement optimised
memsetN calls.  It would also be nice to find more places in the kernel
which could benefit from calling these functions.  Maybe a coccinelle
script could be written to find such places?  We're looking for loops
over an array where the value being stored into the array does not depend
on the iteration variable.

Since v1 of the patchset, I stumbled on Alpha's memsetw() which
caused me to add memset16() to complete the set.  I removed the
'__HAVE_ARCH_MEMSET_PLUS' preprocessor symbol in favour of separate
MEMSET16 MEMSET32 and MEMSET64 symbols.  I also reviewed the scr_mem*w()
usages across the different architectures and implemented some obvious
missing optimisations.  Alpha is still missing scr_memmovew() as it
would be non-trivial to write.

Russell's review on patch 2 only applies to the memset32/memset64
implementation.  The memset16 is unreviewed (and, indeed, untested)
to date.

Matthew Wilcox (7):
  Add multibyte memset functions
  ARM: Implement memset16, memset32 & memset64
  x86: Implement memset16, memset32 & memset64
  alpha: Add support for memset16
  zram: Convert to using memset_l
  sym53c8xx_2: Convert to use memset32
  vga: Optimise console scrolling

 arch/alpha/include/asm/string.h     | 15 ++++----
 arch/alpha/include/asm/vga.h        |  2 +-
 arch/alpha/lib/memset.S             | 10 +++---
 arch/arm/include/asm/string.h       | 21 ++++++++++++
 arch/arm/kernel/armksyms.c          |  3 ++
 arch/arm/lib/memset.S               | 44 +++++++++++++++++++-----
 arch/mips/include/asm/vga.h         |  6 ++++
 arch/powerpc/include/asm/vga.h      |  8 +++++
 arch/sparc/include/asm/vga.h        | 24 +++++++++++++
 arch/x86/include/asm/string_32.h    | 24 +++++++++++++
 arch/x86/include/asm/string_64.h    | 36 ++++++++++++++++++++
 drivers/block/zram/zram_drv.c       | 15 ++------
 drivers/scsi/sym53c8xx_2/sym_hipd.c | 11 ++----
 include/linux/string.h              | 30 ++++++++++++++++
 include/linux/vt_buffer.h           | 12 +++++++
 lib/string.c                        | 68 +++++++++++++++++++++++++++++++++++++
 16 files changed, 287 insertions(+), 42 deletions(-)

-- 
2.11.0

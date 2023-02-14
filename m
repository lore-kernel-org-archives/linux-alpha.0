From: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 00/24] Remove COMMAND_LINE_SIZE from uapi
Date: Tue, 14 Feb 2023 08:49:01 +0100
Message-ID: <20230214074925.228106-1-alexghiti__1570.23960943974$1676361018$gmane$org@rivosinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PqFq1+4gxxgib1u5xFvkwzAigtvwrfvrRhML7sgk2og=;
        b=x2GCdJrJM+l90TcWJRpT5oqfHATv+1Z4ENWwSL8lO0FTmae9xEroV9kkTVhTQc2FUt
         Wn/RFDJVx9pkx44t/X9uIZr4UZIW4vPiJZhfNUqKntvRiY++QPOeqnnGXN88q7BaejNG
         LZpXU/mq11EKyRUGofsabIrnfYBVQY+9p7ToWhxcjXgaj4F/p/KdiW5L/FjvLGXwxufA
         OolCtUrOJT0nutQmjpFFaM0ZI5SKBeMDY3DqtuP9gPzRFIb9Qu7nHkl0WDRYNsGJe+jH
         VUQZ3nuUW04ZXCk3DYLj+fZ4gaM6Da+RW8nKFKvSwOFcBtwGK5gdPyPno7lgeBcoz3Wn
         0K9w==
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>

This all came up in the context of increasing COMMAND_LINE_SIZE in the
RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
maximum length of /proc/cmdline and userspace could staticly rely on
that to be correct.

Usually I wouldn't mess around with changing this sort of thing, but
PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
increasing, but they're from before the UAPI split so I'm not quite sure
what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
asm-generic/setup.h.").

It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
part of the uapi to begin with, and userspace should be able to handle
/proc/cmdline of whatever length it turns out to be.  I don't see any
references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
search, but that's not really enough to consider it unused on my end.

The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
shouldn't be part of uapi, so this now touches all the ports.  I've
tried to split this all out and leave it bisectable, but I haven't
tested it all that aggressively.

Changes since v2 <https://lore.kernel.org/all/20221211061358.28035-1-palmer@rivosinc.com/>:
* Fix sh, csky and ia64 builds, as reported by kernel test robot

Changes since v1 <https://lore.kernel.org/all/20210423025545.313965-1-palmer@dabbelt.com/>:
* Touches every arch.

base-commit-tag: next-20230207

Palmer Dabbelt (24):
  alpha: Remove COMMAND_LINE_SIZE from uapi
  arm64: Remove COMMAND_LINE_SIZE from uapi
  arm: Remove COMMAND_LINE_SIZE from uapi
  ia64: Remove COMMAND_LINE_SIZE from uapi
  m68k: Remove COMMAND_LINE_SIZE from uapi
  microblaze: Remove COMMAND_LINE_SIZE from uapi
  mips: Remove COMMAND_LINE_SIZE from uapi
  parisc: Remove COMMAND_LINE_SIZE from uapi
  powerpc: Remove COMMAND_LINE_SIZE from uapi
  sparc: Remove COMMAND_LINE_SIZE from uapi
  xtensa: Remove COMMAND_LINE_SIZE from uapi
  asm-generic: Remove COMMAND_LINE_SIZE from uapi
  alpha: Remove empty <uapi/asm/setup.h>
  arc: Remove empty <uapi/asm/setup.h>
  m68k: Remove empty <uapi/asm/setup.h>
  arm64: Remove empty <uapi/asm/setup.h>
  microblaze: Remove empty <uapi/asm/setup.h>
  sparc: Remove empty <uapi/asm/setup.h>
  parisc: Remove empty <uapi/asm/setup.h>
  x86: Remove empty <uapi/asm/setup.h>
  xtensa: Remove empty <uapi/asm/setup.h>
  powerpc: Remove empty <uapi/asm/setup.h>
  mips: Remove empty <uapi/asm/setup.h>
  s390: Remove empty <uapi/asm/setup.h>

 .../admin-guide/kernel-parameters.rst         |  2 +-
 arch/alpha/include/asm/setup.h                |  4 +--
 arch/alpha/include/uapi/asm/setup.h           |  7 -----
 arch/arc/include/asm/setup.h                  |  1 -
 arch/arc/include/uapi/asm/setup.h             |  6 -----
 arch/arm/include/asm/setup.h                  |  1 +
 arch/arm/include/uapi/asm/setup.h             |  2 --
 arch/arm64/include/asm/setup.h                |  3 ++-
 arch/arm64/include/uapi/asm/setup.h           | 27 -------------------
 arch/ia64/include/asm/setup.h                 | 10 +++++++
 arch/ia64/include/uapi/asm/setup.h            |  6 ++---
 arch/loongarch/include/asm/setup.h            |  2 +-
 arch/m68k/include/asm/setup.h                 |  3 +--
 arch/m68k/include/uapi/asm/setup.h            | 17 ------------
 arch/microblaze/include/asm/setup.h           |  2 +-
 arch/microblaze/include/uapi/asm/setup.h      | 20 --------------
 arch/mips/include/asm/setup.h                 |  3 ++-
 arch/mips/include/uapi/asm/setup.h            |  8 ------
 arch/parisc/include/{uapi => }/asm/setup.h    |  0
 arch/powerpc/include/asm/setup.h              |  2 +-
 arch/powerpc/include/uapi/asm/setup.h         |  7 -----
 arch/s390/include/asm/setup.h                 |  1 -
 arch/s390/include/uapi/asm/setup.h            |  1 -
 arch/sh/include/asm/setup.h                   |  2 +-
 arch/sparc/include/asm/setup.h                |  6 ++++-
 arch/sparc/include/uapi/asm/setup.h           | 16 -----------
 arch/x86/include/asm/setup.h                  |  2 --
 arch/x86/include/uapi/asm/setup.h             |  1 -
 arch/xtensa/include/{uapi => }/asm/setup.h    |  0
 include/asm-generic/Kbuild                    |  1 +
 include/{uapi => }/asm-generic/setup.h        |  0
 include/uapi/asm-generic/Kbuild               |  1 -
 32 files changed, 31 insertions(+), 133 deletions(-)
 delete mode 100644 arch/alpha/include/uapi/asm/setup.h
 delete mode 100644 arch/arc/include/uapi/asm/setup.h
 delete mode 100644 arch/arm64/include/uapi/asm/setup.h
 create mode 100644 arch/ia64/include/asm/setup.h
 delete mode 100644 arch/m68k/include/uapi/asm/setup.h
 delete mode 100644 arch/microblaze/include/uapi/asm/setup.h
 delete mode 100644 arch/mips/include/uapi/asm/setup.h
 rename arch/parisc/include/{uapi => }/asm/setup.h (100%)
 delete mode 100644 arch/powerpc/include/uapi/asm/setup.h
 delete mode 100644 arch/s390/include/uapi/asm/setup.h
 delete mode 100644 arch/sparc/include/uapi/asm/setup.h
 delete mode 100644 arch/x86/include/uapi/asm/setup.h
 rename arch/xtensa/include/{uapi => }/asm/setup.h (100%)
 rename include/{uapi => }/asm-generic/setup.h (100%)

-- 
2.37.2


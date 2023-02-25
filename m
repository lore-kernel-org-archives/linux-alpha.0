From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha.git
Date: Sat, 25 Feb 2023 15:40:01 -0500
Message-ID: <20230225204001.eostfx5mcba5vaiq@framework.mattst88.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oxdmpabilz6nmnc5"
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q19los03a5z3kEE7iE7F654CxeAtz03ELvIXEXg2X1I=;
        b=i8u0ho2y26b3gctpPW6nEBV3zlyJEn4Rr//rstsaCcP7mCQeYz2nPU9FZZwmu1dIXi
         KCdQClIoiunDqtXxByqa47MuHpbFGScqJS+BwsK/mQ3qcqL1flagQvAh28CzhLP3UVec
         BZjhrew+5S5fhxxSWBwrMTQxFNSIcuyglu6oDdx6ruuHzYhcnW+MhuimLxgNTfkMr0PK
         4PqfU2ab69qyFlPcnf/Qniy/6Xm/oFATfRKmgdcGXRWeePhRem5Ob/KHXbyyKbSgn0AZ
         n9l0mg/88U9om9XanaphHjhv/PRv9ov18PXU4DMgN2ZF2sBSB9UTS1Bz2he/BQ9ojyAv
         ccrw==
Content-Disposition: inline
List-ID: <linux-alpha.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org


--oxdmpabilz6nmnc5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull a few changes for alpha. They're mostly small janitorial
fixes but there's also more important ones: a patch to fix loading large
modules from Edward Humes, and some fixes from Al Viro.

Thanks,
Matt

The following changes since commit f6feea56f66d34259c4222fa02e8171c4f2673d1:

  Merge tag 'mm-hotfixes-stable-2023-02-13-13-50' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm (2023-02-13 14:09:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git for-linus

for you to fetch changes up to 290ec1d58049e6203062d5fc796c50852112ae00:

  alpha: in_irq() cleanup (2023-02-24 23:14:22 -0500)

----------------------------------------------------------------
Al Viro (5):
      alpha: fix FEN fault handling
      alpha/boot: fix the breakage from -isystem series...
      alpha/boot/tools/objstrip: fix the check for ELF header
      alpha/boot/misc: trim unused declarations
      alpha: lazy FPU switching

Bjorn Helgaas (1):
      alpha: remove unused __SLOW_DOWN_IO and SLOW_DOWN_IO definitions

Changbin Du (1):
      alpha: in_irq() cleanup

Colin Ian King (1):
      alpha: osf_sys: reduce kernel log spamming on invalid osf_mount call typenr

Edward Humes (1):
      alpha: fix R_ALPHA_LITERAL reloc for large modules

Joe Perches (1):
      alpha: Avoid comma separated statements

Kees Cook (1):
      alpha: Implement "current_stack_pointer"

Lukas Bulwahn (1):
      alpha: update config files

Maciej W. Rozycki (1):
      alpha: Remove redundant local asm header redirections

Minghao Chi (1):
      alpha: remove redundant err variable

Yang Yang (1):
      alpha: replace NR_SYSCALLS by NR_syscalls

Zhang Jiaming (1):
      alpha: Add some spaces to ensure format specification

rj1 (1):
      alpha: fixed a typo in core_cia.c

 arch/alpha/Kconfig                   |   1 +
 arch/alpha/boot/bootp.c              |   2 +-
 arch/alpha/boot/bootpz.c             |   2 +-
 arch/alpha/boot/main.c               |   2 +-
 arch/alpha/boot/misc.c               |   2 -
 arch/alpha/boot/stdio.c              |  16 ++--
 arch/alpha/boot/tools/objstrip.c     |   2 +-
 arch/alpha/configs/defconfig         |   2 -
 arch/alpha/include/asm/Kbuild        |   1 +
 arch/alpha/include/asm/asm-offsets.h |   1 -
 arch/alpha/include/asm/div64.h       |   1 -
 arch/alpha/include/asm/fpu.h         |  61 +++++++++------
 arch/alpha/include/asm/io.h          |   4 -
 arch/alpha/include/asm/irq_regs.h    |   1 -
 arch/alpha/include/asm/kdebug.h      |   1 -
 arch/alpha/include/asm/thread_info.h |  18 +++++
 arch/alpha/include/asm/unistd.h      |   2 +-
 arch/alpha/include/uapi/asm/ptrace.h |   2 +
 arch/alpha/kernel/asm-offsets.c      |   2 +
 arch/alpha/kernel/core_cia.c         |   2 +-
 arch/alpha/kernel/entry.S            | 148 ++++++++++++++++++-----------------
 arch/alpha/kernel/module.c           |   4 +-
 arch/alpha/kernel/osf_sys.c          |   2 +-
 arch/alpha/kernel/pci_iommu.c        |   8 +-
 arch/alpha/kernel/perf_event.c       |   6 +-
 arch/alpha/kernel/process.c          |   7 +-
 arch/alpha/kernel/ptrace.c           |  18 +++--
 arch/alpha/kernel/signal.c           |  20 +++--
 arch/alpha/kernel/traps.c            |  30 +++----
 arch/alpha/lib/fpreg.c               |  43 ++++++++--
 arch/alpha/lib/stacktrace.c          |   2 +-
 kernel/trace/trace.h                 |   2 +-
 32 files changed, 238 insertions(+), 177 deletions(-)
 delete mode 100644 arch/alpha/include/asm/asm-offsets.h
 delete mode 100644 arch/alpha/include/asm/div64.h
 delete mode 100644 arch/alpha/include/asm/irq_regs.h
 delete mode 100644 arch/alpha/include/asm/kdebug.h

--oxdmpabilz6nmnc5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iNUEABYKAH0WIQReryEEmoa4pUzLG/qs6yl0DJpOlwUCY/pyIV8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0NUVB
RjIxMDQ5QTg2QjhBNTRDQ0IxQkZBQUNFQjI5NzQwQzlBNEU5NwAKCRCs6yl0DJpO
l1KCAP4/d7Ch+6aqUPpIg+aJGawQfJdHIyX0PDj0FQEhYiRO4AD/RxfmB7DAp4vu
XjPSX2fZh/GiX7nJ2/oJbU8ZSvCa1g4=
=Gv71
-----END PGP SIGNATURE-----

--oxdmpabilz6nmnc5--

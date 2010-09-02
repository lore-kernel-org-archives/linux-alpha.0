From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: [PATCH 00/91] arch Update broken web addresses in the arch directory.
Date: Thu,  2 Sep 2010 14:06:31 -0700
Message-ID: <1283461606-7803-1-git-send-email-justinmattock@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=PO+34weKU7mbBDw28WaL2P9nn86WtSNAyQgiFKP0iww=;
        b=OaPJL/NqcvwEnKhi71CyXtAaP1RL3Rr97BHWAt61FtAQBrb77S1tppyzQvrV8M1b6L
         RO+MD6zgDBAc0C577UZME0nnFyyz0nlbSfn+7/XjWJI2EkzXHCmxcDAy5W34oVdBH4Xg
         YJQost0WZRma47ydlhLSoNBMxRwS/+Ij+TnDo=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, jkosina@suse.cz





Below you will find a patch set consisting of updates to broken web addresses in the arch directory..
(yes I know boring, but a good exercise with work flow). Some of the addresses where changed using
the webarchive web site, and some of the web sites where changed to the new company name due to change
of ownership, and/or upgrade.
Note: patches 0039-0081 probably should of been sent as just one patch, but after contemplating, 
I decided it was better to send individually in the event of mishap with the new address, and making
it easier to view, as opposed to a long list of files that becomes redundant..
(but tough to say, maybe I need glasses or something..)

In any case let me know if any of them need to be changed, and I'll update a patch and send it out.

cheers...



 arch/alpha/Kconfig                        |    6 ++++--
 arch/alpha/kernel/sys_sio.c               |    4 ++--
 arch/arm/Kconfig                          |    4 ++--
 arch/arm/common/icst.c                    |    2 +-
 arch/arm/include/asm/hardware/icst.h      |    2 +-
 arch/arm/mach-at91/Kconfig                |    6 +++---
 arch/arm/mach-footbridge/Kconfig          |    3 ++-
 arch/arm/mach-omap1/Kconfig               |    6 +++---
 arch/arm/mach-pxa/am200epd.c              |    2 +-
 arch/arm/mach-pxa/am300epd.c              |    2 +-
 arch/arm/mach-pxa/idp.c                   |    4 ++--
 arch/arm/mach-pxa/include/mach/idp.h      |    4 ++--
 arch/arm/mach-s3c2440/mach-at2440evb.c    |    2 +-
 arch/arm/mach-sa1100/Kconfig              |    7 ++++---
 arch/arm/mach-sa1100/cpu-sa1100.c         |    2 +-
 arch/arm/mm/Kconfig                       |    2 +-
 arch/arm/mm/proc-xscale.S                 |    2 +-
 arch/arm/nwfpe/milieu.h                   |    4 ++--
 arch/arm/nwfpe/softfloat-macros           |    4 ++--
 arch/arm/nwfpe/softfloat-specialize       |    4 ++--
 arch/arm/nwfpe/softfloat.c                |    4 ++--
 arch/arm/nwfpe/softfloat.h                |    4 ++--
 arch/arm/plat-samsung/include/plat/adc.h  |    2 +-
 arch/avr32/Kconfig                        |    2 +-
 arch/h8300/Kconfig.cpu                    |   14 +++++++-------
 arch/h8300/README                         |   13 ++++++-------
 arch/ia64/include/asm/machvec_sn2.h       |    2 +-
 arch/ia64/include/asm/numa.h              |    3 ++-
 arch/ia64/kernel/acpi.c                   |    3 ++-
 arch/ia64/lib/idiv32.S                    |    3 ++-
 arch/ia64/lib/idiv64.S                    |    3 ++-
 arch/ia64/sn/kernel/setup.c               |    3 ++-
 arch/ia64/sn/kernel/sn2/timer_interrupt.c |    4 +---
 arch/m32r/Kconfig                         |    2 +-
 arch/m68k/Kconfig                         |    2 +-
 arch/m68k/mac/macboing.c                  |    2 +-
 arch/m68k/mac/via.c                       |    7 ++-----
 arch/m68k/q40/README                      |    8 ++++----
 arch/mips/Kconfig                         |    3 ++-
 arch/mips/math-emu/cp1emu.c               |    2 +-
 arch/mips/math-emu/dp_add.c               |    2 +-
 arch/mips/math-emu/dp_cmp.c               |    2 +-
 arch/mips/math-emu/dp_div.c               |    2 +-
 arch/mips/math-emu/dp_fint.c              |    2 +-
 arch/mips/math-emu/dp_flong.c             |    2 +-
 arch/mips/math-emu/dp_frexp.c             |    2 +-
 arch/mips/math-emu/dp_fsp.c               |    2 +-
 arch/mips/math-emu/dp_logb.c              |    2 +-
 arch/mips/math-emu/dp_modf.c              |    2 +-
 arch/mips/math-emu/dp_mul.c               |    2 +-
 arch/mips/math-emu/dp_scalb.c             |    2 +-
 arch/mips/math-emu/dp_simple.c            |    2 +-
 arch/mips/math-emu/dp_sqrt.c              |    2 +-
 arch/mips/math-emu/dp_sub.c               |    2 +-
 arch/mips/math-emu/dp_tint.c              |    2 +-
 arch/mips/math-emu/dp_tlong.c             |    2 +-
 arch/mips/math-emu/ieee754.c              |    2 +-
 arch/mips/math-emu/ieee754.h              |    2 +-
 arch/mips/math-emu/ieee754d.c             |    2 +-
 arch/mips/math-emu/ieee754dp.c            |    2 +-
 arch/mips/math-emu/ieee754dp.h            |    2 +-
 arch/mips/math-emu/ieee754int.h           |    2 +-
 arch/mips/math-emu/ieee754m.c             |    2 +-
 arch/mips/math-emu/ieee754sp.c            |    2 +-
 arch/mips/math-emu/ieee754sp.h            |    2 +-
 arch/mips/math-emu/ieee754xcpt.c          |    2 +-
 arch/mips/math-emu/sp_add.c               |    2 +-
 arch/mips/math-emu/sp_cmp.c               |    2 +-
 arch/mips/math-emu/sp_div.c               |    2 +-
 arch/mips/math-emu/sp_fdp.c               |    2 +-
 arch/mips/math-emu/sp_fint.c              |    2 +-
 arch/mips/math-emu/sp_flong.c             |    2 +-
 arch/mips/math-emu/sp_frexp.c             |    2 +-
 arch/mips/math-emu/sp_logb.c              |    2 +-
 arch/mips/math-emu/sp_modf.c              |    2 +-
 arch/mips/math-emu/sp_mul.c               |    2 +-
 arch/mips/math-emu/sp_scalb.c             |    2 +-
 arch/mips/math-emu/sp_simple.c            |    2 +-
 arch/mips/math-emu/sp_sqrt.c              |    2 +-
 arch/mips/math-emu/sp_sub.c               |    2 +-
 arch/mips/math-emu/sp_tint.c              |    2 +-
 arch/mips/math-emu/sp_tlong.c             |    2 +-
 arch/powerpc/include/asm/hydra.h          |    2 +-
 arch/sh/cchips/Kconfig                    |    3 ++-
 arch/um/os-Linux/start_up.c               |    2 +-
 arch/x86/kernel/apm_32.c                  |    2 +-
 arch/x86/kernel/cpu/amd.c                 |    2 +-
 arch/x86/kernel/cpu/cpufreq/powernow-k8.c |    3 ++-
 arch/x86/kernel/microcode_core.c          |    2 +-
 arch/x86/kernel/microcode_intel.c         |    2 +-
 arch/x86/math-emu/README                  |    4 ----
 91 files changed, 133 insertions(+), 131 deletions(-)
 


Justin P. Mattock




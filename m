From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha-2.6
Date: Mon, 17 Jan 2011 05:09:45 +0000
Message-ID: <AANLkTi=JwYsgC7LhpRBGJ5E2roxfMGunfWg3VbBGva4h@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:from:date:message-id:subject:to:cc
         :content-type;
        bh=Xp1+SWZGE4hoMYAXYzpeCyaCteRkF/RNrA5jeWb2Bis=;
        b=TTD7XeUJQJtkg5XqOaT5P/acriNVWgBoDB0nopiqUskuwCXOD/0z6C0XpyzXp2Gz1a
         jVftOcDrQXGHFj9ZIyej3zR2d5hmpSudwoLJdju2nczBaZKCdHSwKmpYsa3NmcB61JGm
         pkGcZ/GZTJPSt5OGZatTKzyB4SpVcwTHhM9/E=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org

Hi Linus,
Please pull my alpha-2.6 tree. Big thanks goes to Kyle McMartin for
getting rid of do_IRQ and Ivan for some timely build fixes.

Thanks,
Matt

The following changes since commit e78bf5e6cbe837daa6ab628a5f679548742994d3:

  drivers/nfc/pn544.c: fix min_t warnings (2011-01-16 17:28:21 -0800)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.git for-linus

Ivan Kokshaysky (2):
      alpha: fix breakage caused by df9ee29270
      alpha: fix WARN_ON in __local_bh_enable()

Kyle McMartin (3):
      alpha: use set_irq_chip and push down __do_IRQ to the machine types
      alpha: irq clean up
      alpha: kill off alpha_do_IRQ

Matt Turner (1):
      alpha: add GENERIC_HARDIRQS_NO__DO_IRQ to Kconfig

Namhyung Kim (1):
      alpha/osf_sys: remove unused MAX_SELECT_SECONDS

matt mooney (1):
      alpha: change to new Makefile flag variables

 arch/alpha/Kconfig                |    3 ++
 arch/alpha/include/asm/io.h       |    8 +++--
 arch/alpha/kernel/Makefile        |    4 +-
 arch/alpha/kernel/irq.c           |   31 +++++++++++++-------
 arch/alpha/kernel/irq_alpha.c     |   24 +++++-----------
 arch/alpha/kernel/irq_i8259.c     |   26 +++---------------
 arch/alpha/kernel/irq_pyxis.c     |   27 +++---------------
 arch/alpha/kernel/irq_srm.c       |   27 +++---------------
 arch/alpha/kernel/osf_sys.c       |    3 --
 arch/alpha/kernel/sys_alcor.c     |   27 +++---------------
 arch/alpha/kernel/sys_cabriolet.c |   28 ++++---------------
 arch/alpha/kernel/sys_dp264.c     |   50 +++++----------------------------
 arch/alpha/kernel/sys_eb64p.c     |   27 +++---------------
 arch/alpha/kernel/sys_eiger.c     |   27 +++---------------
 arch/alpha/kernel/sys_jensen.c    |   55 +++++++------------------------------
 arch/alpha/kernel/sys_marvel.c    |   50 +++++++++-------------------------
 arch/alpha/kernel/sys_mikasa.c    |   27 +++---------------
 arch/alpha/kernel/sys_noritake.c  |   27 +++---------------
 arch/alpha/kernel/sys_rawhide.c   |   27 +++---------------
 arch/alpha/kernel/sys_rx164.c     |   27 +++---------------
 arch/alpha/kernel/sys_sable.c     |   28 ++++---------------
 arch/alpha/kernel/sys_takara.c    |   27 +++---------------
 arch/alpha/kernel/sys_titan.c     |   31 +++++----------------
 arch/alpha/kernel/sys_wildfire.c  |   42 ++++++++--------------------
 arch/alpha/lib/Makefile           |    4 +-
 arch/alpha/math-emu/Makefile      |    2 +-
 arch/alpha/mm/Makefile            |    2 +-
 arch/alpha/oprofile/Makefile      |    2 +-
 28 files changed, 159 insertions(+), 504 deletions(-)

From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha-2.6.git
Date: Wed, 2 Mar 2011 21:40:07 +0000
Message-ID: <AANLkTikE2kHp84gQFAEL2G5GH-uM-Hb6ErgrEGZVq=mN@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:from:date:message-id:subject:to:cc
         :content-type;
        bh=ZPkNPnnOTdX2KGnQrp1NsQrt1GP9Hv4ah+q8kijUIUA=;
        b=nLKA8d7tkkUyg+4VeOvsgxrda2OHQGnqKoha4ZljIj19nbQ8sqEk6hWT2h1g4pnVVI
         z9i40r3kVjMhLLobuKOB6bnEMYS7Sy6MM4wkGzpGoEjOjnR3D4TMZCDwvOVcgE76JzTY
         N/fnXR1IcNhJPvQYLKFJR8BLKqbXQ56awTrtY=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org

Hi Linus,
Please pull my for-linus branch. It contains some clean-ups of the
do_IRQ removal.

Thanks!
Matt

The following changes since commit dd9c1549edef02290edced639f67b54a25abbe0e:

  Linux 2.6.38-rc7 (2011-03-01 13:55:12 -0800)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.git for-linus

Morten Holst Larsen (1):
      Fix typo in call to irq_to_desc()

Thomas Gleixner (18):
      alpha: Pyxis convert irq_chip functions
      alpha: srm: Convert irq_chip functions
      alpha: i8259, alcor, jensen wildfire: Convert irq_chip
      alpha: cabriolet: Convert irq_chip functions
      alpha: dp264: Convert irq_chip functions
      alpha: eb64p: Convert irq_chip functions
      alpha: eiger: Convert irq_chip functions
      alpha: marvel: Convert irq_chip functions
      alpha: mikasa: Convert irq_chip functions
      alpha: rawhide: Convert irq_chip functions
      alpha: noritake: Convert irq_chip functions
      alpha: rx164: Convert irq_chip functions
      alpha: sable: Convert irq_chip functions
      alpha: takara: Convert irq_chip functions
      alpha: titan: Convert irq_chip functions
      alpha: irq: Remove pointless irq status manipulation
      alpha: irq: Convert affinity to use irq_data
      alpha: Enable GENERIC_HARDIRQS_NO_DEPRECATED

 arch/alpha/Kconfig                |    1 +
 arch/alpha/kernel/irq.c           |   13 ++++++---
 arch/alpha/kernel/irq_alpha.c     |   11 ++-----
 arch/alpha/kernel/irq_i8259.c     |   18 +++++++-----
 arch/alpha/kernel/irq_impl.h      |    8 ++---
 arch/alpha/kernel/irq_pyxis.c     |   20 +++++++-------
 arch/alpha/kernel/irq_srm.c       |   16 +++++-----
 arch/alpha/kernel/sys_alcor.c     |   28 ++++++++++----------
 arch/alpha/kernel/sys_cabriolet.c |   16 +++++-----
 arch/alpha/kernel/sys_dp264.c     |   52 +++++++++++++++++++-----------------
 arch/alpha/kernel/sys_eb64p.c     |   18 ++++++------
 arch/alpha/kernel/sys_eiger.c     |   14 +++++----
 arch/alpha/kernel/sys_jensen.c    |   24 ++++++++--------
 arch/alpha/kernel/sys_marvel.c    |   42 +++++++++++++----------------
 arch/alpha/kernel/sys_mikasa.c    |   16 +++++-----
 arch/alpha/kernel/sys_noritake.c  |   16 +++++-----
 arch/alpha/kernel/sys_rawhide.c   |   17 +++++++-----
 arch/alpha/kernel/sys_rx164.c     |   16 +++++-----
 arch/alpha/kernel/sys_sable.c     |   20 +++++++-------
 arch/alpha/kernel/sys_takara.c    |   14 +++++----
 arch/alpha/kernel/sys_titan.c     |   21 ++++++++------
 arch/alpha/kernel/sys_wildfire.c  |   32 +++++++++++++---------
 22 files changed, 224 insertions(+), 209 deletions(-)

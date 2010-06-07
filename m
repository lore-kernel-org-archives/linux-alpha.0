From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha-2.6.git
Date: Sun, 6 Jun 2010 21:18:53 -0400
Message-ID: <AANLkTik_oUwEAANf1BDDCnN7BzF1MoI-xr4cEBwwsbBE@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:cc:content-type;
        bh=edjzwc7+EEEgXaKJeSksFGroOxuRE8c4qTNxIx1eBNw=;
        b=DadKu6TetWTGdZIJ0wA+dORDsTRebm9fUmJ7R2FKM9064xMAjw8FHTCalN8dyNJ0C3
         nEtru8u26nnXGMLe2uBmMHuHcBhY0oPyI+NNUvWd4G+HnCwqvavsaANig38++Oa2Z4ta
         1ecqHtcF7wUkuazIZp4VhHaK0sE+rb90cqRXE=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org

Hi Linus,
Please pull the for-linus branch of my tree. It contains a patch
that's been on the mailing list since February that I've overlooked at
least twice, including this merge window. Sorry about that. It's
pretty simple, so it shouldn't cause any problems.

The other two changes are fixes for very obvious screw-ups, whose
breaking commits were clearly not even compile-tested, nor were they
mailed to linux-alpha@ or any of the Alpha maintainers.

Thanks!
Matt

The following changes since commit e44a21b7268a022c7749f521c06214145bd161e4:
  Linus Torvalds (1):
        Linux 2.6.35-rc2

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.git for-linus

Matt Turner (2):
      alpha: fix __arch_hweight32 typo
      alpha: fix pci_mmap_resource API breakage

Morten Holst Larsen (1):
      alpha: Detect Super IO chip, no IDE on Avanti, enable EPP19

 arch/alpha/include/asm/bitops.h |    2 +-
 arch/alpha/kernel/Makefile      |   20 ++++----
 arch/alpha/kernel/ns87312.c     |   38 -----------------
 arch/alpha/kernel/pc873xx.c     |   88 +++++++++++++++++++++++++++++++++++++++
 arch/alpha/kernel/pc873xx.h     |   35 +++++++++++++++
 arch/alpha/kernel/pci-sysfs.c   |    4 +-
 arch/alpha/kernel/sys_sio.c     |   23 ++++++++++-
 7 files changed, 158 insertions(+), 52 deletions(-)
 delete mode 100644 arch/alpha/kernel/ns87312.c
 create mode 100644 arch/alpha/kernel/pc873xx.c
 create mode 100644 arch/alpha/kernel/pc873xx.h

From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha-2.6.git
Date: Tue, 15 Jun 2010 16:14:49 -0400
Message-ID: <AANLkTinb4uOQc5zMCrgjBmuiuOR2rZKfAF_KaPKbv179@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:cc:content-type;
        bh=55RK6CGRlMdf/uNaxVZ9QdFkixD1RccUroZ1D0hGE6w=;
        b=KnQdyPQCpgz9TslxskOLiTXMUEpZEOJbJ/Ph+6djyqiLDpOHY0araIGXvZAeyH13BJ
         98wcjggsBjgngvTLrqje49ainP74pvLR+L3EmXlmE5locWmuvX6M3RCNcbrhdtONwprc
         NUPiU3yJ/jry0haaKwTAkLA8EusGl3OEVVuL0=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org

Hi Linus,
Please pull the for-linus branch of my alpha-2.6.git tree. It contains
some minor build fixes and a couple fix-ups for AlphaServer 255-series
systems.

Thanks,
Matt Turner

The following changes since commit 7e27d6e778cd87b6f2415515d7127eba53fe5d02:
  Linus Torvalds (1):
        Linux 2.6.35-rc3

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.git for-linus

Matt Turner (2):
      alpha: fix __arch_hweight32 typo
      alpha: fix pci_mmap_resource API breakage

Morten H. Larsen (2):
      alpha: Detect Super IO chip, no IDE on Avanti, enable EPP19
      alpha: Fix de2104x driver failing to readout MAC address correctly

 arch/alpha/include/asm/bitops.h |    2 +-
 arch/alpha/kernel/Makefile      |   20 ++++----
 arch/alpha/kernel/ns87312.c     |   38 -----------------
 arch/alpha/kernel/pc873xx.c     |   88 +++++++++++++++++++++++++++++++++++++++
 arch/alpha/kernel/pc873xx.h     |   35 +++++++++++++++
 arch/alpha/kernel/pci-sysfs.c   |    3 +-
 arch/alpha/kernel/sys_sio.c     |   23 ++++++++++-
 drivers/net/tulip/de2104x.c     |    5 +-
 8 files changed, 160 insertions(+), 54 deletions(-)
 delete mode 100644 arch/alpha/kernel/ns87312.c
 create mode 100644 arch/alpha/kernel/pc873xx.c
 create mode 100644 arch/alpha/kernel/pc873xx.h

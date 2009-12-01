From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha-2.6
Date: Tue, 1 Dec 2009 09:57:15 -0500
Message-ID: <b4198de60912010657j6e6e68fcu461269fae9a9a198@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753506AbZLAO5P@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:cc:content-type;
        bh=J818ACwdWf9KAHVbLK3jLQuzjXgN5JKHrdZ+tOIEuOY=;
        b=X2lbSsrazEHLCPnlg5huRVY+/q2y7/CZ6P57FHZW7IRWSKPEeWdkHmpEUPi94HZrDK
         3Q/oQM5PTNrK2h6bAYm0wnOVhDnNsc3imhhxoz1u4BsGbd1lSa4PZbwvUBbU9eFXWVoy
         FiqIL/vHcJ6H279vS97esNfUDTIdKmXJsLMHs=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: torvalds@linux-foundation.org
Cc: LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org

Hi Linus,

Please pull the 'for-linus' branch from
ssh://master.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.git
for-linus

It contains a couple _trivial_ changes and a regression fix from the
new alpha-2.6.git tree. The pull request was sent so late in the cycle
because the tree was only created yesterday. The patches have been
floating around for a much longer time though. :)

This is my first pull request, so please let me know if there's
anything I should do differently in the future.

Thanks,
Matt Turner


The following changes since commit a8a8a669ea13d792296737505adc43ccacf3a648:
  Linus Torvalds (1):
        Merge branch 'i2c-pnx-fixes' of git://git.fluff.org/bjdooks/linux

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.git for-linus

Julia Lawall (2):
      arch/alpha/kernel/sys_ruffian.c: Use DIV_ROUND_CLOSEST
      arch/alpha/kernel: Add kmalloc NULL tests

Michael Cree (1):
      Alpha: Rearrange thread info flags fixing two regressions

Thomas Gleixner (1):
      alpha: Fixup last users of irq_chip->typename

 arch/alpha/include/asm/thread_info.h |   27 +++++++++++++++------------
 arch/alpha/kernel/core_marvel.c      |    2 ++
 arch/alpha/kernel/core_titan.c       |    2 ++
 arch/alpha/kernel/irq.c              |    2 +-
 arch/alpha/kernel/irq_alpha.c        |    2 +-
 arch/alpha/kernel/irq_i8259.c        |    2 +-
 arch/alpha/kernel/irq_pyxis.c        |    2 +-
 arch/alpha/kernel/irq_srm.c          |    2 +-
 arch/alpha/kernel/sys_alcor.c        |    2 +-
 arch/alpha/kernel/sys_cabriolet.c    |    2 +-
 arch/alpha/kernel/sys_dp264.c        |    4 ++--
 arch/alpha/kernel/sys_eb64p.c        |    2 +-
 arch/alpha/kernel/sys_eiger.c        |    2 +-
 arch/alpha/kernel/sys_jensen.c       |    2 +-
 arch/alpha/kernel/sys_marvel.c       |    6 +++---
 arch/alpha/kernel/sys_mikasa.c       |    2 +-
 arch/alpha/kernel/sys_noritake.c     |    2 +-
 arch/alpha/kernel/sys_rawhide.c      |    2 +-
 arch/alpha/kernel/sys_ruffian.c      |    2 +-
 arch/alpha/kernel/sys_rx164.c        |    2 +-
 arch/alpha/kernel/sys_sable.c        |    2 +-
 arch/alpha/kernel/sys_takara.c       |    2 +-
 arch/alpha/kernel/sys_titan.c        |    2 +-
 arch/alpha/kernel/sys_wildfire.c     |    2 +-
 24 files changed, 43 insertions(+), 36 deletions(-)

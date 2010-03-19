From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha-2.6
Date: Fri, 19 Mar 2010 00:57:50 -0400
Message-ID: <b4198de61003182157wd019926o4bc1cff1faf898ce@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:cc:content-type;
        bh=aQuNyNtJu0poggBENt1Bdj7JGyWV2tnONS1eOTKmOBw=;
        b=ACcdsgj49q4rFU3glIEKmB72U3i+HVJGflF1e1i6jlUMGOaIZRvEYzJciy7Pn1unkF
         tK0fAZ0LmevdEhEnyl2r5H3fnQ5pbMg2BkgXKaFf1BO3kdbRN0/qwaS7B77V2sw4+8ij
         mef3WM6VqsriK6cE02PDooB2dlPFvI40YpMlE=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi Linus,

Please pull the 'for-linus' branch from
ssh://master.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.git
for-linus

It contains a couple trivial changes and a build fix for a recent regression.

Thanks,
Matt Turner

The following changes since commit 39710479303fd3affb3e204e9a7a75cc676977b5:
  Linus Torvalds (1):
        Merge branch 'for-linus' of git://git.kernel.org/.../vapier/blackfin

are available in the git repository at:

git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.git  for-linus

Akinobu Mita (1):
      alpha: use __ratelimit

FUJITA Tomonori (1):
      alpha: fix compile errors in dma-mapping-common.h

Frans Pop (1):
      alpha: remove trailing spaces in messages

 arch/alpha/include/asm/core_marvel.h  |    1 -
 arch/alpha/include/asm/core_mcpcia.h  |    1 -
 arch/alpha/include/asm/core_titan.h   |    1 -
 arch/alpha/include/asm/core_tsunami.h |    1 -
 arch/alpha/kernel/sys_dp264.c         |    2 +-
 arch/alpha/kernel/sys_titan.c         |    2 +-
 arch/alpha/kernel/traps.c             |   10 +++-------
 7 files changed, 5 insertions(+), 13 deletions(-)

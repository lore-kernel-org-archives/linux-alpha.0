From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha-2.6.git
Date: Sun, 19 Sep 2010 00:46:52 -0400
Message-ID: <AANLkTimOSix+YjXFFZ-0gwkpj1=subO2U8S9KhVz0qna@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:from:date
         :message-id:subject:to:cc:content-type;
        bh=ZJPo0xbN4JRY6gO0QmzdEnmutAQYIWejUBQFgwig7I0=;
        b=cejv4enJ6LzLium+Ew+btfT17zInuLvbrLvIadCpdLE2xOWoVYCKt6L/7kxk2xcJJP
         C5cybE4Ptwbz8Xg2pQrqwhsts6EqcatZTKqB1zw68J6TAW0GQKUa31UmEMnGlXbArOAv
         9Rj9dTI9SDZYOspfX+t3d+9DJFJscTkOoGgk8=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org

Hi Linus,
I'm not sure what happened, but I just got a rather large influx of
alpha-related patches. They're all bug fixes or minor changes. Cool
fixes from Al Viro including a bug that's existed since Linux-1.3.95.

Thanks!
Matt

The following changes since commit 151b6a5f1d4c547c92ec67a5a6fedc16f435956e:

  Merge branch 'for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound-2.6
(2010-09-17 10:53:28 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.git for-linus

Al Viro (4):
      alpha: belated ERESTART_RESTARTBLOCK race fix
      alpha: unb0rk sigsuspend() and rt_sigsuspend()
      alpha: fix a 14 years old bug in sigreturn tracing
      alpha: deal with multiple simultaneously pending signals

Arnd Bergmann (1):
      alpha: kill big kernel lock

Joe Perches (1):
      alpha: Use static const char * const where possible

Michael Cree (1):
      alpha: Shift perf event pending work earlier in timer interrupt

Mikael Pettersson (1):
      alpha: wire up fanotify and prlimit64 syscalls

Tejun Heo (1):
      alpha: fix build breakage in asm/cacheflush.h

matt mooney (1):
      alpha: remove unnecessary cast from void* in assignment.

 arch/alpha/include/asm/cacheflush.h |    2 +
 arch/alpha/include/asm/unistd.h     |    6 +++-
 arch/alpha/kernel/entry.S           |   61 ++++++++++++----------------------
 arch/alpha/kernel/err_ev6.c         |   12 ++++---
 arch/alpha/kernel/err_marvel.c      |   33 ++++++++++---------
 arch/alpha/kernel/err_titan.c       |   35 +++++++++++--------
 arch/alpha/kernel/osf_sys.c         |    9 +----
 arch/alpha/kernel/pci-sysfs.c       |    2 +-
 arch/alpha/kernel/signal.c          |   41 ++---------------------
 arch/alpha/kernel/srm_env.c         |    2 +-
 arch/alpha/kernel/systbls.S         |    3 ++
 arch/alpha/kernel/time.c            |   10 +++---
 arch/alpha/kernel/traps.c           |    3 --
 13 files changed, 88 insertions(+), 131 deletions(-)

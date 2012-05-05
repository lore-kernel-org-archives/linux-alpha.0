From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha.git
Date: Sat, 5 May 2012 15:14:14 -0400
Message-ID: <CAEdQ38H2PfswYMJZXduxK6og0oSxKHGRjoXkbKCgnt1r_13Ppw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:cc:content-type;
        bh=tNTdw34RIE49GsLWaDTNiiE2uZlUSFytRd0jTFj4YGk=;
        b=e8BVsw1T7ITNbEWNpip+6WvBEzLNT5NtpGgV4w+djND7Fy08GhzNCUnD4nul87INuI
         JX47TGaylVq75MRi+SmeUIvyFI3uKbTu/JgJw2izZVzRY7jRKK9CcIuzwQmsbc4m0PVy
         GHuYwrtl4qLfBcvLVdLK3jUf5DYOHd/YS9L+QbYJZKL0TlSRgcRH8bwPKgDEnNFA+I+C
         ZhgNKvn+Kj3T9hvW8wHdNgCizymvi/VYCDqOmoZOmW8qANe0Zr7iTEzZBYZ191IwWEqf
         1QSZhA05GOO5KVdP4L4DrCAWAjkm81Ltb9hIUw0GajnTI/RGGKTGZ9CaAoGIAsIe/TE4
         HcDg==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha <linux-alpha@vger.kernel.org>

Hi Linus,
My alpha tree is back up (after taking quite some time to get my GPG
key signed). It contains just some simple fixes.

Please pull.

Thanks,
Matt

The following changes since commit 529acf58981440eefeaf1451387e2a0aa4825c12:

  Merge tag 'nfs-for-3.4-4' of
git://git.linux-nfs.org/projects/trondmy/linux-nfs (2012-05-02
08:17:57 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git for-linus

Jim Faulkner (1):
      alpha: include module.h to fix modpost on Tsunami

Matt Turner (3):
      alpha: VGA_HOSE depends on VGA_CONSOLE
      alpha: properly define get/set_rtc_time on Marvel/SMP
      alpha: silence 'const' warning in sys_marvel.c

 arch/alpha/Kconfig               |    2 +-
 arch/alpha/include/asm/rtc.h     |    8 ++------
 arch/alpha/kernel/core_tsunami.c |    1 +
 arch/alpha/kernel/sys_marvel.c   |    2 +-
 4 files changed, 5 insertions(+), 8 deletions(-)

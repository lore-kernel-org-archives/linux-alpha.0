From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha-2.6.git
Date: Tue, 25 May 2010 19:45:24 -0400
Message-ID: <AANLkTim3NbMpA4S_kLa--0SO6QEY3qlhQW0iF9tO9Dei@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:cc:content-type;
        bh=9kLVtI6Xm2J+SUdCJcmDzdUOzzbpVfs9HWRP3Xg+czc=;
        b=qTDeZps6dDgkdBggyGhhzkwDAsrgsq4jRkS2nhuU7gFKdOsCMKxCDAq5uEzhhokr6E
         aK61dKmj+fCfy18kJAaXvLFUWq9y4/vfC53Faqg9KttwOYPSa0IayCL3rwK/nzRg8UEb
         NROh34WNBXR1hJObJKA4x/F480RncX+0FO5lo=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org

Hi Linus,
Please pull from alpha-2.6.git.

Thanks!
Matt Turner

The following changes since commit ec96e2fe954c23a54bfdf2673437a39e193a1822:
  Linus Torvalds (1):
        Merge branch 'devel' of master.kernel.org:/home/rmk/linux-2.6-arm

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.git
alpha-next

John Stultz (1):
      Convert alpha to use clocksources instead of arch_gettimeoffset

Matt Turner (1):
      alpha: simplify and optimize sched_find_first_bit

Nick Piggin (1):
      alpha: invoke oom-killer from page fault

 arch/alpha/Kconfig              |    4 --
 arch/alpha/include/asm/bitops.h |   20 +++++------
 arch/alpha/kernel/time.c        |   69 +++++++++++++++++---------------------
 arch/alpha/mm/fault.c           |   11 +-----
 4 files changed, 42 insertions(+), 62 deletions(-)

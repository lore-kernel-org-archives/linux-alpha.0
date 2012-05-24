From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha.git
Date: Thu, 24 May 2012 14:43:54 -0400
Message-ID: <CAEdQ38Eoifx-07VVGq=WDc5x929=AJo9iXoCs-X5RpwCeVx=fw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:cc:content-type;
        bh=ka2RB8ZDTWAg1b2U9KTpbGUuZf/TUxSlf00yC1pr+p8=;
        b=eogg2Ne1yODs/4WSjqpJldf/J98tShh97LR7pNi2vgWk13BytHxiuP+D8gcEOVsuas
         10oV30xwAn6NiVy2SUVp3AThu3F8Iuj/eqfYIsMXy3zUeSkgx/C+o3OIjAVVUza442Rh
         jVESVAfTFGQjcfrnaBUwO95C6R1FI3vLXVJI/hWtltvbX7jNzlPiPcikDeDZODbBGlYR
         xrUonebVyERAA8IHciGJ9v7iqpR5vNZ8jcTvQOWbKRJ9wR6p5+WYAwOTm3Nic5yuvp7j
         DC3cWNptleGRrXvs4sAkoeRgrWjsBLr6MYusVnQSiidh+FU2DIQRADpU+hpTa90m9rm5
         BDCw==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: =?ISO-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>, Michael Cree <mcree@orcon.net.nz>, linux-alpha <linux-alpha@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Hi Linus,
Please pull from the for-linus branch of my alpha tree.

This pull adds the implementations of some Tru64 syscalls which allow
some proprietary software such as the C compiler to work on Linux.
Also, it adds some big-endian ioread functions to help us get closer
to building allyesconfig.

Thanks,
Matt

The following changes since commit f9369910a6225b8d4892c3f20ae740a711cd5ace:

  Merge branch 'for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal (2012-05-23
18:11:45 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git for-linus

Mans Rullgard (2):
      alpha: implement setsysinfo(SSI_LMF) as a no-op
      alpha: implement various OSF/1 stat syscalls

Michael Cree (1):
      alpha: add io{read,write}{16,32}be functions

 arch/alpha/include/asm/io.h      |    5 +
 arch/alpha/include/asm/sysinfo.h |    1 +
 arch/alpha/include/asm/unistd.h  |    6 ++
 arch/alpha/kernel/osf_sys.c      |  166 ++++++++++++++++++++++++++++++++++++++
 arch/alpha/kernel/systbls.S      |   10 +-
 5 files changed, 183 insertions(+), 5 deletions(-)

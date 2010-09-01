From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha-2.6.git
Date: Tue, 31 Aug 2010 21:49:36 -0400
Message-ID: <AANLkTi=vmbZqvkyB3JM8TQK1G=hBYZafhE31sVh930=k@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:from:date
         :message-id:subject:to:cc:content-type;
        bh=ovOXl6JhkbffvZTY9am0sp2UUSUmaDgxg2MemYyZxYA=;
        b=C3MsKm48tDMW6Loh877fG4aU7JBu+YFhZk3I+NoFJ3VrnR/P1L4Luyc9pByIfx/raJ
         8ACPLZtCzizDEoJ6MC4DDWQeuc3R9wwclGuv1jGhfqEmYqrXDCDDWvxXbsAiqr18HnGS
         oKfEDyR5FOdgEVz74/t97Tsy2oE8wgC4gmS04=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org

Hi Linus,
Please pull the for-linus branch of my alpha-2.6 tree. It contains a
few trivial changes and a regression/compile fix.

Thanks!
Matt Turner

The following changes since commit 2bfc96a127bc1cc94d26bfaa40159966064f9c8c:

  Linux 2.6.36-rc3 (2010-08-29 08:36:04 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.git for-linus

FUJITA Tomonori (1):
      alpha: remove homegrown L1_CACHE_ALIGN macro

Michael Cree (1):
      alpha: convert perf_event to use local_t

Morten H. Larsen (1):
      Fix call to replaced SuperIO functions

 arch/alpha/include/asm/cache.h    |    1 -
 arch/alpha/kernel/perf_event.c    |   18 +++++++++---------
 arch/alpha/kernel/proto.h         |    3 ---
 arch/alpha/kernel/sys_cabriolet.c |   19 ++++++++++++++++---
 arch/alpha/kernel/sys_takara.c    |   11 +++++++++--
 5 files changed, 34 insertions(+), 18 deletions(-)

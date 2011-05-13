From: Matt Turner <mattst88@gmail.com>
Subject: [PULL] alpha-2.6.git
Date: Fri, 13 May 2011 19:42:58 -0400
Message-ID: <BANLkTimc+QU5G1-QsnP7z_RFQp_mHVcxBw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:from:date:message-id:subject:to:cc
         :content-type;
        bh=VYSQ7gUWQK+3NWluS5tnbJhu04x647zFKeLrYY0QsT0=;
        b=n0KwCDxFKtIqz1+LP92JKf8U4R03f+YuGbJrxSIXRzrhoSilduPf3Gzi5rKAeZQSVS
         Ao9VqVx3IdIpLhbM7hDoHl0PpO8z5cta+WD4dgpNOj0PfyLdMbk8jNx8E/HZ2WqeLyU+
         jbQksfuqfwDu291X7/THyXCqWhuGBwQd9UfFo=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org

Hi Linus,
Please pull a pair of changes from my tree.

Thanks,
Matt

The following changes since commit 446cc6345d3de6571bdd0840f48aca441488a28d:

  Merge branch 'for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs (2011-05-12
18:00:09 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.git for-linus

John Stultz (1):
      alpha: convert to clocksource_register_hz

Michael Cree (1):
      alpha: Wire up syscalls new to 2.6.39

 arch/alpha/include/asm/unistd.h |    6 +++++-
 arch/alpha/kernel/systbls.S     |   12 ++++++++----
 arch/alpha/kernel/time.c        |    3 +--
 3 files changed, 14 insertions(+), 7 deletions(-)

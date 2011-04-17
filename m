From: Richard Henderson <rth@twiddle.net>
Subject: [PATCH 0/4][PULL] Alpha fixes
Date: Sun, 17 Apr 2011 13:05:22 -0700
Message-ID: <1303070726-32155-1-git-send-email-rth@twiddle.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:from:to:cc:subject:date:message-id
         :x-mailer;
        bh=9ZxsS6RNxnPL+L8+oyQDQEu0GzvLBqlLVK4tZOFC1ig=;
        b=A3pr6O4sfUX3BynkmpH4/lm7MKjrEgr+37ZWf594J75//beOgDShG8r6owcH2OvmTl
         1T8DVqhkE1/bUuMLBsBPNcM5WV/JY81Npvfape2hGAgVcz3B3Qdm4/Jb2v7m7TzEHEbm
         YY8pKSdwAYo9gyMzofeErSjExBFxrh2pxnag8=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, mattst88@gmail.com, linux-alpha@vger.kernel.org

These patches are present in

  git://repo.or.cz/linux-2.6/rth.git for-linus

They fix compilation with gcc 4.6, a crash during bootup, and a
hang during bootup.


r~


Richard Henderson (4):
  alpha: Don't force -Werror.
  alpha: Remove set but unused variables.
  alpha: Fix RTC interrupt setup.
  alpha: Fix uninitialized value in read_persistent_clock.

 arch/alpha/kernel/Makefile       |    2 +-
 arch/alpha/kernel/core_mcpcia.c  |   12 +++++-------
 arch/alpha/kernel/err_titan.c    |    4 +---
 arch/alpha/kernel/irq_alpha.c    |    2 +-
 arch/alpha/kernel/setup.c        |    6 +++---
 arch/alpha/kernel/smc37c93x.c    |    3 +--
 arch/alpha/kernel/sys_wildfire.c |    5 +++--
 arch/alpha/kernel/time.c         |    1 +
 8 files changed, 16 insertions(+), 19 deletions(-)

-- 
1.7.4.2


From: Richard Henderson <rth@twiddle.net>
Subject: [PATCH 0/3] Updates for Alpha
Date: Fri, 23 Jun 2017 14:19:58 -0700
Message-ID: <20170623212001.2785-1-rth@twiddle.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=KQUgZ+bMYSQLvKnnVp3nUCNq1FQomZqGK1jBNvHOwss=;
        b=gW1TDAIRBge+/jAYlq2u/h3QWGcuv8C7uM4W6qH63JiJFx2bXyoKCG4b4OTvsqjlqF
         LctPdI1xB/grQAXkzuO7fbjTZr47E0ZSO9PLWYM4l69HKA3zioT+VnG56xsiWyIQ2O/n
         QOUk7yhAx3oEe/QpmZ8VPA9B7TXs5Ogr38u0wKYoX4D/y+JBmew08Rw/L1IF+1N+FCNr
         Aj0vU7l/H3un+1TRyhrOG+un78wCrHlmzndEyG1I3muRq6entRvSjBN3dozaeIUv58Qz
         VDyKdN6XMOJC1iRLNnEvNxpeiGsG5R8hXtmnRLDXb/uWdJ9JgxIDdFSAren7pQ9eod7S
         kBCw==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org

(1) Wire up the new syscalls.
(2) Fix a build error causing ld to report out-of-range branches.
(3) Fix a build error for the EV6 assembler.

Suggestions on a better way to implement the second patch within
the Kbuild infrastructure are welcomed.


r~


Richard Henderson (3):
  alpha: Update for new syscalls
  alpha: Package string routines together
  alpha: Fix typo in ev6-copy_user.S

 arch/alpha/include/asm/unistd.h      |  2 +-
 arch/alpha/include/uapi/asm/unistd.h | 14 ++++++++++++++
 arch/alpha/kernel/systbls.S          |  9 +++++++++
 arch/alpha/lib/Makefile              | 22 ++++++++++++++++------
 arch/alpha/lib/copy_user.S           |  2 +-
 arch/alpha/lib/ev6-copy_user.S       |  7 ++++---
 6 files changed, 45 insertions(+), 11 deletions(-)

-- 
2.9.4


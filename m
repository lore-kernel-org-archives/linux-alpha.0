From: Richard Henderson <rth@twiddle.net>
Subject: [PATCH 1/4] alpha: Don't force -Werror.
Date: Sun, 17 Apr 2011 13:05:23 -0700
Message-ID: <1303070726-32155-2-git-send-email-rth@twiddle.net>
References: <1303070726-32155-1-git-send-email-rth@twiddle.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:sender:from:to:cc:subject:date:message-id
         :x-mailer:in-reply-to:references;
        bh=RVQM24jaufL3IZDqh2EQIcBTnqtlxq8wYvmfVrXH0BE=;
        b=TmYwQVdNgflPFzgAZPJ4jlgjNaWZdgvpjHomowO4KMMWFKHNX0LbUyUV6ZmTmLkrgT
         n9NxbmWgjwEdrPa4t901almfcDnLvSO6jCenMqNyCPzLz+C0yPtwf2Db+xihVgyAdkSg
         RCVN0EECrxot57LI82hpzzOSZ3YSP2P7u6qiU=
In-Reply-To: <1303070726-32155-1-git-send-email-rth@twiddle.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: torvalds@linux-foundation.org, mattst88@gmail.com, linux-alpha@vger.kernel.org

There are outstanding gcc 4.6 warnings that need to be cleaned up
in the subdirectory.  No sense forcing the issue immediately.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/alpha/kernel/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index 9bb7b85..7a6d908 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -4,7 +4,7 @@
 
 extra-y		:= head.o vmlinux.lds
 asflags-y	:= $(KBUILD_CFLAGS)
-ccflags-y	:= -Werror -Wno-sign-compare
+ccflags-y	:= -Wno-sign-compare
 
 obj-y    := entry.o traps.o process.o init_task.o osf_sys.o irq.o \
 	    irq_alpha.o signal.o setup.o ptrace.o time.o \
-- 
1.7.4.2


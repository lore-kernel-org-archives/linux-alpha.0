From: Huang Weiyi <weiyi.huang@gmail.com>
Subject: [PATCH 4/4] alpha: remove duplicated #include
Date: Sun, 27 Sep 2009 11:16:47 +0800
Message-ID: <1254021407-3404-1-git-send-email-weiyi.huang@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=OOtJK6vGAuwpFtRtMRpuS5ia5UGLDfjL2MPM9wNJT0E=;
        b=KH9A/b6gHW8wI5zomyraobfZXke44h3UxeqjGjkER+8JME5FX9Ww08LiPzCbYOYrYd
         OFypimG/EQP/LdBKkEsHvftBKIswlrUCr1Xv4+OVwYFXpOMMwv7KKKG5g+DI5SBHYAT7
         0wpzvlL8gItPts05hOTX3ORzupju6pS9IxguQ=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: linux-alpha@vger.kernel.org, Huang Weiyi <weiyi.huang@gmail.com>

Remove duplicated #include('s) in
  arch/alpha/kernel/vmlinux.lds.S

Signed-off-by: Huang Weiyi <weiyi.huang@gmail.com>
---
 arch/alpha/kernel/vmlinux.lds.S |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/kernel/vmlinux.lds.S b/arch/alpha/kernel/vmlinux.lds.S
index ecf4d48..003ef4c 100644
--- a/arch/alpha/kernel/vmlinux.lds.S
+++ b/arch/alpha/kernel/vmlinux.lds.S
@@ -1,7 +1,6 @@
 #include <asm-generic/vmlinux.lds.h>
 #include <asm/thread_info.h>
 #include <asm/page.h>
-#include <asm/thread_info.h>
 
 OUTPUT_FORMAT("elf64-alpha")
 OUTPUT_ARCH(alpha)
-- 
1.6.1.3


From: "Raphael S.Carvalho" <raphael.scarv@gmail.com>
Subject: [PATCH 1/1] arch/alpha/include/asm: Comment fixed.
Date: Mon, 10 Dec 2012 22:11:12 -0200
Message-ID: <1355184672-22268-1-git-send-email-raphael.scarv@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:x-mailer;
        bh=rqxRA9o0NZnseDmBbf6fFJpE3o4D0H+yPR2eCW0SWRc=;
        b=eZ4ELY0AVBJYvmTV33adTkBgDReynwFU8662qhVoWdjF4QwFqNw4IAAGG1dywJALeU
         R/GsDC3BaB+xCDaWG2gTg1Hbf2zPwN0G8y5R+tv1uLfsqHcMi3wPq7Z7JC0XdLvUvgth
         udJhcLvNOf9cnfer59XL+ln4AUglrXn3ndbhbfY+9DFmxk4eZQ9j+pl8aB9nYzdVD3tX
         yIWtzMklJ1GHLaSe019CZWZMJTvm5RtFLXNJXD8HuHylDx/IicUiE5/UjCYG2fQDhS+J
         oIq+47D2zGinLjqzetjKiDx/omj/Tfc1SUVErEUl0sxojEDR08Cbmt79RTFK0yeEI14U
         XbPg==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Michael Cree <mcree@orcon.net.nz>, Al Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Raphael S Carvalho <raphael.scarv@gmail.com>

From: Raphael S Carvalho <raphael.scarv@gmail.com>

I know how much this patch is insignificant, though its
purpose is to teach me how to send patches properly.

Signed-off-by: Raphael S Carvalho <raphael.scarv@gmail.com>
---
 arch/alpha/include/asm/ptrace.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptrace.h
index b87755a..34b88ae 100644
--- a/arch/alpha/include/asm/ptrace.h
+++ b/arch/alpha/include/asm/ptrace.h
@@ -7,8 +7,8 @@
  * kernel stack during a system call or other kernel entry
  *
  * NOTE! I want to minimize the overhead of system calls, so this
- * struct has as little information as possible.  I does not have
- *
+ * struct has as little information as possible.
+ * It does not have:
  *  - floating point regs: the kernel doesn't change those
  *  - r9-15: saved by the C compiler
  *
-- 
1.7.2.5

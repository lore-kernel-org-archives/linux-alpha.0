From: Daniel Bristot de Oliveira <bristot@redhat.com>
Subject: [PATCH] alpha: Fix a typo on ptrace.h
Date: Tue, 25 Sep 2018 20:31:48 +0200
Message-ID: <60a1ebdc46fb3c8317c43446b1e050ce126c61cd.1537899770.git.bristot@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas Gleixner <tglx@linutronix.de>

 - struct has as little information as possible. * I does not have*
 + struct has as little information as possible. *It does not have*

Signed-off-by: Daniel Bristot de Oliveira <bristot@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/alpha/include/uapi/asm/ptrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/include/uapi/asm/ptrace.h b/arch/alpha/include/uapi/asm/ptrace.h
index 1dfd065e45b1..c29194181025 100644
--- a/arch/alpha/include/uapi/asm/ptrace.h
+++ b/arch/alpha/include/uapi/asm/ptrace.h
@@ -8,7 +8,7 @@
  * kernel stack during a system call or other kernel entry
  *
  * NOTE! I want to minimize the overhead of system calls, so this
- * struct has as little information as possible.  I does not have
+ * struct has as little information as possible. It does not have
  *
  *  - floating point regs: the kernel doesn't change those
  *  - r9-15: saved by the C compiler
-- 
2.17.1


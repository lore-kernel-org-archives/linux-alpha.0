From: Davidlohr Bueso <dave@stgolabs.net>
Subject: [PATCH] alpha: use generic current.h
Date: Tue, 27 Dec 2016 19:43:46 -0800
Message-ID: <1482896626-25243-1-git-send-email-dave@stgolabs.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Davidlohr Bueso <dave@stgolabs.net>, Davidlohr Bueso <dbueso@suse.de>

Given that the arch does not add its own implementations, simply
use the asm-generic/current.h (generic-y) header instead of
duplicating code.

Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
---
 arch/alpha/include/asm/Kbuild    | 1 +
 arch/alpha/include/asm/current.h | 9 ---------
 2 files changed, 1 insertion(+), 9 deletions(-)
 delete mode 100644 arch/alpha/include/asm/current.h

diff --git a/arch/alpha/include/asm/Kbuild b/arch/alpha/include/asm/Kbuild
index bf8475ce85ee..4c5468b03e45 100644
--- a/arch/alpha/include/asm/Kbuild
+++ b/arch/alpha/include/asm/Kbuild
@@ -10,3 +10,4 @@ generic-y += mm-arch-hooks.h
 generic-y += preempt.h
 generic-y += sections.h
 generic-y += trace_clock.h
+generic-y += current.h
diff --git a/arch/alpha/include/asm/current.h b/arch/alpha/include/asm/current.h
deleted file mode 100644
index 094d285a1b34..000000000000
--- a/arch/alpha/include/asm/current.h
+++ /dev/null
@@ -1,9 +0,0 @@
-#ifndef _ALPHA_CURRENT_H
-#define _ALPHA_CURRENT_H
-
-#include <linux/thread_info.h>
-
-#define get_current()	(current_thread_info()->task)
-#define current		get_current()
-
-#endif /* _ALPHA_CURRENT_H */
-- 
2.6.6


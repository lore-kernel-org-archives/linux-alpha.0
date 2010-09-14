From: Tejun Heo <tj@kernel.org>
Subject: [PATCH] alpha: fix build breakage in asm/cacheflush.h
Date: Tue, 14 Sep 2010 11:00:22 +0200
Message-ID: <4C8F39A6.10504@kernel.org>
References: <20100914002132.bf17c19e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20100914002132.bf17c19e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Alpha SMP flush_icache_user_range() is implemented as an inline
function inside include/asm/cacheflush.h.  It dereferences @current
but doesn't include linux/sched.h and thus causes build failure if
linux/sched.h wasn't included previously.  Fix it by including the
needed header file explicitly.

Signed-off-by: Tejun Heo <tj@kernel.org>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/alpha/include/asm/cacheflush.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/alpha/include/asm/cacheflush.h b/arch/alpha/include/asm/cacheflush.h
index 01d71e1..012f124 100644
--- a/arch/alpha/include/asm/cacheflush.h
+++ b/arch/alpha/include/asm/cacheflush.h
@@ -43,6 +43,8 @@ extern void smp_imb(void);
 /* ??? Ought to use this in arch/alpha/kernel/signal.c too.  */

 #ifndef CONFIG_SMP
+#include <linux/sched.h>
+
 extern void __load_new_mm_context(struct mm_struct *);
 static inline void
 flush_icache_user_range(struct vm_area_struct *vma, struct page *page,

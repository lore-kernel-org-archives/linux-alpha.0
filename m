From: Daniele Calore <orkaan@orkaan.org>
Subject: [PATCH 2.6.32-rc4] alpha: fix build after vmlinux.lds.S cleanup
 (really)
Date: Thu, 15 Oct 2009 14:04:08 +0200
Message-ID: <20091015140408.21e901b1@buddha>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, ink@jurassic.park.msu.ru
Cc: orkaan@orkaan.org

Fix Build error on alpha:
arch/alpha/kernel/vmlinux.lds:235: undefined symbol `THREAD_SIZE' referenced in expression
make: *** [.tmp_vmlinux1] Error 1

THREAD_SIZE is defined under: "asm/thread_info.h", but
inside an "#ifndef __ASSEMBLY__" directive.
To solve the build, just move the define outside the #ifndef.

Signed-off-by: Daniele Calore <orkaan@orkaan.org>

---
diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index 5076a88..e7a07f6 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -50,12 +50,12 @@ struct thread_info {
 register struct thread_info *__current_thread_info __asm__("$8");
 #define current_thread_info()  __current_thread_info
 
+#endif /* !__ASSEMBLY__ */
+
 /* Thread information allocation.  */
 #define THREAD_SIZE_ORDER 1
 #define THREAD_SIZE (2*PAGE_SIZE)
 
-#endif /* __ASSEMBLY__ */
-
 #define PREEMPT_ACTIVE		0x40000000
 
 /*


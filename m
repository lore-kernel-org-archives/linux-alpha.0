From: Shea Levy <shea@shealevy.com>
Subject: [PATCH v4 03/16] alpha: Use generic free_initrd_mem.
Date: Wed, 28 Mar 2018 16:36:46 -0400
Message-ID: <20180328203659.18692-4-shea@shealevy.com>
References: <20180328152714.6103-1-shea@shealevy.com>
 <20180328203659.18692-1-shea@shealevy.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180328203659.18692-1-shea@shealevy.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Shea Levy <shea@shealevy.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Philippe Ombredanne <pombredanne@nexb.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>, linux-alpha@vger.kernel.org

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/alpha/mm/init.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index 9d74520298ab..55f7c8efa962 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -291,11 +291,3 @@ free_initmem(void)
 {
 	free_initmem_default(-1);
 }
-
-#ifdef CONFIG_BLK_DEV_INITRD
-void
-free_initrd_mem(unsigned long start, unsigned long end)
-{
-	free_reserved_area((void *)start, (void *)end, -1, "initrd");
-}
-#endif
-- 
2.16.2


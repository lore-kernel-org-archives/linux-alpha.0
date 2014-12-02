From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: [PATCH] arch: alpha: kernel: core_lca.c:  Cleaning up functions that are not used anywhere
Date: Tue,  2 Dec 2014 22:56:44 +0100
Message-ID: <1417557404-26268-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Removes some functions that are not used anywhere.
lca_clock_print() lca_get_clock() lca_clock_fiddle()

This was partially found by using a static code analysis program called cppcheck.

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 arch/alpha/kernel/core_lca.c |   43 ------------------------------------------
 1 file changed, 43 deletions(-)

diff --git a/arch/alpha/kernel/core_lca.c b/arch/alpha/kernel/core_lca.c
index cb2801c..b7ab44b 100644
--- a/arch/alpha/kernel/core_lca.c
+++ b/arch/alpha/kernel/core_lca.c
@@ -470,46 +470,3 @@ lca_machine_check(unsigned long vector, unsigned long la_ptr)
 #endif /* CONFIG_VERBOSE_MCHECK */
 }
 
-/*
- * The following routines are needed to support the SPEED changing
- * necessary to successfully manage the thermal problem on the AlphaBook1.
- */
-
-void
-lca_clock_print(void)
-{
-        long    pmr_reg;
-
-        pmr_reg = LCA_READ_PMR;
-
-        printk("Status of clock control:\n");
-        printk("\tPrimary clock divisor\t0x%lx\n", LCA_GET_PRIMARY(pmr_reg));
-        printk("\tOverride clock divisor\t0x%lx\n", LCA_GET_OVERRIDE(pmr_reg));
-        printk("\tInterrupt override is %s\n",
-	       (pmr_reg & LCA_PMR_INTO) ? "on" : "off"); 
-        printk("\tDMA override is %s\n",
-	       (pmr_reg & LCA_PMR_DMAO) ? "on" : "off"); 
-
-}
-
-int
-lca_get_clock(void)
-{
-        long    pmr_reg;
-
-        pmr_reg = LCA_READ_PMR;
-        return(LCA_GET_PRIMARY(pmr_reg));
-
-}
-
-void
-lca_clock_fiddle(int divisor)
-{
-        long    pmr_reg;
-
-        pmr_reg = LCA_READ_PMR;
-        LCA_SET_PRIMARY_CLOCK(pmr_reg, divisor);
-	/* lca_norm_clock = divisor; */
-        LCA_WRITE_PMR(pmr_reg);
-        mb();
-}
-- 
1.7.10.4

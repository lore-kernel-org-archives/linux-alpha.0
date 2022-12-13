From: Li zeming <zeming@nfschina.com>
Subject: [PATCH] kernel: smp: Remove unnecessary (void*) conversions
Date: Tue, 13 Dec 2022 15:45:22 +0800
Message-ID: <20221213074522.3738-1-zeming@nfschina.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, akpm@linux-foundation.org
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Li zeming <zeming@nfschina.com>

The void * type pointer does not need to be cast and assigned to another
pointer.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 arch/alpha/kernel/smp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/kernel/smp.c b/arch/alpha/kernel/smp.c
index f4e20f75438f..0ede4b044e86 100644
--- a/arch/alpha/kernel/smp.c
+++ b/arch/alpha/kernel/smp.c
@@ -628,7 +628,7 @@ flush_tlb_all(void)
 static void
 ipi_flush_tlb_mm(void *x)
 {
-	struct mm_struct *mm = (struct mm_struct *) x;
+	struct mm_struct *mm = x;
 	if (mm == current->active_mm && !asn_locked())
 		flush_tlb_current(mm);
 	else
@@ -670,7 +670,7 @@ struct flush_tlb_page_struct {
 static void
 ipi_flush_tlb_page(void *x)
 {
-	struct flush_tlb_page_struct *data = (struct flush_tlb_page_struct *)x;
+	struct flush_tlb_page_struct *data = x;
 	struct mm_struct * mm = data->mm;
 
 	if (mm == current->active_mm && !asn_locked())
-- 
2.18.2


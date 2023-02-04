From: rj1 <rj1@riseup.net>
Subject: [PATCH] fixed a typo in core_cia.c
Date: Fri,  3 Feb 2023 18:47:03 -0600
Message-ID: <20230204004702.692906-1-rj1@riseup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1675471695; bh=7btSdxXVlZAq3kfePEmWPlI5siaO9G/Y4NnLytVPLOk=;
        h=From:To:Cc:Subject:Date:From;
        b=JRZdRsgPi0/jG+LyDoVk+SkdmI2g0yo5vpQzRMlM8wJBN7N9ntPM0nCqXRinPY+vE
         RonuEkvkhpkGuNzp1za+JDin0owLSameKka9y/RNf/a8VbFb9cOaca3BdU1VCOiQr6
         e0/gHTE6vWQTTJbLy16uAyfSV/lAMbxZDGQDv+Ng=
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org
Cc: richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, rj1 <rj1@riseup.net>

---
 arch/alpha/kernel/core_cia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/core_cia.c b/arch/alpha/kernel/core_cia.c
index f489170201c3..12926e9538b8 100644
--- a/arch/alpha/kernel/core_cia.c
+++ b/arch/alpha/kernel/core_cia.c
@@ -527,7 +527,7 @@ verify_tb_operation(void)
 	if (use_tbia_try2) {
 		alpha_mv.mv_pci_tbi = cia_pci_tbi_try2;
 
-		/* Tags 0-3 must be disabled if we use this workaraund. */
+		/* Tags 0-3 must be disabled if we use this workaround. */
 		wmb();
 		*(vip)CIA_IOC_TB_TAGn(0) = 2;
 		*(vip)CIA_IOC_TB_TAGn(1) = 2;
-- 
2.39.1


From: mattst88@gmail.com
Subject: [PATCH] alpha: fix compile error from IRQ clean up
Date: Wed,  9 Mar 2011 11:15:13 -0500
Message-ID: <1299687313-13363-1-git-send-email-mattst88@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
        bh=x9KBcpmmyPNc6M7OFrTkkHaTsyWj9h73HkoXj1eiYso=;
        b=HfbffCQ1N6g6DwNpBtCUKrlxpri7mYvod/QVLP3TwLc5GPTkFHZwKGiTbMpwqPxbMm
         9FtHkNTKgbTTuVwawS/q0ptEmXsF3mCuVprp6ykNPeIffTHlPjcBiOQC3Jo5sc3i4Yjl
         oRqKjUmT7ktpGVVFyJWdPAyvJ9slpGH8AmkkI=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, Matt Turner <mattst88@gmail.com>

From: Matt Turner <mattst88@gmail.com>

---
 arch/alpha/kernel/sys_titan.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/alpha/kernel/sys_titan.c b/arch/alpha/kernel/sys_titan.c
index f6c108a..8c13a0c 100644
--- a/arch/alpha/kernel/sys_titan.c
+++ b/arch/alpha/kernel/sys_titan.c
@@ -149,6 +149,7 @@ static int
 titan_set_irq_affinity(struct irq_data *d, const struct cpumask *affinity,
 		       bool force)
 { 
+	unsigned int irq = d->irq;
 	spin_lock(&titan_irq_lock);
 	titan_cpu_set_irq_affinity(irq - 16, *affinity);
 	titan_update_irq_hw(titan_cached_irq_mask);
-- 
1.7.3.4


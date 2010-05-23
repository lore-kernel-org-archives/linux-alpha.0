From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 117/199] arch/alpha/lib/ev6-divide.S: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:11 +0200
Message-ID: <1274644466-24577-9-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=L+okxrc4YGAFtfhC8dYh5GA98J/YE3S3vZVejXyasUU=;
        b=sF5fkpFhpK4jfq2sEDOLfZKFEuWorF8EZYiStenL+/sJxU4CajlDIfoYCi2NV13GYr
         EiV6YIHdZbfTvlaa1T8TI/gyHOCXjA5IUz8av4e0wNA0NdDIUcsBeE7B3lNDba+Zexua
         y2cuJpv7+WVuo7pCFJJXrgif1YtlOMY6CBEDw=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/lib/ev6-divide.S:22: ERROR: trailing whitespace

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/lib/ev6-divide.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/lib/ev6-divide.S b/arch/alpha/lib/ev6-divide.S
index 2a82b9b..73507cc 100644
--- a/arch/alpha/lib/ev6-divide.S
+++ b/arch/alpha/lib/ev6-divide.S
@@ -19,7 +19,7 @@
  * These are not normal C functions: instead of the normal
  * calling sequence, these expect their arguments in registers
  * $24 and $25, and return the result in $27. Register $28 may
- * be clobbered (assembly temporary), anything else must be saved. 
+ * be clobbered (assembly temporary), anything else must be saved.
  *
  * In short: painful.
  *
-- 
1.7.1.251.gf80a2


From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 125/199] arch/alpha/lib/srm_puts.c: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:19 +0200
Message-ID: <1274644466-24577-17-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=YUH6Zc12ZtdRIW/4oO+DIpreVBvagFu7A4eivqUymmI=;
        b=WA8+ZwNzjwZqai0lJCkqLB2llQ0EKGcac3ClSUJtvn+t1jzABPxBybZV/orR6qTqjB
         W214TBhCMoqgNFG7r/3WD95aG0vVcpy8oWtQ+1XuVhVaFvyZfpKqCh31nO5ZqBDcUx5J
         yC7fR2q5o80PuAm4SA0roCMEoErDu7EGenou8=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/lib/srm_puts.c:16: ERROR: that open brace { should be on the previous line

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/lib/srm_puts.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/lib/srm_puts.c b/arch/alpha/lib/srm_puts.c
index 7b60a6f..abb365f 100644
--- a/arch/alpha/lib/srm_puts.c
+++ b/arch/alpha/lib/srm_puts.c
@@ -13,8 +13,7 @@ srm_puts(const char *str, long len)
 	if (!callback_init_done)
 		return len;
 
-	for (remaining = len; remaining > 0; remaining -= written)
-	{
+	for (remaining = len; remaining > 0; remaining -= written) {
 		written = callback_puts(0, str, remaining);
 		written &= 0xffffffff;
 		str += written;
-- 
1.7.1.251.gf80a2


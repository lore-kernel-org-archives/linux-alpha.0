From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 120/199] arch/alpha/lib/ev67-strlen_user.S: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:14 +0200
Message-ID: <1274644466-24577-12-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=7qvLwvj0TT02eQlkogQ4NhiLXVyN6HGKNfEkTGc9BdE=;
        b=rwXB41StKkTK3B6FTR/ZVns7TPtQq2HqzGT0fO4AXpA1NLdX+hw15XDhyT/K/VL8DR
         KrA8tHQlXSRf/xTA6IsLYCsgPap1/JasHrW1wplLLb6PmSk5r4sLYQj1qbRhD3Pgp44K
         UCdFP93a1AYcc2trX9agTsMiL2bbTcUrh+VhA=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/lib/ev67-strlen_user.S:66: ERROR: trailing whitespace

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/lib/ev67-strlen_user.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/lib/ev67-strlen_user.S b/arch/alpha/lib/ev67-strlen_user.S
index 57e0d77..f07f41a 100644
--- a/arch/alpha/lib/ev67-strlen_user.S
+++ b/arch/alpha/lib/ev67-strlen_user.S
@@ -63,7 +63,7 @@ __strnlen_user:
 	insqh   t1, a0, t1	# U :
 	andnot  a0, 7, v0	# E :
 	or      t1, t0, t0	# E :
-	subq	a0, 1, a0	# E : get our +1 for the return 
+	subq	a0, 1, a0	# E : get our +1 for the return
 
 	cmpbge  zero, t0, t1	# E : t1 <- bitmask: bit i == 1 <==> i-th byte == 0
 	subq	a1, 7, t2	# E :
-- 
1.7.1.251.gf80a2


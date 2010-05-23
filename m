From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 127/199] arch/alpha/lib/strlen_user.S: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:21 +0200
Message-ID: <1274644466-24577-19-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=W0kp5h9FVVb2hqJxhJO7UNQfXremrrFrXRERUOsA4No=;
        b=AdLHwsspjD71K1LxgBUc4dpK40JQYoduyDNHTLXmImLgro4EPfbEYFd2cMF+ogAryf
         uivzvyIC6IBN4zFbQbetzHV7gtCtMeUFqCC2/M/k8+Ml81cpEOXmGDM14X0kO1h+6CO1
         jmHi7L4Hk9vMm0rF3bgMI1KBQpaa1bMXF/xkw=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/lib/strlen_user.S:52: ERROR: trailing whitespace

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/lib/strlen_user.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/lib/strlen_user.S b/arch/alpha/lib/strlen_user.S
index 508a18e..133e4a1 100644
--- a/arch/alpha/lib/strlen_user.S
+++ b/arch/alpha/lib/strlen_user.S
@@ -49,7 +49,7 @@ __strnlen_user:
 	insqh   t1, a0, t1
 	andnot  a0, 7, v0
 	or      t1, t0, t0
-	subq	a0, 1, a0	# get our +1 for the return 
+	subq	a0, 1, a0	# get our +1 for the return
 	cmpbge  zero, t0, t1	# t1 <- bitmask: bit i == 1 <==> i-th byte == 0
 	subq	a1, 7, t2
 	subq	a0, v0, t0
-- 
1.7.1.251.gf80a2


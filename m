From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 022/199] arch/alpha/lib/copy_user.S: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:06 +0200
Message-ID: <1274644466-24577-4-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=SA/KFSNcrWSpKt8kPoISlBaPWGacjC/WNPCQt+pTPOk=;
        b=lOc/0Qvcly15RhzDyOwPesnSntrgXO7o2Q5+OoILYgDVPV6AJ1MSl3OJvN4KBH+v3X
         OtGtGXFGnA0500SLRdjYUp9SmbE0WTTFuQA9R5+g4ULTTCpJTMFsZO8yBAX6GC0Bj4XW
         aXmHlWQdZ0cKOSPLLGyh6CrBXdUQPCyro2dfI=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/lib/copy_user.S:132: ERROR: trailing whitespace

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/lib/copy_user.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/lib/copy_user.S b/arch/alpha/lib/copy_user.S
index 6f3fab9..8965993 100644
--- a/arch/alpha/lib/copy_user.S
+++ b/arch/alpha/lib/copy_user.S
@@ -129,7 +129,7 @@ $exitout:
 
 $exitin:
 	/* A stupid byte-by-byte zeroing of the rest of the output
-	   buffer.  This cures security holes by never leaving 
+	   buffer.  This cures security holes by never leaving
 	   random kernel data around to be copied elsewhere.  */
 
 	mov $0,$1
-- 
1.7.1.251.gf80a2


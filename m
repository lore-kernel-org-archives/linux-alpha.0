From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 023/199] arch/alpha/lib/divide.S: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:07 +0200
Message-ID: <1274644466-24577-5-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=F/C51J2MIIxuhqGoXg4AcoaLmHAeZle4YDQbLNo/sA0=;
        b=Wvw5vtuZTAYhKbvSGvfEMMFdEmO8FMJJpxRKWZb9dswz7Ji9BntrFjDYheDIo18NUO
         Qp7I4bLvklSbX5pTPlAz6rddR1h5fIybqtd2jHcZKym0eUWW2j1/0a1UQ9BeSBj4Ng9+
         bKclPdhgcU7dd7JFH0Vq6wTWVHY95n/4e5DuM=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/lib/divide.S:22: ERROR: trailing whitespace

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/lib/divide.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/lib/divide.S b/arch/alpha/lib/divide.S
index 2d1a048..355438a 100644
--- a/arch/alpha/lib/divide.S
+++ b/arch/alpha/lib/divide.S
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


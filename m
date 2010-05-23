From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 119/199] arch/alpha/lib/ev6-strncpy_from_user.S: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:13 +0200
Message-ID: <1274644466-24577-11-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=7NC0DtBGg0BDGHKYZUXH1AIYaDyN1k+0TX9Z8FF1GPM=;
        b=MKZQgozrN8cKuQw+dJp8Y0gC329KsCpxTF9BoowYf1h105QJTpeMhVGQ74wsfgR5Yn
         /qKMAGzzibh1yuWeWjteOUnQXBIJpYH1C8yCSKU9fWHp65vxZ40BeIEFBmGYKiZ6YEVJ
         RSJonoMfS9M6CqygqUyOWHpR8NDvljwHc4UQE=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/lib/ev6-strncpy_from_user.S:136: ERROR: trailing whitespace

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/lib/ev6-strncpy_from_user.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/lib/ev6-strncpy_from_user.S b/arch/alpha/lib/ev6-strncpy_from_user.S
index d2e2817..09a626d 100644
--- a/arch/alpha/lib/ev6-strncpy_from_user.S
+++ b/arch/alpha/lib/ev6-strncpy_from_user.S
@@ -133,7 +133,7 @@ $a_loop:
 	 */
 $a_eos:
 	negq	t8, t12		# E : find low bit set
-	and	t8, t12, t12	# E : 
+	and	t8, t12, t12	# E :
 
 	/* We're doing a partial word store and so need to combine
 	   our source and original destination words.  */
-- 
1.7.1.251.gf80a2


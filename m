From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 118/199] arch/alpha/lib/ev6-memcpy.S: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:12 +0200
Message-ID: <1274644466-24577-10-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=zeCRqhvHJj8kuyacmmkZKZQoq5Pfh1J7T4ByWScV6+s=;
        b=r2Wn78mol/32H3xHZRJFKDQ8I9S63QF1Y6bzuagTKuFpB27yl8SxYGBhuraMHdySMO
         KJHBUTau673MG9POv1G/udc4opbwekjroJ8VZ99mXy7FoeF5pjiq4YIzQazI+Uw7tcXU
         JcFY8DnVOnwMryHfZvo9LPuy59/VxHInfCJTQ=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/lib/ev6-memcpy.S:81: ERROR: trailing whitespace

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/lib/ev6-memcpy.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/lib/ev6-memcpy.S b/arch/alpha/lib/ev6-memcpy.S
index 52b37b0..0a36d19 100644
--- a/arch/alpha/lib/ev6-memcpy.S
+++ b/arch/alpha/lib/ev6-memcpy.S
@@ -78,7 +78,7 @@ $do_unroll:
 	addq	$16, 64, $7		# E : Initial (+1 trip) wh64 address
 	cmple	$18, 127, $1		# E : Can we go through the unrolled loop?
 	bne	$1, $tail_quads		# U : Nope
-	nop				# E : 
+	nop				# E :
 
 $unroll_body:
 	wh64	($7)			# L1 : memory subsystem hint: 64 bytes at
-- 
1.7.1.251.gf80a2


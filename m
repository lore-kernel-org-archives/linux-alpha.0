From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 116/199] arch/alpha/lib/ev6-copy_user.S: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:10 +0200
Message-ID: <1274644466-24577-8-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=Og5nfu/LFIserEzjOgTd9EEeIShuAlFbryBCdPHUEVg=;
        b=c/nqTuSTv8ZdhdkOsZj3+WESV6vQGfTyFkv9/AJJwA+WJF2SuuniCjnECpABv361QH
         zNZEHed+4e5dJ+NoKfFLuE2chw/S1Haf9bVo+VDBg0ffCCwqt1a46SKEqjZZomnWgolh
         h67nxAkqCIuRPPWBfsdy6vLh075UJ2ghS0B4c=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/lib/ev6-copy_user.S:239: ERROR: trailing whitespace

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/lib/ev6-copy_user.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/lib/ev6-copy_user.S b/arch/alpha/lib/ev6-copy_user.S
index db42ffe..c976e9f 100644
--- a/arch/alpha/lib/ev6-copy_user.S
+++ b/arch/alpha/lib/ev6-copy_user.S
@@ -236,7 +236,7 @@ $exitout:			# Destination for exception recovery(?)
 $exitin:
 
 	/* A stupid byte-by-byte zeroing of the rest of the output
-	   buffer.  This cures security holes by never leaving 
+	   buffer.  This cures security holes by never leaving
 	   random kernel data around to be copied elsewhere.  */
 
 	nop
-- 
1.7.1.251.gf80a2


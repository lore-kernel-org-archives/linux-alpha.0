From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 114/199] arch/alpha/lib/ev6-clear_user.S: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:08 +0200
Message-ID: <1274644466-24577-6-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=VxmVRoUQVgYQ5cGrPbt0swW9v8B3JH6S4N0GjpzAINY=;
        b=lBJp0gVcYFZ+MMv8Xo0IpB5Q9lnMG9kW3BZz6G0ugFtBsdiXd6A+9vJocJPre8tOHq
         IYnQuB61oEWzAVHs+3qJkHPox876VavK59S08ys1HoGP+M34GeqyvQ3RtCnOU1cHxLhZ
         qi1dSGEnPlC7W0q4zaPDXWTkkYqehvU9glp7M=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/lib/ev6-clear_user.S:185: ERROR: trailing whitespace

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/lib/ev6-clear_user.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/lib/ev6-clear_user.S b/arch/alpha/lib/ev6-clear_user.S
index 4f42a16..52574c2 100644
--- a/arch/alpha/lib/ev6-clear_user.S
+++ b/arch/alpha/lib/ev6-clear_user.S
@@ -182,7 +182,7 @@ $do_wh64:
 $trailquad:
 	# zero to 16 quadwords left to store, plus any trailing bytes
 	# $1 is the number of quadwords left to go.
-	# 
+	#
 	nop			# .. .. .. E
 	nop			# .. .. E  ..
 	nop			# .. E  .. ..
-- 
1.7.1.251.gf80a2


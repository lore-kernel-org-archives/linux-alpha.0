From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 121/199] arch/alpha/lib/memchr.S: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:15 +0200
Message-ID: <1274644466-24577-13-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=Hzlv1ulAz0JhN+pasl91eoSmWD6M6hwJQmh/PTektsw=;
        b=nnVVca+1K++PNayjfBiJOkHxvYbGYTbLDkro9BvslNNQCC1HJ9HL+api7jbohf/hO+
         kP+eaICqUYdJd3g+pkCUGDilrO0jKx8zHPsEkBDqMei2EGgajG5Wwp2qEGiTPI0/csBp
         2WXk78rjVzCX6CDxW4+Qh7BIgJ3hgKW0K1BwY=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/lib/memchr.S:64: ERROR: trailing whitespace

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/lib/memchr.S |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/lib/memchr.S b/arch/alpha/lib/memchr.S
index 14427ee..04d3587 100644
--- a/arch/alpha/lib/memchr.S
+++ b/arch/alpha/lib/memchr.S
@@ -61,7 +61,7 @@ memchr:
 	unop			#	:
 	sll	$17, 32, $2	#-e0    : $2 = chchchch00000000
 	or	$2, $17, $17	# e1	: $17 = chchchchchchchch
-	extql	$1, $16, $7	# e0    : 
+	extql	$1, $16, $7	# e0    :
 	beq	$4, $first_quad	# .. e1 :
 
 	ldq_u	$6, -1($5)	#-e1	: eight or less bytes to search
-- 
1.7.1.251.gf80a2


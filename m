From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 131/199] arch/alpha/oprofile/op_model_ev6.c: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:25 +0200
Message-ID: <1274644466-24577-23-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=J0vXRK60ug1oR6nL9A9tubcqBgxJLsV4ccdHk8nhIog=;
        b=NGfV/SRhJogaWWkrEYLy6Cix3DOjMudlKrcWxv4xNqyv3gB76AlVaDFoeGKWOO8ZjK
         gpXduQw4lL/lRiNVIr+/OwBoS2fTvF5jslWV7AbAfaMGTqgvtcbZXjrK5hf05atTzBNd
         fg3xyoYIxfG0W54RR23vV1dOXd9eaEH5QHyLE=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Robert Richter <robert.richter@amd.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, oprofile-list@lists.sf.net, linux-alpha@vger.kernel.org

arch/alpha/oprofile/op_model_ev6.c:67: WARNING: space prohibited between function name and open parenthesis '('

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/oprofile/op_model_ev6.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/oprofile/op_model_ev6.c b/arch/alpha/oprofile/op_model_ev6.c
index 0869f85..7cf2c8c 100644
--- a/arch/alpha/oprofile/op_model_ev6.c
+++ b/arch/alpha/oprofile/op_model_ev6.c
@@ -64,7 +64,7 @@ ev6_reg_setup(struct op_register_config *reg,
 /* Program all of the registers in preparation for enabling profiling.  */
 
 static void
-ev6_cpu_setup (void *x)
+ev6_cpu_setup(void *x)
 {
 	struct op_register_config *reg = x;
 
-- 
1.7.1.251.gf80a2


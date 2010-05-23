From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 132/199] arch/alpha/oprofile/op_model_ev67.c: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:26 +0200
Message-ID: <1274644466-24577-24-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=2jRUnBdlRcL+Tk+blpxk6HRJxaNQPy8rob5g4BvgG7k=;
        b=qXoKlaKbnHiqjP4RK0rKW1Mt7A+/RYwBeboQPz9zC4rYj6AGHDLkbViT5hizLmLHeW
         o1Vfv39KZDjO0RubviIfYjc5YqAfF40eWDIXHYYgfEeQYXn9UksBZdumdE1OMnzCEJfT
         +SkgtFRmZ+0sQJnQNdxQiCNfm4ywSMJnYl4yk=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Robert Richter <robert.richter@amd.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, oprofile-list@lists.sf.net, linux-alpha@vger.kernel.org

arch/alpha/oprofile/op_model_ev67.c:72: WARNING: space prohibited between function name and open parenthesis '('

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/oprofile/op_model_ev67.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/alpha/oprofile/op_model_ev67.c b/arch/alpha/oprofile/op_model_ev67.c
index 7030208..1116800 100644
--- a/arch/alpha/oprofile/op_model_ev67.c
+++ b/arch/alpha/oprofile/op_model_ev67.c
@@ -69,7 +69,7 @@ ev67_reg_setup(struct op_register_config *reg,
 /* Program all of the registers in preparation for enabling profiling.  */
 
 static void
-ev67_cpu_setup (void *x)
+ev67_cpu_setup(void *x)
 {
 	struct op_register_config *reg = x;
 
-- 
1.7.1.251.gf80a2


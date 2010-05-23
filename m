From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 130/199] arch/alpha/oprofile/op_model_ev5.c: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:24 +0200
Message-ID: <1274644466-24577-22-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=7xAOV0YcRdpL6Qn7u+F8LSQ4zbozbzIcSuKqVFd72qk=;
        b=F0YHfS10eH7SVOYubJvb2jXnB5MLsh37Vh/W/daL95RF1+txHQvb0kV+ZN94E0Qk15
         ZzFBE0oYoxlCgmnk0ds6wOfayyXysvv9/fNL8ATwohGzXfUspKthpbVFtaBuNjxuqsqF
         lgSzRAzMYC0/IKOyomg4EzLCetL+wx3DWT2/g=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Robert Richter <robert.richter@amd.com>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, oprofile-list@lists.sf.net, linux-alpha@vger.kernel.org

arch/alpha/oprofile/op_model_ev5.c:127: ERROR: code indent should use tabs where possible
arch/alpha/oprofile/op_model_ev5.c:128: ERROR: code indent should use tabs where possible
arch/alpha/oprofile/op_model_ev5.c:136: WARNING: space prohibited between function name and open parenthesis '('
arch/alpha/oprofile/op_model_ev5.c:164: ERROR: code indent should use tabs where possible

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/oprofile/op_model_ev5.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/oprofile/op_model_ev5.c b/arch/alpha/oprofile/op_model_ev5.c
index ceea6e1..065abce 100644
--- a/arch/alpha/oprofile/op_model_ev5.c
+++ b/arch/alpha/oprofile/op_model_ev5.c
@@ -124,8 +124,8 @@ ev5_reg_setup(struct op_register_config *reg,
 
 static void
 pca56_reg_setup(struct op_register_config *reg,
-	        struct op_counter_config *ctr,
-	        struct op_system_config *sys)
+		struct op_counter_config *ctr,
+		struct op_system_config *sys)
 {
 	common_reg_setup(reg, ctr, sys, 8, 11);
 }
@@ -133,7 +133,7 @@ pca56_reg_setup(struct op_register_config *reg,
 /* Program all of the registers in preparation for enabling profiling.  */
 
 static void
-ev5_cpu_setup (void *x)
+ev5_cpu_setup(void *x)
 {
 	struct op_register_config *reg = x;
 
@@ -161,7 +161,7 @@ ev5_reset_ctr(struct op_register_config *reg, unsigned long ctr)
 	unsigned long values, mask, not_pk, reset_values;
 
 	mask = (ctr == 0 ? 0xfffful << 48
-	        : ctr == 1 ? 0xfffful << 32
+		: ctr == 1 ? 0xfffful << 32
 		: 0x3fff << 16);
 
 	not_pk = 1 << 9 | 1 << 8;
-- 
1.7.1.251.gf80a2


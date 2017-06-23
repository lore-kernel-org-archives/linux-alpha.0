From: Richard Henderson <rth@twiddle.net>
Subject: [PATCH 3/3] alpha: Fix typo in ev6-copy_user.S
Date: Fri, 23 Jun 2017 14:20:01 -0700
Message-ID: <20170623212001.2785-4-rth@twiddle.net>
References: <20170623212001.2785-1-rth@twiddle.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nXI+RmrsHj2EdeWjiHChME6yLcHmyeuVIh6CSZQGYlo=;
        b=Q007c7RzyxXOAUrZ54XHLItwXSANaxSEGBtcejTRhFphkeoI51YvYA9tTdRB4KLAVS
         u06pCA25V9UnCV7pEjW7dnM3FUfUFDsJx+k1lxKuxu/VhrNXF9skEbfdJT3hlf71puTI
         U00qcjJZRP4baWl+Xxl1wLa8we4FdNZeGLnG/hhA1ae1wVDzGAARxGUVRUBS9N5/IW2D
         ONpU1B1n6OIRds5b2w6PE9Pc9eNwlEazsfVOJQThI3WRWa9twuBhMg9j9Ou+jDHyn093
         6bok9QtPN9CT4v6BVFFF80RPagWNdSiQ3X6zUDqfqORy87ewjeykIyw7O92u5W1k9KRq
         e4og==
In-Reply-To: <20170623212001.2785-1-rth@twiddle.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-alpha@vger.kernel.org

Patch 8525023121de4848b5f0a7d867ffeadbc477774d introduced a typo.

That said, the identity AND insns added by that patch are more
clearly written as MOV.  At the same time, re-schedule the ev6
version so that the first dispatch can execute in parallel.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 arch/alpha/lib/copy_user.S     | 2 +-
 arch/alpha/lib/ev6-copy_user.S | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/lib/copy_user.S b/arch/alpha/lib/copy_user.S
index 159f1b7..c277a1a 100644
--- a/arch/alpha/lib/copy_user.S
+++ b/arch/alpha/lib/copy_user.S
@@ -34,7 +34,7 @@
 	.ent __copy_user
 __copy_user:
 	.prologue 0
-	and $18,$18,$0
+	mov $18,$0
 	and $16,7,$3
 	beq $0,$35
 	beq $3,$36
diff --git a/arch/alpha/lib/ev6-copy_user.S b/arch/alpha/lib/ev6-copy_user.S
index 35e6710..954ca03 100644
--- a/arch/alpha/lib/ev6-copy_user.S
+++ b/arch/alpha/lib/ev6-copy_user.S
@@ -45,9 +45,10 @@
 				# Pipeline info: Slotting & Comments
 __copy_user:
 	.prologue 0
-	andq $18, $18, $0
-	subq $18, 32, $1	# .. E  .. ..	: Is this going to be a small copy?
-	beq $0, $zerolength	# U  .. .. ..	: U L U L
+	mov $18, $0		# .. .. .. E
+	subq $18, 32, $1	# .. .. E. ..	: Is this going to be a small copy?
+	nop			# .. E  .. ..
+	beq $18, $zerolength	# U  .. .. ..	: U L U L
 
 	and $16,7,$3		# .. .. .. E	: is leading dest misalignment
 	ble $1, $onebyteloop	# .. .. U  ..	: 1st branch : small amount of data
-- 
2.9.4


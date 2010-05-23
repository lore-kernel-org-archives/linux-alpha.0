From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 115/199] arch/alpha/lib/ev6-copy_page.S: Checkpatch cleanup
Date: Sun, 23 May 2010 21:54:09 +0200
Message-ID: <1274644466-24577-7-git-send-email-andrea.gelmini@gelma.net>
References: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:sender:from:to:cc:subject
         :date:message-id:x-mailer:in-reply-to:references;
        bh=hwOo2jVjBx2UNk5EmBW2cNaecmBQpOFsJ9sm1uKSizo=;
        b=N+KfTPW9Z5yHZySNBeI2m7bO8DnSM7OEFiRQXq8rDxA17760u6Qqeue9HsCXh+zMKu
         6WAyNOHdUPIYMieEnsPc42lZjrx+x4Xlp7vKT6EDwGHjxwb1Jkp0ewUVx+sAL8/eVcNH
         zqdEJMBH/Dc9aESlwV+ypcQaIarMktSPxrKZw=
In-Reply-To: <1274644466-24577-1-git-send-email-andrea.gelmini@gelma.net>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

arch/alpha/lib/ev6-copy_page.S:10: ERROR: trailing whitespace
arch/alpha/lib/ev6-copy_page.S:30: ERROR: trailing whitespace
arch/alpha/lib/ev6-copy_page.S:130: ERROR: trailing whitespace

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/lib/ev6-copy_page.S |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/lib/ev6-copy_page.S b/arch/alpha/lib/ev6-copy_page.S
index b789db1..17c9a65 100644
--- a/arch/alpha/lib/ev6-copy_page.S
+++ b/arch/alpha/lib/ev6-copy_page.S
@@ -7,7 +7,7 @@
 /* The following comparison of this routine vs the normal copy_page.S
    was written by an unnamed ev6 hardware designer and forwarded to me
    via Steven Hobbs <hobbs@steven.zko.dec.com>.
- 
+
    First Problem: STQ overflows.
    -----------------------------
 
@@ -27,7 +27,7 @@
 	9 cycles but I was not able to get it to run that fast -- the initial
 	conditions were such that I could not reach this optimum rate on
 	(chaotic) EV6.  I wrote the code such that everything would issue
-	in order. 
+	in order.
 
    Second Problem: Dcache index matches.
    -------------------------------------
@@ -127,7 +127,7 @@ copy_page:
 	unop
 
 	/* This gives the extra cycle of aeration above the minimum.  */
-	unop			
+	unop
 	unop
 	unop
 	unop
-- 
1.7.1.251.gf80a2


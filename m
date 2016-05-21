From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0062/1529] Fix typo
Date: Sat, 21 May 2016 13:45:06 +0200
Message-ID: <20160521114506.2289-1-andrea.gelmini@gelma.net>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id;
        bh=fBffNiDkjNudr1jaxnY+IXDQoMFye9kRMyHt2/JhpHo=;
        b=wkWvm4R+93NQSjENyPURMv/6/5SR+k96cSFWFbAtnhATN06zSHYMZDJLH4sHUSLh7L
         8fXDNnW2w+O08MeAxHKq+f5kIAh8oBAyInm2bxmUzuX81B7yEYCoACTeiqmA6/z1Fggc
         S9GRo4txawdOCwZgGvL/Im8WCgJVYQOAoTIQee7jvexwQ2Um8oP063B5Aka3cHgB/ruy
         AjWFnovIm8HY5sUK4qaem45WT9Ts6boJQ03VS425yzkA0lVPOuWY5iSUPB6NwVx4ujh+
         Jzjb2H9uyAo1TskFI8ID952HAQOPOEafXpxjDqvrcMrIT/r5EBKABu4+Y/l0BSxTQDng
         MEjg==
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/alpha/boot/bootpz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index d6ad191..b815712 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -326,7 +326,7 @@ start_kernel(void)
 	 * 0x20000000, we have to ensure that the physical memory
 	 * pages occupied by that image do NOT overlap the physical
 	 * address range where the kernel wants to be run.  This
-	 * causes real problems when attempting to cdecompress the
+	 * causes real problems when attempting to decompress the
 	 * former into the latter... :-(
 	 *
 	 * So, we may have to decompress/move the kernel/INITRD image
-- 
2.8.2.534.g1f66975


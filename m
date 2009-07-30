From: Roel Kluin <roel.kluin@gmail.com>
Subject: [PATCH] objstrip: wrong variable tested after open()
Date: Thu, 30 Jul 2009 16:38:24 +0200
Message-ID: <4A71B060.7070504@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=WQxJsIgfbeWNOpAA8/+3L+Ed7Fc+UVa9cFAnIEryOag=;
        b=OzOHBOWfMVw+hE3zeoz4wAX6tMbm5c6QGH1wvRYd37zQ2DkD1F2zSWs/1N3KfIlB5x
         cHjcFbNQlABZSdIGlpFzSBSHbrSpy8ik4S/EW9CsDNnAcREMmeFl8lxFv8eiJg2gc1HO
         3vFPVHy/lKus78C3bBWqWr4BdybwLdZHWNT9s=
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

The incorrect variable is tested. fd is used for another open()
and is already tested.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
diff --git a/arch/alpha/boot/tools/objstrip.c b/arch/alpha/boot/tools/objstrip.c
index ef18382..9d0727d 100644
--- a/arch/alpha/boot/tools/objstrip.c
+++ b/arch/alpha/boot/tools/objstrip.c
@@ -93,7 +93,7 @@ main (int argc, char *argv[])
     ofd = 1;
     if (i < argc) {
 	ofd = open(argv[i++], O_WRONLY | O_CREAT | O_TRUNC, 0666);
-	if (fd == -1) {
+	if (ofd == -1) {
 	    perror("open");
 	    exit(1);
 	}

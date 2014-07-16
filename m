From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH 4/4] alpha: Remove checkpatch error in mkk.b
Date: Wed, 16 Jul 2014 00:14:02 -0400
Message-ID: <1405484042-6879-4-git-send-email-xerofoify@gmail.com>
References: <1405484042-6879-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kdo7mTFea3EPwqh5mzX9AulNlwNqHRCk+8yv32QyjOE=;
        b=wA9dL+y9ghIObVTHG7RseS35zOlkfUDAS7vlFMEvpr6+/oU38rnGqKFnxg6v5QM0gB
         yoAoIYFeYh7uD97IOC21XMsAdfDDusaewI3U9pkfrKApYqzj+udTRYUO9YUJT4G5mSTz
         g9I5QNOO7Dxe6kZAWWBvRcKSAA4kPJthu1jZj/VPGeDccjFLsAXR181p0bRkEIWaGTwY
         9xizHRDKcjFIWV5miedCDaqe8K4gDc4B5TLteeAnYg6gp8zW3/TD4yU+Gn2w9jqMXJ2Q
         lPc7C6jpvD6u0MAn2su5UNxdcVQUgdknfKcKcG8xoE1/hlm0cmWFzgBzqyMQOOkj9X+O
         Dzog==
In-Reply-To: <1405484042-6879-1-git-send-email-xerofoify@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This removes a error I get when I run checkpatch on this file, relating
to the asterisk for declaritations needing to be next to the name of the
variable/structure and not the type of variable/structure.
---
 arch/alpha/boot/tools/mkbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/boot/tools/mkbb.c b/arch/alpha/boot/tools/mkbb.c
index 69f347e..dac34c2 100644
--- a/arch/alpha/boot/tools/mkbb.c
+++ b/arch/alpha/boot/tools/mkbb.c
@@ -82,7 +82,7 @@ typedef union __bootblock {
 #define	bootblock_label		__u1.__label
 #define bootblock_checksum	__u2.__checksum
 
-int main(int argc, char ** argv)
+int main(int argc, char **argv)
 {
 	bootblock		bootblock_from_disk;
 	bootblock		bootloader_image;
-- 
1.9.1


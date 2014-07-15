From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH 5/5] alpha: Cleanpatch Remove Errors
Date: Mon, 14 Jul 2014 23:46:40 -0400
Message-ID: <1405396000-4917-5-git-send-email-xerofoify@gmail.com>
References: <1405396000-4917-1-git-send-email-xerofoify@gmail.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XUzjf8q3LjKbEW1M+9d9Fcpj5a+pCLZz1Oo/ROiTH9M=;
        b=GCSzjJ4l+sa/DbX/t6ujXIrt+opSdjLPo89iPhg0qhilfdFbndryi+1Cqejicp8ynD
         YOkoOKMPVLS+3nVMFK6cu0RLha1hj/YDV/IFzXtL37SO0Vz7UOfz3+VhjM8TNQLIa5xW
         UpW4DBtaE+Nw7qBJq2LdX7uTOWU20YPhJ+pselmeQNP/AnzESXiBTd/4H0Q7ZphWz6LD
         JuxScRl6yjT+U5q0fgvUSnhCdYUhyDXD6BDuwc99N7n7zOrIZVTS/dcM6RbFmABqIs2X
         49+vdTflt3WYO9NzCJN5y2FpOb+dtw/6dx9pgfzwjvZF1U/59opLtl7chAUeM7qZDp3s
         rs7w==
In-Reply-To: <1405396000-4917-1-git-send-email-xerofoify@gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This patch removes errors on lines 205,206 to fit kernel coding
style.
---
 arch/alpha/boot/bootp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/boot/bootp.c b/arch/alpha/boot/bootp.c
index 47e33cb..ac0351d 100644
--- a/arch/alpha/boot/bootp.c
+++ b/arch/alpha/boot/bootp.c
@@ -202,8 +202,8 @@ start_kernel(void)
 	load(START_ADDR+(4*KERNEL_SIZE), KERNEL_ORIGIN, KERNEL_SIZE);
 	load(START_ADDR, START_ADDR+(4*KERNEL_SIZE), KERNEL_SIZE);
 
-	memset((char*)ZERO_PGE, 0, PAGE_SIZE);
-	strcpy((char*)ZERO_PGE, envval);
+	memset((char *)ZERO_PGE, 0, PAGE_SIZE);
+	strcpy((char *)ZERO_PGE, envval);
 #ifdef INITRD_IMAGE_SIZE
 	((long *)(ZERO_PGE+256))[0] = initrd_start;
 	((long *)(ZERO_PGE+256))[1] = INITRD_IMAGE_SIZE;
-- 
1.9.1


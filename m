From: ChunyouTang <tangchunyou@163.com>
Subject: [PATCH] arch/alpha: fix typo in a comment in arch/alpha/boot/bootpz.c
Date: Wed, 20 Jan 2021 21:34:10 +0800
Message-ID: <20210120133410.2182-1-tangchunyou@163.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=D4mdl
        yQB1pXTj9GqLmepuC+vdfy4ZaH+ugJ/Ulh//J4=; b=TMPeezjfmQrHY3pQEhJOP
        1n72vr2n57TIa5TLyfdJNWaATjQepDy+rGanRsi3Icn2x74geH3hZDTJzOPpcLBI
        FbXfOR6MJr4KZ8043bBy7FwJomODGaSupSvN1pTeSZfBbDzD30O9Ldg7Nd+fV25r
        JK48GMbjN+Dk/bjFuJvs1g=
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ink@jurassic.park.msu.ru, mattst88@gmail.com, akpm@linux-foundation.org, rppt@kernel.org
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, zhangwen@yulong.com, tangchunyou@yulong.com

From: tangchunyou <tangchunyou@yulong.com>

"kerne" -> "kernel"

Signed-off-by: tangchunyou <tangchunyou@yulong.com>
---
 arch/alpha/boot/bootpz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index 43af718..61b61be 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -200,7 +200,7 @@ extern int decompress_kernel(void* destination, void *source,
 	START_ADDR	KSEG address of the entry point of kernel code.
 
 	ZERO_PGE	KSEG address of page full of zeroes, but 
-			upon entry to kerne cvan be expected
+			upon entry to kernel cvan be expected
 			to hold the parameter list and possible
 			INTRD information.
 
-- 
1.9.1



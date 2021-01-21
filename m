From: ChunyouTang <tangchunyou@163.com>
Subject: [PATCH v2] arch/alpha:fix typo in a comment
Date: Thu, 21 Jan 2021 10:48:34 +0800
Message-ID: <20210121024834.2389-1-tangchunyou@163.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=xdab7
        uurP4KG1QJtVUzCo6bsWMRYXE0ma24Vt/kVsPI=; b=izkAtZ1yss3owuBEmTLaH
        C4NluMfU/0EfihjbFwDstlgqNvnXA2y8Iyi3gGOCW8m9SNht5ScgnA5dmxEgnexF
        DOEDYU3GvbuCvgjvV5MZ57j9IlTwgeuTnRvXe4oYwGkvJ6dtTZXjNmMmtD0MTRJY
        jOPzcUflTLxnHKKz82Qt/k=
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, rppt@kernel.org, akpm@linux-foundation.org
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, zhangwen@yulong.com, tangchunyou@yulong.com

From: tangchunyou <tangchunyou@yulong.com>

Fix typo in a comment in arch/alpha/boot/bootpz.c

"cvan" -> ", it can"

Signed-off-by: tangchunyou <tangchunyou@yulong.com>
---
 arch/alpha/boot/bootpz.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index 61b61be..90a2b34 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -200,7 +200,7 @@ extern int decompress_kernel(void* destination, void *source,
 	START_ADDR	KSEG address of the entry point of kernel code.
 
 	ZERO_PGE	KSEG address of page full of zeroes, but 
-			upon entry to kernel cvan be expected
+			upon entry to kernel, it can be expected
 			to hold the parameter list and possible
 			INTRD information.
 
-- 
1.9.1



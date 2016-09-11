From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/3] alpha: make short build log available for division routines
Date: Sun, 11 Sep 2016 16:42:16 +0900
Message-ID: <1473579736-16139-4-git-send-email-yamada.masahiro@socionext.com>
References: <1473579736-16139-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com u8B7gKt0025893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1473579746;
        bh=6oCVZwoz++ZFO/g90R8EoeCYWvOjUJyYw6Sb+w5Oefc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lXMdTQ5W9xyC+YXKEx43Zfp2f+XFTmg4V/LGOrvJCHbJieBhhlH9/22Wwy76wRPbs
         FwDOiZXohbDoS4j0vE4EjDxkm8jeotGr/VnfXmNnmLa/Gt9DH3J7JF0jcnW79JUeuq
         vYdkJO9duB/n0v+ihzK93k5dEjuAdwmIEW39edgRRAlASJsdbnq2yaQq8rl5BJr9hP
         UhuQ3vHmPOk9b6WJhsFJPdeDK8jHMvbhkGesd3m6O8MtLPxUrgG/zY8/wc8hs+yXxE
         8FaNFmox/XM/qsrss1+weqNC1I231ryn7rmwhGn5DWoPmVuOv1spkku5zOCF05lfH8
         nERjhfg3fke8g==
In-Reply-To: <1473579736-16139-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Matt Turner <mattst88@gmail.com>

This enables the Kbuild standard log style as follows:

  AS      arch/alpha/lib/__divlu.o
  AS      arch/alpha/lib/__divqu.o
  AS      arch/alpha/lib/__remlu.o
  AS      arch/alpha/lib/__remqu.o

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/alpha/lib/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/lib/Makefile b/arch/alpha/lib/Makefile
index 5f12e9d..7083434 100644
--- a/arch/alpha/lib/Makefile
+++ b/arch/alpha/lib/Makefile
@@ -47,5 +47,5 @@ AFLAGS___divlu.o = -DDIV       -DINTSIZE
 AFLAGS___remlu.o =       -DREM -DINTSIZE
 
 $(addprefix $(obj)/,__divqu.o __remqu.o __divlu.o __remlu.o): \
-							$(src)/$(ev6-y)divide.S
-	$(cmd_as_o_S)
+						$(src)/$(ev6-y)divide.S FORCE
+	$(call if_changed_rule,as_o_S)
-- 
1.9.1


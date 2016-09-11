From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] alpha: add $(src)/ rather than $(obj)/ to make source file path
Date: Sun, 11 Sep 2016 16:42:14 +0900
Message-ID: <1473579736-16139-2-git-send-email-yamada.masahiro@socionext.com>
References: <1473579736-16139-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com u8B7gKsw025893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1473579745;
        bh=ZXGD2c7y+4o12OrjEzTQx89TBBmaRWCQiHwAx5G0z1Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k4t5MftbGPz+uBaARxpH1DE2r4qPWGX77MBfxxswRtPeYPVWkwFXbQSCiAQIl1m1d
         U0Sq7CGX3/D4O58WDAWgZq51pXFRo8nZXYnElfYrDdNTN7wJbpIoL2XGG5DYSBZJcS
         XvIgezUJ9tjfu6MDttbsXj1tPrKOC4wDt7u+muAH45x68DSG0OTVRHcnXd0JhyGOzw
         MgvtPvbYQ3FxPL+s7nKT2nIiA0CNgVr4tmxrJYKPuBmgGbGFoIGA1Z/QALCYWoZ4ba
         HA4yKRcyUVo3jtR+Eb1DmiORG+bN+aZc0pXgmE9l4CxVTWjc4ZRoPHfj+goSLsLH1t
         g53et/MnmZVOg==
In-Reply-To: <1473579736-16139-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Matt Turner <mattst88@gmail.com>

$(ev6-y)divide.S is a source file, not a build-time generated file.
So, it should be prefixed with $(src)/ rather than $(obj)/.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/alpha/lib/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/lib/Makefile b/arch/alpha/lib/Makefile
index 5966074..7b694fe 100644
--- a/arch/alpha/lib/Makefile
+++ b/arch/alpha/lib/Makefile
@@ -46,11 +46,11 @@ AFLAGS___remqu.o =       -DREM
 AFLAGS___divlu.o = -DDIV       -DINTSIZE
 AFLAGS___remlu.o =       -DREM -DINTSIZE
 
-$(obj)/__divqu.o: $(obj)/$(ev6-y)divide.S
+$(obj)/__divqu.o: $(src)/$(ev6-y)divide.S
 	$(cmd_as_o_S)
-$(obj)/__remqu.o: $(obj)/$(ev6-y)divide.S
+$(obj)/__remqu.o: $(src)/$(ev6-y)divide.S
 	$(cmd_as_o_S)
-$(obj)/__divlu.o: $(obj)/$(ev6-y)divide.S
+$(obj)/__divlu.o: $(src)/$(ev6-y)divide.S
 	$(cmd_as_o_S)
-$(obj)/__remlu.o: $(obj)/$(ev6-y)divide.S
+$(obj)/__remlu.o: $(src)/$(ev6-y)divide.S
 	$(cmd_as_o_S)
-- 
1.9.1


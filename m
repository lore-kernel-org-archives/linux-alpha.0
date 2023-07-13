From: hanyu001@208suo.com
Subject: [PATCH] alpha: kernel: space required after that ','
Date: Thu, 13 Jul 2023 16:04:43 +0800
Message-ID: <220676d36f87a4cca94ed871ca818bf4@208suo.com>
References: <tencent_E4D5629822712868D089ED4E87CF3C205206@qq.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
        content-transfer-encoding:content-type:message-id:user-agent
        :references:in-reply-to:subject:to:from:date:mime-version; s=
        dkim; t=1689235483; x=1691827484; bh=2JVYblZCrFwU34WRxN06J14YbJS
        7761l1AYPk7MTpyU=; b=yym5ghBw0UIYAOI3WefkDLsoVKDNmP9Q3vbcPa+cOC2
        CceONwxmRcxG1aYcqkXn71lEnRJ1xfkDrxpIrxxZJ0aIQ2Kf9YaVIdgyrjJa6HL/
        /5Qt8ghYe6nuXbNo7ggSRqzc7W2f7BaLBrRbB6EeLuv0MdS9tZp6j9v8eUlcfzvL
        Bj1ZI36pHP7iZVGX/VpZlNQr+RJEBX555e/8YrTTmAZDYVfbW/a8O4MPX6psLot7
        PS6lnlcrY8XGxJBbi0UMdgUoNHmdH1O6ugWzi6jUGmcZqUTQxvYTJ7Bz2EOShcQf
        bW7PX1DLYJNpLrFvTe7Zdr7D6iuzHDEo1vY48r0A82g==
In-Reply-To: <tencent_E4D5629822712868D089ED4E87CF3C205206@qq.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: richard.henderson@linaro.org, ink@jurassic.park.msu.ru
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

This patch fixes the checkpatch.pl error:

arch/alpha/kernel/core_cia.c:387: ERROR: space required after that ',' 
(ctx:VxV)

Signed-off-by: maqimei <2433033762@qq.com>
---
  arch/alpha/kernel/core_cia.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/core_cia.c b/arch/alpha/kernel/core_cia.c
index 12926e9..2779441 100644
--- a/arch/alpha/kernel/core_cia.c
+++ b/arch/alpha/kernel/core_cia.c
@@ -384,7 +384,7 @@ struct pci_ops cia_pci_ops =
      *(vip)CIA_IOC_TB_TAGn(5) = 0;
      *(vip)CIA_IOC_TB_TAGn(6) = 0;
      *(vip)CIA_IOC_TB_TAGn(7) = 0;
-    *(vip)CIA_IOC_TBn_PAGEm(0,0) = pte0;
+    *(vip)CIA_IOC_TBn_PAGEm(0, 0) = pte0;
      *(vip)CIA_IOC_TBn_PAGEm(0,1) = 0;
      *(vip)CIA_IOC_TBn_PAGEm(0,2) = 0;
      *(vip)CIA_IOC_TBn_PAGEm(0,3) = 0;

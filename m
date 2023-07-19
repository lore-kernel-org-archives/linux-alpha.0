From: hanyu001@208suo.com
Subject: [PATCH] alpha: asm:  add require space after that ',' and around ':'
Date: Wed, 19 Jul 2023 17:25:34 +0800
Message-ID: <875e01e4fae77a5ba0d8f733c9479466@208suo.com>
References: <tencent_592244D6B47BB549E7840283D55D95B5E308@qq.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
        content-transfer-encoding:content-type:message-id:user-agent
        :references:in-reply-to:subject:to:from:date:mime-version; s=
        dkim; t=1689758735; x=1692350736; bh=U/xYmzRLJcoCI0vopk7LHGsNMep
        cp9wZ08dVqcXm5dE=; b=H7+MctIyKVdE0vgjW5p0i+oNwjmu9/WQOUip3rLpuAY
        6BQsefu21+Vd3Xv1/EDnssYSqX//a6jzK8WOJm96KfHHAcPMbcvdzNsY8PdS0e1k
        fwli1bwYng9j+TOW+Ad/7qQiJWJkjfl7kLsO8WQmYClLOpWG6aa8D4nveWvYRpvF
        o+yXRzPXzamSGj4ajLa6hng4nrZN6SnQ2gpB4eIXuAU6/Ih2ZZRP5kt9t0QwIqdG
        tAEWfeKUizze/zLVoPDWod6pBYiV/HNZHcUZ1dkeS9cC7uhRXHEGUScjykSOELp8
        RZEe5uOqAq9VZGdr0dA/J5DdPHYGTaRUhke7bY8qIVA==
In-Reply-To: <tencent_592244D6B47BB549E7840283D55D95B5E308@qq.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

Fix below checkpatch errors:

./arch/alpha/include/asm/smp.h:19: ERROR: spaces required around that 
':' (ctx:ExV)
./arch/alpha/include/asm/smp.h:54: ERROR: space required after that ',' 
(ctx:VxV)
./arch/alpha/include/asm/smp.h:54: ERROR: space required after that ',' 
(ctx:VxV)
./arch/alpha/include/asm/smp.h:54: ERROR: space required after that ',' 
(ctx:VxV)

Signed-off-by: Yu Han <hanyu001@208suo.com>
---
  arch/alpha/include/asm/smp.h | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/asm/smp.h b/arch/alpha/include/asm/smp.h
index 2264ae72673b..c034bd8d9b16 100644
--- a/arch/alpha/include/asm/smp.h
+++ b/arch/alpha/include/asm/smp.h
@@ -16,7 +16,7 @@ __hard_smp_processor_id(void)
      __asm__ __volatile__(
          "call_pal %1 #whami"
          : "=r"(__r0)
-        :"i" (PAL_whami)
+        : "i" (PAL_whami)
          : "$1", "$22", "$23", "$24", "$25");
      return __r0;
  }
@@ -51,7 +51,7 @@ extern void arch_send_call_function_ipi_mask(const 
struct cpumask *mask);
  #else /* CONFIG_SMP */

  #define hard_smp_processor_id()        0
-#define smp_call_function_on_cpu(func,info,wait,cpu)    ({ 0; })
+#define smp_call_function_on_cpu(func, info, wait, cpu)    ({ 0; })

  #endif /* CONFIG_SMP */

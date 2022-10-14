From: Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH 3/3] alpha: remove unused __SLOW_DOWN_IO and SLOW_DOWN_IO definitions
Date: Thu, 13 Oct 2022 19:19:11 -0500
Message-ID: <20221014001911.3342485-4-helgaas@kernel.org>
References: <20221014001911.3342485-1-helgaas@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665706769;
        bh=tTEyDY4y1+87Ir4x7Jh4HSnnTm32iutjilnAr13AlmA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RIQVTdUhKbvSNm5TJSCNviQbTKH+idQm2WL/bYb3g0XILtwdlcQcAUs3eT5lrCBep
         X1VPRKWnTKTolEsn8aVM6bnKc+Q3kTmN08H1cQvkwhRuBwj4BvnKeaBMRYZsxNRH1T
         PiqepcQvyMiIOAcDvF7dTVRD1FBJHmmkdftey2dladzpaTYqnNLSuyr+4GfUO0mSox
         x+9NUV1lP3YdxdqSBh/yAEHmzJi4jyXL6KGvVVLT03l+uVe7u+X9r6/mcyLzMa5p6O
         0jQVrqGhqWLGsliL+i9Fu/cPjVgJGKlV51/AbWAUVzsld4U/Hi1TCbtKIo3su50Cjb
         xW9Aj21g+KvyA==
In-Reply-To: <20221014001911.3342485-1-helgaas@kernel.org>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org

From: Bjorn Helgaas <bhelgaas@google.com>

Remove unused __SLOW_DOWN_IO and SLOW_DOWN_IO definitions.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
---
 arch/alpha/include/asm/io.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index 1c3605d874e9..7aeaf7c30a6f 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -14,10 +14,6 @@
    the implementation we have here matches that interface.  */
 #include <asm-generic/iomap.h>
 
-/* We don't use IO slowdowns on the Alpha, but.. */
-#define __SLOW_DOWN_IO	do { } while (0)
-#define SLOW_DOWN_IO	do { } while (0)
-
 /*
  * Virtual -> physical identity mapping starts at this offset
  */
-- 
2.25.1


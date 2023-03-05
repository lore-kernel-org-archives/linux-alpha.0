From: Uros Bizjak <ubizjak@gmail.com>
Subject: [PATCH 03/10] locking/alpha: Wire up local_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:21 +0100
Message-ID: <20230305205628.27385-4-ubizjak@gmail.com>
References: <20230305205628.27385-1-ubizjak@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dp+002KTo48dpecC7Fg4F0z+wg/mF+qKQ/rqBRLLmU=;
        b=FJhdq7LVPwcBcvn6/riybPaEEFIp0/r+l4uien9VYX13snE+6dd2SRb+yMPMDhYYbM
         3AUs+n1H+CpJ8GDv0U77dUTxE8RjQ1eWXLj+bg/IVt1gChmG7p7sJb2ClN5MKQVBKiHA
         NH0EMDT03tcy/lSh5xX41OU6Nskj9OCGpTzoieRFH24h3GENB49/lgCnuichf7wUhvLm
         YsQlX9dGfnwd59NipJUQH4HuchN0vUmHSZ5pwgrti5UGvSZ3bP144EUY6UqvAOkml+nl
         yVef/gktEHzCBna7fndw2/uQjOF0b5Chrheidug0MCn0y1l15A0pcTSH9l17N70mnuzK
         JNug==
In-Reply-To: <20230305205628.27385-1-ubizjak@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>

Implement target specific support for local_try_cmpxchg.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/alpha/include/asm/local.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/alpha/include/asm/local.h b/arch/alpha/include/asm/local.h
index fab26a1c93d5..7eef027e0dde 100644
--- a/arch/alpha/include/asm/local.h
+++ b/arch/alpha/include/asm/local.h
@@ -54,6 +54,8 @@ static __inline__ long local_sub_return(long i, local_t * l)
 
 #define local_cmpxchg(l, o, n) \
 	(cmpxchg_local(&((l)->a.counter), (o), (n)))
+#define local_try_cmpxchg(l, po, n) \
+	(try_cmpxchg_local(&((l)->a.counter), (po), (n)))
 #define local_xchg(l, n) (xchg_local(&((l)->a.counter), (n)))
 
 /**
-- 
2.39.2


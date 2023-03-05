From: Uros Bizjak <ubizjak@gmail.com>
Subject: [PATCH 05/10] locking/mips: Wire up local_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:23 +0100
Message-ID: <20230305205628.27385-6-ubizjak@gmail.com>
References: <20230305205628.27385-1-ubizjak@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKMdOBSHNrQUgSWU9KR0ogbHUm36R1MCQj8zVPpN6EQ=;
        b=mU214HoBD9PhosOri5UfMQjRIEUU9I7ZxXJTaKzr9RcaKrtgXfOrYoiIrC1H/cgukR
         nGR3h38W8sHvMacW4UFXHQQDKZCvOloFPDQjKO9O//zDviZ9mQzevFeYU88TK71GZ7Yl
         D/k8cQsg+q4J+35dqG/OlVnh0MnVnhlAufeVmyjxTwVhOBT0LoXY5y0X7PCib/wU0Eyx
         +QpOr0musHR7lTYq7pSl2aAa1WKY3GvzHvpUUY9s2BqBAo6O2o2u90yeCuiEiCaWos8D
         58spoyzzG9c6tD9JstLQOIUhjogJWxBR9MJwe+mON+OA4NcDB3DdTwAuF12GKQUZRS1z
         /wOg==
In-Reply-To: <20230305205628.27385-1-ubizjak@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Implement target specific support for local_try_cmpxchg.

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/mips/include/asm/local.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/local.h b/arch/mips/include/asm/local.h
index 08366b1fd273..b611361a760b 100644
--- a/arch/mips/include/asm/local.h
+++ b/arch/mips/include/asm/local.h
@@ -96,6 +96,8 @@ static __inline__ long local_sub_return(long i, local_t * l)
 
 #define local_cmpxchg(l, o, n) \
 	((long)cmpxchg_local(&((l)->a.counter), (o), (n)))
+#define local_try_cmpxchg(l, po, n) \
+	(try_cmpxchg_local(&((l)->a.counter), (po), (n)))
 #define local_xchg(l, n) (atomic_long_xchg((&(l)->a), (n)))
 
 /**
-- 
2.39.2


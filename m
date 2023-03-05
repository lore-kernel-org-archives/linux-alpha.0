From: Uros Bizjak <ubizjak@gmail.com>
Subject: [PATCH 06/10] locking/powerpc: Wire up local_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:24 +0100
Message-ID: <20230305205628.27385-7-ubizjak@gmail.com>
References: <20230305205628.27385-1-ubizjak@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25TOpB6uAuDptlCHYXnw8K0sBZK8F7O48wtvqw46Fco=;
        b=cNd8YqsFIPxe+JP9zRF39U9LVtgmwfXjcFbHH84MFejyyz+WXmA51xlzYADH9AC01W
         lEszc02CudZI42k7pYdy16Vf4WI6WjE1DZx56EjyaZpyY7FvA1+pVY1RSyjgr+NlrGpr
         yFwug2e2C37vzQDmuS5CJX+8dF3kzqMWXP62SO1BV9+XSfgAJAzZ1JEkQPQMUXgK2qm4
         0hyBNzM1O3Kv/jPXAGYRtlnLBj1s1v9YygYUST1D+zx9Ey2ipnETSfTUq5UPh138ocjy
         r6cJKI1TIKvZxYHHrTVVuJQaSsFt81JXXkjl01KWi2F25uQE45bvL71Q902loyxf7ehM
         /C8Q==
In-Reply-To: <20230305205628.27385-1-ubizjak@gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, linux-perf-users@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>

Implement target specific support for local_try_cmpxchg.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/powerpc/include/asm/local.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/powerpc/include/asm/local.h b/arch/powerpc/include/asm/local.h
index bc4bd19b7fc2..45492fb5bf22 100644
--- a/arch/powerpc/include/asm/local.h
+++ b/arch/powerpc/include/asm/local.h
@@ -90,6 +90,17 @@ static __inline__ long local_cmpxchg(local_t *l, long o, long n)
 	return t;
 }
 
+static __inline__ bool local_try_cmpxchg(local_t *l, long *po, long n)
+{
+	long o = *po, r;
+
+	r = local_cmpxchg(l, o, n);
+	if (unlikely(r != o))
+		*po = r;
+
+	return likely(r == o);
+}
+
 static __inline__ long local_xchg(local_t *l, long n)
 {
 	long t;
-- 
2.39.2


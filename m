Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046999;
	b=U3JX3+aY/rPTA/FKL0OTZT/QejwDODiBY9m/ys4qbcMns4G5LieU9YORlG/APHUqc6jf
	 5m9WieZNHA/z+zU9fDoJawLK9NKl75iBOjncCcrtcNwMePcWAaML8I2ayRv8PFHykst/m
	 pCoFTEsNmkp8x2aXE3m11KRpUgwX6sAsZAzY+nbduZtOk8clNM1Cub7uMkviOopWPyf5N
	 4MEoZJjYXLTfdiNLNBsPm4ywPTBRFgOZXYuFOXzhtbPep5Cq7m0lho8NzIFBiSqfvtZgs
	 RKUuRTHoPOnpU9RkmnPfNlIZv8zLqcyuT/GpoZ8G/XJ3DvUCRNCq/lPaPfmw7nuTXZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
	b=eZsbPYhphcn2pWdSA7pNPek5TnxsgVop1CwoWt6HN80P7W8h98NCC02FxjsLGbQKaO1l
	 kHIOL/2qfBLbUqH+ZD3iun3SLyvnD1bNKwUILdr0xgjAWI27i1iUUbwZblMDhk4Lk4JJ4
	 iveOPZqaujKtYxPxQ4QuZLw5GF+5IthPWHTs8AtvWeYI6B5NuHBrcDf7ArsJkax1GgXpz
	 1QHPSErjnWdDnyes6rg9/uzdFvd0nHVV77wR6L+QX42JmyyLmE4uuJzckJ/czEQYL4GPN
	 t1mFr0lBDzeShnmAJlLduHa3S8bB+kYhtCKRYqZtSpZwR4SB4qGTxoRkwvJw7G6YsdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZAuzRk/b";
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67519606A332
	for <linux-alpha@vger.kernel.org>; Thu, 19 Nov 2026 00:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67519606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAuzRk/b
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b4cc793704so13597447b3.2
        for <linux-alpha@vger.kernel.org>; Wed, 18 Nov 2026 16:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795046998; x=1795651798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
        b=ZAuzRk/bH1C4XHaHJdlF0uXoYYurW2uwPPgfvYAThPdAbsuhTmt1wlr7vnOoallGgd
         Am8JwCShq150uXr2awS7XyI4TvG/bUNdQW0zqh0XUnDvJJEFpegQSMpCzdxWNA4WYGQ5
         sd0h7CMjf6EktPMHEFp7I7zjGcexZD5AKtbqHnOUgOciVzg+4r0A0sC9tz0Jefm1DKAw
         8sX/w5yYU7VfLNmSnaM4Iw7nsADPQvBlVKb5KfS6Z67dStOeq6DQ+VGFdcuWd4Xcjia2
         lY2OvjuZf7D0edokHbv//lmLbSBi+reqa6oXUzaClNqXpCKCdsvUHIcT3vQ7ip5SEE+H
         c/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046998; x=1795651798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmJwPAKmkjpaPlFxmcST3cwAQG1JNPaGXGhzymmNX0E=;
        b=R3hs1+ZEyD/pCfKLym713dJIQaVEMJyCxgQIyp2niHElSqyvybCENz31NmmKG5bGaG
         q7TRdAJfGjoZfh92qucBeOM5iaS86QU+sLpP3exQwg0YagtZbXA0CHR9eV1csa7gzNcp
         zP929Y0j7HiCU+Yy9Vjg7/LpQgiYXk/X9SWfZ4X62s4geO/VcNbi9NpncarQatUu49zS
         dtdtgZEMkohVIUVxxr1onZ5+t7WarANl/9Va0+jtXAYuWoXgb4Ha/F/t6Lt3vzhOhtd4
         V60TbzQOivfB0k2gB/DMIrpKbJb4pex498y1pZw6rsD5Ead13YeW99Xw+pNAmQCcbT3c
         wqIw==
X-Gm-Message-State: APuU4Z/YDxsBMjIYguOY9Gf10uea1nk8Jz10mGntd8jOiRz/y/s4atA1
	TegJhJwFzpaBd94xBq9Cjjdf7ephglhVJ2YYE5y2l9O+oGSmrkcVe2za
X-Gm-Gg: AZFdTZcFqQW5cS4D27aKZfEyUgHxIYxNrHe9QDbdFEPiN7F84w/n1hFKqVGwFYUraHk
	rxwY4RPtCCj6RREOknk2piKMQGYJezYCl5jUWfoZZEUD1gz37/x1aW0a064tNZQP+R7k/ya/l2i
	a4J8J4YbTHNr/Wmb5nx/wFO+0u2yTOLhujygBitmp434V4VZX2qX93cBinxXrtwmxvP8zo0RgPy
	123Nn0QJbh3PU2jAFz6ve30jogl5cDqZIYuNzss4M0UT/39E4DOk3NDX0oE9S7X4TT3AjD4ssiF
	SVPdqRYrWhAWAOjCWNSb7xPZuab6yywIeQ6OjsIRuRweKaJBTyJ5zBlf8Hm6ZkcbWXf91Tp3zjD
	sZQudMBPcXUAXMrzI0K1h6iGbuOBzjftH3HfkePpvYUSQZX/IUVIf8TwP/RX+b12oL6EhwX0bMd
	kUE/Qo4HgRVUhQpKgT6HnWfwf6dPzKrfZVQGYJmHizYqXbk0ldWB3dJE9Nj/q7xjDlRf+px1+00
	s9RwS1QCkwhj5iJ7OTQEmpjd6/9pgZinM755DLRRPqwQrkJ5JtEdaAEjCgqWlbSXtJ9EeHyb8Pw
	m2uRgJdyl0lcmrZUhVhdIIpL95GEdjOl/2SebbnHgUPD7qSE8ayzHSRYLPia16HI4ImT6C8BnTB
	VqnakGeMO9fMgABmGxZBQkMKe8ay3RSzlnfWVnRlDcHigatAYnX0IKZEJ1D5l9cfkKYGjdO0ktB
	0hXGiIR94oIzYgsfxEaQ==
X-Received: by 2002:a05:690c:9a05:b0:8b4:e2dc:3f20 with SMTP id 00721157ae682-8b4febf1d10mr16920757b3.3.1795046998443;
        Wed, 18 Nov 2026 16:09:58 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe10d935sm25708467b3.41.2026.11.18.16.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:09:57 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 18 Nov 2026 19:09:50 -0500
Subject: [PATCH v4 5/7] alpha: marvel: register a platform device for the
 environmental sensors
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-marvel-env-v4-5-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
In-Reply-To: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=eCxTz6/wFgOEYqUhWdz1P8hGqwqPQw6s+J+8BeCiWlI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+2XkprM/7qq30VG5m4Kxye17zp8biqRvsPTcJbq+qu
 hD/dJtax0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFwz4ynDLybDw7+5jL
 4/ThWsO5z3fdmFfX2dBxK8fIQubMw46v+g/A9Qhe5V0Yny98/pxd3OXu4/VW6TkNCW77PPBi7hi
 1O9J76SFwA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Register a "marvel_env" platform device on Marvel systems booted from
SRM, for the hwmon driver to bind to.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/core_marvel.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index bd918028b410..d2e1e45cdf1e 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/memblock.h>
 #include <linux/workqueue.h>
+#include <linux/platform_device.h>
 
 #include <asm/ptrace.h>
 #include <asm/smp.h>
@@ -1142,3 +1143,13 @@ long marvel_cfgtree_partial_update(unsigned long offset)
 	return status;
 }
 EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
+
+static int __init marvel_env_init(void)
+{
+	if (alpha_mv.init_arch != marvel_init_arch || !alpha_using_srm)
+		return 0;
+
+	return PTR_ERR_OR_ZERO(platform_device_register_simple("marvel_env",
+							       -1, NULL, 0));
+}
+device_initcall(marvel_env_init);

-- 
2.56.1


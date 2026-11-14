Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678000;
	b=UI7p3y2iv27e2V72eIilWcJ6baGOPKBRldFNjw0eAjzUyYpCuLE9M6wTCNhs4lZdd2kz
	 ECzBFo2iLN4Bs5RgLu5voudWBtUo0gPBeHMJ1jSq0z+xK3bq/2Hcys3k8WDyPMyh/WY+E
	 Y3V1f1LFDeyKSH9PoYxuZohg6T3QJjAgMU56EcVHycHSyDH8tKgVP1Vf72cDFi22Zx+ln
	 GUr5O9QDB4tHohnyGo0ONQG1FyRO7I0VNzaUPjf5nAL5NAwGJAa+JEuh2++3O5NEWpP8S
	 7JA+uzJZ6f/4sAUZoSNk+CoMbGXVhjhumoFI9awi+MPUpSFP71B+0cvq0ajV6iKttzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Lyal3OiBd+dT9BC358VwYP1xMvu/A2SqglZVPhlyxLg=;
	b=DZIKtbZLWEo1RqpBu2Z7sX2CLfB2rlvhJNZv1vvwhSdMSSWCwk+CC4+/bqfvZ2/LzraR
	 uLgdRboaIcLPCYUCVPi58Q5u3rxgivWl6dxrqyaWrh6ECbqDZTygn3uF+BVq/2+k/kKys
	 KhFRwuwM6NEZtCB0LhJIbs7pZAifrqZZ84C1H2Cj5pnO0MRK0UTdZugXXtDkLyexvwYbv
	 ODawz1JxFnhUqYg5xSVW6YrwWMtfTn9ngU0kzEYe1II5Tx/VazDHuav4SZyBpnYKt08KS
	 tQZCsLne1G19r9shVGG2dXXA/YxnH7OCg3oA1z7gxdFuM5lCvbxaPArQVqb++fGOL3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7Js8QzN;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D81606A8BC
	for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 17:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D81606A8BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7Js8QzN
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67d8221074dso2127218d50.1
        for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 09:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677999; x=1795282799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lyal3OiBd+dT9BC358VwYP1xMvu/A2SqglZVPhlyxLg=;
        b=C7Js8QzNBNhT8bsatWEGhvlzBN6jeTSYgOsPLNr/9v4GbZ1GRn/qzyBEydnjYdBhss
         eUhS/vNq7zC0HatHggHMpI9lUnsudaf9btf3EaEBBP/sFi9BgL324g0N/Q4mknXas4sq
         Dt2zqw+CC7wF4ypOWxOFoxPjnDf7v06nhVgSiWntOD9v7myBlXZetXEHJ1s9Nd1jgZVh
         HRv0W4OcDwg3faMYXRlMU/mHAR53I3kuUNlRowtOIRZ/PbfDrwDUPFItmQXqJ49cEZN7
         2IeHezGihUM2chlihjLlEA6AgKTM+x2Du94fVGjHejoHfS9dNJDNKb9gp/1/jX8s7eSq
         uz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678000; x=1795282800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lyal3OiBd+dT9BC358VwYP1xMvu/A2SqglZVPhlyxLg=;
        b=oRHi3uh72bSkXpebap5rbt+3zrkW/mzPwuBWP0i4+9P+zHKTJf9+FpG0PL3WorGnxh
         sRH2NcATW/Q9HQS4CW7haFvT3aPXpXwNDlDrbZbZPXjQh+g/1ViZxrzmxMrTvVPwl4+J
         L80rriO4szIck7Na5Fc47YsHFROpK4Z+8FlS1T+rm0YfvjvEyeq/H85ns2zR3IvnibEK
         8YpO/jVyXozaEf81zTuGYV4bEuEaRa7qbWQdNdgqQ6Nmvi7vFxDBkx1dj8nc2xJL4aar
         wcjZ4l0p0rneLIuDE9pSYj1lDnocEUyYpFhyQXO7DLj0pusXcyyXPSEfgnfCp3dUS4ve
         30KQ==
X-Gm-Message-State: APuU4Z+c5HyhDSjKmXuPsCwGdSEUcLYFOEra6fuxVg9NUoTyV9C2aUVi
	bXHIXRzqjDSmCGiOqVX35LGLJO2dBtGJXNNRZ2YHwh3EPeq2gQ4Pucjz
X-Gm-Gg: AYBFou0ewZuGa9wBzQf2R5dD8eMf8HYFoO39/W628mZiDXN/eHCmcykoVJdoFj0D9/T
	Rbtw9231FKsEltMG4LIZ2rNGfJVhis6I6D/EbCWRIxEf9WyycUpelKgQ+QncgCvV4QtgAx1LtOe
	6FbnLqRwBMxU5spfYCMPunatSLYl7TliU1W2AnZqLVb502ruCCrJ2XInSnr3pAXhKTevN3FAzxt
	/KPMNLp04gdnFrNNTKBzB4yprP3E+13a1J22+k73+RDd8wmVA5fsIsEm+Bgdck8VCza5FypVlGo
	sqhfGYrfxwobyxzgxTesJXpAB5L0N4XQ+H3LLZLvQT1TyglcOzfykW3Ms8ZbujMYlgyDYAqUHdV
	iRt1/vdzQawA7ANK+aKGAecek8kIHVxNQNKhQS5ELoTIx/L2ny/Ctbons1xp1QcLUTRQQCntckX
	jkngA7mx3VmuANVXKfd58FNfZaKENMZ5zpHxhz4/3UESzwFsrDvTbf68gG88QmNbrGJy6yOd6WG
	SXsMeGlWJdh1RnFKRqDfTI+RXjtmVjW7TR1txi15fmvm8j0kFKxnesfGwuhuSnaXNXrRgg4FIG4
	NnC3AfZH8Qg5AyqOMma0c3QkZ0WAK79GUbLkUBkeHwZ9niKFl2xH3c0mweUsHXrfgcNGkRX0+m/
	iWo3KKb5iA2/VvMh2RI4u0sd61VZSSGpeMoR3v1uMeG/7cNMXqBxcevkejBzw+g==
X-Received: by 2002:a05:690e:b83:b0:67c:1fc:2a49 with SMTP id 956f58d0204a3-67d970207c9mr2180388d50.54.1794677998636;
        Sat, 14 Nov 2026 09:39:58 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a55ab71sm5322721d50.4.2026.11.14.09.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:39:57 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:39:50 -0500
Subject: [PATCH 4/7] alpha: marvel: register a platform device for the
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
Message-Id: <20261114-marvel-env-v1-4-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=mVh4JvfcK0k3ESBDJMdG/SRPetVbGyQ1JJmKBQZfeiU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHm8bJGPx8k1Qg5dEu2+fbeTjyY5LHjjENeTlfdPg
 mE3u3NUx0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFxjys3IsOjQh333tt
 0W+8x1PjbuR/OyiMigNWFFrC8Et9yt5NC9eY/hDx/PoUdFf0/1N257rHlpu1WB+6S17qxr9xxom
 J3AJzRZmAkA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Register a "marvel_env" platform device on Marvel systems booted from
SRM, for the hwmon driver to bind to.

Assisted-by: Claude:claude-opus-5-5
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


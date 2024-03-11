Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8607B4120C
	for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 13:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710163408; cv=none; b=gwJPLIE56A3k8S2AnSyQ4g7YCyekmInA/74Tz+V/QV4odRdnnmBA3XRNPvtTNu87oeOLRvEiYNcoJk/cmzZt+6ortMYhVdAeb6Qiu5Ko+/3+sW0dUhDT2GA7n7omw8yhi78vA666VIxTWmmhhw+OVVmmZvlL6fEieyYAOGmQxi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710163408; c=relaxed/simple;
	bh=mM1lJpUfEeOdqAGIdoQeUdDslMwrM56HU1w2dUupTZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OltP4n21+xyFtYxoijPvWy4bChcZpZeKc/tWLZ55XwEc7/Zf48UDC0Utus0mim3M90gaouipWTjyN86jyfR6osJbwk2wwAUccmrc8dHptDYdqxlOSVd8oN5tEvybX0cgoC74uTpSqAKwfPeeqbFIS0bODUTooiBPUv9OSEcTHQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=VXmHK5yF; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="VXmHK5yF"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5683093ffbbso4363980a12.1
        for <linux-alpha@vger.kernel.org>; Mon, 11 Mar 2024 06:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1710163405; x=1710768205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEARZa5Wy43/uJEWuUJJQI9Y4wLhs8OmNqyFr5H4dkQ=;
        b=VXmHK5yFYrs1Ms8T+4ZCDdOnYx6tsnMX0O9x+oRpjevCoa7FnhG6LGNHVObD9fE5B9
         FFYV+NpsYEl4OrweQ/ZxU886zHVQRsoz1avLndsJ53ng/AHTMOMstohWuN0Stx7UyYLN
         y1y1+3XfRls9xcMk/4+3ZwUWlGx88yNgddT6310Ev/JUE5YoHtmmYMSdoQi5R0zS5IXo
         0NRJixtSSGBz0I0MqQKYu37KJO7CGRC4+iXhOVKFaviN4anqzss48/SP3+aAZytoNvMN
         CVWBcgv0Gauu9WneUjw6wEYq1fO8YZT3dzLY/NCznoDwUS2MzFFET1OfXZb3Fr5r/+HO
         V1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710163405; x=1710768205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEARZa5Wy43/uJEWuUJJQI9Y4wLhs8OmNqyFr5H4dkQ=;
        b=E6ufv6GdT3U/LqAm2ylbTEuy1wnyuAKAdy6lAFPAszCpIhezC7PVVlM2B06Rd62f80
         bJlJbtr+O/vqAIlMNeFVSTW42zxo5FRqsFJ7jA/MjFLFCp5nAGBXAh94lrdJkZMKJO0e
         OFx4IcERqbxLblfFe1FJiEyZwEd70HqCInA4s1TsiOizDxxwbeNI+Ttv/Ck2hkIuk2Eu
         Nwqisjm105RYGic+D1HAS5lDt7sqVGSnc0lzC7cVSgkuMtf4V1QUiyNAA4mhABUZfN/A
         vIcGDvJLtFUTSFTVsu4EzEGBa09cwozA8h03nwGXmIg8wfH28ZC+1noqbpVu8TB8wTrV
         ZLuA==
X-Forwarded-Encrypted: i=1; AJvYcCUp7HDRBtFF4qu8OZrlVVmU+1nc17HxHr4RkLO6wfTIGmJVftpd1Z9xMSjzT6QKeQrH7B42uBnM9MGr8dBsGRAlW7q7cNqQzp5Bz7E=
X-Gm-Message-State: AOJu0YzPBs4M4MNPgIyc2o55gWr0lqzsWev2ZgkGj8EZnqNJPmnPaEhW
	afA9vnEIedqifh+2mZGRwNvwyQ//EoY/iFggYEu6rRy78k8EU5agwO0aBfJUwZQ=
X-Google-Smtp-Source: AGHT+IFL5EqhKwS6+2fO3vS7G0SSPiXV3Vvv51HVPrGWf8pMTBxVVxVrAQAUuE3HHK6wRH9qYUpBqA==
X-Received: by 2002:a17:907:d410:b0:a46:2b92:8124 with SMTP id vi16-20020a170907d41000b00a462b928124mr1444316ejc.60.1710163405151;
        Mon, 11 Mar 2024 06:23:25 -0700 (PDT)
Received: from raven.blarg.de (p200300dc6f010900023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f01:900:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id i26-20020a170906251a00b00a44cb0bf11bsm2861075ejb.79.2024.03.11.06.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 06:23:24 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: richard.henderson@linaro.org,
	ink@jurassic.park.msu.ru,
	mattst88@gmail.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 10/11] arch/alpha/smc37c669.: make SMC37c669_dump_registers() static
Date: Mon, 11 Mar 2024 14:23:05 +0100
Message-Id: <20240311132306.3420135-10-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240311132306.3420135-1-max.kellermann@ionos.com>
References: <20240311132306.3420135-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function is only used within this source file.  Fixes
`-Wmissing-prototypes`:

 arch/alpha/kernel/smc37c669.c:2434:1: error: no previous prototype for 'SMC37c669_dump_registers' [-Werror=missing-prototypes]
  2434 | SMC37c669_dump_registers(void)
       | ^~~~~~~~~~~~~~~~~~~~~~~~

Also add `#if SMC_DEBUG` because it's only ever used under this
condition.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 arch/alpha/kernel/smc37c669.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/kernel/smc37c669.c b/arch/alpha/kernel/smc37c669.c
index bbbd34586de0..ab22ade3dea3 100644
--- a/arch/alpha/kernel/smc37c669.c
+++ b/arch/alpha/kernel/smc37c669.c
@@ -2430,13 +2430,16 @@ int __init smcc669_write( struct FILE *fp, int size, int number, unsigned char *
 }
 #endif
 
-void __init
+#if SMC_DEBUG
+static void __init
 SMC37c669_dump_registers(void)
 {
   int i;
   for (i = 0; i <= 0x29; i++)
     printk("-- CR%02x : %02x\n", i, SMC37c669_read_config(i));
 }
+#endif // SMC_DEBUG
+
 /*+
  * ============================================================================
  * = SMC_init - SMC37c669 Super I/O controller initialization                 =
-- 
2.39.2


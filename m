Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1E2274670
	for <linux-alpha@vger.kernel.org>; Sun, 17 May 2026 23:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779060779; cv=none; b=q04nz5kcE2gyS2wf4Fc4mRiiG+o2NJvACdbHPVYar7gnZMS871RRIWHzboXcKF+iYpJUSpOexz9zQKRHByB5Je1IRSnuswfdKsY9hsc+DV7zjeBsFVtFuoZ88gDGBhn9cvTSjhDtCzFtHSdzxdvX25prV4Kp0rPGscVmavQV6TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779060779; c=relaxed/simple;
	bh=LCOH/H+y393IOJO3QEjqv1J/K5iAt9IKZh9iSgJ3O60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G02v0qXL5HZa/1WpgzBHKCtHLSyDxRMLu4qb/njZ9NT9N288zCZ6vEDfrXZNjwp+Fd3VLMs3wlVd0PL7Tb4PpqUWINwF4NrxWQDsa05n+J9XaGVj3s82eMZ2eQMygfVyONpnIemVCnfsbvWB/AvbwKrEy3g9GOQXCYiwrzEKZzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2p/UKre; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2p/UKre"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso1615218eec.0
        for <linux-alpha@vger.kernel.org>; Sun, 17 May 2026 16:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779060777; x=1779665577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zu6Cm4vKCGpycNeWOdKwx7wuagRDTRPWiUPVWb28tIE=;
        b=i2p/UKre4M0GUvpLdxGdRAeo+xHQNYy1MuS3nsE5FaOJ6iq6ckXDRCucXDVHZuXVPg
         nrqnaKa/MqkjLBoJU90CJpxSyavBYDTZi2JsiigVAJWCaAkJs37LxsMDA8YLS1zIkGcu
         LJ93qRRB0myqKmzarxB4cnzjD5fnTNB3eVHj/4IsRrHFMVdBT8BtE1yycn9qHYedz7Y3
         yvh8t0XQPNgdOrSncYU6N8aP3/y0u2t6YQlalWwXMopzuYYzeSC/QOP8iVNsBafW+zOb
         SL/VUaqriB/WhKfbZ+z3QMDjx2+a2mJJSZJT6M6qma7d2KjY+svOIKDKesuzNZmLfzHR
         Pu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779060777; x=1779665577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zu6Cm4vKCGpycNeWOdKwx7wuagRDTRPWiUPVWb28tIE=;
        b=hIr9ChURxAMvcDL6fGS5OklJAry6Qhov4NJsAOFRAnRQRaUqwNlzq5+dwNKWfdaOCx
         SWnXnYeih8g1sAMQcQRLwOx+cKrqXzhqHFFm39CTnpjic+C7xeR/08FJsOBXVBqQ/EYZ
         BHVRM9oUSV0P8xNbS6MANtKsIW2V5YPbqyXjLfaGq69rwqIvX20wtvnp6Nhkr9VdJrpS
         4Eve6xrA1KeM93pdPMqmugpTefYpYbYZ+Qoip1CxhiszJWt8pphfgyrO5A99Zd8f5PYq
         6yAZf39om70y7n+98VQ92Hm8IsiHQELEYdD6zCe+9uMYErmW5M/01GJ1fHYM3f002s71
         dMlQ==
X-Gm-Message-State: AOJu0YwQFpD9vQYdIAsMlNBFy3KEOS8iSc7cvc+gY3HYcPap54J7vTkf
	F84sW5cEkCKQz9/fnbXpcNlIjTStjWa5kdkTbBhhMLfk3xRbRD4BeksVbs8w/s5kkjY=
X-Gm-Gg: Acq92OFrdDV9mmDOY3OB2/+/YuAdVXaLPhRBeotYd+Z5K2zQlx5BzqAi69bfrc1x8bL
	RWniMTmegXC2qG9aUa/JqUGt22DQd2/hbeU2arfOhgoi5GfOVOfdNdT5qFtCKAoz8NyCrvRacIQ
	xMZGvSDHXQ3qSbLWhvORdXmV99yzGY9LBhEbQotArdCCNo8Rj+Jpm+2QPR/AaXTCP210pNix246
	Wl9czc7b+/cUSeHL5GsCHU4TLk938Zs+B06QKQitaleEdox+IF5i+QTvvB5SlawBKkxCQZYKR6K
	/3aYIr59c3ipFMKPu7U73kIPnDMZrMgIYN88kpQ2nYGgYakhcYt88GmwIuKB0kqwPPzo40T2zy/
	1Ibn8Yux9qDsuek3tx5AGzoOcPc9QXAwkfz92zWUQMJrw8CaVaFHzpuhuuwMC71Ypu9N4doi+pe
	0Xof5qWrCCXU6m4wWbGPTrsNexRDSbm0cQWKA8c+CyhqHBM8U0wiKF/QvpNIHlvKT/g+qHuVqu0
	DKtoN5dyk3QuLJIeH8oBEq9yPj2KiUfE+Y5Cp31VNHgKEiYOMA3Xd/8gdwLxZkzOxAzM0XANQKr
	tdkGMWCiouCLULEq+Q==
X-Received: by 2002:a05:7022:b8f:b0:130:6978:c96 with SMTP id a92af1059eb24-13504738d6cmr5530274c88.19.1779060776712;
        Sun, 17 May 2026 16:32:56 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm18466465c88.5.2026.05.17.16.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:32:56 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH] alpha: remove unnecessary architecture-specific <asm/device.h>
Date: Sun, 17 May 2026 16:32:40 -0700
Message-ID: <20260517233246.23915-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch/alpha/include/asm/device.h simply includes <asm-generic/device.h>,
and therefore the Alpha-specific version is unnecessary. Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/alpha/include/asm/device.h | 6 ------
 1 file changed, 6 deletions(-)
 delete mode 100644 arch/alpha/include/asm/device.h

diff --git a/arch/alpha/include/asm/device.h b/arch/alpha/include/asm/device.h
deleted file mode 100644
index 9ca75a7db23e..000000000000
--- a/arch/alpha/include/asm/device.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Arch specific extensions to struct device
- */
-#include <asm-generic/device.h>
-
-- 
2.43.0


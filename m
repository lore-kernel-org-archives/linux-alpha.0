Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1A8217F36
	for <linux-alpha@vger.kernel.org>; Sat, 22 Nov 2025 14:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763821060; cv=none; b=ezkk3bOly85mEENqM3tDroPyoDA/KA4+bfW4WkaD9cySD3atQfS02YtOAlkxuCbYIa9HqFaPwftSuYLbPYitsqr6CuoGUFlZYnnvxTRE9sN2huedOb13xW6FT9unX8or2M4BFFJ30c2plgCIpeGS4y5KFKhvHutoADOPDm+AfH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763821060; c=relaxed/simple;
	bh=9LLsvt7VNNfDM0aPRG5iggeE1useAYu1NfbeGLw1XQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a0i0JXZYH073lmD+ViKTu+CaI7jqA3An5SSj83K9i5l73B+YGNj9p3m5rOjZbPYGCBOtkArphbO0ulfJ3dS+j2Q1xIVlIvtDUqL+7LE49WNM1pjxr706ROlJ1UMEfLVk2HO/0P2U6YkCH2f53f5YaeKr1hpD/EFV2HXZpb+YJog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YY2o6US/; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YY2o6US/"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59447ca49afso1307512e87.1
        for <linux-alpha@vger.kernel.org>; Sat, 22 Nov 2025 06:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763821057; x=1764425857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GOwj7vYWM+0plQRjy8oxfTPl4Cp41ILtCWRX7XI7Uig=;
        b=YY2o6US/kjMVr5zHXIy3MuIXJteFTanv5ruc827DLnPkbDWfuCaxeei7/+y+7A7pzf
         8lvmQzQ6O0Hr/H+d61kPNINP5aMnKDpM/qb/0YYlZ1eNxkvI1qy5yUfx3iwj5y8UdUH0
         yx9RC9yRWwbsGkOtepcBZvTY3J8AaxrJjXkrLrhB57WZIPTMnfOUvjitfbuwgnfmIXuG
         6DYDjXQoHCcuedjCurJllTZxecyJylI/t244ibeaF1B/86LvF37GbLc5yyOs1o3EJNDW
         aFpi9RfnsSCeiUzb52RlZWCz8qIWQeTSogDCaaDX1b31XRgMn8G6CnsNwavkQTiOsjfl
         aG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763821057; x=1764425857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOwj7vYWM+0plQRjy8oxfTPl4Cp41ILtCWRX7XI7Uig=;
        b=VOobM4CNFW+zRPiF+J5pdzQawYewNABHhzEds9nHBVy7n7cD1Q7AtRxQoP4MqBfTj8
         Yz6LbgqYzjCTGSOjCjJ7RkmFHuSEGNFW1s4Yv5MwrgVJ7bKxhFW0U9anK/8kIJW70GBk
         5d8Mu2NN0N9qIrp/Q3foCl15goewIoPSmHBduSMvLpeNUz5dS1eO06nbUNjcxY+fsiNM
         +CVBVES/U9ZJxbs5YMEoEzdVTE4h5uw6/cW0ko76pWIzbYt7XuCJM5qTeZopIIxEuX7j
         OHR07E8vwlcmdT7CVsxl1pPNxlS7D6cWiPr5m7TAP3MuOr9dCgcrD2Csb1iWc0mxU5Aa
         DuPg==
X-Forwarded-Encrypted: i=1; AJvYcCW5C7sMCkPt6JP5v0Z72GiRVZrz7ofTe9QKVlIsy1j1ZCSyl8H8zXwTkeoE34MKZKofEvgpuJUw7V6dUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjpKsK/CjsTqhQSLqPvFH6DpAeTa7jsMY6wvUXiPd7NGl4ylmk
	5HNMUts7jxUBO5WuM7VNG8L95jQe0nO58G+KeqUcQZ4VHk0v72nPCRfU
X-Gm-Gg: ASbGnctnS+0P9CnnJI434cb+8luxjiihLwD+r79M9wCE/WLpGg++iU6uYo2+B/XWzpN
	UfD/wx+0En0k/oktjI1WBFwfpJYZ5j2AiWP+KVxcbpQSRUIvV7Piv9w9ILuyceey92YJ7c+f3VX
	uQxYzFkTBO1xo1SeZu6/GjpZe9hDYlWOrAMgX73YFcm7tRfbcNquHE711S1+f53xD5Sm+VxbvnO
	3YS61zOaT9IkA6SxeEO4qlF1tVsYJA0gG+8CijztATnXbEN+tuvqQghjhUi14Pn8FnSyAmDSQMZ
	WVuEVthFm0tdP+IwRwmD61xgwyH7BBWo2lT+0UUJdjVVP7Eq/egit8hqlZuUXXbpFVUS231Y7gE
	U+qjHdGfKZykWCEcJ3zPn9KL5Karmue8thQzelzR43gAtC19TvT0IEXV0LSrpVhEt6A/8njSuZO
	eI25o8Vlu1byNnbNPyaXgmr9/P6fp8nphQpczt2RLxYpTbo3YPiZq0zW7CPbv1ttI=
X-Google-Smtp-Source: AGHT+IFklu6JebwqnP8JZakPg7tHk6eSdpiLUuI/6kbSoLXPau2fC+pUuRteao94MnHm1vj8uaTVpg==
X-Received: by 2002:a05:6512:304d:b0:592:f5f9:f5a9 with SMTP id 2adb3069b0e04-596a3ed6389mr1854725e87.36.1763821056703;
        Sat, 22 Nov 2025 06:17:36 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db75731sm2436756e87.1.2025.11.22.06.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 06:17:36 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v2] i2c: i2c-elektor: Allow building on SMP kernels
Date: Sat, 22 Nov 2025 14:45:01 +0100
Message-ID: <20251122141717.28570-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the past, the i2c-elektor driver was broken on SMP. Since then, there
appear to have been some fixes and cleanup work (as pointed out by Wolfram
Sang) to get rid of cli/sti usage and rely on spinlocks instead. Therefore,
let's allow building the driver on SMP kernels again.

I've tested this driver on an SMP kernel on an Alpha UP2000+ for a few days
without any problems.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>

Changes since v1:
- Rephrased commit message
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fd81e49638aa..9b1473d720a0 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1474,7 +1474,7 @@ config I2C_ACORN
 
 config I2C_ELEKTOR
 	tristate "Elektor ISA card"
-	depends on ISA && HAS_IOPORT_MAP && BROKEN_ON_SMP
+	depends on ISA && HAS_IOPORT_MAP
 	select I2C_ALGOPCF
 	help
 	  This supports the PCF8584 ISA bus I2C adapter.  Say Y if you own
-- 
2.51.0


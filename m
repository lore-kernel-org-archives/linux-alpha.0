Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A937729C339
	for <linux-alpha@vger.kernel.org>; Tue,  4 Nov 2025 10:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762252537; cv=none; b=TK3WnPOEwuA0WCBHe1T3Hj3llYdkbJK6fwMR9g6HDp2sxM4g8pk0igcyrOBhNciIp8xT7Jr42tbnsDvSu0KF81T2cFAaDcovYkcp3G62S2Clu+UzEZQMltee6g+OJX5ZpGgr0sYYSdskIF5nkgTJw2L8iyInBnQynLOu0NQ8TlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762252537; c=relaxed/simple;
	bh=bbqVmDXrDhnX6ettu/wb1DLbLCvmOaoS8GeEhUZpDzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=khcNDD1255UMRklirgaJ+I9c5i2cpAgTM0YP6VpncmU2HkYGUq45QYyaMXJJVmV4qNNdo95fVJOy3EdwgOk761xsP2VYfpMEDtORpVs1CTnQ0Ge4PZx2KTRy+Pc6GIcoNE9JuEFE69RxOktUcSnPdRGrYZtcfHUXBJMaXA6oAuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDNtMli9; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDNtMli9"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59390875930so6355096e87.1
        for <linux-alpha@vger.kernel.org>; Tue, 04 Nov 2025 02:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762252533; x=1762857333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tCqV11fTwKqIZc7sHV3bdN9NOfZmBeeP0YyuW6jyL3o=;
        b=eDNtMli9C7dNVglvD6aIHOf+yUZ1T72ZZAxDQcefOZtNQf4q4isfjtPSFDHulrkCRC
         cw+fAqIZ3SzPGZnJCnbuxhZIfJkRn+4yBNhD+vkS0zN+H6ZzXtqPXKLfJfTMGZXmMbip
         gt/BiUWyVDVfG8b1cBKPip7XXF8UEBY5dRyh3j+2CJAkZOayykurD33t+bpfyYMYbOVP
         80zNBdO4X3nGNOxmh0EI8lHCpeBKbo+kcfSlkE58erL7zdfn9uDYu/I7G3dae81SJvCH
         WHguDse81U/TnXyMl5CN1S753M+2LIj/VeH5Zv82lZgFW5KfnJ/dmqp5jRjJcMk4WlEi
         uD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762252533; x=1762857333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCqV11fTwKqIZc7sHV3bdN9NOfZmBeeP0YyuW6jyL3o=;
        b=gwZyQlVK8srjVWLlsGTToMNPCiMxl/y4pNdy9J2RwDhlk3ssKml+KXl4UXXTrGLHVe
         ht2dNYXeN83rK7y2eCUSeYU6LRgyHMak2rlcK8olsLzVdjdWEW8gZuApH2vscir3fQu4
         ZsTKdes9EOM2ZqB63fK6YaJeGemRxWHXRK+g2umtnMrl3x0FTwr6rQZIKLL4Bg3Rl9j+
         6gHJn+9161++dQbS3Exl+W5Puj4hVRYGQtw2WKaGMO/MixwtlXl7v59zoF9r9JZjJPyq
         vvKKEF3Irnl/0K3//teNJAjuZSTPBdLWNSyUQBHMxTJHauZZov1KhdzW/1X9CNGv3p20
         Dfqw==
X-Forwarded-Encrypted: i=1; AJvYcCWYW5JPeVLdHVh3SZIXPX/jhsDqVTQfNaNkICP5DLsGjTqjm8uDE2RHIl4JcY1XlmxLbqi9sWUwMwEKFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFg0GMuglosBnZ9Gx7TJDeM5eQDBv8+vBtAk6Tdaxyl5KC+sas
	yt0cvf63p5MwAS6uLGVdQdBSSqoFs5reso24elp7cQT3GyfPShNMbain
X-Gm-Gg: ASbGncu2dPSvZRfUqjTCgDf6uyy14T2jY8kJX2f3rzKKw/w90f+M061eMVWyx6Iijic
	SX5nENX0pZsdr1jiJWSbXdNwdbL7hfOjLpkl6dDnel76PQFf1UyWbKEJ5Ishpc/CTCufZHvvpJB
	JHe7xtUUh0ozZeep3vgqBTpFgIAMOw0zF6qq0xNUiV0E2TPvse8HX+MVYQPREqa5c0D0XL+TONv
	DzlfT63ce99XZbirpC+aMGipcyglq7EVMsO2k4M4YDx9Eb+0wxkcCr3jgOMeg6LjsaaPLCRWU2L
	laf8Rw48JB1zdJqMLps9m1lz0pCnCVdH/2kDRvrdsoH5ONwrULNAj7mTI0zojtqHxUX2Xz8uQ5l
	p+TdUjqIIJYznLVfhm/BJfzrY9hvscnJ8CIrEh4NJ16/Dfx6GOeSbngWSEvOUqolAswc0wmBfYs
	yyWOmmGuvtmnxkShldG3Wp66heXSIm80CISOfMdXaOD2COjmynR5Lu
X-Google-Smtp-Source: AGHT+IGupWEQJSdIHTXfxGW2ZOZI7jMD+5WKyN4jC9KnhrUC7Pl19L+uPfMiiPVvBDHacKh80RBFrw==
X-Received: by 2002:a05:6512:3f29:b0:58b:63:81cf with SMTP id 2adb3069b0e04-5941d577dc8mr5490335e87.55.1762252532486;
        Tue, 04 Nov 2025 02:35:32 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59434456732sm627685e87.102.2025.11.04.02.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 02:35:32 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v2] Add Magnus Lindholm to MAINTAINERS (Alpha port)
Date: Tue,  4 Nov 2025 11:33:43 +0100
Message-ID: <20251104103525.26410-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Magnus Lindholm as maintainer for alpha port

Changes since v1:
- Rephrase commit message and email subject

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46bd8e033042..49ada25357e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -915,6 +915,7 @@ F:	drivers/staging/media/sunxi/cedrus/
 ALPHA PORT
 M:	Richard Henderson <richard.henderson@linaro.org>
 M:	Matt Turner <mattst88@gmail.com>
+M:	Magnus Lindholm <linmag7@gmail.com>
 L:	linux-alpha@vger.kernel.org
 S:	Odd Fixes
 F:	arch/alpha/
-- 
2.49.0


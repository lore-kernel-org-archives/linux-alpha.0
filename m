Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5905823EAA6
	for <linux-alpha@vger.kernel.org>; Mon,  3 Nov 2025 21:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762205844; cv=none; b=a7OXeozHeFEvTEkT1bzrs6xmQSx9oAFZj5GFX8NVL68Q5x7IHb/MzeAUuLppG2oQ04NTVB+qZCMQc9joXh77KsYAAfd3X+HBbpDF4KM7ZD+MO1z0uraRKaMC37qD3vjkSmiBwvlb+MRQRrnJfnu7qM1za5BJTUhaTFmsrenW120=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762205844; c=relaxed/simple;
	bh=bwUE0AEViMrnJrT5BeW1KiTVprJIxhRAE5QIy+9RaNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nbs7zreXMOmbVO7rqEPSYW3ADs9PAdWvnxQfDxQjZHRcjxNfwNL2F++715DnprIu2U/pquK+kn+C8EZyodC0poIUIPuwSNLCtvHMDRSqUfZa8Vb72k/qwurQmsDdA1saNYhrASaOjb9Ot+yNXXYd3bjEwPdcpYZuUi3BxM9K31A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qkq+0Hyz; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qkq+0Hyz"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-591ea9ccfc2so6041285e87.1
        for <linux-alpha@vger.kernel.org>; Mon, 03 Nov 2025 13:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762205841; x=1762810641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TIEasfEoWnWNY2LVqMGpsjYcqvlGlAzvdVLw5KGeMSc=;
        b=Qkq+0HyzzZHZ3N0QBhGwGsiRqaT2CPys0HVoW27xzp7zyMiPgBAzI1Ln45rbCnUB0S
         ZGhx0E5SHxqTwGXQD9MPEnQCnKYDYCVUv+rPgRxxM+fUrQjqdUle+HHFprRNlHXZzqAv
         wpeW0kZL7pamoPy0KFOSoStpQtHz3dfyA1b0LhQzcvGK6YYTruBYY3Q/JCpyFa+KDlUs
         st/MO+PYL9OjlHIhVvMGAxgfIX6dkD9TDSBrzk4ZLkxwpMjSYqV/n+39FCvEw4YwbmlL
         j8hj+7C1UKZGZ4qAF8DEfYYKykzXRDXWR/m3Xp51EI+gqqQ8xMNRI1GJO8Rmt1KSQdL/
         bSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762205841; x=1762810641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIEasfEoWnWNY2LVqMGpsjYcqvlGlAzvdVLw5KGeMSc=;
        b=fUU9Z/a47M1cUhMTa8FLvXKBHb4MsjZ0CnBnnb80KdN/mn7zNJiGqhiZs7qqCugLcT
         MT2x9r8pe2aLcFHzdinPY4TVvwSV6NlnzrpOBYh0Pu0rlGCPbkRhHTuGJex7aK0kBqeJ
         LbO9m5Qx6wOYiyuJeDKelM1NiO/mYS0Kl6HG+S6YlDRrPc8p3TKfItNe5VQ8uJI2KVGO
         w8fS4Yw0wpHfAZHLWgl9Uv5X5qTbXrv8seh9hb7J0h9s+yD0qOaFb+leETrK27x3e6Ht
         o77rJsAtwdp60r8rEDmkV4lU4DR+XAg8Xgb7QGKFMJLTfGVWGjU68GoC4o0oiVUrSnLg
         xMNA==
X-Forwarded-Encrypted: i=1; AJvYcCXLbz281MPUTL90f5x+fgsLru9dTTrpZvEEoadCj5tzXii5V6AyGveJkMrQqPns6bhKdytBgiw4ma8KdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgEgyqQqLU0JKb5C39xo4Txl+FiMiO1nGjnfTFJNLto9Tsx1Ge
	SRoMGPdsWrY2D8jaymQ5K5CcFUTBs8f7h5RqkjuPs5Qp7OSi9aQgxq+Y
X-Gm-Gg: ASbGncv3cS36e6HS7ng1RdOAmqWGtDNgzi304SgWmAkEig/ThR07yHwu+Y35ty/H+oJ
	BkGXGVDOxSknIMJcX6/+lIOJqoijhA94t0eLakNq4VRQKXt76K9FjJ1sLvueiD+gQoZpiZJuaj/
	XOIC4/LNtQG/YxPrrufs3NMHj3ge+7jCtNa3NiXZG5bY+uYjqK7VvfpyVYBybSDjEzBpeoUSPy9
	VYchrgGb7h6d8J2vFD5lf+o5I9MQTxiq5cotij/blLTkr8bJJeOY7Acf+Qyv9Ul8rMTPnJOa9sh
	B9Mymw6JnL6+iN+4XM9g07EFPaw8abh9M+5BwxNCf3jdUgE9q03hIhDqVkk3bKeiGbiM3JhMVHo
	l2x/DwWcgxSGlvaJlESeZACm8Ex+NWSE/D4sFMogFNKfeHOA5bXw+vsotL1CMH1DF51gIZT/e5D
	haFCk8c4d9ywiWXZCf+YXOkIl2W7ggch6Z7bDyF9ds/uROnzXMHDzOjo3Jw9Q8tNk=
X-Google-Smtp-Source: AGHT+IFnY7fYmvQfsaRaYtsmIIsqU4wi13OWjaEny68FhNPEI5uvWjpUlhgkcUsa48OnkmrLA3SS6g==
X-Received: by 2002:a05:6512:3b0d:b0:591:c8ef:f838 with SMTP id 2adb3069b0e04-594348c3813mr250049e87.17.1762205841300;
        Mon, 03 Nov 2025 13:37:21 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5943444170bsm200518e87.80.2025.11.03.13.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 13:37:20 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH] Alpha: MAINTAINERS
Date: Mon,  3 Nov 2025 22:23:50 +0100
Message-ID: <20251103213656.25912-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Magnus Lindholm to MAINTAINERS (Alpha port)

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


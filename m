Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75ED43E095
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277877; cv=none; b=KJnKZpRKbyNSSh0DI8/yXyT86WES3AwLpVPehaktocAJB+D0STg951V4LqjxseWETlCj4oFKYLPEHF/B8jRNTKD0XGLMhnyRL+sPZ+k4zZFm7CEBMV4tDaBkXIU9RNL9a1mUjGrsYTnyuCf5LA/NtwO7t4YCi2Du3yNo9kVfWPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277877; c=relaxed/simple;
	bh=gWl8UAp4D/Q44Xa4Mz5S7pR77pfMBUcuHztcdAp5g74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YIumQd22priGsJKun1L2MrHP2v5kkoiCQ5hqu3On1xhHmNPoYYUU3ZId0EjgaE5dEABAu9wdwYT1A8fPrKjVnjcBStzw5hszbNToB0q4AIO6LkTqYeuXPamUfDhjyhN/vEam8zqXEPKRMS4zML7oeBSdAREDMTsotwk80AkF6yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiaRjVDg; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiaRjVDg"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66c7e3a2332so1287352d50.2
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277875; x=1788882675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+VVH9rviPSHZpvcgAfOoqFaCYd5x2tmRedDz8qXvDg=;
        b=eiaRjVDg/r0F34dY3aunl42adU9UzmeclE59xxv1JoGRgZWVUjRAqlKtL49RrnbHu9
         TvtbiPL1dtDBVg09ZDEg0UPoUtKq/To+HU58iRceqVM8RMSu8Dju2Li8gdlaL+uUUCJK
         iL7o7r3avQREC7yK/eea0Z25FxGWHfeUZVxkQtUbNtHD/FrL7boE8BHi1hOD7fGLA5fL
         A2dJ7CsMsjIhbArnKxQYr8JTW7ipTAouFpKRZeEnoujzSvZL4ysJ5Ls4GSIAMB8HOPD/
         b1umItHQgitTlCHOlPVHGWwYvhp7okc7Gn4PmL2zjMoxoULzDRH3zi4QQMwUNH+wrmjf
         ZZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277875; x=1788882675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H+VVH9rviPSHZpvcgAfOoqFaCYd5x2tmRedDz8qXvDg=;
        b=fsuok6ZeuCOuEAYH7V5ClaBaM5zrXyW38dURtUB5WIEdz3KWug9dlgCMq4ieKsQS6g
         STAbhsjTiuuwly7XZo5RwuZ6Xp9eL5pze1YDG7uqH+7EqdRHNIcu3zD8jvpU8/pXa0qf
         NmVhN/aTvgZ9oT5UyNqaP4x3djZCANH6JPNYXnNhI1Cwdzsph9Ldiop2V/aeVEqGwuyH
         Du5Pa/la9vxKkg3N0Ocx/9EpdAWB8iuOCensQ7gSic8hOuekKtHYTzcZlOKgVUxuTJ/m
         ooIjX5engFhQGZ38fpZUwHHhTbclkcidC3CS4tUbmLaMRH1e8xJw1Bla+n5WDQOqWHNI
         M8Yg==
X-Gm-Message-State: AFuF++l3su/RR/OsKA2oteejLH9pBy97z1g9CgdXJwmXd9cDzDQ68E2Y
	zpFvBbwaRsT8hbi++0pbaa+H6JxUY2vDo8YJJwFhXnOpEVddGAs5IKHyi4wwFg==
X-Gm-Gg: AYBFou10W7ZnB95Yig5AzQyK+AgkE/lVbMikEnBldFLPYWpvTh7R2kxX+huPG4qXdjA
	SkVd/sDARQem7IYWp4WsnXgvQDD/2RreslOekjfQZybW6MjSzYCPemRTauEN4Fzvi0Vt0wEnXej
	ORkZM4EfyvEzBdW8jMvgAEyN2NkgTPgMVKe6TlnraOAksx5ynNabrn6Iau0bZNmwJWfWL90ulkW
	9EfZJ/eRfUj0x0T9wH18g8s4N8s6KXETWY0enJGXjUtpH3AeRRzAQDXKf5grofgbLRbBO+6YE6W
	HuDJ8sCsgfzjHjrmihkcnRbjixp8ZUaUF7zv0SkNizJQWFMCNt4EwD0+6bX/SFi84PqIhgZZ3gc
	0JpmiFfT7dUKRFSNZyhXnFcwfM2u4bR2B3ITIgks0ycXGRVnImgIC5NpUobg+w8c3gW0vwaB8cP
	+f1j5nUD1+pU8rzcwD1nkOCuxkTdecMLSIVWm4CJY8Yy+3qPLu2ORPLWQSfJ1oid5Klq579yt6N
	zy5JF06bwGY1XbuSc1ou1mZX25KIwToJSeP2SNB
X-Received: by 2002:a05:690e:4193:b0:66b:14e5:d226 with SMTP id 956f58d0204a3-66e557ba52emr8644017d50.34.1788277874782;
        Tue, 01 Sep 2026 08:51:14 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ed2a78bsm8600862d50.20.2026.09.01.08.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:05 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/24] alpha: select ARCH_SUPPORTS_INT128
Date: Tue,  1 Sep 2026 11:50:22 -0400
Message-ID: <526219643312193e0705586965703d16a6d4b60e.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc supports __int128 on Alpha, and the 64x64 to 128-bit multiply that
the users in the scheduler and in lib/ care about maps onto mulq/umulh
rather than an out-of-line libgcc helper.

Gate the select on CC_HAS_INT128 as the other 64-bit architectures do.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 9e8e571949c4..00365031ea6e 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -14,6 +14,7 @@ config ALPHA
 	select ARCH_NO_PREEMPT
 	select ARCH_NO_SG_CHAIN
 	select ARCH_SUPPORTS_ATOMIC_RMW
+	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI
-- 
2.54.0


Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13594472F63
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277855; cv=none; b=HRVTGAesiHf8OeSZqRuTMSd3WQzWMFyX7umFxgHAko86NUfMXb8YItrKCRbw2qVR605GlERQzMSnGRqt0+m7SvqcxqRh0eoKhhWX4V/9AHah5LTZgvI656VCo5h7/ZU0T24mimTVeJPEv7neILfatPPFjDuwCRE63zGi4KSBS2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277855; c=relaxed/simple;
	bh=WkH+G/IUZp196pivH/ywUdqvfOgTYjp4BOOTiZwqrtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RLSBKv3gWxbAmxTjr9NEOM+vOhl5mge7NTMCgBu3Y9KG4pvihdIUhQGRFOfb3wPg3V6Dk/jLNC5v43j2vLECCQ8C8c68eB1IYVCuqAF1maqcHiU2QmSKEczdYRqcF/5HW5ex3ljT+ZW+ROQWaM3PWTCRrhlMjRWfDZ6yPoJLpkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SV8TAAcw; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SV8TAAcw"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-836c4474028so1352757b3.0
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277853; x=1788882653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CBtC5RPylpY3M2iD/VpMaHKlBH2De20pZFAz1D2ARpw=;
        b=SV8TAAcwbt1JyajovWM5jxGuCdnCX9M8YAEF3tMWBSUAn2EuUvVx9R0WgJzabzg4vf
         47SsBqNbPsDLL9l52GHPeR3s5lNkWRvOfrNs3XRVpiSmDMT7g/JiYfPUpExo127dvsLg
         Dew7CGSUw9RRzZc1A0AhzOHDjhBVHEtWc81M1rZJIjK2UodoisxI0tvHD6d7xrthbA7s
         nV3ZUtVMBzg+QmVJI16e5ZgF28oOjkrTsV4KwnC318xb9K0ptOCTGUndOLdP2DS5l3Kt
         mfgzktGaw3ytaudeBFHg0s5A8KLVoYjrmpKF4irRC8Yu9hGXeVop8sd0CItSly7xEHH/
         qh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277853; x=1788882653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CBtC5RPylpY3M2iD/VpMaHKlBH2De20pZFAz1D2ARpw=;
        b=s34h5CIaNMWEDiQOFGys5ItpZt0O7zLsqPBBJ2m4Iicna1j5a36dOsX2glWkXHCeah
         mmV0Gq35J2fHWyKbDvjax+zOu0PG/0TLgkxhq36KF+Xh+jF1zZJt/dfiMyDeAOhxRAk3
         eWV1gaXUXXiZKJWBf1T+OQ7YSH9Cj+roxGusjoKp0utHb9TYgcxLwtBEBMQbIdlyLIpd
         H14Fj9JYXnLgJEfG4ecKKQymI/+YrxCkAd7I20atVaAYQOO+XAIFivYjRoNcc26w1Cl0
         8zB6lDiDuv/wDeZEi36gKm04gtAR0XAfNJ+YgTNOwj2wpO833nIHX1HMU7z2C6BKmeAk
         zDZw==
X-Gm-Message-State: AFuF++ka/xj9V+QlRUSFvU2tvkSJLnG69eHPlHBQw00qMkwC7GWBeDkw
	nlB4luzjPBqy+vCJ3fyaErSagBdrU9DVHT5k4GYKfUwMfnBgwwCg1OwgpY2MHA==
X-Gm-Gg: AYBFou1vIdL/yXwSjQImk1bWFwYhIYHWumLPPD9MgqRqcxugm2aR2+hClTxsghcJPjA
	HWTXDALci263emliIM9TMivuprBV0TG7l9lSsgteWkqD727g20p+7KL4UwCppD3NXxJRWGnoI1v
	v6Do9XBv6IJRL+kBX3HJYSchP9aOGVzn1TO4ENdcpDUiCn46qmfgiBeXLwmKkr7So66tgp/bIPd
	vgAiihAdQPejizbLUDwru4D3JwRcRcAldNStu77M8eqkDKXLPlYkPgfqXXF6WLJcAvp1a9c2e5k
	I2NK+Mh0eTnf5aSuJo9ZeThJFx0yBNUOBdcRT5IkoKNkouO2VtMQ+JybBCgr041cogsrvICuTY4
	30Gck3iG9KPC5cOAi2rgvhwNyuQ9ohNtjPZAF2dGmVEZgESDzvC07kb/VfzZw++quIYdW/YtZcs
	JdQ7cD2fBEjK20PUw/I/hxbj1ArVklodALwCQNBFw02d6XuRQim/Gt+csqAq4XZGN8gh3I7xomL
	eX40XsnnZky8N+FOHiAmCxAWcZus4B6IJQZyg6T
X-Received: by 2002:a05:690c:e159:20b0:855:37f6:a73f with SMTP id 00721157ae682-85d69f00d89mr105545497b3.13.1788277852848;
        Tue, 01 Sep 2026 08:50:52 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e65f146dcsm76899877b3.23.2026.09.01.08.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:50:51 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/24] alpha: select HAVE_DEBUG_KMEMLEAK
Date: Tue,  1 Sep 2026 11:50:18 -0400
Message-ID: <906b726c2f6a84b55365dd78ceb899e2559b76b6.1788277742.git.mattst88@gmail.com>
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

Kmemleak needs no architecture support beyond the standard linker script
symbols for the data and bss sections, which Alpha already provides, and
a scan of the kernel stacks, which is done generically.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index a6024590ea6e..a435b71203f0 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -17,6 +17,7 @@ config ALPHA
 	select PCI_DOMAINS if PCI
 	select PCI_SYSCALL if PCI
 	select HAVE_ASM_MODVERSIONS
+	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_PAGE_SIZE_8KB
 	select HAVE_PCSPKR_PLATFORM
 	select HAVE_PERF_EVENTS
-- 
2.54.0


Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AAB3E40E4
	for <linux-alpha@vger.kernel.org>; Thu,  1 Oct 2026 16:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873440; cv=none; b=cQE55iKvngx0BmJ8v/VaoaEdpU1tcAMZv8LtdYl8AXG5Ej8efvx8SvCcQ+f+wZ5BLqBaGF6jy0mUq7Imkan7GUNoxUVz64b8wli3x4SZKl+qsDCXz8mFuFqGZEFy5slAQFP0KUH13xZofiEG79YSIqMFjnP9hw4uFRy0Xtn6egI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873440; c=relaxed/simple;
	bh=bfDmBqDj0trYBMNSpDSBhSDsHUJ1O+BMBVzB461qpOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gOxxyq9d7ErFgf6RgsZz1JzOqbo6cbkx5zWAO8AgH/HbB7Ak7uqcj1sAqgzkqi4yETICPrDRFcJ4JJKzme6CHCDtYmqHf9jTjuJInEAGgPfpgBtuCaZxwRjvOG9OihVTL1ZARHLOALBeMk1H5xofVAiA+gfQ56N/agwMKL9yUyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oAjMpB12; arc=none smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oAjMpB12"
Received: by mail-yx2-f39.google.com with SMTP id 00721157ae682-8ad0c8eac08so8805437b3.1
        for <linux-alpha@vger.kernel.org>; Thu, 01 Oct 2026 09:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873433; x=1791478233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szcjPGieXEfqhKINUtFT84K24oT0iMiw2DuJ+a0prBk=;
        b=oAjMpB12L5xqS+xT5ewSNdk4W7LUo4T9/AeyMkXGNOKg0dcJhlrcA3QqmlrAU0/2P2
         TT0Rbs44Htvnxwx9Ti4p+QSTdNqd5qQW2szXvJGWyucNnfijQwgBj13xZvdaV3DhA6y+
         mRPPq+yabPRh2MZf9+h2249NKEtkOZAOe3B8kaHL0EXzo17PNLUdcEigWtnISO6YoxYn
         UqvZh3lg65klszwe3xBdRIQFdIfUq6pevCL45cG+D/wQbvadM30xPbf1V2GkRAJnesqW
         ggnMraoLGTNdq6AGUFbePytKJe7WW7r6fM8K1A6mOHzrJV73FVjGxkutIXbeWPFU8Gnz
         eCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873433; x=1791478233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=szcjPGieXEfqhKINUtFT84K24oT0iMiw2DuJ+a0prBk=;
        b=JWyHrmwrpcCO+fT2udglxkwVNdoDSmpOqdQC+DhkFigY5LHR8mniPa8rYsDAAlMv7Z
         6ijrdZj/8dHaLzxUPm0aEobe0P3CPOf4Gyq6NOf8Qb2Rk4pHt01Ro4+7nNiCes7lPxzs
         UfqGNXpN/mG7q6RhrE5cerQBMjd2ZE8trpPqeKjK7kBpoJrxqGMmkwwROBXzXva7PtZf
         gm22Q8OYU4Zx2OC+GxsZQb0bUwHb6cU2G+IHP/Yt8EZiXWyhNCONh2f3OfZRLshgcul9
         /KfHFycHqm+aktIHsk7Ktf4EjWxe93ml2acw/SDo2nfnzlTmY49uMCk1mTC72HxMjrtv
         iVTQ==
X-Gm-Message-State: AFq9FYKGiMuDuQeSo2dOV0yuMy30xlT2fhSzJ6LYRAFFcYQ0u+MC/l9h
	y40Pckzj1tbl6rfMfPvwDGXvdrzS/MrLZSL+ZolDO6Y5uEpY+bBCH4YaefGXOg==
X-Gm-Gg: AYBFou0uMLExhulkoJ7E8iKgEFQpmudHmzimxTN2iLIwp+r0HSFqo9LhKSUyhXwBGWv
	cZMWvLQQy4Z1sSeOvyV0LSoo8+bttbd9wtb4hjRGOOS/OB/Q0OciSv1OVtbgQgZokIKF1oGkoKw
	Yr7a6+dHz8kKENlbqDlGCS40u2WzMhHpQ1hVFWNjTliJ65nl1TpL95LZTr2jnBbYEiYy6qPlfA0
	HuoO76ms7SOOBkYl39sjJrTj9jFOCtkt+E2E5/L2tsdnHVh7aKcuDEGOchqPdrSYdYTEIw+Hn+F
	1860w3wOQkJIxP6rC5ge+gbDrNMNfqKcgkUYPZ6FxBxrvJ/zgnk4zxDD19twrh3KfHixWetI44Y
	zVNPFAvv5Uw0wQBQVIPMN5TzguOpsJrcIDoOmqVR7CbkmZbKHdJitIbi9GCuzCtNvEH0AV1Tnu5
	LhO59h9sFU5fA0hXXAEyspg+kvwBLY16+l1Dan1kYIm7AIvS26+4BeDrxh4hc1jQsD1sy42KE=
X-Received: by 2002:a05:690c:6907:b0:8ab:4b1b:fb27 with SMTP id 00721157ae682-8ac9342129emr21793467b3.23.1790873433102;
        Thu, 01 Oct 2026 09:50:33 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8acdac9c648sm13789557b3.14.2026.10.01.09.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:50:32 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org
Cc: Magnus Lindholm <linmag7@gmail.com>,
	linux-kernel@vger.kernel.org,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH 4/4] alpha: default NR_CPUS to 32 for Wildfire
Date: Thu,  1 Oct 2026 12:50:18 -0400
Message-ID: <20261001165018.415526-4-mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261001165018.415526-1-mattst88@gmail.com>
References: <20261001165018.415526-1-mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AlphaServer GS320 has up to 32 CPUs and the Wildfire code handles
all eight QBBs, but a Wildfire-only kernel defaults to NR_CPUS=4 and
ignores the rest unless the user raises it by hand.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 0fc61d986a7d..b5b02bb42aca 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -483,8 +483,8 @@ config NR_CPUS
 	int "Maximum number of CPUs (2-32)"
 	range 2 32
 	depends on SMP
-	default "32" if ALPHA_GENERIC || ALPHA_MARVEL
-	default "4" if !ALPHA_GENERIC && !ALPHA_MARVEL
+	default "32" if ALPHA_GENERIC || ALPHA_MARVEL || ALPHA_WILDFIRE
+	default "4"
 	help
 	  The kernel supports at most 32 CPUs. Only Marvel and Wildfire
 	  systems have more than 4.
-- 
2.54.0


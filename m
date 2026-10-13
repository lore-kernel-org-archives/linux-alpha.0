Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF04754B1AF
	for <linux-alpha@vger.kernel.org>; Tue, 13 Oct 2026 21:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791926166; cv=none; b=epN9Y8xFnBK+JUouk2usA5q+FMmB1tMPHLHrReAZdEXvySoIJUVZRP0kthjijfbn0PufslQdTdsBJV0Kh7R6dY+4d6oHenB+x+R55/A2lgvATbZDkGI4ZY6dXEPKfyhVCnEgd14FYCOrBLVjZsdCoHAVWAIx5Z1xgAVPvI4NdA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791926166; c=relaxed/simple;
	bh=pGvPZxYQqsPDT0NieGlqMGA1j1B4VhkvXqUEbOfXDks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PSBbQMHnhGqpAXHRWHmqi8AxdfTiW9Y2ldcar9m8V/gyvwN6GjOS+n03d+slyrRvAM0TwN47zZDf7c2LhTgeFw+Zlyctd5+qE/7p++nvbehnF3dDFgGToG6OAuHLYu+SYu5CPKDRwkg7ZnybpmGYzH4HbiAN5eBas38AY4l7DEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cF10bUFi; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cF10bUFi"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so50437466b.1
        for <linux-alpha@vger.kernel.org>; Tue, 13 Oct 2026 14:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791926161; x=1792530961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ED82b6L34mz4qhKpVZQtr88/BQW1IKL21JdDQLu4khk=;
        b=cF10bUFiaVe771UsZs1SORXtr4hX1FNuXS6swpXNZrRu/5lPl6ra0DCZLHhhq7xAnu
         tAT9kmzS3Gker2q1gqAvniaszhNuW3moxFwsrU4mq4F/rpPQX4uUXlEVEu3p5J1APeFF
         AdXUOFqZnT3Dr7B/WCCruxSKdndhr13qmZYqvekx5rEp+u5SgTNIdZUqqFaMuuAJX+0h
         sFH3q9uTGng5xMX8fiTZfzuLJKShrb2z73+1ZcKG3OxZGq88rSrr0UEe/T7gtCkEb2n5
         +W1vnGJC/3PK1bl4Z0lFpBAmQsCOos5PPuFMwZ4gD3FcO0ppyj7B/meknA5uh7v6yf5c
         ZrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791926161; x=1792530961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ED82b6L34mz4qhKpVZQtr88/BQW1IKL21JdDQLu4khk=;
        b=rhXgtpycdu5yE/Vs9lPttFyydQLqaw/esuYh8MBAoUxsEsClxysgCbblXXO47Wpb3v
         Tq/Ef7mfK1ikEQTScdpES3RJp1PQDEfovDx+Ldvvj2Zlb4ersQjeBVOzjgbw6vzK1mm7
         t/k85pFMHXJ/UQyzqSjMJ5Zzm02GvA2xXfh4bQxv/Hg8mPHBrESn2Xf5LWORTLvl2yoX
         k8nmzfbmJVElCj2nfzF7GkAm5j9pRwOfy7HSWc1dC6lAJfnaPE4PRjiHw4cHFU/NupOB
         wmRh9T3m1zkO2rd6hYRVTd8mXYZGjVBKRBYU0wrFjgMpsnmg1sZvPhIpHaz0742eXDEs
         c8ig==
X-Forwarded-Encrypted: i=1; AKwUvBxIwwpR2ZrTOEvDX3TUSLpj03pA5NCLjvfy7W7Jhax9S05eT3pdgb3O4ROuCbnVJYpNt6Kq5vo/OJXyxg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK5znid7O2IcLvTvo6F8k3O4n4Dxka10msf7uoyHoGT1RbD3mVE
	meSuI1CyJIIj4+aBjtckNlqS+WfxNJ8QySzmCvUgwr2gDwCy3a0QKir8
X-Gm-Gg: AYBFou2BDgjPSwjTVPr6u0LxscRzGgzcciHsOYCaJe7E01BzSibMVEl3gyXEkjvjJtF
	k0H8mwHqMAV2ES0dRpr+vExWOtsdpL9rfpaT3hPy2Qhd2Th5LyiqbyUa6sTEtyUcNDK35U52P+B
	GVgiEVEmLt3oy2gLWCC8cwmo0VVj+QJ7aE2RcpNlloAwFONjzAyz0xZBgo8veaSuIT42GJ0+NYl
	t/IxuKWUwCU5BNaKDqDCChCFClHxTGh1OTk6t2/vknP7SBkh+SYP4cpNba7XG3imp6gOMmOfs+l
	gGPqDhUs5d/VUlL5e6+Xr/GVgDi2TTXZl/B2RHlOef5GTqxW+Kt0hUUIShDUK4L1OitbA+xoT/G
	bjhGaQiuedGHRrLtrKWUH74ywMYnT/1nZvSL5bc9TJHir2iy30a8TtQpdwWvd4EKz8bbBa/c1m2
	A1IbUoEZfNe05RmZpvcFdsWXCCqQsaM5rGuK7CeZAXGdJt30J9H9Xp8K4j0z5j/HxZU64nFaOWr
	fLfE9xVEeKAIBKXRMBRrzTMgqgRxjZ/leKvYh0c
X-Received: by 2002:a17:907:60cd:b0:c2d:c8be:4e71 with SMTP id a640c23a62f3a-c31aa02468cmr1265532566b.19.1791926160856;
        Tue, 13 Oct 2026 14:16:00 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c355555f483sm256776766b.23.2026.10.13.14.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 14:16:00 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v7 2/5] alpha: describe the Tsunami system machine check frame
Date: Tue, 13 Oct 2026 23:15:35 +0200
Message-ID: <20261013211551.991723-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013211551.991723-1-linmag7@gmail.com>
References: <20261013211551.991723-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the five system-specific quadwords in the SRM logout frame,
as documented in the AlphaServer ES40 Service Guide, Table D-19.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/core_tsunami.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/alpha/include/asm/core_tsunami.h b/arch/alpha/include/asm/core_tsunami.h
index 3391e95754f2..fe3fd4570fac 100644
--- a/arch/alpha/include/asm/core_tsunami.h
+++ b/arch/alpha/include/asm/core_tsunami.h
@@ -283,6 +283,11 @@ union TPchipPERRMASK {
  * Data structure for handling TSUNAMI machine checks:
  */
 struct el_TSUNAMI_sysdata_mcheck {
+	u64 sesf;
+	u64 dir;
+	u64 misc;
+	u64 p0_perror;
+	u64 p1_perror;
 };
 
 
-- 
2.43.0


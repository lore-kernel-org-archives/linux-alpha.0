Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DA151599A
	for <linux-alpha@vger.kernel.org>; Thu, 15 Oct 2026 10:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059853; cv=none; b=oyqz5ra+NbJ7Uesh6JxAH19FshjD+wnu4O7j0/42++P3n70UiQMgPP+MJvM2CIG7J2MpP7OzxkfoGIhMUa0s6HfzjeLk69HBGvMFnvL7HKqHEq7LY23wUgoDLPXfeuAiqmcoi+DTqbFH136NIQkWL1R+q5aj8FbEw4cUhWzcaOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059853; c=relaxed/simple;
	bh=pGvPZxYQqsPDT0NieGlqMGA1j1B4VhkvXqUEbOfXDks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nu9BMu76+hWasfDeXRXQ2ZAnsXRIk14+/rfuJ9alr4i35BBmq+P4kIrmS7jpAM+Nea8oMwyWvHD3dsM8aSjrQ/+ekL2CVKkV1guRxckU17M3M/Ru8itCJ7ho6UaFVA5OCqPPFNU26srbOgvgQU1C8Gb7L17k2Ts4Iho+iDW6lhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpxKabw0; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpxKabw0"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2e2007dd8bso849023366b.2
        for <linux-alpha@vger.kernel.org>; Thu, 15 Oct 2026 03:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792059850; x=1792664650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ED82b6L34mz4qhKpVZQtr88/BQW1IKL21JdDQLu4khk=;
        b=LpxKabw0qPmFJKl1+ST4agaLcAkK2YZ5c1iz4GakhNp6VBConLgnqf0SVDG5RDAbAa
         1NoumD4XG5nmijOoqxtzCKDAIaFW+vUn8v5CxDxybI2f5Rm1id2HdxLuE+kA2Bfu2ZCs
         BeVNE3hDMjMU3k3305ZsNER2a2p8LD8OwE3SUpCltdC6usJsKxJZpXhUICs8tzS/qC8M
         46D/zMfc4NArdjxSnY6i0uYm5n29w70+nsuXm5j1qa6VMWbA826tySAN2G1Qx9hc6Q7o
         lRWgmZbgIy65ESRvhFOQCUz+5dAHd/61AALJGgl2ZRglS/gSTUrryKJsmWQky54DoBCh
         j83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059850; x=1792664650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ED82b6L34mz4qhKpVZQtr88/BQW1IKL21JdDQLu4khk=;
        b=bzxfWM9jfm5tbBlk90BT/A6SCEqh8nDc0lLntATmt7E8U3qyiIautcex+TeIgADCyM
         fpxiYIadiw/Q2FjoG3Q44eHY9oszA34nCsfidPqXpuc1glm2AmfuI334oxtitBvR72Z0
         SxbZ4sDVYxmJU9HUidR0vVXLwFFmoG7n/FRo1Aw9IrYe9DlNMbcQcU8q0DNfyecIfbEl
         GwoqQZPs9JlEAA2JC923eb40KoEoIbI9qFQEJcRAzvB1OE+xjfV0nx3XVX9oLe2Z3eCp
         kZgSBU9ewCc5JbI6dqjVaNCPfef8NiIYdfoaMln88JOoeGK7GCBidpZ3xWpdiLdJdsx2
         lEFA==
X-Forwarded-Encrypted: i=1; AKwUvBzyG+YzaNRtwMBf+yeEozNXLWjtozz4ORzLV8jvBL+TUMhVZDScuKk01QG1tD/rMA7yVD3gpZOaB+HmoQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLkDDfCa1gXPz2zcan5qfJ/iQohCLcjbCTh797Z+S3MwNUaBJ0/
	SGbS/YcbnqXHVDKhiNN3+jv6b0kOVsIiiV+PM7NbeXEuWpd5xLY+SKAw
X-Gm-Gg: AYBFou3qqZKWuUrVo8Mua/0UZVjUnWK6GJZWgy9KzbMpPtNkts+HJB4JUSH27xOPms2
	+KVPe6L6f4+ewUgRDo+c1X2qrCr26wd9o99BvJMDOrO39F5WO/75gSzcK53h9kNNfMSM7vwX71M
	D9EHlTmShJPcgaj9RePt9tqWJlff8yQ97BE4MAmmm57DMxarMnuhP/lzInsjJw5+ZtWl2PCOWY3
	q0A5ngnRpixjkQTfnYSYwhNd95OOzyAd7pTIeLIl37/Hc9BnYIEf4O3477WZJOBmuI+u6UKMLg8
	0ce1QjXmA5VzdLVHycsUlvZBbdrzRfBUq6kUBulFil3Ypuo+oKTGmtlQoTGqKT6Jl79LvIFm5AH
	9b4rTd/Q0TrvP0j4TPvujGbwiVxSUjgXqHyvmagYY87/H2JzBYEBn3HDVg9HeWk6UnBEzXrWDyA
	JXn210G6uO0vB4Z5sNRY7BXbCdTkj2Ex6Mw8OgHaAltibJO/hwxSC7kgMtWchBDansqCiTCc/vU
	jLVCw3a/SlL33tU3XwgHbAcW0LFoZTpxRatjuyzdA==
X-Received: by 2002:a17:907:e916:b0:c3f:84aa:af0d with SMTP id a640c23a62f3a-c3f84ba35f3mr84289166b.18.1792059850126;
        Thu, 15 Oct 2026 03:24:10 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab13f4esm108371766b.87.2026.10.15.03.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:24:07 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v8 2/6] alpha: describe the Tsunami system machine check frame
Date: Thu, 15 Oct 2026 12:22:51 +0200
Message-ID: <20261015102353.999695-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015102353.999695-1-linmag7@gmail.com>
References: <20261015102353.999695-1-linmag7@gmail.com>
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


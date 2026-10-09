Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7666E4D6C4E
	for <linux-alpha@vger.kernel.org>; Fri,  9 Oct 2026 11:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547093; cv=none; b=t7fTr69Rgl00GAKKb/vI5iU0oFqMjlnoeVsq6gmlf5wOl9+3R7uTgJw7UlqORtZupD+hnY1+yI8uSOozAKy0fSDC/ujMCumRtttxFT4AVBsjoJqQfE+jUfGbwltmqJ+ZZIwPO7L3PpK/Fgb8VzGXc5iFnd1eLKog+6MVkevnvTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547093; c=relaxed/simple;
	bh=EXUT5B8lCotVs1uA94vaqSywnx7z4x7q5mM5Bfr8gEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ADFz1hjm+3FeTn/mmJVIeVnMz5jQG0H2p/22esiW0yTeSZ1fe7XrM8udhe7NFR6UYO+nm2DItBbY/4rZSs0KrNVncyWgrj+XoaNwfbKqDM3EbSK0LgajiWg31eVM763SL2fTW9D6FCWhgRy5MXESMKwaRx5/J82XgfGOQqko2XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYjBR56f; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYjBR56f"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2dcbcc546fso496755366b.3
        for <linux-alpha@vger.kernel.org>; Fri, 09 Oct 2026 04:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791547085; x=1792151885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wpAtn+CYFHdc5XI+NcILVNijP2cHgH3lVlMnRBlNzfA=;
        b=VYjBR56fl8hqnS+8FOc12gXLJBaCTd3HWLGlNr0delgz1bhZ2vTa6K+UOG5hOzdMOZ
         +uJEO1cY6FeXL80kV4t+wE8j4RfE3ixjgBBYLQfX6Xqzl8pLcyM1cvgfOLN9+JAu1SSP
         +Ypn1lHIrRKvy3rsYv6aZsFXX4QskHYAGQCDUgZfW2oW3nWb+n2iCBqot0YzYLYCbeOx
         PCF+8XY9mH0MWcNmcqRiUBcz/kRu3SYDXv8XFUBww0gTZc00/RnX0GJJkpfMd7bw7lMS
         yN4qbmizjZdQiUl26WtSdmV4aFK0GjhJmrW2Nk37sPUhX6DD6W+v+GuTfkvQBcvZb3JN
         FQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791547085; x=1792151885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wpAtn+CYFHdc5XI+NcILVNijP2cHgH3lVlMnRBlNzfA=;
        b=qqSkzPpm9ZifIb/4bNbnSt1okkYujX9SutMnhjXy6lRi8EHQJ7WJMIQIQVvA1AjrVq
         REYHHvEmlGeYgMa1ruMGXwOrrlVzx0aGP7N+JEQJAwRJ0p+H3x6wgWyzR33ihmv9y/4A
         DHYlfvoJtxDA5DvWWvYkp6iDwoTRPeQAiqVEwUzz+9EOPV2CQk/ggGhp6hLrfSXHRyIo
         FpErP03jxJIe/KeNfJEDm5/aX1pgbPDXkoIEhYraSZQbI9/TY8YRuoLQZuCxv3qB5hqW
         kjUmZT2Vxn6AH3UcK0E7EgZQyu6mY4X2gUEOW2tg2FkLIwWlOnfxZfLzfhUbwh7uEWsI
         DOCw==
X-Forwarded-Encrypted: i=1; AKwUvBzu8mKkjwGJ3chOLOaX2WwJyjmP+ArjLDrtccNoJb3gca85yvKKdbuY/mXGjNvRJXZq+4P+BZJqjIOgdg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4sdWID4WDOm6afS7KGvAK8AHNTNC5zND6PoBR4Rt1rNej13dE
	pCe8KjCnUEeWYA92Z335kQM32wEjUDmyxrHz0Dv9B9+jI/oVOQlNIC3F
X-Gm-Gg: AYBFou1aWFuawZI1nq4l9VBGB4fs1u5N/NgQskvsre9RSPi8FBkkkwX571Fk3KoVmL3
	/QhzlGHgXxJ2mjd37baLyy4FHS/JRgt7DQCI8snDjNEzjiaUEkUAQ5uP5wTHcypYOHQPq/DRTC3
	crbuwQfjKhZaDSMeXrOf25M0cGdX30beX6bBtP3DOHZTZ1imPCFV2Tbe4jTcmVe1PGBM8Ao2ZLs
	OaCJg0bsTCKT8p7Ms+winiVE897V7dKRyKzufKQ3adVOgZ5O0sjV7qMg8fLmtkBMAmwOkCh6Jb4
	z4clKMueLl7tuKjs++i/XmHJfIAKxixJ3OzP6H4JOSRMs9FK5qkll+Wp54GbRW+JHPa6npMNlXA
	STuXRJIXwOA2eLA88u3CPKg2KE3mu/7uGi0Uql+WCXjXCca/qm/XSuxZ5sx2+ZWVF7HVT19az5t
	/jmfPfK4kMLvkmBoaXsiX+tPe/T1b0ZLSeWYLiAzS4zv5XF85PRmervlfLvcTr2WB4HAwBrvTNm
	XEKgDnGxWq5QfQwC419sOt2Sn4Tej65JQ4CPnTh1Q==
X-Received: by 2002:a17:906:f586:b0:c2e:4742:4c91 with SMTP id a640c23a62f3a-c31aa08e8a5mr159152766b.35.1791547085523;
        Fri, 09 Oct 2026 04:58:05 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31aa825e4bsm78525966b.9.2026.10.09.04.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:58:05 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v5 2/5] alpha: describe the Tsunami system machine check frame
Date: Fri,  9 Oct 2026 13:54:38 +0200
Message-ID: <20261009115627.969047-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009115627.969047-1-linmag7@gmail.com>
References: <20261009115627.969047-1-linmag7@gmail.com>
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


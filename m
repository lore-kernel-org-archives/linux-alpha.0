Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2D437DEA8
	for <linux-alpha@vger.kernel.org>; Wed,  7 Oct 2026 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791408219; cv=none; b=fSnsUggHBOb96oybEk7P0J03AJW9OA7GXspBM6pldEAOcGd9zs6INsZ4+j42v4tpPvmQIsaCSILrMUOCnjLZOYlh0CLkMH25Z/4c90ueAzylSb3e8U4CFZZ/q+fN35aEwFWlv4s6t4KDqohlSS4JBTnhoFc/nV62m504MYSckAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791408219; c=relaxed/simple;
	bh=3ieiHI/Mp/GNcGFX02Qg6gwoLtt+hpQKuZUcqNDGkSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OWlIyCrqmpksosDaUtmsO6KPrePOYIUd3+k5UVu3hJPltzz4twWFKaESjctbdui06hK20NzqADcp58LUJpL58adonF5mMJi3bH/weJpbynxOF53/sZYKgemrgQo5ljj+mfcgAwtkSkpCnEJNxX4HS1+E8060ZXzjRf+3l8hPtA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+4bPP9k; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+4bPP9k"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso18914625e9.0
        for <linux-alpha@vger.kernel.org>; Wed, 07 Oct 2026 14:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791408216; x=1792013016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aOHdvDth2vK4aVaNOG+jUkLGd78RtGCVNS/yVM6geL4=;
        b=G+4bPP9kssXIg2LigkBWmvG10TxDgeyqCH3mjwQgy/49QzcLVxH908HB0v+JIKvW4A
         IQbj3q0pUblFRSI1n3HAM9hMvmWOyaX0OEB8TTNmTfl2u3w6Qmb1Ac2VfdF8PTZB7na8
         52x8F2wolIer3Urv1sExr9d6Q0ItYv/scdfIGgmWMzuHuxqwvYdEX+o/rHd/fnqQ3NPq
         jdS7nxWcTajbgmNa+L/3+mnAF035+hAcMBcXXJj9d+43k0TBpORK6L80hMGS6D4u3cw2
         1QDPD5d+FgnlMFA8/AO238HItRWWA+vXpoy6f+dCTIciXpNvdWwos9mew0TTmgn56Ai8
         CvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791408216; x=1792013016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aOHdvDth2vK4aVaNOG+jUkLGd78RtGCVNS/yVM6geL4=;
        b=kGTydJgfqPFhbQ1YElJGopMHJKCcKhMytF4DMZOjXQCZaA/CnaZ0RXIy/y95gO2aFe
         P3/z9wfQvd17MxlvKDxMjm6Juh98aRQRJhfA4IfosVJabPj5dCsw4RO9nvoMEm6W5w+g
         UCHUnTvMcSWh5o0d6XzfIUQSd0iX3ksPaPIQEZBzZFMZdaX72PEu+LiJ5Q7iBR/k1W87
         N2dNmjw+fLLCF1S2Q8nABR2hg6uqdigNYxp/wrO+eXjIAJwpH7vVW6gNDY43pxDO0zNG
         S0yJ9y9pTeuTS6hywAsR03y+RLfq+n0CGU/7XBMg1mU29OgD1LWpDMJqjM1FLz+tDeAX
         9HPg==
X-Forwarded-Encrypted: i=1; AKwUvBxmE0+i29Rjh8Db0FnLACcgN244leAtNumwsA9CQfKVrJcXsRSmXkXEhelE8JyfwWFW2TfbjnWjFMAXyA==@vger.kernel.org
X-Gm-Message-State: AFuF++lWvcLwN+yKBLehXRkxqp4Z65gm/g8+n0Um2G4+RKstQaZpFv6A
	RlCLfsVUiNREZioYwW3CNySQYBoq+b4/aKfQPQwspVx3mJtHgaQXHlRWU4NwP9oXnMUG7Q==
X-Gm-Gg: AYBFou1R5U0bN1/BMmCg0OSyflOrrr6IO8fm6Cm7pSj/52RqYIlcoq9Wp9yz/uCVQC6
	WHEZ5ujfMnjNip2ZyoIEZE0C1ZgdnPRiyBTJ72ZXvCD/kHrYjIkBHiLhUQxkUuFFXqM2qUM8cgb
	RFvXwc9TCxMJ1pOomKKAH8FWYifvQZm/Hi91J6E3DYwIgzQNfPOU/7+5GoFQdL6FjIlWcB8pXnO
	a3jVGyy0F5AiYAWfxyqX1O97tVdDjPYKd1L0J9nn7UtxYzH8iKl59J4YgSfMRQ4TOuH3l1D4AxT
	vO+saywzIcV33Nj5P8loEKwqPBVhARYMDlciXbEFryN0Clz26fmopEtLwpYd3xlL0cg9H462CZs
	SDn9wYST1kmxgLwidZItmjzALNxdpZdty5jXHThQ/gmkjnanx+ETPbSdRbuB/JA+cj7hrpH3UAN
	BtdqA6KQ0J/hznFnM+ibaCDweh9bMRvrsWcT6UYCgFvtkVAMKXqM0dpSBthNYfnhklh41s2aojz
	4WcBfVBIDJgrvvNt5wguhzhaqUI17wpXDSRhgFs3WFNhtG80U9dF9AORXD3pISx1JVBkiS6
X-Received: by 2002:a05:600c:5252:b0:4a0:1aa0:7cfa with SMTP id 5b1f17b1804b1-4a18041c4b2mr61608045e9.12.1791408215819;
        Wed, 07 Oct 2026 14:23:35 -0700 (PDT)
Received: from voyt-laptop-dell.fritz.box ([2001:9e8:bd59:2b00:37fe:a06c:16fc:545])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18445b6b9sm18424395e9.8.2026.10.07.14.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 14:23:35 -0700 (PDT)
From: Dmitry Voytik <voytikd@gmail.com>
To: Matt Turner <mattst88@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	Dmitry Voytik <voytikd@gmail.com>,
	Kent Was <waskent6@gmail.com>
Subject: [PATCH] alpha: remove a duplicate line in Makefile
Date: Wed,  7 Oct 2026 23:23:14 +0200
Message-ID: <20261007212314.969336-1-voytikd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant duplicate line.

Fixes: 234306038064 ("alpha: Fix bootpfile and bootpzfile make targets")
Reported-by: Kent Was <waskent6@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222101
Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
---
 arch/alpha/boot/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/alpha/boot/Makefile b/arch/alpha/boot/Makefile
index d8dba85e606c..1ac823d93801 100644
--- a/arch/alpha/boot/Makefile
+++ b/arch/alpha/boot/Makefile
@@ -99,7 +99,6 @@ $(obj)/tools/bootph: $(obj)/bootpheader $(OBJSTRIP) FORCE
 $(obj)/tools/bootpzh: $(obj)/bootpzheader $(OBJSTRIP) FORCE
 	$(call if_changed,objstrip)
 
-LDFLAGS_bootloader   := -static -T # -N -relax
 LDFLAGS_bootloader   := -static -T # -N -relax
 LDFLAGS_bootpheader  := -static -T # -N -relax
 LDFLAGS_bootpzheader := -static -T # -N -relax
-- 
2.55.0


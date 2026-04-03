Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3B133688D
	for <linux-alpha@vger.kernel.org>; Fri,  3 Apr 2026 15:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228625; cv=none; b=n5ggAT7PSvgI43yWQQz25gTQufHkOKf7BQsHK872n2VEeIih0g57zknOCi1M5P6lGesf5ln6ZIfqfFndCOjyUc9MuMB8uNUgDF5ZT4oyFWx82XxuGGL7ctYV0pu5bL1gLZvz2YSqY04EzvxcwPuAXDaGAijHLa8BHfYCFxt9sZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228625; c=relaxed/simple;
	bh=XCMS7k6CgeZB3csy9pq7EvazIKrd5EQdEHXqEzp6Dgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JUL4+8kLEF/agM9omtwFhP+O42oEOfrHnBk+G61hcryxAhkXzVXoCFjYg4A8ymcrgt8Ay9iDuzNVX3L+O4RWaDRmHgQLfpDugTS3Y+2wLfj0mPfZVARJIpJ/sK5PcELw4PHvxxDcmklvyQvkbtTHYCPj8G4bBiFNBFlDwWe4Lsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pY0hh1jZ; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pY0hh1jZ"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79495b1aaa7so18835267b3.1
        for <linux-alpha@vger.kernel.org>; Fri, 03 Apr 2026 08:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228624; x=1775833424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M8bplD3jbYsbQWbLfaU5uM/qKEGJ+sbfo/352EZGhsM=;
        b=pY0hh1jZgn/qfOL5IACPE4ImcNhfj6GibNCC1fwUNWyCjgq98NDxKZWW6FTu5O8Fhk
         ZP/kdldVZhZ/6HxywWzy4NmtaTfCsGseAFYZwZ3/z54sxR3dAYn+2FMtd2/DjkJXBR3Q
         GlQ80w03dPM+vzHZbFJeROA/7s3ZBdedtsvno8ROn8wd4mRzFdHPpiFMJc8Sm8X6yx5q
         JjJ6SlZTXOHC8GwMsSYPRkRkoxJBYAyKywdshUv6xVV2SxEsZi7ws3dt0LKBKZQfxZA3
         gnSVFBvtHBlZuRk0Oke17i+nEoI70vsOWM+OXzcAvAAVEskYJKQcb2vQX2lgtx+xSoPC
         9xwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228624; x=1775833424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8bplD3jbYsbQWbLfaU5uM/qKEGJ+sbfo/352EZGhsM=;
        b=J/4hSCdZFcD/xo+oa9gKZMmFRprvR6Trl2OV4G+3tgIqv9naW+vyhlGe295k0kDt9i
         58qP1pD/IGjYZoqhMqrw0q+ZkNj0ZORis32oY9frjo1lhpKoZtOWZ4Ubn3aw5VOrzavh
         SQ5CMTh3Oxx30ITs3w+nO97W+1uOPFY6d42nIyX3PDD0FMMfCzdmSVwYQJHQC7U/j9gX
         1p/R/yoS09JLf33XpECDeZgKkiGwL29P1ud3xVvEyC2cDtXTINHpbnCtTLRZAGw9AGUW
         XG722s0J7+o9eoWaylWwfqUx4GGWAcU8ng2S2v+7ZHF6YMjaeAlhnUbqjwogYGNgVHBe
         MZjw==
X-Gm-Message-State: AOJu0YwtnP3PDjPiKtRR1tRhSFwPmzhoYDt5veSTle9EHNrBSOsBQk8J
	X8ZSkdzA3u5AKpJR6O9bWR8aUPbumYFd5XLF7YIePffjk1z7fHc+WHpD
X-Gm-Gg: AeBDietBBnhJi5MKxQ8r8z692a/Nl55MbFRNE8rnC4QD/CcgqhyP2faNl6HBxnKDiSx
	NNt1P3zQhmyoBulvDVAUiAGP3kHjaBO84InA5CiZIAAv4iUMOV7ezKJ192xjCYFEjdP6iGIQjcZ
	SMEVRk0OIJzST24TxTDucR+kaGkCw6D2HgiDIj6U2Mx5SkypLad7QLNp1M/9uSPa6+6ctRMGHmI
	tSYmN9SvQxQfKj9bTX2ikEwO7bF2uyk5e59yMiuJYEFbtqFXGM5oWmgzb8z2IT6uTCwW6oMMdNa
	AiWB/ZZINBXd2cJ26aRz5bogdoDuAqFX60Pj4XvS1FwJOoI6FLqbQLDkxy6/pxK0Opj1xFMY1qF
	xIUsDUlsHWx1ZmT/OxPPlDHD85guw/1pyCS57rlRbkOMbqetGvNooGPZnvKHSGWOmZheHcxO0f/
	UvJ2CasavInqz6S8fNzAU=
X-Received: by 2002:a05:690c:e3ee:b0:79f:16d7:1d7a with SMTP id 00721157ae682-7a4d5f552efmr34586707b3.43.1775228623644;
        Fri, 03 Apr 2026 08:03:43 -0700 (PDT)
Received: from localhost ([76.195.202.134])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-7a3709075besm22398287b3.25.2026.04.03.08.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:03:42 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: Select ARCH_SUPPORTS_ATOMIC_RMW
Date: Fri,  3 Apr 2026 11:03:29 -0400
Message-ID: <20260403150340.489381-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Alpha has native LL/SC instructions (LDL_L/STL_C, LDQ_L/STQ_C) that
provide atomic read-modify-write capability, and already selects
ARCH_HAVE_NMI_SAFE_CMPXCHG.

Selecting ARCH_SUPPORTS_ATOMIC_RMW enables MUTEX_SPIN_ON_OWNER and
RWSEM_SPIN_ON_OWNER on SMP, allowing optimistic spinning on contended
locks rather than immediately sleeping.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 4329743757e3..57c91ed67b71 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -10,6 +10,7 @@ config ALPHA
 	select ARCH_MODULE_NEEDS_WEAK_PER_CPU if SMP
 	select ARCH_NO_PREEMPT
 	select ARCH_NO_SG_CHAIN
+	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select FORCE_PCI
-- 
2.52.0


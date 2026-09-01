Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228BB47DFAF
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277883; cv=none; b=kY/1PGgMejaU3HDQgJVHIZ/OnoNwYwKqAyRUZlaPlmhi2YwuXldcQ2CIziVC0iak99puhqM6vOzhar5/N2wTiJUbfRKzR5lNCN96W2r8p2xGAD7Ue1hP5EsDMPFtuhZOpxg9xXJ+wQraS4jnkiYnAnb8DMrnSZp3K+2JfFG8fyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277883; c=relaxed/simple;
	bh=pRgZhzX6qbVjRnAwTz9i1o1KI2kS4TJvK2VH3qSJ13k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCd7MY3X0vpwYXjdC91KP1cK6z65+FEr/q0K9PA9yYfqb7R+iQkxAHDAFdFafmQBjAT3ItC1hWASw12ACZw1DfNxlOTIs+31rmZK21ClQ0bh70wLSkAcPjUWdl+dgnhT9rbCqQux74znLZCnRTDDBm7lByRYlfdqvostupqJz4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zzzx4Nys; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zzzx4Nys"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-85aeb506b78so1066327b3.3
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277881; x=1788882681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZA0Pzsw+qOfFGcn3m/R0Q1PWPp1MfQufFMeWU6cvtk=;
        b=Zzzx4NysXXR96wVENyFhLIcs7syUeDTAHEY9omZJtH73zhrua9uAN0KP8LuXNzXsBw
         kYCS8gYz0ouYJsgszXx8se6ylfpSvUqSuyV0lbuLraUidl9xn0rEvtDghRYcSlKxqVEZ
         sovmAJ+Ho68Rya2Y5gzWwgyUZi5t3bjb2W7kEbUyW7gUwrQUOgvMR429JFBpOW09siTS
         FrBcXGBp4gk//1GlrG0OwyHVpgjZaos9bRvHcex/8alJmgHBR1zl2/v1dWuipaBFV5QY
         9wAdFYYRVeHnEomM56gvkS+E/L9talnA+pVLivQAvrWIe27bJtkUaeNncwAB03yZYaIs
         oryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277881; x=1788882681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZA0Pzsw+qOfFGcn3m/R0Q1PWPp1MfQufFMeWU6cvtk=;
        b=EZHgOZ8sB7tCTdYSwRc7gexx63pVCMZYyOMSRGySgR5RO6ImEA+jsz4FviB0B92Sth
         k9K/w65j1nIiLY+euWeoYF89gkl731rKWs0Wc7K24Ik6QjryDtkMQ3Yj1t/L/gXgyhL1
         eomLvQocuFRafwGZp2HBKWSIonWHE3B3jGQriWvzeR7IeLYrI8bOtK6i8aoFt3fYmhww
         2cYfF8id7Lutntpb5WOB5Vz6Dk1eqAdBuTZ6xR/x5ylcOp8mYpiFY71GQZ86e7wppWlL
         Lu+p2PmtSW0ixjoiX2a16GQvUOv/GGN+h6tb4yJfVOkvUMKzvyiTgGSUl5YT62ZVX7/k
         dCEA==
X-Gm-Message-State: AFuF++l8sWRyDSKW4t3U1A+mZBADlVhpY2R7XE5SE70+cCqRjjWsKuMR
	//HUhiHtH3Id70m8qfvxjwFLlaj3k50ZcJvTLXszWdZ4Sk27R7prvE1PBHlT7g==
X-Gm-Gg: AYBFou3UEZoNUomBaAZgcUOXdoSdICzDxsyg3kD7z/D6S9/v0d4xG2SXyLaJn7ZdNNk
	o3lQ4BfAcs7B45dX5L0w8U8Y2d2egiuL/dNyASlrSyCua7cwU13ItoiCGgH8fls+mn392t8bLaq
	j4PsYwYUALEZqeSJQ7p1ufxKjjn/dZLE63XwCHh0KQsPw3JtIF49CqKLV340UusGMNwMPYC1VNg
	28Lmh7cBjGaKIeU7qqHDQsdySicL7TdnCVxE+q/wbWqHjiQMHd3Q5DLCyJQNyatar8yH81/J7kr
	OEUB9sHvePNtFh7rV/DgMrDQfyzWow0N1OvDSkApDGRly7syTYuhAiHIlOTzZw5hB+Lc9r1BiQo
	6o2zhJ1WGyn5AIvnbhjf0/xD7QT/xuBPcBdeEp8skA2jirzEW3FDIW+Ucp3Kvankf9YFufc7I8Y
	8zVIy5kizYYLoQesai83K9RE83Cr5iyRiQ2Jqv0lgENbrCKqnKRXhC4lqbp7cvNWlUWGryRIl1K
	kpVQ2pQvJBOHg7v1X55HL1dBnZrUFfQV4HJRae3
X-Received: by 2002:a05:690c:60c5:b0:854:4fdc:cab9 with SMTP id 00721157ae682-8686e1bae8cmr39361537b3.6.1788277880754;
        Tue, 01 Sep 2026 08:51:20 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e68ae126bsm79282297b3.9.2026.09.01.08.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:17 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/24] alpha: select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
Date: Tue,  1 Sep 2026 11:50:24 -0400
Message-ID: <a24c28c35c32335822ceb977dc3e860609c50ca7.1788277742.git.mattst88@gmail.com>
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

Alpha has a clean split between user and kernel address spaces: user
space occupies 0x0000000000000000-0x000003ffffffffff (TASK_SIZE), while
kernel space uses KSEG and vmalloc regions near the top of the 64-bit
address space. These are strictly non-overlapping.

This enables optimizations in BPF and tracing that can skip address
range checks when user and kernel pointers are distinguishable by
address alone.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 6ccd03768083..2ae514bea4cf 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -7,6 +7,7 @@ config ALPHA
 	select ARCH_HAS_DMA_OPS if PCI
 	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_GCOV_PROFILE_ALL
+	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_UBSAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
-- 
2.54.0


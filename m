Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386AD3AE191
	for <linux-alpha@vger.kernel.org>; Fri,  3 Apr 2026 15:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228416; cv=none; b=MIzT2NBq2PntdlMIiECDHuUyKYTiG0sYKQMOHP79TgfmbQtuGBjfM0GSpcramNr6Tb7mcmVHe0Mau9MwjnTXtDq04sEqYxq1e6GtBBhuYQtB7mh4bY2Df/sc7yF1LwBFGwFHvqkJEW2RTozriujVGY2UhtVITzjlvGiblJ0hXbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228416; c=relaxed/simple;
	bh=uzRIIfoUOzGZJd03M3CCeGGVcOZLD+4Qxrjsc1yW9B0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LjATAVkkFPxOmznawmQOA/MLRYXaVJudYh41nU5fVakGw7sX0dvlsSYlDrAR9KW18nSvT39uZjEAC5Lx1t86TS0f4jov/RKi6dkAzfS8YBeEbZRb2FDWsN7kjX5pivhtMFW3rzlx44s2aNI+AeGwDqAqdvyM9URtZIxI+kaM8Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dl+qbixb; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dl+qbixb"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79ea87af213so45924537b3.0
        for <linux-alpha@vger.kernel.org>; Fri, 03 Apr 2026 08:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228414; x=1775833214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zW3lhNdiot7St9nPUfKkBhsAdSpF/pt8oN8O/1oqM3c=;
        b=dl+qbixbVlgtsw0Attx3hG5vmpRW39FX4+8GF43yDlAucSbMQDMX3WD23f0bmELu44
         A2VYdlHmnH9Tflx7bqVgaQjBQc6QHp1BpS2szB3CewmIhHG8tcp5u5GGMZLw9ZHSEVWo
         BnAq23c2oi2sFgx0imoAhvnN2bcd82PA4AG015xcBnWmXMY5jFZvb2iD8tDj5JHi+zPz
         lYOtsBJqMoEQPaX5Apzy2K4JDnT8JipJZqXml/Z8ZE7a/640N+I4r3L7x6CAilXJuCvW
         yP3h3zGyCZQMVww9/BKD12jukol59oEB+jVyU5dVNMHBeMdXJuXD8MhW9Gon7mMFbozQ
         208A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228414; x=1775833214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zW3lhNdiot7St9nPUfKkBhsAdSpF/pt8oN8O/1oqM3c=;
        b=XobeeQyc78ICJcJTrNYfwuSFRi0elktZEzgjJwvrQ8A/s27b0+2wkeP17/svav5eBy
         80easqy4uZ6/FMJl6oQJmudUvHMt7hAyoOJs29bW+XRLt7yUL5tjtwYa3BExAl9ferXq
         HpYYzXoVg2YLso/3EqfYRXSG/WrvqKrUUMopo9zzIXyTF4upwAuVhsK0fIxDRd/rrmt8
         Zjjc+01T2oD6+HT44NV97wpzvup23bY2ZMRImZCilzZNSc4kRZgJJ1BpIClwK7yWW+4+
         vlMCOK4XNNC7cSAXXbyI2Pa/6WwVSYO2iyWbMYS/bnFQqW9QQn7+4JKgAEJ0Qkps0anI
         Vytg==
X-Gm-Message-State: AOJu0YzFgnXMrCRei3sKWWXVMGi0L2f/25+SmUoHmvnLIkeKSeD661cP
	Zo1Jvsu6ftmbar0HmXLzhpGGub5pPf+3+Td9nQJN23MeV5xNnfl5swYR
X-Gm-Gg: AeBDievYzUgVPTk4ObekFfrD5Cy8LJII6dgvdE+Ir9GiLWwNBLXw5fh7JK3M0oVTV3L
	CMX4zIpMtAD1CgRljAsm+BM/i/aTI8ZvmxmuUEPGFkhkxQ80uzUBqHQpMRs95BSXffwG79q9C83
	S/RYNCyoKQKE8/yGOS05iftb2wVvdgtN7QsKOuDD+LdXt7foekk7izfAar9cSpX3DQPRoh8igKS
	VQvQ/cIVG7w4d6uTnUZZJfXwoXAXXijf4NJ6UnDyVRFhlsDJ3+cdEvKxKm2olnf1ySdVi2+Edfc
	L5gQihR5nKzSJB87hr/sI1anO3TMJ489lcoW9uvxyRyBaADpw9Mb0woRgEP2J2SWJrQAy6PxRbF
	mGqRPP4bBdj63L4HVJA6xfc4+QcsqHivqjel7RdBJe5cVRGW65LypidHYMF2WbbyNFf+lSi0lY/
	EkAEsuZncgAxFhVl3BOxU=
X-Received: by 2002:a05:690c:4985:b0:79a:3564:ee8d with SMTP id 00721157ae682-7a3be4575demr53314697b3.26.1775228413819;
        Fri, 03 Apr 2026 08:00:13 -0700 (PDT)
Received: from localhost ([76.195.202.134])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-7a370905061sm22441067b3.27.2026.04.03.08.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:00:13 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: Select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
Date: Fri,  3 Apr 2026 11:00:05 -0400
Message-ID: <20260403150005.488076-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

activate_mm() on Alpha calls __load_new_mm_context() which assigns a
new ASID and invokes PALcode swpctx. On SMP, an interrupt arriving
between the ASID update and the page table switch could see
inconsistent state. Ensure activate_mm() is called with interrupts
disabled during exec.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index a29788e588ee..1ba472a98bb2 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -37,6 +37,7 @@ config ALPHA
 	select AUTO_IRQ_AFFINITY if SMP
 	select GENERIC_IRQ_SHOW
 	select ARCH_WANT_FRAME_POINTERS
+	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select AUDIT_ARCH
-- 
2.52.0


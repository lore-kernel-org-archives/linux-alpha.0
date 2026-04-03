Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BB23CA489
	for <linux-alpha@vger.kernel.org>; Fri,  3 Apr 2026 15:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228484; cv=none; b=mJh2xziwDbXcLha1rkrMjytFTq4W8n+5tbvyq5UMSuHtbGszGIy4wpQ0F2BMuYqDmwJUvRsSGxJz00u1isNfn4rmSQNycUaiLV8nnhlhT7k0p2H+aflJVLeqBWrwShUi5FRh/30RidjuxIk6jjVqwwhsabdRhhLTuTA3aEpeOFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228484; c=relaxed/simple;
	bh=DSNEvwLzzJWKMU1OwFgy5TbmQSivvfTMyXFg6lTPMkI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PcQ9BkFvKIexjbb/H7b6J4y4b5MdMnuxa2/R75g0FR0IVX2kvb1+dt2QereSZlVZk274htB3Dgj+Ya6DVXk+jCMe0IT89pxcbHfSKSGRI53KA4BWLoPRr8TmJu+TWkIrhfb38Lq1e0k0q4bDP2X1Yzt5XOLPHMEtbEo860VXWAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNx0A0VB; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNx0A0VB"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79a74765703so16407687b3.3
        for <linux-alpha@vger.kernel.org>; Fri, 03 Apr 2026 08:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228482; x=1775833282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rR6aY7VE3ISFMCxeDa2HPPgngT2koqSH+8RNS8lF9Pc=;
        b=eNx0A0VB1wCeUhLfUw0Bbi9Sjpe29/mYpbJgcch5wrkvgriPLmqG62mM+KBCspbZwl
         MAwKpQyJtwiFCtbMJr7fAT0fQNnL6PtCt/swehOq7RhX0L204tzLSGiPuvCgC+qNK6Tu
         hXLO6Db0Vd4RWSnndNB6wqnnLWvlIIqrrPizok2EH8k+nScMn8DZgjG1S0fguqIo2Msd
         teYJY/7WnzORyJEy5WbB1iIk3c6Me++3+f3RPt+WJ4h8Yiir9vqJOiEAzR4UC5e9SZFo
         gabhACPBGyiyNdjnO9vdgzuOssnRsP2QVzT4e9QjDyToh0pLjIPcXZpfXsQHm2vIYXYV
         5lOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228482; x=1775833282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rR6aY7VE3ISFMCxeDa2HPPgngT2koqSH+8RNS8lF9Pc=;
        b=jJrQo9ktrsZ3G8OWQUIQFZPmsO1M6GsWrM3/j8Dg0vlagSrX5NlTo/q3SD6faCBzu8
         4H4cTRO1Eb0kbBtSryaN0WfUyhiEtTvkDjgPA3iu8yoNzB/PxqIxfFXXstYkkoehkGi0
         Iymxw99pkRRZEHLIaFDapdrNMkVsEsYYvqFnUFHZhUlS04JK47NHWRCTOjt7fMfY/KpG
         3426+t/2FnuYxU35KqUxmUXUdhSYbph5aEiT0tfCPV5nJowgnK0wg9N8xd5l/KCpR58T
         CZypbcLNFPX3LWJOChmJ7fgUQOLYk2LqAAwyEX4Wng40DOSXaa+TibKL9/0LCtjUcv1b
         WJ2A==
X-Gm-Message-State: AOJu0Yz9dco4O1QMR23X38pZ4xEUdiItSlc0mBccnUfZVjI6WgSKHTnk
	tkhlXCBP2OIB2N/vQsyeLQ/v6+Y/n2UBvFZfMJFQRSodAUTptl9NbEJa
X-Gm-Gg: AeBDieu4cRxxV1plX5JNkV1yz+9BmKXGNkPA8ItDszflc8b4weefPhKfzQHptdd18do
	CyGFtcIiOZozAU8PKWWq3SYMmLk352bnC28vSld43aVr+lzsmXLKjD/rkBBolY3rdnIdd/nrOG2
	oH3SpphYHX1rpie3RSr4NW0f9ng4HE31gbja/Oh7i5p4UTfEK7Ic8wH55J4lL6OmZchZ94Z2xUq
	CJG5BZkJcL1wqtjKKbB/oM0NkCGMeeYm3Q39mNlL8pQz/xQl3tCsbrV66ZtBW2u26vrwsicapqs
	MY7Ock78+3kjAgM0om9jbMot64BReCdniqs3uYD7irMwAs/Oj5YE82Hh9gRLNVxGECdgZOLhFy0
	LC51ITXPw5urmfQfpds1p7RzPx3w2i21TV9Mm2uU9EfsPtOkCsKuUKgaKhZEJz7e/XzGSpqU/nc
	3yAG/Y6JXs371iVf3dkU0=
X-Received: by 2002:a05:690c:102:b0:79a:af2f:b722 with SMTP id 00721157ae682-7a4d6831751mr35583097b3.55.1775228482360;
        Fri, 03 Apr 2026 08:01:22 -0700 (PDT)
Received: from localhost ([76.195.202.134])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-7a36e830f12sm23519757b3.11.2026.04.03.08.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:01:21 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: Fix arch_irqs_disabled_flags() to handle intermediate IPL levels
Date: Fri,  3 Apr 2026 11:01:19 -0400
Message-ID: <20260403150119.488427-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch_irqs_disabled_flags() only considered IRQs disabled when IPL was
at IPL_MAX (7). However, PALcode enters interrupt handlers at
intermediate IPL levels (e.g., IPL_DEV1=4, IPL_TIMER=5), which also
have interrupts disabled at that level and below.

This caused a lockdep warning when TRACE_IRQFLAGS_SUPPORT was enabled:
lockdep_hardirqs_off() calls irqs_disabled() inside an interrupt
handler and expects it to return true, but the intermediate IPL didn't
match the IPL_MAX check.

Fix by treating any IPL above IPL_MIN as interrupts disabled.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/irqflags.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git ./arch/alpha/include/asm/irqflags.h ./arch/alpha/include/asm/irqflags.h
index 9f25d4e0d37e..80a01702b03a 100644
--- ./arch/alpha/include/asm/irqflags.h
+++ ./arch/alpha/include/asm/irqflags.h
@@ -57,7 +57,7 @@ static inline void arch_local_irq_restore(unsigned long flags)
 
 static inline bool arch_irqs_disabled_flags(unsigned long flags)
 {
-	return flags == IPL_MAX;
+	return (flags & 7) > IPL_MIN;
 }
 
 static inline bool arch_irqs_disabled(void)
-- 
2.52.0


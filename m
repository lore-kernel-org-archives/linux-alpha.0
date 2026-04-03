Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E33372B57
	for <linux-alpha@vger.kernel.org>; Fri,  3 Apr 2026 15:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228453; cv=none; b=Iwg99NMNMz0ipJ/Nxh+u3u4mY7qTZH95XtiTE1Z223uKGhUK2aXpbFUThrLkQiUSyiReAhuIOtvOOOQNQZPhXhVmfPq7AFBIb++jaqpYaNxVIUkTt7/I02UMZCRpTserxtT9GrmNmDbS9KGXztZpZMm9exFkFcvhpbuWW9uv7D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228453; c=relaxed/simple;
	bh=YRXuCBZlKVkHilh1eBNcRzNkSU9cxqbfPNMqxrDQNe4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fSuRNJcVOcurIW4uNCYDQvG/78kwLOaCy8grIHjZjdgTjag4i3FFM8y+SXtvc5zjgId1rYyGz5fnDPAuX3GMmm7zLF9tbKUXwc+6QNF7X+wW1vhv8pH/pg7Dc7u3ZNMVOvp22/zm5K4jUrAhMDhThYn094cKAlY8co1SqYBvmmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1M08u3g; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1M08u3g"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79db5e18ac6so30048727b3.1
        for <linux-alpha@vger.kernel.org>; Fri, 03 Apr 2026 08:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228451; x=1775833251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+HmILrJWmhDh7/i4HYjf8itzBkUH7Ng+vA7twwz/FcE=;
        b=h1M08u3gsI1dZjs8X4zFFUwh4pP0tVg3itGLMjioThiXj+30YnmuL9fxq7sJLmzQo1
         MK/osy3wdntVL9oMod/xsWY3pt/9WA7LqgYILpegirFiFV/OWYOrU80WXeRqWA0bOkeA
         90E3uPpAYEaVyouoStMYw7er4xXldBOanAYlv71wOSncgxKUzC2l9WldxWtHE93iQe3a
         nIBETrnXrr1EztfrqhfMeZlchRSf5wv+05j/pcnYSkXdr4W+kq6IhpM4tr6MigZWL9iR
         meL+9W50X54A4laC/94h4VrfirMEiAgaWbVun39z0OlVUNwgUg6/43X2jHuzKfoniKgb
         8lsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228451; x=1775833251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HmILrJWmhDh7/i4HYjf8itzBkUH7Ng+vA7twwz/FcE=;
        b=ZYrDTSmO9FFL2Fgpg3UJfwC8UWG33TxymXFtmtXLPfwkJJQEbRJGP4g2Jm3TucK4je
         X7hhVhQIumcyj0HOyRQXeSI7oITmotgy43B9oCmQJrxw/ypDTIwfAbOIc8xW8JjuBTid
         2H/u9aQ1Fnnuc64ckAAvAwzbb+YDdvh0Z1K8hcDN1cCXoNfeJ5bF/mJplxyou8QOmBPL
         Q5xaVXq4nUqck2sQYykOYsh8N4I0zKMycsoZCDN5yS9FPrpHKiSQV+amXqmadJWDagws
         menPgRm9sHbt8PhcYPbTBb4PVsXOrhzZQPX9BtJcu3HmX/YJZR7XXAWNFpg+mHWh0jWG
         OPqw==
X-Gm-Message-State: AOJu0YwN/Vzfmk15kXIpsRY5hleLegH3YkarOwJVuUOR9s2H5rJjQzA8
	cRQQI9cys6T6kVrNAAf5AxL7tv6kvu9g7mYjTkJ4JBmhpMTp991njjop
X-Gm-Gg: AeBDievILMXHTdV9M9MdS3DT58nr07mf1uwQOoVaxGtf4MpvW8/4L12OK1dxZp8cobM
	n5GhUF6E7v2Xcx3aKdDp0fdk7Jr44a6JBdQH1AyVp2+wZHUTBv5OswOlOZQ+r0RIyBVT+b1fOCF
	FNpJgjCEjlovQ7otjA16uLGLa07tovrPhj4AhtD2Ph5/wcXdIH184YPKJls+uj0S69qDpX2bAOB
	UglcmVMgFBABFZAD2tHtMWEBVIhMKjJAYj7KFI5TalXiIvTUdoMwJ3cg7vzuzsvxJ8umaLmDrEr
	GQ+sShYwskDoKQD0S44++1hFoupiYOnIi2d85ZjNhNc9VodmHUxRgzYlBTMb1aONsZllcqibL+t
	FY7dNP+AMNhiSkrtlSc9Zu05CoseoxthkIB8XOew9fJjJEN+r4PFznjCYFWcoF5FCH4Gywn+KJd
	osF1BklfYQRslvq1ImfjQ=
X-Received: by 2002:a05:690c:e3ce:b0:79a:df9f:3be7 with SMTP id 00721157ae682-7a3bb913a24mr53477107b3.7.1775228450966;
        Fri, 03 Apr 2026 08:00:50 -0700 (PDT)
Received: from localhost ([76.195.202.134])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-7a36e31ff04sm22600577b3.7.2026.04.03.08.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:00:50 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Turner <mattst88@gmail.com>
Subject: [PATCH] alpha: Add ARCH_HAS_PTE_SPECIAL support
Date: Fri,  3 Apr 2026 11:00:48 -0400
Message-ID: <20260403150048.488266-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add _PAGE_SPECIAL using bit 19 (0x80000), which is unused in the Alpha
PTE layout. This enables pte_special()/pte_mkspecial() for marking PTEs
that are not backed by struct page (VDSO mappings, zero page,
io_remap_pfn_range, etc.).

Include _PAGE_SPECIAL in _PAGE_CHG_MASK so it is preserved across
pte_modify() calls.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig               | 1 +
 arch/alpha/include/asm/pgtable.h | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index a5feb98cc088..a29788e588ee 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -8,6 +8,7 @@ config ALPHA
 	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
+	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_UBSAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
diff --git ./arch/alpha/include/asm/pgtable.h ./arch/alpha/include/asm/pgtable.h
index 849abe2a1f98..832f29340ec6 100644
--- ./arch/alpha/include/asm/pgtable.h
+++ ./arch/alpha/include/asm/pgtable.h
@@ -73,6 +73,7 @@ struct vm_area_struct;
 /* .. and these are ours ... */
 #define _PAGE_DIRTY	0x20000
 #define _PAGE_ACCESSED	0x40000
+#define _PAGE_SPECIAL	0x80000
 
 /* We borrow bit 39 to store the exclusive marker in swap PTEs. */
 #define _PAGE_SWP_EXCLUSIVE	0x8000000000UL
@@ -94,7 +95,7 @@ struct vm_area_struct;
 #define _PFN_MASK	0xFFFFFFFF00000000UL
 
 #define _PAGE_TABLE	(_PAGE_VALID | __DIRTY_BITS | __ACCESS_BITS)
-#define _PAGE_CHG_MASK	(_PFN_MASK | __DIRTY_BITS | __ACCESS_BITS)
+#define _PAGE_CHG_MASK	(_PFN_MASK | __DIRTY_BITS | __ACCESS_BITS | _PAGE_SPECIAL)
 
 /*
  * All the normal masks have the "page accessed" bits on, as any time they are used,
@@ -260,6 +261,8 @@ extern inline pte_t pte_mkold(pte_t pte)	{ pte_val(pte) &= ~(__ACCESS_BITS); ret
 extern inline pte_t pte_mkwrite_novma(pte_t pte){ pte_val(pte) &= ~_PAGE_FOW; return pte; }
 extern inline pte_t pte_mkdirty(pte_t pte)	{ pte_val(pte) |= __DIRTY_BITS; return pte; }
 extern inline pte_t pte_mkyoung(pte_t pte)	{ pte_val(pte) |= __ACCESS_BITS; return pte; }
+extern inline int pte_special(pte_t pte)	{ return pte_val(pte) & _PAGE_SPECIAL; }
+extern inline pte_t pte_mkspecial(pte_t pte)	{ pte_val(pte) |= _PAGE_SPECIAL; return pte; }
 
 /*
  * The smp_rmb() in the following functions are required to order the load of
-- 
2.52.0


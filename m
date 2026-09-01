Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8920B47ECDE
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277890; cv=none; b=XT+lO/BMcyNOm6VWONToGj8Pl/HsAxQzHW7G6N+mLg+MXbP64LbRU1ge0yCy7DngMnBzJFCUMp7hrwnCRIqANPdZkQgFUD1aORm8CHdPygzccgUWMJAMo1wF5Qynq1H/upUdZqNCUN9BIuFqSoi97btTDDzin4tEFyNCnVmHpVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277890; c=relaxed/simple;
	bh=ioiaExpvOCTECr5O0vl6n3fIkD40CVbkcRhkffkPjT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/eQpbxaWQtzwWcRzD5xFXQLLP164oaUi8ig7pDrr+vtmfxUqgTPhGDxj/O8gRyXOQE2fID5z56zispT82wT3EOQkjjE+EmsatgzVs3fLyFctupznH1kJEBtuaUjvDj/oRn859vGLzJ/d5SYdZ/VpkaTfLTQQ19qwPSDJF7CUmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7WX5TPG; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7WX5TPG"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8588583a7c3so799497b3.2
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277888; x=1788882688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L3fhymd358bI8pmN+7WytpOOFPnVAGri4lNF3aRDp/M=;
        b=r7WX5TPG61q4I4VVm5yJ7MLHXKbi+PrBuhbmaiv5CcOlkNcuUVysJZDvCSWZ+NnP9r
         R9oTVriszX6mJtE1/auF+WYUer/goBqtHZ6GhA9od4xBDKIBzRarL4qSDinR1A6Jm2JL
         TQq077xi0Kg5CGVL/BfdGTilKhlTdwVLSVcVffKGcV/9GgQd7SKCmWv5GpVsf8H2jsBd
         AdIi/OZKAhqmVBGez1XVl7mTSWHyLlMReNnpwCgT4eOQOF7v1SQnnQ13gjq2H3+IsFHo
         Jh9dvB0TQ4g34L08boIuzIo/MtR34Tch9QkZWHaI4EBzbMAteHBxMsuj16plBzczW5Dm
         4Epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277888; x=1788882688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L3fhymd358bI8pmN+7WytpOOFPnVAGri4lNF3aRDp/M=;
        b=N1Zei02EvD9uuWireFHd1IH//9MVhTjENqsPkdtKg+jwFL89MQOMqkwEqwlIpRXa5w
         DV1oSi1Y4wXtcmjBS9VRBJhalqKgc0AD70bnqOuuiP5loXldvk7ouD0AzjXzeuskrlVo
         Ix0GbswvjcSbGoaKR5tw4PrptHaNOqFnxkp2GYPy2b8QnUojYG11yu/jgWVBnhxX+Lez
         v5NTR0iP8kHFjwnGhP2xRS69FbfNPyQN1q7HeMS7jiwv3Y9RLeOk+kRRQ/bPPNUlJBRC
         4zBmRCTCYyCPYWeeIEbAQVKnNctZvOq6UYu5ikGm+Yw4ki+LvLAF/x0GaDxx+FrRWZvu
         uxYA==
X-Gm-Message-State: AFuF++n85gouAfXedpnQ9WnlEoi7rQ9TYoJyLENpxXbu0Gty8fREGz9i
	r6QRkPDD54ltFh/emJyO0gwXH1/wWIfSyxjpHbibYB8NMQQfyUCBkZA5d3zqAA==
X-Gm-Gg: AYBFou366ey8qP4N16CtyOgGcuoUHTsPdYDbRO6fP5P9skY+fsXpyn4L6woGmispYat
	IAWIXfgybuYbKdy8P8TE6WCaJZFiw65dBFwHvIS4DnTpPFshHlNY0hja8DGUdU497SLs3LCqwvd
	zKslp5aSY8EImUpSaRJLAfZCDBj68bRVKXQrg7FzdibDvcO49Jo4iGSRyYc6dl8qPoEh8fOQYIW
	dh9jWmXrZgyYHLEwxlBHjVnTBJxQH+NfZrHarB3COskVtt//ssbTp6hOyv/X7R0AeD56OpOff6i
	5KuuEeJtKuRv+BsDAMmZUCnNGZJkyKqOgVeiSAl694OqXOePsorylDzDQLaCmXAaStGrDUflHdc
	sjo5d0MKEqKehZjOfY0zBWavxFFttKQAhknySiQZNWd1oEntCDpS5ElX57ccwYXOAbv7nS+szVo
	QMMx7a4UCSCSWuYGCYKot7FILOFigpuqoPIxTUWWWcdS3E4Dl6H1wCnkTQOgVnEwCWMZNs1OQM3
	MHnfGOPGl/Q168IRj09H3nNGc8hgz3alV5t2+1d
X-Received: by 2002:a05:690c:7013:b0:865:7a80:36b7 with SMTP id 00721157ae682-8657a803886mr76454687b3.6.1788277888403;
        Tue, 01 Sep 2026 08:51:28 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e67766a07sm78119297b3.47.2026.09.01.08.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:23 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/24] alpha: add ARCH_HAS_PTE_SPECIAL support
Date: Tue,  1 Sep 2026 11:50:26 -0400
Message-ID: <802e4076e332cb82fcca73d8e22e0a591e44ab45.1788277742.git.mattst88@gmail.com>
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
index e6fa8da0abff..4c38405cd6cd 100644
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
index 8e00cf9dc39d..bdff33b505bc 100644
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
@@ -238,6 +239,8 @@ extern inline pte_t pte_mkold(pte_t pte)	{ pte_val(pte) &= ~(__ACCESS_BITS); ret
 extern inline pte_t pte_mkwrite_novma(pte_t pte){ pte_val(pte) &= ~_PAGE_FOW; return pte; }
 extern inline pte_t pte_mkdirty(pte_t pte)	{ pte_val(pte) |= __DIRTY_BITS; return pte; }
 extern inline pte_t pte_mkyoung(pte_t pte)	{ pte_val(pte) |= __ACCESS_BITS; return pte; }
+extern inline int pte_special(pte_t pte)	{ return pte_val(pte) & _PAGE_SPECIAL; }
+extern inline pte_t pte_mkspecial(pte_t pte)	{ pte_val(pte) |= _PAGE_SPECIAL; return pte; }
 
 /*
  * The smp_rmb() in the following functions are required to order the load of
-- 
2.54.0


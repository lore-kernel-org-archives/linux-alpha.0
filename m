Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3270139E164
	for <linux-alpha@vger.kernel.org>; Sat,  5 Sep 2026 19:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636596; cv=none; b=JzRsQJcp1G3YY2YkFGRQkMxPnsu3lizKVPfmgW8zkzV8lfwTgiO3I9i0CE/VFsO3uvsmL5y87eD1NLrJtaR71KLMnQFVeK8dDxDKNy4WEWJ5lSWyNPa8wxbfckBpfBWgayUopd9yn0rit0VCQXml7PYlMYRNRVKhCXVFrkveqmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636596; c=relaxed/simple;
	bh=zzgkpi5XpmGcRMZyu8vsECazz4eqXkY706CC/FyJHWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uoRSKrJZf2v13BT4kE2nf8LaIjVhEQ07vevrWJzM2iKy7W4qRwdvu7P5mHwa/6F7HVwGgmBn2xbPrWCozN2Bk3nFLbDgk73brgbePbT/N0eUpNXwfsTA9aRxEh5Gu16WEo5kudKcjKCZxMsqAfo8UMntN7W4vf0zQqC+iJ3e2fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeQf5APw; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeQf5APw"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-86cba60d4f2so18664187b3.1
        for <linux-alpha@vger.kernel.org>; Sat, 05 Sep 2026 12:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636593; x=1789241393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rpuf1RAAmL9CEZOj6P999HXUvoe6wq43qFA/vpQHKMw=;
        b=MeQf5APwj7PJdWpQwQceqsj/TI/I9csZstnevQt8xfNTsZQDQlgwHCjuKW2+Dnr9JK
         hyotOqAO+tbVGqS5iGZwVju6nCg6+jUMhOfsHmUK91S7WW8QKFvHkjE6goPOLEAIaaU7
         mfhtzYB1lDIz7tR8vDQgmgZykTPh+XvLoPOcN1yO6n+FwcKJgnYIJKKMnxqUmz16HtkU
         1EXH6EFJfMwksiEZSY4YWouF/Z1vUiHs+hTjxwS6dahejRkLl2XsgARLYHV613CauPU3
         gTilhNN0urzMmCYESTBvML+H/fZli5bRSJ9LhJdRFCTifzifCnsxhipRFJsiPJZapCCM
         FTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636593; x=1789241393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rpuf1RAAmL9CEZOj6P999HXUvoe6wq43qFA/vpQHKMw=;
        b=pY3yZ2gNORcf/Jb6Z3cOVd9dxp8y/ciqletVH6OmIgcHxzi22e8ZL0vrMLJDvDhpd7
         GWNc8mU5Gbhxt+xUlkOyMyEKwoly1xcXdjRbm3rWMfYbP0yjd9w3ztQMckUvRelXe+8L
         0luD+wL3LAPBBlPlIzWLEcfCRx21RRFtX9tHgKlqwPO4cFxvJLPlc9VL8xNka3ouwIEu
         ZeOU2unkihH/E6S/dYfVvbZBGGjndP9ItrKOqSQnPgFx+rlrMh1Mek3YeM1d9c8+31ws
         N424FHr95fDf6oKitB+mhoa9rRGO6lCplVtS9WGt31PbMoF/JWvPg+pJ9nfVP0AGFs6i
         V8BQ==
X-Gm-Message-State: AFuF++ndWIZ5d8PWg2kHq1JhQOGPKgU6jd3WqkAn6EOJECE9T+f3M3SF
	Rt/GKlgPzmjqbKEFUS9J8IbEJ5JHaaE2/nnhoeBNclUIVSzZfssUAgDE
X-Gm-Gg: AYBFou2GdamHbGo5J3QWbsUhUmLwaqxN+T7Iizc2vekNjMKw5b9QBTAykH9UgmOq2qQ
	vYjfF8y6oti8Oa+qQQLDWQ++o3ssxQdr6zqMnmwCSrSTgPo9KyyuitALZLRXKoHFkcp4eI7vP3K
	52XVMzUx87FCIX7sM6D0WC8eChpvQcxrxmpokTx3VfP5SbKHrm5fpSUcVzP40/Mxwog6P6FdFwG
	Rtk79e3qHAC7uP51cjgowrRlKbllNDHExbX6AsNEOcvKAfccCmlfnTOQAvwtrbxRIx5g19K51gX
	VXCfGCGJREYz9P++G2nzpe2wWB5WVobNVIzNlmmvt19YqDUog9hNicAsgGCoU2l4OFfujEi7+pU
	l2DQQypzjxEc8m9cVLQZkwaMKelXbEZvDmFmdk/Ske0niQ4lLf+lSPHjJFR1jm129ABTOQjWDSh
	e1Z/udly3fqsuScrsdPKLBov0uI1rXX3w6RklPnvXbGANZwVQGxGdI80BdT7l8
X-Received: by 2002:a05:690c:6910:b0:873:5c6b:a313 with SMTP id 00721157ae682-8735c6ba5a9mr26942927b3.65.1788636592993;
        Sat, 05 Sep 2026 12:29:52 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149316347sm44107997b3.15.2026.09.05.12.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:51 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:33 -0400
Subject: [PATCH v2 12/22] alpha: add ARCH_HAS_PTE_SPECIAL support
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-12-83e8245761a2@gmail.com>
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Kees Cook <kees@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 linux-doc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3352; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=zzgkpi5XpmGcRMZyu8vsECazz4eqXkY706CC/FyJHWE=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E6pOr77eVFl5HwxvcZ//6V+le/lYEl6doD/cKSp2
 eMj1b4ZHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHONThvD/6y4VSJbrN
 JYVi+at1bx2SQPLbNfP439fWs5zKS+SxiWiDL8L37d+/HthISUSfMn/ucV7mVjP/zInr+l7QBvr
 uOhpduWMQAA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Add _PAGE_SPECIAL using bit 19 (0x80000), which is unused in the Alpha
PTE layout. This enables pte_special()/pte_mkspecial() for marking PTEs
that are not backed by struct page (VDSO mappings, zero page,
io_remap_pfn_range, etc.).

Include _PAGE_SPECIAL in _PAGE_CHG_MASK so it is preserved across
pte_modify() calls.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>

Also mark Alpha as "ok" in the pte_special feature matrix.
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 Documentation/features/vm/pte_special/arch-support.txt | 2 +-
 arch/alpha/Kconfig                                     | 1 +
 arch/alpha/include/asm/pgtable.h                       | 5 ++++-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/features/vm/pte_special/arch-support.txt b/Documentation/features/vm/pte_special/arch-support.txt
index 3f777f8b67d5..1485bb7c73eb 100644
--- a/Documentation/features/vm/pte_special/arch-support.txt
+++ b/Documentation/features/vm/pte_special/arch-support.txt
@@ -6,7 +6,7 @@
     -----------------------
     |         arch |status|
     -----------------------
-    |       alpha: | TODO |
+    |       alpha: |  ok  |
     |         arc: |  ok  |
     |         arm: |  ok  |
     |       arm64: |  ok  |
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index cc69f94a1c5b..1d28fa8d3b66 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -10,6 +10,7 @@ config ALPHA
 	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
+	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_UBSAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 8e00cf9dc39d..bdff33b505bc 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
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


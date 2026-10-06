Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C6946D2C3
	for <linux-alpha@vger.kernel.org>; Tue,  6 Oct 2026 14:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791295471; cv=none; b=YJxAHS3+hKG9uRACvW3bjBoqeIcdSWIqhZw1ZSGLvqXSQMM8SStjQMC+vxTjSAzZdbPycywg5SYIfoOXT1KBEPov20uH+fOngiwlCP3aApBu0P2hTNxwAYdPlYWFOrOCY7k9cNExjnejhGw+0Jl+HluYuiJhry4WUY3VUWuPGSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791295471; c=relaxed/simple;
	bh=rggXStTfISGZMrfhil87y009ll/LlVaJhKCPzwrTe4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XjN+/1lI6AAe1EqrhY99eTI+lmDsZvUXafHzNBomAPiU3+YpD0T4VwcgxUTHhNyaZfZf/rSu4+Ckd30YB/OaGjNogqBqvj3A8AZpqdxzcsUYOMGAxS2Eg+cBkvZVtO/LewSKlo/6toe/Qnl5BvMxVjxoF2inTJCeX9UngI00yuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWYqLsB3; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWYqLsB3"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8abd68b3937so28423847b3.2
        for <linux-alpha@vger.kernel.org>; Tue, 06 Oct 2026 07:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791295468; x=1791900268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbtRGOr8XwZ6Kq+fkQi/esKzPOWlROdCc7wd2tmZU4I=;
        b=VWYqLsB38SYZGJ8IA6FHbWpzhGNO+I0ihNr59T8pEs8fpPDcY6W5frRn4zCPFH68Kv
         pmYkmHisymZKk44c/CRMewy0wXzrN5ZlTxPxykmMdpDAnNScyi1ZQQhOfqWnLrphpOZg
         kedNiLCFqJHXuiZA6hyDdR9pv2qAjwUBx3SvtHYUKl/j2xv6ciOy4A9ulZ0h8IT846dL
         UX7WNVUsQc2+ZegfY5p0OqZJn01lWCNCcqxdbEbZYG2KYdaNUFZc3LVJx/3J4xAxdvQ6
         GxybE3nEWLy4/TB6GTpM7vlc8CG3PCu5pRwZehZfsEnE46MNcFimi06i8ThL9I2z1tnn
         CEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295468; x=1791900268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbtRGOr8XwZ6Kq+fkQi/esKzPOWlROdCc7wd2tmZU4I=;
        b=E2piRfW0LmrANj9j+Zy07ScVCgwC0LaV/UsblvDqX0nFkEX2Vt8mXI81PIRAqyeuhe
         u4fXkp+QwBNH+g0Xb/NpHNz/TsIPyRIMboeJoRTb2s3mMKzW/OwSAEV7GN0qZVOvxPGl
         +kewgHwnXaeULrPu6WVzKfEOMxnAtDWP44vRZWVhqBOqxRgcFk2UdL+DB1H1mEjPuP2G
         9CBdT3ArQ7SMGZOYwjCvRu8xLGc1BUm0OFBbsvmZ7aznaGIx0biDXdr88BY8MXnao5m6
         z2S5t6MTPKYm0XvDLoalAsZ3wGiDsYW46tjSMq9LlseMd0lrC9Zn+x8CcbQ5Wm8pGD4A
         qC9w==
X-Gm-Message-State: AFq9FYJA2sb75rloQM3KyLEdUcJsAIUoiYbKjvIoz1uKw4pqwoXri4AI
	MdyCZi7yQeTTmkS8MyNNpNHAXPoDqj04DL2sMim/hvNW+CazhLy5K+j5h+34Pw==
X-Gm-Gg: AYBFou3rIvYV5Ctk1SN5NcgNNo32Ihe5cchSuxEFw/1XvJ+m6k4/sr+/ZOA6TY6CLg3
	vJt7AHMw7yDdBpLYrfxcRriMui3TWbX5M+SAR5cGsgmxlzuTfpMhKf52YEXP/q5V0BCuxXuFIHy
	v8EocJH3BYtvu2G2zvK45Tmuc6KG5j26W00Mp7pyGsd90LaKCiXimjSr1e3mjuWT6CDg8642n4I
	5etHNXpi9lGK3bx6J7YrnsPekUQvjI5zMuU0lhNxXO5LzKTRYk3tKLIESwJU1SyskA0H7+RdoxT
	0K0v8/HRWb6URf2f719QEHw35mWsyBhW+msGnEWxE3lrrfY6IrrgtUdr+8ZsbmIiT/2S5leU+J1
	Kwmldfo/bPLeC/qAwYLDshtUbHZP2sdWept07lTGlzzA+PUdXpGD1hDG4FHU6wofEaMODoTFIvO
	1DUroutWPku+l4QCwA4PIy6Dx/mMtZSV8JICSKou7Q8pPzmp/48p7DTrcZUbZ1gpsvseJvguE=
X-Received: by 2002:a05:690c:e682:20b0:847:d0cd:11eb with SMTP id 00721157ae682-8ae948c7516mr33615137b3.9.1791295468141;
        Tue, 06 Oct 2026 07:04:28 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8af19328814sm29029617b3.13.2026.10.06.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:04:25 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 06 Oct 2026 10:04:16 -0400
Subject: [PATCH 4/6] alpha: define granularity hint PTE bits
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-alpha-hugepages-v1-4-a673a18aaa70@gmail.com>
References: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com>
In-Reply-To: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4281; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=rggXStTfISGZMrfhil87y009ll/LlVaJhKCPzwrTe4Q=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKO/L/79M8ikyUTDW+v+ld4/rurbm7U/vlaSitPW6h7v
 dLTyD5r2vGBhUGMi2GmmCJL3HpFllltO5b6nJb+BTOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GQIZOkbxEDk9Bo3M4uLS1CLdtIIih7z8ksSSzPy8Yr38gtS8gvQCvbTMtJKMjPyi4lSgEXp5qSW
 mro5uRoYGJpaOFmZOFo6mJs7OToZObo6Ozq5ORpbmJgbOlo4mrpbmDFycAjDXZH5iZNhd5aC6yf
 GhRdv0FRsPMgSLpFUIiQjcb1HuO+Ay867u1RkMP75N7/qcc/zWtror3XGPeudufqORnru5y8LRy
 Ocv50cWFgA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Bits <6:5> of the Alpha PTE are the granularity hint, described in Table
17-3 of the Alpha Architecture Reference Manual. A hint of N marks the
PTE as one of a block of 8^N physically contiguous, naturally aligned
pages that the translation buffer may map with a single entry. With 8KB
pages that gives 64KB, 512KB and 4MB blocks.

Define the field and the helpers to encode and decode it. Nothing sets a
non-zero hint yet.

Add the hint to _PAGE_CHG_MASK so that pte_modify() preserves it. Swap
PTEs leave bits <31:0> clear, so pte_huge() is false on swap, migration
and marker entries, and page table entries above the last level keep a
zero hint where pmd_bad() would reject anything else.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/pgtable.h | 51 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index d123fd0d4091..605b82f73a98 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -65,6 +65,8 @@ struct vm_area_struct;
 #define _PAGE_FOW	0x0004	/* used for page protection (fault on write) */
 #define _PAGE_FOE	0x0008	/* used for page protection (fault on exec) */
 #define _PAGE_ASM	0x0010
+#define _PAGE_GH_MASK	0x0060	/* granularity hint, PTE<6:5> */
+#define _PAGE_GH_SHIFT	5
 /*
  * The Alpha AXP ARM defines 8 protection bits in PTE[15:8]: KRE, ERE, SRE,
  * URE, KWE, EWE, SWE, UWE (Kernel/Executive/Supervisor/User Read/Write
@@ -103,7 +105,36 @@ struct vm_area_struct;
 #define _PFN_MASK	0xFFFFFFFF00000000UL
 
 #define _PAGE_TABLE	(_PAGE_VALID | __DIRTY_BITS | __ACCESS_BITS)
-#define _PAGE_CHG_MASK	(_PFN_MASK | __DIRTY_BITS | __ACCESS_BITS | _PAGE_SPECIAL)
+/*
+ * pte_modify() must preserve the granularity hint, or
+ * hugetlb_change_protection() would turn a block into single-page PTEs.
+ */
+#define _PAGE_CHG_MASK	(_PFN_MASK | __DIRTY_BITS | __ACCESS_BITS | \
+			 _PAGE_GH_MASK | _PAGE_SPECIAL)
+
+/*
+ * Granularity hints. A PTE with hint order N is one of a block of 8^N
+ * physically contiguous pages, naturally aligned both virtually and
+ * physically, that the TB may map with a single entry. With 8KB pages the
+ * four encodings give 8KB, 64KB, 512KB and 4MB.
+ *
+ * Every PTE of a block must still carry the PFN of its own page, and all of
+ * them must agree in bits <15:0>: the protection, fault, hint and valid bits.
+ * __ACCESS_BITS and __DIRTY_BITS reach into that range, so young and dirty
+ * updates have to be applied to the whole block too.
+ *
+ * The hint is advisory: an implementation that ignores it still translates
+ * correctly through the individual PTEs, so it is safe to set on any Alpha.
+ */
+#define GH_ORDER_MAX	4			/* hint orders 0..3 */
+
+#define gh_cont_shift(order)	(PAGE_SHIFT + 3 * (order))
+#define gh_cont_size(order)	(1UL << gh_cont_shift(order))
+#define gh_cont_mask(order)	(~(gh_cont_size(order) - 1))
+#define gh_pte_num(order)	(1UL << (3 * (order)))
+
+#define for_each_gh_order(order) \
+	for ((order) = 1; (order) < GH_ORDER_MAX; (order)++)
 
 /*
  * All the normal masks have the "page accessed" bits on, as any time they are used,
@@ -269,6 +300,24 @@ extern inline pte_t pte_mkyoung(pte_t pte)	{ pte_val(pte) |= __ACCESS_BITS; retu
 extern inline int pte_special(pte_t pte)	{ return pte_val(pte) & _PAGE_SPECIAL; }
 extern inline pte_t pte_mkspecial(pte_t pte)	{ pte_val(pte) |= _PAGE_SPECIAL; return pte; }
 
+extern inline unsigned int pte_gh_order(pte_t pte)
+{
+	return (pte_val(pte) & _PAGE_GH_MASK) >> _PAGE_GH_SHIFT;
+}
+
+extern inline pte_t pte_mkgh(pte_t pte, unsigned int order)
+{
+	pte_val(pte) &= ~_PAGE_GH_MASK;
+	pte_val(pte) |= (unsigned long)order << _PAGE_GH_SHIFT;
+	return pte;
+}
+
+/*
+ * Swap PTEs leave bits <31:0> clear, so this is false for every swap,
+ * migration and marker entry, not just for ordinary small pages.
+ */
+extern inline int pte_huge(pte_t pte)		{ return pte_val(pte) & _PAGE_GH_MASK; }
+
 /*
  * The smp_rmb() in the following functions are required to order the load of
  * *dir (the pointer in the top level page table) with any subsequent load of

-- 
2.54.0


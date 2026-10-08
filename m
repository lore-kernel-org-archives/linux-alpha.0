Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89193B0AD3
	for <linux-alpha@vger.kernel.org>; Thu,  8 Oct 2026 03:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791429863; cv=none; b=lEtcBo96h341nlCW4XKXwchQTr7n/YPPTFh2biu35aoxMU7qgEtKEfHMpuqZsiJamT2/Q+9ZY3x4aYS7LnBSvWvV7G8+jWhtHCof18Kc3uglx+YRa4tEQNy49VItxelVMPdfV/IPTPgMK3bmo3GZGnzN7ds68pl9O2iKphziq5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791429863; c=relaxed/simple;
	bh=MiGh0F1fXpTDGtwJXf27agb2AocbQkG5vNBYtclmnCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SbaiUm6L8jodnzECSiKpzHQOnHGo3nVUpqt5M/E3RIemFgguVdC6V+nFlAvKue8ZgvY4K6xMC4/wk/3J7ExsgoMG3yaIwOO5YVtK2Th8runEBKLhFWrNL3dlPWDkdBudcjUdLKg+TA4H5SLtrX2rfLHyEdgP3Iil9AU30khS9dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwyPYW1Y; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwyPYW1Y"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ae8607e8afso27359417b3.3
        for <linux-alpha@vger.kernel.org>; Wed, 07 Oct 2026 20:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791429859; x=1792034659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4S8uHhcZPXnDPMPsSq6PcQ2rrfio9+ag3jtaYhXorg=;
        b=XwyPYW1YR0shtp7/oWqLQusOlt/V/la1tz7CbyZ2TxdSHw4VoQ0tif3R69htkVg3G3
         ORvbCkWmUqARkQ7rh576E5CmEoOx8iVmQT5U8VNAJ/OxxAeYpZUfNtaxNQ+nIPKqzyNz
         svScc1egRT6ngLcs+0Y4KMW3VMWUFTrtuqkjl5z1MvQuUlHI759sJEPkIf6mGcUUx7zm
         z202dypLmRbY0su4CxNYLM8FZMFq83vz7GFyCbhtAnw0Alp6Y4/FKn0FQmbNP4K+3LsW
         PL1W2XHENR3cLvnbjnauDsYCTRWqH1Mp08ck8p4qZtbsFhEJBXJwDl5IkEjNFLxWQYSy
         jSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791429859; x=1792034659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4S8uHhcZPXnDPMPsSq6PcQ2rrfio9+ag3jtaYhXorg=;
        b=TntxF1v2VE/zE3IgygQPzUPHh+2RlnQNh1AEw3LtEHVBm8FjNTGmPFOKC1cSVjaeSx
         t2i1jZJJbmuG/IFuHlhUq47WfKcN8EV6+vxKzCjuyatfsQPeqMSt1yMuePwVSKE9Ac6b
         KogB8k+5W5TnOUTJO2bBwf0PdyeHWLiHpl7K+XG4aWWnNXOkwyWvz2JyMQEo+a5dAz4T
         uBRUxfZ4WFbAlY6dbUAFTNrwUMm2lJIgaFz0H/sAwn93Frpi4cJgAP057t7FjVTu690U
         a7HnXVwjEVyD6eI7iQ3iQH1pwaHiw+lHWOi8o3x/SER4rS/qF0JSAH0onb1OFT9+lNST
         WAlQ==
X-Gm-Message-State: AFq9FYIK81qOHzjQpj48RpZVoSJurVF+qc/yVee7CxWeRDdYQTxKLqTd
	zYcwextjDOahKADxBtBFTx3fiMOSPfpEMEuq5JeqGn+TPnMZkjBkiOkd
X-Gm-Gg: AYBFou0b6b4A1tWUVPlHg17pxhC5lxW5akcHrRjJNEiDqKANRDDNiJdtaeVvALv59YV
	9mXNJbuYybP02GTZsLrHF1uLAhJ0++dXae/kn2pWLxYnOPlMZWtTIevXLS6f8V/BRkJUrS4tdAO
	ck/JBrZs2Z2kIsbUAgvfPsUhvfzE9kSA9c8aiAPoKURi8YwlE4xRj0efqOF2HRbKUkPrIwQ7dJY
	xW6wGgY8wEy5Hb/GBNIQUiHIxDvyfqc0JsMietuMkqcvCx2mO6xg8Hk65DBCSzRPa/d93PLJIqF
	mcF9ySeHOW4Qmln60dzY9j79JLm7ebpxsteP9+ER7X2kTs1kpJlcjlIntwa266G3AYPid2Gr4Db
	xiDaegKNUYOudJLmtSEFh8KN1HIaVeA3X3gQP0FVw8YXbj3z0jJjJALokmKX3GhrBRPkjqL11oL
	5M6bHjJLpTEXy6chQgTxmdKoiCeIraFqj/dwIl8wXQ0D+PyFFWK0drhwYGGOALjDBWXk9FjVg=
X-Received: by 2002:a05:690c:281:b0:8b0:702f:3253 with SMTP id 00721157ae682-8b070304f03mr3338477b3.31.1791429859132;
        Wed, 07 Oct 2026 20:24:19 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05ab73a8bsm15350057b3.24.2026.10.07.20.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:24:17 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 07 Oct 2026 23:24:07 -0400
Subject: [PATCH v2 4/6] alpha: define granularity hint PTE bits
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-alpha-hugepages-v2-4-8e108af2d961@gmail.com>
References: <20261007-alpha-hugepages-v2-0-8e108af2d961@gmail.com>
In-Reply-To: <20261007-alpha-hugepages-v2-0-8e108af2d961@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, 
 Axel Rasmussen <axelrasmussen@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4428; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=MiGh0F1fXpTDGtwJXf27agb2AocbQkG5vNBYtclmnCQ=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKO81yZUH3d/clGvw+e5reSEzm4HZm6CpntV+5b7d7cP
 5lvRXBRx0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFxjeYyR4Xxrq8alQ1
 Xc297uyzrhmW4X/ud+/06fHqk5ckpHKhZk6jH8T2ucd3Lx6dZQ/icvDd/cspD8cOP25XvKJ7XuH
 Zs97yuDJDMA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Bits <6:5> of the Alpha PTE are the granularity hint, described in Table
22-3 of the Alpha Architecture Reference Manual. A hint of N marks the
PTE as one of a block of 8^N physically contiguous, naturally aligned
pages that the translation buffer may map with a single entry. With 8KB
pages that gives 64KB, 512KB and 4MB blocks.

Define the field and the helpers to encode and decode it. Nothing sets a
non-zero hint yet.

Add the hint to _PAGE_CHG_MASK so that pte_modify() preserves it. Swap
PTEs leave bits <31:0> clear, so pte_huge() is false on swap, migration
and marker entries, and page table entries above the last level keep a
zero hint where pmd_bad() would reject anything else.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/pgtable.h | 51 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index d22e28b956fb..7cf685a694b6 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -65,6 +65,8 @@ struct vm_area_struct;
 #define _PAGE_FOW	0x0004	/* used for page protection (fault on write) */
 #define _PAGE_FOE	0x0008	/* used for page protection (fault on exec) */
 #define _PAGE_ASM	0x0010
+#define _PAGE_GH_MASK	0x0060	/* granularity hint, PTE<6:5> */
+#define _PAGE_GH_SHIFT	5
 #define _PAGE_KRE	0x0100	/* kernel read enable, in __ACCESS_BITS */
 #define _PAGE_URE	0x0200	/* user read enable, in __ACCESS_BITS */
 #define _PAGE_KWE	0x1000	/* kernel write enable, in __DIRTY_BITS */
@@ -95,7 +97,36 @@ struct vm_area_struct;
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
@@ -261,6 +292,24 @@ extern inline pte_t pte_mkyoung(pte_t pte)	{ pte_val(pte) |= __ACCESS_BITS; retu
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
2.55.0


Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748DD3AAF62
	for <linux-alpha@vger.kernel.org>; Sat,  5 Sep 2026 19:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636599; cv=none; b=aiSEUOecqjraQgE7DCHY6gTpsrX0VcpMj7wdCXfwM5KcBGTtlns8vmDPG9d9/u0urd/ATcY3leYIv4rQZZN/xGtq/d/PC6A5/i7xALiB6aWam8/HVzhlxJo3n+RRdHcCo4OTjbgUGHTST1Gs8JNdwY90+OoR7TtkisIw8YfR2zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636599; c=relaxed/simple;
	bh=tQCCNsza3+L/Dp26uPQrzzZj2N7hYv0TPiV2LTjFJ8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uM487KdU5I3Iefxnp1/6RxD0I/dUicatLfk3VMKeAOtpLTgLHLlIe57z5RHtIkdRNPBFcJMvgCJlngJyMRLwtIFPcyETlYeg5M9ebqr0RGfIKGn3mz7OpXv6n5+0miKzcZYiHvAAn8lWhkij4ROHPRYPs4n5Ie0Sp/WSxD/9XWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iedYd1m2; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iedYd1m2"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66fc2844f0eso1907129d50.1
        for <linux-alpha@vger.kernel.org>; Sat, 05 Sep 2026 12:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636595; x=1789241395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4akfe+KnAdR2Z5eQUZUu5tx/mvYlOnAwjy+byCW0iq8=;
        b=iedYd1m2tSG1UchrssyUs7h1pp+h5CY3bVj7gyr10YBseUZ/oqIkAPZ3vpztcgubb9
         pvEvHv91EBSzLnIoQp50szMrnvH6l54Jck50gcRubAoQC8TL742+RXTJk2lsGZO3zqdZ
         pc69VSHK1KornMe8fi9yH5wTLN/HsGw2u+8L9UvQ4Rd18hDM88m65z3mnibwsYEBLgBh
         adYUD0EAoYxgTeY80ezPzQAf0Lyw5kVjv/thC97jmDHBYo4fnG3qabcq052GqrD0n0ur
         yg5C/mDMC3lxQrGlcGFR3njb3QsDp0xPiIGrtVe6F8Q4CdPIKc8QWK01lrdJTViQrKhp
         Pf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636595; x=1789241395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4akfe+KnAdR2Z5eQUZUu5tx/mvYlOnAwjy+byCW0iq8=;
        b=igUpG5AFsBKGBPnn1yX3rbTKtdY981ddOUqO1kLdCpFZVcKinDSAXwAWtD/w+X3mcm
         qdqYafZcDY+rT0NIibRXAnCPGKf85EwXGTmB7HmMWkQO41YcNJddQ9ar5Fhu5PEhE71G
         i7lI8YHjma/EbHovu9QmgdM4cCy+hHF1+YXZcHA4POPAQ4zzAXWgnprd9yc44NodNcIk
         FK71PXLn3ejbJELjPGxLSPnWEp5tHMkAwNt9PbA5GOF7HaXIu49MOncv9e6zgfKQdSNI
         N5rtX7WfyIkAdmgejzW14oMMS0UdxNiry85k9gSRg+5rxlsRKRKd2ERqMNJH8+o5ikyf
         dVtg==
X-Gm-Message-State: AFuF++kW4WvKDF67up/GcLbzd+no4xk1UtRlr5rBPMRnVVx2Z9QV7x20
	u2dzJMjYiOHHq55K7P1QZ5PNY/9F+YOpfL6GdFXZkHNtbzETkGZRsGy6
X-Gm-Gg: AYBFou3ySj+yT3OCS5aHaTbzX43QOiSzX0owQt5I6HrfxJkiPt1WiUv5+kq9pfmlYOz
	bjG5bfZJy32voY7G2fJIjGp/oossOmIRAeueCFXH7lpg0PfZT8a2rcZ5LY5L/j+l4mWgJawLjgw
	2mblA2qeodbDahPeQbHVEPH2wPZ//ZYjL+WY9OiXtDc2Gmy7/uC716sPOPdLqan8ONYEzXeav2T
	LR1PIu0yjXRP8/GO1wj25GnNg/WQL22a2IikDv1hHZiQa0rLwt+AET2WKcIwB05mxpFtaXIsZKq
	QcV+uQBy88VUb+wrsZqRmUUv68aUwY/6sDQKeMf6VTcx6lFD5heheo13ArJkj2FzmZ19xz1qNWL
	AHufzdXdpR1XytePcvfCDomar976BlZlqsEkcDDp54BOJI00gG6RJvQ1c1/yWChx1tW37CNI8Ru
	A0w6Q0nHM22O/m93lHrOcquVKcxLBI31AqRaoZCDZXnQq4Xtv5FQ15TnxorGhr
X-Received: by 2002:a05:690e:4384:b0:66f:c1be:84ce with SMTP id 956f58d0204a3-66fc1be88aemr1791103d50.60.1788636595254;
        Sat, 05 Sep 2026 12:29:55 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb4912962sm4885271d50.12.2026.09.05.12.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:53 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:34 -0400
Subject: [PATCH v2 13/22] alpha: add ARCH_SUPPORTS_PAGE_TABLE_CHECK support
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-13-83e8245761a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=tQCCNsza3+L/Dp26uPQrzzZj2N7hYv0TPiV2LTjFJ8k=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E7xnPBi46/F3/zEn7dEp54KiisyZeNXdFWc/MVO8
 MdFj8bMjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLlmyhqG/9nadzaZbZ
 i3+pqOdFrj92sm5zLO3X5V+FTfT0Ck9pKN9zlGhg8znDxvflz080rfn7839BffN775WWxX9RPTi
 +89bBmY9nACAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Add the page table check helpers needed for CONFIG_PAGE_TABLE_CHECK
and select ARCH_SUPPORTS_PAGE_TABLE_CHECK in Kconfig.

Alpha does not support huge pages, so pmd_user_accessible_page() and
pud_user_accessible_page() always return false. pte_user_accessible_page()
checks for present PTEs with user read access (_PAGE_URE).

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>

Update the helpers to the three-argument pxx_user_accessible_page(mm,
addr, pxx) signature introduced by commit cf8771ca4cdb ("mm/page_table_check:
Pass mm_struct to pxx_user_accessible_page()"), matching the other
architectures.
---
 arch/alpha/Kconfig               |  1 +
 arch/alpha/include/asm/pgtable.h | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 1d28fa8d3b66..da4ec8399517 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -19,6 +19,7 @@ config ALPHA
 	select ARCH_NO_SG_CHAIN
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
+	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI
diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index bdff33b505bc..6ebdd90f3035 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -232,6 +232,25 @@ extern inline void pud_clear(pud_t * pudp)	{ pud_val(*pudp) = 0; }
 extern inline int pte_write(pte_t pte)		{ return !(pte_val(pte) & _PAGE_FOW); }
 extern inline int pte_dirty(pte_t pte)		{ return pte_val(pte) & _PAGE_DIRTY; }
 extern inline int pte_young(pte_t pte)		{ return pte_val(pte) & _PAGE_ACCESSED; }
+extern inline int pte_user(pte_t pte)		{ return pte_val(pte) & _PAGE_URE; }
+
+static inline bool pte_user_accessible_page(struct mm_struct *mm,
+					     unsigned long addr, pte_t pte)
+{
+	return pte_present(pte) && pte_user(pte);
+}
+
+static inline bool pmd_user_accessible_page(struct mm_struct *mm,
+					     unsigned long addr, pmd_t pmd)
+{
+	return false;
+}
+
+static inline bool pud_user_accessible_page(struct mm_struct *mm,
+					     unsigned long addr, pud_t pud)
+{
+	return false;
+}
 
 extern inline pte_t pte_wrprotect(pte_t pte)	{ pte_val(pte) |= _PAGE_FOW; return pte; }
 extern inline pte_t pte_mkclean(pte_t pte)	{ pte_val(pte) &= ~(__DIRTY_BITS); return pte; }

-- 
2.54.0


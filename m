Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074183B7B96
	for <linux-alpha@vger.kernel.org>; Sat,  5 Sep 2026 19:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636605; cv=none; b=MMyRVCLZpV3KwdHk92f7qHCTycKet4XWaT5vfKW5e2kndSlFsuWxokU9RfJPorappLDOhzxsLRAl69OCB4cWVe+2GWyhyyR/HGqdr8vpk3nHO2Ylh69BgK8W31YHnBDX+600kbDB83EW2A1n88OE3pHFu/A3QijZu7eSCiQdXzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636605; c=relaxed/simple;
	bh=0GRem3x0eG8/JNIZxt1RyVxWMXssFfZh5/KCyC2lVHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=flFFnsoSIq7JQ4REgTXO2WvLh5YtvSU4wTQAc1wTEUeA2EHdMjvfdODAtgjvHD4e1bNJkLdBYbEG03t/gPNuNNA45AJbEaA3vDqufyYfif1sGG9BAXrFClVJGO5GROrXyYc34ofCTCJhDspz9YuEy3rOJ4SFtEMb3bT4H1arOkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ppij17w2; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ppij17w2"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66825847b2cso3021106d50.3
        for <linux-alpha@vger.kernel.org>; Sat, 05 Sep 2026 12:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636601; x=1789241401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0fiXFhN915XCDpLLqEwuBtY6yraW5XJOIEkrimuJC6k=;
        b=ppij17w2i/HDryJOEmveVztBnE0EQkWwTc0yDpNRiThHY5QPoVtl/sLN0E5jLfnaxT
         AcIaMd6XV3VN70nfT8OnmIqPMkACcTuvpCOFSx++m/yJjRmepmT2EuIh3K4JoYiAVPyr
         JjrEMVeqKABugcUApQlIs7GPO9i9IPEr6wbuQ4ZLmvkMy/gGPPCGYvvh5mtYX9hvv3KX
         ER16KB/wfX0qan+31Z/qEhS77rvGpB/lANmo1dOCkU8TxNYJ0gZGhUzSfljL9nYTOQKa
         C9VTq9Vw8rEClt7kETuFtpM3T8wdnO0KEROZUZxDps9Ahx2fJh4MVeqw8i5X49ZL32u1
         IhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636601; x=1789241401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fiXFhN915XCDpLLqEwuBtY6yraW5XJOIEkrimuJC6k=;
        b=cYoHzPG/lQi/cEclEZ1gfAm3kZlhlmkR48M6X4xCDzeoOacDRNfeei3gN63PKoLD2T
         OtnyhBDIN9yF8vZP1BgKQKG44o8TtybPmrWfpy3m9OFRIsRfBaQcSCagZ3fcUCBmOSL2
         hrJNnO/bNY1p6AAzUhortC25TAf3mYXC6TFxgiQwlcE8rE/Y6//MdvacbP5Dw/3DfpkV
         x3N6rVEsmSJ+R3EeA25r8HBTORG3PEQJwjiiVTU0Hb9ukk4EUQsvn3cMETwce3PC6Nj9
         S2klNOATYzL4jHmhVzfY3NIp3FReRp6P4MunEg1n5fJyX+m3EVUlH9Q3bxhh/wFUGcKn
         cSkQ==
X-Gm-Message-State: AFuF++kcO8YWv9ehVxRs3GmW3YcEvy0WEO43cbnmPhLwtdZd9AhBKxWo
	vpQpm9qEnP/AeTJp4KFjLzmWbJHn97pd9JNxN+7VtaU/jXDDnAbfdZPz
X-Gm-Gg: AYBFou0URjckSV2MgjVo8xA5YVH13cEB4/nMv2azwA//WR8LncEbDQ/Jt4cq8UtwqK1
	i9YmT5ylJUJA/LKnngSGBdT6E8xn8sHnsWQVIu/RlKfSS5p3Yc/z0ly37CiVBAzOlSNOJzWYooc
	uyjZdy9MdfOpEV69ItgnlXkUcl/+JF+Z2xZdeSzGKKQ0saBeoIRFDwf59X3icPpCtm/7+vIBv8m
	zGiouoIT5hH3QJisSOojcnCh/zxbBgAfk6pFuk56Qmk1Bk5tgUr2hSp3S7sIGtd+v28NNrzSyJs
	J7ojVOVGDbtOdaT8gvaCIIx+8QZXov9cPk6zXfZrpg3prsRG6Wk5wHuv1wzaDo3Laj1vbLEGJRE
	mNshvbG5ROTf1k1mOhxbresc1kLLyg9u+s1JXP3G2L0p6AldSeQoAhXNL6UETsmzftmrfZMsekc
	C2sTgk1cD6SeSvy8yh92l2x/858qa0jbgMxnHt4jcpaq67iH9QPAdoROduZk1o
X-Received: by 2002:a05:690c:c4f9:b0:874:f21c:2a0d with SMTP id 00721157ae682-874f21c35c3mr9439987b3.69.1788636601317;
        Sat, 05 Sep 2026 12:30:01 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714c0e5c6fsm43787487b3.48.2026.09.05.12.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:30:00 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:37 -0400
Subject: [PATCH v2 16/22] alpha: select ARCH_USE_MEMTEST
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-16-83e8245761a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2645; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=0GRem3x0eG8/JNIZxt1RyVxWMXssFfZh5/KCyC2lVHw=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E65v/SxUtDChw7iOY2vGDI2ON73Of6hLkPRZvNud
 88/0+XSOz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaamEqG/0XrVnEt0A
 1la9mTGXi/48VuoWXtLsHzY+q/3y+6zugb0crI8GK/2t08dbMn0R+i1T8vOcVTJ3zVtuSkRtyWX
 imWukZOVgA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Wire up the generic early memtest from arch_mm_preinit(), which runs
after parse_early_param() has picked up the memtest= command line option
and before memblock_free_all() hands the memory to the buddy allocator.
paging_init() would be the natural place, but Alpha calls it from
setup_arch(), before the option is parsed, so the test would never run.

The test range starts at the first DRAM address rather than physical zero
because low memory on Alpha is owned by the console and PALcode.

Tested under QEMU with memtest=4: all four patterns pass over the free
memblock ranges, with no bad memory reserved.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>

Also add ALPHA to the memtest= parameter's architecture list.
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 arch/alpha/Kconfig                              | 1 +
 arch/alpha/mm/init.c                            | 5 +++++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd2..58d057a678db 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4030,7 +4030,7 @@ Kernel parameters
 			poison checking when freeing elements back to the
 			pool. Useful for debugging mempool corruption.
 
-	memtest=	[KNL,X86,ARM,M68K,PPC,RISCV,EARLY] Enable memtest
+	memtest=	[KNL,ALPHA,X86,ARM,M68K,PPC,RISCV,EARLY] Enable memtest
 			Format: <integer>
 			default : 0 <disable>
 			Specifies the number of memtest passes to be
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 1ba262812212..f2a5b8c8688a 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -22,6 +22,7 @@ config ALPHA
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
 	select ARCH_USE_CMPXCHG_LOCKREF
+	select ARCH_USE_MEMTEST
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI
 	select PCI_SYSCALL if PCI
diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index f4d65a60c869..6c28947d6e2d 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -226,6 +226,11 @@ void __init paging_init(void)
 	memset(absolute_pointer(ZERO_PGE), 0, PAGE_SIZE);
 }
 
+void __init arch_mm_preinit(void)
+{
+	early_memtest(memblock_start_of_DRAM(), PFN_PHYS(max_low_pfn));
+}
+
 #if defined(CONFIG_ALPHA_GENERIC) || defined(CONFIG_ALPHA_SRM)
 void
 srm_paging_stop (void)

-- 
2.54.0


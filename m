Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5E147F2EE
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277894; cv=none; b=Q5H05dzsiUSVlcRWhrdt2hCZ6b7iWcwPXY3V/xcPkovUr5hgPu887quCOvA7vitC/hC1cZgZ5RyX84wHJb9koFRZ84l10VxWoBZ4VT5y31HCzOiZGHeuKlkeAF5N26//MJB8RvS39abp8O++rTY8xquWA/6lFfX8La8Pu5sYM6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277894; c=relaxed/simple;
	bh=9Xg1mYTY71JWy+0ejzUul8PAG4NMQUH60bKlfKZvQtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vc2ctU7Pk96BCOQ/LMRFyTNuPpsUpAcYWG+YdOy3+vW8tU/rsI2aItvXeqN2o0+fNzy4zR18vsOfYL0D/NWYR6CuYz+O4+KvMCE/7DbXrVmjUptZ0APsXPO80pCAUwWVV0uF19sJVnZtKktZq4JfZa8QGw0W3qnEQfg4Pkr3TB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T88+v90i; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T88+v90i"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-861145fc841so946387b3.3
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277892; x=1788882692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WrIjHrUzfeSmnNpoFpFwykQuRi2himcgHlf8T243BI=;
        b=T88+v90iMt24UotLanPg1Pjx4M2Sb6LNhxSA3n2vDSYDv+8Y27+IBOwEVnsqFkJ02o
         PRlo5yFA8hWxl9rJks4ITDa/en8cBGSnpat1KMPg1N2PPfEivI2JhMtzAXETLFSeJQf3
         AL2lGU6q52hes9SDMHld3Y7kPNKkYL8i8rmjo42CRTtBwyqI9KC90RZAgH9fWL1Qhi+I
         6Cy1k+9Z0xtD96Jo7JAAdy3aiLc9Lfhp7Rlsw7gTfPxRajkTZN5U4W8Ujpz1Johir7xi
         kmtjwxflnuphU2KOeB7ykIqDL5SSQmNDLAfNoS/UaLgVIENO+PnbIVppsYDRAANyTKkA
         QgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277892; x=1788882692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3WrIjHrUzfeSmnNpoFpFwykQuRi2himcgHlf8T243BI=;
        b=OuJR7SFWJ3cAWekQr7apwQVvjOWwRaV8yvBVnysGikqu1Rprac+VfIodMWXhoBamnu
         KzpDeEYmKvfgPl3E8+QgF4clEwT3BzjMmDeio+vuq6PmbLdTRfgmIJEgmQ0fgbpdn+PI
         roT0mtm2uvXZTtXKzr9ZmJ2cL/NdFHBvtclgtBtD75J7JDgA6tKeP/svTV5ChpRMMI5T
         N67ltlG+H4SvwCXa02HqzMH0YAX3gHalua5ADXJtqasWJfDJZNW9NcByBmuXepuUKjtz
         Q/61iCCy+2iSHgl/jI/hwiXSDxrITNQLxxcMmD6UBR+hyGHdHm06sYCRxrFrpySXqt05
         XCcQ==
X-Gm-Message-State: AFuF++lkE/4njZ9cgtciTDTvlgwIe5wDVoIKAXIBzoY6a3/KQYXvp79r
	lzvDM+GXWaQg/6xj6Y5yN7FQH78FaPNLAKE6Kfyi0EWGAQatXWHTP2YXhNUlwg==
X-Gm-Gg: AYBFou1Gv/4yHFi8wvQpAVrQqV1Be6ADBltmlkm0a3hBiRpOlvAofmW6UedTq3lD9uE
	HtAwleRj5a7Q8iThr7Dy8i7ikhF7b6RC2QxsE92LtcmZEyfH+iAm24cMwnO6YkTHBLx+vkjbz6O
	DM5vChxdkFUU7lTX06JzqunCiZKl+kE2M1dEvAIIPaidtQeEoc1k0aWufaONOD23Hkx7Xidt9cH
	Qd//bDoWmzTknc0Cp6/9dJcrCa3zRFJMWUo1cZT/lUNDmJM0X74x4zE4c6ZT4bZNBXpUn55LXh1
	QXo0+5JaVmE5VFhZ4NpVu9apRyWxghvSkdXRCWY59j295mD15RMzYcNMf1T/oo/xOg+zq8Lu8eU
	aogeSVM1HB2mQ+MWrwUyZqelkgU9isZUztXkgVpt2jeMqI2gkEthm7C0mZFnEAkSpM6iiwhN2Yp
	8Uw+R+eYWEU72oROFphYwqLzbshVSCj5V0ffeZwzcwcZVIf5IVT8/jym/3hE80N27TV2VUeQMVa
	6F699Om9QHYfy1Mnu+XN9P+4tI9x6whQV+V2FUI
X-Received: by 2002:a05:690c:60c1:b0:81e:695b:585c with SMTP id 00721157ae682-868701f7a41mr40689507b3.4.1788277891125;
        Tue, 01 Sep 2026 08:51:31 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e5ed1cd5bsm76405047b3.17.2026.09.01.08.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:29 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/24] alpha: add ARCH_SUPPORTS_PAGE_TABLE_CHECK support
Date: Tue,  1 Sep 2026 11:50:27 -0400
Message-ID: <5ad0fa4995f9b0e6aa4af672e987a9b9ee43645d.1788277742.git.mattst88@gmail.com>
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

Add the page table check helpers needed for CONFIG_PAGE_TABLE_CHECK
and select ARCH_SUPPORTS_PAGE_TABLE_CHECK in Kconfig.

Alpha does not support huge pages, so pmd_user_accessible_page() and
pud_user_accessible_page() always return false. pte_user_accessible_page()
checks for present PTEs with user read access (_PAGE_URE).

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig               |  1 +
 arch/alpha/include/asm/pgtable.h | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 4c38405cd6cd..d7e2859aaedb 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -17,6 +17,7 @@ config ALPHA
 	select ARCH_NO_SG_CHAIN
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
+	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI
diff --git ./arch/alpha/include/asm/pgtable.h ./arch/alpha/include/asm/pgtable.h
index bdff33b505bc..310361920a1f 100644
--- ./arch/alpha/include/asm/pgtable.h
+++ ./arch/alpha/include/asm/pgtable.h
@@ -232,6 +232,22 @@ extern inline void pud_clear(pud_t * pudp)	{ pud_val(*pudp) = 0; }
 extern inline int pte_write(pte_t pte)		{ return !(pte_val(pte) & _PAGE_FOW); }
 extern inline int pte_dirty(pte_t pte)		{ return pte_val(pte) & _PAGE_DIRTY; }
 extern inline int pte_young(pte_t pte)		{ return pte_val(pte) & _PAGE_ACCESSED; }
+extern inline int pte_user(pte_t pte)		{ return pte_val(pte) & _PAGE_URE; }
+
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
+{
+	return pte_present(pte) && pte_user(pte);
+}
+
+static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
+{
+	return false;
+}
+
+static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
+{
+	return false;
+}
 
 extern inline pte_t pte_wrprotect(pte_t pte)	{ pte_val(pte) |= _PAGE_FOW; return pte; }
 extern inline pte_t pte_mkclean(pte_t pte)	{ pte_val(pte) &= ~(__DIRTY_BITS); return pte; }
-- 
2.54.0


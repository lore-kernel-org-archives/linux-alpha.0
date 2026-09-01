Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D9F43F8A1
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277864; cv=none; b=aL775USSRocOZ1mKtd+gyalAdf1OdfU7vQEUTaExv7/L4WqJ6ejQhdZ+bRB2rUCJrWEIj7PgKEGDlxbt7CIvIj1dF+KQb5wUcJKIDdaASK49HIHQLn3dvjcuqsrLr7+29yN8onk4X9ANBXZ3FxIg2VB8pLIjCWEI6HIHeDEZ6dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277864; c=relaxed/simple;
	bh=ooUyUDyEY9urQKmPXtQbNfBaknArlp01QEzHC8ogxlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W0rbza8UlRXyhQxMZHEgd+8tPstwI7Cqxsx+c5TN0eMmcaHs75Ug5e2i3iDu0FzkzLjeldyTpqjHYgKFHy7MYIYDwv10vNkFmMazpd09CWaOC8wS+5thabAdVNHlaec6jD99hrEAqX3sCZ/TzuTlY0masnFW0NGq9+7Dgj+DgnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vi5fYDbi; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vi5fYDbi"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-861145fc841so934637b3.3
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277862; x=1788882662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMwbRDzP9YKrcfjXPIte/jx760DDuwwcQ/UTIZn7k3A=;
        b=Vi5fYDbik4JTIZQh4D5zElIBQgFkvJKBz9u/xcLLjgiZzWkiQ89xDv549qcvmbJNqF
         dJEBJa4Zfn9n/4aLyl3M3sr1DLegQaMqQ7ohSx9y2ke9qMyH2bgIMomc1YR8XzkuvE/c
         gVSqkzS+CgdaY5QBSHHOejOyteSTUC8f0qmJRBuLA0stqXPu6BaJq5QadiENuyNNK7zm
         ME5lU+D7GcXpG7bO4CDS0D2gC6Loy6bHAllAuVnZGVkYXc9uX1jw7PIOsgZd5r+GeKOI
         TMVsQ54+QkC3ym3ngoqwfSAmg+ldELauOlp0RZlAmXHtd1tGsQi25iLevJxj5y15EnTr
         P2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277862; x=1788882662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zMwbRDzP9YKrcfjXPIte/jx760DDuwwcQ/UTIZn7k3A=;
        b=ZKx4SDZFK+vqRPuMQ75zouFu7dhcRz3n6Cicg13EZfemQYyR9Nui5G7Cknw3yfEdKI
         HXdAJ3USYLgxhlBvLSPKqHCk/N2aoAWEV/Wr7aSiIL6tyMEON+r3q5o0u8o8n923H02/
         ctuKQZb0j7liFMn5yGJMsPKs0eus+dUoAc4Zo0TxgxJtBT2ey6JfU1gzDTcmCylNmd+k
         kyg1lUnuSECbPkuirBv6Uq6LVVa9IimEkf1zXT7ynZBn43Bwp7p5Za4jIbdXDcj1ilwJ
         6czYdPfDBl9kwJnFV/5lnuaQOmavC7EdCq2+zp21jWUCGNWIGPWCEsdFD4QvNcEkwXy/
         Eu7A==
X-Gm-Message-State: AFuF++nAJEMEsQnigVv7i64dWa8GYpGDFX0pJ3VkFZVp6WcreMZS8+tZ
	PNxrP1jdZCGxpSuqejK68Ezq+HgxQZ9D4SwyFjEoCGypAfE2BNxvNsqRD5p0Mw==
X-Gm-Gg: AYBFou33YF4dcOmRKUnjqJVSg6sEuhNDGRFv3Oyff7Ip2H8+O7R6HF66RMgXZ4uNlsN
	59GiTUrbc/IDI+ws5AZCKoUbGUAu1DD+CuCvHfaOO8QZlaojVoi9UYDxIGxtOKqccYeOcFQznql
	zDk90GtcmF+DDxv/4bpRBGkZNVj4bgkstZh2fFgpCNCvh8vCWSVEuzx0L51z2udAj724nCVh7P6
	zOXru7trL6Sjy4wuYOIQ7EE/txZ95N92lafGUnFx2Rb+/RRNtTb8wQD77hUi3WkZrLNR/pEc06W
	KJwhZYiYHCIGrudShloseiqjj8tEtxbcMdC1a787pj/aPyb8bGFz8F5BNkaPY4i+QPtXaKYpTi8
	v3EhRE+9UOh2HJYusP7C5yqp3mAbLv3hADS3Jv6TQ+qkZs5cTiyvL9nxABHZ31s36VrLySid7E4
	GD9tUpGagMgl0tJl61FQzf/RBIWvIUj9InhqCuubLAEOzlOmAHGxKIvUB/pUhhG5R7IrLJ0biAB
	WrxXzUFW7bJ6do07Cr0OBJlodxQq0G3ob8vbFfEMg==
X-Received: by 2002:a05:690c:12:b0:81f:2403:9e70 with SMTP id 00721157ae682-86874be3a5cmr39817697b3.19.1788277861999;
        Tue, 01 Sep 2026 08:51:01 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86326649752sm52513987b3.3.2026.09.01.08.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:00 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/24] alpha: select ARCH_SUPPORTS_ATOMIC_RMW
Date: Tue,  1 Sep 2026 11:50:20 -0400
Message-ID: <bb81b54cdc536e3ae12b27b477d1299bacea9577.1788277742.git.mattst88@gmail.com>
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

Alpha has native LL/SC instructions (LDL_L/STL_C, LDQ_L/STQ_C) that
provide atomic read-modify-write capability, and already selects
ARCH_HAVE_NMI_SAFE_CMPXCHG.

Selecting ARCH_SUPPORTS_ATOMIC_RMW enables MUTEX_SPIN_ON_OWNER and
RWSEM_SPIN_ON_OWNER on SMP, allowing optimistic spinning on contended
locks rather than immediately sleeping.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index d2f9ef592f78..0655e36608cc 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -12,6 +12,7 @@ config ALPHA
 	select ARCH_MODULE_NEEDS_WEAK_PER_CPU if SMP
 	select ARCH_NO_PREEMPT
 	select ARCH_NO_SG_CHAIN
+	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI
-- 
2.54.0


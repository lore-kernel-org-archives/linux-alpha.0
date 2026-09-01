Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FECC43C7C5
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277879; cv=none; b=OlW2y2+OyvCrLOY1NdZf6Aso7vjpFtQ8Dh9M+L/FuFFka3MnSWFsLkcyo+bFkEBRaT3+OTdVHEf7d5DD6l0MXX2M5ggCcU4pLqZV3LBK+ZHbvyCUG9t/JtJc/tECnVAw67FZSRjdmLwdzhRhycV0UDLsyOGpOouV90wb5qZh+bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277879; c=relaxed/simple;
	bh=NBPXeBDdInIOjXun2P0A+EPFsy0jFFuQJAQUJqDeu+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ExkizxovZZOg/su1AX4Cu+FKfH4Om0kcypgIzyqYPqrK9AoC+G495BUa7J2s9AaBYBlcfsHnQzfoUqwTZddGNRlSg9SABB1c1fj4/hpZq90Bwl6JjiNdOeWRpE2FZ5swsBnEfYkuMejX7QiZcaPG9/MwyH7TkqBxwUpHGLYiKhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtDadjOR; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtDadjOR"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66e55430869so23321d50.0
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277877; x=1788882677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oX49AT2d0GVBNA7+WDxqduEjh0MSx2zHj8wGL+l7HE8=;
        b=WtDadjORNt3S7GFwFamKHitACfnLdrzBMn8/C/Xivd6lBp5fnBd2De2UvEijEDsRpv
         kmnRtNqX59BKh/7tVjfmy1EfzKKeRSirigvSDLPKhVQWCK8EJTytgrM7MP95dY3wDqNp
         rPVvN5LN3KpS8IHL//My/WN2+PwJAE3e6cpPW8CAldBVZhmXGoznm5pA6xpKB51Gc5TV
         mf22YwGAMR1Tu2RXLi9kRKXHJk1CcYedrL3rn58/Y2JCNZf0hEWF04+FRrRp7D16/4aw
         4TaG5nJHJtXoXUgfehxvkOYpTHvkjhMKYFapife8yC8Ygb/f+JvndYHgBAjvlWZxpMp6
         C8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277877; x=1788882677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oX49AT2d0GVBNA7+WDxqduEjh0MSx2zHj8wGL+l7HE8=;
        b=sv/rC3AFMTn7hYbKb26eq2xgwry0PHtay7N/gwTopSHjbToBSjVtWzKZnYK3nYic9C
         yAgkfN0IRxnX+TjJeS1C9U75/gE+xFwoVhGeQY1WBjtKzZL0tUEO3hEbTTTyTxQ9Lawa
         +K1pTYRpAzgnKpvvkFa9a7h5jNshLwpnBnqounTm30z7o1s4sc8M/6HdZwmvVtRaYPLQ
         7TeVeh7a8txytbpUyI8vGI5ZZPFBjy3xMpH3DWDRcGWyWPp/E4H0GU79QrMYKak3jKvD
         fxqYq1aRHCqve5gbENTJeUPAMmgerTYgQYrDccfLAhSu98GXO4c860fIOgp7hpw1MrGz
         oiVg==
X-Gm-Message-State: AFuF++m0MMJm1AwXP3vTWlSjpEjGHPl0XXectxf+AkjOmzy7GRL6YjYL
	tjtDpG62RwjryFoNHqa6tCmfF6eWNXOnet5idhU96ImVKO+WaUqsCq8nsnE2Qw==
X-Gm-Gg: AYBFou2nY0fUCBJxQn3j5f5efFRHCv9DDnScusOTHIyC+Vuq2iWy9LvDyuj93s2T0lh
	wnfmMxFPxabyXn04jx31RmGHmX/6HQnQOHc4wPyQppSvsfLqYkZNUyd4z2ua4GmvRARvQoRPVHA
	NIOx3B1/AQ3HEbhdm1FZGAjwXVOvr1VpH70/p6Y1FP7354aemqnsm/H5zLq2IvY46Stl9LCuXoF
	R1entnwiMpexkEfPfP/3lSnr2dDL7GMFXUxFHsuXGV22mLx8EzMZNAy+Ze+tPY+jG63Cyfm/vD3
	tnSYRCA7olMpvRI87+fiF9oaSZWj3F3s5V72fgIcOQVv8TCuecYmi52fREvGLBsB+0rOS31zA/E
	a32x2JE4ogaGfCcSfWqrCrpU+uYPc9JghajaO6H3Sv8VIBou77iAqnqjPTtBDh/2UZuy+zWbHeT
	f+xiVG3wspnQcs3l/2bDvT4gEZdpaysCFx05pwUtUlcH7978eeN5GOvVn2MlwpdjSzXCxEtJM6F
	QX6QwpcA/S68YzTQ0S4h2MgmBdtMixLl9HUEWPi2w==
X-Received: by 2002:a05:690e:13ca:b0:66d:b6c:985e with SMTP id 956f58d0204a3-66f875c544dmr3301327d50.35.1788277877414;
        Tue, 01 Sep 2026 08:51:17 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ed39d4csm8744210d50.21.2026.09.01.08.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:15 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/24] alpha: select HAVE_ARCH_COMPILER_H
Date: Tue,  1 Sep 2026 11:50:23 -0400
Message-ID: <dc9ec3ff88fd895cc4daf846bdebe9ed2a58d507.1788277742.git.mattst88@gmail.com>
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

Alpha already provides asm/compiler.h (wrapping uapi/asm/compiler.h)
which defines architecture-specific compiler intrinsics like
__kernel_cmpbge, __kernel_cttz, __kernel_ctlz, and __kernel_ctpop.

Selecting HAVE_ARCH_COMPILER_H causes linux/compiler_types.h to include
asm/compiler.h, making these definitions available consistently.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 00365031ea6e..6ccd03768083 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -19,6 +19,7 @@ config ALPHA
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI
 	select PCI_SYSCALL if PCI
+	select HAVE_ARCH_COMPILER_H
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_PAGE_SIZE_8KB
-- 
2.54.0


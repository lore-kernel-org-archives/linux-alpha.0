Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D5847F772
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277912; cv=none; b=qdav2zRe2HJ0nzscE6lsh5rNZPRbOQbR5QQBStBG/TREn2jLnBgiotU+axaUzMUmT3yy2k3FIE14BCAyMxq9aa+7bBin4Yab1z57j5MeG6XCIMloz6L1JcU/ZsoQme7uqokdZtNrrG+Fvain4gYcBzSLTuridHUJPD7EttY+NzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277912; c=relaxed/simple;
	bh=0QNZxHXN9MMGOG09/8uDxT/8FMsHW8l3OQA/bGpxRuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LbVV2ayVuIPRSeHaGftBGlzZvP7d+E/oSexaaErtZ7fwGdcUO02NVBnLRlyK85sgEeRkHAPeMaBWLZCbtMr2JuROfTfx6iWY93u/xqcM8oTxa5ta8wKyOyELXbQ88FOqKK7speBruJsm3Y6GIV183oi2/rHwwlXTFZ7f019grTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MopFpUwh; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MopFpUwh"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-86162c086f8so21071937b3.1
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277909; x=1788882709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6pvqgRtqPmkfJNnlR7H2vHgJ0BYyIge/mCHYR1mNHY=;
        b=MopFpUwhcOrg03woJJ26CA2a8loqXMPmXUctCGTtdlFYujZWH0ErcDUV/X6S8mTUuP
         Vmf4+SLAnY235/rDxmMljoobRstZCffe+PKENbJb3yJs69HNjxXiIrnSIoShXATNflpd
         DGt9lS8EmJRTXV6KgBYsESJGUyU9UJJwxv0Za8ENr5ig4fa6PliJXj9g0n0UW86Tnjz3
         DaNB4psh3G2LSyOD39rNBFhAtZZjQm7+mbMj6ap+4E7xiNyOcf3Ppe9GNW1xhHXNcX49
         ZVYumFt8PDUp0dAZy5DrjxlB3OXhNWSSCGXxQ/vdisIkuExggaCnZ6xrOVSGZAnBLdno
         3FFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277909; x=1788882709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o6pvqgRtqPmkfJNnlR7H2vHgJ0BYyIge/mCHYR1mNHY=;
        b=ju4pKDpPRwkiFSe2ENjClzQqdBLnKAqFDISqlNl3tlTgzP+7ROQV6foLVnC869A3xJ
         bTbh8SSdS5XCSZ5hz6pSjYvgkgA1hcjSnq8sAb4Dhoqh1gWOWCP9SlsWUs9/pBV9qnje
         l11RmOTn4yKu1tQdcP7RNHeOmwgsL6YMwSPAiH8vtUXbG3CLmqjPVmF/SUS0rEFIduVz
         3JoMI4MlO1ol0kWCTONJeo74Dd71n2g8U+fG10FlvRPKm9YFpXvjcZnh1ggHX89n9pNM
         6VB9vesJ17xLCBAs4yuo19CE0GFquE1JfZD6CMoepP9eftgsq6Uhijql8CaCoTsjNxKb
         OPWg==
X-Gm-Message-State: AFuF++l8xwD8CqWb8yWGQEbXljyK8oY0Sf4CHg2fATeTG+glrZjyCYpG
	1VK/ywcaR4lzlp0MOtanAX2yqethLs8aRuv5NkVU3C++uQRZI99IjUD8y6Z68A==
X-Gm-Gg: AYBFou11sC8hEQ8my1uY4YzbJJFvLQlsukMPzXIZWw51TeL5Kbwc8oDZ25bXHHxAuZN
	HCpuNnpSefX2QbciEghThZAEgfg37seFx3kc4hGvZgBDBpxFS/AdWzfwh02LUMvcKxZ9oEWpCZn
	w/5XvF3EnRAAYyHc4HaOHkOX6YEjVV30OaW7Pc8STTKmqy71ddg9dEIZSrRNc/rB+7ewIbYz1NN
	fNwPJ0n7iYMA3fLwpIfYA/zfTeaGp+Ae6x0C1JhQXVPeyqbxqRJxyjWbBOJdx/bSLx9zC96fVfm
	9OKiLjFBnVi0nXSuQVyBjRViILhv+9fdjV6A1AUoDYDULwEKVEqCkXR9jba+En47lCFmTae9T69
	7sYVW17oljwyiqRXGJ/gPVcfd8eHb6gw3D/Gnp3uWBwjioKCXkEowoqIppCoGMaMkNewh4enQLv
	fchFWGzaSTrjzFDOm0IxJdW4qnZZKroxLdWqP2tDRkQ7CyKtRVrxELOtYAIxB5O9ZLXfGY/0Uxy
	Bd+K4GyMrvVt9wCZUmuvL4dX/0JhUWskjXZfWBW
X-Received: by 2002:a05:690c:c043:b0:81e:d001:e0ca with SMTP id 00721157ae682-8694d6bfd6amr22479137b3.17.1788277909383;
        Tue, 01 Sep 2026 08:51:49 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e5e18114bsm77134827b3.7.2026.09.01.08.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:44 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/24] alpha: discard .eh_frame and the relocation sections
Date: Tue,  1 Sep 2026 11:50:32 -0400
Message-ID: <7f44a90b0479bc98b15fc5ff4095ed555d33e805.1788277742.git.mattst88@gmail.com>
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

gcc emits .eh_frame for Alpha even though the kernel builds with
-fno-asynchronous-unwind-tables, and nothing in the kernel consumes it:
the stack trace code scans the stack for text addresses rather than
unwinding DWARF.  It was allocated in the loaded image, so dropping it
shrinks vmlinux by about 1.1MB for a Marvel SMP configuration.

The .rela* sections are equally useless, as the kernel image is not
relocatable.  The linker was already dropping their contents.

Both were being placed as orphan sections, which is what drew attention
to them.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/vmlinux.lds.S | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git ./arch/alpha/kernel/vmlinux.lds.S ./arch/alpha/kernel/vmlinux.lds.S
index 95704e64b6a6..c44941d3b874 100644
--- ./arch/alpha/kernel/vmlinux.lds.S
+++ ./arch/alpha/kernel/vmlinux.lds.S
@@ -76,5 +76,16 @@ SECTIONS
 	MODINFO
 	ELF_DETAILS
 
+	/*
+	 * gcc emits .eh_frame for Alpha even with
+	 * -fno-asynchronous-unwind-tables, and the kernel has no DWARF
+	 * unwinder to consume it.  The relocation sections are likewise
+	 * useless as the kernel image is not relocatable.
+	 */
+	/DISCARD/ : {
+		*(.eh_frame)
+		*(.rela .rela*)
+	}
+
 	DISCARDS
 }
-- 
2.54.0


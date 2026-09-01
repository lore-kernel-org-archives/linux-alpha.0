Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FCF47D950
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277867; cv=none; b=UYYmrzVUQDa7o+uyb7gEJeC0J0n9rp+baadub7jK/x0PXlWsdPkdzrkeT9Za1G/ksR5Cset9iam5daB+oZmJjrAoZ8Xf3TrLbWWl0ARm5OTFaDE2Lj9/miRO21WNufvh7oglSW2j1AuHdsZHfZ2FNi7TpakFiyJtrXM+J+Q+dq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277867; c=relaxed/simple;
	bh=3kOUWWtBBmwf+li85oj2v2OxavPEuTRBsORhRX7hhGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lAoY/MvEW3olkWGm07ok9L3hzlQBbZO+G2BukEbPKv54uiCck8LwMNRTqR4Qw8Hn13W1Q7hdTIpLr7mI68apQlKalMCFNqrHDzK6m14oHLLlTCHr/4vLNJ2wxh5GhWl9oiOj2itd8dXxzdwEOGsjWdTBVtGo3R5KHQFcz5T2h+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAcE0Hma; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAcE0Hma"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-836c8bde2dcso1363687b3.0
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277865; x=1788882665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYiHbFA5Y7ECy72GJRw1PyiPsplnk66cj7FgDlBc2Jc=;
        b=hAcE0HmauAqj0W3zx65PJ+nKuSUnJwnnrEwSJHsLiR+pPYJzE5kvRaBuvs3Hu6Tduu
         eAAAJashUAuAvEQS1A0tyq2Qk67U/WJejeIgeUK5lRufUA+XA4LKqLM5F/n5trq7F0cy
         oXe/kd7hbPtiAX85K4/HsM6Fqk/MUEwOJUX4RO12LN0PiP+LmkS4avv4MubfxHgCJ377
         Kui1mZpGOsbDnIvcMCQuBkHiTraDkijTZbHl8o7PI2Uv+joJufOMJA54VHTtstf6+k5Q
         TnQosLtGdeK2rzRIG3FYWPhoqSwf2r5k3LRGq9v6gYZYulvGU7Hp6GY4alfk6b+jdQOf
         R6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277865; x=1788882665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYiHbFA5Y7ECy72GJRw1PyiPsplnk66cj7FgDlBc2Jc=;
        b=E8pUnIv59hP5yiwv0eOwmX9dAfIA4ajRuswhB8HjXchLBwQXeFkUxMXQEZQJr9MxhU
         1uAm+XE6SHlUmylxA9HA0In679Kyz3/Noi89PLxFj27zIDrVLhO4tX0S3W41Vo95CM1L
         lDVx/q8Z3YsCHGb95xc397KNpIFrKAyGYnU2DzaVRo8twramRbgkVSQeXyu90SXwBxXX
         ZEDyInRFeeX1B56WEp8ZCbQjCEp9Zrk5xkxG31EWqZsAlfuwrtK+RrsdPLnMY9jdCBe1
         x90oJni31zTpC9mT90X+WiDr+t8uVGuu4oMFp5uoKzWufemIk1BGqAXNrZrZ6U2iISTt
         vh9g==
X-Gm-Message-State: AFuF++lZZrCgmj2yojBxL36dMXzu696hNcLJRE31RGt/CRaX5MoiSvfa
	5Wsyli/Jz4uFVqVQQwmLuopeR/UHeNrj3e1nHm+jUDtzzhUSFGhVzaDn1nNHjg==
X-Gm-Gg: AYBFou3gAF5tAQVJ0MWGNaKSMX6vCT4itCdpZYTSJ67czw83G5pdNdLVONVBQRWHcxk
	iEOhaGmpS0dch+JBsy2AI56zsW4hDuL/vMZuSL5dw5SoPxOxjUuNwpBc9zGrCnk2AHAcvMVCaTW
	tScznNdEGkHdnzwgS1WvOYGME4e3CXmn6vWHbz5uz240LjyZQVU2ZEG1rWb6iCOe32WWX3/b96o
	d00NAT4bXaDDpO5oRnba46ZdyD2LgUnPXCgjrHTFvOc9W3B7am6CiHfTgtLoJJZbx+ADDyJaYfJ
	Fvn1bsuUGYD6ZJNl1uS+5P3O38VuiCgAp0jpsxv6EM6w1QNvRKEIb7ftQJd+Gu+wjGLSnUy0Avk
	dzeHwf6YnzOxjR0Eg5MugeWR9xD3AwSy5fr/3q8YTCVj0/sjlUd3MYwDAM1W1eDDlSw/yNsF6ek
	Mj40GDkFtVbWvvxYymJn7mzx07whFxrQxREj+czPUqbw1r+7k0IEiFpRrbv214cJWhygjWyHIZC
	DPauPq96kNjE5j5cr0fQKN8s3OKNNeqjH+XABZ3
X-Received: by 2002:a05:690e:128b:b0:66d:1f6b:3a84 with SMTP id 956f58d0204a3-66e4c719ad4mr10426597d50.36.1788277865287;
        Tue, 01 Sep 2026 08:51:05 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4eb3df27sm8636777d50.2.2026.09.01.08.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:02 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/24] alpha: select ARCH_HAS_FAST_MULTIPLIER
Date: Tue,  1 Sep 2026 11:50:21 -0400
Message-ID: <a328908c6591b0be86d25a64c543e15911239b3a.1788277742.git.mattst88@gmail.com>
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

All Alpha CPUs have hardware integer multiply (MULL/MULQ). EV4 and EV5
implement it in microcode; EV56 and later have fast single-cycle
multiply. Since no EV4 system is likely to run a modern kernel, select
this unconditionally to enable multiply-based fast paths in hweight and
string routines.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 0655e36608cc..9e8e571949c4 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -5,6 +5,7 @@ config ALPHA
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DMA_OPS if PCI
+	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_UBSAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT
-- 
2.54.0


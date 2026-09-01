Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FDF43F4BC
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277900; cv=none; b=JLbXTDLdQa3CcTxjdPV1LQxyy93++mq0zYv9HD4FUbJw0CbTD1b7OngqaL1wpqSgMtW74f9+wp8cxq9NBgy84bG4EdtzPISz9t9Ai7eT57cAuljC8QoyXGsRXfz/s/GCi2+o6EgOU1BbyZzb/Q3OmjMeOPnqIdIv1SHTbffb0Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277900; c=relaxed/simple;
	bh=hdl+OTB1yVSH9JDm9Gsa4MpjZfNwEkwTNc5VP4tp/Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NY//FN/iiRyDxIQQVqfxkysP6R8GaB+Z3WfKScc/k9XUB2h7q/bKspRcopL/qMN9K+5NTicIaXOfsj4aytNkJ8BbQJVcw8csxjLCFIa+buS6FXFTxXvoxBwrCGdKFm8k1ByiyRcGfpr5I+bHNAatC+Fq3rNFACLLEvKTqLyeK+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Em+ZiQgd; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Em+ZiQgd"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-867a943b149so1483287b3.1
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277898; x=1788882698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usbV3+3pOtvfEBv9PQmV+IQ3z+lbp/nmOaEabXXhASE=;
        b=Em+ZiQgdH8evZL7lECXfuy5yQ9F6kyaJ/nTw0djSb/HyRGDyy6o16sBnQj6uIzPdU6
         T1BFu/p81atYbHHZ4h9cpyc6ny9X17cycgkgjWZXCn4ZbE36nuD6/nZbu4bSW7L+Q+S8
         JVpvyJmmawIDXiIN3y15j10c46ZJWlA5Me53u5z6VxBM94ps6z1/rUzKLXUOdUIozAbT
         yhzFtg4J923v7BVi5QklD6dCGiq8dPrx1z9YQPXITc5wZZ7rMmb/XM6Oj3sFWNDYGly3
         JLbopQ69VBqfLGx0M29JnIJzJBaKJwG2ChTc9ElRMN9TtMCk9Wkuf/mG/aC3okDz4dg4
         iD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277898; x=1788882698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=usbV3+3pOtvfEBv9PQmV+IQ3z+lbp/nmOaEabXXhASE=;
        b=JYlek0rPtn9JsShm0X1/0CvIQO9jf4KmI+jnldSvIvo+SFplAwb4+3MmSB5l6Nc7yS
         itIWT/ZFo73Yzpjzff1jo3i7yHSk/uzei/ca1jTAh8KaHHUEFH3QfLxcijdVTcFaqm6+
         osttsmYvTr8h8IgYZHSdBIiz+SmrLMV0eVG0QYXKTy+lVX5t/zS8+hf44paNun+1xyII
         jYV4sgnL6fHuA9PfmiZXGnOZgv48C6XfdDm5YMeaVkwyVRGHqAML/Rj9Z/oH0gqsqJAv
         ONzTAj4GFZrDaA1qQB5gj7WK9GYcSMq0a0j9V84vse0CHnoGCj000/lPXj8JpaOMW0qR
         zaDQ==
X-Gm-Message-State: AFuF++lR+UlZD7yExRIQkpiZSgisiUI4jU2q6e889zRGRb7zsqpsDCgw
	8T908wmrOgMB3BS7MHy8VJx+GVXjkl9tbPeW0PKotzjmPloL0poKfRAPUtpT3Q==
X-Gm-Gg: AYBFou1ymSlHorJDsAkVqtqfgtngTssrKXH4K/Zreo4gdO1a9icvnqzF5l+nH3XcczA
	xP6Ckm3fbRA0KaAqyQQackOoCpwl+vHvIYMakwCteGMZXvQLh3HyhRYlxYlH8c2lMHaWQJVg9HC
	Xnwrkz0GZRwMLzFlcX5dNvQXtsf8Or3FhfJpLviyKPhfePb81km/GWqdsf1f2hp1FvKTii9gU9X
	W12GDvC1Vc5IEGq1QXuXPv6cYVsgJQkBGF/QBd1xSMCMhQRDIFu2mLlPSOKGArvR0Z74sV7fTGs
	Sn/ft66lTZjyMVoLNNcd47K6SgizGC8IFTQvXN4uiHRIOxv6MZx6iaKm0AQDyqhNNM8B01saWCK
	BWGsjKAefLuRSfOq0B+nhpdzLBsp9+jeIA6fGuqZ0n6lbT2eUDlKceeHrIIdyn6obz/yvGMhQ+T
	Dn4ucMZS3o5ybrkxi/DSBClZGgqEhFZkiqAPb1nWVET4dj5tK3v5feb0/viboC2Rc+Orkm76p3w
	8poCxMUszef2iY4Pz1y8vQRDKf0gCOdcxbXdijW
X-Received: by 2002:a05:690c:4017:b0:85d:42c3:d00b with SMTP id 00721157ae682-8686f52b910mr40076987b3.9.1788277897397;
        Tue, 01 Sep 2026 08:51:37 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e5e181596sm78013697b3.10.2026.09.01.08.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:34 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/24] alpha: select HAVE_GUP_FAST
Date: Tue,  1 Sep 2026 11:50:29 -0400
Message-ID: <96d45353c7c29cc3aaa3234bd960f38d2ed8889f.1788277742.git.mattst88@gmail.com>
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

The lockless GUP fast path needs the architecture to distinguish PTEs
with no struct page behind them and to keep page table pages alive while
a walker holds no lock.  Alpha now has ARCH_HAS_PTE_SPECIAL, and it has
selected MMU_GATHER_RCU_TABLE_FREE for a long time, so both requirements
are met.

PTEs are a single 64-bit word on Alpha, so the lockless reads that the
generic walker performs cannot tear, and no arch-specific
gup_fast_permitted() or ptep_get_lockless() is needed.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 87fe81bc4709..352615956b1e 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -26,6 +26,7 @@ config ALPHA
 	select HAVE_ARCH_COMPILER_H
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_KMEMLEAK
+	select HAVE_GUP_FAST
 	select HAVE_PAGE_SIZE_8KB
 	select HAVE_PCSPKR_PLATFORM
 	select HAVE_PERF_EVENTS
-- 
2.54.0


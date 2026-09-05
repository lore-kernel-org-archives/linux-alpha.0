Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96733B4E8C
	for <linux-alpha@vger.kernel.org>; Sat,  5 Sep 2026 19:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636603; cv=none; b=AKdgTTWu7/jkt7K12h1cIHex3SzTlaC1hnIe8hXFiqTas3CpyIJRa06CP1i8VCvmNWjccaWNiCehtWISpNnzGi3yXt5dUbPL+UMW7s2RJ3w4VSavRqFoqFBr95zboZeO0okTs2J/qoRKObIytFNSvi/nD8jCqUUj+Y8KibUAsmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636603; c=relaxed/simple;
	bh=qbVO92ABCC1+7CT9amMSlUYErry59m82RuIMiHqH71w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bdX8Rb65MsNE5SZ5Kkyo96G4HDEWjDwB3QFCVURetOJhiFvfBFOf5VKnUP3+uGaChWeEIFFVDJDkXpMk3re8QTNbxtAXEiOyExo/Z9LtdgI2MNa2AQmCWQUOZ6oxy2PgTOAvvjjtq4u9GqalDanpHtKivFGi7H+gjbwKumAHVyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qIb+OLGk; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIb+OLGk"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66c7127a73dso2948785d50.2
        for <linux-alpha@vger.kernel.org>; Sat, 05 Sep 2026 12:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636599; x=1789241399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5UpH12e6IiYHZtSv17pPbz9k1WtvLb0ytyAYLXp1am4=;
        b=qIb+OLGk7PgntvulUVLftNIlVCrWh2lbPDesPA/wWmfC7flGvUIDQ51bpJ7mezX0Js
         HbhCrYPKq03HEH6ZQc+H75bNwUC63rigBgokumMemKNBuEQvle0Sy7O2ViBM8/v8atC+
         6CupSmU+mQeAXZsCIQAYAsTccsPZ+NS3G+VxLPrt0mDS9rqXC3Qh+m1lWUbI/9K1xB+c
         t12e7MMQM64G6olAQ8YRAB349UUcjqC/HGhzTnVXc6yair5zzl2XUTVhL4ru4xnr4ML6
         XjK/PIVaT3EnUKJi4fZmV66SMqSe7k0yRVK/BxyeV54UOnF9NiZUHTXmmxIbFcNWmdQD
         frPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636599; x=1789241399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5UpH12e6IiYHZtSv17pPbz9k1WtvLb0ytyAYLXp1am4=;
        b=IXAuiMbkdeJoOgHs17Qb3z5fA9psXlhn+QZzM32jCGEKWjVPLzUGE7voUq1R1PaETF
         zq1hj0mWXprLw0mzgv0mnrpIEDoTeKmrtZoQB7ytg8bKMzBMuQDwEzJSKsR3VwJz6dY0
         ttILFipj6h915Q68JfrU1ySH58rs9xffhJiQTtvWyhcHCDVWaXhuyixCkW4ZZ7EJsAGW
         1+kqV9jM4i0jA5Yss4LipUAALycp30L8MGoM7ieN8xb+YMLj/Y7BEAYYKM9lpeG5dTxO
         /kblkIyEUgGdh3cblvbl3snyoc3bTwCzLZutYhZ0bs7AXRSIddPBP4L6CvwZCclF8RN6
         mPCw==
X-Gm-Message-State: AFuF++naZmSDRIKgsHEw+iMne3lbjO98Ge2TqF0LaY7xBP1O9QBV8rWX
	QAZ3wRLMWtj9g1LODaoIBMn/rymvuvmPWORYeV9WHlfenSOmzYzokF4r
X-Gm-Gg: AYBFou37olfQRf1tSiCpPqehyervs7SYwApgMvvOJj4wjtubFjPa5Yaj6RFzwUi4SkR
	yB3hphYA4trwsGdGfky4bjYfa1PJB7qlPa/C4ysVhAF4+NPntZH7wd8pLCUaqSo+fUekuf3mJjC
	HyUXJnX0xYLbBZ0y61AJ+7LdoFfCrF1pvwno0fT3N7m5KKLoKc0Lfv7/nXJHQha+GOiSKS6BnLE
	qRYMwg8W+Cq58IckG2NsfOKYW1MJa9vWixnAMRPq38X6on6hFwJLPNpjS6B1rKV3aCcnwqLCd19
	67zv/Wd0FvuOxHaBrZqkENpDEqHcPoMPsWvt5qT52HKGCl7XnuxfkKYCMbH30US0qWJQsx2PR1V
	OrOse1g2icWG2VlPFpmOlk4q1+N66Tbi1lyi+vHfkyMF6Qi7TP0tYy1kAhMaQUOoMWas0mOPRkM
	lgEoUR0m15AizbTLqgbxViNF023pNtxRT9rShsP56ckHWC4nJ8o6bMQy3a98+trA==
X-Received: by 2002:a05:690e:2581:b0:66f:8797:8721 with SMTP id 956f58d0204a3-66fb591c4b0mr3931332d50.10.1788636599117;
        Sat, 05 Sep 2026 12:29:59 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48f361fsm5000992d50.10.2026.09.05.12.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:57 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:36 -0400
Subject: [PATCH v2 15/22] alpha: select HAVE_GUP_FAST
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-15-83e8245761a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=qbVO92ABCC1+7CT9amMSlUYErry59m82RuIMiHqH71w=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E6xNXGyqXZ0vv1g+ZG9qlMWzGNwm8jnsH3zFy171
 yW3Nh5q6fjIwiDGxTBTTJElbr0iy6y2HUt9Tkv/gpnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DIEMHaN4iJweg0ZmcXFpapFuWkGRQ15+SWJJZn5esV5+QWpeQXqBXlpmWklGRn5RcSrQCL281BJ
 TV0c3I0MDE0tHCzMnC0dTE2dnJ0MnN0dHZ1cnI0tzEwNnS0cTV0tzBi5OAZhryv8zMjx7VPb1xJ
 IPi9qSYxY1Sj6ZUNP07+qkqULLcqafmfSlZY85I8OUddbSTbfc1IpXssw5wmlRN7No3n7hQKGwx
 LxIodK/IVwA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

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
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 4bd5e913baaf..1ba262812212 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -28,6 +28,7 @@ config ALPHA
 	select HAVE_ARCH_COMPILER_H
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_KMEMLEAK
+	select HAVE_GUP_FAST
 	select HAVE_PAGE_SIZE_8KB
 	select HAVE_PCSPKR_PLATFORM
 	select HAVE_PERF_EVENTS

-- 
2.54.0


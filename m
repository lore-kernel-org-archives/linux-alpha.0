Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0086439A078
	for <linux-alpha@vger.kernel.org>; Sat,  5 Sep 2026 19:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636584; cv=none; b=YYRlS9ju/qg1/HcNEq9E70BWL4iLl8HqeW4BZNUlRrfTZdEIPMS/jdRYWm5RbNbIn3CvSjUpJ4WSq9ra78/tZWwgMcSfY+27mExhSNF7scTQuUG3z/tdzlM8a8BMlMT/1aqCJE6n00jZcO8RbhfnT8J9zKlhs8Rk6fUjQTu9anM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636584; c=relaxed/simple;
	bh=d64vrkzV8SwOJMlfAMFEdEJjMT39PCBSfivQv0NFu/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E+AjJFGuXxfPoimHtO8SgJxW96XGasx83Bc28+Y7znmHAdnlCgEr1gLUFR3eyoC+hlKYPx1ImKZQUIgabsi/6JGUMjL0puPOuL/3HNOrzvxpK1WbULRA8V5YVQY9PNvnGGIGxvDD4xYnlp6yaubrIHieR45jmjWsDok9zGYz9TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qAxC8DJ1; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qAxC8DJ1"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66fcf87897fso239813d50.3
        for <linux-alpha@vger.kernel.org>; Sat, 05 Sep 2026 12:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636580; x=1789241380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JdpH8z6Rb7sleDgNsPa+IW/WQmX2mRqnvOWICUv+Ss=;
        b=qAxC8DJ1oJZprWRGoKUSueX/DlAhcE+NuMXLAsk9BHdRXX8yaVbHQ3MzyRiBMmSimv
         PkyBxif8MLuX1LP0skZhoucKFX50HDgDZ+S5WkwCoduBxtQHwW0E7ptlG9W/HP5LOH9M
         5yVeLlE7V8TcPFAj+kbpJDXTfAjWSC/5GDpXO5kIVf6dAxBzOackN3UfgCfINaTTXe/s
         Gx+juww3HXV5O+jrJLrRpTZ3t125Q3kCnohUHCnRocgel+CcABF7lMb6IEvRK3MTjlyc
         TIBrzYoY/j/jR9vHiAKtN3SMIR26aFBgO7yzH7R883Hrihl46OlVP5hIgNbNufrEiToP
         Cmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636580; x=1789241380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JdpH8z6Rb7sleDgNsPa+IW/WQmX2mRqnvOWICUv+Ss=;
        b=HnCPAds8cEZKv9FqvqtPcWdtPUfHZUy2Di7Xyi+mWjMOkDY1ge1GRR2k8NG4MUMt7M
         PXSAWnOAwtV+iy44wFT8Am+97ca9Bcu84EqycQEmdtXLrcEfLp1QXAGBX11Z3XQEtJeq
         pR1M9yyq22oRVYS4qroaV0k+7OGEz1y1bV3pNdascvf5CfuZwmcPfFst2V7zm9BSp/aO
         MaVYy2u9r8gF6IM4bmo5onvB5IFNgbPEEaadyPDzpzSZXMyfC26ohwRWO0xn0NHqzg6d
         hZ5NSW1vmal5BtNGK1xd6jr43BU22GaWf2Umc/6Ky6sb1aJ1JXvY3soKomF+HFhyBgIe
         cAvA==
X-Gm-Message-State: AFuF++lzCmHLYjTRU3qB8DCzJa/4CwACY8jXRqUOTfHkRAaPl17hnAxY
	n6FvUeTC2G6u6dw5+WeuNxrRjQi1SZGI7qHU0yBDwUQDVhzOkNf4+vXL
X-Gm-Gg: AYBFou2shUWSlE75Qa/iXxp9ejM6J0LTdNwuSOkovKHX9EbixwUBxyCVd2EFV/FCwq+
	UFrJ/sRlEBYonlL7s8w0X6p7D5XH3ei3F+VxQDS7tY5LRSY6ov0tN/x+Lsap2v8dIToJc651yK3
	RSr7vxdvwMEMEGEmhqVVWLx2EgFxbW4RrjIuzCl8E5rlI39GTV8tnoGOHw+g9RzG2JeUQzdjyyJ
	5wXFe6gVpyz+zwsfYvAenWyyKMspqt/t649VI+vQPb9QkXbMHGM4jQ1YT9kOwGjFLVXEtBC0BoI
	jMNH85REdj70akFuUqv+x6b8WeQeIvMOVkku7pU1F2UwusxhDPZ/yW8X6jMt7U0xoblJIRH7CNB
	eZnCkw7VDLKlwz4TUvOuMdipTfoUnDOjDdCULX4phRasAd+SqyYOwKRzqu3aU4qTBKvxPYB8/o6
	sx5FSfpJ29vH8ZiYDZ366T1xR/+8GYNCZ10Eo4Jl3D2ZfQcUy4xAMuCK9vggl+
X-Received: by 2002:a53:490f:0:b0:66f:c1bc:4094 with SMTP id 956f58d0204a3-66fc1bc485dmr2007771d50.87.1788636580506;
        Sat, 05 Sep 2026 12:29:40 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48fb6d5sm4938594d50.11.2026.09.05.12.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:39 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:28 -0400
Subject: [PATCH v2 07/22] alpha: select ARCH_HAS_FAST_MULTIPLIER
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-7-83e8245761a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=990; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=d64vrkzV8SwOJMlfAMFEdEJjMT39PCBSfivQv0NFu/w=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E52OS953f6VlMGdbfOOiZqUx+b8/qvsEHX00sZJp
 28vXqD7v+MjC4MYF8NMMUWWuPWKLLPadiz1OS39C2YOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MwQydIziIXJ6DBqZxcWlqUW6aQVFDnn5JYklmfl5xXr5Bal5BekFemmZaSUZGflFxalAI/TyUkt
 MXR3djAwNTCwdLcycLBxNTZydnQyd3BwdnV2djCzNTQycLR1NXC3NGbg4BWCuMVRnZHhVdITDzN
 X1/ZZT7/jk5OsuOnjyCsousnkdKlJ+fmvWU05GhlWLgz6/ueSyxFBtt1aHXZf9g7iqWEbJAzp/n
 s9ceDK2hwUA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

All Alpha CPUs have hardware integer multiply (MULL/MULQ). EV4 and EV5
implement it in microcode; EV56 and later have fast single-cycle
multiply. Since no EV4 system is likely to run a modern kernel, select
this unconditionally to enable multiply-based fast paths in hweight and
string routines.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index d039b7135d18..2672971b83f3 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -7,6 +7,7 @@ config ALPHA
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DMA_OPS if PCI
+	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_UBSAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT

-- 
2.54.0


Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6917631F9A4
	for <linux-alpha@vger.kernel.org>; Sun, 17 May 2026 21:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779054012; cv=none; b=G7LBKX+axafuad9UbBgdE17lij104TW9If0JRO4bt8cdCRLWRhg2A9sOefwogQ2GbKsFVXh/ttcskbrdgyUYRS9GYxnuHXBiKVVuQfaE+QRz3OqNkfjLxTUdRR+iZYumyB7tF4TTq93DVS0sEstufhNPPxOiJnAU1zxyIw5M3YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779054012; c=relaxed/simple;
	bh=D04sp6jy24qV/d7jpV7qcj/FJRHhYaGlTiewOrERXrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PlvgdEnJdp5YdwssIgao5A8cjlQmyiMsdSMDqA4H4OuDRfE6U0L9qaDW04hg7t3+xOt3g1wvwEdEoL+c4ZVUSI+tEMm5eF5JvNNwzZxblRRfcWXl7kHTU3Vdff0QLwv4J/d6WYt69ZPxUuME90axExY8e5XJCVTIM3YmGxIT2rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Glk3lP0n; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Glk3lP0n"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a858881ad2so2187673e87.3
        for <linux-alpha@vger.kernel.org>; Sun, 17 May 2026 14:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779054005; x=1779658805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byIacLsO8qy3Mf9mbTJig4sdcp2UMDCGsxpnJNNgpcs=;
        b=Glk3lP0nSxczV3/GAuqzg0dFgynKlS8jF8HlBx0n8ASyeR0LK0N7oGjrdBQqnNPADQ
         LogenKISw+Oa0HZPFcDPfDH7KSYsYCMp452+BdkQEBRYsN5jivzpGpfXCW7o9Wf0aE7U
         O14jp7dTaZWCN+xS5pQRkoYmfUyQO6sU/98VK8mpYneVOk3IZnmxW8kaeKNHa0D9Rz39
         PkpmaymAU7uGmr2xxEjwjmNw5P3M8wicSX8f25EuuXCfeXvVOumlOZxssilkJsApsquv
         tJtCcYgCZq4lxolIqKSF23MDAbbwl/Kp7FI6a1yc8NWSy4YAkNqi37GH9V39YHiO0Djv
         h0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779054005; x=1779658805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=byIacLsO8qy3Mf9mbTJig4sdcp2UMDCGsxpnJNNgpcs=;
        b=sQ3pl0Q1Sa4NnU1giSbo5xDIu6LIcuS/ZS1lJ6YnWBSLwZqE1Di/7qASuCQwraXkcj
         RbELhO8pELog/bhG0Ol3LWQoTrmUBYDxCGi/gtN1B2S7tLzEVxl+i8GPE4MZh/g3zk2H
         KJyY/C7EloZ+i8ZIvbE2xXa0KThIiH2IAEnitGrw9MhlwAJTkPOi9YXVc7uLJa+OBrDa
         BfXnZLCG4/rV0h7Lv2C3OMMnory8+UAeb7ZNl3wNNJSAFG2kfHojJJFOA5laDsJBRTS5
         yyd6pFeKZzjQHmceRWBOBTkdrv4oGxHScrbSzIqdh0Bh11WwsrJk9vVasolm13xyYXjZ
         EW7g==
X-Forwarded-Encrypted: i=1; AFNElJ+hdhS0VOoRzkKuTWWcT8YbnzeIDnPP74oCE1iarNft4MPNTf1yu3anr9ccg1jyZVX7gsCGfyMDIrQsYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkF5VgfULeYrTB6EFn6F32UaWqrXA5zRxBIBj4npDrzXxfqcKg
	aSR1xFXNlt3FUd2uZfOJH9m5VtglNszGfe8qU1jC1OOysJXKoWEE4YXm/OFtTg0c
X-Gm-Gg: Acq92OGJRLJvb4OO+wNj8FeoCEtTeWN67zEmmciFjlCWxEYa3kb8fAyeehKAgXpuJ9p
	MUQktBWsKf5b7Fn1FTh5JMcDgCF2S8l6EiQdbl+Vy1QXTLPU6v1qy8nvmLXiCvf49MRyZliQgpp
	FOUNCwm/f9CR9bKlOe10zHFIdLwj5YKbc/IvJYqEnTaA4ltp+Btc4kDia0Q56OIe2TFAO4tP9aH
	A4dYDnKnizv3W75rY3mlEB13A7MpOJyK8ch0Nj3L8LfqcMNlMSaQw2q0MmJLMZvDKUhCuT62tAo
	GoFP2yM7+sJw3YZnLm2eTlT6gTJqr111t0uyy98bFLicXMuJy+G7D0Iy2GmOuUP7Cp6GnmRgfxv
	T0BaSDz/pgepP+O509GwkEb3L4QgbrqgZTderu62tLGIMPlQlwP4uySaW+i+s3KHzer3m7gKKiE
	LW3zRpO4fZ+vPz2Dlmdz9VbTCbemnUMUv2mLgaiovQae4g3r8UdD2QN4zHBXrywPJ4Cc8fMuojy
	Ycp0FnkWo8Or7kFu3eWboMON+uWh8A2hHsSCsZ2ilCYDw==
X-Received: by 2002:a05:6512:3a84:b0:5a8:88d5:a502 with SMTP id 2adb3069b0e04-5aa0e740342mr3142036e87.39.1779054005447;
        Sun, 17 May 2026 14:40:05 -0700 (PDT)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91c1558f3sm2890076e87.77.2026.05.17.14.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 14:40:04 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	macro@orcam.me.uk,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH 5/8] alpha: provide ftrace return address support for lockdep
Date: Sun, 17 May 2026 23:36:14 +0200
Message-ID: <20260517213919.347523-6-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260517213919.347523-1-linmag7@gmail.com>
References: <20260517213919.347523-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lockdep uses ftrace_return_address() to report useful call sites for
lock acquisition and IRQ-state tracking diagnostics. Provide the Alpha
architecture hook using the compiler return-address builtin when frame
pointers are available.

Return zero when frame pointers are disabled, matching the existing
fallback behavior of architectures that cannot provide a reliable return
address.

This is a preparatory change for enabling lockdep support on Alpha.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/ftrace.h | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/ftrace.h b/arch/alpha/include/asm/ftrace.h
index 40a8c178f10d..7ec44134c804 100644
--- a/arch/alpha/include/asm/ftrace.h
+++ b/arch/alpha/include/asm/ftrace.h
@@ -1 +1,29 @@
-/* empty */
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ALPHA_FTRACE_H
+#define _ASM_ALPHA_FTRACE_H
+
+#ifdef CONFIG_FRAME_POINTER
+
+static void *alpha_ftrace_return_address0(void)
+	noinline notrace;
+static void *alpha_ftrace_return_address0(void)
+{
+	return __builtin_return_address(0);
+}
+
+#define ftrace_return_address0 alpha_ftrace_return_address0()
+
+/*
+ * __builtin_return_address() requires a constant integer argument.
+ * Keep this as a macro so the value is seen at the callsite.
+ */
+#define ftrace_return_address(n) __builtin_return_address(n)
+
+#else  /* !CONFIG_FRAME_POINTER */
+
+#define ftrace_return_address0 0UL
+#define ftrace_return_address(n) ((void)(n), 0UL)
+
+#endif /* CONFIG_FRAME_POINTER */
+
+#endif /* _ASM_ALPHA_FTRACE_H */
-- 
2.53.0


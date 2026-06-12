Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEFF3655D9
	for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 20:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781296412; cv=none; b=qA+AsGcwnHdcDFegSKBCN9m/NJBHvypXp9Mpyr3fS0FrFBhXR5qYJ+7SolAsvPBaigBJXK5ytJsDbaDcJSm6VWwaOkgcg9OFhf9Urco3zAovzbQrVgIIOptEAUoGnh92oQhSqfCTq/1jqanAtCIkXYjJJWWlvmKSNQGIsqWxSfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781296412; c=relaxed/simple;
	bh=AA3VKNGfHagQnQ2acuVSruJOiHuJZ/EsfXIZigb6zDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fgp3z+rkXKfIVJfM4XRY3HtAx4bLtFnoCr3lLDurTDHq0nkuOlg3exC8yp8LLFOko9LJzNgFJcf1AHEVYWhEBtDsRJWasScBbcIwOwNEtUgnyRMe+N8jnDFEYXshRu0BxVPxHTFbPfkkZTzcXKy/9xmKy/9qzVgkC050tL7kp1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVL+vMOL; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVL+vMOL"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa68dbb38aso1206974e87.2
        for <linux-alpha@vger.kernel.org>; Fri, 12 Jun 2026 13:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781296409; x=1781901209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diJVQrERcgRnNnAaxdJ5H+lmMbirK3Q8oXfz9l7IVJc=;
        b=UVL+vMOL6Hsc/AhtXey3yIfNmHVsZm4QsOaWqMxySH9O2Qf4ZEINKlg0ezmn03Jyio
         jGMow6PYldJSU7WmyEXKezMDCFFXoAbAkHjVDkOmBXUZ+SRxI7AtMHdg1EDkySrUJUPk
         +vQMBvpR5T78ILkapzqqVvcXoIiEMW6XES3Qm3SaIvjLp5ICMEpULtF8XyUIVgQ17AOn
         sbx63hwXXn87C6S9tgdcuWcw86raX36Ib+XPWGsWNWIwcJgAqRZAaZ+0qt0OYkZq+WO+
         HsE1LzcLbHOksF9u5DD6Ny/7muNU2KYdVfzb7F6LC6ajM5IJQEMVLl90CHlc1G7b2Fiy
         QK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781296409; x=1781901209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=diJVQrERcgRnNnAaxdJ5H+lmMbirK3Q8oXfz9l7IVJc=;
        b=G48QaOJ27lIRRjxYxudZXsrdc4WTZl5IMieFnN9ULK6kb5xgsEID7XTIHWIGH/LD9d
         j6rr7yUylNYhMltwOACObxlOAMrqH4HUkhqeDiNTnbCV44m+3gFmvIkpPqY6ePqs2bnQ
         oHA7zrvi2bZIGm6Z9iX2rFYNw9kPFzT9WtAotfhmoyz9NsuOCG8k/J4ADuWKgn7y/CgN
         nUiqyugN5hD2TrulO/pGcGmm8+sthLTUwKXrGHBwkQs1JUtnGaI6AMtVXz5tHrxkLDHp
         c3Z7nobg0FYnyVnFZl09gR8lNfNzF3Lw8NVNKZhIMxgG4fxfIXtSPBnJEyf4yr/v1vkC
         GZ5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/SL8ZV2OQOnRah8Z3sgx037IakrFqDH3sMQ0ER96G0O1QiZzC8lAiYASRCdM2/iOldfAu1zNjzAGsivg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkw8GCB2YH1x2nZakfNgn83L1hh0a7YeTBw2QTuH8XaURq41jM
	m+6et/Q26PhZSFwe5eIZxyjVZYeZxmGn2Md7nLt8Vx/eAa7UQ2CEal4PSKFiNLdS
X-Gm-Gg: Acq92OFbOC3sToEtlzHqiEKjD7JufIZ/2fmgHvVtFw2OWk88FtGR5dqdinmN2Z0Rah0
	vRW9QiFy/RbhX2V9fqgDQ+TqUIG1BKx5gOm2c2cm4bG1T772EHPBCLg32vRWwezEWj0lXA9cj3G
	RaxVwjd5hEczN+oKOjuYm85WPIse9LLxy8EYJ4qIhcwBU7aKab/ueufGg8LdXzU+bPwo6K6MniL
	N4Q5f+AmcLin4MAMUpezl6RPRBoFOKUv9G4llPxGGRDtvpliIR3RkFyVOMdi4A2bWMTHkUnDjqk
	fIe6253wtv8JvxCkTK9LdcLdGcqz8wSc8Vy1DOL23Hq6fxQHasgXFdtwYlsO4rSQIC7r7y4dayw
	ZZuvr5fUSXPfVfmBc01TJ0rrPSIp2l5FD7Gt6UB1PXjKDuQYrUDdqiTmfJFOts1cbomJoqWxdch
	L/3MxQT3a2DeCtRvLEbRH9rzWP4r8Gw9R2ZcC7MtkXz6sHkanTbexXD7P5kIpabmh8w+G/OpZkW
	m6jh5iZ1k6hE2rLBpqYvahHWszhBPEH
X-Received: by 2002:a05:6512:acf:b0:5aa:63de:6b9b with SMTP id 2adb3069b0e04-5ad2db7a5f6mr1331331e87.34.1781296409200;
        Fri, 12 Jun 2026 13:33:29 -0700 (PDT)
Received: from buildhost.darklands.se (h-37-123-143-144.NA.cust.bahnhof.se. [37.123.143.144])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161e70sm788949e87.5.2026.06.12.13.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:33:28 -0700 (PDT)
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
Subject: [PATCH v3 5/8] alpha: provide ftrace return address support for lockdep
Date: Fri, 12 Jun 2026 22:26:53 +0200
Message-ID: <20260612203006.2265557-6-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612203006.2265557-1-linmag7@gmail.com>
References: <20260612203006.2265557-1-linmag7@gmail.com>
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

Reviewed-by: Matt Turner <mattst88@gmail.com>
Tested-by: Matt Turner <mattst88@gmail.com>
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


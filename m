Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046998;
	b=j0VTBQ4q1o3UMcghddTck6bcLCnm7jNmPfpP4gIIM4/kk5sVwgeZhdVeG7aoAj/g74u4
	 Wzb9FAj203VJtgRe+wa4kN1XEVdFoSkHxiig9MinxA8mMB5eQq8kwhlYfT7VagjN84fnk
	 LUULYFdPFoLp3PRw7p+S9+X+Iz/xhJPQY3G8OsMTjmovGwW8FbCXWXsZijdoCsKRVm6Nl
	 xn9TZmSPv8abNmo9fj5Atm8on/CEzwnqn7OMPF0lFIsRTAv045gos39qzYlwH/NYZUVek
	 +BGUP8TkH3VjgCQlgF9D/QflxD1uqM3+jfDAtpOQiF/hhmhYOVnY2n1UMPTsls0awDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=6fd7grfB3tzoFbfBTrAoxkisbPV2yJhpf6JFjYB4i4M=;
	b=xiGRBkSQ6L3BY7Q++lsaDnxo7a97nZVm4Y8arh37WmQOffPp+wqLvPcgCOj1fk7v30or
	 hDYisuNSUy2n60+39FJHhxhFiaZhQxn9sTAgrAOmZFgoWloKiheqCjypuxeHjsnrToxqu
	 jRSB4X8XovrYN/lNwgI1Fj7V4aKPkDXqwmO+U2EBxHEYGCxyqG/wEGCParmIg4hFoV7C1
	 +pjcUFrfaChJkL8/kihDZlrOPsZVHhOkTwLvf2HSySHm1AqdfN4rnYFsAKf7wk/EOW/ay
	 6oWzvp5XY2wTmQtATqG/mldHTA45k8Tf7MCw1vV3LITuoeuQ1zakaUnkdrn9MpKLqGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EPGj5WNS;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A8260A2610
	for <linux-alpha@vger.kernel.org>; Thu, 19 Nov 2026 00:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A8260A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EPGj5WNS
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4fb5d96b3so6786397b3.1
        for <linux-alpha@vger.kernel.org>; Wed, 18 Nov 2026 16:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795046997; x=1795651797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6fd7grfB3tzoFbfBTrAoxkisbPV2yJhpf6JFjYB4i4M=;
        b=EPGj5WNSY5QdE4RJlUeb7EU4A0DW/owBTcBw1AhCNJcgFON8Iv8XkjGncyJCUAM+Jr
         dfqLjwsYK8ZdRhQxQYvIzEYVdViXAE21Emu9rG+6UMoyRI2T+t18vYyS4i0uFB0825lH
         4WyKyby/S4ZHKBRcqoiSbdzneQtPsv5axzxwMMz0UKYOrw0hzOcfM9xuIs2s/UkagPZP
         v1rchVHI9u4V7VFtzwTCFrMZJe6VHFLkATC6yoq0oeTBuOQYdQ4CuaRhFD/4k7QO+Nmo
         kbEhIRVXovdlDT7NPkT8f91hZp4UNTi3Th/3+fgiQ3LKYv+m23S89Zen+i2lsN7yyovt
         H3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046997; x=1795651797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fd7grfB3tzoFbfBTrAoxkisbPV2yJhpf6JFjYB4i4M=;
        b=sr7OkkV2Opzx80ulPrRy+ffETBSb7+dpvR6Tkk9khYTOCwBWb0uKJ+WPu4xFh0WIHU
         4SExn1Pn423Yp6KxwNSZz+JTLyyQpVc0AJhDrKlLnk7i4zANtIcx/Py6Rq5OJdBKq+Yk
         hD8UcHroLPatiI3wZ9iESrHBeKbAUmTc9GXwcChs00sh0q+yXzzIeB4ErciPkAiOIGpF
         bPvxS1M0vQwUwNEuXtlUVhy0ggRN1TL9WrRpSNvMBcOKdtJA6docbh6O92zBVQzZMCAv
         6Bx4okpbFO7ftxjHqVT0rE8/Ldqe0vbnzPIo2vkF/3tXRWuWVKj6jecEgMUkm0tE1Svk
         gWfA==
X-Gm-Message-State: APuU4Z+HavRZpV9RFVgsVD8S5L7QCZha0OZSr89JIhKjbVyrALL5lqxA
	QRy4ybKzKrSdzgL2bCuVlZlF7cf/GVSVDgVDnshEkMJtsS17wCy9jJiR
X-Gm-Gg: AZFdTZcn1qOghVJ/lurHZ+VnLfUcg2Ofw+Dpn9TIgmB7INpHHyQunCOclBpxNIrZ1ZK
	sK+3vROmALVgGV1EM4Ow4NgtNSNoZIPGc/IDQnTIJLxRuRnPqJQ1hUHQCxSrWGUitX0kYIAOcjT
	jqbj/hkmOcDMbjYT0X8NBHu6clyi9b5ryDlAqgwIWpaVI3pveCJmR/QLnYBWQFrZY4TQbZM86DR
	2ADLwnv4rVioeawsr6sGMRHqLgVb1x4z3KVtDSwG6oqSrthDlUi4GU21mzoRlQLKsdJfDDTETFf
	620MC42AEkeY6Tyky/akt0euP/wYao3ka/IJF/FW16tjLtHvCO1Ce64YauWqnz5XNZVQMKk7X2U
	FaZVGoSpR9ZuK57EA76XEfyb2iilsy3if2j7e6qjEEQU8zMpbe+o8HN01Zr3lOAFld5hsEfsiPw
	fOpFQ+PGZ1KUAOoZPj8kZwevOhIQ+qHeippixUpKImC857f/Qw/zRO3PMKToxIEePh23Njy3sy1
	z7+ynGuMTz5HOPdLamwMXzHM/eckH75l7AE6MinWP04W9CdmCsSZ5OSFMVmmpHyKfIT6ULXJdhx
	eH1wUXEsxtzOQcvdsasqGKqRXo3hzyplJJEDrmALSMcs0eZQjzoOeYOzdpARfI1hPg9YN7up3zf
	eUHsyCJtEhC681Lfb/03xoUoPos6NgQBjxTsy0V2ch1QVzmU7Xhqsgw8mA7fwslizRqFn3I1mr8
	HrDJ6i9oONNSmQBJy/Ig==
X-Received: by 2002:a05:690c:45c2:b0:8b4:d1f3:c80f with SMTP id 00721157ae682-8b514676cc1mr435397b3.23.1795046996732;
        Wed, 18 Nov 2026 16:09:56 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe10d935sm25708127b3.41.2026.11.18.16.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:09:55 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 18 Nov 2026 19:09:49 -0500
Subject: [PATCH v4 4/7] alpha: marvel: notify environmental events
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-marvel-env-v4-4-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
In-Reply-To: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=kTcqrZoPJJjAEKBBA1jTVVnkVIO/Zb02KSORE5Uuqtg=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+2Xl1v1RT07kkvEXddXHh7pd5XMsNmJNfpi/YK/c/M
 n3/4gv1HR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHPN+0xGhk0l2sq9s3
 Zp3f7V3XPryGs+b4nq9Xvfn6+VjW7qf5nO+JLhf/Xyqowzj7iV1yev/OdxcJf6t2/Xom3/PFOdo
 sFW/fHcJR4A
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

A change in the state of a sensor arrives as a system event logout
frame. Call an atomic notifier chain on each one, so that a sensor
driver can reread its sensors and tell userspace without polling.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/marvel_env.h | 5 +++++
 arch/alpha/kernel/err_marvel.c      | 9 ++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/marvel_env.h b/arch/alpha/include/asm/marvel_env.h
index 16ccd2002a11..dbbf827a18ad 100644
--- a/arch/alpha/include/asm/marvel_env.h
+++ b/arch/alpha/include/asm/marvel_env.h
@@ -2,6 +2,8 @@
 #ifndef __ALPHA_MARVEL_ENV_H
 #define __ALPHA_MARVEL_ENV_H
 
+#include <linux/notifier.h>
+
 /*
  * Ask the console to refresh the environmental readings of the GCT node at
  * @offset from the start of the GCT. Returns the console status, which is 1
@@ -9,4 +11,7 @@
  */
 long marvel_cfgtree_partial_update(unsigned long offset);
 
+/* Called from machine check context on each environmental system event. */
+extern struct atomic_notifier_head marvel_env_notifier;
+
 #endif /* __ALPHA_MARVEL_ENV_H */
diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index 46c521cea9a0..6e0b0aabdaca 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -17,10 +17,14 @@
 #include <asm/smp.h>
 #include <asm/err_common.h>
 #include <asm/err_ev7.h>
+#include <asm/marvel_env.h>
 
 #include "err_impl.h"
 #include "proto.h"
 
+ATOMIC_NOTIFIER_HEAD(marvel_env_notifier);
+EXPORT_SYMBOL_GPL(marvel_env_notifier);
+
 static const char *
 marvel_env_state(u16 state)
 {
@@ -82,8 +86,11 @@ marvel_process_680_frame(struct ev7_lf_subpackets *lf_subpackets, int print)
 			status = MCHK_DISPOSITION_REPORT;
 	}
 
-	if (print)
+	/* The frame is processed twice; notify on the printing pass only. */
+	if (print) {
 		marvel_print_680_frame(lf_subpackets);
+		atomic_notifier_call_chain(&marvel_env_notifier, 0, NULL);
+	}
 
 	return status;
 }

-- 
2.56.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678004;
	b=2Ot3hG5DD96Q5JC4scGLWt1JOLDUA7l3GAdVuRE7Nf5ubaw1c5KHgByZwCZiyOgT20qo
	 /PAK8+ftOFKtFZXuAxGS0BqO0NeB2IMl5rrFd7hiwx8tcQ2HP7Zzk2wC2DdkFvTRNooWF
	 Qh7TngLVbIWllwE8XB/+a6HanotO9vA0sJ97Fq+eE3ukw3FeUj59tvkvTWq2hP7VTy3CP
	 lHdFfy/fGr7PQefp8BnxMvFv3Ic3F6ZhUcivNTWqCXD/N3YirXCGdNrR3DE6zjSCDvOwK
	 4Geu6K73gkii0DODSTGHPCHYEl/btP/xIZi6wuR5hVO6rTl6iwewtrhGiTtYlc/cihg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=/226Y4aFcKPk0d3VKmImdxm39V8qyA0QwzRmeBW298A=;
	b=v0ioIJd6uze/1ZN9nXx+Qsp1OiLlowmaUURr8r7ljEI/A2g+8qS7iEi4r9DBhxvpXFvy
	 8v5V6HxzuwNJIvesTbUFMjCeZnjhPXL5m9UAtKu7lL/xuZ/ZZuoebk24HGBXiJ7amnwJR
	 RL1Sft9qRQqdtFeDNUWW+MkMOlJf6/0P+jJKZaFkb49pbNDhgYq0OzAsmQLadbqu6fz51
	 SdMuS878wS8QXQTRpTug0Tg5eMxFboL6VBHURCrmLB4OshHkDIa5grVCh8WXlbIjdeFj9
	 CtCskUZ5DdCwzE01anpTcUupDroRi1hHEN9rUnK5KVref2vRjwhXctU8c7Jkzy7OXeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NDe3mNXQ;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D94A606A88E
	for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 17:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D94A606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NDe3mNXQ
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67d9a5e9bb6so1103563d50.2
        for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 09:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678003; x=1795282803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/226Y4aFcKPk0d3VKmImdxm39V8qyA0QwzRmeBW298A=;
        b=NDe3mNXQCyKWUsPt59T+7jGbsgmo5mW1rT6AsgZyh92OB21xDOtjpHJvXNkZ1b/3ls
         Yo27iCN6LI3Ky2Do0u3f3eDvQX+7XCJM2Ri18VIQHGTCYNXz3lQl8gZclD8JLArc1UD4
         YB7SipA/xm451JLDYpO2IMY31S4xnqURwQZnqD85NYbEKzlnAyDVPjFAxXSCmdIFmYZb
         Mvl0W5rTQwYG43dUOeHHPeDVIt/TjOisCzi0vzHmfkxd4BGsxrJt7pWvoo2PrXlZ/2gI
         6PmxtuWoIZvKvFKbPUubTPA1Sw+CcUkVwMKLLvOpn6w3pdNtcf02S1OLoEsvFPNHj9j0
         0RJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678003; x=1795282803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/226Y4aFcKPk0d3VKmImdxm39V8qyA0QwzRmeBW298A=;
        b=V2flNf94aPq6pwmp29c1jQSyCZb18hjx5a4OURbfuE8kAcTkY06yN9NTizcx8vKASZ
         ZFxu15ifnbTuB4sPwZMbm+uo1Ff5xroiXGrf33yNXtoixJejHwpCoEkFclconwNvSN70
         F+Bz3gzVABDYnw31tAWROz2ARXwldsw8lmP7hNBt3TB+IubtC4yJHleLTc6hzsIyRzZ8
         dULVGHlI+QpBFgmErOBhvvBfGXYPVQbqQkHNmYISsb+tdGz5NgBhDKU7GAZxmka7DCiE
         mcjaDmJBVSleR3NU5v8MRiW7GgwnELkfWLfsWKLS0c2k4POJRZSr1Yt/rJRU1ZcqwV07
         +vew==
X-Gm-Message-State: APuU4Z9GMqlk57rZRk9+cADeuG3t7PXO3XUKbpRu4wXXKbESJNvG/uqB
	smx5KkmOD7JqgjQWJavCQ+3LVBTAwDnEnYxq78YET5tHrfw7KGo47Mkb
X-Gm-Gg: AYBFou2yrAzoLsIBflebetj35GscIKumtAp2iMusMZYYnylWOcNhUZ55K20bnnGT4Kh
	RBt6bNFH3/i87NQu9wehzcIQEuuAibVBtkB60DwReAAVCzi71raB0AYgTy00iiZ/SA2VSVe/Vc9
	PMe2rbEM3WiJJJmJLaPcJcFcuc7kPHiFlz2jV568KuPTQF1zBJJ+PhUF7Lzj2ji2B8l/E/yxpOE
	zv4oIR8TO0lAqM9xP01iYY6CbE37DHDniRI2tXRi6ljoHj7rc0RYQM7scUSJojuliYSfES89B4W
	LEVOm6jq2loAg1eSzl/XbvzuL5lgKbKGUujvv7myE4ntK7ZPsPxR7dSKWARMWl/G9UAdfnCvoZk
	spy7c7vpcYz33trCrDngIMXzvrH62duD0fMfHMM5mDjPJitlr1YW0l0HMEVta+aAkf+Unog/XtY
	iIGxHaW5s39QDmHSl1JZmM5i6zJ8b0h5OYOcTh8wQDcq6F3z88oD3Vy4wboTAUFwblUEQe2LVKK
	U1u2lFZz2fEbgTlQkUV0A5PmvX2ojRrYek3OsMq5MLJYybWiE89AMnnCs/wXV5fExPh4uUbqVK3
	4QM0DA1t0xHAMQK5jfxjh1jACMcYKYHWJAj0/KvaJitz287XGPYYLy4lu91AmQv2l+TnGFySZJ5
	1qs186X7pqqJQEoXH6T6OtQadshbbnHnxRHG7t7ZnAMvq2KxhmO6+UAcAaRUqHA==
X-Received: by 2002:a05:690e:48e:b0:677:cb43:4b3a with SMTP id 956f58d0204a3-67d8979ac95mr2046603d50.156.1794678003167;
        Sat, 14 Nov 2026 09:40:03 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7f1a0dsm48618117b3.1.2026.11.14.09.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:40:02 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:39:52 -0500
Subject: [PATCH 6/7] alpha: marvel: notify environmental events
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
Message-Id: <20261114-marvel-env-v1-6-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2124; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=kn6qAKEjNgVefdGm65LCAkz/4DlKpjG6hjl3uYO+Iy8=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHnss77lqeSh2wWmTuuz5si0HdjDcu3iJYONOorrM
 vcfZ+Cz6vjIwiDGxTBTTJElbr0iy6y2HUt9Tkv/gpnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DIEMHaN4iJweg0ZmcXFpapFuWkGRQ15+SWJJZn5esV5+QWpeQXqBXlpmWklGRn5RcSrQCL281BJ
 TV0c3I0MDE0tHCzMnC0dTE2dnJ0MnN0dHZ1cnI0tzEwNnS0cTV0tzBi5OAZhrtK4zMvRfP3jms+
 d67XBGN5n1d9xmlKT5mqfP/6nwNV/Bp9T7ZzfDP2t7OfsvB/YFG81SKZA4/Vi/knVPmLHUhjsh2
 1u1mniPcwEA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

A change in the state of a sensor arrives as a system event logout
frame. Call an atomic notifier chain on each one, so that a sensor
driver can reread its sensors and tell userspace without polling.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/marvel_env.h | 5 +++++
 arch/alpha/kernel/err_marvel.c      | 9 ++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/marvel_env.h b/arch/alpha/include/asm/marvel_env.h
index 583dca6c02d1..14b05efa6f51 100644
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


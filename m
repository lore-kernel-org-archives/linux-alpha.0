Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939220;
	b=5AH7POGfBvIWs2eW3tNGVCOYZxStkN8N9iGgjgAUOw53njZW66kRwOtXvTy/4OldhzyI
	 aO5qEKw7WfaRpTMwv6aCgHZb7b/Lm4i8h4+paXA8691diKy5YpKHKGZBTZASnqc8xqxyH
	 E2CsPs7NU+CUXAKWNzuDL8WU+8ibJpxMaIF3TZoY7Jfhb6ggS9NUZqQFra+Q4hVPn7NzJ
	 sdIsFJz5Y6Cd0TsaVr44C5OYwuV586nhP/MsxJI5zz4NFxNfAdcIak3PFwZqIFaL2zxsy
	 01rBsY2dkUV4pyWF5mYbQGhH6a6n2NLhAp+WWzvsCGcK+92G1PaqXpSFOq3stlsi5jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=6fd7grfB3tzoFbfBTrAoxkisbPV2yJhpf6JFjYB4i4M=;
	b=dzwISl5EXsKzq1J3KMxD78hWjcDDg/f69NdGZdu0PCy4FOflxjpMPe6Fqx06doa9FIxs
	 iAP0WxVK3RSl5DzJlz1m4EFZWmWyk6i3VgV/CzyQ19UlhzuD+qERNnIANbaLjG+D+rucq
	 h3NdV9rDJZsZjWU5ZZ1TPG6NHyzGXzMdApe27idDfu9B6OiTqtUMMng1G00BqohBqvM/E
	 L3GYIge11nX+ootf8yJKlxsuVukgEikaPE/d9Q2HCytdA8RNqft6Y/4VelNZvaxVjOCNE
	 XEhK8OrOpe2IlGluQUMy2sLsP70YhYFh31tNDY2j32jjJegTYbUTJGvRoZm2Q7HgFYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MmxQwpGT;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150D5606A88B
	for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 18:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 150D5606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MmxQwpGT
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67da7d18f2fso3828d50.0
        for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 10:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939219; x=1795544019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6fd7grfB3tzoFbfBTrAoxkisbPV2yJhpf6JFjYB4i4M=;
        b=MmxQwpGTj9NNy0RMrOJv3wL6yArdoKdNFg5vsACRwNLJ23zoNJoMRPCRiMrzrxbUKZ
         u6kgPFEE170tnccn+ZPH2oI0O26G5G8au84zWGuTnC/rROEJ9NuK3fx4NQoAfjBAi4Lj
         ayC+6jfzy3Ah1R9+tifrhIqiSNwFiMngsvKNOprhhhMlRjhCNFSqlW95JmVeVpphc88/
         /BblIG2qFtA847q91ML6UQ0lVaXOascRfUrWl/8YKagZcvC8eEV1DvvNObYBEKj2yWq2
         z2crBBJ1HVxCJT6L8u3MFHv+1j6DGjLIF6qtFpMIpVBZfSji33i5Oo3p1LJ5Xo3aajps
         JJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939219; x=1795544019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fd7grfB3tzoFbfBTrAoxkisbPV2yJhpf6JFjYB4i4M=;
        b=LH+m/URuuqxDvBGKQswc4psBQHHTc14GU+exy3UUPv365MMvKk9olFcU+Yzcewg7cC
         u9SUZJJu9UEM+macMp3lCRvLIR7vdLGjtO7imcyLMfyEFbS3/ptqH2RRrd75D0ZOaCoi
         lOhXnKxqxOV/nAnzi/AnwvOM9Oy206K6Pxxyd4r3IWBfWiQIHK18ipwzpWqTmZ3IGu3a
         ijab/f9z2NGyjq1dRIccJDRotsLzboqAeSLB2B8FG2eDsedEO1UpiUOCnOtO7S3sxXWX
         42n0FWNxjRE90gOn1mDH6A7oboBQLJI1Tl98dXlAhmU360oJQyxsnHP0XfZEieYzjvmZ
         kwjA==
X-Gm-Message-State: APuU4Z/Safxj8AEqUP9rV8oPTTcopEgmmTwNqiU+mo33zZhvUrLwUtus
	Z36Z6xCNlVmNjP2J6AS0bvzFoGLYFYQPizPgUGUjV7b9JJzZ3ra4wIXw
X-Gm-Gg: AZFdTZfFkIvj6W0uT3EqDJT4DZcw/CD7xVBhnfHNre57QOdLmuoRDopdMJizC1sw/h0
	d2zS6B3YfLePVFfBVrJghh/boIxMxitMl1nEh8H+Qv780c08fQwJjdan2dG0aAY/CjmM1dZtJMv
	aDmcwV5kyei+tMMpmvlQqGCVawfTBCJX1HMX9BZYaE45ldGSEAPQb/MySU8EAZZQlG4zVGucIXe
	/m87yCKCubDE6eGePCrEQL4vsKKbww7FAN3o6JE9aT7TltYA3l3HYaqSTVLzL4TMrt3G0HLF8xm
	q+0NVwQz+xqNvNV3+gIU9VV6q9YknyelLSV8iN8kfuMEOJNe7HZKA5XD5xeYCJ1T2UvReusXN1O
	cHxq/PVt6/YJQVzo9Ha8+vWrqc+s1y51aV62fk8vOv9YYjGEeCIKC7eozwMBVKPIjVmCzAxOjoD
	vhV9tHo8EpZnD6+brS/Y0yeq+XgMb6CkP0NS7H/cQIVY3KpfapLwVcRk5ZhU4O1Wz9+v620JBmy
	JMpQsabTPmEsUSSF62bl+pBDOygA/h2ybIFsF1tprBx+1B9Mzt5J5SZfheoTREz9XOZicuJWi8y
	m8n+KseI0GyITtrGxkJO+39SEb83iixcvdNzU7/blWmgysvKq0b1swBqoiAGaDFxc4gRj/4h7s/
	Meb6rLCWO28IHPOGfqBzxRjhBjCZ7tiVDS0dd6bOatpulQM4HlrC+Ab+T/3JfY1sYymHy5HbN6b
	MCqdV4KIO+1hkXngFmzQ==
X-Received: by 2002:a05:690e:12cb:b0:67d:a102:b8f4 with SMTP id 956f58d0204a3-67dc74c31c3mr2212909d50.0.1794939218891;
        Tue, 17 Nov 2026 10:13:38 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd3fed78dsm268757d50.4.2026.11.17.10.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:13:38 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 13:13:31 -0500
Subject: [PATCH v3 4/7] alpha: marvel: notify environmental events
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
Message-Id: <20261117-marvel-env-v3-4-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=kTcqrZoPJJjAEKBBA1jTVVnkVIO/Zb02KSORE5Uuqtg=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+zPSo1y/OD5lwet4Pl0UP9Q8KXFLOvCMk/um067T0i
 OTHXs0RHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHNN+S2G/yH3tZzbXw
 hUz/gvV5CRc7ZayXvSmybOXTvf7l2huD6p6gLDf4e7dvWTfyX5f1PO+c54ZUttXtDEDRpJ3gclP
 dQcV1V+ZwIA
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


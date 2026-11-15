Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739096;
	b=nNY8qbIgesafpvUxDLKQDU6gMyvbG1yNFw06Cl9bwi2u6dkFucJ7ANJK6JNoywKSXeQm
	 a1YDIzHSwY/b2O+0Z0+QxwNx+RRDYPLGUTx2I8yP1Ex6VZ5+YKwZRWpHU7JNCrSDw/u/T
	 ZAg0B+gIE2i39HrVk5udX1oxVdF83dfWg6eqqDIHRNthWkvhQE+z+wBrMIrmUsftIKzNI
	 203kRO2DFtvO0nHLojBcrsG4bxrm2iSOCPGh0nZGnhfXE6gxoTvpAHE8hkZ7QoRsmDiyD
	 7u5IgnvV34YVXuC8yuV1WZy9K8gOPWAWKs2l/NW9z2TnmqrVmaBO9/ylJ3leFrmwZRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y8oiXQV1HOy7NuomfkqPftUJd1Ir7JJpxig8oQcCTK8=;
	b=k+gmKs1kpCGYXXo42jIzPitPBNRJHxniSJVTA6LlGsJ06h6g+nDCfgjA0BO7BVlBmG4x
	 GUSWkxiWSTfo0jmvyW8ObMu6+J8V/3pLBB+p6fGLMMw29V3AE9SbqVb6rQ1wKuU4/QBtW
	 Y29AUr7aewClAQMReRE26mEKu5+M69UZzBwND6qDrRj1ix3SdwTuHmeFL74tyAaLTfDll
	 1vrxRH6SnSQNoi6dUicz3M7gofRomN31m5TOxegb4ebz2MhqpEmwfGlhdazjeIxx2VI8e
	 VokeNuTEuboJzfe+rmEB4biZoes6x4+iFB6FVtVSwZ9MVCd2FEVePEj25abxEs4KMog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fAgGLWci;
	arc=none smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AADF606A327
	for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 10:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AADF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fAgGLWci
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso24431781fa.0
        for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 02:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794739095; x=1795343895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8oiXQV1HOy7NuomfkqPftUJd1Ir7JJpxig8oQcCTK8=;
        b=fAgGLWciBjUBmsBp3/62k5L97NrmqQfGrjl/XpIJfQD5buxxAf4J+bTv5zbJ5WVB68
         2+T+Q1NfnbxRCZtPXTRxEWWPz2I2sg4aZs5Cb+dXgPIeOuqvGkjSlWZYEp5LAVsIG6bP
         kogwv49fjey60nhLHHgqyYknKGHEPmMMCGZgjaZ/qpimyNWPfpuLwWrZVzYMJTfrYOym
         ZhDOjTEajgamBu4wIxrIiykX8RPISOJab3Z0+ce7CTwwABZyxRHn8leS+btBlJSCFSdE
         9Tql1ThL9OAS2wuDv5uZHP3CXtOGBU5bOu6tXg28A3/8viaDyQEIJOtxjo4wbZWlMIf4
         UG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739095; x=1795343895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y8oiXQV1HOy7NuomfkqPftUJd1Ir7JJpxig8oQcCTK8=;
        b=smXV7dxCudeytJuh83WiL1iUNQWsNuZr+hP1y///fOv0I2wKrGkveVL8vH/1vI/72z
         57A1A2nnMMFeowFamB0mUBPqrzlmTzQZkSIqe9boVciXu2k6qLQjz8yfJjuBVGffrjHY
         Wk2ImognDr8MErVEH/xTyOox1QlbhgYmQJWvfrSoYRAnLI9njxOpa/okLclVFKepdUFh
         Rl7mvs/dGxttHS2aD3xXfjBk645z/Wb/IySqcVlbiWrVOpWRQGalAZ5BOeWo18sjGZfk
         N2Z4OjraBAizDfCjBciQEBASbKJR+SO71ouVcOrWeH0WFtY1VHoryn3IPiMVKSSs5z3/
         A1gw==
X-Forwarded-Encrypted: i=1; AL+hErGT9mRhY01Meduus6J/eyx+A/COUFMztGNUKqj535cF14+QtL+506sd75ItjGDAwhliaUF7o8g7Bwsb3Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/UWde3tA+TM2jt4fm5UXIp2bLKuurUAHRcWyb/Rn8Ul6BE8YDl
	Xo/8+yM9Ihs7pyagmys0Gi4yRYpP2NFQR5e1mho6ZlUmg7ckTDlWkjxx
X-Gm-Gg: AYBFou18U/mPKcnIQMQ352ZLjs89LlJ6tf/3Uv/9d8hKLjRgrUapQOixH3VOcmmfet7
	+kf1PtLLZe3kG80s14osNGPodaSzKLgLYTBWwMFHPFgfxnoAiAHXd/mm9nY7LPvGXPHLLsVOJns
	Wc0efhYuDigG6b6C8dXDqWeTz8Pb3qwbCK8RJOX9Upy+CoM589SPtf1hVWOjRs3p7x9dLYrwaUy
	QX4oYlY/CGjHM7wlUJ6oaCAMGJwgoPWbhSbLIKwtHNucnNqSmve9WVYXyeLo7Nr7JmYUv6HAfN5
	fvTnvrXpnqJwSUMxM/4KT8HgSLyx7TrHFaHoj4dXW0tP1nVCe6bj6ciVyXwtY56yHxGl6IcZIqz
	phORks+U+12ADNQ6VMezQOm6Am1TpxLZphrNSTaO/p1ogV9s/gUJWGe2a/lW0p7a6aUmHzH1Dte
	5UI8TOf+hbUEFVRm5aN/BW8/brJSANQU03+WM+dhX6rmtNCEUK/jpQM4es7H9GjAnEF215SSzm5
	7g7jGxZXp0bHyxIWTm9Y999B9Tm80cvv/jFAES4gxsd2izWJ+L2VDd9m9Fw1yKVuc5Vxu+6tAKt
	LNdxlg5NURz4zZGTZpJOBxdz1lTaojxMa7miQOmA96SoW6eXbHpxhtXatjARrLr7LLz7ZHk=
X-Received: by 2002:a05:6512:b1b:b0:5bf:b7d2:c7d3 with SMTP id 2adb3069b0e04-5c170b51016mr2198984e87.39.1794739094460;
        Sun, 15 Nov 2026 02:38:14 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17135649asm2304491e87.77.2026.11.15.02.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:38:13 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v3 1/2] alpha: parse early parameters before reserving contiguous memory
Date: Sun, 15 Nov 2026 11:37:42 +0100
Message-ID: <20261115103809.1288167-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115103809.1288167-1-linmag7@gmail.com>
References: <20261115103809.1288167-1-linmag7@gmail.com>
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Post: <mailto:linux-alpha@vger.kernel.org>
List-Help: <mailto:linux-alpha+help@vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-alpha+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Run parse_early_param() in setup_arch(), after machine initialization
and before further memory reservations. This lets the subsequent CMA
reservation honor cma= before start_kernel() reaches its normal call.

Initialize jump labels first so early handlers can safely change static
keys. The later jump_label_init() call in start_kernel() is harmless.

The parser uses boot_command_line and guards against repeated calls.
This moves all early parameter handlers, not just the CMA handler.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/setup.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 9fda01b73b18..f21a7c8f5213 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -25,6 +25,7 @@
 #include <linux/cpu.h>
 #include <linux/errno.h>
 #include <linux/init.h>
+#include <linux/jump_label.h>
 #include <linux/string.h>
 #include <linux/ioport.h>
 #include <linux/panic_notifier.h>
@@ -579,6 +580,10 @@ setup_arch(char **cmdline_p)
 	if (alpha_mv.init_arch)
 		alpha_mv.init_arch();
 
+	/* Early options may change static keys and configure DMA CMA. */
+	jump_label_init();
+	parse_early_param();
+
 	/* Reserve standard resources.  */
 	reserve_std_resources();
 
-- 
2.43.0


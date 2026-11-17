Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884357;
	b=sqe4hLBXVrI5eSPJpXrJUk4TdFuF70JJZ7mL1P1lbNZOZIjYCXORuuONqPTKaQyHcUlO
	 Vqg5w3Sh2c/a5ZJ5mbiaadFBukewWe/PCwIsX6kJtuwvq5L9/yBKMaI0ZiB6juAp8cG3a
	 WfC+8DZDR8kdV94z06hACAYlPoLHvbBnROsEU+6pVKs27a7zjImpqQb/jDi7pCiFJPKND
	 mSz/KPRkBFybxAixAZ/WK+v1YFqiif4IZx94V8EhjpDLByWOkpHxfpuRsaEIjuiANC1BX
	 p4M2YRO2uwXQknO2xblpJWpl23B54bzufJp6HBWJRPUSrJoote6OIGcHtHcX/St6gRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=X8SjMxulocICOiKfYu+2cGat7NHYeq/w7Mvor/wOg5g=;
	b=Aev6KvlM2C+MBDRgUaO+sr9JkPfRlvk/qhgqjzgiskjfjL9E+TvqNbQ2JAJ2AZPUKouK
	 O8Q+QXOnG/krJLRClpbbGvLOjFHsBdJXMd3kLwVLsnNqIezThWYAJZhyov+dr3Dj48p6r
	 MlVVTd8iWYVBv2bKWC+Q1v2/4mAeZ0sNSxHTECD9DLyO2JuqjSl4GYfd2QlI5UIdKLFEb
	 2Us8WZb8MvtA37FeFkssu7LWPumN9x8dn3JkYyYgXwjH/2DgQVQXWRbk+2T7LKioJhFnz
	 5NJ4Zp98PyIjQA1kCPbTkozpg18dpBeQxsWwn9n2oq0R6tTF7bK4p0QutsXpy8Oh1wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GufmHECw;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AEF606A330
	for <linux-alpha@vger.kernel.org>; Tue, 17 Nov 2026 02:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14AEF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GufmHECw
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4efdc8c20so2226827b3.1
        for <linux-alpha@vger.kernel.org>; Mon, 16 Nov 2026 18:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884356; x=1795489156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X8SjMxulocICOiKfYu+2cGat7NHYeq/w7Mvor/wOg5g=;
        b=GufmHECwABO7UKejS9V0/k/4iN0Nfpe04t416Pjq799GhiP7h4Cak+ke9GOYKXHxuU
         +Q2d1kFnb7uw7piGNFmMPNdtdd7XU8QfTYP1Yhr0EjegxbPWMwMmayAc3TNkD1Rk13uV
         Xs6sQz1YggwRBE+NVOAppkTBRCnYckQ3sM84/44MLVceB+WcvyshHqNAPaDVCv2QI9Ou
         rLMHK87Ez/irHc97+5TL9v4CypZohb9Mr2zzDiuueZniQ9qmI9M5gfoMT3W1yzcZe+JA
         Qa2MzVe6LqdpGfyxUNpiCUzWAO6/Hf7rsWwNNECCJUsVTK7AuCOFVysomLWrGVpEut3G
         jSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884356; x=1795489156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8SjMxulocICOiKfYu+2cGat7NHYeq/w7Mvor/wOg5g=;
        b=FMP3gVWHy/6TBaQJhwCpN1EDP8KqqiNC/Kr4g3Zs9YjKPLzVSxEATGDoc7nf3MWdms
         oztuAbDq2Csm38poVirokyV8bnrxsZ4gp4bxr9RNi1vPaS1wA+igV7gvfXBiJnBSBiiI
         Ct85UYHypko2uzOlfN7EEaCUb28MU90tR4IG0Z8fa/imKoOvfCcmwe1jgHqwudGnPJjR
         WUVxQUoFqmO0o7bNhLNsQh6VvMWQncAPUZFEbUV0jPYD3xqtUeLEJ3vre07xJezzZUGg
         gizeIlduSLzRw3LPqIw8eOLQSM4nDBFveDqBpnJpZg8URa9YiBJwI7zt4W1vc+vjeViw
         rL6w==
X-Gm-Message-State: APuU4Z/7Pvhm1JOUun1zwdFkwUWQoaj3aMuxSNN1Daa1mOuwmfy1nZq2
	M7anDHbWTHSgYuqIJW6mjLXpmuoRjq3DzyReiYA94Nff8TGHNTAxAP37
X-Gm-Gg: AZFdTZcigGU5FzSHFCLhBzD87OR4BaJiZTg/Vt6TOUI73yM0ztyaCUkEbSSyMZtmCFq
	vq/9cBFdq+P/IFxJy2rf6JMJJTBR2xfFCz69Su0FVrd51unu8B7KXzEhFyZULpDo8UqqRYwTpCM
	N+OtmLKH3/3XeZ9tRzbQmH+wS0oVD09aP9A8JG6Jntg2g9qeNTLe/AU2lMBfhLH9yv/H926cKkS
	vc8D9S/TVCbQ3vZ5iVz7ARwcVEuFXaVyc/Iv1K44Xer/8Q5bpef06GUCSB+6C8jBlak3AAVkz57
	deCl1RvD85CsOeA49tZtGBiKHsIGgGtbLZBc8cv9O2B1j5RMapYbnD+XpXNCIEo2jU0vWrZ0Mgo
	z/NekkpiWcKo3esYYAxj0Sbm2etjumFPIx2ed8XjgfQi1KCsEcFQ7iXnFn3Xo0wUtSqH7krSzne
	ZUJzjR58Wm6Ykwjn0JViqwKyEe3r2JCsaQ5qWNQ3w5lxsE4x2f/0UdlEAOVoUigA3numkoBjEGi
	jtP8dQyWFkzyjPvLB32eD2VVSrCCXhONRqha/nj/QGyy9UsIfqVovKI6ojzHpouXF4JRU2EibjD
	AQATn39Uw+du0s3M8TaXW8p42lnvacTJOpIt/NjeP8JQgRgHunJnsjMnd5nkzAXQOntNaKExgzd
	YbYq/V6cIRFfrQ3iBOost/lBiH+VO9u1GU6LWYqJiN+ibkGPVn2RAxu7gi+j7bfp7WDQs9Civme
	aJk9NQMINyUaKIs+bcCg==
X-Received: by 2002:a05:690c:d8b:b0:8b4:c71b:e4f6 with SMTP id 00721157ae682-8b4c71beb96mr41119167b3.3.1794884355050;
        Mon, 16 Nov 2026 18:59:15 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec3079fbsm14326407b3.41.2026.11.16.18.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:14 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 16 Nov 2026 21:59:09 -0500
Subject: [PATCH v2 2/7] alpha: marvel: report environmental events without
 VERBOSE_MCHECK
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
Message-Id: <20261116-marvel-env-v2-2-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=hvA3Q0T5bLITKm5NNV73hsX++cwWKaI8fp/0V4p4/zI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/oj9XQ74+/CihkSieIccSG7w9892PD6MkvjTeNKi
 YOFRwQ6Oz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOYagUeMDEuz09/9+X
 pB71uTU+2kCX/L1SZucD1dOfu4QsF/BWlOFS5Ghk5no+WK+95mGB753qu6xiVYyy2bN3Mp63RmK
 es7zFUyjAA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors report temperature, fan, voltage and power supply
alarms as system event (0x680) logout frames. The frame is already
classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
header line reaches the log, which does not say which sensor or what
happened. Print the subpackets unconditionally.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/err_marvel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index 85f7a56816ce..46c521cea9a0 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -37,7 +37,6 @@ marvel_env_state(u16 state)
 static void
 marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 {
-#ifdef CONFIG_VERBOSE_MCHECK
 	struct ev7_pal_environmental_subpacket *env;
 	struct { int type; char *name; } ev_packets[] = {
 		{ EL_TYPE__PAL__ENV__AMBIENT_TEMPERATURE,
@@ -68,7 +67,6 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 		       marvel_env_state(env->state), env->cabinet,
 		       env->drawer, env->pe, env->sensor, env->state);
 	}
-#endif /* CONFIG_VERBOSE_MCHECK */
 }
 
 static int

-- 
2.56.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742206;
	b=xAIF860RqViu9xSdJuGUVSJa2lYQeh/XLj6Zyi0TqHiPX+ETA4HDyRv/NQQL5chYGwrS
	 GazogID7Xlg11snr+EKY0xPc8+pwq93hit5f4fc/Wc9GhvIFpKkBna4bEPqNuWkreeafb
	 U7Uc5fVn4bkBiv+IWhqMofo9k9KLaCdKbQZvzznsAxwFfaqjVVqjMyO77WUkOPIcdI1kp
	 7EMKSUH0b568SObUyke9qPs7cn0TS5eEnyYHWPx+mY9X6ims431DOcv1m24wl6AKj7QvW
	 ojD8/KSmuBCmq3eWrS7o/9NzT1lJ7ME54v3+/iKZN/ffwmlmXKD5Pu4L7h3XgxXo2Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h157KYlb0DfhmPmvL9jve6/wgNUq9iDvWiOY4VtMut4=;
	b=4CFQu23LLEI047xnoXd6oaYilDnjb9PVUVUDtFJI2H1jgzLPIwy7sGWFgYbJlOlz0oUT
	 ctTk35vTWfl48peoiEuma8SCTZojGf9v7xYTvebm5mN8aVBxvRWU1+b9igplbTpPTrPuj
	 WaZrJDHv2peyoIjz6m+eshYoZhGAuoHC6zvlXYSsbK5KrcVCUGZHoLdJr/3x70/ud/fC0
	 T/73Ys+rrcrQWV9Cq4UzlpvZUzQI10sjYQk/ymdzTxyoTSDfWalD9IvO3t4gqtaCFxDV3
	 xDJ/0tb0speHCvwStc6Q8uz2m3S5+wT6q8wi6IcDOkwhYfnpuw0rROHAmGdowOREKKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o6ml8yeL;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4046C6082BC9
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 21:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4046C6082BC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o6ml8yeL
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso10522166b.3
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 13:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742205; x=1794347005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h157KYlb0DfhmPmvL9jve6/wgNUq9iDvWiOY4VtMut4=;
        b=o6ml8yeLKlBikHlw5Xq1BdVtQBOQgyAPbb4WyMPMl8jr4tj9GSfj206WRpCNdI5Xc2
         0i8yTPB26UOorGMEsMpBNERdIDGlZPibrfSbUMhSGJUWlsZt2pkOiUiTmu00cVmWPYrg
         9/3R+bEq/ay9kluZakA+LOZMkxXm2Xjd87XNTe2ZYqnhL6cFex2daTr7ffWYllGFLweP
         JQRl0tj4P/IalLlgmDZAaYSgqOLzhOAOu4j/JgTCfGrIusayItTGtZuA6+4R5FmVvygw
         TeExlmLeMZ1Cx0e4VsJN3xCSzEgw/bdbK3GyNYzTc3+0itH74zhEaMHUGiks36AwbTU7
         UpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742205; x=1794347005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h157KYlb0DfhmPmvL9jve6/wgNUq9iDvWiOY4VtMut4=;
        b=rnC6aAXPq2kwF+MisCGIfITIsmWAuZoZrthndMzD6PQAbp0Vwh3n4WC8wtIkb2ba+5
         LhSZ6Uk7Zio06xa+wAIAE9SfW9hFDoryzZGIzg1abHx6IioK2UvgwcpxpRGzRWzk8YmY
         Pv+j8pCIWibPq64e2Ui+SMBqNbgULbW+TxXqbaKgCS2CXBaNsRftjyuVL57fuTjgS68A
         39shJLAYhIMrjdLzWhC9wZI8ET4jOr/2j6Heoc73ZDbjibVV26XEHYaS/iFCN1wPoRns
         9pq8Ek3vE+GTfbVwWfZj6jxcW3sh08xIYJ0O0hHOtqbKhDHeIYiOhdNTP9Bif8k6TIjq
         p6vQ==
X-Forwarded-Encrypted: i=1; AKwUvBztcEa8+QcEAoXk7/p/NkvO8K14BpPmCrYhu1PzXYGoNp4pzuNT72l1FHkfpHIj82waLyNwYn2IPIYfOg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8lmVpwge9gg54pgkHTooufoPy0upKlx7QFCwwD9TsP1pMOOBOF
	SBIrg61EY9nM7cN0LVyb0OU9hjfAo43Svg99ZgBOPhiE+XfKdKXu91vF
X-Gm-Gg: AYBFou3TdDsOepwwfFLRa2VY1bHmEHtwCElr+8ZZkah3Xluxws7J+Jn8kl7D2flUBA7
	A/dXJIx+Xq/nC2edJwavR069DqN+/gDeOfnG3O3yUqMBDTDLoxJhLLj5Gep+0qi9er/2qHj9nxC
	YosPF/r7dkOcEm1YrXAAv2hGnvmuvKPiZQpqlTIVEgHPahxGW3eX7JjCIGTAbLS2PhJ3dLmaNT1
	xofFtFrbgIZMZRD0rOkIFsCGDoSon2fP0zlfSrJJSnfeZAZmZAR/lD/KGjdBw/sgB+BkyGjxj+k
	80bp2/HwR5WxStpaRLe3swWAk8TqhoIbRAl046WDOFTffFf8zgMrJPqJ+bay31DiaI1megY5fFs
	dFSH2MYU5Ss3xcGduZvwsDPd7PdYQSKNEpaOtxTc5zYwdgAUJ7LCZAMPIb3xIlhZP2FzDNIqUyZ
	6wYdxUhNa2SA5vm481FmsdVEyNUSrZ/hCbQVwainJpMdjmxnX83GMbL5x/C7BWObDhKnSRIzxiI
	8YY/de2lrUuiBMwuQHMzj1pOl0hyieOyhXJqrTO2kRFTrBP/0wJogvgYw++m+qSaq78PiGqF2n7
	BR9k9rVSwL/WRZHjgqpdLH4Yt9ScZlNUYpZzg7JrRA6lgfVveJgQ9FID2B3ak+0VjqGT+RBA
X-Received: by 2002:a17:906:c14d:b0:c40:4f39:22e8 with SMTP id a640c23a62f3a-c4ca7acfb41mr1185122366b.44.1793742204578;
        Tue, 03 Nov 2026 13:43:24 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:23 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 11/14] alpha: use generic ptrace memory writes
Date: Tue,  3 Nov 2026 22:35:17 +0100
Message-ID: <20261103214120.1099893-12-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103214120.1099893-1-linmag7@gmail.com>
References: <20261103214120.1099893-1-linmag7@gmail.com>
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

Let ptrace_request() handle PTRACE_POKETEXT and PTRACE_POKEDATA,
removing the duplicate calls to generic_ptrace_pokedata(). Keep Alpha's
PEEK handlers for its direct-return syscall convention.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/ptrace.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
index 4f857d5cbb1410961a78e4ef36cce4561a7ea7af..18860066156ae7fe5a062095fd2641c4ed0c77de 100644
--- a/arch/alpha/kernel/ptrace.c
+++ b/arch/alpha/kernel/ptrace.c
@@ -489,12 +489,6 @@ long arch_ptrace(struct task_struct *child, long request,
 
 		force_successful_syscall_return();
 		break;
-	/* When I and D space are separate, this will have to be fixed.  */
-	case PTRACE_POKETEXT: /* write the word at location addr. */
-	case PTRACE_POKEDATA:
-		ret = generic_ptrace_pokedata(child, addr, data);
-		break;
-
 	case PTRACE_POKEUSR: /* write the specified register */
 		DBG(DBG_MEM, ("poke $%lu<-%#lx\n", addr, data));
 		ret = put_reg(child, addr, data);
-- 
2.43.0


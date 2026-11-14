Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650030;
	b=PtESNolueD1MteYo3p6kMPDIkVGxDFeB6LdPN3XOipc/aNAnPlJ3/lPBO91u1rTD65de
	 0FQgzHq0YWmgqvIvfC9U20nK5fbQZDkvmqvfELP5/ylV1iuBWiBfTSFN9J7UqFck42nG0
	 ERze7yMszCunTP9TtPTcHMuWvPK17xhnSSP8UL9uSpUVIrrtLUCcaH8AHgxwqmhBfPctU
	 SVqo38bRmoyQpdS63uoCGcfL7a/DNARDF+sfduvxpwkTCUPnnR9F/RxtCuWS/VJfe/mGw
	 Ex6yMuOOFEbax9dSDk0oMZ4OAa+srIYajjJRuFI1reyJ0mkIxaDg5WqV3+yRa4rVsag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7/8HuPceBZBfGGeVO/XXQ2vRNqNpaLoLdRBKADlJzxo=;
	b=GAK9lbnSjeM45osI+qnpz3rFbhafIbIMTkTiua6gKtpmKRDKbbmm4Kzxuj5iNJFnLpkc
	 CmiiMkDFTDeNyYPeL+z4nBiILfutIVOR3tIuBJ3UcyWLSrgP5SZWe/r8WSpgk3+aaCIaJ
	 /Atug5frDWOGQd3ympu9QkMJruz/Bl9nOqaDNEftnF0lP+g9EIzUx+ZFVZJEPzzOUz3P9
	 E79xZomB3Y+J/5EtmpBKMayDwjo17XoBTvTjZh6T9LRylQgzjnaq3AIIAtuOgA96vBsMk
	 QAhJJ+ewjJBs+2q1IB6CxAXeWZBzLVaI892QR2SQ+rjUf4cKeziUS29ugm0CMJNTgPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FA+t6d6d;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825B0606A332
	for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 09:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 825B0606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FA+t6d6d
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d473cfff6so279787666b.0
        for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 01:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794650029; x=1795254829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/8HuPceBZBfGGeVO/XXQ2vRNqNpaLoLdRBKADlJzxo=;
        b=FA+t6d6dYl6tm6Nm2Fz6b2bdeewz/D8kjzVL0gLOAQIrRCtEM+24URZfC/aF66rCIm
         PdPknUtemzUCSGRGK07OfuwXgYbBXebmzG9v3tlGvVANnOm5la7uqyf05LcKzmFka0+d
         1t1lCINYb9qGcZeyUshEtZ7OPVDIjpXElEQy8lXIedjfPJocCkztCSefZsirgcbYWEZR
         CurllVf49t3cJUJ051fn/5qxfjUG9Jj5L37rCBpQQd8UoLRszsJdprP0768yQH7k/YZx
         xoSd3T8Yh2J/9cV5wzKVUqBW27l1zzmfp3SEb0ImR3IR+cLTRyK+ZoP54SrpTXktEXM3
         s1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650029; x=1795254829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/8HuPceBZBfGGeVO/XXQ2vRNqNpaLoLdRBKADlJzxo=;
        b=HIwpU+b/qexB696ujX6DM6jj8Lmsyxiho85mY/5U720mNBVnaDtL33wLKts+LxTZXZ
         OZqOYgfljPJT0nbeYtq6z32n7LokVYg4QbtLWsQe+ZlAseVV9rBaMbFNaPxIoKEYkn8d
         a7cOvXWFeoasOQLVtEdMkrsAOOMzEad71dpfTUPFSCJm4+JRqIt8W7D9uWLwK4/B5J8o
         bwiCCQEJY75CbGVRVhFV0BFmoCIcoE68EETuV8sCPZMpSSttacQMGW+3gijCJ+GePSkZ
         jvlVrv2epWwUyQBJdzEQu8FsonXZoryUQOj0dcKthMaVLqKvKD/nzz6vQRipm2XK4G99
         I/nQ==
X-Forwarded-Encrypted: i=1; AL+hErGU3tQEITwKkHCApBEDh4L/XewSe/Bhdj+T2jpuaX0nrdkR4GjPgpzvgJ3S9NmCVT3doLGwXxroeSw+/Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9QgyaBHRxz9LQ8/cRK8L6XW3Fh6/0YMoTiqXaQ+ERdT8mIkyQE
	VtFUROYnFuc/Txdr312OoJwhuaRh06lLpGG9ZWoN0yx1gzqvCl8kQj3E
X-Gm-Gg: AYBFou3muB7Qgs+xxf45J5IMonzxE/A8+YWh0JkwF0HitOC6zTLNmuh50OfeEntRd/w
	QdevRn+mgUc2NJxpGweM+D+EglSS0Fwf3dDes0KArEj7vSG4/kyAXstJmdoPkFXVHJR2/1zdqkA
	oaT5J99rpHAc/6WcmG/HRYA+oYYpkaNO46owkjhwfLcolFGNTs4ZqvpG4DZ94MEUcjWERm6tLcT
	xlod4FE8buh1uBa7WVnKJWL6ooYGggqP1I6oLmkG/vCPgJwvIjlAWyubkyDFhc2ltCVgnXI/ouV
	sH86ncSwNAfyAHgj8svf0XNbN5pnrFhq0PeiiuFJ9ubG/RDaXr31wzmk3ZrUUSWZoSk1X3HjrSr
	HYSYQ8PFbqsrq6Tm2I+pe09vasVhO5BJuu4igQbkdHgrkqUezQmBKrCqZbajVPQ4Zp/VGRx1Y4r
	zL6MunQxWMnuqPOLtl2YbpySVLRJMD54TTt3KPPRRX+/faS/3JufrINt33tBLcmQEHrGnt5YJ0u
	zwOqEwUbEko9ZHMlyXrf8DqhCA+6IaMMIuRb726Khws0Gq1WTHpebOcedhfwrSvRcHuMnJYFjNl
	r4OsBkJWjWOW+POPLSyWvxfKXBRVpkU69z9I4a3Z4g5/wzf9iOnS++E1A5YJnPhC2wPVkWE=
X-Received: by 2002:a17:907:a892:b0:c46:cc9e:a143 with SMTP id a640c23a62f3a-c509637d486mr421299066b.26.1794650028869;
        Sat, 14 Nov 2026 01:53:48 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b236d4sm197311266b.18.2026.11.14.01.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:53:48 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v2 1/2] alpha: parse early parameters before reserving contiguous memory
Date: Sat, 14 Nov 2026 10:53:16 +0100
Message-ID: <20261114095335.1283016-2-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114095335.1283016-1-linmag7@gmail.com>
References: <20261114095335.1283016-1-linmag7@gmail.com>
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

The parser uses boot_command_line and guards against repeated calls.
This moves all early parameter handlers, not just the CMA handler.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 9fda01b73b18..c7b7ebcc47b6 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -579,6 +579,9 @@ setup_arch(char **cmdline_p)
 	if (alpha_mv.init_arch)
 		alpha_mv.init_arch();
 
+	/* Parse early options before reserving memory for DMA CMA. */
+	parse_early_param();
+
 	/* Reserve standard resources.  */
 	reserve_std_resources();
 
-- 
2.43.0


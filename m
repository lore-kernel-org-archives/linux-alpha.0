Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792822326;
	b=sfH1JVUgreDCpRZhl9hZdBbEwsxNPlgb7WbgqgNzxxbLTjJzAz/XYXszndfTWxvC/y0f
	 WpCVaF3tSBkGaUtePeTbfAO8LFufVP0T/eXaQ93y9US3j+VbUd8pcirJAVTIhKwMRq8m5
	 ccr9NLVXeVoMTsUvkqS7Rdi990l1CaJP/OQfJcJ+kAxmLj7XFwgJajg1ZhQ5/jQceAKvA
	 LupUguQjdHFKxCa9TlgdpgabOoKgKuFUa0MyshIcYyDjSfixDpJGyfjm01J4eJsHrucs6
	 x2B9aaitapmIOJHS7VpYFGqrycZLW8+en66SJTiLFnOGgszaweOyKraAfJWUDQmwvqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792822326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Ouw5OaH9gRiOHGrgEO3yzOJhHXoQ3OvGoXVUHnor6h8=;
	b=bl+hoHyWHRaLxYlWv1fU8JY5+f1mz2DXIwpPMLIZtyuNREjXn5oe0pjNR/i12yJuGnoQ
	 fOJ7VIQuYvCcOBqVPqSrLpVMcYF36ZIUN3sd7XoTknuBFO/iAVbgG+/2KVmf8I3Si8Hzq
	 8qg4NKdgJ+92zAbgJ2xw4ATkFpEhK08z0XCSXnkNUlUMmZ8CH0eT0tBt6G6hrPpq4YO8p
	 iGbzcpeTTRBFmyZ0laH8YoSB5fl3jf3Ed24qD6ZTzGVi0oOr+sibk4+oPMxf9LFlWgWFa
	 bNaPtcmT+4glFWRiht8ohoxOkUf7H+udIvMA9wTD2+utvxDAYHiZTvD50C4VTCT0mjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=euWFjswy;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF60606A31A
	for <linux-alpha@vger.kernel.org>; Sat, 24 Oct 2026 06:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EF60606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=euWFjswy
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e987a2ba0cso9908795ad.3
        for <linux-alpha@vger.kernel.org>; Fri, 23 Oct 2026 23:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792822325; x=1793427125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ouw5OaH9gRiOHGrgEO3yzOJhHXoQ3OvGoXVUHnor6h8=;
        b=euWFjswyIBcnIxFsX9rCzrIU/H1/MSIa2OiEIxuuCrjbn9E99ohfZYiMq4rSPQdmOT
         imoj/JHinfOCS2+ZZVqngzJ5kPY3xv611A3YDq0UO7UYFOJuMAjoQC02odO7j7t4oswe
         TONaRK49qLNi55dHufnk8b0virTGEeQJ7lGFTgOAgGYsNZO1HTAXeL7pC3FzMFZNgTz1
         iI4F9pB1vj63NZNsjykV2nQcwRu9dj+tn+t+lc4M3F5b9lYt1lVXdM7P850UhGMTgU1/
         URf2YZLiKo4S807XfTVXdtDE5kUfj4ngXf/GgoQeunAKcJWYyWuh+dRQFEtJ0Zi+ApbV
         tW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792822325; x=1793427125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ouw5OaH9gRiOHGrgEO3yzOJhHXoQ3OvGoXVUHnor6h8=;
        b=vavW4s/8ubNkb34hxByI1OGuiIx5S3z/ydpNuNUC11sWmCgZ/cq+wsh2vUDVzRpVSX
         L0oLj+/K5MEsAMH4edanyG7kOwvBahCisr+ubw2fxt4b4JC4vtEC6XLUI8PI7R+S7QWR
         XwpJT9poLoSV6CoWttVIhJMgZYLU0zuVen1F+t4iISw2b9uhcSwx2xxWrn81mcwT7yhW
         mA9GBxbDLLEpK2/mjdmMXm+V0sMlb5d1qryemBMI/H0jxbU0m/7UlI4qPsl+LHZvmuIx
         qbXfwdmvTVIIAxgeKTn6RFJ2AeaMe7WreO6N2X50ITZLdmAmpeX/hDq18ImPokaq0T6p
         Zhpg==
X-Gm-Message-State: AFq9FYLoyM5qqhKltyInwQfcf1xPv1pXj3zCyDj5ycHwW7wVShmgSMrL
	bpYxgs1IrttqE4lkj2+/rAauH1KH/cUeOC9Shho/80MOYLiDbZM4l1An
X-Gm-Gg: AYBFou0EofdjnThrALt7HZH1OL+nxwRFPTclql/m+uE6oCCDAu1jsTM0de4pnaVmmsC
	n+6YDTnuaAamn+H5N5Ke1IRF4Z8JZKr2Loof7lrTN8IHOMy1O8CiT+kTWUCEsyHCyf7pT5NIJaJ
	7322t5PNc9HCwf4ARmKLexhiNywQ7sD3p+qjWLtcfb4FX8BWEpxmYfUlonCTtnb5yCYH9AKlvau
	z3xk4AiKJs/0iHmlnFgXKa1pjyI5PBrZtimc1zGU2TG5FgZZ3APIN+ovujTRwyd+ZDCcOXmzwVR
	1JYmABrT9tCUka0HYSV8xEi6f/N2ZmT8c2hqvBHNHFzJvZE6Hwn9L/8T6RlBwoMiN2YW1deVhi7
	coyUPB89awOF/7zWVDGbSljtfXfD+E5T559cf6rAEvBoJcEoLrVfUvIraRa1dchIRmctMOJwx0Q
	Us6FavUm4lKLlpRpiRoKzXt4zyHFWLU6I3UTKJCykd2/kTMPc59z1gZ4zbpWeTFaAnShNwEPqEm
	9Igt2JS0BEH2LEhDLokmP41EfkBq43+34ZKwn1doAVBVWItRzW2mLMiNH4+zkVX3ihQlc5QhjJG
	7vYKUlL5BstwfY5KQKiPsVP/d7dFJ/1KYREX7/FAgmYZXLPAgJod5pPWgp1mk3bjEb6JHkll23C
	iRtEIdzyPuReGbq+MvbDpH6q8CLSUIJnCBXAZdNqptTkTQA==
X-Received: by 2002:a17:903:2f88:b0:2e9:4243:431d with SMTP id d9443c01a7336-2ea9c87dd9emr9133875ad.30.1792822324813;
        Fri, 23 Oct 2026 23:12:04 -0700 (PDT)
Received: from LAPTOP-VN8JNK11 ([111.223.27.68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9af332c3sm3153665ad.3.2026.10.23.23.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:12:04 -0700 (PDT)
From: Ankit Thakur <codeankit.thakur@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ankit Thakur <codeankit.thakur@gmail.com>
Subject: [PATCH 1/2] alpha: boot: fix typos in bootpz.c
Date: Sat, 24 Oct 2026 11:41:55 +0530
Message-ID: <20261024061156.1742-1-codeankit.thakur@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
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

Fix the misspelled macro name V_INTRD_END and the word INTRD in a comment.

Signed-off-by: Ankit Thakur <codeankit.thakur@gmail.com>
---
 arch/alpha/boot/bootpz.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index c6079308e..d53801108 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -202,7 +202,7 @@ extern char _end;
 	ZERO_PGE	KSEG address of page full of zeroes, but 
 			upon entry to kernel, it can be expected
 			to hold the parameter list and possible
-			INTRD information.
+			INITRD information.
 
    These are used in the local defines below.
 */
@@ -228,7 +228,7 @@ extern char _end;
 */
 #define V_DATA_START		KERNEL_ORIGIN
 #define V_INITRD_START		(KERNEL_ORIGIN + KERNEL_Z_SIZE)
-#define V_INTRD_END		(V_INITRD_START + REAL_INITRD_SIZE)
+#define V_INITRD_END		(V_INITRD_START + REAL_INITRD_SIZE)
 #define V_DATA_END	 	V_BOOT_IMAGE_END
 
 /* KSEG addresses for the uncompressed kernel.
-- 
2.55.0.windows.3


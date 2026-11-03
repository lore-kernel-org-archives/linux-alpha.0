Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742207;
	b=FL2jzyGhSKXg9jJ0UY7Wvr3+VxuHDXkNIozYmp1NAsx/ya+5M+S40wJ6oJqb8XMCBxVr
	 cB9XM7WUpvr6unV97FQLuJobkTySDJZHyVLYUv222t0d0eENRxsLYSEEiLvSwCwm0W4hR
	 dJmXwmLhbYHu9fk1nlryUxX8yxuRXLrKUz/LqxnD0acIpcdsC0KxN5q6adMmn669L+/1P
	 uYeQBc7RGS16BwrfFFgz27P9+yyzifRjPhU7aAasJvjzTYCP9ZOO8l9paGG90Fya4lekV
	 3aLTX1fzdxAwBqezxzj7gvRWMD3qwM5MBawK7GhrBnhLLRM+q8XkBZwNaeu+bbQqRhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vUI4WubnJa1B4/84lLFCEDflaxOrnHrdNhUumLhC5ng=;
	b=Q4291kBJsgEPhXvZWOI9Q6od4LccxHlJW3RVBmLP8nKKlaujQvr88J44ACfU0d7J0Ktd
	 Y2OkPNh1F08POV933D4cTxHGu9gkUBOlfqZj0IMBNpLbujpqyDHnCZVOW74SL98WrhMVQ
	 xfUuK4nCoDJGoN9oV8ZzHOSvsgBHkbbo99peM5vrJzMOlIHJYiAEH1vbBNBl0/31wJUUI
	 skBq0XQZx7bK5r6osSxM7wjOHhEe0Wh0WXCPq/9JI1oYzvISbCpj8JRNGvfOSbxHN6o35
	 YPTGwOzpe4Pr27TLk7nlCUxD5XF91ByPXsEVf+/XwILH5UxyS0Iri/8UgICOg3ia+tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YH4TeVD9;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3B26082BD4
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 21:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A3B26082BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YH4TeVD9
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b45f9ec1ceso5211528a12.2
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 13:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742205; x=1794347005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUI4WubnJa1B4/84lLFCEDflaxOrnHrdNhUumLhC5ng=;
        b=YH4TeVD9yklISDTSf/HTYUcoOVemwE33ZyBdtAsgHES+ReJVpl6S+Y1QWO4ACCA83E
         yhmcBNYOrCtYpQMXp6cPt36Is6eGQSA97okm8OnZ9rzPpzNqPI6Ri/eSEXTBQtgbF56K
         L00lBGXRkDu1kXtrC8V52aB7nl4NGSMe/ECFcGJBLUqj3P0zOHgoX15nSeLjIj6MH26s
         i7sQP2zZbRhhvRRaEyooqgM0/v+UTFhEdBVM3+OyI5cNd2RLexEj/bT/4qvfQp6jdaV4
         /yCwFLvGOlqaVmaoK0k8qt2QUHUOB8JW55TzL/4RjdmO4E/wTVqNYjAd25XZ3VTuU0ps
         R27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742205; x=1794347005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vUI4WubnJa1B4/84lLFCEDflaxOrnHrdNhUumLhC5ng=;
        b=PSJzjgj5mONVUC28/rEr8MUmlHkkl0RGnJKcQxLgS+NmEpz/qMQoGYGF7Wl/JK9AKA
         UpvG68GP+QyoJy9vq+AAJbZiJQTTd2IckaP5tcg4CSlqoOzPcI8zR5TQlGSLS+9/37kK
         r4fOUePJXKmVyjw3P1PykIv8HdVbO6GlOu0a4f5OSBgmtr+8rtDosLWWD/kKAG+uBXNk
         yZg5DM8FjRA8HdD6805bFKcZwEo4glYqBB0sXPo4Jo0aKTWhouZB6I6rDE4iKZqv5ZUs
         KXlGyLn/Mm46f0ZrMIyFeMzSwB3UiZbqgk5N/vRi/Mnq46vkJWKXdzD8vXA+8AduJAUd
         WkWw==
X-Forwarded-Encrypted: i=1; AKwUvBwvzdusogHmt12K+40DbI95jFDXlMY/RBv44Ib99J54B+ohvPEeWrFUwW+AEO4dHpUngqtpftLqWYg3dg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sii6kWU3T2u161QVwsyseJaNybE+NUM6hU9Bjsc0PvPZucpsQ
	OBMOT+HrkD5pLcshBx/bqsMtgvDYesW1MbmCQCLWVqNkUm9dX9MiArzJ
X-Gm-Gg: AYBFou09mHd0IVar/C5RU/Oq1WSJHolu1T/2DcGT7S+4I3bF1pDB69wQXfBSF6MBdgt
	doL/WmjI6Nf00aiBEnbP0TVwWI/t+Iktx/5Yc/pFn8Y5dX29ISbo+9vYaQ+8xLjsHUf7pbMV7Dx
	xl4EFJpHeMwFd2WoqibWJIL+NkC/n8/3SgGKlnaoNM3YSuy5+5pWW5YACifNveTP3MDV5dhM5+e
	f/jq/DO/VYMI8DfilaVlWLoEtRc0gGKEZRj8HAnCxMHSct7LDpJhgU5rJInUqRT0VRILEyBOTTX
	XU7csZqZKWS00XK8BZsxQNvssLLj4ZP88IofZFjyzGuVbH+vQ36aaMIZ9reK5X3ZwMU8AR0w4bC
	u1KJqUb2wugK8YXlJVGMTWLlM6U+lwiiDjkeqMETwlXsqx2jEic8R6EBzGqEuh7YnLklJH/8RyP
	e4TVmtObhBiQByq92/R7FZCv6HAeMlbpdIw8rIPog8jbnrmWBNQXLoL3tC7PprOEOkDmdysmcQL
	HQXNEd2z+bJd2HLoms9B5ZOylArL0ssCA8sFqSltKiVCfg6oxAKAE/b15CmHOw/Q/eDC556rlvd
	BaBmMdNzxuJDlh5gJ3cGahMwO4cS2XNG5fmsUo4lnR3e4a4UOKXA63Nja+P/BBsKGJEpPA4=
X-Received: by 2002:aa7:d901:0:b0:6b3:8456:e891 with SMTP id 4fb4d7f45d1cf-6b4d339252cmr8103106a12.6.1793742205577;
        Tue, 03 Nov 2026 13:43:25 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:25 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH 12/14] alpha: use memparse for memory size options
Date: Tue,  3 Nov 2026 22:35:18 +0100
Message-ID: <20261103214120.1099893-13-linmag7@gmail.com>
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

Replace the private parser for mem= and gartsize= with memparse(),
preserving page rounding. This also accepts T/P/E suffixes and uses
memparse()'s saturating overflow handling.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/kernel/setup.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 4cbcfb1852d51e7aaf37b01a176f4a4280af6dae..28387786cb9f9ad4b587a22a3b0267b825b424c7 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -241,26 +241,6 @@ reserve_std_resources(void)
 	for ((_cluster) = (memdesc)->cluster, (i) = 0;		\
 	     (i) < (memdesc)->numclusters; (i)++, (_cluster)++)
 
-static unsigned long __init
-get_mem_size_limit(char *s)
-{
-        unsigned long end = 0;
-        char *from = s;
-
-        end = simple_strtoul(from, &from, 0);
-        if ( *from == 'K' || *from == 'k' ) {
-                end = end << 10;
-                from++;
-        } else if ( *from == 'M' || *from == 'm' ) {
-                end = end << 20;
-                from++;
-        } else if ( *from == 'G' || *from == 'g' ) {
-                end = end << 30;
-                from++;
-        }
-        return end >> PAGE_SHIFT; /* Return the PFN of the limit. */
-}
-
 #ifdef CONFIG_BLK_DEV_INITRD
 void * __init
 move_initrd(unsigned long mem_limit)
@@ -486,7 +466,7 @@ setup_arch(char **cmdline_p)
 			continue;
 		}
 		if (strncmp(p, "mem=", 4) == 0) {
-			mem_size_limit = get_mem_size_limit(p+4);
+			mem_size_limit = memparse(p + 4, NULL) >> PAGE_SHIFT;
 			continue;
 		}
 		if (strncmp(p, "srmcons", 7) == 0) {
@@ -499,7 +479,7 @@ setup_arch(char **cmdline_p)
 		}
 		if (strncmp(p, "gartsize=", 9) == 0) {
 			alpha_agpgart_size =
-				get_mem_size_limit(p+9) << PAGE_SHIFT;
+				memparse(p + 9, NULL) & PAGE_MASK;
 			continue;
 		}
 #ifdef CONFIG_VERBOSE_MCHECK
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792914183;
	b=T3EawVMFa0lyHHHrgfBjqnIirobQwS82WFi2erXVs0NjXwDY86gz0/TnRhLYPAdWAQIz
	 Hzlx7yS21c/0qvkuIyaM1EZeI8N6hVYvJ1IKdelKFOaxzLPsEuwobtYnmogQXGN95qeR5
	 JHXM/8QBKzHvWuLyPSDXDLpEmX1O7a8dAvofW2m9Gal+QfDiropHQfs2RepJsNa6RBfvG
	 uksl+Hx8UVOLr1qfGonbrHQ9fES21O8gfMZ8ssPKQCzna5tKnpJnQuXrY09F5iL4byYrL
	 nJnl5utdd4lIDk4dJaQhSAzYv/oEbZOw4BbIZufTAwVo0Rh1QokLmGxfTiCxSQJg6Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792914183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pXIk2WIkNT0windvDKCB/LIGkYLCIcpQCNUp9JyU/UQ=;
	b=IzylIsY1gHefhndQp9HEQwd8BxiFYDCj76PRvJGxvcMVlN+DNus9Bjw3aPe55z279puF
	 2q0TNMh429bsiYGpko5uGkkvMIwM9OY28+OMSdvDkYASJiTC7YV78aRvwwxs/16K8uldU
	 1ai+foz71y1ITLPOJjMdH7k+t+HvvxxML/3PJr16oq0xSubEiqqmei+OER80L86MWRQBJ
	 dY6WftHvi0LExvdtnkO2VddfAQyrtLCt6CFsLpSTgKGgEwgAVqglXMLzPp+ZeoBSxQNyj
	 8jYwdeTS6h9yjeQQKh+NZYQKu2yLxuUiEzx4Pa4LqScz88hyFII5NagxdKb2pTsXTFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Mkq6F7kl;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB43D606A31B
	for <linux-alpha@vger.kernel.org>; Sun, 25 Oct 2026 07:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB43D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Mkq6F7kl
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso2879798a12.2
        for <linux-alpha@vger.kernel.org>; Sun, 25 Oct 2026 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792914181; x=1793518981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pXIk2WIkNT0windvDKCB/LIGkYLCIcpQCNUp9JyU/UQ=;
        b=Mkq6F7klgtQfZ2EUk8cTUBVFuIjtnimu4n5peoDhTY+pTQyjfEi/s9/FkgVRm4BTkU
         8FImKRGOwF4N1HmLT3ahOJWvohTcW+zsmh5HqwcWicz5/CCi1pp+raP6tU6ZJxxsX4lH
         t473RMo8ny78KTMRYO/dSGG+nxsY84hkeByJGVTs7E23hOebyYRdKWcegdftJHKenvPj
         dhNaCXGsYWW4U02zfiSBMZW4jEB12chN17+D+LjCdXjWdb4cWmgfOqzDn+l1KU6jPzdc
         7EieBj1yugZ1KNxWggQCE+HbpIkkrGblG2YyjvFxmlrKXFzWyOO5B9bdiWum0SjkfuFc
         SfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792914181; x=1793518981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pXIk2WIkNT0windvDKCB/LIGkYLCIcpQCNUp9JyU/UQ=;
        b=I7i+qTLlKY/Nq3hAv7sRyjyZ60gTm84SeKpvXkA/PG6ALIZE/sKfBayzisxMEGlLc6
         KO6U+8Xo49L3c1dcnfvyh7DYcArwawCUFcqs8cUViByup+lXLzNmE1HbbPz6cY7zEBhw
         Z9IKxY3jEFH7ocQ4Cfkt/zQNq/s6PW4nexD2D7JgmCxC9N0ndj2YRt1ZG43mtUPbTMOu
         iu0HN/yqNKZCOQLK1qUBndK/hu4KuGmwpgEzB/ok///vHDij7ETEL09VYLeJkAjoR/d0
         P5y9WXfkUfEwvHoTL2I70WiyRvEeffvnearY9nhWBWd16JLl1NiqeV9DqMR/RdpZi0Ec
         97NQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsPyrPGriTj8+mgfOMUtgXY4QHU2dqHmeGZDHFOfXOtwcQWOtwsFThV7kux+Fe07/pzrV2b7REmxkWxw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLatBi7EtmKgziCTfUJGn0pZqvHYYuydjRCSI5kwjHzRWBqstAE
	+kULSf/U/jxKrrejZz7hrrEKIC5D4/BKW81g/fxwT1gBJB+Q8O3xGcqZ
X-Gm-Gg: AYBFou27WNQUeyVPXTY+2Bbml3Nb8ZC0jOL5j/TReaeT+RJfqvqwbNV72xGZd+Y4/Cg
	pUhM9OK4UNwm0CnmoJ1bUzUkSr6bYowL5HoFI+ezep0gcLxHnFiOlUp4yoxNx+rd2kAbg0iw/Ve
	EPS2TrOlQjzMlualnKYu6QjYWtyY2SrBynSt/iU74dGNTZZ1m6I5LGG6LiZQ0gsukaD83FJgZjh
	jxFOlTbqOfiMuDbzr2NahuAFOqIKGgnYxXYJUzScD2IHLEyBQBImc51AvBzr2s/2ZvP/oVEQ4mt
	Ytqz1G/IPXEKABwO4VdPfJW97vhe6Q/ctS0Ri+7/E4jzIUxP7QVj7uojHYQhyhbj9ft3XNlmSDT
	4GIBeTB+W7XOt6crqKuuCMJ0PSS+Cb32La4BsnysBLPGbZ95l2eADzBX6V0U32W9GtItetCCqy3
	t2r5nfI1AHxIIuP3P3eaKuj/M37f92L+7wTROTwF9pbwgbrWD3xmiDPHRAOw9lZz8+Rh3Ov7sMJ
	gv3KmSEopDVQgyEO1N317tsqHAnUWD7FeAqnXoWy52NMRoJls/r+u0DXkuQ1athNxoVBgkkroeP
	jijiRb4c4qkdmA6oQxserw==
X-Received: by 2002:a05:6402:14c8:b0:6b4:21c1:21a9 with SMTP id 4fb4d7f45d1cf-6b442ff31demr2690071a12.31.1792914180977;
        Sun, 25 Oct 2026 00:43:00 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445990d9bsm2033641a12.30.2026.10.25.00.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 00:43:00 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH] alpha: fix PR_GET_UNALIGN flag mask
Date: Sun, 25 Oct 2026 08:38:50 +0100
Message-ID: <20261025074237.1050419-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
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

GET_UNALIGN_CTL clears the flags it needs to read, so PR_GET_UNALIGN
always returns zero. Keep the UAC bits when translating them to prctl
flags.

This was uncovered while running the strace test suite on Alpha.

Fixes: 3185bd261882 ("alpha: separate thread-synchronous flags")
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
Tested on UP2000+ (SMP). A standalone regression probe verifies flag
round-trips, EFAULT handling and fork isolation. The probe and unchanged
strace prctl-unalign test fail before the fix and pass afterwards.

 arch/alpha/include/asm/thread_info.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/thread_info.h b/arch/alpha/include/asm/thread_info.h
index d781ac79106d..22c07ce0a77a 100644
--- a/arch/alpha/include/asm/thread_info.h
+++ b/arch/alpha/include/asm/thread_info.h
@@ -110,7 +110,7 @@ register unsigned long *current_stack_pointer __asm__ ("$30");
 	0; })
 
 #define GET_UNALIGN_CTL(task,value)	({				\
-	__u32 status = task_thread_info(task)->status & ~UAC_BITMASK;	\
+	__u32 status = task_thread_info(task)->status & UAC_BITMASK;	\
 	__u32 res = 0;							\
 	if (status & TS_UAC_NOPRINT)					\
 		res |= PR_UNALIGN_NOPRINT;				\

base-commit: 71cf9644bcb35e686c3e12a703325335a0925946
-- 
2.43.0


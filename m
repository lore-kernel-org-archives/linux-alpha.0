Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBA641687A
	for <linux-alpha@vger.kernel.org>; Mon,  3 Aug 2026 17:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776929; cv=none; b=p0QqIVZET5+PRnB6UBatdwNLsV8fwRX80LHblSpfB6fHwIJ+WKVyD9dPC+AiTPHyosrYYxc/OhTWhE+rYKiGHqhT+m16FwZ0xMSLoIeGdkx70B8yj36J8U4tGVVt0E8wrfwTZ3kNcdoTrqHNbF4osB8p5RaUPh83jczJTSCxOrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776929; c=relaxed/simple;
	bh=Qrbmd/gCZNU62r1uQY3MotPz1q+A9zHKQVoWcbXVOqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XY5d1U9KHONZz0+mMSiTTu1UTlHzgNsIE5NuXppdyV3h4ADutkR7MSivtaGp5v65pnzx+n+TfLrFUH+YvQMWOGHqAOKMexGhHHFfsGzIqb7Hp79EE+oPXs7wQqoT2ecEeazxSHb5GfFFkRSaxmTQviMlUqEilw6YbjasPt6WHyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gw+DCwTA; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gw+DCwTA"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81ec29f1d07so44525227b3.1
        for <linux-alpha@vger.kernel.org>; Mon, 03 Aug 2026 10:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785776926; x=1786381726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJzW7hnofVRsOBFScVAMkX7aHP57H8tmiAZvV6aeuF0=;
        b=gw+DCwTA4CrfSN0t7YePWrnv45/QwK+Yhe6YjF1Bs9BoqoJUiOIgW5P0oriJC1zJHv
         iAqms+hXRaQKoKjDuO41hoEf1CIF7NjKXS4FyEY1RZsBF8PTDI24ee1b8PczEnnUcSov
         LiuMk7O4UnE4W/LgLbJNvV9Wlr4rYn1bTd2aS9YEAs6/AOR6USW4nK3cSKZL/CHc2i0F
         90FP72F8Yjq72YXHFGwcHJJgBl9suC9eOQXbJ8/69tfWsrHkCxUShd2D2zxqFOB/1cCj
         xJHIVZHQ4jATPD3RAGaHMXRTehGhITcDfUKyJyOg7QyXRfprhlo89L2dhLjqvExFBFgC
         4Bcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785776926; x=1786381726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJzW7hnofVRsOBFScVAMkX7aHP57H8tmiAZvV6aeuF0=;
        b=BFFY9+kZ020hdUOJZQsajBX98Zcr1iLYwLExuvjGZY5ZJ9CJBgNb92Iwa3ghBrkjLN
         o1OD8D4lGFwznbB4hx7VxoyMVYxs+TXCcu5/BUanWSQ3Su//TGEG90yBs4krBkOGVQ4I
         0sDvhtZ6uYY4DBpQZIfwy3kCrFcl8hBthHtgxpjmK9K4y47hu/BHvewwN2dl37ZSnK6X
         FT5+oYI2YA7mIgJabekg9i5Aaz5QpZrgEGAVOUVNm8cxLKfpMpX+ARIP9RNqt5oy+ivh
         XVspRQSKpjDywLUjlBPcRVqmTkS/R1Bh0JBfDT7QxMG0AN2d0OKBa9xKMab7VFMtItll
         zCsw==
X-Gm-Message-State: AOJu0YxtqlFjBUeNmf+mveinC7v8W2nRvo0AxORoG06rkuuuLPH0c0TO
	FyXdbT9N012vfogygMrfq9Gvpub5uTOCsM1Y9drfNca2YOvrzumN+qP7
X-Gm-Gg: AR+sD10alaBofGayz6cbBvzpizRTE4VjaRlzZOX5h6EQJAknB9ft0ERQKX2E60YAwrO
	pmS+0XGuILeEbn60McQb4J8r4B0DzgDKa3SAcLulh/B9b7J9yjQtXgLytU5xjvzOYQ18dbQ1QZj
	T8zdaF6/eIwZSjjVjn907ab6iPj5PgUjmAinFZSLDaifMvmRcvYbhol8iWkBr0jXa6VQe5qvTrj
	zhuzTqcpgWSmz8/6dVBsFpS27VT34PE1Hz7h6GIfgRe+XUFQFNGgTjd8cyiXQmdkmEX9rqR683o
	1BtDRUzdc1a0eKXywEDS7o5aQEuXQFrSRYGDQX/jtaiEd0Bi5f+UayGgT5LI6aqsAP941bf+iQ0
	pSwyqIda5kAKWlI4baOdx0MLabvaxi6Z3G7gaVXvTGcpSkvI6VbE1PnpZUe+DijTHP5bNJSQfte
	nfygA1TOelLfxzG9o7DFvhLkbvx0DPMnFJJ7wJVa7SZsu5HFcHVfdzLJeSYnuc
X-Received: by 2002:a05:690c:6081:b0:81f:2403:9e70 with SMTP id 00721157ae682-81fd4b4af48mr139827077b3.19.1785776925809;
        Mon, 03 Aug 2026 10:08:45 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2cae7sm58991847b3.2.2026.08.03.10.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:08:44 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 03 Aug 2026 13:08:41 -0400
Subject: [PATCH 1/2] alpha: enable building with clang
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-alpha-clang-v1-1-1c4ba5ba7a64@gmail.com>
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
In-Reply-To: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=Qrbmd/gCZNU62r1uQY3MotPz1q+A9zHKQVoWcbXVOqI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIKTkuu6PPRZIy51x96/X9GXXfd2znlU/aZKLQkChXzc
 B9zzFrY8ZGFQYyLYaaYIkvcekWWWW07lvqclv4FM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 Ahk6RvEQOT0Gjczi4tLUIt20giKHvPySxJLM/LxivfyC1LyC9AK9tMy0koyM/KLiVKARenmpJaa
 ujm5GhgYmlo4WZk4WjqYmzs5Ohk5ujo7Ork5GluYmBs6WjiauluYMXJwCMNfYr2Jk+C8svOPN2t
 7wRraza+7dM7J6Wb2/wvS0r3jnnVU7QiIa1zMyzNsQlhUdOkU04/SaLevnVV10vuDx/+uGPy77d
 3kbdfFs5wIA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Register the clang target triple for alpha, and pass -Wa,-mev6 only when
building with gcc.  That flag exists to stop gas emulating instructions
the assembler thinks the target lacks; it is a gas-only option, and
clang's integrated assembler does not emulate instructions in the first
place, so nothing is needed there.

With this, LLVM=1 (and LLVM_IAS=1) builds work.  Note that the alpha
backend is not in upstream LLVM yet; it lives in

  https://github.com/alphalinux-org/llvm-project

and is a work in progress.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Makefile    | 8 +++++++-
 scripts/Makefile.clang | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
index 35445ff2e489..54283705911f 100644
--- a/arch/alpha/Makefile
+++ b/arch/alpha/Makefile
@@ -27,10 +27,16 @@ cpuflags-$(CONFIG_ALPHA_GENERIC)	:= -mcpu=ev56 -mtune=ev6
 cflags-y				+= $(cpuflags-y)
 
 
+KBUILD_CFLAGS += $(cflags-y)
+
 # For TSUNAMI, we must have the assembler not emulate our instructions.
 # The same is true for IRONGATE, POLARIS, PYXIS.
 # BWX is most important, but we don't really want any emulation ever.
-KBUILD_CFLAGS += $(cflags-y) -Wa,-mev6
+# Only gas emulates instructions the target does not implement, and only gas
+# understands -mev6; clang's integrated assembler never emulates.
+ifdef CONFIG_CC_IS_GCC
+KBUILD_CFLAGS += -Wa,-mev6
+endif
 
 libs-y				+= arch/alpha/lib/
 
diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index b67636b28c35..2434cf90ad7e 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -1,6 +1,7 @@
 # Individual arch/{arch}/Makefiles should use -EL/-EB to set intended
 # endianness and -m32/-m64 to set word size based on Kconfigs instead of
 # relying on the target triple.
+CLANG_TARGET_FLAGS_alpha	:= alpha-linux-gnu
 CLANG_TARGET_FLAGS_arm		:= arm-linux-gnueabi
 CLANG_TARGET_FLAGS_arm64	:= aarch64-linux-gnu
 CLANG_TARGET_FLAGS_hexagon	:= hexagon-linux-musl

-- 
2.54.0


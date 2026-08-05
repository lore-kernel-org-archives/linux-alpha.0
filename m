Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001EC3D9531
	for <linux-alpha@vger.kernel.org>; Wed,  5 Aug 2026 18:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956164; cv=none; b=NMXaa3RcXDb4AtWgnQux5NhrFnmlEvMCIDu5uhIVqi5H5MpCA6N6R+3vD8boZsowncq9mCd7uTkb3AXWKghOOnhCcIrKi8BWnpl/dRtppwGqJ/cfcVe32QARQm3tlvxJnElMVa/BM5ZCPZV5i4bMazhZgCAW7OwgHkJSGiaM7Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956164; c=relaxed/simple;
	bh=X/sheB2HerNRDwMRSjJhuRwSfkYyfYB880Mu9Bm0zM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NtZcx5/pI/l/HMX5/RAdCFeCNvuW1phT3Q/XG9SL5RdWbCh4xX+QfLMPIjgMuhWSCMjVQHrxet71pGXs6ZHV5BBrRY/BE9jWaVzX6IzMI6B5BOXdusD/qCDntnmNW2jZZysF2Pa1S1tpi78hJF4tnbkbRpwSWxSzrn3yKvemj5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPmT/+uL; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPmT/+uL"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-80814edb536so22014767b3.2
        for <linux-alpha@vger.kernel.org>; Wed, 05 Aug 2026 11:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785956160; x=1786560960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGeYBl1VUIwt/G4nfmKLTgCtjzdo27V8KoUvBJpzzDw=;
        b=cPmT/+uLpce8SKENudlRxESni5y8tchI2GJAosBoI7UNsrQMWVUhdh9jGiw2DZSV3H
         bp7Eh1iJAmwk4s9U3Qby6oTesb588lrHrS7I5t4S7vlckBf7S/TPaiqgACP2vThFKX7I
         xIfP1M5Wzw7/8SQOq3v+tFtzbC/IA6Lol1iUilBa97PVQtznFFVu/1Ssy9UF8JOQD4ob
         POu3Wb+N0sO+szx9u+5tXoLKOMb/X+pJYE6Ejplh+vSI267sq51g8pNlDwt7KjQyXfuT
         8QLyGCDhEgbEK7vk/h1WA897qVGW04btQT9Vf7QbbrdcMhebtUplbdWrnlgUnhCet5Xm
         S8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956160; x=1786560960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGeYBl1VUIwt/G4nfmKLTgCtjzdo27V8KoUvBJpzzDw=;
        b=XLVKdUNKJPh+gQ7YIH188b9t1ut6xzlwu3dID3kiXx0dF8bXd5iXI7BK2aOXpUF3u8
         8AZzen/NlhIUzrhK+Sg7DpsdcfV4haPhOBUhwDIQi2No4LK9HqRf9/TLF2Tp0hfPSMcV
         ezRQV0NygntOS6r9lMGota8IeDmr0K+D+4a9h1NajwUdyv4zVwIbUtZIwQOOjFPKJeA5
         QbcqvNDDvFLWk6MlM3SoDbsj5jBnhR1TjkU58IeLV+6W6uL+Th3FTTg8hnTETj334KUu
         aAd4joEuXX9yoHrov2kT2ddxNpUtBabyqsLcagtf1q6gzwW+juLOn4cdEZ4otBQAVC35
         cFow==
X-Gm-Message-State: AOJu0Yzlhj7Ms/v/x2qkVcnOljiyMhNQn89L6+ypQ1qjkwtzx0W6L1bp
	tYRElUAZ1IyHBBHb+7hjyQwwGXsZ52D1Y58n9Elxt8SoPQTtrYFGLzee
X-Gm-Gg: AR+sD12XXSfCwJzO0jBoGm5q6FyRcvrQspEmdXpbG6SqNKuZ1UQ4DhsFnphXZt6hUQ3
	Q+hpvTwfARWCPfKict2myTgh/evRoY0HifdTfNeYkdmcE/20xRObaAmwE+mFIVNKF1nSLGHpmz8
	owqKnBR3bsAJ3x0oCIymHxCSInqx3MluU3wxT7qjDCiEkCoN7AX8RE6lBleS9AAQAeeNWPgaq+a
	0pw/i9gwyvzuJ9haCTGyOeNr2kYJzx9Wv3YvMGnvRoavge0BnjrHPK2IvVCuaynuTgI5wAzrZgG
	Lc0nv3/I4LWYhsEpxwwzGtAhxovk6LRnBiIHSqrDPTenrVitafL0Uq+bVq0pwZkxDBQ6DFYbdsl
	by+ZJ6dj0KENe5d9KC3XSpk7+ono1VY+FkA3N5AEsIWfqX5bWj+JaluNEYfye/2JHdSYHyzsxoZ
	CpOSA06ovAVCNBzHvFd5s2ODoLu6sVm+Z3xsHkbl83tcI1nFY7Ei6E1JHIrf0T
X-Received: by 2002:a05:690c:6212:b0:81f:64cf:2c58 with SMTP id 00721157ae682-8201bccf8ddmr51869547b3.6.1785956159995;
        Wed, 05 Aug 2026 11:55:59 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-820131d9135sm25910817b3.6.2026.08.05.11.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:55:58 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2 1/2] alpha: pass -Wa,-mev6 only when using GNU as
Date: Wed,  5 Aug 2026 14:55:57 -0400
Message-ID: <20260805185557.3283233-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

That flag exists to stop gas emulating instructions the assembler thinks
the target lacks.  It is a gas-only option, and LLVM's integrated
assembler does not emulate instructions in the first place, so nothing
is needed there.

Condition it on CONFIG_AS_IS_GNU rather than the compiler, so it is
still passed for clang builds using GNU as (LLVM_IAS=0) and omitted only
for the integrated assembler.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Only this patch changed; patch 2/2 ("alpha: read $gp and $sp explicitly
for clang") is unchanged from v1 and is not resent.

Changes in v2:
- Drop the scripts/Makefile.clang CLANG_TARGET_FLAGS_alpha entry.  It
  will be sent separately when the alpha backend is upstreamed to LLVM.
- Condition -Wa,-mev6 on CONFIG_AS_IS_GNU rather than CONFIG_CC_IS_GCC,
  so it is still passed for clang builds using GNU as (LLVM_IAS=0).
- Reword the subject and commit message for the reduced scope.
- Link to v1: https://lore.kernel.org/r/20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com

 arch/alpha/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
index 35445ff2e489..7074602dca94 100644
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
+# understands -mev6.  LLVM's integrated assembler never emulates.
+ifdef CONFIG_AS_IS_GNU
+KBUILD_CFLAGS += -Wa,-mev6
+endif
 
 libs-y				+= arch/alpha/lib/
 
-- 
2.54.0


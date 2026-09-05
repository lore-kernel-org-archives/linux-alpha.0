Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AE4272803
	for <linux-alpha@vger.kernel.org>; Sat,  5 Sep 2026 19:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636592; cv=none; b=AfYFq8urHT7475rBPBlB86JIn10RcfQXQujnEl9Ehps7+qhmJktrLyuQuwuO+lVFDPcYsQF/SHFddXwOOxgTNX4/M5G/Pr+Jct7FabKVTsufADiO+GVGdU/HEhkwYBDSSMsSmHKeaoU0rxLmkB036K8zdiEXvqQ2hiifrsugdCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636592; c=relaxed/simple;
	bh=GKGjYrVosAl5c7N4rjHl4rltayCdrMJHLpxI6DNWuZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQQXIyF02MpmbBb1/RJfKRQm7fDkNRgN/tg2c756Ues+PpYhLtryo5uu293hpX1DKqjBE8vcpksRzc5xb2JTlRpWtiD/wQrKwtX8pEUrdHigE9Oj2k0cQ7tRo5rH3vEK5BxGiDHPHNjk4W5+C/5nk236ayAiJs5c3PwzSpjA5qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nErSWUL5; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nErSWUL5"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-861f30636f9so32038387b3.0
        for <linux-alpha@vger.kernel.org>; Sat, 05 Sep 2026 12:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636586; x=1789241386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PXGXWpOil8xNaQD6Nl3nnrNjZuDIZru4bxQ6/BRDmjk=;
        b=nErSWUL5RzYexI5/qPb3WCueeBXzt7Ojf1646QBj2KerGQ5sSzOQgvEdCoJdqXRptw
         QvYMfeJ75UmCnCCy+UalSBMUibWCFcAQwnUpsEAVO6e1gZjPI3kQ3+Lg35NREhRrMC5j
         LnDXSEVebxND+0qvwiX5NVtUKaHESPjHxZPETxsURVk1e1GhmPk2IJUL7goA3JeAwvmk
         OQLacQhKDSs68N7D6ldgvZY5wFVXE3+rJswXQfmVDboldKf/OwzZIUoWzL/o88ZdpWpP
         Bad5HVs7HQM3p0rRVaP+F88O+9jnnOhq+vwkpPXlJGULwz5KZKu8G8rq39kXsKDqSFAA
         zNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636586; x=1789241386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXGXWpOil8xNaQD6Nl3nnrNjZuDIZru4bxQ6/BRDmjk=;
        b=WFolKcvQn/VqmelOz75McBZKtWgXgLMMdQqQcizEJSDd2zS6R88FWWxACnMUfsQen+
         h9zApsTGJjWD21RHDIVT5vv4+qsz2HtcG95k+PrXZiJsweeR93VPAPcr4N3DFbbmk1GV
         4r/N+J3+KHQR47+k5yltJaX8jpQSNOKrqCXa3Xx/U4YUz6g3AG611jjMHaQDvRKsbzme
         PeqQN5g8zun/3tTHSU9BfXA7hzGWnXNYfiE4ukKojLcbO80jloCIqizMfz0zWxJBLqBM
         cPLBIebzyOtDXa3lrqijl5k73ylcyZHhhHrL2v6Pa2DbRom7Eq8ZEZDjCr0B+eBUbRZz
         MB6w==
X-Gm-Message-State: AFuF++lKSTiGlCjYYoXfQJ1TrEss2nTtswweoPA9bOA2K4mUY8FbE4l/
	vLBjrJ1YLv6G/g+u9HiXSRxIhK5Zp/+/p7+/2qX01u8I0DAgLrgFiQs0ctrxNzTO
X-Gm-Gg: AYBFou1opK22gD8bCHZVbMyzvI14b3xNvtzZVaQia04Mkx/hX73SUAkMVZB5vfHOUHq
	fnrv/AUQlRphX/J+jqihK32H5h6qVGyrJ0vOuq9mZw6nXcj43iK2bjmS/sw1ILoEZDdasOhpdSZ
	t7IKruB8SqwB9Kw13hp80DwkDZPC4Mvk8A/4w1nZ/4uW/rDx3CAoiOnyJkPiOrL04WgT8Qn/X/V
	Zx/Z4dtG7TZSOmDfmJIeXy1YWTVK6vbpYaMOhOjPKaeXVDYaUt46YC26F0e0cMeW5S9XOSw8nrb
	gLFCQDarnuYmvOIBO0IIwa2QICyKhja4QSTo7eIQjmtJBC7M6H20fzQBcg8J+E0F08UNI7R24dd
	nEYIXg3eEgnx0d0XrGmXB+/AlQ3tifPz28bPHXGSyF2tqocZcsZ4t9TaTiLybk5uDkf/BPMkKRi
	rnJkHPIbc2LnVJU3PnqE1u2yeIZme4VMA5WSaCNUZ4lkGpmA74u5R8zZtmeSQN
X-Received: by 2002:a53:a44c:0:b0:66f:c1bc:402b with SMTP id 956f58d0204a3-66fc1bc4611mr1775506d50.88.1788636586262;
        Sat, 05 Sep 2026 12:29:46 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48ee9easm4992362d50.8.2026.09.05.12.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:45 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:30 -0400
Subject: [PATCH v2 09/22] alpha: select HAVE_ARCH_COMPILER_H
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-9-83e8245761a2@gmail.com>
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Kees Cook <kees@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 linux-doc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=987; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=GKGjYrVosAl5c7N4rjHl4rltayCdrMJHLpxI6DNWuZg=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E7uFtls6qke2vrIfPmWN8ZVnWcajaytNTbduO/Kz
 Wen/syr4yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK65lsTI8JJzi5huLt
 PNazfce4QPrHLtD++cwra/l0fAt+aF0k/Rl4wMXdftRap1mK/W32vX/3rv54VnPK9+aPpnNxxz+
 Bp+6HInGwA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha already provides asm/compiler.h (wrapping uapi/asm/compiler.h)
which defines architecture-specific compiler intrinsics like
__kernel_cmpbge, __kernel_cttz, __kernel_ctlz, and __kernel_ctpop.

Selecting HAVE_ARCH_COMPILER_H causes linux/compiler_types.h to include
asm/compiler.h, making these definitions available consistently.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index bed3f1c8d9d2..237ef0c214dd 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -21,6 +21,7 @@ config ALPHA
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI
 	select PCI_SYSCALL if PCI
+	select HAVE_ARCH_COMPILER_H
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_PAGE_SIZE_8KB

-- 
2.54.0


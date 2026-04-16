Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8C033EB01
	for <linux-alpha@vger.kernel.org>; Thu, 16 Apr 2026 20:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776371068; cv=none; b=GBETmkXfQ5Mdr6NntQx7qTnzJH7cJpWi+xct2/3HZsPtCv7+xMTAxoxZO+BrqZJ3BF6d7n2jj+b/2iqtFR0wd26m5ZCmullPtFDZdoHIzv0I34jPXKWnisp/v/bZUGxTqoNZZIV7s7D01d6uhwqy3n5rkzrc0bwJWMexDxqdRlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776371068; c=relaxed/simple;
	bh=NHTtitiq9Nv/tQCyRrWtBzDz3XfUhrXmM1PdE/Bw4sA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s0Wm6oFFNQ+Q7CpkIvg4VQ2iM9jSC1WynriE/la7b4vzAm3BcjAOU8R836pVsYuWqfdBbxDY4TntKjdEjwCuk3oxvgHKN4nvJG6FG9EupiN60nediSIgTsKUYm6yIELFsXajrh70JkSvy2Uf2q4C34AkRW00S5KTbXg7fO9t9mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NB1KurBM; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NB1KurBM"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so11323006e87.0
        for <linux-alpha@vger.kernel.org>; Thu, 16 Apr 2026 13:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776371065; x=1776975865; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQ8wkzpvaBHPaBotnEgXCnc9zdrYdaluLg5NPZBCkLs=;
        b=NB1KurBMNMo1xZuPs8/teJY130ibHWuBx3u4YDRSxZhnKPDMZJ4xjMuxQXBG5o5M9E
         X+rp4DCBs9kO5f47fRoPb3viZ1M6mGf7iESaINJ48rqD1VXPuYne7Y3/oe87B8wutGgw
         OMw5etUFTSyqB+haP2sYYKmEJ3HpBlSkWpWU6KUWc8dora8pz/oFuDxcqdygG8cML4a/
         KOsGfIuzVbzzOPOKIQ9lptoE36tZnyc5UJln20Xjz8NoWKPyNCY6/R0Nlc8iFKesuilJ
         EPPZLfy/eF9McZfs3yf3k53il/Gfr6ol8e0vjeb2tNEXtTczkbMd6eTJiPrnD0yG65tz
         9HGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776371065; x=1776975865;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQ8wkzpvaBHPaBotnEgXCnc9zdrYdaluLg5NPZBCkLs=;
        b=i9T9C+1n67uRWMXulPZ9RlETZ0KBYO9xfKthlz4oykDz3lJkMxG6nqLj/1SjQ7l2z/
         s5GGLQaubApKoT8hbD5vrnixGWqP+TVriAn5V5TqchwYm5+J5hZQrfoCFN0Lm0JjwGeK
         TVvzreib5LGQGIiqdLPRgkycDs5KXx5vWqaVlMR/L/z8DU0IjUbzPM3gcNBmJtkB/Hj6
         nk4i6QpWs4zuC8XgxKP4YtiF7eMOlSq0FweV/JWC8Ab+/U9u04P0SlAR8kk/Xb2FTP0A
         VJkzcyJPsdjXp0nUQfcTQT+8e6C8L/9MYXa0RHXDYoEP85h7BDjtbY3lb9fNTiZgXuom
         9NDg==
X-Forwarded-Encrypted: i=1; AFNElJ9zN/LY8uA93Uw6F6lBFQGgYjNW0mdee2jtokAhTBHMFqhTDwVdSRdO4Z0t0oJFxaprcHQnASUEGg0/VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZbNdi1agsOrZ1F4vJ321LBAHkdZxo3jWgrubvT/TcjZBd0+LF
	vl/0+xDsUOqbdSIMTu8O1fo2LuIJPlwq8e++A3YIxud1HPyPy44f3vA8
X-Gm-Gg: AeBDievXl8U6k34AvzgRHM0nvUDKcRwExMRniX7HU0yBmd6ehAUjQ5buPa1bwG1kTTK
	uJlvsZsjW90tVInHQhnjSIGNh4KWs6hcEmkNdRFz3lQDnAV6qgg/kGmkCVLikG9Vrn1nea5doom
	7yXk19zxysTVuG3isIYmuyaTKmI5fCtThZzUgINlQ7IYDna9UA7xhCRETvGx8M685ozW0XMy44n
	yudN9WGzgeqG0ABb50Mr79zJ7uHSlMY9cveKmrpQpou9bkglH+qbWpAiyW76f38ktnYeKwI4L2V
	Kg8n9zSLA6upp6NYeFVWu3VWuUioctsAwr0V3FNu3y8arTgnjF/nKYVAmbBuerBMt07GJ79HNWy
	InCXMwFKMgD8sTlEbOpeCjxOT916gJBg610OZkK3j8qkfRVp/GFCLKz0/x/6eMDP659206XdxTi
	B8hdr/UIgxrVrJrQjLY8eXEPgOzHHnlIKHB51UY89s0LyljGSVKZwRrsvM0DUKE77aMz3JW1oHk
	Zs+VoaRy5hpL8tBPlqqz9Jy+5Glq4cLzeKIGc4=
X-Received: by 2002:a05:6512:3185:b0:5a2:be43:c57d with SMTP id 2adb3069b0e04-5a415513d09mr366638e87.12.1776371064896;
        Thu, 16 Apr 2026 13:24:24 -0700 (PDT)
Received: from z440.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a40a2728c9sm1529439e87.6.2026.04.16.13.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:24:24 -0700 (PDT)
Date: Thu, 16 Apr 2026 22:24:22 +0200
From: Magnus Lindholm <linmag7@gmail.com>
To: torvalds@linux-foundation.org, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mattst88@gmail.com, richard.henderson@linaro.org, lindholm@kernel.org
Subject: [GIT PULL] alpha updates for v7.1
Message-ID: <aeFFduvOLiLEJ9Dp@z440.darklands.se>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

This pull request contains two alpha patches: one fix to silence
pgprot_modify() compiler warnings, and one patch adding
SECCOMP/SECCOMP_FILTER support together with the syscall and ptrace
fixes needed for it.

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git tags/alpha-for-v7.1-tag

for you to fetch changes up to bd39fc81340aed5445c731eb391af9ac9a701658:

  alpha: Define pgprot_modify to silence tautological comparison warnings (2026-04-12 19:14:37 +0200)

Thanks!

Magnus

----------------------------------------------------------------
alpha updates for v7.1

- alpha: Define pgprot_modify to silence tautological comparison warnings
- alpha: add support for SECCOMP and SECCOMP_FILTER

----------------------------------------------------------------
Magnus Lindholm (1):
      alpha: add support for SECCOMP and SECCOMP_FILTER

Matt Turner (1):
      alpha: Define pgprot_modify to silence tautological comparison warnings

 .../seccomp/seccomp-filter/arch-support.txt        |   2 +-
 arch/alpha/Kconfig                                 |   2 +
 arch/alpha/include/asm/pgtable.h                   |  11 ++
 arch/alpha/include/asm/seccomp.h                   |  13 +++
 arch/alpha/include/asm/syscall.h                   |  90 ++++++++++++++++-
 arch/alpha/include/asm/thread_info.h               |  16 ++-
 arch/alpha/kernel/entry.S                          | 111 ++++++++++++++++++---
 arch/alpha/kernel/ptrace.c                         |  83 ++++++++++++++-
 8 files changed, 304 insertions(+), 24 deletions(-)
 create mode 100644 arch/alpha/include/asm/seccomp.h

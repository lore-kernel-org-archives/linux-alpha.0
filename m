Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794649718;
	b=O8HM4R5WaAHhdj94omL0ae4DzQusipt2GOCp1oqn49LmtJh6R6P5zcmKUvp/j9aIodqo
	 rAiLf61AtEcOU3z3Bshufx53l78heUr6v6se9n3/HtlBtIOgz255FIy30RsfJMyj2XKcp
	 qkCYeROj5B7YDvF88bbqh0K7ZqJG0lSGdV+YtFtJsTuHge7O4Spt35cAQaxWVcZAlVQWI
	 r1UvLIy67T/MqXCa325QmQZ/CoKDhXqby85QSSJxcUuktkV2EogP0eozVuxvnR+fJCvkJ
	 /b9fKkF1YYAEzWMsAmJ6BmrnZPBHB86FNygFNcbatKWvmMTQr1UKkqZ6VDo2lx5rkkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794649718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tmrz5uMHL2FZGviVrsuQykS5aGwXeAGDlbNFz/QrW7Q=;
	b=RAGdnfBKT1ORcrgWDBuXPFyudI26J5qZsmeKpIJvsbRFfEAINJtcHXXRki1OdaoC1aHL
	 JjG2tByMTp6up3kaQb2V/Aluly5dtzMvEgxW1PeZdMSPPQxbN0loWYWXtYtK2eh+6lt74
	 8Yui9vCCR6zkMXNvAZW8VEjf/MuVPTg7OPnhTl2iHwufgaAmQMIM06IznHoEyGkHWZNqV
	 9cOnSVSHwAQAmkI1Qwp/fcul/M2ZLvFVHXvSGfLOnADFqEvWgYLAotGAt/MqLLfxO6Li3
	 jWbAmuImlRsK0+MytdBDSv+E3I2dOUaEW3MWBBirPXkgwCHICd62cCH14Tez9EPzS7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jOh2S9aN;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4785D606A323
	for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 09:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4785D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jOh2S9aN
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so2780075a12.3
        for <linux-alpha@vger.kernel.org>; Sat, 14 Nov 2026 01:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794649715; x=1795254515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tmrz5uMHL2FZGviVrsuQykS5aGwXeAGDlbNFz/QrW7Q=;
        b=jOh2S9aNP8uqb4ImmhTnKhOACB0jhlUPzbC64dxuIhZNnbS0/dXQ4/sqjBrisNqtgA
         WzLFhO2jrSu1FLOB4kiaFTR0oZ67c5Q54IORP8w5fljmYbbORbeOlzsOYX6mFrBy5IIL
         XksEt4DkmNzzLNwU4f1+29o0b4JTC41ilE2VI+kQ1yggqwVtx4tK2UdHsa5jkzfTj5LX
         Vi1l87wm94jmsnqRpbZrcL3IcXuHxRU7AmJfWoMkZr8YJDevOSbIT6cYeQ689EbVHGOf
         VnG4oi90G1I8JGstDkFCz6tJzyrDNIBSfGesPZmOOaqCg6oW+XZmtnVlkDrAi056rRBZ
         9wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794649715; x=1795254515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tmrz5uMHL2FZGviVrsuQykS5aGwXeAGDlbNFz/QrW7Q=;
        b=mQvqtOySMQaQSn58RZ6Vh4AvyBVNkvY/AdrRPAGp56jc6pDw62hmGxw+fM2dbQLQk5
         PSspgM8Q1SyuLtVhEF6ooFt0mo/NNPi0v3PQLAoLv+pFlAGFmfEt7r62+xwc9PRoTbWB
         tMbOdUmJ9c0Wx35NJ+139K3Z5pPlxlts9XXazMGf4MkRyUji3PKw2cWg8DRloNf2pv71
         CfC5WOPTdrwRwsVSvFnJuYyBa40HwKu6yrsozNGjLXOvHTZDaA6O0aERf4ICk0YI86nI
         zyFsInU1rdcEZRr+ORVIwTHjhISYzxwRIT4wQovrVkSguNhFYQdwsJQVulJpC/75o/Mn
         Y3MQ==
X-Forwarded-Encrypted: i=1; AL+hErH3an9ryZCGPnJtWAhI0FVW1OKjYRGYurq424wBcQDxlvpxFXqtOsgwJ2Vv1bqoS6gwO23RJ9/s/6SatA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/SueX7ZbwZH421X86/5RRsm7vOYQ+fSgrLD2n8wsUXWPsTSmmX
	P7wKjzYCHBwBdXEU4t0CtCzSZY6sa43oVEjqpgVeuwBg1AaktHuTx4OE
X-Gm-Gg: AYBFou0Un3Rt9Q2EdZiIuZg+RRdBs82pI0a3m4CrIvFXlDWw/RrF84kMmp1MwjICR+S
	ZLOz675hNxd5vhhx0yeNRNq8eFH8cwt5AKfq3nR8gfo6I5wx4uO+h6LzExtAO4H6lbshCdABZ6L
	JaOxK/k3rakdV14WeRC+6BVc36KPkdsjRUvhisBlx6j8KFTLqNuNMHKioZp++xxiZmrVb815d71
	2vJUNw9BbmoeY/t73ckXJ3dWpYIkJGo9pwc+mBFvQsgK8+whi7OvQXZO928RNKYuSlbjfsCPgBw
	NFJWo4zWMQ/dwSkfMaxhWOadsKqONrmNGtkq4+HSjHPdjpNWXJV009DpuBm98HlBh9IFuZYz0bD
	AmXMceQLpiDEVzo1jxfKI61XaXEQmPBELyw8a0CN+nRgkrFhFiJxzryj9cIj7zBgje4xaTz6lkk
	A/KJCDs5gHkBpAxpv5qcf7w2HDeuMm1ogK60rWzxRzwTi2E7Z4B50fL5YmT+n0uNS6oLT6xrnU4
	7BRn+UpgZKfwAlIW9vTp3o5z9NOXbmk+IYC5XcRRbQVoDFpemLPjT2WPlIl3upQ1glPM/td9uRi
	mnXQ4WoIuIuGPzsmE5CAWhpgIc3uBAwMPgs1uX6qy/HQk0pogUQbBcTO5Yci/taYz0W8tYc=
X-Received: by 2002:a05:6402:438f:b0:6b5:5ee4:c9d8 with SMTP id 4fb4d7f45d1cf-6b7c0c8232bmr4185673a12.32.1794649715475;
        Sat, 14 Nov 2026 01:48:35 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c672asm2062135a12.15.2026.11.14.01.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:48:34 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v3 0/1] alpha: Add support for HAVE_ARCH_JUMP_LABEL
Date: Sat, 14 Nov 2026 10:48:18 +0100
Message-ID: <20261114094826.1282965-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
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

This revision addresses Matt Turner's review of v2.

Changes since v2:
- Rebase onto the current local alpha-devel branch.
- Place HAVE_ARCH_JUMP_LABEL beside the other HAVE_ARCH selections.
- Warn and return without patching an out-of-range branch target.
- Remove the unused mutex include. Retain JUMP_LABEL_NOP_SIZE: the
  current generic jump_entry_size() requires it on Alpha.
- Clean up the duplicate NOP comment and extra blank line.
- Document the writable kernel and module text requirement.
- Retain Matt's Reviewed-by.

Batching I-cache synchronization and relative jump table entries remain
possible follow-ups.

The previous submission reported UP2000+ SMP tracepoint and stress
checks. Those results do not establish validation of this revision.
This revision cross-builds successfully with W=1 for Alpha SMP, with
CONFIG_JUMP_LABEL=y, CONFIG_STATIC_KEYS_SELFTEST=y and
CONFIG_TEST_STATIC_KEYS=m. On the ES40, the boot selftest passed and
the static-key test modules completed 10 load/unload cycles on each of
three CPUs (30 total), including cross-module keys. This used a combined
kernel with CMA v2. no new kernel warnings or faults appeared during
those tests.

Magnus Lindholm (1):
  alpha: Add support for HAVE_ARCH_JUMP_LABEL

 .../core/jump-labels/arch-support.txt         |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/include/asm/jump_label.h           | 63 +++++++++++++++
 arch/alpha/kernel/Makefile                    |  2 +
 arch/alpha/kernel/jump_label.c                | 79 +++++++++++++++++++
 5 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 arch/alpha/include/asm/jump_label.h
 create mode 100644 arch/alpha/kernel/jump_label.c


base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
-- 
2.43.0


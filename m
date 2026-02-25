Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAEB39282F
	for <linux-alpha@vger.kernel.org>; Wed, 25 Feb 2026 11:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772017574; cv=none; b=pEvM17d/aK+kb9xjA8BU9Ul2Ors+hWYWGy//kJpS8b0Y7OoC53QLO1PmSAwnOd8zU3hiD5hrzMTJJ/u8ndVNn1xO0Gehb7KYocye1myDNdMkmcKmnDWWMWAsRb5V8y8ezNVzvOxySpIVntbC1XxbjaT6mSMpWAt9F/cbmTOOWrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772017574; c=relaxed/simple;
	bh=QjpBr8zEDzfDwQIb71vc83YBGfMzC08iO0tBQGKuNnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CLLNoV60AFj+0PvNshzAb2ukKiscm28pwEd1z0kI45w7vVJIM7/4uULVsk7vH33cygRpA35qNgRWBZJ3RZRMYNmeUtViltTmXEwvjwG1omVxGxLIg7Dqh3+RyH7p1+nlDcGuBlECU22wg+lbIJow3bxbznTJhbsKu9DanGoAuWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIMd8lvF; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIMd8lvF"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38700168abaso53244751fa.3
        for <linux-alpha@vger.kernel.org>; Wed, 25 Feb 2026 03:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772017572; x=1772622372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uwAGy5IQmz3Ch7HomFqpH7V7GfxaWWKjBGoI/IRDkiM=;
        b=gIMd8lvFDsOVYgWQJ6Q8SBl8El7KDqqBK3Qoa//Fjiq+lDnhJdvidtmDfzsaZtMrBz
         HAs8LoM/oTMxzRD3ENNwjxyQ57hw/+Dx5oLL7+4Bh6S8betfCfAcImJ1B+tUcACSdpKF
         PHFtIOme3z+FS/hVHCI4xtxYSCIJvyb0yUHUvUx+UNABuwana1N3y5b20FiFPhkmevjX
         jekxwhvDWhM5Ay6nlX+eYN4C/FOAFVIn9CcA6obHX3mDidsmHtTqhp7rLtklcdkTJenH
         FlTWXBxX8ZhZJvY3A2JqC5fZjyDXsbB7l+Yt847O/r149/MXR47nXuhVe7nVMuPoKz39
         VnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772017572; x=1772622372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwAGy5IQmz3Ch7HomFqpH7V7GfxaWWKjBGoI/IRDkiM=;
        b=B5NMEWWRAut2fp5qend5VX97KB5YM3ZjEgf0o1iaHKnfcWtrEqcWSSrPqm7JJmaYed
         LkHNgArUtJLmcqpKeB4pd0RpxTHUZj4fRVVSzfXOLkCd4zeZhlix+Dwu5zTsKwuheU0W
         trPxAmQRCuC9bqzfBAlx0MJ0eDfN82yKnpO9Is9i+WK5L4OmwV2MgBhm9JC429Upxe4T
         gElBZhm6rNuzsEDEXN1aOLGI/WRZ0Yat/f8H+dtXm/g3GQJdIcKOvVYgbWUrVVaaWqGS
         B6Xjwdapg6k8cJipx2OWCPcBYpkkND2P15orGtiI4COibiCgLmOZv+9r1MYsXUV3iBM7
         f4HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsQxMqz0KKNfqtUmw7NxEYX4jF56fcdU2DML2B9SRFc/lc3qdOzpjvJuDxIHyV1/JEzAJqpXzlaZxeyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZJxaCBOdAWZtqgnJy1pXAx8WbhIj/TB8JMCVQt+AzTw3rJlQO
	a4cd4OVqom1fzGvHYxeqK/7gAicoUiy8o40PWhNUFavBf5QESYeStm8/
X-Gm-Gg: ATEYQzwEn5+B2hXr7aYGQ26B/HzMmVTp+64FJKMy0RiGBgyR7rCvy0qDV2mfremygtL
	QhrqHIm6pSJySZ2gR0BQAhOMdVlgSkoPtCm5cmO9HEo6+3/nJqlU8FMdleH7kVM+nw+gb6zq0de
	I31HNf5iB0rAHckU/mxMBY4Iu2HLvTGR3vtKBK1U88xft1JoFnrWB7/QePlcYmtOd1LhQeCMqpd
	rGnTIYis2UR5Oah7Vvm6I5ecxAY5E0SxHc+JRn9FFX3/hw2hQqj+qtUpVPttrknNBxx6xhIQWze
	7GdHZgi7cJjxdw83lmqi9ZuKZL+MElLfZMeivGmJL7brJa529MKZKPgDN7GWxgyndcQCEiQN2XN
	ucyyQBTqfiBWEHFHwQj9Z6uYt/vzZAMaodP5A7mGaEjcZciHTpv8opZxvlbzH1icoMeiHk20vHn
	MejB68AMCbYlzUfU7dm6Nmjsa4qUnulWFgdz81PYZuA4lVRJRXTrskmG1UvY9t26N/diDMP3FJq
	IOsw7OVPyH5bofLTIeOUawyRxFNtd4kOI4=
X-Received: by 2002:a05:651c:547:b0:386:1e28:4d72 with SMTP id 38308e7fff4ca-389ee2c26d5mr506321fa.30.1772017571450;
        Wed, 25 Feb 2026 03:06:11 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a78d2326sm29347181fa.15.2026.02.25.03.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:06:10 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	skhan@linuxfoundation.org,
	chenmiao.ku@gmail.com,
	shorne@gmail.com,
	corbet@lwn.net
Cc: glaubitz@physik.fu-berlin.de,
	macro@orcam.me.uk,
	macro@redhat.com,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v2 0/1] alpha: Add support for HAVE_ARCH_JUMP_LABEL
Date: Wed, 25 Feb 2026 12:02:45 +0100
Message-ID: <20260225110548.31431-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds jump label (static key) support for Alpha.
Testing and verification were performed on an UP2000+ system.

Verification steps:

  - Confirmed __jump_table section is present at runtime via
    /proc/kallsyms and contains a non-zero number of entries.

  - Instrumented arch_jump_label_transform() to log patch
    operations and verified instruction sites toggle between:

        NOP (bis $31,$31,$31, 0x47ff041f)
        BR  (br $31,target)

  - Added temporary instrumentation in
    arch_jump_label_transform() to log old/new instruction
    values at each patch site, and used a Python script to
    validate correct NOP/BR transitions and branch encoding,
    confirming functional runtime patching.

Instruction stream synchronization uses imb()/smp_imb() via
flush_icache_range(), and runtime behavior confirms correct
I-cache coherency.

The system remained stable throughout all testing.
---
Changes since v1:
 - Update features documentation for features/core/jump-labels
link: https://lore.kernel.org/linux-alpha/20260219170013.15884-1-linmag7@gmail.com/T/#t

Magnus Lindholm (1):
  alpha: Add support for HAVE_ARCH_JUMP_LABEL

 .../core/jump-labels/arch-support.txt         |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/include/asm/jump_label.h           | 66 +++++++++++++++
 arch/alpha/kernel/Makefile                    |  1 +
 arch/alpha/kernel/jump_label.c                | 81 +++++++++++++++++++
 5 files changed, 150 insertions(+), 1 deletion(-)
 create mode 100644 arch/alpha/include/asm/jump_label.h
 create mode 100644 arch/alpha/kernel/jump_label.c

-- 
2.52.0


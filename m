Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B720938B125
	for <linux-alpha@vger.kernel.org>; Wed,  2 Sep 2026 18:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788374483; cv=none; b=fpJ5DcM4R2gs7Wiw6VCnSKnSc8J6DrDHFyk0pDNymtraYYvIAjptJrfa0r/rV9NhRHAaXrgJpkRjMrQJbssmEAQ24QsOfBkEHPR5uikrAZtSUgGO5UcI+dn8zRX5dvJtSVTmE+rmd2TFEZ8EbiEt3PRsauRy9ReWg4hNjRUFlVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788374483; c=relaxed/simple;
	bh=5XKIUGN9pseqYOJ2VlqbCcbe0jcvheP8bGpV39l0aKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iyCLgIQ5VZqckXab4DwwpJa7wZwe1dbyd727cpZ/V9BoIdQLI6GQ+5iymSoFPpB7HwReuQdi74K5cyKyP6aOAw6LMFHZ9XqI/LCFRzyOhISGSLsA7gJy33W1SA6/6HpzHvQDDu5LuQo0ySCuznhm8qqQhpN+/7z5cX0wFwrpCZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DidSUQzG; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DidSUQzG"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1c52d920b8so194634366b.2
        for <linux-alpha@vger.kernel.org>; Wed, 02 Sep 2026 11:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788374480; x=1788979280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=41HOwrOO2w09PfdkrUqZ7Rw4BYlSLB2NTp+BwrZv61Q=;
        b=DidSUQzGLhaDSNVBNy+wrbBlRlHQJQnm0CJ9Cc9HRXT+tIuB3WYLmIN1tlNDGDvrUf
         Nr1D1Iz0KeOL0IyBhtZ6WKg92KvFep8IPov7ZU6WjG3hVqdkQMIlsq6tfTvw3/2d7nKz
         6A4eff6exdxrjpP+k/JtT/ibsnv0Dyc5Yctv+xHI6zI9UdHW+7IfLKAIZkr57nGn7rBs
         OnnfH90tBlQR1zncpiKr0g08SVHw3pI/wglvSEwu2+ewpkLQHL4JWSdbzRbalIlExQ9F
         O2s/B/3Ge21LBpzUqaeiM9omljCzMDiIEohwc4zMzid0qYLsrO02DdrIBu+SNCX9yIbg
         PNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788374480; x=1788979280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41HOwrOO2w09PfdkrUqZ7Rw4BYlSLB2NTp+BwrZv61Q=;
        b=VsiF9oW3vk1I5b7u8CabE9732+zUJWlEBRWVsQ8Ai9333s/fb1/u0MiTnFiWoYT056
         cL/jVFok5UUdBhr5VHGLCJjhYd+6q0T3GO08zCRyemIMPemkNJUFz4LvCvFV7EqlebTm
         rAwJNHd7dK+lXqN01V96aJw2R29cPcNv9VoGHqiowGcY7VOxDT05Dyo+RWNTuZX+aXxN
         Oa5GVw00Qxm8vxlk9BhprpzZhUpNM2RhJBty2/0kcTi41LmOn0zfIr6AwgoQj4+NtYyj
         RQoqDiYGr4Vrnphj1kO9HHajDzdqmPlBpkjE0FAK58ld9zYoHKv6ZXDRAw6UpuKGdTjr
         9DOA==
X-Forwarded-Encrypted: i=1; AKwUvByE7SOsNEADe9gGSlflvUQi44s3xJUXZ+sk6mDj77l9bkyJTpXiwuHrhdQOElBLSluKMS/BUE59edTouA==@vger.kernel.org
X-Gm-Message-State: AFuF++nNl/EOdadJDM9PZIyp5Eon/R8F+n+j3Le5hb2yfZorTmZAZ5Ad
	3FNUraNhVeB1RdtrgMODuVeVjLnhDr2W6Shkqm3YhUWSeMlRT/Cy711q
X-Gm-Gg: AYBFou0uiionOn1WAPNHKI58iPbf2ABy/Q1yVQ2Pfa3JteLf753QDwy+pU+ky4vxybs
	j7ZeVmJP8ey6pXgw7UD8VQZ/3ik5Ntflo9FbcdXVxl6RszN/YPMyvq4lij32B+u1lGI7HrNI6MF
	KgdW23SbQwIWOydUIuE7rl5h6MwguQlnnpJBOYIlvi+qYviC/k/7K8bUGup2OVfJoxDJPlAX28M
	2XiitXkvkIIPi6BRxNPwRvbHzReEXzf/A6JcInXM97xsXahP5REMTHgDRfe65b7hLem//r7Kbqf
	/U1Uyqea16dVplBlcFFlTd2Xpgl9+shrpNkQU0APv0anPKPbIvvBXzbUV9Sn1TN0tQQ/vo41r41
	E3d9T7td+tNnpo+0dX+yI68eXRYUEQneWh0WZO7GyJzJA4uv4FzdEZwNa/xn0vkOsh0sjRO+baS
	Y+VRrEujbZb78MTqQP/FDGNor4WdvMSprtFNn6hA56q0CqzJVXJj5xx79zS4HtplskQTdJswpB8
	/7cwS4jbs8kTbHMpzt+s1wO+5LEJ/EH0X5c0IKbsQ==
X-Received: by 2002:a17:907:d88:b0:c25:8c74:71e6 with SMTP id a640c23a62f3a-c25d52785aamr416718066b.10.1788374479680;
        Wed, 02 Sep 2026 11:41:19 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc5a84sm178022266b.13.2026.09.02.11.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:41:19 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	mcree@orcon.net.nz,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v5 0/1] alpha: enable GENERIC_ENTRY
Date: Wed,  2 Sep 2026 20:38:55 +0200
Message-ID: <20260902184058.198679-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is v5 of the Alpha generic-entry series. The five preparatory
patches from the previous posting have now been merged, so this posting
contains only the remaining GENERIC_ENTRY conversion.

The patch moves Alpha's syscall entry, syscall exit, and return-to-user
handling to the generic entry infrastructure. Alpha-specific syscall
dispatch and the r0/r19 return-value encoding remain architecture code,
as do the low-level PALcode return paths.

This version is rebased onto v7.3-rc1 and adapted to Thomas Gleixner's
syscall-entry API changes. It uses
syscall_enter_from_user_mode_randomize_stack() and the new Boolean
syscall-permission result while preserving Alpha's ptrace, seccomp,
restart, and invalid-syscall handling.

This is tested on an UP2000+ SMP. Normal workload, FPU work,
strace testsuit and seccomp kernel testsuit.

Changes since v4:

  - Dropped the five preparatory patches that have been merged.
  - Rebased the remaining GENERIC_ENTRY patch onto v7.3-rc1.
  - Adapted syscall entry to the new Boolean permission API.
  - Use the combined syscall-entry and kernel-stack randomization helper.

The previous posting is available here:

Link: https://lore.kernel.org/linux-alpha/20260706170019.2941459-1-linmag7@gmail.com/

Thanks,
Magnus


Magnus Lindholm (1):
  alpha: enable GENERIC_ENTRY

 arch/alpha/Kconfig                    |   2 +
 arch/alpha/include/asm/entry-common.h |  14 ++
 arch/alpha/include/asm/ptrace.h       |  14 +-
 arch/alpha/include/asm/stacktrace.h   |  20 ++
 arch/alpha/include/asm/syscall.h      |  11 +-
 arch/alpha/include/asm/thread_info.h  |  30 +--
 arch/alpha/kernel/asm-offsets.c       |   5 +
 arch/alpha/kernel/entry.S             | 322 +++++++-------------------
 arch/alpha/kernel/irq_alpha.c         |  14 +-
 arch/alpha/kernel/proto.h             |   9 +-
 arch/alpha/kernel/ptrace.c            | 130 +++++------
 arch/alpha/kernel/signal.c            | 164 ++++++++++---
 12 files changed, 370 insertions(+), 365 deletions(-)
 create mode 100644 arch/alpha/include/asm/entry-common.h
 create mode 100644 arch/alpha/include/asm/stacktrace.h

-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735482;
	b=Vl2hzgdG6088SNiZUq/UmesFTF/2PWkbJZjNf3pa1m7u/b/Yl+pUXSmmhAq1Fh6uThjh
	 lrm1sRmyYz2exUv0v5WBMSbnXMblt3soQMnzY+wn8kReVNdjV+smpk9vk4BWbgpFGZ+e4
	 86yuFERhef7gAbGeFzS1pTDuPdKvihHqa67wIakk6zkDBvbbQ6lwOeXPtH+Ur5Ujr9jZh
	 0TTXYB2WhIZNq9ybDU2gLZz5Zh8MTtR3womQbjorsL5TVlB1RhN46PhAYs/vxDS4Ytx72
	 Ou31OgtW5oKzkV53BxIhIkkQ3SLELophXZLSO1KxqFrWiNx44vOq8edXZAhAkDvEmsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r7wTp+ResCv9/vauP3XOa+9Wav8fHpAlVrS4kplYpIo=;
	b=Y+2zuGruU3vN2+DAjSsF/Dxj5NbnA37ocPW9QaH56U4Zlx1v/cq+rk0KFz18VmZ2fCpy
	 YdNz1GL9N16JUjab1eghoIEwYVmVUJQ/4K3SoG3e3hZmItOirgdh7jklUDmS0vV1BwjVr
	 lu9FYwfDy+JN6s9gEXTily9ZKDlxcCSsiMg4+kmc4w96KligBv0AYpnnnRmGU5WL/yB6N
	 CZYYcSEs/a085DapHjcISEnenVlErIcoLiA+Pj3g6GAk8TGL78iIRLT76liM1sBqhU3uo
	 yihS+yGgfwjwQJu+yNjeLOOvjqLF0RFbEsLcTB9mrXF2l7nTKG3kTZMg8KXYkJgG4OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VedZ6Yct;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29C0606A31D
	for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 09:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F29C0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VedZ6Yct
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ada7d53082so33590251fa.0
        for <linux-alpha@vger.kernel.org>; Sun, 15 Nov 2026 01:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735480; x=1795340280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7wTp+ResCv9/vauP3XOa+9Wav8fHpAlVrS4kplYpIo=;
        b=VedZ6Yct43cphb21llsRwcKTjkaJ1KK+1lE5uBQNhhpNW6TPs7YlDmJCU8ZqBdnTTB
         tseOqUhHoo0CLMjkd8nJ4FagYTH3vhEpGFGUeg5UaSw5aEjPA3T11MZNTIIEua/mn2BO
         wlj5EjmIkMszzHeq/4oUZrA+KtILwBiMEPompoMdL7v/LlplJoSTw4S9yGZmDdxIbbeC
         dzsfP+dXkYnVsuARbl/AbaMaJLtz8bmvp0x866JnPQES4x326oJ0SHiT14MVJJPBI26z
         9ylk6D6nNNIObrYBCppy/oUwVW0UjD2MVt6NK5c1dgUjA1kuXZE+Gx1mas/V7QdbELdG
         RHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735480; x=1795340280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7wTp+ResCv9/vauP3XOa+9Wav8fHpAlVrS4kplYpIo=;
        b=cW7RbFgndUNPU9RlV2TiwQTJFhaIIn3OwN24JXJEMcM7S3YyF0sSOqUtyy36chWVAH
         6bbCrGh5tAvoDxWigvDh8rcKF6bFSnb0IT+LL6ol6PjqBTsz3gi2X3XkiaPXbeMuQ0ZW
         4VjfQj4+v0nu8xz5XCF5Q9KblszggqOo+whaZM9LN9BL6e/TDCZP3wR+s+IzUGwHpr5n
         o/LkypgVVXKagyCoyoNlezXDC+PrXfS5vBCjMhDe+DgjwZVOTOSa5Y5reDG2AbnpGcc8
         78KZMaGXo3alnYRMvuzh2ennPhOe6ct+Rvnpq7R3+fq8e69rNVlOEw4hBhRK4YmIjtT2
         kVyg==
X-Forwarded-Encrypted: i=1; AL+hErHsKTCh5ky9VyI7nCb+Qb0ei78SLIr/I5qPae8ahaa7HMqE02bKLom7Jd5oRYR5O0LV+jp48ToTAx/lZA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+dJmq8F6lHF1LQMBd07RbO52kiWoINb7UyMd0BgGiusK1XKAao
	HHVrrF/gyXCQJk1GXwUz+pLVwfTxvqpXwlcLxySS9bQkCrEWpJFlHChc
X-Gm-Gg: AYBFou19UMjUoSnYvrwctCUsj+Mo3jM4NvuWI2QFVCaSq962cLgbh+36qcwIhslToFX
	c0qbLflw2brV6NQQAHwyJDpUSRgVMMXS+3Qlze35pTk34lMSgZUDwsImE6R+hFuY/8ZjAdV0vMi
	u0useNisVw858GCbV0zSqvGBlr6saOWWhttBzbwjYHHsCtSm8dGQWGj49rm/2yeNkO/wP7/D5A6
	KrAwiSt9n1Phv/pU4E27Cx08fjnZszk9/s0+dqdP0xbtFGEQfdbUQkZ1fa8H48kFdLxKq9oCUad
	fvvbPz8XSLt5QEw1jRhhSmhhFORw0ZpknGyKxx8qBpdG0BiE54WZEqCLwCjfK+izJbVzN62D10D
	ZDRQJ+33oRUO2YKbdlBTc1CabpFRyBGp+srP6DYuWFK+l7VX/qVtE6dgtJ0K54idwihBHMqFJVo
	BrNudyG7OfPXsPLgCNxxpp9RKpsCg32eM8S8oMjyWlyXHQ2vc7ZUBLv9oxxcx3z97zkgD6VSss9
	AGGfF46+FNgPlbAvAtyKHXC8EXMhyGuJ8kRqQA78sig8CQuyjdWh7NLiKhHOzUSW5BKiJ5FR1nW
	tH/arXJZ30ZBVy8cUYzrqXjybjIDboB//Pu1KaQsgnhF64HAju+rg94dAUEVuSl8BsXL8Gw=
X-Received: by 2002:a05:651c:a184:b0:3ad:372b:1fc8 with SMTP id 38308e7fff4ca-3ae2b4f8112mr16428611fa.9.1794735479714;
        Sun, 15 Nov 2026 01:37:59 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7ae92dsm23598851fa.23.2026.11.15.01.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:37:59 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v4 0/1] alpha: Add support for HAVE_ARCH_JUMP_LABEL
Date: Sun, 15 Nov 2026 10:37:47 +0100
Message-ID: <20261115093752.1287968-1-linmag7@gmail.com>
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

Apply-time cleanups following Matt Turner's review of v3:

- Move jump_label.o beside the other object entries near the top of
  arch/alpha/kernel/Makefile, outside the GENERIC block.
- Include linux/cacheflush.h instead of asm/cacheflush.h.
- Regenerate the cover-letter diffstat and retain Matt's Reviewed-by.

The jump-label implementation is otherwise unchanged from v3.

V3 was cross-built with W=1 and boot-tested on a three-CPU AlphaServer
ES40 with CMA v2. The static-key boot selftest and 30 module load/unload
cycles passed, including cross-module keys. This revised export has
not been rebuilt or boot-tested separately.

Batching I-cache synchronization and relative jump-table entries remain
follow-ups. The early jump_label_init() call needed before Alpha's new
early-parameter parsing is carried by the separate CMA v3 series.

This patch applies to for-next at 0b4cadbe7c39.

Magnus Lindholm (1):
  alpha: Add support for HAVE_ARCH_JUMP_LABEL

 .../core/jump-labels/arch-support.txt         |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/include/asm/jump_label.h           | 65 +++++++++++++++
 arch/alpha/kernel/Makefile                    |  1 +
 arch/alpha/kernel/jump_label.c                | 79 +++++++++++++++++++
 5 files changed, 147 insertions(+), 1 deletion(-)
 create mode 100644 arch/alpha/include/asm/jump_label.h
 create mode 100644 arch/alpha/kernel/jump_label.c


base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
-- 
2.43.0


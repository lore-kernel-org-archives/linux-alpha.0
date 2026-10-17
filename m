Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D64303A0D
	for <linux-alpha@vger.kernel.org>; Sat, 17 Oct 2026 16:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792256021; cv=none; b=A0Kt8Y/lI3ummca6TGOMsh6075NIDaQ+8E6JhI87LLaANN0+Tq9BfXHxMJhXtu9QXTs/ptCuNeHRXw8h+DRXYbkI7zyA1jf3Nkwo9M9YPUcOkeFI4wO9Z3bHdZpgTOJnOdqz0xHvbxzS3N2xEyYWa+Tuwc7rQytm9CkajxwrXDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792256021; c=relaxed/simple;
	bh=wSqS8syXnzPmL/m37NiQQJrKyVaM3mH1XDu7x/X8LmY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T4TL66Ys3GZi9/cRbML+AOeP24OJEzCMGMEOI1QPrCy9ENfgTGxzL5YmeA7E8wJAkmmzHQQr5+UXTjA1Y+hVadZnBEKXcUAgOQVdGAxKV+uiyjVj1MJimvcJjZ6rJL1wba3gK1yGv8xhBxyrAjQV1YwPUrKYFdBA3iOaBNd6PCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ei/lb4K8; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ei/lb4K8"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-675676afc3cso907209d50.3
        for <linux-alpha@vger.kernel.org>; Sat, 17 Oct 2026 09:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792256019; x=1792860819; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yukuLO6L7OMMl8uV5z9gWiJWO8Ic/Ym6OwukJlGX4pQ=;
        b=ei/lb4K8C4WBMLLA1DR5lJoV4Lk0LOCRdWo6KlVr4fAkasVdERtLuzaR/YmipM9ZsA
         oCgTKEYHd30o7b+y9wIL6okfHSnGXzmlECS7VjjiiLO/1awXtVdAkcPq21siuVUqdAZr
         4hJYUkWd1K3mPWo7CpWnVinaitilG1aIq1Zm7QA2EhlxNzIjCqBlFYx+ljiGOqorCcUV
         DryB6ciY6giLeKqzr/ERDCAAu1dZzthAq1UQEFiapv0NxF9XyewaoDyNgGZfPctPMyps
         oGRU+9OkyVlOQJAV9IiXHiT4mnjhQFZlz6G7dh7qYOwGP/blXurwTY63I2rgZEQ/nAAF
         rAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792256019; x=1792860819;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yukuLO6L7OMMl8uV5z9gWiJWO8Ic/Ym6OwukJlGX4pQ=;
        b=bYJzV7CzDyRFo0Meqc4RYIbNByfUfDTPu0UPDWdwhDvun6mNhakT4h64D/X20Lgl0m
         1T9GWEs38c1o7zVLQu/YgZa+k3Z9UCQjxz05520n+S1ZUXp6sz/jz6sb52dW6rRHQ+xo
         Q1stY91TMxMlecf9v9GaEQUk9Sa3l1cFuosf5YL1Q5v13j/3MkPGX/Q71ctacl9sZyf6
         AQnTLxKA0I3mPenbYvbuCwqAO6JKDLecOyFA4ae/B84dWi0j4VgNINVr7wEcNgd6kw1J
         PyrXgNloNA5+lH1pZ6fuaFrO3SHJFaqj6x7rSwFSGOs28O/c0IOvdZya68qdvpR5fRoZ
         JHMw==
X-Forwarded-Encrypted: i=1; AKwUvByr2ueh8Tdz1qAhGWUD6N1ScACSKQEcpDvLrt4SJ76jqm9YpEmsLV4WJtWJIi32RCG7w4v6RRTFnF9foA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLz6EG0G88wOwApwjWKtOhrIde5a5S+5MZtuUGAT/9ERx1KcjLU
	PldfO/ykRKMyzw0D9+4qLR7nI7bTCBG2BHZv6r72quUDlW7O/nU0qcxI
X-Gm-Gg: AYBFou0Zai38PI0VIGOFiQsVMn7+Kxf7YtAgKAKwB5fzTlvHUSLCSq8zRx497KqnCLa
	tWIzkNRyn12z52d/A98ljfK8x8LEj0ikEjPo6QQ0LDnPgmFlLrfFJ4DbqwacMrnGAODalG1bg/Q
	ERs7nSntx0Olkcw6AMpgF3g7DDQqntBxUKjccB+gZR6w9mQeNW4xPowA5oNMEqkYBW15FDbEpE8
	3iztgeS9H2fTRVtOIvFp5cEJ92IvPvWH16OoTvqStdO+oYZYCXV6wnZgGchQhW/kps96sq8vfdr
	YsFd0I1b9C9Mc+siK0+2+XTkBCtPm54+jtJcafrCOa0MfLF7Tt94+wvddsa3QGGZHR0hAynreVH
	GTTkPAaamXsWa7iCgs+JYg64hPOzgBPdVKy44sUoMq/dqn26DT9Wd9IW7wht+Ylr75CvSG+tcm9
	COJVGTgV4X6TP46bQH7OeqC2p6z2zB2aAJxJIpGX13E0tHQsmXjaxxfESMO3wWdKbTLA6eR+DZz
	mfshHhzwaxeFGla5B27huV1GtfkromDkPQmm2ble2d/55x0xyGmP0tKTAlu9YuonjhHxx5y06B+
	SJfenQ4ygtlus3XFun8BWkfvclWo
X-Received: by 2002:a05:690e:4191:b0:677:cf7a:ea97 with SMTP id 956f58d0204a3-679ca8a25bamr931326d50.85.1792256018956;
        Sat, 17 Oct 2026 09:53:38 -0700 (PDT)
Received: from localhost (108-93-236-139.lightspeed.chtnsc.sbcglobal.net. [108.93.236.139])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b19c3933sm2418313d50.0.2026.10.17.09.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:53:38 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v2 0/3] alpha: self-extracting compressed kernel images
Date: Sat, 17 Oct 2026 12:53:32 -0400
Message-Id: <20261017-alpha-kernel-compression-v2-0-c71e6b08dc63@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NSw6CMBCGr0Jm7Zg+BIWV9zAsapnCRCikNY2Gc
 HcLJ3D5/c8VIgWmCE2xQqDEkWefQZ0KsIPxPSF3mUEJVYlaKjTjMhh8UfA0op2nJVDcS6jERbu
 bqNzzWkKuZ8Px55h+tJkHju85fI+nJHf1j9EkUaCluitLrYWs9b2fDI/nnIF227Yfjh+R6MAAA
 AA=
X-Change-ID: 20260912-alpha-kernel-compression-2043f806fb75
To: Lasse Collin <lasse.collin@tukaani.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2397; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=wSqS8syXnzPmL/m37NiQQJrKyVaM3mH1XDu7x/X8LmY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIur+BduUf15L6zWt1eyr8bxW2kUpi6FJyDOx/eTDm0Q
 qS1WndWx0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFyzyofhn7Xjhoapx2
 YItl3TWez5y2vv1NtNOxNjtE5Hqc0oiNr4IoHhfwCD8GYPBx0N1u75ndu42vbrWYSskTBl3Ofg/
 /Yq14OjvAA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha is the last architecture whose boot loader decompresses the kernel
itself: aboot carries its own inflate code, so vmlinux.gz has always
been plain gzip, and adding a compression format meant writing a
decompressor for aboot as well as for the kernel.

Build a self-extracting image instead, a small ELF stub with the
compressed vmlinux linked in, which aboot loads and enters like any
other kernel. The compression format then becomes an ordinary kernel
Kconfig choice, and all seven formats become available: xz gives the
smallest image, 5547496 bytes against 7677280 for the equivalent gzip
one. The build now emits arch/alpha/boot/vmlinuz, since the image is no
longer gzip data.

The SRM netboot path (bootpz.c) has its own boot protocol and keeps
using gzip.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v2:
- Build private copies of the arch/alpha/lib/ memory and division
  routines for the stub instead of linking lib.a, whose objects carry
  UBSAN/gcov instrumentation and the kernel's -mcpu=. Fixes stub link
  failures with UBSAN or GCOV_PROFILE_ALL. (Magnus)
- Build the stub with an explicit -mcpu=ev4.
- Collect trailers.
- Link to v1: https://lore.kernel.org/r/20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com

---
Matt Turner (3):
      xz: add arch-specific tuning for alpha
      alpha: add self-extracting compressed kernel boot stub
      alpha: support the remaining kernel compression formats

 arch/alpha/Kconfig                       |   7 ++
 arch/alpha/Makefile                      |   6 +-
 arch/alpha/boot/.gitignore               |   2 +
 arch/alpha/boot/Makefile                 |  16 ++-
 arch/alpha/boot/compressed/.gitignore    |   3 +
 arch/alpha/boot/compressed/Makefile      |  89 +++++++++++++
 arch/alpha/boot/compressed/head.S        |  36 ++++++
 arch/alpha/boot/compressed/misc.c        | 209 +++++++++++++++++++++++++++++++
 arch/alpha/boot/compressed/trampoline.S  |  46 +++++++
 arch/alpha/boot/compressed/vmlinux.lds.S |  83 ++++++++++++
 arch/alpha/boot/compressed/vmlinux.scr   |  10 ++
 scripts/xz_wrap.sh                       |   5 +
 12 files changed, 504 insertions(+), 8 deletions(-)
---
base-commit: 4407825b2f96b0e48a4bd08ab196b50a30eb3aef
change-id: 20260912-alpha-kernel-compression-2043f806fb75

Best regards,
-- 
Matt Turner <mattst88@gmail.com>


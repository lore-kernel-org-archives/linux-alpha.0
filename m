Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5098E3382EC
	for <linux-alpha@vger.kernel.org>; Fri, 20 Feb 2026 10:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771585108; cv=none; b=e3BBsrWRSMBYMhnI9ZSFMc0oswupqv6UkAZocqEVUlmlEBd2W7XK6PUDumlZdGm6SOnXulX9AoGlUDybiGaJzbbKDmaDHh0nGzoAh/hQG5fP6D7xoB36zytdr/bh9ucuhwlN9Mtk2cCd9+bu/r1ez0KVRc/A8rCt/CvpEoVfs9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771585108; c=relaxed/simple;
	bh=ZPsdS+wHgzw9QeW9jt2d5f4gTTX82BrqYLt3i6HF1UY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qeIbopvjbGBvubpNuP2n1hI8OmIGtNTioZMpfhTpHnrT8+raa3dmLq9i++yLbb1SKuYIFz5I4U+SG8yVN9zMCGA//89OP1IuIJceKJgTuc6e+YCas9wcN38iZqkKxdrgWTOM23AnEKB80n/9UBKjzuSdunnfh7SrWqmWpYjcGrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUakKLln; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUakKLln"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59e5f52b13eso2393754e87.2
        for <linux-alpha@vger.kernel.org>; Fri, 20 Feb 2026 02:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771585104; x=1772189904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=74lRYbjOb2rRE375diWhyXReQIshWq2MXS1nfSaGpxk=;
        b=dUakKLlnjHGirT2UL0s7IRlMvS2Yik5Y3Ce6wYqykvVojTlHYktg/nLOr/H7X7hBh/
         CKoIwfQdDsTikFC6AteBLxQn56Cno4E6CgAo+iYfpiPDy0Rc7o7bg3FmehZ+lfUf3li4
         S92rKCx+Zr2eqDaFCWFzsNh254Zxa35MFLDsexyDFHjPJVNZPiLUCv4ATm4KGG5Zas/u
         HhTeIxbkRHDhhcQHNzM0bXeDuYWHZvI/fFgYwJoisVBQfyg7fzdbt8JEvv7ryJSaP2vK
         RcHT6bGUVsE0ED0f9VzvE1Ok6qSXPXDTLbd2yMKRDzPDcTiIQm1t17tmcPo8kfsCX34U
         a5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771585104; x=1772189904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74lRYbjOb2rRE375diWhyXReQIshWq2MXS1nfSaGpxk=;
        b=TqwQeSvGgzAXnIrF576VCkaBwefNcX3HebLZ24BiVVTHOflD7W6IkN2XAeWvKRCcHR
         lIUrfwrf6XR+KEYiKmRNucO7sWHLhv8jlSnnbsPpuO6zSNl2m41+p+4Mx4rON4pKEGqC
         IMOlx1l9+yHxwJOlnfmwOp4UrOIRYbpF434gR+E+cDs5Fc9i5XiKgN71TTOtsN8rP/0O
         WboycUw+HvjWqm6suDXQJadBjadU54X+aeF4QROICPSIeKWAd8wl9aocfsIbNeX+zJKu
         6FD45e9TKZnaOb68lNrsYnEYUee4yIA88ZorHrKPW4BBqS11M9s+xWcy1anwLn3w8TqV
         qL6g==
X-Forwarded-Encrypted: i=1; AJvYcCXQ3kKMO42JuMTmYjigVUb5wJ2OnYgLM2ye+sxHGuBVA4fUMLz6p5kPDxRO1yVfDcyxABta/dQUVXdltA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyvMaZwzN29NK5Bu41Zt4vnvCjIicwSpDOT+jeyktBJ0M2N+CH
	rAhLDSjjLpCNrwm23ZjTTs+eA6Lfjn6lh4NUPiN++nzL2RsH7UnXsvnmFWUg+Q==
X-Gm-Gg: AZuq6aKXvZnWoX0Pi3+6cGLr480uyOzHQ7YOwYdq9hAtccUwE3OHxQdBOoreDdzG8nR
	k1Ee27dYJNNQWXYQKPuoGMl2g84q2i82uila6/dbBYz6hxvh61q1uv0htXa2ywvaCuQoQD4+nf7
	t6CJklrD/nFaZH+v8NzhOCTxCKfLZBt/CRRsQXmTlskbonCiABNw1HPylXqX+Dtvnc98ftpx4Ne
	DRimOxRzAsWZqL6vA2AaqDnmbljjHc6PmG0rxUzrXyyD/x69AA7VdpG6XYbK7D3fCEIBVSJ2nbP
	PGh2iOgEfyhMouL6ZSvTnEkeYqWHU7Piv3qJhtxglJyVTfCdaDo+piPWeA1+GW0QqX8eOE3bFHQ
	3S3E1G0tFBViY2oXFpGYi33t63lEM3whcVBp1umIPQ0XUvpydqgwY5Y6Nlfi0T2m1PSNCYdL4vG
	BAYDY363r7gw8gSJH3fj2f9AHKhAhC0/SEewP88K/WFphotUsbcWq0vOK0p4B82ST9ugykYHOMu
	s84lku8O6+uqcRFm5yuCTus+gNAXPFzkLo=
X-Received: by 2002:a05:6512:39d1:b0:59e:5cf8:56b5 with SMTP id 2adb3069b0e04-59f6d37997cmr6519932e87.26.1771585104127;
        Fri, 20 Feb 2026 02:58:24 -0800 (PST)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b2239sm5902530e87.81.2026.02.20.02.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 02:58:23 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	macro@orcam.me.uk,
	macro@redhat.com,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v2 0/1] alpha: add support for SECCOMP and SECCOMP_FILTER
Date: Fri, 20 Feb 2026 11:50:09 +0100
Message-ID: <20260220105757.25104-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds SECCOMP and SECCOMP_FILTER support to the Alpha
architecture.

The seccomp-bpf selftests exercise syscall tracing, restart, and signal
interaction paths that were previously untested on Alpha. To support
these, the ptrace/strace syscall path is updated to reliably distinguish
internal skip-dispatch from userspace invalid syscall numbers, ensuring
that syscall(-1) continues to return -ENOSYS with correct r0/a3
semantics.

Supporting seccomp also requires correct syscall restart handling when
ptrace and signal delivery are involved. The traced syscall entry path
now consistently tracks syscall state using r0, r1, and r2 while
preserving Alpha's a3-based error reporting ABI:

  - r1 holds the mutable "current" syscall number
  - r2 preserves the original syscall number for restart
  - r0 and r19 (a3) retain their traditional roles as return value and
    error indicator

This separation allows syscall restarts to be gated strictly on valid
ERESTART* return codes in the ptrace/strace paths and prevents
kernel-internal restart values from leaking into userspace.

Alpha also lacked support for PTRACE_GETREGSET(NT_PRSTATUS), causing
ptrace-based seccomp tests to fail with -EIO. Minimal GETREGSET and
SETREGSET support is added to export struct pt_regs directly.

With these changes applied, the seccomp-bpf and ptrace syscall selftests
(seccomp_bpf, extended for Alpha) pass reliably on Alpha systems.

---
Changes since v1:
 - Update features documentation for seccomp-filter/alpha
Link: https://lore.kernel.org/linux-alpha/20260205133049.526-1-linmag7@gmail.com/T/#t

Magnus Lindholm (1):
  alpha: add support for SECCOMP and SECCOMP_FILTER

 .../seccomp/seccomp-filter/arch-support.txt   |   2 +-
 arch/alpha/Kconfig                            |   2 +
 arch/alpha/include/asm/seccomp.h              |  13 ++
 arch/alpha/include/asm/syscall.h              |  90 ++++++++++++-
 arch/alpha/include/asm/thread_info.h          |  16 ++-
 arch/alpha/kernel/entry.S                     | 123 +++++++++++++++---
 arch/alpha/kernel/ptrace.c                    |  83 +++++++++++-
 7 files changed, 305 insertions(+), 24 deletions(-)
 create mode 100644 arch/alpha/include/asm/seccomp.h

-- 
2.52.0


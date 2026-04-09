Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C586C23D2B1
	for <linux-alpha@vger.kernel.org>; Thu,  9 Apr 2026 17:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775754943; cv=none; b=XTK2ewYmcVXP8c/kKOXLkNDuZyeNyNe9h8qnJp1GuA5z63Iqx7iIsT+ZgB513/EoG7lfx34hoQAzpgPPn22bRLNrOsgFuWLwtqYPE9Jv8je61jQkIQHRA3RDXz/2DYXfFTGPA2kvB/sn243XXAjTsE/T1YtrDFl3Sie9kGu+MK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775754943; c=relaxed/simple;
	bh=Zkjn7vgCoytH0xRVdzpKtp8wURsz2CsqsFkx9Lt6D0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nuuiwjTV7NVoPQo5rdzJapy34E3udrQ3nS+Bn4MjYWdnQsvJDc1PS96rstma9Qu98qgZIXlYnNuOcTFxEK/dIG0L4M07ic90Cd86JYA3ZmZ6Pk9INf9ZZ4htitGST210N2UDKUBpMF8eMzcrZGLUTcFnQDQLHVgI16oP6S8eQE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnAs6Jk/; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnAs6Jk/"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a3cee3a271so1127533e87.3
        for <linux-alpha@vger.kernel.org>; Thu, 09 Apr 2026 10:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775754940; x=1776359740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/zKxYwE5t4/t+9oXuDq1NNmMWEYpyZW9/G2jcKFXPpw=;
        b=TnAs6Jk/I1ADfJQPyWtiwm0JvNaiu02RT0jGaYixj0MPrcHj+vGQED/iXhZumua99K
         SP59mIcWr8LNlYfzEsZeM9CjJ0sMb8WUB4XyKDgFNZmiRlBQ+bEMPilgJA6MAg1PqNvx
         ZTsnPFC3xU5Ma6l/mGzPBgGtlIqcbI29H76bqN0SqsmXl7Y2dEjaFdCHm0PqxXjZVl10
         Qg9XLvi/+9KVLBtmw8NgdwKHES4+0FFVi4sv/use/L7jBnML9cCBA5bBJlxpR2TO5gch
         wgIMYxQJGHjc9PRMD+zJrsoOIEvCkeCO60Ybg9dK0ZKOShRRWMz4GRKcJxokk4VeG34q
         x8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775754940; x=1776359740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zKxYwE5t4/t+9oXuDq1NNmMWEYpyZW9/G2jcKFXPpw=;
        b=Ul+fQ6pDPfWE0uPXMfiGP+XwUEvjy4B7+FaFvFJ9MeRQZF8bEB+xlNeItTx8dsYr16
         oJDajOBIs0I4yROkNWX/2ZUahSaV+c8QzP381OaqVuRmb3i3qO1ZZnOPfxDdG/+hUcJ9
         eDOnuolYigWH77G9xaaV5lmfOa3t1u+xZugL8Pt039KHClA1qUClPggZ8ATUURoi6UJt
         kZjvhdb/f8RTmYQmXv+xxjBTMsawMnDd/+IpuxrA+LDxmnhr25NJUiHE4UaJ3GTdyFQO
         yi8fS2F9e26m7INZuSEzygw2bAk7ADuryQ63ZjjIhVBDMPEMyQ8a2jyiAYkZ7BhTYtaB
         fjlA==
X-Forwarded-Encrypted: i=1; AJvYcCXwaU+fjT1YYJOjyp8+/1EY/McqlOW5Tv1XgacFZ4ghLr9fQQDnyktHSZ/ejWxtoUbz1LUnOqwK54Odyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3+fnsJXWhqDOpxKBUnsT5gxDt0asUVwZW0A2PY3rzHuio7NNZ
	Fs1RptwpIA37sMwISkPO/2oeL7t935kjKGkvuzd24+9PMIxSnvDLX6x7
X-Gm-Gg: AeBDieuLoj+wNlybyeUyfvDEo+ysMmzfAKap5WpLbJZj85SpqDCw6r1Kz/WCS6yhe2R
	vUTE3xTbV1vO060oSM27c0Fbm8dTPJ2qDxneYgNj+blCbxY9d1c7Dt8pwD2LxpyFXtGBeBJGGeF
	nEL6cuaMp8eXEhoOmiL0qbF5uTZW5SVZgydF4t1sVLu1cnjZyuOQUK+pacwtUlJNn48oNlkecWO
	47Ty0ulgh7OiwOWVv47bPzlvrbokRB/rqgf0PWHtE9zKMqGBwX0/sSFaM7j+XUpFVPIujxQ0/9i
	ISN73o4DitM2sjAaaMGe2RDurBifwLqguRo9creY9nCYflEUmETq2iLqB9DGQpL+qY3VSTKdSIn
	GwJw4dcmdO7qon0Fd3vAWT527WtLdyV8a+tD54fPZE9mIx43pTwI1p0Au+7igqy9GdGu7C6NgW5
	aK2GcKylJ4dqF/LBPXdsJasblQl8DU9G1svU1SrUxBdh6CzlIMSIBi5dzgoCo3HURq7vt8uptI0
	G+MxKYW3S4lOpjWfOgDqWKeeyYUvx1yzUQ=
X-Received: by 2002:a05:6512:1589:b0:5a2:c4b6:3524 with SMTP id 2adb3069b0e04-5a3efd91f46mr3109e87.40.1775754939665;
        Thu, 09 Apr 2026 10:15:39 -0700 (PDT)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee1320sm36786e87.45.2026.04.09.10.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 10:15:39 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: mcree@orcon.net.nz,
	glaubitz@physik.fu-berlin.de,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v3 0/1] alpha: add support for SECCOMP and SECCOMP_FILTER
Date: Thu,  9 Apr 2026 19:10:14 +0200
Message-ID: <20260409171439.8759-1-linmag7@gmail.com>
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
---
Changes since v2:
 - Fix ptrace/strace syscall-tracing regression

Magnus Lindholm (1):
  alpha: add support for SECCOMP and SECCOMP_FILTER

 .../seccomp/seccomp-filter/arch-support.txt   |   2 +-
 arch/alpha/Kconfig                            |   2 +
 arch/alpha/include/asm/seccomp.h              |  13 ++
 arch/alpha/include/asm/syscall.h              |  90 +++++++++++++-
 arch/alpha/include/asm/thread_info.h          |  16 ++-
 arch/alpha/kernel/entry.S                     | 111 +++++++++++++++---
 arch/alpha/kernel/ptrace.c                    |  83 ++++++++++++-
 7 files changed, 293 insertions(+), 24 deletions(-)
 create mode 100644 arch/alpha/include/asm/seccomp.h

-- 
2.52.0


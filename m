Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742196;
	b=HE0AViM3c0weV3l0epYVIr4wYMCDUP8U7Luuh8qYf67weYd/7Fjif1p/a7azr6PP0kCr
	 iPmWxjqwgL8h+u4v1uxwaM5i1hHF4ntemuZJckbfQgVTfQ8QVncSpfKcTJ2ENcedjqdFY
	 uWohHBEEa1CLI6GYgFEOkevEpdryBVcWLY2+tggB4syDAchtE2+Vire0ZAr2Wt4ZiG+nl
	 qwC2D1DN3N0yLpknRy3MlySxKNYrJUqc/KfgUPrehIewVuFoM4z1qMTGzGZjwQ509bZ1G
	 v1NYOybAK2CAKM7P1LKjPQa0LRy7GrdPqM8MrKy98QtA6ddWvk4aRxBo5bfLnGgN3Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wiixacI9+OIBzgiEEn6eKWz0f2j1hW6VMWT9Hic5AQo=;
	b=fZRUhmDyq2oFBwU/uY7ngGRnqO6PContD+DjePWC+f9kZd9zjRGYEfdE3GzpNC8nwZ4I
	 QalP4uWkbRakZgKHOLP7H7iwg56vXQS/Tw2n/DOEumek2F0Vzsa3ePNHf2VkMz321KtGD
	 dsI53Amp1YNUBgPly0kzSo88BETMPCka7LPCoQ60WJ5A81sKg+QboXRMXdxD77oK2K3MY
	 H0VfRSDj8+XIeamHGvsBwEbIqnfi8AZKRcgRKJlqVxXIsrTEyWKquCFrkb4ezuVuEic2q
	 L9co2rDOm9ZL/DdwuZn1fI0MpSc4HWHhaRz+5Cfv7uIOMyBePnVjTTNtw8sp8c7GVRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQSKpPpr;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC8A606A33B
	for <linux-alpha@vger.kernel.org>; Tue,  3 Nov 2026 21:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FC8A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FQSKpPpr
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso1812977a12.1
        for <linux-alpha@vger.kernel.org>; Tue, 03 Nov 2026 13:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742195; x=1794346995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wiixacI9+OIBzgiEEn6eKWz0f2j1hW6VMWT9Hic5AQo=;
        b=FQSKpPprvEMgZOOhUwG4A8mNt7T8IA3bh9a/h2e9b4PmWfSRZ3cM+us2pjyqaahOG0
         Ywdz4gayJ9EjYXZF4En96C9RLaYXV0MAZvK0B8D0mVT1hoEze6ClqEuHkEIdmubu+/SD
         Q9ZXz0ooOaDkVjj/SFmG87ovZ1PEDGqPIJ24Kd50nT0c3Mfv+lIW9gpa457oJDhGhfGC
         TpgaXbrwBl5RZLpONNJ+JW5QJpWzhKbDB4KPpuvWgJ7wJaO8Qw8TQ/toRmlLVDtvqOqv
         xXTSqDljfdrt/4kO5xYaGGLZwhVh9/HGyAdp5mQ6mTOJOuoHBlysQJHsjuxXW2f+AK2A
         e3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742195; x=1794346995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wiixacI9+OIBzgiEEn6eKWz0f2j1hW6VMWT9Hic5AQo=;
        b=RuT1dBCWgo8wJ+V5+TPQJCsU1Ph3ej6udtxWGlBwi/+GysW6Q+AFZWGiX7yWXWKPWn
         D+z8t5CGLP1USP3ZegpDK0w08HB207pUffCoHM7TpHL8L0vq85FqKO/FHE9XPuyLOcDN
         /7l2CcTI9PD00h+NDeUqmPrjJCSNgKp/fxsY3SakeKwd44tR/ui3wjewcE4N0KOLipXZ
         z5tYBNzZCUuqM2y9BZFlVU9MjK6mbz+HTg1PKvvyZNNCUIJOQZ48Jhttk2xNCtWtsx/j
         BUMb8cUWajEIjd/38x0OLjQ25iNqFkbZBRVhrimBiwbY3+PqQ7n1vYuNcQWqeV33Ztfs
         6XUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmk2HZDSEH9ZAAUzsPbvuNL4Bm0kJzjzphdfgltI+fnVXeCMyw8bwr6tNhf0O0zDlpXg6HkDJbDC1+EA==@vger.kernel.org
X-Gm-Message-State: APuU4Z//T4DvMMvPb9RCfOwBqH6dIvEyaMbwVOyN76rxqf5yynlXCZKI
	+Ga/tkxhOjPfD+3n7PCIt0tfKNsdsLKz5E2hDP+0GBu7kz0RVOAGx0+CZNzp7n2HcWk=
X-Gm-Gg: AYBFou0JoJBdmKqnpl591aDURhmW/g1wpPNn/n2ZcJPtkyiaMAQM0fwKRdxAz2JhQXy
	RZnkRynJu2tEstcLe263xlWeByqHI+VJK0HfsjVM2nqDqFR4EVEiKDE8mzQAztQd9o/m5hg6AJi
	G9VR6DRwCs6zUtSsIKxnBbNeEVvraXzF+/5jV9enIvPeoBkEa0vWAcnzmt+5qmzwS1iy0Qah9gj
	oHtCqRNgm3vjtt6Gnu/h87NqG019fnKeIgCuf5Eskgrf49UACga2xTvCHA/vcOxAgD34D5x3sFZ
	fIccVhbr19EK3nW9G5pEv91SP1c4HZj5PtmqV0zfw/5HldvnYivN+2hGfdcTSdkQTTEz0kGDjso
	Ufp/2evYoOiO7U5VqJpuQH1fKEO4wm6xwqkiArvZXqJMLpHxaNVXrF4fg5Js+p4CT+9Oba8VK5v
	xe7E/MZUn3/HaFIyXDpa0cj3asuBXkSNUuZJxlJ8CBjUioAFeyCGDGM7qDGd6cO3dIYNunlsuUm
	jQ8QlwwoIAjx/S6E4XIH+MxbjuDGS2Xc8we8pPEFtypcRDAaaGNOs0cTKFi0nDeFnOYjh9he7dS
	VLgr7A0bh93vqnMLSoOmyxHIFDPpeThlWFlco4a7A2QB9EnK8Ztx0b1zjmSdSKXhJMT/7ns=
X-Received: by 2002:aa7:c418:0:b0:6ae:16f5:5be9 with SMTP id 4fb4d7f45d1cf-6b4d4c78d8fmr7236202a12.7.1793742194559;
        Tue, 03 Nov 2026 13:43:14 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac5a2a6sm40550a12.16.2026.11.03.13.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:43:13 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 02/14] alpha: report syscall errors correctly to audit
Date: Tue,  3 Nov 2026 22:35:08 +0100
Message-ID: <20261103214120.1099893-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103214120.1099893-1-linmag7@gmail.com>
References: <20261103214120.1099893-1-linmag7@gmail.com>
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

Use a3 to distinguish errors from successful return values and negate
error codes for audit. Failed syscalls otherwise appear successful with
a positive errno. Keep raw r0 for kernel-mode frames.

Fixes: a9302e843944 ("alpha: Enable system-call auditing support.")
Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/ptrace.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptrace.h
index 45d1229344b6f848eb930917bf50ba759da99beb..c933c8805eedd91e3845bb4b46588974258398c2 100644
--- a/arch/alpha/include/asm/ptrace.h
+++ b/arch/alpha/include/asm/ptrace.h
@@ -21,9 +21,18 @@
 	(current_thread_info()->syscall_meta \
 	|= ALPHA_SYSCALL_META_FORCE_SUCCESS)
 
-static inline unsigned long regs_return_value(struct pt_regs *regs)
+#define is_syscall_success is_syscall_success
+static inline int is_syscall_success(struct pt_regs *regs)
 {
-	return regs->r0;
+	return !regs->r19;
+}
+
+static inline long regs_return_value(struct pt_regs *regs)
+{
+	/* For user-mode registers, a3 is an error flag only at syscall exit. */
+	if (is_syscall_success(regs) || !user_mode(regs))
+		return regs->r0;
+	return -regs->r0;
 }
 
 unsigned long user_stack_pointer(struct pt_regs *regs);
-- 
2.43.0


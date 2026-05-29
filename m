Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61983EA96F
	for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064630; cv=none; b=rPUqQo2KkZQHU/ASyKUc1ozLoo2JHW8VPzUGeapNpkAvAueS07yXkH5BHytBXjszJYha1oNEuUdO+fJfqQU/lKJuPIi5EWDVq8HFAR4oaKC43vdvl+Jnd7TO2BCz0SyfOm0mcyoaaVxEgEv9yv99E4zhl3UNAcX+sOfvE96jbqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064630; c=relaxed/simple;
	bh=D04sp6jy24qV/d7jpV7qcj/FJRHhYaGlTiewOrERXrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=THqVHcGSODVspHBBk+A099jAqdLwXgE8133juqKKt8Rb6W95J/RH9OL73ufuloy3YCGWP46kXFFnw1KQw7+6tzhZwYQOqBobIvuLbjjPMVU0fdl92A71iEHAhvtuSctLha2Xgyf/bLkJTme61ulAhEMdf6p8vv6mzDvsI3i+gUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ny9JX6Uz; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ny9JX6Uz"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a887ebb416so17486416e87.2
        for <linux-alpha@vger.kernel.org>; Fri, 29 May 2026 07:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780064627; x=1780669427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byIacLsO8qy3Mf9mbTJig4sdcp2UMDCGsxpnJNNgpcs=;
        b=Ny9JX6UzDxEKzGlFDMT3WF5Hm1Z7IaMlxOOaew61Dj6t1o5mnLoDDgWIo50wn47I9C
         imzaJmuwMYB5ugRUIv+ewcjzGW6exuflZXjp0YUJdGscAa3TzNsNnbC1XkAz4QsGejCl
         QBj+aFlZDUEVgeBpgcUV6Ctob/oc6yErVsBr41aXWnv0ehjkqhXYmY68ljI4YQ/8ufAg
         UIPTXtvHsC5LS1pyx0UQ0AA2txr2mbHHDJPi/MpCvSbl/WIlwTLKYeGmuLCr4th3Ccyw
         OLhZKJhEXdNYyn/e9QEnmbN96WK81UW4k/zZUy9YGJgmKYfyZfAc9EMaG8JC2YTQisLJ
         b8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780064627; x=1780669427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=byIacLsO8qy3Mf9mbTJig4sdcp2UMDCGsxpnJNNgpcs=;
        b=eroKbisMdJPVo5DIQxuJHD4RkLSWRxD8kZHpkfKXtQb3xJ5oFZ0ZlPxjaXDinChToi
         mOW0DPLDxDgreWoVi8qBjr1J3YVQ813hA+DeVKQbuTG/6aHlkHmr/jFPyg1Vv3A832T1
         +2hkiTFEnILuwhXaSTTxBZhtk12BuhnXEgEAbuqCi+VzeJWwrH38Ao4HuoRDv4KkDdGy
         krjUutDa0WBhRJnlJ7BdmskyFvgWntwB3/BTDqmpC1AOhLSykP4TIv7aas+4bFPT4Rl1
         jbhpS4ZF8dibRHqJhPMFNbyNOyHd7idY4KqZUKLUc8nuqi0nxMIdslQZJdpJuPdi/MBs
         ObPw==
X-Forwarded-Encrypted: i=1; AFNElJ938amAypXpl8bNa1IH+YA+Mg1wpYm4r50G1ke5nxaKuF7u5plT011F4WZriRukS+Y8idkquntpzGMjkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJOHLwu239rTw3ZAAzD6kONsa6cXCv79iQNw4d28P5RC7cfX25
	RE6DvLJgICRvrXfhdsqUFJx0g8Rsw5bP3Quj9V4yAw+PB47fTz/1L8E5
X-Gm-Gg: Acq92OHFk81ZgEqDelDEWLwQfehTrA+j6pjBux8dKuSFSR85LhzYVcupIVHfUX8nk6t
	8Vnju9UNOIyjyOXoxiEuXnQPyzeei7MXwpqMhnPvYsCf2+/zcf8os6OB0BU3TGwk6I3oyy5dCUX
	Oy2WHeWt6Ra1j19s6+hXPiSs6pkxnV12TCT3o0PwJjJHj3Ge1utMD/YG2zrPTLeHB83KmLvZROv
	yawKn+cDCy+0MvB0iCeBkQybtDFNUVMn/FCvq6vTJcaUSv64PR7KCZlj/n24/GzbtsomC7DBpfw
	v4me+JUAPY0FVcN5f7YQnZ2ERwhCHHE9z/Gapof04JOQ49VeSNHsTCf0IsrgHTCyrg8ciODbK4S
	SJM+NhD4nC6xsssZn+bkTZqd8XGS6oNBSBcOZzYSdie5NTDnvd1cH/hjtTnID4zK3VBs9wtHyeM
	R0+CnWnO5qzDeRuqunywplzj/t1SPuCJegNDfn9akJ4aTm+CfWP8K9cJSOu55ZSG1MqdSvq1/87
	4i9/dBcBcAPgYcGX3LueQK2URdFzgF+dPC2BzPeV2OdSQ==
X-Received: by 2002:a05:6512:66c1:20b0:5a8:8de0:4570 with SMTP id 2adb3069b0e04-5aa60923467mr1659e87.21.1780064627174;
        Fri, 29 May 2026 07:23:47 -0700 (PDT)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b0687e2sm310433e87.6.2026.05.29.07.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:23:46 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: glaubitz@physik.fu-berlin.de,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	macro@orcam.me.uk,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v2 5/8] alpha: provide ftrace return address support for lockdep
Date: Fri, 29 May 2026 16:22:01 +0200
Message-ID: <20260529142322.1362438-6-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142322.1362438-1-linmag7@gmail.com>
References: <20260529142322.1362438-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lockdep uses ftrace_return_address() to report useful call sites for
lock acquisition and IRQ-state tracking diagnostics. Provide the Alpha
architecture hook using the compiler return-address builtin when frame
pointers are available.

Return zero when frame pointers are disabled, matching the existing
fallback behavior of architectures that cannot provide a reliable return
address.

This is a preparatory change for enabling lockdep support on Alpha.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/ftrace.h | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/ftrace.h b/arch/alpha/include/asm/ftrace.h
index 40a8c178f10d..7ec44134c804 100644
--- a/arch/alpha/include/asm/ftrace.h
+++ b/arch/alpha/include/asm/ftrace.h
@@ -1 +1,29 @@
-/* empty */
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ALPHA_FTRACE_H
+#define _ASM_ALPHA_FTRACE_H
+
+#ifdef CONFIG_FRAME_POINTER
+
+static void *alpha_ftrace_return_address0(void)
+	noinline notrace;
+static void *alpha_ftrace_return_address0(void)
+{
+	return __builtin_return_address(0);
+}
+
+#define ftrace_return_address0 alpha_ftrace_return_address0()
+
+/*
+ * __builtin_return_address() requires a constant integer argument.
+ * Keep this as a macro so the value is seen at the callsite.
+ */
+#define ftrace_return_address(n) __builtin_return_address(n)
+
+#else  /* !CONFIG_FRAME_POINTER */
+
+#define ftrace_return_address0 0UL
+#define ftrace_return_address(n) ((void)(n), 0UL)
+
+#endif /* CONFIG_FRAME_POINTER */
+
+#endif /* _ASM_ALPHA_FTRACE_H */
-- 
2.53.0


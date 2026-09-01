Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABF948097E
	for <linux-alpha@vger.kernel.org>; Tue,  1 Sep 2026 15:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277914; cv=none; b=HF3hWpnqOXx2suM4GQrV+1HS1iMQlzb7f5CEkGBEgg2FrjkkXpdVXjJNeWIkHdt1p8m0Hz29zwaAF1wE57k/s08Ts+IRzjJEeWZwaqqg/oDwRMO6xD/iAOSFYEgWxenrtOWMwEyVT01Fp5fg1B3njmh5u8UsIiC6Iee/vO9QTdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277914; c=relaxed/simple;
	bh=+zyEx7CnET8RPTk3yEdOYr1qBjUYYA5CWcwQgpzuWHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=phIZiA4VY4tABr/EEjAy5gDgOZGB2/PNIQe0JJbtqc6Ury5OzNyCVCcPg7NUNX2T1ELZ90gC97t4KtMBBx9VobWzNlrld9mHX9qS2oQL/K6DkhEdIIC8+E3mnUZumVsaoAxVh/iuAZrDyCiEukDmTj5NccTrABPf4kqqHcM6SgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbDTQb9p; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbDTQb9p"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-836cb2fa1bcso1278517b3.1
        for <linux-alpha@vger.kernel.org>; Tue, 01 Sep 2026 08:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277912; x=1788882712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0fFeQGFTVZ0poennwJh9YRhQWX5ve6C9RcwLYcgRc6M=;
        b=gbDTQb9pKSqsWZ5v4/L9z/XlWgOC1HJMmEGk/r1x7Dn0M/I5iz1UKNUCTQAuBJR9AU
         IDk59KBzz+hmopaH1ilCv7kaulwkCjWfcEAxhCm8kRDZnqTmSzfI5Z7yDk+X732oh9so
         w89LygXDMLne314apmDCxRF/V/TNfbhumcgEx+daAMx+46uvZu5l8qeno3M4z4Z7kaQs
         ec3lqxUrYO+vlAhTCE9JRCioV6N/tnrX6UlYjUPa+EnY5+TGPWMkcDVH1OoL91GCuTJ+
         Jxo7MgeS06V7HkPAnYQ0q/c/Km5V/qH6VyCjtsnlmUrg2uX+EKshPrODHHH7txWmaI8e
         JHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277912; x=1788882712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0fFeQGFTVZ0poennwJh9YRhQWX5ve6C9RcwLYcgRc6M=;
        b=mQhZ7YcGkGB33z37kAf5j+f+Lqdoajf9//viSUOaLSdehfl5E8FIqLHAYL1Wnt18Fs
         wPxrz47zSOWkdrmlK2ur1gj10zHPtIQ9Ispj0rendC07k67GNi4nvH5AY1+ikpUKDw5o
         P4jxd3qNjx2x+4yFcaqPGxfreBw/qG/qbziu3vHFkjFUIWq+HxON6eZvAXkxaOVaCilg
         I6vxMl1voExEnwBxhWGUwHnTnEqXjuNce+6QU2xfJn/N8472Dx6k2lr5fPTAeHA8SPTB
         5KlE29eINWiuEEZ1bMdiLBnyTI6hjC+g+ghOt/UNVPCYst2F9+WMOvFydoGwH7LyxRgK
         VL+Q==
X-Gm-Message-State: AFuF++lawKbQtbOAuc044gJrnj4N0c1PdbGu5PvvNRXcl7f+4TKcPW87
	qw1kac6fONME7px2EqG36VrDCLOGk7vGMCteue8pD+cS/jk/Nl7waX8PylCSlA==
X-Gm-Gg: AYBFou30VPyYxW64U9/EslBJG0Lxqj5GKZuOSoVDnXGWyNkGPksJV93uZ3SojvGTynF
	MDwL7uRN4wc/48dnmGaw6Euvdr1dv0gyl3JuwsSVvCAnmkKvHtnatyP8XDDdVUK2ynC7i9gIrIr
	bgDJaKqjj4gyBLz/wKHBudDDxgMjrLq62nrnzIeeC3c2ATfBeezZpczrvklm2jTjjbYo3iWx1vK
	FJWZresBw4U2xonVZcSGNc6lVK8LHtVQBb1C+ZgvnlcHafoY8LXpm835qC9fmg+yy8yXINIR2u0
	/ou5BIYp5B4UZsi+WetYQClVWFevxyb9KXSOJrcwfq8hkQcqymMax9xFJSPdcHKJvr6+YwiO53n
	weXWQfpDijqwW5UqoDJtYgzciW9NNUKGZyD6xhH9331gJgfq5wh9NaoZT7w5Xm/6XCqUxbTGFJy
	0GmSqrARPXoTSS9ZKnDt0+vL4Ry4dsXLjp3f8b6sx+MQAwoeqphDCs0wyBBA72wCGncha2QZ6nW
	mnkZv6OmjhQ5WmCAezFMgMHj0Qq7fRVWiH+vzQ1
X-Received: by 2002:a53:c68d:0:b0:66e:4c9a:b52b with SMTP id 956f58d0204a3-66e4c9abe63mr8002182d50.33.1788277912044;
        Tue, 01 Sep 2026 08:51:52 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4eb3de54sm8632592d50.1.2026.09.01.08.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:50 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 20/24] alpha: select ARCH_WANT_LD_ORPHAN_WARN
Date: Tue,  1 Sep 2026 11:50:33 -0400
Message-ID: <56f601c91463c7ebaa3aa0d0a5f7aef0f876bd7b.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With .eh_frame and the relocation sections now placed explicitly, an
Alpha kernel links with no orphan sections left, so ask the linker to
warn if new ones appear.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 4c60c442207c..827b224f2f8a 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -38,6 +38,7 @@ config ALPHA
 	select AUTO_IRQ_AFFINITY if SMP
 	select GENERIC_IRQ_SHOW
 	select ARCH_WANT_IPC_PARSE_VERSION
+	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select AUDIT_ARCH
 	select EDAC_SUPPORT
-- 
2.54.0


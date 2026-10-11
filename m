Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6203468C17
	for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 20:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791749819; cv=none; b=K5pUMNHtpk5xplCYLRdm6jL5Ydx9CdglCz2Y2+ocR9cmjMHTet/td5oBwhmaEcIQl1u0Z2kPTP1uDfjNwxtQxQawo2sYu4tROkxeqSQjAtKslNW1yj/QrCH2st58ZLqTq2Om39KSvjg2xceDOq+UybXozstT2JFA7ur6NJZIE3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791749819; c=relaxed/simple;
	bh=EK/AHmbH1n+ZAeHspiEn4hLS0GOcVytyzjbFj3NwaoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tFK0OTNgKsD+Ave1xzGIGsx1PHEZ2vkJCTmYedrHb5p+HS9vc8MgPwovDngp5WgAKEAuOhxRHsPXNeDxLdtsWe+D1SGOF1wZAUClP8k9Mqc9+UyMoZNUmOOut2fX9aZi1DS25cJu2WghByJXAFLTAhFj3XALD+INCIhjeQNNalc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPC+t28l; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPC+t28l"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-677bc4704cbso936282d50.0
        for <linux-alpha@vger.kernel.org>; Sun, 11 Oct 2026 13:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791749815; x=1792354615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDGl5tBxqOySAH/1T+QSowfg3OeZNJKzvcjJapnD0fA=;
        b=iPC+t28lknvSbybHRaYhiojnh1vHxRe9RlhN81mUnSnhFXY1y/u9/VGuNdcCytG4sN
         yu++I2OupkUeHtgnykNoysE9JWxxBdeZOe9SisaiGjRaPvPhA5ANCzvVdt8eh4Z72vHB
         0jS3nHINfBqTRPWepnioO0fZDedx+/9AkgI8D5LeTXmAkzsg6axVVG6LxhBsjGQcv2Ad
         5NFbqzAeJqxfBbK7cyxg0HL5+GziK+cSF8mcIwaJUey+bln5u00TddlMdpfkcS+ka19L
         20WewqphX1EM2aOk+4QxGIl4dzkZVCMLA0/dq+gGivKuAYvISitV3YU1ntMDzJVC9lZZ
         O2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791749815; x=1792354615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QDGl5tBxqOySAH/1T+QSowfg3OeZNJKzvcjJapnD0fA=;
        b=U82+HnnOmb0Zq2CEE9x8YVEu7FodBH1Qivb9d2jSdTf+O+uBKT8UW7Tzh1geAG3udr
         b1JpacUj06f0baM0IgvmXkM9UGJM3UCqzisc6XNJI6Ao4M9nsk57ICm3eOcpbG9Y4Osq
         GAUpxdBefpiiwjKks+3LiOrdKgKVULIbUUn6CPWhIcyrpTM5BcybzEz8p7xVRAzwFnSc
         J/H1Ie1BQujPNaLSeP3XA1mjpAf+diAkFpWi2TvtsuGfy/NbZmzhP9OH0Kzd+NvaNlWc
         iJ/NyaxmyIZsRGlCmOs0ouhFADV3ONQ0wSVwaFUkZ9JK3PVfNW17SioJ8JvAgnc1radJ
         eeGA==
X-Gm-Message-State: AFq9FYIwFgzpD6D99MIZdRY4uo11YHhtU9RQAl8iloSD0Ilt+fB/u6X6
	d8o9b2NhkqhOGDi2VZW8IBSJC18EIdjHbX3hP5milruqgP7U329VXSvb
X-Gm-Gg: AYBFou1P/kFSFxAcnG73Ahj3sBLIBSV1gmanX+EBdGHexZMgptG4oNeIROGNGeXwFY9
	3oQs8RRFEEkD52VxJhO0U1AcnLQtFBsbnTuvsEMt83RRTlym3QBmf8BlCdVvKDyRir4Dvh3FV/B
	mZBO4kaprn/su67AiLAMg7UmwXQIvWD69M4POoLsBvkW7IJL41wcZpv6JtE1TsCaFMF7L22YMT1
	AeiWupe2SSIsKjpIwVE/W+drNSA/TyIaH12iK25acVe710xAmrnEFZggPcCi4Ti/gAXxeSBwYNS
	DPzahguAY+kne/cDrSgOHJFXbepwZXWjzQfKRyGTqkJ0JAYH0OzFjd4TpNqW11O6hAoWv77MOZ5
	EHDKkyWELKUnYz1BpMIsAyX/d9kAgKBAH1UvWQx9STfbPpr0+YOQOX9MUF+2Hpmn54yV7SDIDhm
	f1YClDN2yRyaSO/ErnvkSkTLONhw/LIEnAGIi/UE6nscqpvJqJz+6mSHYqIs3w6XhlPEvKoDSY8
	Em7aD15xzbBjsAk1DyxzDr6nRqn48bt8UjWmUcJjSLZls8TpZDrICGX
X-Received: by 2002:a05:690e:14c1:b0:675:40a6:142c with SMTP id 956f58d0204a3-67935f1c770mr2510955d50.22.1791749814894;
        Sun, 11 Oct 2026 13:16:54 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679356ffbecsm2995049d50.23.2026.10.11.13.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:16:51 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 11 Oct 2026 16:16:43 -0400
Subject: [PATCH 3/4] alpha: use user_stack_pointer() in KSTK_ESP() and
 dump_elf_thread()
Precedence: bulk
X-Mailing-List: linux-alpha@vger.kernel.org
List-Id: <linux-alpha.vger.kernel.org>
List-Subscribe: <mailto:linux-alpha+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-alpha+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-alpha-perf-regs-v3-v1-3-eaa625a39712@gmail.com>
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=EK/AHmbH1n+ZAeHspiEn4hLS0GOcVytyzjbFj3NwaoY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJOv1slrzqtPdz4pVV3ZCSTN2vLQi/23yz2efO+50UGW
 emsPfu94yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK5JaGD4X68+m2dhze
 Ffk+RmJ/evOFBn7f/2mPOxd3MNwrc8qZy1LJ7hr8wLI+O81eF552fzcfNsPtvFIXbu+7NbF9Qvf
 Ba+2MEhwAgA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Both open-code the same PCB lookup.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/processor.h | 3 +--
 arch/alpha/kernel/process.c        | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/processor.h b/arch/alpha/include/asm/processor.h
index c461a26d47b3..73251cd671e0 100644
--- a/arch/alpha/include/asm/processor.h
+++ b/arch/alpha/include/asm/processor.h
@@ -43,8 +43,7 @@ unsigned long __get_wchan(struct task_struct *p);
 
 #define KSTK_EIP(tsk) (task_pt_regs(tsk)->pc)
 
-#define KSTK_ESP(tsk) \
-  ((tsk) == current ? rdusp() : task_thread_info(tsk)->pcb.usp)
+#define KSTK_ESP(tsk) user_stack_pointer(task_pt_regs(tsk))
 
 #define cpu_relax()	barrier()
 
diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 06522451f018..7861c9e767b7 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -318,7 +318,7 @@ dump_elf_thread(elf_greg_t *dest, struct pt_regs *pt, struct thread_info *ti)
 	dest[27] = pt->r27;
 	dest[28] = pt->r28;
 	dest[29] = pt->gp;
-	dest[30] = ti == current_thread_info() ? rdusp() : ti->pcb.usp;
+	dest[30] = user_stack_pointer(pt);
 	dest[31] = pt->pc;
 
 	/* Once upon a time this was the PS value.  Which is stupid

-- 
2.55.0

